LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY RAM128_32 IS
    PORT
    (
        address   : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
        clock     : IN STD_LOGIC := '1';
        data      : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        wren      : IN STD_LOGIC;
        q         : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
END RAM128_32;

ARCHITECTURE ARCH_RAM128_32 OF RAM128_32 IS
    type ram_type is array(0 to 2**7) of std_logic_vector(31 downto 0);
    signal data_reg : ram_type;

begin
    process(clock)
    begin
        if rising_edge(clock) then
            if wren = '1' then
                data_reg(to_integer(unsigned(address))) <= data;
                q <= data;
            elsif wren = '0' then
                q <= data_reg(to_integer(unsigned(address)));
            end if;
        end if;
    end process;
end architecture ARCH_RAM128_32;
