-- Implement a 3-bit wide 5-to-1 multiplexer
-- Input: u, v, x, y (SW 14-0)
--			 SW17-15 represent a random group from u to y
-- Output: LEDR17-0 shows state of SW
--			  LECG 3-0 displays selected group

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part3 IS
	PORT(SW: IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			LEDR : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			LEDG : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END part3;

ARCHITECTURE Structure OF part3 IS
--	m1, m2 and m3 represents three outputs after each operation
	SIGNAL m0, m1, m2 : STD_LOGIC_VECTOR(1 TO 3);				-- 1st bit is LSB, 3rd bit is MSB
	SIGNAL S,U,V,W,X,Y,M :STD_LOGIC_VECTOR(2 DOWNTO 0);		-- 2nd bit is MSB, 0th bit is LSB
BEGIN
-- assign inputs to corresponding switches
-- there are 15 switches left for 5 inputs in total so each group is assigned with : 15/5 = 3 switches
	S(2 DOWNTO 0)<= SW(17 DOWNTO 15);		-- s0,s1,s2
	U <= SW(2 DOWNTO 0);
	V <= SW(5 DOWNTO 3);
	W <= SW(8 DOWNTO 6);
	X <= SW(11 DOWNTO 9);
	Y <= SW(14 DOWNTO 12);
	
	LEDR <= SW;
	
-- 5 to 1 multiplexer for bit 0
	m0(1) <= (NOT(S(0)) AND U(0)) OR (S(0) AND V(0));
	m0(2) <= (NOT(S(0)) AND W(0)) OR (S(0) AND X(0));
	m0(3) <= (NOT(S(1)) AND m0(1)) OR (S(1) AND m0(2));
	-- final output
	M(0) <= (NOT(S(2)) AND m0(3)) OR (S(2) AND Y(0));
	
-- 5 to 1 multiplexer for bit 1
	m1(1) <= (NOT(S(0)) AND U(1)) OR (S(0) AND V(1));
	m1(2) <= (NOT(S(0)) AND W(1)) OR (S(0) AND X(1));
	m1(3) <= (NOT(S(1)) AND m1(1)) OR (S(1) AND m1(2));
	-- final output
	M(1) <= (NOT(S(2)) AND m1(3)) OR (S(2) AND Y(1));
	
-- 5 to 1 multiplexer for bit 2
	m2(1) <= (NOT(S(0)) AND U(2)) OR (S(0) AND V(2));
	m2(2) <= (NOT(S(0)) AND W(2)) OR (S(0) AND X(2));
	m2(3) <= (NOT(S(1)) AND m2(1)) OR (S(1) AND m2(2));
	-- final output
	M(2) <= (NOT(S(2)) AND m2(3)) OR (S(2) AND Y(2));
	
	LEDG(2 DOWNTO 0) <= M;
	
END Structure;