-------------------------------------------------------------------------------------
-- Author: <Cheuk Ki Liu><V00937822>
-- Contact info: <cheukkiliu@uvic.ca>
--
--Acknowledgements: this code is based in part on website 
--https://www.ece.uvic.ca/~capson/ece441/
--
-- Module Name: 2-to-4 decoder with an enable signal (en) - Behavioral
--
-- Description: Assignment#1 question 11 a
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
 
library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------

entity decoder24 is

port(
    a:	in std_logic_vector(1 downto 0);
	en: in std_logic ;
	b:  out std_logic_vector (3 downto 0)
	);
end decoder24;


architecture behavioural of decoder24 is

begin 
    process(a,en)
    begin
         
    if ( a="00" and en ='1') then
         b <= "0001";
    elsif ( a="01" and en ='1') then
         b <= "0010";
    elsif ( a="10" and en ='1') then
         b <= "0100";
    elsif ( a="11" and en ='1') then
         b <= "1000";
    else 
         b <= "0000";
         end if;
         end process;

   
end behavioural;