--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android 
-- File    : G04_XOR_GATE
-- Author  : Armstong Subero 
-- Date    : 23/05/24
--
--------------------------------------------------------------------------------
-- Description : This project implements a XOR gate
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G04_XOR_GATE IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    X      : IN  std_logic;                   
    Y      : IN  std_logic; 
  ------------------------------------------------------------------------------
  --Insert output ports below
    Z        : OUT std_logic
    );
END G04_XOR_GATE;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G04_XOR_GATE IS

BEGIN
   Z <= X xor Y;

END TypeArchitecture;
