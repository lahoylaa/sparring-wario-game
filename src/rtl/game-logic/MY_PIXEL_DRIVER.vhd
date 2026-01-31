----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Aeron Lahoylahoy
-- 
-- Create Date: 03/17/2025 02:30:00 PM
-- Design Name: Pixel Driver
-- Module Name: MY_PIXEL_DRIVER - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--   This module serves as the pixel driver for a game implemented 
--   on an FPGA. It controls the rendering of background, chain, 
--   Wario sprite, and character display on a 640x480 VGA display.
--   The system processes animation timing, hit detection, and state 
--   transitions for gameplay mechanics.
-- 
-- Dependencies: 
--   - Requires a stable 100MHz clock input.
--   - Includes external background, chain, and Wario rendering components.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--   - This file integrates multiple components to manage pixel rendering.
-- 
----------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

entity MY_PIXEL_DRIVER is
  port (clk, rst, btn_in                               : in  std_logic;
        pixel_clk                                      : in  std_logic;
        V_S                                            : in  std_logic;
        hcount, vcount                                 : in  STD_LOGIC_VECTOR(10 downto 0);
        blank                                          : in  STD_LOGIC;
        char_enable                                    : in  std_logic;
        char_data                                      : in  std_logic_vector(11 downto 0);
        R3, R2, R1, R0, G3, G2, G1, G0, B3, B2, B1, B0 : out STD_LOGIC
       );
end entity;

architecture Behavioral of MY_PIXEL_DRIVER is

  ------------Signals--------------------------
  -- Pixel Data BG, CHAIN, WARIO
  signal bg_data    : std_logic_vector(11 downto 0) := "000000000000";
  signal chain_data : std_logic_vector(15 downto 0) := "0000000000000000";
  signal wario_data : std_logic_vector(15 downto 0) := "0000000000000000";

  signal alpha_chain : std_logic_vector(3 downto 0) := "0000";
  signal alpha_wario : std_logic_vector(3 downto 0) := "0000";

  -- Extra credit?
  signal game_won_count : integer range 0 to 10 := 0;

  -- Enable drawing
  signal chain_enable, wario_enable, ball_enable : std_logic := '0';

  -- Wario Animation signals
  constant CORDW : integer := 16;
  signal sprx : signed(CORDW - 1 downto 0) := to_signed(160, CORDW); -- Sprite X position
  signal spry : signed(CORDW - 1 downto 0) := to_signed(290, CORDW); -- Sprite Y position

  -- Ball Position Signals
  signal ball_x, ball_y : signed(CORDW - 1 downto 0);

  signal frame_counter : integer range 0 to 30 := 0;

  signal clk_60fps : std_logic                 := '0';
  signal counter   : integer range 0 to 416666 := 0;

  -- Testing signals
  signal current_state, next_state : std_logic_vector(2 downto 0) := "000";

  signal hit_detected        : std_logic                   := '0';
  signal punch_active        : std_logic                   := '0';
  signal in_range            : std_logic                   := '0';
  signal punch_delay_counter : integer range 0 to 25000000 := 0;
  signal hit_counter_signal  : integer range 0 to 7        := 0;

  signal init_delay            : integer range 0 to 30 := 0;
  signal init_delay_flag       : std_logic             := '0';
  signal super_move_delay      : integer range 0 to 30 := 0;
  signal super_move_delay_flag : std_logic             := '0';

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ------------Components-----------------------
  component draw_background is
    port (
      pixel_clk_signal, rst : in  std_logic;
      hcount, vcount        : in  std_logic_vector(10 downto 0);
      blank                 : in  std_logic;
      vsync                 : in  std_logic;
      animation             : in  std_logic_vector(2 downto 0);
      pixel_data            : out std_logic_vector(11 downto 0)
    );
  end component;

  component draw_chain is
    port (
      pixel_clk_signal, rst : in  std_logic;
      v_sync                : in  std_logic;
      blank                 : in  std_logic;
      sx, sy                : in  signed(15 downto 0);
      animation             : in  std_logic_vector(2 downto 0);
      hit_counter           : in  integer range 0 to 7;
      bx, by                : out signed(15 downto 0);
      pix                   : out std_logic_vector(15 downto 0);
      drawing               : out std_logic
    );
  end component;

  component draw_wario is
    port (
      pixel_clk_signal : in  std_logic;
      rst              : in  std_logic;
      vsync            : in  std_logic;
      blank            : in  std_logic;
      sx               : in  signed(15 downto 0);
      sy               : in  signed(15 downto 0);
      hit_counter      : in  integer range 0 to 4;
      animation        : in  std_logic_vector(2 downto 0);
      pix              : out std_logic_vector(15 downto 0);
      drawing          : out std_logic
    );
  end component;

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
begin

  ------------------Instantiate Components-----------------------------------
  BG: draw_background
    port map (
      pixel_clk_signal => pixel_clk,
      rst              => rst,
      hcount           => hcount,
      vcount           => vcount,
      blank            => blank,
      animation        => current_state,
      vsync            => V_S,
      pixel_data       => bg_data
    );

  CHAIN: draw_chain
    port map (
      pixel_clk_signal => pixel_clk,
      rst              => rst,
      v_sync           => V_S,
      blank            => blank,
      sx               => signed(resize(unsigned(hcount), CORDW)),
      sy               => signed(resize(unsigned(vcount), CORDW)),
      animation        => current_state,
      hit_counter      => hit_counter_signal,
      bx               => ball_x,
      by               => ball_y,
      pix              => chain_data,
      drawing          => chain_enable
    );

  WARIO: draw_wario
    port map (
      pixel_clk_signal => pixel_clk,
      rst              => rst,
      vsync            => V_S,
      blank            => blank,
      sx               => signed(resize(unsigned(hcount), CORDW)),
      sy               => signed(resize(unsigned(vcount), CORDW)),
      hit_counter      => hit_counter_signal,
      animation        => current_state,
      pix              => wario_data,
      drawing          => wario_enable
    );

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  -- ============================================================
  -- PROCESS: 60 FPS Clock Generation
  -- Description: This process generates a 60 FPS clock signal 
  -- by dividing the pixel clock frequency. The generated clock 
  -- is used for animation timing.

  -- ============================================================
  process (pixel_clk)
  begin
    if (rising_edge(pixel_clk)) then
      if rst = '1' then
        counter <= 0;
        clk_60fps <= '0';

      elsif counter = 416666 then
        counter <= 0;
        clk_60fps <= not clk_60fps;
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;

  -- ============================================================
  -- PROCESS: Animation Timing
  -- Description: This process manages frame-based delays for 
  -- animations, ensuring proper timing for the initialization 
  -- sequence and super move activation. It operates at 60 FPS.

  -- ============================================================
  process (clk_60fps, rst)
  begin
    if rst = '1' then
      super_move_delay <= 0;
      init_delay <= 0;
      init_delay_flag <= '0';
      super_move_delay_flag <= '0';

    elsif rising_edge(clk_60fps) then

      -- INIT DELAY (ALLOW SIGNALS TO RESET)
      if current_state = "000" then
        if init_delay = 10 then
          init_delay <= 0;
          init_delay_flag <= '1';
        else
          init_delay_flag <= '0';
          init_delay <= init_delay + 1;
        end if;
      else
        init_delay_flag <= '0';
        init_delay <= 0;
      end if;

      -- SUPER MOVE DELAY
      if current_state = "100" then
        if super_move_delay = 3 then
          super_move_delay <= 0;
          super_move_delay_flag <= '1';
        else
          super_move_delay_flag <= '0';
          super_move_delay <= super_move_delay + 1;
        end if;
      else
        super_move_delay_flag <= '0';
        super_move_delay <= 0;
      end if;
    end if;
  end process;

  -- ============================================================
  -- PROCESS: Hit Detection & State Update
  -- Description: This process determines if the ball is within 
  -- range to trigger an attack and updates states accordingly.

  -- ============================================================
  process (pixel_clk, rst)
  begin
    if rst = '1' then
      current_state <= "000";
      in_range <= '0';
      punch_active <= '0';
      punch_delay_counter <= 0;
      hit_counter_signal <= 0;

    elsif rising_edge(pixel_clk) then
      -- state update
      current_state <= next_state;

      -- Range detection
      if ball_x >= 160 - 20 and ball_x <= sprx + 150 + 20
         and ball_y >= 290 - 20 and ball_y <= 290 + 150
         and chain_enable = '1' then
        in_range <= '1';
      else
        in_range <= '0';
      end if;

      -- Hit detection
      if ball_x >= sprx and ball_x <= sprx + 120
         and ball_y >= spry and ball_y <= spry + 120
         and chain_enable = '1' then
        hit_detected <= '1';
      else
        hit_detected <= '0';
      end if;

      -- Punch delay
      if current_state = "010" then
        if punch_delay_counter = 25000000 then
          -- reset delay counter
          punch_delay_counter <= 0;
          -- delay flag 
          punch_active <= '1';
          -- increment hit counter
          hit_counter_signal <= hit_counter_signal + 1;
        else
          punch_active <= '0';
          punch_delay_counter <= punch_delay_counter + 1;
        end if;
      else
        punch_delay_counter <= 0;
        punch_active <= '0';
      end if;

    end if;
  end process;

  -- ============================================================
  -- PROCESS: Finite State Machine (FSM)
  -- Description: This process manages game state transitions based 
  -- on user inputs and gameplay conditions. It ensures proper 
  -- handling of animations, super moves, and game progression.

  -- ============================================================
  process (current_state, btn_in, punch_active, in_range, hit_counter_signal, init_delay_flag, super_move_delay_flag)
  begin
    case current_state is
      -- INIT
      when "000" =>
        if init_delay_flag = '1' then
          next_state <= "001";
        else
          next_state <= "000";
        end if;

      -- SWING
      when "001" =>
        if hit_detected = '1' then
          next_state <= "110";
        elsif in_range = '1' then
          if btn_in = '1' then
            next_state <= "010";
          else
            next_state <= "001";
          end if;
        else
          next_state <= "001";
        end if;

      -- PUNCH DELAY
      when "010" =>
        if punch_active = '1' then
          if hit_counter_signal = 7 then
            next_state <= "011";
          else
            next_state <= "001";
          end if;
        else
          next_state <= "010";
        end if;

      -- SUPER MOVE CHARGE
      when "011" =>
        if hit_detected = '1' then
          next_state <= "110";
        elsif in_range = '1' then
          if btn_in = '1' then
            next_state <= "100";
          else
            next_state <= "011";
          end if;
        else
          next_state <= "011";
        end if;

      --  SUPER MOVE
      when "100" =>
        if super_move_delay_flag = '1' then
          game_won_count <= game_won_count + 1;
          next_state <= "101";
        else
          next_state <= "100";
        end if;

      -- GAME WON
      when "101" =>
        --game_won_count <= game_won_count + 1;
        next_state <= "101";

      -- GAME OVER
      when "110" =>
        next_state <= "110";

      -- CELEBRATION
      when others =>
        next_state <= "000";

    end case;
  end process;

  -- ============================================================
  -- PROCESS: Sprite Rendering
  -- Description: This process determines the correct pixel color 
  -- for the display based on multiple layers, including the chain,
  -- Wario, and character sprites, ensuring proper transparency 
  -- handling and priority ordering.

  -- ============================================================
  process (current_state, bg_data, wario_data, chain_data, blank, char_data)
  begin
    alpha_chain <= chain_data(15 downto 12);
    alpha_wario <= wario_data(15 downto 12);

    if blank = '0' then
      if (chain_enable = '1') and alpha_chain /= "0000" then
        R3 <= chain_data(11);
        R2 <= chain_data(10);
        R1 <= chain_data(9);
        R0 <= chain_data(8);
        G3 <= chain_data(7);
        G2 <= chain_data(6);
        G1 <= chain_data(5);
        G0 <= chain_data(4);
        B3 <= chain_data(3);
        B2 <= chain_data(2);
        B1 <= chain_data(1);
        B0 <= chain_data(0);
      elsif wario_enable = '1' and alpha_wario /= "0000" then
        R3 <= wario_data(11);
        R2 <= wario_data(10);
        R1 <= wario_data(9);
        R0 <= wario_data(8);
        G3 <= wario_data(7);
        G2 <= wario_data(6);
        G1 <= wario_data(5);
        G0 <= wario_data(4);
        B3 <= wario_data(3);
        B2 <= wario_data(2);
        B1 <= wario_data(1);
        B0 <= wario_data(0);
      elsif char_enable = '1' and current_state /= "101" and current_state /= "010" then
        R3 <= char_data(11);
        R2 <= char_data(10);
        R1 <= char_data(9);
        R0 <= char_data(8);
        G3 <= char_data(7);
        G2 <= char_data(6);
        G1 <= char_data(5);
        G0 <= char_data(4);
        B3 <= char_data(3);
        B2 <= char_data(2);
        B1 <= char_data(1);
        B0 <= char_data(0);
      else
        R3 <= bg_data(11);
        R2 <= bg_data(10);
        R1 <= bg_data(9);
        R0 <= bg_data(8);
        G3 <= bg_data(7);
        G2 <= bg_data(6);
        G1 <= bg_data(5);
        G0 <= bg_data(4);
        B3 <= bg_data(3);
        B2 <= bg_data(2);
        B1 <= bg_data(1);
        B0 <= bg_data(0);
      end if;
    else
      R3 <= bg_data(11);
      R2 <= bg_data(10);
      R1 <= bg_data(9);
      R0 <= bg_data(8);
      G3 <= bg_data(7);
      G2 <= bg_data(6);
      G1 <= bg_data(5);
      G0 <= bg_data(4);
      B3 <= bg_data(3);
      B2 <= bg_data(2);
      B1 <= bg_data(1);
      B0 <= bg_data(0);
    end if;
  end process;
end architecture;

