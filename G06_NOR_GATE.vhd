--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G06_NOR_GATE
-- Author  : Armstrong Subero
-- Date    : 23/05/23
--
--------------------------------------------------------------------------------
-- Description : This project implements a NOR Gate
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G06_NOR_GATE IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    X      : IN  std_logic;                    
    Y      : IN  std_logic;
  ------------------------------------------------------------------------------
  --Insert output ports below
    Z        : OUT std_logic              
    );
END G06_NOR_GATE;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G06_NOR_GATE IS

BEGIN
  Z <= X nor Y;
END TypeArchitecture;
