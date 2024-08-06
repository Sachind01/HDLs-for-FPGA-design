library ieee;                                	
use ieee.std_logic_1164.all;           	
                                             		
entity Majority is port (                 	
    A, B, C: in std_logic; 			
    Y: out std_logic);            		
end Majority;                   	

architecture behavioral of Majority is

begin

	my_label: process(A, B, C)

	begin
		if((A and B)='1' or (B and C)='1' or (A and C)='1') then
			Y<='1';
		else
			Y<='0';
		end if;

	end process my_label;
end behavioral;
