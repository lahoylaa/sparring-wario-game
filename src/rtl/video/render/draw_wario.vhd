----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2025 10:15:00 AM
-- Design Name: 
-- Module Name: draw_wario - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--    This module handles the rendering of Wario's sprite on a 640x480 display. 
--    It manages animation frames, scaling, and movement based on game logic. 
--    The system includes:
--      - A 60FPS clock process for smooth animation.
--      - A state machine controlling Wario's sprite selection.
--      - A process for computing sprite visibility and pixel output.
--      - Integration with BRAM for efficient sprite storage and retrieval.
--
-- Inputs:
--    - pixel_clk_signal : Clock signal for pixel updates.
--    - rst              : Active-high reset signal.
--    - vsync            : Vertical sync signal for synchronization.
--    - blank            : Indicates whether to output pixel data.
--    - sx, sy           : Screen coordinates of the current pixel.
--    - hit_counter      : Tracks the number of successful hits on Wario.
--    - animation        : Determines Wario’s animation state.
--
-- Outputs:
--    - pix     : 16-bit pixel color data (R5G6B5 format).
--    - drawing : Indicates if Wario's sprite is being drawn.
--
-- Dependencies: 
--    - sprite_bram: A BRAM module storing Wario’s sprite frames.
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--    - Implements a super move animation where Wario brightens.
--    - Handles smooth transitions between different animation states.
-- 
----------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

entity draw_wario is
  port (
    pixel_clk_signal : in  std_logic;
    rst              : in  std_logic;
    vsync            : in  std_logic;
    blank            : in  std_logic;
    sx               : in  signed(15 downto 0);
    sy               : in  signed(15 downto 0);
    hit_counter      : in  integer range 0 to 7;
    animation        : in  std_logic_vector(2 downto 0);
    pix              : out std_logic_vector(15 downto 0);
    drawing          : out std_logic
  );
end entity;

architecture Behavioral of draw_wario is

  ---------Signals-----------------------------------------------
  constant SPR_WIDTH  : integer := 50; --50
  constant SPR_HEIGHT : integer := 50; --50

  -- addr constants
  constant SET_ADDR_WIDTH    : integer := 15;
  constant ASSIGN_ADDR_WIDTH : integer := 15;
  constant CORDW             : integer := 16;

  signal clk_60fps      : std_logic                 := '0';
  signal counter        : integer range 0 to 416666 := 0;
  signal current_sprite : integer range 0 to 8      := 0;

  signal sprite_x : signed(15 downto 0) := to_signed(170, 16);
  signal sprite_y : signed(15 downto 0) := to_signed(290, 16);

  -- Internal signals
  signal bmap_x, bmap_y : integer range 0 to SPR_WIDTH - 1 := 0;
  signal spr_active     : std_logic                        := '0';
  signal addr_signal    : unsigned(ASSIGN_ADDR_WIDTH - 1 downto 0);
  signal pix_data       : std_logic_vector(15 downto 0)    := "0000000000000000";

  signal idle_move_counter : integer range 0 to 10 := 0;

  -- Compute SCALE factor dynamically
  constant SCALE : integer := 3;

  -- Testing
  signal frame_counter : integer range 0 to 30 := 0;
  constant WHITER_COLOR : std_logic_vector(15 downto 0) := "0000101010101010";
  signal super_move_flag : std_logic := '0';
  signal frame_update    : std_logic := '0';
  signal fall_pos        : integer   := 10;
  signal bounce_wario    : std_logic := '0';

  -----------------Functions-----------------------------------
  -- Function to compute the minimum of two integers
  function min_val(a, b : integer) return integer is
  begin
    if a < b then
      return a;
    else
      return b;
    end if;
  end function;

  function max_val(a, b : integer) return integer is
  begin
    if a > b then
      return a;
    else
      return b;
    end if;
  end function;

  -------------------Components----------------------------------
  component sprite_bram is
    port (
      clk            : in  std_logic;
      current_sprite : in  integer range 0 to 8;
      addr           : in  unsigned(14 downto 0);        -- Address (6 bits for 64 pixels)
      data_out       : out std_logic_vector(15 downto 0) -- 12-bit R4G4B4 pixel data
    );
  end component;

begin

  ---------------------------------------------------------------------
  -- 60FPS PROCESS
  ---------------------------------------------------------------------
  process (pixel_clk_signal, rst)
  begin
    if rst = '1' then
      counter <= 0;
      clk_60fps <= '0';
    elsif (rising_edge(pixel_clk_signal)) then
      if counter = 416666 then
        counter <= 0;
        clk_60fps <= not clk_60fps;
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;

  process (clk_60fps, rst)
  begin
    if rst = '1' then
      frame_counter <= 0;
      super_move_flag <= '0';

    elsif rising_edge(clk_60fps) then
      if animation = "001" or animation = "011" or
         animation = "101" or animation = "110" then

        if frame_counter = 10 then
          frame_counter <= 0;
          frame_update <= not frame_update;

          if animation = "011" then
            super_move_flag <= '1';
          end if;
        else
          super_move_flag <= '0';
          frame_counter <= frame_counter + 1;
        end if;

      else
        frame_update <= '0';
        super_move_flag <= '0';
      end if;

    end if;
  end process;

  ---------------------------------------------------------------------
  -- WARIO ANIMATION PROCESS

  ---------------------------------------------------------------------
  process (vsync, rst)
  begin
    if rst = '1' then
      current_sprite <= 0;
      sprite_y <= to_signed(290, CORDW);

    elsif rising_edge(vsync) then
      case animation is
        -- INIT (DEFAULT)
        when "000" =>
          sprite_y <= to_signed(290, CORDW);
          current_sprite <= 0;

        -- SWING (WARIO IDLE)
        when "001" =>
          if frame_update = '1' then
              current_sprite <= 1;
          else
            current_sprite <= 0;
          end if;

        -- PUNCH DELAY (HOLD WARIO PUNCH)
        when "010" =>
          current_sprite <= 2;

        -- SUPER MOVE CHARGE (WARIO CHARGES UP)
        when "011" =>
          current_sprite <= 3;

        -- SUPER MOVE
        when "100" =>
          sprite_y <= to_signed(230, CORDW);
          current_sprite <= 4;

        -- GAME WON
        when "101" =>
          sprite_y <= to_signed(290, CORDW);
          current_sprite <= 5;

        -- GAME OVER
        when "110" =>
          if hit_counter < 7 then
            current_sprite <= 7;
          else
            current_sprite <= 8;
          end if;

        when others => current_sprite <= 0;

      end case;
    end if;
  end process;

  ---------------------------------------------------------------------
  -- SPRITE COORDINATE PROCESS
  ---------------------------------------------------------------------

  -- Check sprite visibility & compute scaled coordinates
  process (sx, sy, sprite_x, sprite_y)
  begin
    if (to_integer(sy) >= to_integer(sprite_y)) and
       (to_integer(sy) < to_integer(sprite_y) + (SPR_HEIGHT * SCALE)) and
       (to_integer(sx) >= to_integer(sprite_x)) and
       (to_integer(sx) < to_integer(sprite_x) + (SPR_WIDTH * SCALE)) then
      spr_active <= '1';

      -- Compute bitmap coordinates (scaled down from screen coordinates)
      if to_integer(sx) < to_integer(sprite_x) then
        bmap_x <= 0;
      else
        bmap_x <= min_val(SPR_WIDTH - 1, to_integer(sx - sprite_x) / SCALE);
      end if;

      bmap_y <= max_val(0, min_val(SPR_HEIGHT - 1, to_integer(sy - sprite_y) / SCALE));

      if (bmap_x >= 0 and bmap_x < SPR_WIDTH and
           bmap_y >= 0 and bmap_y < SPR_HEIGHT) then
        addr_signal <= to_unsigned((bmap_y * SPR_WIDTH) + bmap_x, ASSIGN_ADDR_WIDTH);
      else
        addr_signal <= (others => '0'); -- Assign a default valid address
      end if;

    else
      spr_active <= '0';
      bmap_x <= 0;
      bmap_y <= 0;
      addr_signal <= (others => '0'); -- Assign a default valid address
    end if;
  end process;

  -- BRAM Instance
  BRAM00: sprite_bram
    port map (
      clk            => pixel_clk_signal,
      current_sprite => current_sprite,
      addr           => addr_signal,
      data_out       => pix_data
    );

  ---------------------------------------------------------------------
  -- PIXEL OUTPUT PROCESS
  ---------------------------------------------------------------------

  -- Synchronous process to output pixel data
  process (pixel_clk_signal, blank)
  begin
    if rst = '1' then
      pix <= (others => '0'); -- Ensure 12-bit reset
      drawing <= '0';
    elsif rising_edge(pixel_clk_signal) then
      if blank = '0' then
        if spr_active = '1' then
          if super_move_flag = '1' then
            pix <= pix_data or WHITER_COLOR;
          else
            pix <= pix_data; -- Fetch 12-bit color from BRAM
          end if;
          drawing <= '1';
        else
          pix <= (others => '0'); -- Default black
          drawing <= '0';
        end if;
      else
        pix <= (others => '0'); -- Ensure 12-bit reset
      end if;
    end if;
  end process;

end architecture;
