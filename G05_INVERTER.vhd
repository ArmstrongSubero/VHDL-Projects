--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G05_INVERTER
-- Author  : Armstrong Subero 
-- Date    : 23/05/24
--
--------------------------------------------------------------------------------
-- Description : This project implements an inverter 
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G05_INVERTER IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    X     : IN  std_logic;                    
  ------------------------------------------------------------------------------
  --Insert output ports below
    Y     : OUT std_logic
    );
END G05_INVERTER;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G05_INVERTER IS

BEGIN
  Y <= NOT X;

END TypeArchitecture;
