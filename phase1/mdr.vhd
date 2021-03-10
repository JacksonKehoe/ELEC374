library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity mdr is
	port(	clk			: in std_logic;
			clr			: in std_logic;
			mdrin 		: in std_logic;
			busmuxout 	: in std_logic_vector(31 downto 0);
			Q				: out std_logic_vector(31 downto 0)
	);
end entity mdr;

architecture behavioural of mdr is
	begin
	process(clk,clr)
		begin
			if (clr='1') then
				Q<=x"00000000";
			elsif	(clk'event and clk='1') then
				if (mdrin='1') then
					Q <= busmuxout;
				end if;
			end if;
	end process;
end architecture behavioural;