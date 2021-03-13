library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;
USE ieee.std_logic_signed.ALL;

entity alu is
	port(	A, B	: in std_logic_vector(31 downto 0);
			sel		: in std_logic_vector(3 downto 0);
			C		: out std_logic_vector(63 downto 0)
	);
end entity alu;

architecture behavioural of alu is

	component Ripple_Adder is
	Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
	B : in STD_LOGIC_VECTOR (31 downto 0);
	Cin : in STD_LOGIC;
	S : out STD_LOGIC_VECTOR (31 downto 0);
	Cout : out STD_LOGIC);
	end component;
	
	component booths is
	PORT (m : IN std_logic_vector(31 DOWNTO 0);
            n : IN std_logic_vector(31 DOWNTO 0);
            result : OUT std_logic_vector(63 DOWNTO 0));
	end component;
	
	component divider is
		Port (a :	in STD_LOGIC_VECTOR(31 downto 0);
			b :	in STD_LOGIC_VECTOR(31 downto 0);
			q :	out STD_LOGIC_VECTOR(31 downto 0);
			r :	out STD_LOGIC_VECTOR(31 downto 0)
			);
	end component;
	
	signal added, subbed, q, r			:std_logic_vector(31 downto 0);
	signal mult								:std_logic_vector(63 downto 0);
	signal Cout								:std_logic;

begin
	
	ADDER: Ripple_Adder port map (A, B, '0', added, Cout);
	SUBBER: Ripple_Adder port map (A, ((not B) + 1), '0', subbed, Cout);
	MULTIPLIER: booths port map (A,B,mult);
	DIVISION: divider port map (A,B,q,r);

	process (A,B,sel)
	begin

	case (sel) is 
	when "0000" => --and
	C(31 downto 0) <= A and B;
	when "0001" => --or
	C(31 downto 0) <= A or B;
	when "0010" => --add
	C(31 downto 0) <= added;
	when "0011" => --sub
	C(31 downto 0) <= subbed;
	when "0100" => --mul
	C <= mult;
	when "0101" => --div
	C(31 downto 0) <= q;
	C(63 downto 32) <= r;
	when "0110" => --shift r
	C(31 downto 0) <= std_logic_vector(unsigned(A) srl 1);
	when "0111" => -- shift l
	C(31 downto 0) <= std_logic_vector(unsigned(A) sll 1);
	when "1000" => -- rotate r
	C(31 downto 0) <= std_logic_vector(unsigned(A) ror 1);
	when "1001" => --rotate l
	C(31 downto 0) <= std_logic_vector(unsigned(A) rol 1);
	when "1010" => --neg
	C(31 downto 0) <= ((not A) +1);
	when "1011" => --not
	C(31 downto 0) <= not A;
	when others =>
	C(31 downto 0) <= A or B;
	end case;

end process;
end architecture;