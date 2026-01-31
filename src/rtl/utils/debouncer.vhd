----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Aeron Lahoylahoy
-- 
-- Create Date: 02/21/2025 01:46:01 AM
-- Design Name: Debouncer Module
-- Module Name: debouncer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--   This module implements a simple debouncing mechanism for a push-button
--   input signal. It waits for four clock cycles before confirming the
--   button press and setting the output signal. This helps eliminate
--   spurious transitions caused by mechanical bouncing of the button.
-- 
-- Dependencies: 
--   - Requires a stable system clock for operation.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.std_logic_unsigned.all;


entity debouncer is
  port (
    btn_in  : in  STD_LOGIC;
    clk     : in  STD_LOGIC;
    reset   : in  STD_LOGIC;
    btn_out : out STD_LOGIC
  );

end entity;

architecture Behavioral of debouncer is

signal state: std_logic_vector(1 downto 0) := "00";
signal temp_d: std_logic := '0';

begin
    -- ==================================================================
    -- Debouncing Process
    --
    -- Description:
    -- This process checks for a stable button press over four clock cycles
    -- before setting the output. The state machine transitions through four 
    -- states before confirming a press, ensuring that short glitches or 
    -- mechanical bounces do not trigger unwanted button presses.
    --
    -- ==================================================================
    process(btn_in, clk)
    begin
     if(clk'event and rising_edge(clk)) then     --Waiting for four clock cycles then confirming button press
         case state is
            when "00" => 
                if (btn_in = '1') then      --moves to next state once button press is confirmed
                    temp_d <= '0';
                    state <= "01";
                else
                    temp_d <= '0';
                    state <= "00";
                end if;
            when "01" =>
                if (btn_in = '1') then
                    temp_d <= '0';
                    state <= "10";
                else                        --if button isn't detected anymore then reset
                    temp_d <= '0';
                    state <= "00";
                end if;
            when "10" =>
                if (btn_in = '1') then
                    temp_d <= '0';
                    state <= "11";
                else
                    temp_d <= '0';
                    state <= "00";
                end if;
            when "11" =>
                if (btn_in = '1') then
                    temp_d <= '1';
                    state <= "00";
                else
                    temp_d <= '0';
                    state <= "00";
                end if;
            when others =>
                state <= "00";
         end case;
     end if;
    end process;

btn_out <= temp_d;
end architecture;
