library IEEE;
use ieee.std_logic_1164.all;

entity ir_split is 
	port(
 input : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
 output : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
);
end ir_split;

architecture behavioral of ir_split is 
begin
	output <= input(1 downto 0);
end behavioral; 