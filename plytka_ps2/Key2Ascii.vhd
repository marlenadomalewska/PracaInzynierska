--------------------------------------------------------------
-- fpgagate.com: FPGA Projects, VHDL Tutorials, VHDL projects 
-- PS2 Keyboard
--------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Key2Ascii is
    Port ( ps2_code : in  STD_LOGIC_VECTOR (7 downto 0);
           ascii : out  STD_LOGIC_VECTOR (7 downto 0));
end Key2Ascii;

architecture Behavioral of Key2Ascii is
begin
process(ps2_code)
begin
     CASE ps2_code IS            
        WHEN x"1C" => ascii <= x"41"; --A
        WHEN x"32" => ascii <= x"42"; --B
        WHEN x"21" => ascii <= x"43"; --C
        WHEN x"23" => ascii <= x"44"; --D
        WHEN x"24" => ascii <= x"45"; --E
        WHEN x"2B" => ascii <= x"46"; --F
        WHEN x"34" => ascii <= x"47"; --G
        WHEN x"33" => ascii <= x"48"; --H
        WHEN x"43" => ascii <= x"49"; --I
        WHEN x"3B" => ascii <= x"4A"; --J
        WHEN x"42" => ascii <= x"4B"; --K
        WHEN x"4B" => ascii <= x"4C"; --L
        WHEN x"3A" => ascii <= x"4D"; --M
        WHEN x"31" => ascii <= x"4E"; --N
        WHEN x"44" => ascii <= x"4F"; --O
        WHEN x"4D" => ascii <= x"50"; --P
        WHEN x"15" => ascii <= x"51"; --Q
        WHEN x"2D" => ascii <= x"52"; --R
        WHEN x"1B" => ascii <= x"53"; --S
        WHEN x"2C" => ascii <= x"54"; --T
        WHEN x"3C" => ascii <= x"55"; --U
        WHEN x"2A" => ascii <= x"56"; --V
        WHEN x"1D" => ascii <= x"57"; --W
        WHEN x"22" => ascii <= x"58"; --X
        WHEN x"35" => ascii <= x"59"; --Y
        WHEN x"1A" => ascii <= x"5A"; --Z
        WHEN OTHERS => ascii<=x"00";
     END CASE;
	  end process;
end Behavioral;
