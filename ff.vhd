library ieee;
use ieee.std_logic_1164.all;

entity ff is 
	port(clk, d, enable : in std_logic;
			q : out std_logic
	);
end ff;

architecture behavioural of ff is
begin
	process(clk) is
	begin
		if (enable = '1' and rising_edge(clk)) then
			q <= d;
		end if;
	
	end process;
end architecture behavioural;