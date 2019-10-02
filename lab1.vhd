LIBRARY ieee;
USE ieee.std_logic_1164.all;

--simple module that connects the SW switches to the LEDR light
--SW is input, SW is assigned from SW17 to SW0
--LEDR is output, LEDR is assigned from LEDR17 to LEDR0

ENTITY lab1 IS
	PORT(SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		LEDR : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)); 
END lab1;

ARCHITECTURE Behaviour OF lab1 IS
BEGIN
	LEDR <= SW;	--SW is assigned to LEDR, if SW is on then LEDR is ON
END Behaviour;