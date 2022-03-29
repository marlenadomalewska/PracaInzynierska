library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity plytka_ps2 is
	port( PS2_CLK:in std_logic;
	PS2_DAT: in std_logic;
	CLOCK_50: in std_logic;  
	GPIO: out std_LOGIC_VECTOR(7 downto 0);
	LEDR :out std_logic_vector(7 downto 0)
	);
end plytka_ps2;
		
architecture a of plytka_ps2 is
   
component ps2tocaesar 
	port(	
	scan_code: in std_logic_vector(7 downto 0);
	caesar_code: out std_logic_vector(7 downto 0)
	);
end component ps2tocaesar;	

component Key2Ascii is
    Port ( ps2_code : in  STD_LOGIC_VECTOR (7 downto 0);
           ascii : out  STD_LOGIC_VECTOR (7 downto 0));
end component Key2Ascii;

signal keyboard_out : std_logic_vector(7 downto 0);	 
signal keyboard_out2 : std_logic_vector(7 downto 0);	
signal CLK_25 :	std_logic;


	signal i : integer := 0;  															
	signal code : std_logic_vector(10 downto 0) ;		
	signal char : std_logic_vector(7 downto 0) := "00000000"; 		
									
	begin

p1: Key2Ascii port map(code(8 downto 1), keyboard_out);
p2: ps2tocaesar port map(char(7 downto 0), keyboard_out2);

state_reg: process(PS2_CLK)
begin
	if(PS2_CLK' event and PS2_CLK = '0') then
			code(i)<=PS2_DAT;			
			i<=i+1;
			if(i=10) then
				if (code(8 downto 1) /= X"F0" ) then
						char<= keyboard_out;
						GPIO(7 downto 0) <= keyboard_out2;
						LEDR <= keyboard_out2;
				end if;
				i<=0;
			end if;
		end if;
	end process;

end a;
