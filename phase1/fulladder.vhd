library IEEE;
use IEEE.std_logic_1164.all;

entity fulladder is 
port(	In1, In2, c_in: in std_logic;
		sum, c_out: out std_logic);
end entity fulladder;

architecture gate_level of fulladder is 
	begin
		sum <= In1 XOR In2 XOR c_in;
		c_out <= (In1 AND In2) OR (c_in AND In1) OR (c_in AND In2);
end architecture 	gate_level;