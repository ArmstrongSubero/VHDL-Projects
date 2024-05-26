--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G02_OR_Gate
-- Author  : Armstrong Subero
-- Date    : 23_05/2024
--
--------------------------------------------------------------------------------
-- Description : This project creates an OR gate
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G02_OR_GATE IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    X      : IN  std_logic;                  
    Y      : IN  std_logic; 
  ------------------------------------------------------------------------------
  --Insert output ports below
    Z        : OUT std_logic
    );
END G02_OR_GATE;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE Behavioral OF G02_OR_GATE IS

BEGIN
  --Concurrent signal assignment for OR operation
  Z <= X or Y;
	
END Behavioral;
