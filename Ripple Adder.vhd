library IEEE;
use IEEE.std_logic_1164.all;

entity Ripple_Adder is
port(	A: in std_logic_vector(31 downto 0);
		B: in std_logic_vector(31 downto 0);
		Cin: in std_logic;
		S: out std_logic_vector(31 downto 0);
		Cout: out std_logic);
end entity Ripple_Adder;

architecture behavioral of Ripple_Adder is 
component fulladder is
port(	In1, In2, c_in: in std_logic;
		sum, c_out: out std_logic);
end component fulladder;
 
signal 	c1,c2,c3,c4,c5,c6,c7,c8,
			c9,c10,c11,c12,c13,c14,c15,c16,
			c17,c18,c19,c20,c21,c22,c23,c24,
			c25,c26,c27,c28,c29,c30,c31: std_logic;
 
begin
FullAddder1: fulladder port map( A (0), B(0), Cin, S(0), c1);
FullAddder2: fulladder port map( A (1), B(1), c1, S(1), c2);
FullAddder3: fulladder port map( A (2), B(2), c2, S(2), c3);
FullAddder4: fulladder port map( A (3), B(3), c3, S(3), c4);
FullAddder5: fulladder port map( A (4), B(4), c4, S(4), c5);
FullAddder6: fulladder port map( A (5), B(5), c5, S(5), c6);
FullAddder7: fulladder port map( A (6), B(6), c6, S(6), c7);
FullAddder8: fulladder port map( A (7), B(7), c7, S(7), c8);
FullAddder9: fulladder port map( A (8), B(8), c8, S(8), c9);
FullAddder10: fulladder port map( A (9), B(9), c9, S(9), c10);
FullAddder11: fulladder port map( A (10), B(10), c10, S(10), c11);
FullAddder12: fulladder port map( A (11), B(11), c11, S(11), c12);
FullAddder13: fulladder port map( A (12), B(12), c12, S(12), c13);
FullAddder14: fulladder port map( A (13), B(13), c13, S(13), c14);
FullAddder15: fulladder port map( A (14), B(14), c14, S(14), c15);
FullAddder16: fulladder port map( A (15), B(15), c15, S(15), c16);
FullAddder17: fulladder port map( A (16), B(16), c16, S(16), c17);
FullAddder18: fulladder port map( A (17), B(17), c17, S(17), c18);
FullAddder19: fulladder port map( A (18), B(18), c18, S(18), c19);
FullAddder20: fulladder port map( A (19), B(19), c19, S(19), c20);
FullAddder21: fulladder port map( A (20), B(20), c20, S(20), c21);
FullAddder22: fulladder port map( A (21), B(21), c21, S(21), c22);
FullAddder23: fulladder port map( A (22), B(22), c22, S(22), c23);
FullAddder24: fulladder port map( A (23), B(23), c23, S(23), c24);
FullAddder25: fulladder port map( A (24), B(24), c24, S(24), c25);
FullAddder26: fulladder port map( A (25), B(25), c25, S(25), c26);
FullAddder27: fulladder port map( A (26), B(26), c26, S(26), c27);
FullAddder28: fulladder port map( A (27), B(27), c27, S(27), c28);
FullAddder29: fulladder port map( A (28), B(28), c28, S(28), c29);
FullAddder30: fulladder port map( A (29), B(29), c29, S(29), c30);
FullAddder31: fulladder port map( A (30), B(30), c30, S(30), c31);
FullAddder32: fulladder port map( A (31), B(31), c31, S(31), Cout);

end architecture behavioral;