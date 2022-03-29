--------------------------------------------------------------------------------
--
--   FileName:         vga_controller.vhd
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
--   Version 1.1 03/07/2018 Scott Larson
--     Corrected two minor "off-by-one" errors
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY vga_controller IS
	GENERIC(
		h_pulse 	:	INTEGER := 208;    	--szerokość impulsu synchronizacji poziomej w pikselach(px)
		h_bp	 	:	INTEGER := 336;		--szerokość poziomego tylnego przedsionka (px)
		h_pixels	:	INTEGER := 1920;		--szerokość poziomie
		h_fp	 	:	INTEGER := 128;		--szerokość przedniego przedsionka (px)
		h_pol		:	STD_LOGIC := '0';		--polaryzacja impulsu synchronizacji poziomej (1 +, 0 -)
		v_pulse 	:	INTEGER := 3;			--szerokość impulsu synchronizacji pionowej w rzędach
		v_bp	 	:	INTEGER := 38;			--szerokość pionowego tylnego przedsionka w rzędach
		v_pixels	:	INTEGER := 1200;		--szerokość wyświetlania w pionie w rzędach
		v_fp	 	:	INTEGER := 1;			--szerokość pionowego przedniego przedsionka w rzędach
		v_pol		:	STD_LOGIC := '1');	--polaryzacja impulsu synchronizacji pionowej (1 +, 0 -)
	PORT(
		pixel_clk	:	IN		STD_LOGIC;	--zegar pikseli przy częstotliwości używanego trybu VGA
		reset_n		:	IN		STD_LOGIC;	--aktywny niski reset asynchroniczny
		h_sync		:	OUT	STD_LOGIC;	--impuls synchronizacji poziomej
		v_sync		:	OUT	STD_LOGIC;	--impuls synchronizacji pionowej
		disp_ena		:	OUT	STD_LOGIC;	--włączenie wyświetlania ('1' = czas wyświetlania, '0' = czas wygaszania)
		column		:	OUT	INTEGER;		--pozycja piksela pozioma
		row			:	OUT	INTEGER;		--pozycja piksela pionowa
		n_blank		:	OUT	STD_LOGIC;	--bezpośrednie wyjście zaczernienia do DAC
		n_sync		:	OUT	STD_LOGIC); --synchronizacja-na-zielonym wyjście do DAC
END vga_controller;

ARCHITECTURE behavior OF vga_controller IS
	CONSTANT	h_period	:	INTEGER := h_pulse + h_bp + h_pixels + h_fp;  --całkowita liczba zegarów pikseli w rzędzie
	CONSTANT	v_period	:	INTEGER := v_pulse + v_bp + v_pixels + v_fp;  --całkowita liczba rzędów w kolumnie
BEGIN

	n_blank <= '1';  --brak bezpośredniego wygaszania
	n_sync <= '0';   --brak synchronizacji na zielono
	
	PROCESS(pixel_clk, reset_n)
		VARIABLE h_count	:	INTEGER RANGE 0 TO h_period - 1 := 0;  --licznik poziomy (liczy kolumny)
		VARIABLE v_count	:	INTEGER RANGE 0 TO v_period - 1 := 0;  --licznik pionowy (liczy rzędy)
	BEGIN
	
		IF(reset_n = '0') THEN		--reset potwierdzony
			h_count := 0;				--reset poziomego licznika
			v_count := 0;				--reset pionowego licznika
			h_sync <= NOT h_pol;		--wyzerowanie synchronizacji poziomej
			v_sync <= NOT v_pol;		--wyzerowanie synchronizacji pionowej
			disp_ena <= '0';			--wyłącz wyświetlanie
			column <= 0;				--resetuj pozycje piksela w poziomie
			row <= 0;					--resetuj pozycje piksela w pionie
			
		ELSIF(pixel_clk'EVENT AND pixel_clk = '1') THEN

			--liczniki
			IF(h_count < h_period - 1) THEN		--licznik poziomy (piksele)
				h_count := h_count + 1;
			ELSE
				h_count := 0;
				IF(v_count < v_period - 1) THEN	--licznik pionowy (rzędy)
					v_count := v_count + 1;
				ELSE
					v_count := 0;
				END IF;
			END IF;

			--sygnał synchronizacji poziomej
			IF(h_count < h_pixels + h_fp OR h_count >= h_pixels + h_fp + h_pulse) THEN
				h_sync <= NOT h_pol;		--wyzerowanie impulsu synchronizacji poziomej
			ELSE
				h_sync <= h_pol;			--przypisanie impulsu synchronizacji poziomej
			END IF;
			
			--sygnał synchronizacji pionowej
			IF(v_count < v_pixels + v_fp OR v_count >= v_pixels + v_fp + v_pulse) THEN
				v_sync <= NOT v_pol;		--ustawienie impulsu synchronizacji pionowej
			ELSE
				v_sync <= v_pol;			--przypisanie impulsu synchronizacji pionowej
			END IF;
			
			--ustawianie pozycji piksela
			IF(h_count < h_pixels) THEN  	--poziomy czas wyświetlania
				column <= h_count;			--ustawienie koordynaty poziomej piksela
			END IF;
			IF(v_count < v_pixels) THEN	--pionowy czas wyświetlania
				row <= v_count;				--ustawienie koordynaty pionowej piksela
			END IF;

			--ustawianie wyjścia włączania wyświetlania
			IF(h_count < h_pixels AND v_count < v_pixels) THEN  	--czas wyświetlania
				disp_ena <= '1';											 	--włącz wyświetlanie
			ELSE																	--czas wygaczania
				disp_ena <= '0';												--wyłącz wyświetlanie
			END IF;

		END IF;
	END PROCESS;

END behavior;