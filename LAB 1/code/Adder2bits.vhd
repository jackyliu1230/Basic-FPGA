-----------------------------------------------------------
--
-- ECE441/ECE543 Lab 1
--
-- Heirarchical design of a 4-bit ripple carry adder (RCA)
--
-- (c)2022 Dr. D. Capson    Dept. of ECE
--                          University of Victoria
--
-----------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity Adder2bits is
port (
        A,B  : in std_logic_vector (1 downto 0);
        S    : out std_logic_vector (1 downto 0);
        Cin  : in std_logic;        
        Cout : out std_logic                 
	);  
end Adder2bits;

architecture RCA of Adder2bits is

component FullAdder is
    port (
          x    : in STD_LOGIC;
          y    : in STD_LOGIC;
          Cin  : in STD_LOGIC;
          sum  : out STD_LOGIC;
          Cout : out STD_LOGIC
          );
end component;        

 -- our intermediate signals (refer to logic circuit for FA Fig 4.9 of Mano&Ciletti)

signal C1: std_logic; 
signal C2: std_logic;
signal C3: std_logic;



begin
    
--  instantiate four FAs

FA0: FullAdder port map(x => A(0), y => B(0) , Cin => Cin, sum => S(0), Cout => C1);
FA1: FullAdder port map(x => A(1), y => B(1) , Cin => C1, sum => S(1), Cout => Cout);



end architecture RCA;