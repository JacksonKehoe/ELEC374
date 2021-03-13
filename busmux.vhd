library IEEE;
use IEEE.std_logic_1164.all;

entity busmux is
port (	r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15,
			hi, lo, z_high, z_low, rpc, rmdr, inport, c_sign_extended:						in std_logic_vector(31 downto 0);
			Z:																								in std_logic_vector(4 downto 0);
			busmuxout:																					out std_logic_vector(31 downto 0)
		);
end entity busmux;

architecture behavioural of busmux is
begin
busmuxout 	<= r0 when Z = "00000" else
					r1 when Z = "00001" else
					r2 when Z = "00010" else
					r3 when Z = "00011" else
					r4 when Z = "00100" else
					r5 when Z = "00101" else
					r6 when Z = "00110" else
					r7 when Z = "00111" else
					r8 when Z = "01000" else
					r9 when Z = "01001" else
					r10 when Z = "01010" else
					r11 when Z = "01011" else
					r12 when Z = "01100" else
					r13 when Z = "01101" else
					r14 when Z = "01110" else
					r15 when Z = "01111" else
					hi when Z = "10000" else
					lo when Z = "10001" else
					z_high when Z = "10010" else
					z_low when Z = "10011" else
					rpc when Z = "10100" else
					rmdr when Z = "10101" else
					inport when Z = "10110" else
					c_sign_extended when Z = "10111";
end architecture behavioural;