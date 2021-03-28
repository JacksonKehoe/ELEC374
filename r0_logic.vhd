library IEEE;
use ieee.std_logic_1164.all;

entity R0_logic is 
	port(	Q : in std_logic_vector(31 downto 0);
			BAout : in std_logic;
			BusMuxIn_R0 : out std_logic_vector(31 downto 0)
	);
end R0_logic;

architecture behavioural of R0_logic is
begin
	BusMuxIn_R0 <= Q when BAout = '1' else
					   "00000000000000000000000000000000";
end architecture behavioural;