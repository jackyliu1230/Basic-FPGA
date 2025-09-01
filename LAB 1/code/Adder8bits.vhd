-------------------------------------------------------------------------------------
-- Author: <Cheuk Ki Liu><V00937822>
--		   <Dengyao Hou><V00973596>
-- Contact info: <cheukkiliu@uvic.ca>
--				 <dengyaohou@uvic.ca>
--Acknowledgements: this code is based in part on website 
--https://www.ece.uvic.ca/~capson/ece441/
--
-- Module Name: n bit adder
--
-- Description: LAB 1 PROGRAMMING ASSIGNMENT
--
-- Course: ECE 441/ ECE543
-- Department of Electrical and Computer Engineering
-- University of Victoria
--
-- Date: May 31, 2023
--
-- Notes: 3 input (a and b binary vector, Cin carry bit)
--        2 output (s: sum, Cout: carry out (next bit carry in bit))
--        
-------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity Adder8bits is
generic(
    n_bit : integer := 8    --if n = 16 change 8 to 16
    ); 
port (
        A,B  : in std_logic_vector (n_bit - 1 downto 0);
        S    : out std_logic_vector (n_bit - 1 downto 0);
        Cin  : in std_logic;        
        Cout : out std_logic                 
	);  
end Adder8bits;

architecture RCA of Adder8bits is

component FullAdder is
    port (
          x    : in STD_LOGIC;
          y    : in STD_LOGIC;
          Cin  : in STD_LOGIC;
          sum  : out STD_LOGIC;
          Cout : out STD_LOGIC
          );
end component;        


signal temp: std_logic_vector (8 downto 0); -- 8 bit cahnge it to 17 when n = 16
begin
temp(0) <= Cin;

adder: for i in 0 to 7 generate --8bit if 16 bit change 7 to 15

FA: FullAdder port map(x => A(i), y => B(i) , Cin => temp(i), sum => S(i), Cout => temp(i+1));



end generate adder;
Cout <= temp(7);
end architecture RCA;