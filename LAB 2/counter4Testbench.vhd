-------------------------------------------------------------------------------------
-- Author: <Cheuk Ki Liu><V00937822>
-- Contact info: <cheukkiliu@uvic.ca>
--
--Acknowledgements: this code is based in part on website 
--https://www.fpga4student.com/2017/06/vhdl-code-for-counters-with-testbench.html
--
-- Module Name: 4 bit counter - testbench
--
-- Description: Assignment#1 question 12
--
-- Course: ECE 441/ ECE543
-- Department of Electrical and Computer Engineering
-- University of Victoria
--
-- Date: May 20, 2023
--
-- Notes: Inputs are 2 bit of clock and set/reset
--        Outputs are 4 bit signals: q
--        4 bit counter counts from 3 ("0011") to 12 ("1100")
-------------------------------------------------------------------------------------
 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;        
			

entity mult4x4_testbench is
end mult4x4_testbench;

architecture simulate of mult4x4_testbench is

	signal clk: std_logic;
	signal   a: std_logic;
	signal q: std_logic_vector (3 downto 0);

begin

uut : entity work.mult4x4 port map(a => a, clk=>clk, q=>q);

-- start the clock from 0 to 1
clock_start :process
begin
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
end process;


-- start for simulations
stimulation_start: process
begin    

   -- hold reset state for 20 ns. and start for 420 ns and loop for a cycle
    a <= '1';
   wait for 20 ns;    
    a <= '0';
   wait for 420 ns;
    a<= '1';
    wait for 20 ns;
    a <= '0';
    wait;
end process;

end simulate;