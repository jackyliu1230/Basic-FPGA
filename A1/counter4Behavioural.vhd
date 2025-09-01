-------------------------------------------------------------------------------------
-- Author: <Cheuk Ki Liu><V00937822>
-- Contact info: <cheukkiliu@uvic.ca>
--
--Acknowledgements: this code is based in part on website 
--https://www.fpga4student.com/2017/06/vhdl-code-for-counters-with-testbench.html
--
-- Module Name: 4 bit counter - Behavioral
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
 
library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
---------------------------------------------------

entity counter4 is

port(
  clk:  in std_logic;  --clock
	a:  in std_logic ; -- reset
	q:  out std_logic_vector (3 downto 0) --output
	);
end counter4;


architecture behavioural of counter4 is
-- make a counter to another variable to save the output value
    signal count: std_logic_vector (3 downto 0);

begin 
    process(a,clk)
    begin 

    if ( a = '1') then
        count <= "0000";                    -- at the very beginnin
    elsif (clk'event and clk = '1') then    -- rising edge 
        count <= count + "1";
              if (count < "0011") then      --if count is less then 3  
                count <= "0011";            --it have to be 3 after next rising edge
            elsif (count >= "1100") then     --if count is greater then 12
        count <= "0011";                    --it have to be 3 after next rising edge
       end if;
      end if;
    end process;
    q <= count; 
 end behavioural;