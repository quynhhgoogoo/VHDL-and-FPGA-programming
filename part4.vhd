-- Display five characters HELLO on a 7 segment display
-- Input : c1,c2,c0 as SW2, SW1, SW0
-- Output : displayed segment : HEX0(0), HEX0(1),...HEX0(6)

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part4 IS
	PORT(SW: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		  LEDR: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		  HEX0: OUT STD_LOGIC_VECTOR(0 TO 6));	--7 segment displayed
END part4;

ARCHITECTURE Structure OF part4 IS
	SIGNAL C : STD_LOGIC_VECTOR(2 DOWNTO 0);	--c2c1c0
BEGIN
	LEDR <= SW;
	C(2 DOWNTO 0) <= SW(2 DOWNTO 0);		--assign c2c1c0 to SW2,SW1,SW0
	
	--Display function table
	--		H6		H5		H4		H3		H2		H1		H0
	--H	0		0		0		1		0		0		1
	--E	0		0		0		0		1		1		0
	--L	1		0		0		0		1		1		1
	--O	1		0		0		0		0		0		0
	
--	HEX0(0) <= NOT((C(2) AND C(1) AND NOT (C(0))) OR (C(2) AND NOT (C(1)) AND NOT(C(0))));
--	HEX0(1) <= NOT((C(2) AND C(1) AND C(0)) OR (C(2) AND NOT (C(1)) AND NOT (C(0))));
--	HEX0(2) <= NOT((C(2) AND C(1) AND C(0)) OR (C(2) AND NOT (C(1)) AND NOT (C(0))));
--	HEX0(3) <= NOT((C(2) AND C(1) AND NOT (C(0))) OR (C(2) AND NOT (C(1)) AND C(0)) OR (C(2) AND NOT (C(1)) AND NOT (C(0))));
--	HEX0(4) <= NOT(C(2));
--	HEX0(5) <= NOT(C(2));
--	HEX0(6) <= NOT((C(2) AND C(1) AND C(0)) OR (C(2) AND C(1) AND NOT (C(0))));

	HEX0(0) <= NOT((NOT(C(2)) AND NOT(C(1)) AND C(0)) OR (NOT(C(2)) AND C(1) AND C(0)));
	HEX0(1) <= NOT((NOT(C(2)) AND NOT(C(1)) AND NOT(C(0))) OR (NOT(C(2)) AND C(1) AND C(0)));
	HEX0(2) <= NOT((NOT(C(2)) AND NOT(C(1)) AND NOT(C(0))) OR (NOT(C(2)) AND C(1) AND C(0)));
	HEX0(3) <= NOT((NOT(C(2)) AND NOT(C(1)) AND C(0)) OR (NOT(C(2)) AND C(1) AND NOT(C(0))) OR (NOT(C(2)) AND C(1) AND C(0)));
	HEX0(4) <= C(2);
	HEX0(5) <= C(2);
	HEX0(6) <= NOT((NOT(C(2)) AND NOT (C(1)) AND NOT(C(0))) OR (NOT(C(2)) AND NOT(C(1)) AND C(0)));

END Structure;