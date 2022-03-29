LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity letter2screen is
port(
row, column : in INTEGER;
letter : in std_logic_vector(7 downto 0);
red, green, blue : out std_logic_vector(7 downto 0));
end letter2screen;

architecture a of letter2screen is

begin
process(row,column,letter)
begin
case letter is
when x"41" => --A
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
			OR (row>=1 AND row <=101 AND column>=1 AND column <=501)
			OR (row>=301 AND row <=401 AND column>=1 AND column <=501)   
			OR (column>=501 AND column <=601 AND row>=1 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"42" => --B
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
			OR (row>=1 AND row <=101 AND column>=1 AND column <=401)
			OR (row>=1 AND row <=301 AND column>=401 AND column <=501)
			OR (row>=301 AND row <=401 AND column>=1 AND column <=501)   
			OR (column>=501 AND column <=601 AND row>=301 AND row <=801)
			OR (row>=701 AND row <=801 AND column>=1 AND column <=501) ) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"43" => --C
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
			OR (row>=1 AND row <=101 AND column>=1 AND column <=501)  
			OR (column>=1 AND column <=501 AND row>=701 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"44" => --D
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
			OR (row>=1 AND row <=101 AND column>=1 AND column <=401)
			OR (row>=101 AND row <=201 AND column>=401 AND column <=501)   
			OR (column>=501 AND column <=601 AND row>=201 AND row <=601)
			OR (row>=601 AND row <=701 AND column>=401 AND column <=501) 
			OR (row>=701 AND row <=801 AND column>=1 AND column <=401) ) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"45" => --E
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
	OR (row>=1 AND row <=101 AND column>=1 AND column <=401)
	OR (row>=301 AND row <=401 AND column>=1 AND column <=401)
	OR (row>=701 AND row <=801 AND column>=1 AND column <=401)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"46" => --F
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
	OR (row>=1 AND row <=101 AND column>=1 AND column <=401)
	OR (row>=301 AND row <=401 AND column>=1 AND column <=301)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"47" => --G
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
			OR (row>=1 AND row <=101 AND column>=1 AND column <=501)  
			OR (column>=1 AND column <=601 AND row>=701 AND row <=801)
			OR (column>=501 AND column <=601 AND row>=401 AND row <=801)
			OR (column>=301 AND column <=601 AND row>=401 AND row <=501)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"48" => --H
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
			OR (row>=301 AND row <=401 AND column>=1 AND column <=501)   
			OR (column>=501 AND column <=601 AND row>=1 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"49" => --I
	if( (column>=201 AND column <=301 AND row>=1 AND row <=801) 
			OR (row>=1 AND row <=101 AND column>=1 AND column <=501)
			OR (row>=701 AND row <=801 AND column>=1 AND column <=501)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"4A" => --J
	if( (column>=1 AND column <=101 AND row>=501 AND row <=801) 
			OR (row>=701 AND row <=801 AND column>=1 AND column <=501) 
			OR (column>=401 AND column <=501 AND row>=1 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"4B" => --K
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
			OR (row>=301 AND row <=401 AND column>=101 AND column <=201)
			OR (row>=201 AND row <=301 AND column>=201 AND column <=301)
			OR (row>=101 AND row <=201 AND column>=301 AND column <=401)
			OR (row>=1 AND row <=101 AND column>=401 AND column <=501)
			
			OR (row>=401 AND row <=501 AND column>=201 AND column <=301)
			OR (row>=501 AND row <=601 AND column>=301 AND column <=401)
			OR (row>=601 AND row <=701 AND column>=401 AND column <=501)
			OR (row>=701 AND row <=801 AND column>=501 AND column <=601)			) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"4C" => --L
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801)  
			OR (column>=1 AND column <=501 AND row>=701 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"4D" => --M
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
	
			OR (row>=101 AND row <=201 AND column>=101 AND column <=201)  
			OR (row>=201 AND row <=301 AND column>=201 AND column <=301)  
			OR (row>=301 AND row <=401 AND column>=301 AND column <=401) 
		OR (row>=201 AND row <=301 AND column>=401 AND column <=501) 	
		OR (row>=101 AND row <=201 AND column>=501 AND column <=601) 
			
			OR (column>=601 AND column <=701 AND row>=1 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"4E" => --N
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
	
			OR (row>=101 AND row <=301 AND column>=101 AND column <=201)
			OR (row>=201 AND row <=401 AND column>=201 AND column <=301)
			OR (row>=301 AND row <=501 AND column>=301 AND column <=401)
			OR (row>=401 AND row <=601 AND column>=401 AND column <=501)
			OR (row>=501 AND row <=701 AND column>=501 AND column <=601)
			
			OR (column>=601 AND column <=701 AND row>=1 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"4F" => --O
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
			OR (row>=1 AND row <=101 AND column>=1 AND column <=501)  
			OR (column>=1 AND column <=501 AND row>=701 AND row <=801)
			OR (column>=501 AND column <=601 AND row>=1 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"50" => --P
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
			OR (row>=301 AND row <=401 AND column>=1 AND column <=501) 
		OR (row>=1 AND row <=101 AND column>=1 AND column <=501)  	
			OR (column>=501 AND column <=601 AND row>=1 AND row <=401)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"51" => --Q
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
			OR (row>=1 AND row <=101 AND column>=1 AND column <=501)  
			OR (column>=1 AND column <=501 AND row>=701 AND row <=801)
			OR (column>=301 AND column <=601 AND row>=501 AND row <=601)
			OR (column>=401 AND column <=501 AND row>=1 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"52" => --R
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
			OR (row>=301 AND row <=401 AND column>=1 AND column <=501) 
		OR (row>=1 AND row <=101 AND column>=1 AND column <=501)  
		
	OR (row>=401 AND row <=501 AND column>=301 AND column <=401) 
OR (row>=501 AND row <=701 AND column>=401 AND column <=501) 	
OR (row>=701 AND row <=801 AND column>=501 AND column <=601) 
	
			OR (column>=501 AND column <=601 AND row>=1 AND row <=401)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"53" => --S
	if( (column>=1 AND column <=101 AND row>=1 AND row <=401) 
	OR (column>=1 AND column <=101 AND row>=601 AND row <=801)
	OR (column>=1 AND column <=501 AND row>=1 AND row <=101)
	OR (column>=1 AND column <=501 AND row>=301 AND row <=401)
	OR (column>=1 AND column <=501 AND row>=701 AND row <=801)
	OR (column>=401 AND column <=501 AND row>=1 AND row <=201)
	OR (column>=401 AND column <=501 AND row>=301 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"54" => --T
	if( (column>=201 AND column <=301 AND row>=1 AND row <=801) 
			OR (row>=1 AND row <=101 AND column>=1 AND column <=501)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"55" => --U
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
			
			OR (column>=1 AND column <=501 AND row>=701 AND row <=801)
			OR (column>=501 AND column <=601 AND row>=1 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"56" => --V
	if( (column>=1 AND column <=101 AND row>=1 AND row <=501) 
	
			OR (row>=501 AND row <=601 AND column>=101 AND column <=201)  
			OR (row>=601 AND row <=701 AND column>=201 AND column <=301)
		OR (row>=701 AND row <=801 AND column>=301 AND column <=401) 	
		OR (row>=601 AND row <=701 AND column>=401 AND column <=501)
		OR (row>=501 AND row <=601 AND column>=501 AND column <=601)  
			
			OR (column>=601 AND column <=701 AND row>=1 AND row <=501)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"57" => --W
	if( (column>=1 AND column <=101 AND row>=1 AND row <=801) 
	
			OR (row>=601 AND row <=701 AND column>=101 AND column <=201) 
		OR (row>=501 AND row <=601 AND column>=201 AND column <=301) 
	OR (row>=401 AND row <=501 AND column>=301 AND column <=401) 
OR (row>=501 AND row <=601 AND column>=401 AND column <=501) 	
OR (row>=601 AND row <=701 AND column>=501 AND column <=601) 
			
			OR (column>=601 AND column <=701 AND row>=1 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"58" => --X
	if( (column>=1 AND column <=101 AND row>=1 AND row <=201) 
	OR (column>=1 AND column <=101 AND row>=501 AND row <=801)
	
	OR (column>=101 AND column <=201 AND row>=201 AND row <=301)
	OR (column>=101 AND column <=201 AND row>=401 AND row <=501)
	
	OR (column>=201 AND column <=301 AND row>=301 AND row <=401)
	
	OR (column>=301 AND column <=401 AND row>=201 AND row <=301)
	OR (column>=301 AND column <=401 AND row>=401 AND row <=501)
	
	 OR (column>=401 AND column <=501 AND row>=1 AND row <=201) 
	OR (column>=401 AND column <=501 AND row>=501 AND row <=801)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"59" => --Y
	if( (column>=1 AND column <=101 AND row>=1 AND row <=201) 
	OR (column>=101 AND column <=201 AND row>=201 AND row <=301)
			OR (row>=301 AND row <=801 AND column>=201 AND column <=301)
			OR (column>=301 AND column <=401 AND row>=201 AND row <=301)
			OR (column>=401 AND column <=501 AND row>=1 AND row <=201)) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when x"5A" => --Z
	if( (column>=1 AND column <=101 AND row>=601 AND row <=801) 
			OR (row>=1 AND row <=101 AND column>=1 AND column <=601)   
			OR (row>=701 AND row <=801 AND column>=1 AND column <=601)
			
			OR (column>=1 AND column <=101 AND row>=601 AND row <=801)
			
			OR (column>=501 AND column <=601 AND row>=1 AND row <=201)
			
			OR (column>=101 AND column <=201 AND row>=501 AND row <=601)
			OR (column>=201 AND column <=301 AND row>=401 AND row <=501)
			OR (column>=301 AND column <=401 AND row>=301 AND row <=401)
			OR (column>=401 AND column <=501 AND row>=201 AND row <=301)
			) then
			red <= x"FF";
			green <= x"FF";
			blue <= x"FF";
			else
				red <= x"00";
				green <= x"00";
				blue <= x"00";
	end if;
when OTHERS =>
red <= x"00";
green <= x"00";
blue <= x"00";
end case;
end process;
end a;