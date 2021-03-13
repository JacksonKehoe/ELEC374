library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity split is
	port(	Z							: in std_logic_vector(63 downto 0);
			ZhighData, ZlowData  : out std_logic_vector(31 downto 0)
	);
end entity split;

architecture behavioural of split is
begin
ZhighData <= Z(63 downto 32);
ZlowData <= Z(31 downto 0);
end architecture behavioural;