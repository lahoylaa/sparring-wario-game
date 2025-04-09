----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2025 02:30:00 PM
-- Design Name: VGA to HDMI Converter
-- Module Name: VGA_To_HDMI - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--   This is the top-level module for the VGA to HDMI conversion system. It integrates
--   multiple components, including the VGA controller, character generator, pixel driver,
--   and HDMI transmitter. The module also incorporates button debouncing to ensure stable
--   user input handling. 
-- 
-- Dependencies: 
--   - Requires a stable 100MHz clock input.
--   - Includes external character generator and VGA controller components.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--   - This file serves as the top-level design, connecting all submodules together.
-- 
----------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity VGA_To_HDMI is
  port (clk_100MHz, reset      : in  STD_LOGIC;
        btn                    : in  STD_LOGIC;
        audio_left, audio_right : out std_logic;
        HDMI_clk_p, HDMI_clk_n : out STD_LOGIC;
        HDMI_tx_p, HDMI_tx_n   : out STD_LOGIC_VECTOR(2 downto 0));
end entity;

architecture Behavioral of VGA_To_HDMI is
  -------------------------------------------------------------------
  component clk_wiz_0
    port (clk_in1, reset : in std_logic; clk_out1, clk_out2, locked : out std_logic);
  end component;

  component vga_controller_640_60 is
    port (rst, pixel_clk : in  std_logic;
          HS, VS, blank  : out std_logic;
          hcount, vcount : out std_logic_vector(10 downto 0));
  end component;

  component MY_PIXEL_DRIVER is
    port (clk, rst, btn_in, pixel_clk, V_S               : in  std_logic;
          hcount, vcount                                 : in  STD_LOGIC_VECTOR(10 downto 0);
          blank                                          : in  STD_LOGIC;
          char_enable                                    : in  std_logic;
          char_data                                      : in  std_logic_vector(11 downto 0);
          R3, R2, R1, R0, G3, G2, G1, G0, B3, B2, B1, B0 : out STD_LOGIC);
  end component;

  -- Char Generator for Text
  component CHAR_GEN is
    port (clk25, blank   : in  STD_LOGIC;
          hcount, vcount : in  STD_LOGIC_VECTOR(10 downto 0);
          char_enable    : out std_logic;
          char_data      : out std_logic_vector(11 downto 0));
  end component;

  -- Audio Playback
  component audio_playback is
    port (
      clk                     : in  std_logic;
      reset                   : in  std_logic;
      audio_left, audio_right : out std_logic
    );
  end component;

  component hdmi_tx_0
    port (
      pix_clk        : in  STD_LOGIC;
      pix_clkx5      : in  STD_LOGIC;
      pix_clk_locked : in  STD_LOGIC;
      rst            : in  STD_LOGIC;
      red            : in  STD_LOGIC_VECTOR(3 downto 0);
      green          : in  STD_LOGIC_VECTOR(3 downto 0);
      blue           : in  STD_LOGIC_VECTOR(3 downto 0);
      hsync          : in  STD_LOGIC;
      vsync          : in  STD_LOGIC;
      vde            : in  STD_LOGIC;
      aux0_din       : in  STD_LOGIC_VECTOR(3 downto 0);
      aux1_din       : in  STD_LOGIC_VECTOR(3 downto 0);
      aux2_din       : in  STD_LOGIC_VECTOR(3 downto 0);
      ade            : in  STD_LOGIC;
      TMDS_CLK_P     : out STD_LOGIC;
      TMDS_CLK_N     : out STD_LOGIC;
      TMDS_DATA_P    : out STD_LOGIC_VECTOR(2 downto 0);
      TMDS_DATA_N    : out STD_LOGIC_VECTOR(2 downto 0)
    );
  end component;
  -- --------------------------------------------------------------------
  signal CLK_25MHz, CLK_125MHz, blank, locked : STD_LOGIC;
  signal hcount, vcount                       : STD_LOGIC_VECTOR(10 downto 0);
  signal HSYNC, VSYNC                         : STD_LOGIC;
  signal RED3, RED2, RED1, RED0               : STD_LOGIC;
  signal GREEN3, GREEN2, GREEN1, GREEN0       : STD_LOGIC;
  signal BLUE3, BLUE2, BLUE1, BLUE0           : STD_LOGIC;
  signal vde                                  : STD_LOGIC;
  signal RED, GREEN, BLUE                     : STD_LOGIC_VECTOR(3 downto 0);

  -- Button signals
  signal clk_btn_signal : std_logic := '0';
  signal btn_signal     : std_logic := '0';

  --signal ASCII_CHAR             : STD_LOGIC_VECTOR(7 downto 0);
  signal char_data                          : std_logic_vector(11 downto 0);
  signal char_enable                        : std_logic;
  -- signal ASCII_CHAR, CHAR_2, CHAR_3, CHAR_4 : std_logic_vector(6 downto 0);

  -- Audio Signals
  -- signal audio_left, audio_right : std_logic;

begin
  -- ------ Cannot pass these directly during instantiation ------
  vde   <= not blank;
  RED   <= (RED3 & RED2 & RED1 & RED0);
  GREEN <= (GREEN3 & GREEN2 & GREEN1 & GREEN0);
  BLUE  <= (BLUE3 & BLUE2 & BLUE1 & BLUE0);
  -- --------------------------------------------------------------
  button_clock: entity work.clk_divide_125Hz
    port map (
      clk    => clk_100MHz,
      reset  => reset,
      clkout => clk_btn_signal
    );

  debouncer: entity work.debouncer
    port map (
      btn_in  => btn,
      clk     => clk_btn_signal,
      reset   => reset,
      btn_out => btn_signal
    );
  -------------------------------------------------------------------
  -- DONT CHANGE THIS!!!!!!!!!!!!!!!!    
  C1: clk_wiz_0
    port map (
      clk_out1 => CLK_25MHz,
      clk_out2 => CLK_125MHz,
      reset    => reset,
      locked   => locked,
      clk_in1  => clk_100MHz
    );

  -- DONT CHANGE THIS!!!!!!!!!!!!!!!!    
  V1: vga_controller_640_60
    port map (
      pixel_clk => CLK_25MHz,
      rst       => reset,
      HS        => HSYNC,
      VS        => VSYNC,
      blank     => blank,
      hcount    => hcount,
      vcount    => vcount
    );

  G1: CHAR_GEN
    port map (
      clk25       => CLK_25MHz,
      blank       => blank,
      hcount      => hcount,
      vcount      => vcount,
      char_enable => char_enable,
      char_data   => char_data
    );

  A1: audio_playback
    port map (
      clk         => clk_100MHz,
      reset       => reset,
      audio_left  => audio_left,
      audio_right => audio_right
    );

  M1: MY_PIXEL_DRIVER
    port map (
      clk         => clk_100MHz,
      rst         => reset,
      pixel_clk   => CLK_25MHz,
      V_S         => VSYNC,
      btn_in      => btn_signal,
      hcount      => hcount,
      vcount      => vcount,
      blank       => blank,
      char_enable => char_enable,
      char_data   => char_data,
      R3          => RED3,
      R2          => RED2,
      R1          => RED1,
      R0          => RED0,
      G3          => GREEN3,
      G2          => GREEN2,
      G1          => GREEN1,
      G0          => GREEN0,
      B3          => BLUE3,
      B2          => BLUE2,
      B1          => BLUE1,
      B0          => BLUE0
    );

  -- DONT CHANGE THIS!!!!!!!!!!!!!!!!            
  H1: hdmi_tx_0
    port map (
      pix_clk        => CLK_25MHz,
      pix_clkx5      => CLK_125MHz,
      pix_clk_locked => locked,
      rst            => reset,
      red            => RED,
      green          => GREEN,
      blue           => BLUE,
      hsync          => HSYNC,
      vsync          => VSYNC,
      vde            => vde,
      aux0_din       => X"0",
      aux1_din       => X"0",
      aux2_din       => X"0",
      ade            => '0',
      TMDS_CLK_P     => HDMI_clk_p,
      TMDS_CLK_N     => HDMI_clk_n,
      TMDS_DATA_P    => HDMI_tx_p,
      TMDS_DATA_N    => HDMI_tx_n
    );

end architecture;
