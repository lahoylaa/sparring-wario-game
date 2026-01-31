library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

entity audio_playback is
  port (
    clk         : in  std_logic;
    reset       : in  std_logic;
    audio_left  : out std_logic;
    audio_right : out std_logic
  );
end entity;

architecture Behavioral of audio_playback is
  -- ROM Access
  signal addr : unsigned(15 downto 0);

  -- Sample Clock (8 kHz)
  signal sample_clk     : std_logic               := '0';
  signal sample_counter : integer range 0 to 6249 := 0;

  -- ROM Output
  signal rom_val : std_logic_vector(7 downto 0) := "00000000"; -- 8-bit signed sample

  -- PWM Generation
  constant PWM_FREQ : integer := 100000;                       -- 100 kHz PWM frequency
  constant PWM_DIV  : integer := 100000000 / (PWM_FREQ * 256); -- ~4
  signal pwm_clk         : std_logic                      := '0';
  signal pwm_div_counter : integer range 0 to PWM_DIV - 1 := 0;
  signal pwm_counter     : integer range 0 to 255         := 0;

  -- ROM Component
  component audio_rom
    port (
      clka  : in  std_logic;
      addra : in  STD_LOGIC_VECTOR(15 downto 0);
      douta : out STD_LOGIC_VECTOR(7 downto 0)
    );
  end component;

begin
  -- Audio ROM instance
  audio_inst: audio_rom
    port map (
      clka  => clk,
      addra => std_logic_vector(addr),
      douta => rom_val
    );

  -- Clock divider for sample rate 8 kHz
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
  process (sample_clk)
  begin
    if rising_edge(sample_clk) then
      if addr < 42867 then
        addr <= addr + 1;
      else
        addr <= (others => '0');
      end if;
    end if;
  end process;

  -- Clock divider for PWM frequency: 100 MHz -> 48.828 kHz
  process (clk, reset)
  begin
    if reset = '1' then
      pwm_div_counter <= 0;
      pwm_clk <= '0';
    elsif rising_edge(clk) then
      if pwm_div_counter = PWM_DIV - 1 then
        pwm_div_counter <= 0;
        pwm_clk <= not pwm_clk;
      else
        pwm_div_counter <= pwm_div_counter + 1;
      end if;
    end if;
  end process;

  -- PWM counter (0 to 255)
  process (pwm_clk, reset)
  begin
    if reset = '1' then
      pwm_counter <= 0;
    elsif rising_edge(pwm_clk) then
      pwm_counter <= pwm_counter + 1; -- Rolls over at 256
    end if;
  end process;

  -- PWM output for 8-bit signed data
  process (pwm_counter, rom_val)
    variable signed_val : signed(7 downto 0);
    variable pwm_duty   : unsigned(7 downto 0);
  begin
    signed_val := signed(rom_val); -- Interpret as signed (-128 to 127)
    -- Scale signed value (-128 to 127) to unsigned PWM duty cycle (0 to 255)
    pwm_duty := to_unsigned(to_integer(signed_val) + 128, 8);
    -- Compare with pwm_counter
    if pwm_counter < to_integer(pwm_duty) then
      audio_left <= '1';
      audio_right <= '1';
    else
      audio_left <= '0';
      audio_right <= '0';
    end if;
  end process;

end architecture;
