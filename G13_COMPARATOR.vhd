--------------------------------------------------------------------------------
-- Project : Gates to Android and Linux
-- File    : G13_COMPARATOR
-- Author  : Armstrong Subero
-- Date    : 23/05/23
--
--------------------------------------------------------------------------------
-- Description : This project implements a comparator
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY G13_COMPARATOR IS
    PORT (
        A       : IN  std_logic_vector(3 DOWNTO 0);  -- Assuming 4-bit vectors
        B       : IN  std_logic_vector(3 DOWNTO 0);
        less    : OUT std_logic;
        equal   : OUT std_logic;
        greater : OUT std_logic
    );
END G13_COMPARATOR;

ARCHITECTURE Behavioral OF G13_COMPARATOR IS
BEGIN
    process(A, B)
    begin
        if unsigned(A) < unsigned(B) then
            less <= '1';
            equal <= '0';
            greater <= '0';
        elsif unsigned(A) = unsigned(B) then
            less <= '0';
            equal <= '1';
            greater <= '0';
        else
            less <= '0';
            equal <= '0';
            greater <= '1';
        end if;
    end process;
END Behavioral;

