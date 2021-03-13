library IEEE;
use IEEE.std_logic_1164.all;

entity encoder_32to5 is
port(	R0out, R1out, R2out, R3out, R4out, R5out, 
		R6out, R7out, R8out, R9out, R10out, R11out,
		R12out, R13out, R14out, R15out, HIout, LOout,
		Zhighout, Zlowout, PCout, MDRout, InPortout, Cout: in std_logic; 
		Z: out std_logic_vector(4 downto 0));
end entity encoder_32to5;

architecture behavioral of encoder_32to5 is 
begin
	Z <=				"00000" when R0out = '1' else
						"00001" when R1out = '1' else
						"00010" when R2out = '1' else
						"00011" when R3out = '1' else
						"00100" when R4out = '1' else
						"00101" when R5out = '1' else
						"00110" when R6out = '1' else
						"00111" when R7out = '1' else
						"01000" when R8out = '1' else
						"01001" when R9out = '1' else
						"01010" when R10out = '1' else
						"01011" when R11out = '1' else
						"01100" when R12out = '1' else
						"01101" when R13out = '1' else
						"01110" when R14out = '1' else
						"01111" when R15out = '1' else
						"10000" when HIout = '1' else
						"10001" when LOout = '1' else
						"10010" when Zhighout = '1' else
						"10011" when Zlowout = '1' else
						"10100" when PCout = '1' else
						"10101" when MDRout = '1' else
						"10110" when InPortout ='1' else
						"10111" when Cout = '1'; 
end architecture behavioral;