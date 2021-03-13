library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity reg2 is
	port(	clk			: in std_logic;
			clr			: in std_logic;
			writeEnable : in std_logic;
			D 				: in std_logic_vector(63 downto 0);
			Q				: out std_logic_vector(63 downto 0)
	);
end entity reg2;

architecture behavioural of reg2 is
	begin
	process(clk,clr)
		begin
			if (clr='1') then
				Q<=x"0000000000000000";
			elsif	(clk'event and clk='1') then
				if (writeEnable='1') then
					Q <= D;
				end if;
			end if;
	end process;
end architecture behavioural;