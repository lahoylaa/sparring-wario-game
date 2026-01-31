----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Aeron Lahoylahoy
-- 
-- Create Date: 02/21/2025 01:46:01 AM
-- Design Name: 
-- Module Name: draw_background - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--   This module is responsible for rendering the background elements on a 640x480 display.
--   It includes logic for drawing a spotlight, platform, sidebars, and background colors.
--   The module also supports animations, including color changes and celebratory effects.
-- 
-- Dependencies: 
--   - Requires pixel clock and sync signals for proper rendering.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.STD_LOGIC_ARITH.all;
  use IEEE.STD_LOGIC_UNSIGNED.all;

entity draw_background is
  port (
    pixel_clk_signal, rst : in  std_logic;
    hcount, vcount        : in  STD_LOGIC_VECTOR(10 downto 0);
    blank                 : in  STD_LOGIC;
    vsync                 : in  std_logic;
    animation             : in  std_logic_vector(2 downto 0);
    pixel_data            : out std_logic_vector(11 downto 0)
  );
end entity;

architecture Behavioral of draw_background is

  -- Screen Constants
  constant SCREEN_WIDTH        : INTEGER := 640;
  constant SCREEN_HEIGHT       : INTEGER := 480;
  constant CENTER_X            : INTEGER := SCREEN_WIDTH / 2;
  constant SLOPE               : INTEGER := 4;  -- Spotlight triangle slope
  constant SPOTLIGHT_TOP_WIDTH : INTEGER := 75; -- Narrow start (prev = 100)
  constant PLATFORM_HEIGHT     : INTEGER := 40; -- Height of platform
  constant PLATFORM_Y          : INTEGER := SCREEN_HEIGHT - PLATFORM_HEIGHT;

  -- Background Constants
  constant GRAY_BAR_HEIGHT           : INTEGER := 10;                           -- Height of the gray bar
  constant GRAY_BAR_Y                : INTEGER := PLATFORM_Y - GRAY_BAR_HEIGHT; -- Right above the platform
  constant SPOTLIGHT_PLATFORM_HEIGHT : INTEGER := 10;
  constant SPOTLIGHT_PLATFORM_Y      : INTEGER := GRAY_BAR_Y;

  -- Color Coding Size (R4G4B4 Format)
  constant COLOR_SIZE : INTEGER := 12;

  -- Area Colors Constants
  constant SPOTLIGHT_COLOR          : std_logic_vector(COLOR_SIZE - 1 downto 0) := "111011101000"; -- Bright yellow white
  constant HIGHLIGHT_PLATFORM_COLOR : std_logic_vector(COLOR_SIZE - 1 downto 0) := "001100110010"; -- Dark brownish gray
  constant PLATFORM_COLOR           : std_logic_vector(COLOR_SIZE - 1 downto 0) := "000000000000"; -- Black
  constant SIDE_BAR_COLOR           : std_logic_vector(COLOR_SIZE - 1 downto 0) := "011001100010"; -- Olive green
  constant BG_COLOR                 : std_logic_vector(COLOR_SIZE - 1 downto 0) := "101110110110"; -- Yellowish green
  constant DEFAULT_COLOR            : std_logic_vector(COLOR_SIZE - 1 downto 0) := "000000000000"; -- Blank Area Coloring (Black)
  constant SL_PLATFORM_COLOR        : std_logic_vector(COLOR_SIZE - 1 downto 0) := "011101110011"; -- Yellow green
  constant CELEB_YELLOW             : std_logic_vector(COLOR_SIZE - 1 downto 0) := "111111000000"; -- Game Won colors
  constant CELEB_ORANGE             : std_logic_vector(COLOR_SIZE - 1 downto 0) := "111101100000"; -- Game Won colors

  -- WARIO Position Constants
  constant WARIO_X        : integer := 160;
  constant WARIO_Y        : integer := 285 + 150;
  constant WARIO_CENTER_X : integer := 235;

  -- Animation Signals
  signal frame_counter : integer range 0 to 60     := 0;
  signal frame_update  : std_logic                 := '0';
  signal clk_60fps     : std_logic                 := '0';
  signal counter       : integer range 0 to 416666 := 0;
  signal switch_color  : std_logic                 := '0';

begin

  -- Process: Clock Divider
  -- Purpose: Generates a 60 FPS clock signal by dividing the pixel clock.
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

  -- Process: Frame Counter
  -- Purpose: Manages animation frame timing and color switching.
  process (clk_60fps, rst)
  begin
    if rst = '1' then
      frame_counter <= 0;
      switch_color <= '0';
    elsif rising_edge(clk_60fps) then
      if animation = "101" then
        if frame_counter = 15 then -- 0.25s
          frame_counter <= 0;
          switch_color <= not switch_color;
        else
          frame_counter <= frame_counter + 1;
        end if;
      else
        frame_counter <= 0;
      end if;
    end if;
  end process;

  -- Process: Background Drawing
  -- Purpose: Determines the color of each pixel based on its position and animation state.
  process (hcount, vcount, blank, animation, switch_color)
    variable row, col                                                                               : INTEGER;
    variable half_top_width                                                                         : INTEGER;
    variable is_spotlight, is_platform, is_highlighted_platform, is_side_bar, is_spotlight_platform : BOOLEAN;
    variable is_triangle1, is_triangle2, is_triangle3                                               : BOOLEAN;

  begin
    row := conv_integer(vcount);
    col := conv_integer(hcount);
    half_top_width := SPOTLIGHT_TOP_WIDTH / 2;

    -- Spotlight expands downward
    is_spotlight := (col > CENTER_X - half_top_width - ((row * SLOPE) / 10)) and (col < CENTER_X + half_top_width + ((row * SLOPE) / 10));

    -- Platform location (black draws over the spotlight)
    is_platform := (row >= PLATFORM_Y);

    -- Side Bar location (right above the platform outside of the spotlight)
    is_side_bar := (row >= GRAY_BAR_Y) and (row < PLATFORM_Y);

    -- Platform inside the spotlight above the black bar
    is_spotlight_platform := (row >= GRAY_BAR_Y) and (row < PLATFORM_Y) and is_spotlight;

    -- Platform inside the spotlight. Draws over the black bar
    is_highlighted_platform := is_spotlight and is_platform;

    -- Define triangle area location
    is_triangle1 := (col > WARIO_CENTER_X - (((WARIO_Y - row) * SLOPE) / 10)) and (col < WARIO_CENTER_X + (((WARIO_Y - row) * SLOPE) / 10));
    is_triangle2 := (row > WARIO_Y - (((col - WARIO_CENTER_X) * SLOPE) / 10)) and (row < WARIO_Y + (((col - WARIO_CENTER_X) * SLOPE) / 10));
    is_triangle3 := (row > WARIO_Y - (((WARIO_CENTER_X - col) * SLOPE) / 10)) and (row < WARIO_Y + (((WARIO_CENTER_X - col) * SLOPE) / 10));

    -- Color assignment logic
    if animation = "101" then
      if blank = '0' then

        if (is_platform) then
          -- Darker brown platform color (0xA530)
          pixel_data <= PLATFORM_COLOR;
        elsif (is_side_bar) then
          -- gray bar
          pixel_data <= SIDE_BAR_COLOR;

          -- Triangle area (t1, t2, t3)
        elsif is_triangle1 or is_triangle2 or is_triangle3 then
          -- Alternate the triangle colors for animaiton
          if switch_color = '1' then
            pixel_data <= CELEB_ORANGE; -- Orange triangles
          else
            pixel_data <= CELEB_YELLOW; -- Yellow triangles
          end if;
          -- Other triangles the opposite colors
        else
          -- Alternate the triangle colors for animaiton
          if switch_color = '1' then
            pixel_data <= CELEB_YELLOW; -- Yellow triangles
          else
            pixel_data <= CELEB_ORANGE; -- Orange triangles
          end if;

        end if;
      else
        pixel_data <= DEFAULT_COLOR;
      end if;

    elsif animation = "010" then
      pixel_data <= "000000000000";

    else
      if (blank = '0') then
        if
           (is_spotlight_platform) then
          pixel_data <= SL_PLATFORM_COLOR;

          -- Spotlight area (not on the platform)
        elsif (is_spotlight and not is_platform and not is_spotlight_platform) then
          -- Light yellow spotlight color (0xFF0)
          pixel_data <= SPOTLIGHT_COLOR;

          -- Platform under spotlight (brighter brown)
        elsif (is_highlighted_platform) then

          -- Brighter brown (0xD760)
          pixel_data <= HIGHLIGHT_PLATFORM_COLOR;

          -- Regular platform (darker brown)
        elsif (is_platform) then

          -- Darker brown platform color (0xA530)
          pixel_data <= PLATFORM_COLOR;

        elsif (is_side_bar) then
          -- gray bar
          pixel_data <= SIDE_BAR_COLOR;

        else
          -- Background color (darker yellow 0xBB5)
          pixel_data <= BG_COLOR;
        end if;
      else
        -- Blank area
        pixel_data <= DEFAULT_COLOR;
      end if;
    end if;

  end process;
end architecture;
