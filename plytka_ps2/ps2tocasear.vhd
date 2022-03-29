library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ps2tocaesar is
	port(	
	scan_code: in std_logic_vector(7 downto 0);
	caesar_code: out std_logic_vector(7 downto 0)
	);
end ps2tocaesar;	 

architecture ps2tocaesar of ps2tocaesar is			
begin			
	process(scan_code)
	begin
		if scan_code = x"51" THEN 		--Q
			caesar_code <=	x"54";	 		--T
		elsif scan_code = x"57"  THEN 	--W 
			caesar_code <= x"5A";			   		--Z
		elsif scan_code = x"45" THEN 	--E
			caesar_code <= x"48";	 		 		--H
		elsif scan_code = x"52" THEN 	--R
			caesar_code <= x"55";			   		--U
		elsif scan_code = x"54"  THEN 	--T 
			caesar_code <= x"57";					--W
		elsif scan_code = x"59" THEN 	--Y
			caesar_code <= x"42";	 				--B
		elsif scan_code = x"55" THEN 	--U
			caesar_code <= x"58";			   		--W
		elsif scan_code = x"49"  THEN 	--I 
			caesar_code <= x"4C";			  		--L
		elsif scan_code =x"4F" THEN 	--O
			caesar_code <= x"52";	 		  		--R
		elsif scan_code = x"50" THEN 	--P
			caesar_code <= x"53";			   		--S
		elsif scan_code = x"41"  THEN 	--A 
			caesar_code <= x"44"; 					--D
		elsif scan_code = x"53" THEN 	--S
			caesar_code <= x"56";	 				--V
		elsif scan_code = x"44" THEN 	--D
			caesar_code <= x"47";					--G
		elsif scan_code = x"46"  THEN 	--F 
			caesar_code <= x"49";					--I
		elsif scan_code = x"47" THEN 	--G
			caesar_code <= x"4A";	 		   		--J
		elsif scan_code = x"48" THEN 	--H
			caesar_code <= x"4B";					--K
		elsif scan_code = x"4A"  THEN 	--J 
			caesar_code <= x"4D";			  		--M
		elsif scan_code = x"4B" THEN 	--K
			caesar_code <= x"4E";	 				--N
		elsif scan_code = x"4C" THEN 	--L
			caesar_code <= x"4F";			   		--O
		elsif scan_code = x"5A"  THEN 	--Z 
			caesar_code <= x"43";					--C
		elsif scan_code = x"58" THEN 	--X
			caesar_code <= x"41";	 				--A
		elsif scan_code = x"43" THEN 	--C
			caesar_code <= x"46";					--F
		elsif scan_code = x"56"  THEN 	--V 
			caesar_code <= x"59";			  		--Y
		elsif scan_code = x"42" THEN 	--B
			caesar_code <= x"45"; 					--E	 
		elsif scan_code = x"4E" THEN 	--N
			caesar_code <= x"51";			   		--Q
		elsif scan_code = x"4D"  THEN 	--M 
			caesar_code <= x"50";			  		--P	   
		else
			caesar_code <= x"00";
		end if;				  
	end process;
	
end ps2tocaesar;						  
