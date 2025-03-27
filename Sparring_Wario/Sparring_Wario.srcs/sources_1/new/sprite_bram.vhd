----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2025 01:46:01 AM
-- Design Name: 
-- Module Name: sprite_bram - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--   This module implements a sprite BRAM (Block RAM) system that stores different 
--   sprite animations. It allows selecting among various animation frames and 
--   retrieves pixel data from the corresponding sprite.
-- 
--   The module supports multiple animations, including idle, punching, jumping, 
--   falling, rolling, and end-game poses. Each sprite is stored in BRAM and 
--   accessed using an address input.
-- 
-- Dependencies: 
--   - Requires predefined sprite packages containing pixel data.
--   - Uses a system clock for synchronous access.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--   - Address is a 15-bit unsigned value to access pixel data.
--   - Output data is a 16-bit R4G4B4 color value.
-- 
----------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

  -- IDLE animation
  use work.package_idle_1.all;
  use work.package_idle_2.all;

  -- Punching animation
  use work.package_punch.all;

  -- Jumping/Uppercut animation
  use work.package_jump_1.all;
  use work.package_jump_2.all;

  -- Fall animation
  use work.package_fall.all;

  -- ROLL animation
  use work.package_roll.all;

  -- End Game Pose Animation
  use work.package_end_pos_1.all;
  use work.package_end_pos_2.all;

entity sprite_bram is
  port (
    clk            : in  std_logic;
    current_sprite : in  integer range 0 to 8;
    addr           : in  unsigned(14 downto 0);    -- Address (12 bits for 4086 pixels)
    data_out       : out std_logic_vector(15 downto 0) -- 12-bit R4G4B4 pixel data
  );
end entity;

architecture Behavioral of sprite_bram is
begin
  process (clk)
  begin
    if rising_edge(clk) then
      case current_sprite is
        when 0 => data_out <= idle_1(to_integer(addr) mod 2500); -- add wrap so that it doesnt access out of bound pixels
        when 1 => data_out <= idle_2(to_integer(addr) mod 2500);
        when 2 => data_out <= punch(to_integer(addr) mod 2500);
        when 3 => data_out <= jump_1(to_integer(addr) mod 2500);
        when 4 => data_out <= jump_2(to_integer(addr) mod 2500);
        when 5 => data_out <= end_pos_1(to_integer(addr) mod 2500);
        when 6 => data_out <= end_pos_2(to_integer(addr) mod 2500);
        when 7 => data_out <= fall(to_integer(addr) mod 2500);
        when 8 => data_out <= roll(to_integer(addr) mod 2500);
      end case;
    end if;
  end process;
end architecture;
