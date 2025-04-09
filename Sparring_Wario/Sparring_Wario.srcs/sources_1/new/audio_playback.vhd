----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2025 12:46:19 AM
-- Design Name: 
-- Module Name: audio_playback - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

  -- Uncomment the following library declaration if using
  -- arithmetic functions with Signed or Unsigned values
  --use IEEE.NUMERIC_STD.ALL;

  -- Uncomment the following library declaration if instantiating
  -- any Xilinx leaf cells in this code.
  --library UNISIM;
  --use UNISIM.VComponents.all;

entity audio_playback is
  --  Port ( );
  port (
    clk                     : in  std_logic;
    reset                   : in  std_logic;
    audio_left, audio_right : out std_logic
  );
end entity;

architecture Behavioral of audio_playback is

  -- Rom Access
  signal addr       : unsigned(17 downto 0);

  -- Sample Clock (8khz)
  signal sample_clk     : std_logic               := '0';
  signal sample_counter : integer range 0 to 6249 := 0;

  -- Generate PWM from rom
  signal pwm_counter : integer range 0 to 255 := 0;
  signal pwm_val     : std_logic_vector(7 downto 0) := "00000000"; -- 8 bit sample
  constant PWM_FREQ : integer := 100000;
  constant PWM_DIV  : integer := 100000000 / (PWM_FREQ * 2);

  -- PWM Clock
  signal pwm_clk         : std_logic                      := '0';
  signal pwm_div_counter : integer range 0 to PWM_DIV - 1 := 0;

  -- Add the audio_rom
  component audio_rom
    port (
      clka  : in  std_logic;
      addra : in  STD_LOGIC_VECTOR(17 downto 0);
      douta : out STD_LOGIC_VECTOR(7 downto 0)
    );

  end component;

begin

  -- Audio ROM instance
  audio_inst: audio_rom
    port map (
      clka  => clk,
      addra => std_logic_vector(addr),
      douta => pwm_val
    );

  -- Clock divider for sample rate 8khz
  process (clk, reset)
  begin
    if reset = '1' then
      sample_counter <= 0;
      sample_clk <= '0';
    elsif rising_edge(clk) then
      if sample_counter = 6249 then
        sample_counter <= 0;
        sample_clk <= not sample_clk;
      else
        sample_counter <= sample_counter + 1;
      end if;
    end if;
  end process;

  -- Address counter for 8 kHz sample rate
  process (sample_clk, reset)
  begin
    if reset = '1' then
      addr <= (others => '0');
    elsif rising_edge(sample_clk) then
      if addr < 239999 then
        addr <= addr + 1;
      else
        addr <= (others => '0');
      end if;
    end if;
  end process;

  -- Clock divider for PWM frequency: 100 MHz -> 100 kHz
  process (clk, reset)
  begin
    if reset = '1' then
      pwm_div_counter <= 0;
      pwm_clk <= '0';
    elsif rising_edge(clk) then
      if pwm_div_counter = PWM_DIV - 1 then -- 500 cycles
        pwm_div_counter <= 0;
        pwm_clk <= not pwm_clk;
      else
        pwm_div_counter <= pwm_div_counter + 1;
      end if;
    end if;
  end process;

  -- PWM counter (0 to 255 at 100 kHz)
  process (pwm_clk, reset)
  begin
    if reset = '1' then
      pwm_counter <= 0;
    elsif rising_edge(pwm_clk) then
      pwm_counter <= pwm_counter + 1; -- Rolls over at 255
    end if;
  end process;

  -- PWM output: Compare counter to sample value
  process (pwm_counter, pwm_val)
  begin
    if to_unsigned(pwm_counter, 8) < unsigned(pwm_val) then
      audio_left <= '1';
      audio_right <= '1'; -- Same signal for both channels
    else
      audio_left <= '0';
      audio_right <= '0';
    end if;
  end process;

end architecture;
