library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity mdmux is
	port(	busmuxout, mdatain 	: in std_logic_vector(31 downto 0);
			rd							: in std_logic;
			mdmuxout					: out std_logic_vector(31 downto 0)
			
	);
end entity mdmux;

architecture behavioural of mdmux is
begin

mdmuxout <= busmuxout when rd = '0' else
				mdatain;

end architecture behavioural;