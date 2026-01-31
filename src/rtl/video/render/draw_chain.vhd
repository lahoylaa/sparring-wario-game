-- ============================================================
-- Company: 
-- Engineer: Aeron Lahoylahoy
--
-- Create Date: 
-- Design Name: Draw Chain Module
-- Module Name: draw_chain - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- This module is responsible for drawing a chain on the screen.
-- It determines the pixel color based on position and animation states.
--
-- Dependencies: 
-- Requires clock signals, position inputs, and animation control signals.
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- ============================================================

library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

entity draw_chain is
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
end entity;

architecture Behavioral of draw_chain is

  constant CORDW : integer := 16; -- Coordinate width (bits)

  -- small chain links
  constant SPR_WIDTH  : integer := 10;
  constant SPR_HEIGHT : integer := 10;
  constant SCALE      : integer := 2; -- scaling has issues will output like 3 of them

  -- Default pixel data to output (Blank (Black color))
  constant BG : std_logic_vector(15 downto 0) := "0000111111111111";

  -- Circular movement variables
  constant chain_pixel_width : integer := 35;  -- 30
  constant chain_start_pos_x : integer := 320; -- 320
  constant chain_start_pos_y : integer := 80;  -- 100

  -- Sprite Indexes (Reference chain_bram for index values)
  constant CHAIN_LINK_SPRITE   : integer := 0;
  constant BALL_SPRITE         : integer := 1;
  constant BALL_RED_SPRITE     : integer := 2;
  constant BALL_PINK_SPRITE    : integer := 3;
  constant BALL_PUNCH_1_SPRITE : integer := 4;
  constant BALL_PUNCH_2_SPRITE : integer := 5;
  constant BALL_PUNCH_3_SPRITE : integer := 6;

  -- Current Sprite active
  signal current_sprite : integer range 0 to 6 := BALL_SPRITE;

  -- Chain Link Positions
  -- X positions
  signal chain_link_x1 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_x - (SPR_WIDTH / 2), CORDW);
  signal chain_link_x2 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_x - (SPR_WIDTH / 2), CORDW);
  signal chain_link_x3 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_x - (SPR_WIDTH / 2), CORDW);
  signal chain_link_x4 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_x - (SPR_WIDTH / 2), CORDW);
  signal chain_link_x5 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_x - (SPR_WIDTH / 2), CORDW);
  signal chain_link_x6 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_x - (SPR_WIDTH / 2), CORDW);
  signal chain_link_x7 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_x - (SPR_WIDTH / 2), CORDW);

  -- Y Positions
  signal chain_link_y1 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_y + (0 * chain_pixel_width) - (SPR_WIDTH / 2), CORDW);
  signal chain_link_y2 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_y + (1 * chain_pixel_width) - (SPR_WIDTH / 2), CORDW);
  signal chain_link_y3 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_y + (2 * chain_pixel_width) - (SPR_WIDTH / 2), CORDW);
  signal chain_link_y4 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_y + (3 * chain_pixel_width) - (SPR_WIDTH / 2), CORDW);
  signal chain_link_y5 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_y + (4 * chain_pixel_width) - (SPR_WIDTH / 2), CORDW);
  signal chain_link_y6 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_y + (5 * chain_pixel_width) - (SPR_WIDTH / 2), CORDW);
  signal chain_link_y7 : signed(CORDW - 1 downto 0) := to_signed(chain_start_pos_y + (6 * chain_pixel_width) - (SPR_WIDTH / 2), CORDW);

  -- Bitmapping signals (For bram addr calculations)
  signal bmap_x1, bmap_x2, bmap_x3, bmap_x4, bmap_x5, bmap_x6, bmap_x7 : integer range 0 to SPR_WIDTH - 1 := 0; -- X position
  signal bmap_y1, bmap_y2, bmap_y3, bmap_y4, bmap_y5, bmap_y6, bmap_y7 : integer range 0 to SPR_WIDTH - 1 := 0; -- Y Position

  -- Sprite active signals (one for each sprite used (chain)
  signal spr_active1, spr_active2, spr_active3, spr_active4, spr_active5, spr_active6, spr_active7 : std_logic := '0';

  -- Bram Addr signals (one for each sprite used (chain)
  signal addr_signal1, addr_signal2, addr_signal3, addr_signal4, addr_signal5, addr_signal6, addr_signal7 : unsigned(8 downto 0) := "000000000";

  -- Pixel data signals (one for each sprite used (chain)
  signal pix_data1, pix_data2, pix_data3, pix_data4, pix_data5, pix_data6, pix_data7 : std_logic_vector(15 downto 0) := "0000000000000000";

  -- big ball 
  -- might need to adjust ball to 20x20 for punched animation
  -- Big Ball Constants (reference chain_bram for sprite size)
  constant SPR_WIDTH_BALL  : integer := 20;
  constant SPR_HEIGHT_BALL : integer := 20;
  constant SCALE_BALL      : integer := 3;

  -- Big Ball Positions
  signal ball_x : signed(CORDW - 1 downto 0) := to_signed((chain_start_pos_x - (SPR_WIDTH_BALL / 2)) - (SPR_WIDTH_BALL / 2), CORDW);
  signal ball_y : signed(CORDW - 1 downto 0) := to_signed((chain_start_pos_y - (SPR_WIDTH_BALL / 2)) + (7 * chain_pixel_width) - (SPR_WIDTH_BALL / 2), CORDW);

  -- Big Ball Bitmapping
  signal bmap_x_ball, bmap_y_ball : integer range 0 to SPR_WIDTH_BALL - 1 := 0;
  -- Big Ball Sprite Active
  signal spr_ball_active : std_logic := '0';
  -- Big Ball Addr signal
  signal addr_signal_ball : unsigned(8 downto 0) := "000000000";
  -- Big Ball Pixel Data
  signal pix_ball_data : std_logic_vector(15 downto 0) := "0000000000000000";

  -- Circular Movement signals
  -- Predefine cosine and sine values to utilized
  type LUT_TYPE is array (0 to 31) of INTEGER;

  signal cos_LUT : LUT_TYPE := (83, 92, 98, 100, 98, 92, 83, 71, 56, 38, 19, 0, - 19, - 38, - 56, - 71,
                                - 83, - 92, - 98, - 100, - 98, - 92, - 83, - 71, - 56, - 38, - 19, 0, 19, 38, 56, 71);
  signal sin_LUT : LUT_TYPE := (56, 38, 19, 0, - 19, - 38, - 56, - 71, - 83, - 92, - 98, - 100, - 98, - 92, - 83, - 71,
                                - 56, - 38, - 19, 0, 19, 38, 56, 71, 83, 92, 98, 100, 98, 92, 83, 71);

  -- angle is used as index and spread to 256 indexes to provide better resolution in movement
  signal angle : INTEGER range 0 to 255 := 216;

  -- Ball Animations Signals
  signal flashing_counter    : INTEGER range 0 to 10 := 0;
  signal chain_punch_counter : INTEGER range 0 to 3  := 0;
  signal chain_punch_flag    : std_logic             := '0';

  -- Swing Animation Signals
  signal swing_counter    : integer              := 0;
  signal swing_state      : integer              := 0;
  signal swing_active     : integer              := 0;
  signal last_hit_counter : integer range 0 to 7 := 0;
  signal swing_val        : integer              := 5;
  signal step_size        : integer              := 2;

  -- Animation Updates
  signal clk_60fps : std_logic                 := '0';
  signal counter   : integer range 0 to 416666 := 0;

  -- Function to compute the minimum of two integers
  function min_val(a, b : integer) return integer is
  begin
    if a < b then
      return a;
    else
      return b;
    end if;
  end function;

  -- Function to compute the maximum of two integers
  function max_val(a, b : integer) return integer is
  begin
    if a > b then
      return a;
    else
      return b;
    end if;
  end function;

  -------------------Components----------------------------------
  component chain_bram is
    port (
      clk            : in  std_logic;
      current_sprite : in  integer range 0 to 6;
      addr           : in  unsigned(8 downto 0);
      data_out       : out std_logic_vector(15 downto 0)
    );
  end component;

begin
  -- ============================================================
  -- PROCESS: Generate 60 FPS Clock
  -- Description: This process generates a slower clock signal to control
  -- animation frame updates by counting cycles of the input clock.
  -- ============================================================
  process (pixel_clk_signal)
  begin
    if (rising_edge(pixel_clk_signal)) then
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
  -- PROCESS: Chain Punch Counter Control
  -- Description: This process manages the chain punch counter, determining
  -- when the chain should be punched and updating the animation state.

  -- ============================================================
  process (v_sync, rst)
  begin
    if rst = '1' then
      chain_punch_counter <= 0;
      chain_punch_counter <= 0;
      chain_punch_flag <= '0';

    elsif rising_edge(v_sync) then
      if swing_active = 1 and (animation = "001" or animation = "011") then

        chain_punch_flag <= '1';
        if flashing_counter = 2 then
          flashing_counter <= 0;
          if chain_punch_counter = 3 then
            chain_punch_flag <= '0';
          else
            chain_punch_counter <= chain_punch_counter + 1;
            chain_punch_flag <= '1';
          end if;
        else
          flashing_counter <= flashing_counter + 1;
          chain_punch_flag <= '0';
        end if;
      else
        flashing_counter <= 0;
        chain_punch_counter <= 0;
        chain_punch_flag <= '0';
      end if;

    end if;
  end process;

  -- ============================================================
  -- PROCESS: Ball Animation State Control
  -- Description: This process updates the sprite display based on animation state.
  -- It selects the appropriate sprite when the punch animation is triggered.

  -- ============================================================
  process (v_sync)
  begin
    if rising_edge(v_sync) then
      case animation is

        when "001" =>
          if chain_punch_flag = '1' then
            case chain_punch_counter is
              when 0 => current_sprite <= BALL_PUNCH_1_SPRITE;
              when 1 => current_sprite <= BALL_PUNCH_2_SPRITE;
              when 2 => current_sprite <= BALL_PUNCH_3_SPRITE;
              when 3 => current_sprite <= BALL_SPRITE;
              when others => current_sprite <= BALL_SPRITE;
            end case;
          else
            current_sprite <= BALL_SPRITE;
          end if;

        when "010" =>
          current_sprite <= BALL_PUNCH_1_SPRITE;

        when others =>
          current_sprite <= BALL_SPRITE;

      end case;
    end if;
  end process;

  -- ============================================================
  -- PROCESS: Swing Motion Control
  -- Description: This process handles the swinging motion of the chain.
  -- It updates the angle based on the hit counter and controls the swinging
  -- sequence to ensure smooth movement.

  -- ============================================================
  process (v_sync, rst)
  begin
    if rst = '1' then
      angle <= 216;
      swing_state <= 0;
      swing_counter <= 0;
      swing_active <= 0;
      last_hit_counter <= 0;
      swing_val <= 7;
      step_size <= 2;
    elsif (rising_edge(v_sync)) then
      if animation = "001" or animation = "011" then
        -- Detect when hit_counter changes (new hit)
        if hit_counter /= last_hit_counter then
          last_hit_counter <= hit_counter;
          swing_state <= 1;
          swing_counter <= 0;
          swing_active <= 1;
          case last_hit_counter is
            when 0 => swing_val <= 20;
            when 1 => swing_val <= 30;
            when 2 => swing_val <= 35;
            when 3 => swing_val <= 45;
            when 4 => swing_val <= 80;
            when 5 => swing_val <= 100;
            when 6 => swing_val <= 300;
            when 7 => swing_val <= 800;
            when others => swing_val <= 200;
          end case;
          step_size <= 1;
        end if;
      else
        swing_state <= 0;
        angle <= angle;
      end if;
      if swing_state = 1 then
        if swing_counter < swing_val then
          angle <= (angle + step_size) mod 256;
          swing_counter <= swing_counter + 1;
        else
          swing_state <= 2; -- Switch to downward movement
          swing_counter <= 0;
        end if;
      elsif swing_state = 2 then
        if swing_counter < swing_val + 30 then
          angle <= (angle - step_size) mod 256;
          swing_counter <= swing_counter + 1;
        else
          swing_state <= 0;
          swing_active <= 0;
        end if;
      end if;
    end if;

  end process;

  -- ============================================================
  -- PROCESS: Chain Punch Animation Control
  -- Description: This process manages the punch animation of the chain ball.
  -- It cycles through different punch animation states and resets accordingly.

  -- ============================================================
  process (pixel_clk_signal)
  begin
    if rising_edge(pixel_clk_signal) then
      if blank = '1' then
        -- Other links directly from pivot
        chain_link_x2 <= to_signed(chain_start_pos_x + ((chain_pixel_width) * (cos_LUT((angle) / 8)) / 100) - (SPR_WIDTH / 2), 16);
        chain_link_y2 <= to_signed(chain_start_pos_y + ((chain_pixel_width) * (sin_LUT((angle) / 8)) / 100) - (SPR_WIDTH / 2), 16);
        chain_link_x3 <= to_signed(chain_start_pos_x + ((2 * chain_pixel_width) * (cos_LUT((angle) / 8)) / 100) - (SPR_WIDTH / 2), 16);
        chain_link_y3 <= to_signed(chain_start_pos_y + ((2 * chain_pixel_width) * (sin_LUT((angle) / 8)) / 100) - (SPR_WIDTH / 2), 16);
        chain_link_x4 <= to_signed(chain_start_pos_x + ((3 * chain_pixel_width) * (cos_LUT((angle) / 8)) / 100) - (SPR_WIDTH / 2), 16);
        chain_link_y4 <= to_signed(chain_start_pos_y + ((3 * chain_pixel_width) * (sin_LUT((angle) / 8)) / 100) - (SPR_WIDTH / 2), 16);
        chain_link_x5 <= to_signed(chain_start_pos_x + ((4 * chain_pixel_width) * (cos_LUT((angle) / 8)) / 100) - (SPR_WIDTH / 2), 16);
        chain_link_y5 <= to_signed(chain_start_pos_y + ((4 * chain_pixel_width) * (sin_LUT((angle) / 8)) / 100) - (SPR_WIDTH / 2), 16);
        chain_link_x6 <= to_signed(chain_start_pos_x + ((5 * chain_pixel_width) * (cos_LUT((angle) / 8)) / 100) - (SPR_WIDTH / 2), 16);
        chain_link_y6 <= to_signed(chain_start_pos_y + ((5 * chain_pixel_width) * (sin_LUT((angle) / 8)) / 100) - (SPR_WIDTH / 2), 16);
        chain_link_x7 <= to_signed(chain_start_pos_x + ((6 * chain_pixel_width) * (cos_LUT((angle) / 8)) / 100) - (SPR_WIDTH / 2), 16);
        chain_link_y7 <= to_signed(chain_start_pos_y + ((6 * chain_pixel_width) * (sin_LUT((angle) / 8)) / 100) - (SPR_WIDTH / 2), 16);

        -- Ball at the end of the chain
        ball_x <= to_signed((chain_start_pos_x - (SPR_WIDTH_BALL / 2) - 5) + ((7 * chain_pixel_width) * (cos_LUT(angle / 8)) / 100) - (SPR_WIDTH_BALL / 2), 16);
        ball_y <= to_signed((chain_start_pos_y - (SPR_WIDTH_BALL / 2)) + ((7 * chain_pixel_width) * (sin_LUT(angle / 8)) / 100) + (SPR_WIDTH_BALL / 2), 16);
      end if;
    end if;
  end process;

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------
  -- SPRITE COORDINATE PROCESS
  ---------------------------------------------------------------------

  -- Sprite 1 Visibility & Coordinate Calculation
  process (sx, sy, chain_link_x1, chain_link_y1)
  begin
    if (to_integer(sy) >= to_integer(chain_link_y1)) and
       (to_integer(sy) < to_integer(chain_link_y1) + (SPR_HEIGHT * SCALE)) and
       (to_integer(sx) >= to_integer(chain_link_x1)) and
       (to_integer(sx) < to_integer(chain_link_x1) + (SPR_WIDTH * SCALE)) then
      spr_active1 <= '1';

      if to_integer(sx) < to_integer(chain_link_x1) then
        bmap_x1 <= 0;
      else
        bmap_x1 <= min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x1) / SCALE);
      end if;
      --bmap_x1 <= max_val(0, min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x1) / SCALE));
      bmap_y1 <= max_val(0, min_val(SPR_HEIGHT - 1, to_integer(sy - chain_link_y1) / SCALE));

      if (bmap_x1 >= 0 and bmap_x1 < SPR_WIDTH and
           bmap_y1 >= 0 and bmap_y1 < SPR_HEIGHT) then
        addr_signal1 <= to_unsigned((bmap_y1 * SPR_WIDTH) + bmap_x1, 9);
      else
        addr_signal1 <= (others => '0'); -- Assign a default valid address
      end if;

    else
      spr_active1 <= '0';
      bmap_x1 <= 0;
      bmap_y1 <= 0;
      addr_signal1 <= (others => '0');
    end if;
  end process;

  -- Sprite 2 Visibility & Coordinate Calculation
  process (sx, sy, chain_link_x2, chain_link_y2)
  begin
    if (to_integer(sy) >= to_integer(chain_link_y2)) and
       (to_integer(sy) < to_integer(chain_link_y2) + (SPR_HEIGHT * SCALE)) and
       (to_integer(sx) >= to_integer(chain_link_x2)) and
       (to_integer(sx) < to_integer(chain_link_x2) + (SPR_WIDTH * SCALE)) then
      spr_active2 <= '1';
      if to_integer(sx) < to_integer(chain_link_x2) then
        bmap_x2 <= 0;
      else
        bmap_x2 <= min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x2) / SCALE);
      end if;
      --bmap_x2 <= max_val(0, min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x2) / SCALE));
      bmap_y2 <= max_val(0, min_val(SPR_HEIGHT - 1, to_integer(sy - chain_link_y2) / SCALE));

      if (bmap_x2 >= 0 and bmap_x2 < SPR_WIDTH and
           bmap_y2 >= 0 and bmap_y2 < SPR_HEIGHT) then
        addr_signal2 <= to_unsigned((bmap_y2 * SPR_WIDTH) + bmap_x2, 9);
      else
        addr_signal2 <= (others => '0'); -- Assign a default valid address
      end if;

    else
      spr_active2 <= '0';
      bmap_x2 <= 0;
      bmap_y2 <= 0;
      addr_signal2 <= (others => '0');
    end if;
  end process;

  -- Sprite 3 Visibility & Coordinate Calculation
  process (sx, sy, chain_link_x3, chain_link_y3)
  begin
    if (to_integer(sy) >= to_integer(chain_link_y3)) and
       (to_integer(sy) < to_integer(chain_link_y3) + (SPR_HEIGHT * SCALE)) and
       (to_integer(sx) >= to_integer(chain_link_x3)) and
       (to_integer(sx) < to_integer(chain_link_x3) + (SPR_WIDTH * SCALE)) then
      spr_active3 <= '1';
      if to_integer(sx) < to_integer(chain_link_x3) then
        bmap_x3 <= 0;
      else
        bmap_x3 <= min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x3) / SCALE);
      end if;
      --bmap_x3 <= max_val(0, min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x3) / SCALE));
      bmap_y3 <= max_val(0, min_val(SPR_HEIGHT - 1, to_integer(sy - chain_link_y3) / SCALE));

      if (bmap_x3 >= 0 and bmap_x3 < SPR_WIDTH and
           bmap_y3 >= 0 and bmap_y3 < SPR_HEIGHT) then
        addr_signal3 <= to_unsigned((bmap_y3 * SPR_WIDTH) + bmap_x3, 9);
      else
        addr_signal3 <= (others => '0'); -- Assign a default valid address
      end if;

    else
      spr_active3 <= '0';
      bmap_x3 <= 0;
      bmap_y3 <= 0;
      addr_signal3 <= (others => '0');
    end if;
  end process;

  -- Sprite 4 Visibility & Coordinate Calculation
  process (sx, sy, chain_link_x4, chain_link_y4)
  begin
    if (to_integer(sy) >= to_integer(chain_link_y4)) and
       (to_integer(sy) < to_integer(chain_link_y4) + (SPR_HEIGHT * SCALE)) and
       (to_integer(sx) >= to_integer(chain_link_x4)) and
       (to_integer(sx) < to_integer(chain_link_x4) + (SPR_WIDTH * SCALE)) then
      spr_active4 <= '1';
      if to_integer(sx) < to_integer(chain_link_x4) then
        bmap_x4 <= 0;
      else
        bmap_x4 <= min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x4) / SCALE);
      end if;
      --bmap_x4 <= max_val(0, min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x4) / SCALE));
      bmap_y4 <= max_val(0, min_val(SPR_HEIGHT - 1, to_integer(sy - chain_link_y4) / SCALE));
      if (bmap_x4 >= 0 and bmap_x4 < SPR_WIDTH and
           bmap_y4 >= 0 and bmap_y4 < SPR_HEIGHT) then
        addr_signal4 <= to_unsigned((bmap_y4 * SPR_WIDTH) + bmap_x4, 9);
      else
        addr_signal4 <= (others => '0'); -- Assign a default valid address
      end if;

    else
      spr_active4 <= '0';
      bmap_x4 <= 0;
      bmap_y4 <= 0;
      addr_signal4 <= (others => '0');
    end if;
  end process;

  -- Sprite 5 Visibility & Coordinate Calculation
  process (sx, sy, chain_link_x5, chain_link_y5)
  begin
    if (to_integer(sy) >= to_integer(chain_link_y5)) and
       (to_integer(sy) < to_integer(chain_link_y5) + (SPR_HEIGHT * SCALE)) and
       (to_integer(sx) >= to_integer(chain_link_x5)) and
       (to_integer(sx) < to_integer(chain_link_x5) + (SPR_WIDTH * SCALE)) then
      spr_active5 <= '1';
      if to_integer(sx) < to_integer(chain_link_x5) then
        bmap_x5 <= 0;
      else
        bmap_x5 <= min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x5) / SCALE);
      end if;
      -- bmap_x5 <= max_val(0, min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x5) / SCALE));
      bmap_y5 <= max_val(0, min_val(SPR_HEIGHT - 1, to_integer(sy - chain_link_y5) / SCALE));

      if (bmap_x5 >= 0 and bmap_x5 < SPR_WIDTH and
           bmap_y5 >= 0 and bmap_y5 < SPR_HEIGHT) then
        addr_signal5 <= to_unsigned((bmap_y5 * SPR_WIDTH) + bmap_x5, 9);
      else
        addr_signal5 <= (others => '0'); -- Assign a default valid address
      end if;

    else
      spr_active5 <= '0';
      bmap_x5 <= 0;
      bmap_y5 <= 0;
      addr_signal5 <= (others => '0');
    end if;
  end process;

  -- Sprite 6 Visibility & Coordinate Calculation
  process (sx, sy, chain_link_x6, chain_link_y6)
  begin
    if (to_integer(sy) >= to_integer(chain_link_y6)) and
       (to_integer(sy) < to_integer(chain_link_y6) + (SPR_HEIGHT * SCALE)) and
       (to_integer(sx) >= to_integer(chain_link_x6)) and
       (to_integer(sx) < to_integer(chain_link_x6) + (SPR_WIDTH * SCALE)) then
      spr_active6 <= '1';
      if to_integer(sx) < to_integer(chain_link_x6) then
        bmap_x6 <= 0;
      else
        bmap_x6 <= min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x6) / SCALE);
      end if;
      --bmap_x6 <= max_val(0, min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x1) / SCALE));
      bmap_y6 <= max_val(0, min_val(SPR_HEIGHT - 1, to_integer(sy - chain_link_y6) / SCALE));

      if (bmap_x6 >= 0 and bmap_x6 < SPR_WIDTH and
           bmap_y6 >= 0 and bmap_y6 < SPR_HEIGHT) then
        addr_signal6 <= to_unsigned((bmap_y6 * SPR_WIDTH) + bmap_x6, 9);
      else
        addr_signal6 <= (others => '0'); -- Assign a default valid address
      end if;

    else
      spr_active6 <= '0';
      bmap_x6 <= 0;
      bmap_y6 <= 0;
      addr_signal6 <= (others => '0');
    end if;
  end process;

  -- Sprite 7 Visibility & Coordinate Calculation
  process (sx, sy, chain_link_x7, chain_link_y7)
  begin
    if (to_integer(sy) >= to_integer(chain_link_y7)) and
       (to_integer(sy) < to_integer(chain_link_y7) + (SPR_HEIGHT * SCALE)) and
       (to_integer(sx) >= to_integer(chain_link_x7)) and
       (to_integer(sx) < to_integer(chain_link_x7) + (SPR_WIDTH * SCALE)) then
      spr_active7 <= '1';
      if to_integer(sx) < to_integer(chain_link_x7) then
        bmap_x7 <= 0;
      else
        bmap_x7 <= min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x7) / SCALE);
      end if;
      --bmap_x7 <= max_val(0, min_val(SPR_WIDTH - 1, to_integer(sx - chain_link_x1) / SCALE));
      bmap_y7 <= max_val(0, min_val(SPR_HEIGHT - 1, to_integer(sy - chain_link_y7) / SCALE));

      if (bmap_x7 >= 0 and bmap_x7 < SPR_WIDTH and
           bmap_y7 >= 0 and bmap_y7 < SPR_HEIGHT) then
        addr_signal7 <= to_unsigned((bmap_y7 * SPR_WIDTH) + bmap_x7, 9);
      else
        addr_signal7 <= (others => '0'); -- Assign a default valid address
      end if;

    else
      spr_active7 <= '0';
      bmap_x7 <= 0;
      bmap_y7 <= 0;
      addr_signal7 <= (others => '0');
    end if;
  end process;

  -- Sprite Ball Visibility & Coordinate Calculation
  process (sx, sy, ball_x, ball_y)
  begin
    if (to_integer(sy) >= to_integer(ball_y)) and
       (to_integer(sy) < to_integer(ball_y) + (SPR_HEIGHT_BALL * SCALE_BALL)) and
       (to_integer(sx) >= to_integer(ball_x)) and
       (to_integer(sx) < to_integer(ball_x) + (SPR_WIDTH_BALL * SCALE_BALL)) then
      spr_ball_active <= '1';

      if to_integer(sx) < to_integer(ball_x) then
        bmap_x_ball <= 0;
      else
        bmap_x_ball <= min_val(SPR_WIDTH_BALL - 1, to_integer(sx - ball_x) / SCALE_BALL);
      end if;
      --bmap_x_ball <= max_val(0, in_val(SPR_WIDTH_BALL - 1, to_integer(sx - ball_x) / SCALE_BALL));
      bmap_y_ball <= max_val(0, min_val(SPR_HEIGHT_BALL - 1, to_integer(sy - ball_y) / SCALE_BALL));

      if (bmap_x_ball >= 0 and bmap_x_ball < SPR_WIDTH_BALL and
           bmap_y_ball >= 0 and bmap_y_ball < SPR_HEIGHT_BALL) then
        addr_signal_ball <= to_unsigned((bmap_y_ball * SPR_WIDTH_BALL) + bmap_x_ball, 9);
      else
        addr_signal_ball <= (others => '0'); -- Assign a default valid address
      end if;

    else
      spr_ball_active <= '0';
      bmap_x_ball <= 0;
      bmap_y_ball <= 0;
      addr_signal_ball <= (others => '0');
    end if;
  end process;

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------
  -- CHAIN BRAM INIT PROCESS
  ---------------------------------------------------------------------
  BRAM1: chain_bram
    port map (
      clk            => pixel_clk_signal,
      current_sprite => CHAIN_LINK_SPRITE,
      addr           => addr_signal1,
      data_out       => pix_data1
    );

  BRAM2: chain_bram
    port map (
      clk            => pixel_clk_signal,
      current_sprite => CHAIN_LINK_SPRITE,
      addr           => addr_signal2,
      data_out       => pix_data2
    );

  BRAM3: chain_bram
    port map (
      clk            => pixel_clk_signal,
      current_sprite => CHAIN_LINK_SPRITE,
      addr           => addr_signal3,
      data_out       => pix_data3
    );

  BRAM4: chain_bram
    port map (
      clk            => pixel_clk_signal,
      current_sprite => CHAIN_LINK_SPRITE,
      addr           => addr_signal4,
      data_out       => pix_data4
    );

  BRAM5: chain_bram
    port map (
      clk            => pixel_clk_signal,
      current_sprite => CHAIN_LINK_SPRITE,
      addr           => addr_signal5,
      data_out       => pix_data5
    );

  BRAM6: chain_bram
    port map (
      clk            => pixel_clk_signal,
      current_sprite => CHAIN_LINK_SPRITE,
      addr           => addr_signal6,
      data_out       => pix_data6
    );

  BRAM7: chain_bram
    port map (
      clk            => pixel_clk_signal,
      current_sprite => CHAIN_LINK_SPRITE,
      addr           => addr_signal7,
      data_out       => pix_data7
    );

  BALLBRAM1: chain_bram
    port map (
      clk            => pixel_clk_signal,
      current_sprite => current_sprite, -- BALL_SPRITE
      addr           => addr_signal_ball,
      data_out       => pix_ball_data
    );

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  -- ============================================================
  -- PROCESS: Chain Sprite Rendering
  -- Description: This process determines which sprite should be displayed
  -- based on the current animation state and sprite activation signals.
  -- It ensures proper rendering of the chain and ball on the screen.
  -- ============================================================

  -- Synchronous process to output pixel data
  process (pixel_clk_signal, blank)
  begin
    if rst = '1' then
      pix <= BG;
      drawing <= '0';
      bx <= to_signed(chain_start_pos_x - 4, CORDW);
      by <= to_signed(chain_start_pos_y + (7 * chain_pixel_width), CORDW);
    elsif rising_edge(pixel_clk_signal) then
      if blank = '0' then
        if animation = "101" or animation = "110" then
          pix <= BG;
          drawing <= '0';
        else
          if spr_active1 = '1' and animation /= "010" then
            pix <= pix_data1;
            drawing <= '1';
            bx <= ball_x;
            by <= ball_y;
          elsif spr_active2 = '1' and animation /= "010" then
            pix <= pix_data2;
            drawing <= '1';
            bx <= ball_x;
            by <= ball_y;
          elsif spr_active3 = '1' and animation /= "010" then
            pix <= pix_data3;
            drawing <= '1';
            bx <= ball_x;
            by <= ball_y;
          elsif spr_active4 = '1' and animation /= "010" then
            pix <= pix_data4;
            drawing <= '1';
            bx <= ball_x;
            by <= ball_y;
          elsif spr_active5 = '1' and animation /= "010" then
            pix <= pix_data5;
            drawing <= '1';
            bx <= ball_x;
            by <= ball_y;
          elsif spr_active6 = '1' and animation /= "010" then
            pix <= pix_data6;
            drawing <= '1';
            bx <= ball_x;
            by <= ball_y;
          elsif spr_active7 = '1' and animation /= "010" then
            pix <= pix_data7;
            drawing <= '1';
            bx <= ball_x;
            by <= ball_y;
          elsif spr_ball_active = '1' then
            pix <= pix_ball_data;
            drawing <= '1';
            bx <= ball_x;
            by <= ball_y;
          else
            pix <= BG;
            drawing <= '0';
            bx <= to_signed(chain_start_pos_x - 4, CORDW);
            by <= to_signed(chain_start_pos_y + (7 * chain_pixel_width), CORDW);
          end if;
        end if;
      else
        pix <= (others => '0'); -- Ensure 12-bit reset
      end if;

    end if;
  end process;

end architecture;
