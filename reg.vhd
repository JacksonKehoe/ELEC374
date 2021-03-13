library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity reg is
	port(	clk			: in std_logic;
			clr			: in std_logic;
			writeEnable : in std_logic;
			D 				: in std_logic_vector(31 downto 0);
			Q				: out std_logic_vector(31 downto 0)
	);
end entity reg;

architecture behavioural of reg is
	begin
	process(clk,clr)
		begin
			if (clr='1') then
				Q<=x"00000000";
			elsif	(clk'event and clk='1') then
				if (writeEnable='1') then
					Q <= D;
				end if;
			end if;
	end process;
end architecture behavioural;