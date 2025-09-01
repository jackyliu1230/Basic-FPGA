-----------------------------------------------------------
--
-- ECE441/ECE543 Lab 2
--
-- Heirarchical design of 4x4 array multiplier
--
-- (c)2022 Dr. D. Capson    Dept. of ECE
--                          University of Victoria
--
-----------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity oneRow is
   
port (  Bin,SUMin        : in  std_logic_vector (7 downto 0);
        Bout,SUMout      : out std_logic_vector (7 downto 0);
        Ain,Cin          : in std_logic; 
        Cout        : out std_logic
        );  
end oneRow;

architecture structure of oneRow is

-- our intermediate signals

  signal A1,A2,A3,A4,A5,A6,A7,A8   :  std_logic;
  signal C1,C2,C3,C4,C5,C6,C7,C8 :  std_logic;

begin
    
-- instantiate 4 cells (refer to fig of 4x4 array)
-- numbered from right to left

Cell0: entity work.multCell port map(
 
 Ain=>Ain, Bin=>Bin(0), Cin=>Cin, SUMin=> SUMin(0),
 Aout=>A1, Bout=>Bout(0), Cout=>C1, SUMout=>SUMout(0) );

Cell1: entity work.multCell port map(
 
 Ain=>A1, Bin=>Bin(1), Cin=>C1, SUMin=>SUMin(1),
 Aout=>A2, Bout=>Bout(1), Cout=>C2, SUMout=>SUMout(1) );

Cell2: entity work.multCell port map(
 
 Ain=>A2, Bin=>Bin(2), Cin=>C2, SUMin=>SUMin(2),
 Aout=>A3, Bout=>Bout(2), Cout=>C3, SUMout=>SUMout(2) );

Cell3: entity work.multCell port map(
 
 Ain=>A3, Bin=>Bin(3), Cin=>C3, SUMin=>SUMin(3),
 Aout=>A4, Bout=>Bout(3), Cout=>C4, SUMout=>SUMout(3) );
 
 Cell4: entity work.multCell port map(
 
 Ain=>A4, Bin=>Bin(4), Cin=>C4, SUMin=>SUMin(4),
 Aout=>A5, Bout=>Bout(4), Cout=>C5, SUMout=>SUMout(4) );
 
 Cell5: entity work.multCell port map(
 
 Ain=>A5, Bin=>Bin(5), Cin=>C5, SUMin=>SUMin(5),
 Aout=>A6, Bout=>Bout(5), Cout=>C6, SUMout=>SUMout(5) );
 
 Cell6: entity work.multCell port map(
 
 Ain=>A6, Bin=>Bin(6), Cin=>C6, SUMin=>SUMin(6),
 Aout=>A7, Bout=>Bout(6), Cout=>C7, SUMout=>SUMout(6) );
 
 Cell7: entity work.multCell port map(
 
 Ain=>A7, Bin=>Bin(7), Cin=>C7, SUMin=>SUMin(7),
 Aout=>A8, Bout=>Bout(7), Cout=>C8, SUMout=>SUMout(7) );

Cout <= C8;

end architecture structure;