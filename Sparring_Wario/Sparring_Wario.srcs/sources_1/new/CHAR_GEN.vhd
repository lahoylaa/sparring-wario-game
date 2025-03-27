----------------------------------------------------------------------------------
-- Company:         
-- Engineer:       
-- 
-- Create Date:     02/09/2025 04:04:01 PM
-- Module Name:     CHAR_GEN - Behavioral
-- Project Name:    
-- Target Device:   
-- Description:     
--   This module generates and displays a fixed message "Sparring Wario" on a 
--   640x480 VGA display. It retrieves ASCII character bitmaps from a ROM and 
--   renders them at a fixed position on the screen. The module scales the 
--   characters, applies spacing, and enables color customization.
--
-- Features:
--   - Displays a predefined message with adjustable position and scaling.
--   - Retrieves character bitmaps from ROM based on ASCII values.
--   - Implements a simple pixel-mapping logic to determine when to enable 
--     character drawing.
--   - Supports different foreground and background colors.
--   - Uses a 25 MHz clock signal for rendering.
--
-- Dependencies:
--   - Requires a ROM module (rom1) containing character bitmaps.
--
-- Revision History:
--   - Rev 1.0 (02/09/2025): Initial implementation of character rendering.
--   - Rev 1.1 (03/18/2025): Added custom color for foreground and background.
--
----------------------------------------------------------------------------------


library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.STD_LOGIC_UNSIGNED.all;
  use IEEE.STD_LOGIC_ARITH.all;

entity CHAR_GEN is
  port (
    clk25, blank   : in  STD_LOGIC;
    hcount, vcount : in  STD_LOGIC_VECTOR(10 downto 0);
    char_enable    : out std_logic;
    char_data      : out std_logic_vector(11 downto 0)
  );
end entity;

architecture Behavioral of CHAR_GEN is
  -- Constants
  constant CHAR_COUNT   : integer := 13;        -- Number of characters in "Sparring Wario"
  constant SCALE        : integer := 2;         -- Scaling factor for display
  constant CHAR_WIDTH   : integer := 8 * SCALE; -- Character width after scaling
  constant CHAR_HEIGHT  : integer := 8 * SCALE; -- Character height after scaling
  constant CHAR_SPACING : integer := 16;        -- Spacing between characters
  constant CHAR_Y_POS   : integer := 450;       -- Fixed y-position for all characters
  constant CHAR_X_BASE  : integer := 200;       -- Start x-position

  -- Signal declarations
  signal pixel_row   : STD_LOGIC_VECTOR(2 downto 0);
  signal pixel_col   : STD_LOGIC_VECTOR(2 downto 0);
  signal ROM_ADDRESS : STD_LOGIC_VECTOR(9 downto 0);
  signal ROM_DATA    : STD_LOGIC_VECTOR(7 downto 0);
  signal INTENSITY   : STD_LOGIC;

  -- Character ROM signals
  type rom_address_array is array (0 to CHAR_COUNT) of std_logic_vector(9 downto 0);
  --type rom_data_array is array (0 to CHAR_COUNT) of std_logic_vector(7 downto 0);
  type rom_data_array is array (0 to CHAR_COUNT) of std_logic_vector(7 downto 0);

  signal ROM_ADDRESS_ARR : rom_address_array;
  signal ROM_DATA_ARR    : rom_data_array;

  -- ASCII Character Mapping for "Sparring Wario"
  type char_array is array (0 to CHAR_COUNT) of std_logic_vector(6 downto 0);
  constant MESSAGE : char_array := (
    "0010011", -- S (0x13)
    "0010000", -- P (0x10, assuming uppercase mapping)
    "0000001", -- A (0x01)
    "0010010", -- R (0x12)
    "0010010", -- R (0x12)
    "0001001", -- I (0x09)
    "0001110", -- N (0x0E)
    "0000111", -- G (0x07)
    "0100000", -- Space
    "0010111", -- W (0x17)
    "0000001", -- A (0x01)
    "0010010", -- R (0x12)
    "0001001", -- I (0x09)
    "0001111" -- O (0x0F)
  );

  component rom1
    port (
      clka  : in  STD_LOGIC;
      addra : in  STD_LOGIC_VECTOR(9 downto 0);
      douta : out STD_LOGIC_VECTOR(7 downto 0)
    );
  end component;

begin
  -- Character ROM Addressing
  CHAR_LOOP: for i in 0 to CHAR_COUNT generate
  begin
    ROM_ADDRESS_ARR(i) <= MESSAGE(i) & pixel_row;

    rom_inst: rom1
      port map (
        clka  => clk25,
        addra => ROM_ADDRESS_ARR(i),
        douta => ROM_DATA_ARR(i)
      );
  end generate;

  -- Pixel Row and Column Calculation
  pixel_row <= std_logic_vector(conv_unsigned((conv_integer(vcount) - CHAR_Y_POS) / SCALE mod 8, 3));

  -- Character rendering loop
  process (clk25)
  begin
    if rising_edge(clk25) then
      char_enable <= '0';
      char_data <= (others => '1'); -- Default off
      --char_data <= "111100001111";
      if vcount >= CHAR_Y_POS and vcount < (CHAR_Y_POS + CHAR_HEIGHT) then
        -- Iterate through each character
        for i in 0 to CHAR_COUNT loop
          pixel_col <= std_logic_vector(conv_unsigned((conv_integer(hcount) - (CHAR_X_BASE + i * CHAR_SPACING)) / SCALE mod 8,3));

          if hcount >= (CHAR_X_BASE + i * CHAR_SPACING) and
             hcount < (CHAR_X_BASE + i * CHAR_SPACING) + CHAR_WIDTH then
            char_enable <= '1';
            --char_data <= ROM_DATA_ARR(i)(conv_integer(pixel_col)); -- Assign pixel intensity
            --char_data <= (others => ROM_DATA_ARR(i)(conv_integer(pixel_col)));
            if ROM_DATA_ARR(i)(conv_integer(pixel_col)) = '1' then
              char_data <= "111011101000"; -- Character color
            else
              char_data <= "001100110010";
            end if;

          end if;
        end loop;
      end if;
    end if;
  end process;

end architecture;
