-------------------------------------------------------------------------------------
-- Author: <Cheuk Ki Liu><V00937822>
-- Contact info: <cheukkiliu@uvic.ca>
--
--Acknowledgements: this code is based in part on website 
--https://www.ece.uvic.ca/~capson/ece441/
--
-- Module Name: 8-bit universal shift register - Behavioral
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
 
library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
---------------------------------------------------

entity ShiftRegister is

port(
    clk:  in std_logic;  --clock
    Ctrl:  in std_logic_vector (2 downto 0) ; -- ctrl
    load: in std_logic_vector (7 downto 0); --load
	q:  out std_logic_vector (7 downto 0) --output
	);
end ShiftRegister;


architecture behavioural of ShiftRegister is
-- make a counter to another variable to save the output value
    signal temp: std_logic_vector (7 downto 0);

begin 
    process (Ctrl,clk)
    begin
    if (clk'event and clk = '1') then
        if (Ctrl = "000") then
        temp <= temp;
       --no op
        
        elsif (Ctrl = "001" ) then
        temp <= temp(6 downto 0)& '0'; --shif left
        
        elsif (Ctrl = "010") then
        temp <= '0' & temp(7 downto 1); --shift right
        
        elsif (Ctrl = "011") then
        temp <= load; --load external data
        
        elsif (Ctrl = "100") then
        temp <= temp(6 downto 0) & temp(7); --rotate left
        
        elsif (Ctrl = "101") then
        temp <= temp(0) & temp(7 downto 1); --rotate right
      
        elsif (Ctrl = "110") then
        temp <= temp(7)& temp(7 downto 1); --arithmetic shift right
        
        elsif (Ctrl = "111") then
        temp <= "00000000"; --Clear
        end if;
       end if;
   end process;
    q <= temp;
 end behavioural;