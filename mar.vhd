library IEEE;
use ieee.std_logic_1164.all;

entity MAR is 
	port(MARin : in std_logic_vector(31 downto 0);
			address : out std_logic_vector(8 downto 0)
	);
end MAR;

architecture behavioural of MAR is
begin
	address <= MARin(8 downto 0);
end architecture behavioural;