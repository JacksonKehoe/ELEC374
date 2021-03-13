library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;
USE ieee.std_logic_signed.ALL;

entity incrementer is
	port(	input				: in std_logic_vector(31 downto 0);
			output			: out std_logic_vector(63 downto 0)
	);
end entity incrementer;

architecture behavioural of incrementer is
begin

output(31 downto 0) <= std_logic_vector(unsigned(input) + 1);
output(63 downto 32) <= (others => '0');

end architecture behavioural;