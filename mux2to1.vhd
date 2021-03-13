library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity mux2to1 is
	port(	ALUIn, PCAdd 				: in std_logic_vector(63 downto 0);
			IncPC						: in std_logic;
			muxOut					: out std_logic_vector(63 downto 0)
	);
end entity mux2to1;

architecture behavioural of mux2to1 is
begin

muxOut <= ALUIn when IncPC = '0' else
				PCAdd;

end architecture behavioural;