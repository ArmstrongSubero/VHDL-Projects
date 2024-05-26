--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G20_BIN_TO_GRAY
-- Author  : Armstrong Subero
-- Date    : 24/05/24
--
--------------------------------------------------------------------------------
-- Description : This project implements a binary to gray 
--               code converter
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY G20_BIN_TO_GRAY IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    i     : IN  std_logic_vector (3 downto 0);
  ------------------------------------------------------------------------------
  --Insert output ports below                -- output bit example
    y     : OUT std_logic_vector(3 DOWNTO 0)
    );
END G20_BIN_TO_GRAY;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G20_BIN_TO_GRAY IS

BEGIN
  y<= "0000" when i="0000" else
      "0001" when i="0001" else
      "0011" when i="0010" else
      "0010" when i="0011" else
      "0110" when i="0100" else
      "0111" when i="0101" else
      "0101" when i="0110" else
      "0100" when i="0111" else
	 "1100" when i="1000" else
	 "1101" when i="1001" else
	 "1111" when i="1010" else
	 "1110" when i="1011" else
	 "1010" when i="1100" else
	 "1011" when i="1101" else
	 "1001" when i="1110" else
	 "1000" when i="1111";

END TypeArchitecture;
