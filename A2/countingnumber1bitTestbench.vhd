-------------------------------------------------------------------------------------
-- Author: <Cheuk Ki Liu><V00937822>
-- Contact info: <cheukkiliu@uvic.ca>
--
--Acknowledgements: this code is based in part on website 
--https://vhdlguru.blogspot.com/2017/10/count-number-of-1s-in-binary-number.html
--
-- Module Name: Count the number of 1's in a Binary number - testbech
--
-- Description: Assignment#2 question 8
--
-- Course: ECE 441/ ECE543
-- Department of Electrical and Computer Engineering
-- University of Victoria
--
-- Date: June 23, 2023
--
-- Notes: Inputs: load data given to count 1's
--        Outputs: count integer number     
-------------------------------------------------------------------------------------
 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;        
			

entity countingbit_testbench is
end countingbit_testbench;

architecture simulate of countingbit_testbench is
	
	--signal clk: std_logic;
	signal load: std_logic_vector (7 downto 0);
	signal Count: integer range 0 to 4; 
	
	

begin

uut : entity work.countingbit port map( load => load (7 downto 0), Count=>Count);



-- start for simulations
stimulation_start: process
begin    
    load <= "00000000"; 
    wait for 10 ns;
    load <= "10100100"; 
    wait for 10 ns;
    load <= "10101100";
    wait for 10 ns;
    load <= "11111111";
    wait for 10 ns;
   
end process;

end simulate;