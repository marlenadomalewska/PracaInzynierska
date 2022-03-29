library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity caesardecpiher is
	port(	
	caesar_code: in std_logic_vector(7 downto 0);
	scan_code: out std_logic_vector(7 downto 0)
	);
end caesardecpiher;	 

architecture caesardecpiher of caesardecpiher is			
begin			
	process(caesar_code)
	begin
		if caesar_code = x"51" THEN 		--Q
			scan_code <=	x"4e"; 				--N			
		elsif caesar_code = x"57"  THEN 	--W 
			scan_code <= x"54";			 		--T  		
		elsif caesar_code =x"45" THEN 	--E
			scan_code <= x"42";	 		 		--B		
		elsif caesar_code = x"52" THEN 	--R
			scan_code <= x"4f";			 		--O  		
		elsif caesar_code = x"54"  THEN 	--T 
			scan_code <= x"51";					--Q		
		elsif caesar_code = x"59" THEN 	--Y
			scan_code <= x"56";	 				--V		
		elsif caesar_code = x"55" THEN 	--U
			scan_code <= x"52";			 		--R  		
		elsif caesar_code = x"49"  THEN 	--I 
			scan_code <= x"46";			 		--F 		
		elsif caesar_code = x"4F" THEN 	--O
			scan_code <= x"4c";	 				--L  		
		elsif caesar_code = x"50" THEN 	--P
			scan_code <= x"4d";					--M   		
		elsif caesar_code = x"41"  THEN 	--A 
			scan_code <= x"58"; 					--X		
		elsif caesar_code = x"53" THEN 	--S
			scan_code <= x"50";	 				--P		
		elsif caesar_code = x"44" THEN 	--D
			scan_code <= x"41";					--A	
		elsif caesar_code = x"46"  THEN 	--F 
			scan_code <= x"43";					--C		
		elsif caesar_code = x"47" THEN 	--G
			scan_code <= x"44";	 				--D   		
		elsif caesar_code = x"48" THEN 	--H
			scan_code <= x"45";					--E		
		elsif caesar_code = x"4A"  THEN 	--J 
			scan_code <= x"47";					--G  		
		elsif caesar_code = x"4B" THEN 	--K
			scan_code <= x"48";	 				--H		
		elsif caesar_code = x"4C" THEN 	--L
			scan_code <= x"49";					--I   		
		elsif caesar_code = x"5A"  THEN 	--Z 
			scan_code <= x"57";					--W		
		elsif caesar_code =x"58" THEN 	--X	
			scan_code <= x"55";	 				--U		
		elsif caesar_code = x"43" THEN 	--C
			scan_code <= x"5a";					--Z		
		elsif caesar_code = x"56"  THEN 	--V 
			scan_code <= x"53";			 		--S 	
		elsif caesar_code =x"42" THEN 	--B
			scan_code <= x"59"; 					--Y		 
		elsif caesar_code = x"4E" THEN 	--N
			scan_code <= x"4b";					--K  		
		elsif caesar_code = x"4D"  THEN 	--M 
			scan_code <= x"4a";			 		--J 		


		else
			scan_code <= x"00";
		end if;				  
	end process;
	
end caesardecpiher;						  
