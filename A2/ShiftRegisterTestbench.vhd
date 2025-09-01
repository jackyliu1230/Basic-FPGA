-------------------------------------------------------------------------------------
-- Author: <Cheuk Ki Liu><V00937822>
-- Contact info: <cheukkiliu@uvic.ca>
--
--Acknowledgements: this code is based in part on website 
--https://www.ece.uvic.ca/~capson/ece441/
--
-- Module Name: 8-bit universal shift register - testbench
--
-- Description: Assignment#2 question 7
--
-- Course: ECE 441/ ECE543
-- Department of Electrical and Computer Engineering
-- University of Victoria
--
-- Date: June 23, 2023
--
-- Notes: Inputs: clock (clk), 3 bit Ctrl, 7 bit Load
--        Outputs are 7 bit signals: q
-------------------------------------------------------------------------------------
 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;        
			

entity ShiftRegister_testbench is
end ShiftRegister_testbench;

architecture simulate of ShiftRegister_testbench is
	
	signal clk: std_logic;
	signal Ctrl  : std_logic_vector (2 downto 0);
	signal load : std_logic_vector (7 downto 0);
	signal q: std_logic_vector (7 downto 0);

begin

uut : entity work.ShiftRegister port map(Ctrl => Ctrl (2 downto 0), clk => clk, q=>q(7 downto 0),load => load (7 downto 0));

-- start the clock from 0 to 1
clock_start :process
begin
     clk <= '0';
     wait for 1 ps;
     clk <= '1';
     wait for 1 ps;
end process;


-- start for simulations
stimulation_start: process
begin    

    load <= "10100100"; --can try different numbers
    for i in 0 to 7 loop
    
    Ctrl <= std_logic_vector (TO_UNSIGNED (i,3));
    wait for 2 ps;
    end loop;
   
end process;

end simulate;