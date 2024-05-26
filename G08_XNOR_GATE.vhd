--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G08_XNOR_GATE
-- Author  : Armstrong Subero
-- Date    : 23/05/24
--
--------------------------------------------------------------------------------
-- Description : This Program Implements a XNOR Gate
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G08_XNOR_GATE IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    X      : IN  std_logic;                    
    Y      : IN  std_logic;
  ------------------------------------------------------------------------------
  --Insert output ports below
    Z      : OUT std_logic
    );
END G08_XNOR_GATE;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G08_XNOR_GATE IS

BEGIN
   Z <= X xnor Y;

END TypeArchitecture;
