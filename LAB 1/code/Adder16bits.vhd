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

entity Adder16bits is
generic(
    n_bit : integer := 16
    ); --16bit 0 to 15
port (
        A,B  : in std_logic_vector (n_bit - 1 downto 0);
        S    : out std_logic_vector (n_bit - 1 downto 0);
        Cin  : in std_logic;        
        Cout : out std_logic                 
	);  
end Adder16bits;

architecture RCA of Adder16bits is

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
signal temp: std_logic_vector (17 downto 0); -- 16 bit
begin
temp(0) <= Cin;

adder: for i in 0 to 15 generate --16bit

FA: FullAdder port map(x => A(i), y => B(i) , Cin => temp(i), sum => S(i), Cout => temp(i+1));



end generate adder;
Cout <= temp(16);
end architecture RCA;