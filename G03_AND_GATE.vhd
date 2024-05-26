--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G03_AND_GATE
-- Author  : Armstrong Subero
-- Date    : 23/05/24
--
--------------------------------------------------------------------------------
-- Description : This project creates an AND Gate
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G03_AND_GATE IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    X      : IN  std_logic;                    
    Y      : IN  std_logic;
  ------------------------------------------------------------------------------
  --Insert output ports below
    Z       : OUT std_logic
    );
END G03_AND_GATE;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G03_AND_GATE IS

BEGIN
   -- Concurrent signal for AND operation   Z <= X and Y;
END TypeArchitecture;
