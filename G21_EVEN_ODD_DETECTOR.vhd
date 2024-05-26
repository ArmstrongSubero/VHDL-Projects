--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G21_EVEN_ODD_DETECTOR.vhdl
-- Author  : Armstrong Subero
-- Date    : 24/05/24
--------------------------------------------------------------------------------
-- Description : This project implements an odd/even detector
--               exploits the fact that in binary, the LSB
--               of odd numbers end on 1 and even end in 0
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY G21_EVEN_ODD_DETECTOR IS
  PORT (
    ------------------------------------------------------------------------------
    -- Insert input ports below
    number : IN  std_logic_vector(5 downto 0);
    ------------------------------------------------------------------------------
    -- Insert output ports below
    odd    : OUT std_logic;
    even   : OUT std_logic  
  );
END G21_EVEN_ODD_DETECTOR;

--------------------------------------------------------------------------------
-- Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE Behavioral OF G21_EVEN_ODD_DETECTOR IS
BEGIN
  -- Process to detect odd or even
  process(number)
  begin
    if number(0) = '1' then
      odd <= '1';
      even <= '0';
    else
      odd <= '0';
      even <= '1';
    end if;
  end process;

END Behavioral;
