library IEEE;
use ieee.std_logic_1164.all;

entity con_ff_logic is 
	port(IR_2lowbits : in std_logic_vector(1 downto 0);
			Rin : in std_logic_vector(31 downto 0);
			Con_in, Con_clk : in std_logic;
			Con_out : out std_logic
	);
end con_ff_logic;

architecture behavioural of con_ff_logic is

component ff is
	port(clk, d, enable : in std_logic;
			q : out std_logic
	);
end component ff;

signal orr : std_logic;

begin
	flipflop : ff port map(clk => Con_clk, d => orr, enable => Con_in, q => Con_out);
	
	process(IR_2lowbits, Rin, con_in) is
	
	variable and0, and1, and2, and3, rnor : std_logic;
	variable out_decoder : std_logic_vector(3 downto 0);	
	
	begin
	
		rnor := Rin(0);
		
		for bit_index in 1 to 31 loop
			rnor := rnor nor Rin(bit_index);
		end loop;
	
		case IR_2lowbits is
			when "00" => out_decoder := b"0001";	
			when "01" => out_decoder := b"0010";
			when "10" => out_decoder := b"0100";
			when "11" => out_decoder := b"1000";
			when others => out_decoder := b"0000";
		end case;
		
		and0 := out_decoder(0) and rnor; 			-- =  0
		and1 := out_decoder(1) and (not rnor); 	-- != 0
		and2 := out_decoder(2) and (not Rin(31)); -- >= 0
		and3 := out_decoder(3) and Rin(31); 		-- <  0
		
		orr <= and0 or and1 or and2 or and3;
		
	end process;

end architecture behavioural;