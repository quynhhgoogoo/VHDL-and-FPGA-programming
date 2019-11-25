-- Display digits from 0 to 9 on 7-segment displays
-- HEX3 : SW15-12				HEX2 : SW11-8
-- HEX1 : SW7-4					HEX0 : SW3-0
-- 1010 to 1111 : dont care

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part6 IS
	PORT (SW : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			LEDR : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			HEX3, HEX2, HEX1, HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6));	--7 segments displayed on screen
END part6;

-- Table 1:
--   			0		1		2		3		4		5		6		7		8		9 
-- H0			0		1		0		0		1		0		0		1		0		0
-- H1			0		0		0		0		0		1		1		1		0		0
-- H2			0		0		1		0		0		0		0		1		0		0
-- H3			0		1		0		0		1		0		0		0		0		0
-- H4			0		1		0		1		1		0		0		0		0		1
-- H5			0		1		1		1		0		0		1		0		0		0
-- H6			1		1		0		0		0		1		1		0		0		0

-- Table 2:
-- c3c2c1c0			HEX
-- 0000				0
-- 0001				1
-- 0010				2
-- 0011				3
-- 0100				4
-- 0101				5
-- 0110				6
-- 0111				7
-- 1000				8
-- 1001				9

ARCHITECTURE Structure OF part6 IS
SIGNAL c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15: STD_LOGIC;

BEGIN
	c0<=SW(0);
	c1<=SW(1);
	c2<=SW(2);
	c3<=SW(3);
	c4<=SW(4);
	c5<=SW(5);
	c6<=SW(6);
	c7<=SW(7);
	c8<=SW(8);
	c9<=SW(9);
	c10<=SW(10);
	c11<=SW(11);
	c12<=SW(12);
	c13<=SW(13);
	c14<=SW(14);
	c15<=SW(15);

	PROCESS(c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15)
	BEGIN
		LEDR <= SW;
	
		HEX0(0)<=(NOT (c3) AND NOT(c2) AND NOT(c1) AND (c0)) OR (NOT(c3) AND (c2) AND NOT(c1) AND NOT(c0));
		HEX0(1)<=(NOT(c3) AND (c2) AND NOT(c1) AND (c0)) OR (NOT(c3) AND (c2) AND (c1) AND NOT(c0));
		HEX0(2)<=(NOT(c3) AND NOT(c2) AND(c1) AND NOT(c0));
		HEX0(3)<=(NOT(c3) AND NOT(c2) AND NOT(c1) AND (c0))OR (NOT(c3) AND (c2) AND NOT(c1) AND NOT(c0))OR(NOT(c3) AND (c2) AND (c1) AND (c0));
		HEX0(4)<=((NOT(c3) AND NOT(c2) AND NOT(c1) AND(c0))OR (NOT(c3) AND NOT(c2) AND (c1) AND (c0)) OR (NOT(c3) AND (c2) AND NOT(c1) AND (c0))OR(NOT(c3) AND (c2) AND (c1) AND (c0))OR((c3)AND NOT(c2) AND NOT(c1) AND (c0))or(NOT(c3)and(c2)and not(c1)and not(c0)));
		HEX0(5)<=((NOT(c3) AND NOT(c2) AND NOT(c1) AND (c0))OR(NOT(c3) AND NOT(c2) AND (c1) AND (c0))OR (NOT(c3) AND NOT(c2) AND (c1) AND NOT(c0)) OR(NOT(c3) AND(c2 ) AND(c1) AND(c0)));
		HEX0(6)<=((NOT(c3) AND NOT(c2) AND NOT(c1) AND NOT(c0))OR(NOT(c3) AND NOT(c2) AND NOT(c1) AND(c0))OR(NOT(c3) AND (c2) AND (c1) AND (c0)));
						
		HEX1(0)<=(NOT (c7) AND NOT(c6) AND NOT(c5) AND (c4)) OR (NOT(c7) AND (c6) AND NOT(c5) AND NOT(c4));
		HEX1(1)<=(NOT(c7) AND (c6) AND NOT(c5) AND (c4)) OR (NOT(c7) AND (c6) AND (c5) AND NOT(c4));
		HEX1(2)<=(NOT(c7) AND NOT(c6) AND(c5) AND NOT(c4));
		HEX1(3)<=(NOT(c7) AND NOT(c6) AND NOT(c5) AND (c4))OR (NOT(c7) AND (c6) AND NOT(c5) AND NOT(c4))OR(NOT(c7) AND (c6) AND (c5) AND (c4));
		HEX1(4)<=((NOT(c7) AND NOT(c6) AND NOT(c5) AND(c4))OR (NOT(c7) AND NOT(c6) AND (c5) AND (c4)) OR (NOT(c7) AND (c6) AND NOT(c5) AND (c4))OR(NOT(c7) AND (c6) AND (c5) AND (c4))OR((c7)AND NOT(c6) AND NOT(c5) AND (c4))or(NOT(c7)and(c6)and not(c5)and not(c4)));
		HEX1(5)<=((NOT(c7) AND NOT(c6) AND NOT(c5) AND (c4))OR(NOT(c7) AND NOT(c6) AND (c5) AND (c4))OR (NOT(c7) AND NOT(c6) AND (c5) AND NOT(c4)) OR(NOT(c7) AND(c6 ) AND(c5) AND(c4)));
		HEX1(6)<=((NOT(c7) AND NOT(c6) AND NOT(c5) AND NOT(c4))OR(NOT(c7) AND NOT(c6) AND NOT(c5) AND(c4))OR(NOT(c7) AND (c6) AND (c5) AND (c4)));
			
		HEX2(0)<=(NOT (c11) AND NOT(c10) AND NOT(c9) AND (c8)) OR (NOT(c11) AND (c10) AND NOT(c9) AND NOT(c8));
		HEX2(1)<=(NOT(c11) AND (c10) AND NOT(c9) AND (c8)) OR (NOT(c11) AND (c10) AND (c9) AND NOT(c8));
		HEX2(2)<=(NOT(c11) AND NOT(c10) AND(c9) AND NOT(c8));
		HEX2(3)<=(NOT(c11) AND NOT(c10) AND NOT(c9) AND (c8))OR (NOT(c11) AND (c10) AND NOT(c9) AND NOT(c8))OR(NOT(c11) AND (c10) AND (c9) AND (c8));
		HEX2(4)<=((NOT(c11) AND NOT(c10) AND NOT(c9) AND(c8))OR (NOT(c11) AND NOT(c10) AND (c9) AND (c8)) OR (NOT(c11) AND (c10) AND NOT(c9) AND (c8))OR(NOT(c11) AND (c10) AND (c9) AND (c8))OR((c11)AND NOT(c10) AND NOT(c9) AND (c8))or(NOT(c11)and(c10)and not(c9)and not(c8)));
		HEX2(5)<=((NOT(c11) AND NOT(c10) AND NOT(c9) AND (c8))OR(NOT(c11) AND NOT(c10) AND (c9) AND (c8))OR (NOT(c11) AND NOT(c10) AND (c9) AND NOT(c8)) OR(NOT(c11) AND(c10) AND(c9) AND(c8)));
		HEX2(6)<=((NOT(c11) AND NOT(c10) AND NOT(c9) AND NOT(c8))OR(NOT(c11) AND NOT(c10) AND NOT(c9) AND(c8))OR(NOT(c11) AND (c10) AND (c9) AND (c8)));
						
		HEX3(0)<=(NOT (c15) AND NOT(c14) AND NOT(c13) AND (c12)) OR (NOT(c15) AND (c14) AND NOT(c13) AND NOT(c12));
		HEX3(1)<=(NOT(c15) AND (c14) AND NOT(c13) AND (c12)) OR (NOT(c15) AND (c14) AND (c13) AND NOT(c12));
		HEX3(2)<=(NOT(c15) AND NOT(c14) AND(c13) AND NOT(c12));
		HEX3(3)<=(NOT(c15) AND NOT(c14) AND NOT(c13) AND (c12))OR (NOT(c15) AND (c14) AND NOT(c13) AND NOT(c12))OR(NOT(c15) AND (c14) AND (c13) AND (c12));
		HEX3(4)<=((NOT(c15) AND NOT(c14) AND NOT(c13) AND(c12))OR (NOT(c15) AND NOT(c14) AND (c13) AND (c12)) OR (NOT(c15) AND (c14) AND NOT(c13) AND (c12))OR(NOT(c15) AND (c14) AND (c13) AND (c12))OR((c15)AND NOT(c14) AND NOT(c13) AND (c12))or(NOT(c15)and(c14)and not(c13)and not(c12)));
		HEX3(5)<=((NOT(c15) AND NOT(c14) AND NOT(c13) AND (c12))OR(NOT(c15) AND NOT(c14) AND (c13) AND (c12))OR (NOT(c15) AND NOT(c14) AND (c13) AND NOT(c12)) OR(NOT(c15) AND(c14) AND(c13) AND(c12)));
		HEX3(6)<=((NOT(c15) AND NOT(c14) AND NOT(c13) AND NOT(c12))OR(NOT(c15) AND NOT(c14) AND NOT(c13) AND(c12))OR(NOT(c15) AND (c14) AND (c13) AND (c12)));

	END PROCESS;
END Structure;
