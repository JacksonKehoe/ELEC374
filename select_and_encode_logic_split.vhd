library IEEE;
use ieee.std_logic_1164.all;

entity select_and_encode_logic_split is 
	port(
			input: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			r0, r1,r2,r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15 : out std_logic
);
end select_and_encode_logic_split;

architecture behavioral of select_and_encode_logic_split is 
begin
	r0 <= input(0);
	r1 <= input(1);
	r2 <= input(2);
	r3 <= input(3);
	r4 <= input(4);
	r5 <= input(5);
	r6 <= input(6);
	r7 <= input(7);
	r8 <= input(8);
	r9 <= input(9);
	r10 <= input(10);
	r11 <= input(11);
	r12 <= input(12);
	r13 <= input(13);
	r14 <= input(14);
	r15 <= input(15);
end behavioral;