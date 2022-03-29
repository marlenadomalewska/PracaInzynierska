--------------------------------------------------------------------------------
--
--   FileName:         hw_image_generator.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 64-bit Version 12.1 Build 177 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 05/10/2013 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY image_generator IS
		PORT(
		disp_ena		:	IN		STD_LOGIC;	--'1' = wyświetlanie, '0' = wygaszanie
		column			:	IN		INTEGER;		--pozycja piksela w rzędzie
		row		:	IN		INTEGER;		--pozycja piksela w kolumnie
		
		code : IN STD_LOGIC_VECTOR(7 downto 0);

		red			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --kolor czerwony 
		green			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --kolor zielony
		blue			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')); --kolor niebieski
END image_generator;

ARCHITECTURE behavior OF image_generator IS

	component letter2screen is
	port(
	row, column : in INTEGER;
	letter : in std_logic_vector(7 downto 0);
	red, green, blue : out std_logic_vector(7 downto 0));
	end component letter2screen;

signal r,g,b : std_LOGIC_VECTOR(7 downto 0);

begin
p: letter2screen port map(row, column, code, r, g, b);
	PROCESS(disp_ena, row, column)
	BEGIN

		IF(disp_ena = '1') THEN		--wyświetlanie
			red <= r;
			green <= g;
			blue <= b;
		ELSE								--wygaszanie
			red <= (OTHERS => '0');
			green <= (OTHERS => '0');
			blue <= (OTHERS => '0');
		END IF;
	
	END PROCESS;
END behavior;