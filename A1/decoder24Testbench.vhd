-------------------------------------------------------------------------------------
-- Author: <Cheuk Ki Liu><V00937822>
-- Contact info: <cheukkiliu@uvic.ca>
--
--Acknowledgements: this code is based in part on website 
--https://www.ece.uvic.ca/~capson/ece441/
--
-- Module Name: 2-to-4 decoder with an enable signal (en) - testbench
--
-- Description: Assignment#1 question 11 b
--
-- Course: ECE 441/ ECE543
-- Department of Electrical and Computer Engineering
-- University of Victoria
--
-- Date: May 20, 2023
--
-- Notes: Inputs are 2 bit of a and enable
--        Outputs are 4 bit signals: b
--        When en is '1', the decoder operates as usual.
-- 		  When en is '0', the decoder is disabled and the output is "0000".
-------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;        --  NOTE:  we need this additional library to do the type conversions in the "for" loop below
			

entity decoder24_testbench is
end decoder24_testbench;

architecture simulate of decoder24_testbench is

	signal input_test_pattern: std_logic_vector (2 downto 0);

	signal b: std_logic_vector (3 downto 0);

begin

uut : entity work.decoder24 port map(a=>input_test_pattern(1 downto 0), en=>input_test_pattern(2),b => b);



process 
begin

	for i in 0 to 7 loop  -- by default, the range 0 to 7 makes "i" an integer
	
	   input_test_pattern <= std_logic_vector(to_unsigned(i, 3));
	   wait for 1 ns;

	end loop; 

--	wait;

end process;

end simulate;