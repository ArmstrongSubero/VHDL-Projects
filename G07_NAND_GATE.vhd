--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G07_NAND_GATE
-- Author  : Armstrong Subero
-- Date    : 23/05/24
--
--------------------------------------------------------------------------------
-- Description : Implements a NAND gate
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G07_NAND_GATE IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    X      : IN  std_logic;                    -- input bit example
    Y      : IN  std_logic;
  ------------------------------------------------------------------------------
  --Insert output ports below
    Z        : OUT std_logic                    -- output bit example
    );
END G07_NAND_GATE;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G07_NAND_GATE IS

BEGIN
  Z <= X nand Y;

END TypeArchitecture;
