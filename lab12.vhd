-- Implements eight 2-to-1 multiplexer
-- inputs : X (SW 7-0 - 8 bits), Y(SW 15-8)
--				S(SW17) switches between X and Y
-- outputs : LEDR 17-0 shows the state of switches
--				 LEDG 7-0 shows the outputs of multiplexer

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part2 IS
	PORT(SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		  LEDR : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		  LEDG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); 
END part2;

ARCHITECTURE Behaviour OF part2 IS
	SIGNAL S : STD_LOGIC;
	SIGNAL M, X, Y : STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN

PROCESS(S,M,X,Y)
BEGIN
		S <= SW(17);
		X <= SW(7 DOWNTO 0);
		Y <= SW(15 DOWNTO 8);
	FOR I IN 0 TO 7 LOOP
		M(I) <= (NOT(S) AND X(I)) OR (S AND Y(I));
	END LOOP;
END PROCESS;
LEDG (7 DOWNTO 0) <= M;
END Behaviour;