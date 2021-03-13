library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;
USE ieee.std_logic_signed.ALL;

Entity divider is
	Port (a :	in STD_LOGIC_VECTOR(31 downto 0);
			b :	in STD_LOGIC_VECTOR(31 downto 0);
			q :	out STD_LOGIC_VECTOR(31 downto 0);
			r :	out STD_LOGIC_VECTOR(31 downto 0)
			);
end divider;

architecture behavioural of divider is
BEGIN
	process(a,b)
		CONSTANT Zeros	: std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
		
		VARIABLE AQ 	:	STD_LOGIC_VECTOR(64 downto 0);
		VARIABLE M		:	STD_LOGIC_VECTOR(64 downto 0);
		VARIABLE Res	:	STD_LOGIC_VECTOR(64 downto 0);
		
		BEGIN
		Res(63 downto 32) := b;
		Res(64) :=b (31);
		M(63 downto 32) := (NOT b) + 1;
		M(64) := NOT (b(31));
		AQ(31 downto 0) := a;
		for i in 1 to 32 LOOP
			AQ := AQ + AQ + M;
			IF (AQ >= Zeros) THEN
				AQ(i) := '1';
			ELSE
				AQ(i) := '0';
				AQ := AQ + Res;
			END IF;
		END LOOP;
		q <= AQ(31 downto 0);
		r <= AQ(63 downto 32);
	END process;
END architecture behavioural;