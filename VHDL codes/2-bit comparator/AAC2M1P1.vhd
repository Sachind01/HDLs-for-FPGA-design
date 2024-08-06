library ieee;
use ieee.std_logic_1164.all;

entity comparator2 is
port (
  A, B: in std_logic_vector(1 downto 0);
  Equals: out std_logic
);
end comparator2;

architecture comparator2_arch of comparator2 is
begin

  Equals <= not(A(1) xor B(1)) and
		not(A(0) xor B(0));

end comparator2_arch;