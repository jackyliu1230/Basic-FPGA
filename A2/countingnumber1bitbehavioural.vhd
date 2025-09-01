-------------------------------------------------------------------------------------
-- Author: <Cheuk Ki Liu><V00937822>
-- Contact info: <cheukkiliu@uvic.ca>
--
--Acknowledgements: this code is based in part on website 
--https://vhdlguru.blogspot.com/2017/10/count-number-of-1s-in-binary-number.html
--
-- Module Name: Count the number of 1's in a Binary number - Behavioral
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
 
library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
---------------------------------------------------

entity countingbit is

port(
    load: in std_logic_vector (7 downto 0); --assume the value need to check is in 7 bit
    Count:  out integer range 0 to 4 
	);
end countingbit;


architecture behavioural of countingbit is


begin 

    process (load)
    variable  temp: integer range 0 to 4;-- make a counter to another variable to save the output value

    begin
    temp := 0;
        for i in 0 to 7 loop
        if (load(i) = '1') then 
            temp := temp + 1;
            else 
            temp := temp;
        end if;
       end loop;
       
       Count <= temp;
    end process;

 end behavioural;