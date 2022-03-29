library IEEE;
use ieee.std_logic_1164.all;

entity ps2keyboard is
port(
ps2Clk : in std_logic;
ps2Data : in std_logic;
scan_code : out std_logic_vector(7 downto 0)
);
end ps2keyboard;

architecture a of ps2keyboard is

	signal i : integer := 0;  		--zliczanie													
	signal code : std_logic_vector(10 downto 0) ;	--11-bitowy kod z klawiatury
	
begin

state_reg: process(ps2Clk)
begin
	if(ps2Clk' event and ps2Clk = '0') then
			code(i)<=ps2Data;			
			i<=i+1;
			if(i=10) then
				if (code(8 downto 1) /= X"F0" ) then
						scan_code <= code(8 downto 1);
				end if;
				i<=0;
			end if;
		end if;
end process;
	
	
end a;