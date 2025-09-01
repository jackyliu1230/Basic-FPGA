-------------------------------------------------------------------------------------
-- Author: <Cheuk Ki Liu><V00937822>
--		   <Dengyao Hou><V00973596>
-- Contact info: <cheukkiliu@uvic.ca>
--				 <dengyaohou@uvic.ca>
--Acknowledgements: this code is based in part on website 
--https://www.ece.uvic.ca/~capson/ece441/
--https://vhdlguru.blogspot.com/2013/08/vhdl-code-for-wallace-tree.html
-- Module Name: 5x5 bit Wallace Tree Multiplier
--
-- Description: LAB 2 PROGRAMMING ASSIGNMENT
--
-- Course: ECE 441/ ECE543
-- Department of Electrical and Computer Engineering
-- University of Victoria
--
-- Date: JUNE 14, 2023
--
-- Notes: 2 input (a and b binary vector)
--        1 output (prod)
--        
-------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Wallace5x5 is
    port ( A :    in  STD_LOGIC_VECTOR (4 downto 0);
           B :    in  STD_LOGIC_VECTOR (4 downto 0);
           P : out  STD_LOGIC_VECTOR (9 downto 0));
end Wallace5x5;

architecture structural of Wallace5x5 is

component FullAdder is
    port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           SUM : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

component HA is
    port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           S : out  STD_LOGIC;
           C : out  STD_LOGIC);
end component;

signal s11,s12,s13,s14,s15,s16,s22,s23,s24,s25,s26,s27,s32,s33,s34,s35,s36,s37,s44,s45,s46,s47,s48 : std_logic;
signal c11,c12,c13,c14,c15,c16,c22,c23,c24,c25,c26,c27,c32,c33,c34,c35,c36,c37,c38,c44,c45,c46,c47,c48 : std_logic;
signal p0,p1,p2,p3,p4 : std_logic_vector(8 downto 0);

begin

process(A,B)


-- Stage 1 - generate the partial products
begin
    for i in 0 to 4 loop
        p0(i) <= A(i) and B(0);
        p1(i) <= A(i) and B(1);
        p2(i) <= A(i) and B(2);
        p3(i) <= A(i) and B(3);
		p4(i) <= A(i) and B(4);
    end loop;       
end process;


-- Stage 3 - final bits in the product    
P(0) <= p0(0);
P(1) <= s11;
P(2) <= s22;
P(3) <= s33;
P(4) <= s44;
P(5) <= s45;
P(6) <= s46;
P(7) <= s47;
P(8) <= s48;
P(9) <= c48;

-- note that all of the following port maps uses "positional port connections" rather than "explicit" connections which generally
-- makes code more readable - however in this case positional port connections is easier to follow!

-- Stage 2 - first iteration of compression
ha11 : HA port map(p0(1),p1(0),s11,c11);
fa12 : FullAdder port map(p0(2),p1(1),p2(0),s12,c12);
fa13 : FullAdder port map(p0(3),p1(2),p2(1),s13,c13);
fa14 : FullAdder port map(p0(4),p1(3),p2(2),s14,c14);
ha15 : HA port map(p1(4),p2(3),s15,c15);

-- Stage 2 - second iteration of compression
ha22 : HA port map(c11,s12,s22,c22);
fa23 : FullAdder port map(p3(0),c12,s13,s23,c23);
fa24 : FullAdder port map(p3(1),c13,s14,s24,c24); 
fa25 : FullAdder port map(p3(2),c24,s15,s25,c25);
fa26 : FullAdder port map(c15,p3(3),p2(4),s26,c26);

-- Stage 2 - third iteration of compression
ha33 : HA port map(c22,s23,s33,c33);  
fa34 : FullAdder port map(p4(0),c24,s24,s34,c34);
fa35 : FullAdder port map(p4(1),c23,s24,s35,c35); 
fa36 : FullAdder port map(p4(2),c24,s25,s36,c36);
fa37 : FullAdder port map(p4(3),p2(4),c26,s36,c37);

-- Stage 2 - fourth iteration of compression
ha44 : HA port map(c33,s34,s44,c44);
fa45 : FullAdder port map(s35,c34,c44,s45,c45); 
fa46 : FullAdder port map(s36,c35,c45,s46,c46); 
fa47 : FullAdder port map(s37,c36,c46,s47,c47); 
fa48 : FullAdder port map(p4(4),c37,c47,s48,c48); 

end structural;