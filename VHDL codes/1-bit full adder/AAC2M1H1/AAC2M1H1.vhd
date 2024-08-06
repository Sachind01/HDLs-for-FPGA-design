library ieee;
use ieee.std_logic_1164.all;

entity FullAdd is port ( 
A, B, Cin: in std_logic; 
Sum, Cout: out std_logic 
); 
end FullAdd;

architecture behavioral of FullAdd is

begin

my_label: process(A, B, Cin)

begin

Sum <= (A xor B xor Cin);
Cout <= ((A and B) or (B and Cin) or (Cin and A));

end process my_label;

end behavioral;
