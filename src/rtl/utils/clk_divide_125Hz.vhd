----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/16/2025 06:44:11 PM
-- Design Name: 
-- Module Name: clk_divide_125Hz - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--    This module generates a 125Hz clock signal by dividing the input clock.
--    The counter increments on each rising edge of the input clock until it 
--    reaches a predefined count, at which point it toggles the output clock.
--
-- Inputs:
--    - clk   : Input clock signal.
--    - reset : Active-high reset signal.
--
-- Outputs:
--    - clkout : Divided clock output at 125Hz.
--
-- Dependencies: 
--    - None.
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--    - Assumes an input clock frequency of 25 MHz.
--    - Uses a 20-bit counter to achieve the required division.
-- 
----------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.std_logic_unsigned.all;

entity clk_divide_125Hz is
  port (
    clk    : in  STD_LOGIC;
    reset  : in  STD_LOGIC;
    clkout : out STD_LOGIC
  );

end entity;

architecture Behavioral of clk_divide_125Hz is

  signal count    : std_logic_vector(19 downto 0); -- 20 bits
  signal clk_temp : std_logic;

begin
  process (clk, reset)
  begin
    if (reset = '1') then
      count <= "00000000000000000000";
      clk_temp <= '0';
    elsif (clk'event and rising_edge(clk)) then
      if (count = 200000) then
        count <= "00000000000000000000";
        clk_temp <= not clk_temp;
      else
        count <= count + 1;
        clk_temp <= clk_temp;
      end if;
    end if;
  end process;

  clkout <= clk_temp;

end architecture;
