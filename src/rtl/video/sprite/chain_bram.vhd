----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Aeron Lahoylahoy
-- 
-- Create Date: 03/17/2025 
-- Design Name: 
-- Module Name: chain_bram - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- This module manages the retrieval of sprite data
-- from BRAM based on the current sprite selection. It supports
-- multiple sprite types, including chain links and ball animations.
-- The module reads pixel data from ROM using an address input.
-- 
-- Dependencies: 
-- Requires predefined ROM packages containing sprite data.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

  -- Chain link package
  use work.package_links.all;

  -- Ball packages
  use work.package_ball.all;
  use work.package_ball_pink.all;
  use work.package_ball_red.all;
  use work.package_ball_punch_1.all;
  use work.package_ball_punch_2.all;
  use work.package_ball_punch_3.all;

entity chain_bram is
  port (
    clk            : in  std_logic;
    current_sprite : in  integer range 0 to 6;
    addr           : in  unsigned(8 downto 0);         -- Address (6 bits for 64x64 pixels)
    data_out       : out std_logic_vector(15 downto 0) -- 12-bit R4G4B4 pixel data
  );
end entity;

architecture Behavioral of chain_bram is

begin
  process (clk)
  begin
    if rising_edge(clk) then
      case current_sprite is
      -- chain links are 10x10 images
        when 0 => data_out <= link_bitmap(to_integer(addr) mod 100); -- Read from ROM

        -- ball packages are 20x20 pixel large
        when 1 => data_out <= ball(to_integer(addr) mod 400); -- Read from ROM
        when 2 => data_out <= ball_red(to_integer(addr) mod 400);
        when 3 => data_out <= ball_pink(to_integer(addr) mod 400);
        when 4 => data_out <= ball_punch_1(to_integer(addr) mod 400);
        when 5 => data_out <= ball_punch_2(to_integer(addr) mod 400);
        when 6 => data_out <= ball_punch_3(to_integer(addr) mod 400);
      end case;
    end if;

  end process;
end architecture;
