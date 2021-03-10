LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.NUMERIC_STD.all;

Entity booths IS

    PORT (m : IN std_logic_vector(31 DOWNTO 0);
            n : IN std_logic_vector(31 DOWNTO 0);
            result : OUT std_logic_vector(63 DOWNTO 0));

END booths;

Architecture behavioral OF booths IS
BEGIN
    process(m,n)
        CONSTANT Zeros1    : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
        CONSTANT Zeros2    : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');

        VARIABLE add, sub, prod    : std_logic_vector(65 DOWNTO 0);
        VARIABLE complement        : std_logic_vector(31 DOWNTO 0);

        BEGIN
            IF (m /= Zeros1 AND n /= Zeros2) THEN
                complement := (NOT m) + 1;
                add(64 DOWNTO 33) := m;
                add(65) := m(31);

                sub(64 DOWNTO 33) := complement;
                sub(65) := NOT(m(31));

                prod(32 DOWNTO 1) := n;

                --IF(prod(0) = "1") THEN
                --prod := prod + sub;

                FOR i IN 1 TO 32 LOOP
                    IF (prod(1 DOWNTO 0) = "01") THEN
                        prod := prod + add;
                    ELSIF (prod(1 DOWNTO 0) = "10") THEN
                        prod := prod + sub;
                    END IF;
                    prod(64 DOWNTO 0) := prod(65 DOWNTO 1);
                END LOOP;
            END IF;
        result <= prod(64 DOWNTO 1);
    END PROCESS;
END behavioral;