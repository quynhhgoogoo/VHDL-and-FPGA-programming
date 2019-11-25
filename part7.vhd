-- convert a 4 bit binary V=v3v2v1v0 to two-digit decimal equivalent D=d1d0
-- input : four-bit V, four-bit M
-- output : z

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part7 IS
	PORT( SW : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			LEDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			HEX1, HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6));	--2 decimal digits
END part7;

ARCHITECTURE Structure OF part7 IS
	SIGNAL V : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
BEGIN
	V <= SW;
	
	PROCESS(SW)
	BEGIN
		LEDR <= SW;
	
		CASE SW IS
			-- when binary value = 0, display 00 on screen(HEX0, HEX1: H6 off)
			when "0000" => HEX0 <= "0000001";	HEX1 <= "0000001";					
			when "0001" => HEX0 <= "1001111";	HEX1 <= "0000001";
			when "0010" => HEX0 <= "0010010";	HEX1 <= "0000001";
			when "0011" => HEX0 <= "0000110";	HEX1 <= "0000001";
			when "0100" => HEX0 <= "1001100";	HEX1 <= "0000001";
			when "0101" => HEX0 <= "0100100";	HEX1 <= "0000001";
			when "0110" => HEX0 <= "0100000";	HEX1 <= "0000001";
			when "0111" => HEX0 <= "0001111";	HEX1 <= "0000001";
			when "1000" => HEX0 <= "0000000";	HEX1 <= "0000001";
			when "1001" => HEX0 <= "0000100";	HEX1 <= "0000001";
			when "1010" => HEX0 <= "0000001";	HEX1 <= "1001111";
			when "1011" => HEX0 <= "1001111";	HEX1 <= "1001111";
			when "1100" => HEX0 <= "0010010";	HEX1 <= "1001111";
			when "1101" => HEX0 <= "0000110";	HEX1 <= "1001111";
			when "1110" => HEX0 <= "1001100";	HEX1 <= "1001111";
			when "1111" => HEX0 <= "0100100";	HEX1 <= "1001111";
			when others => HEX0 <= "1111111";	HEX1 <= "1111111";

			END case;
	END PROCESS;
	
END Structure;