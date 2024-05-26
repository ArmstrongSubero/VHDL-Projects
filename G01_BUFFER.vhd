--------------------------------------------------------------------------------
-- Project : Gates to Liunx and Android
-- File    : G01_Buffer
-- Author  : Armstrong Subero
-- Date    : 23/05/24
--
--------------------------------------------------------------------------------
-- Description : This project creates a buffer 
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G01_BUFFER IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
     X     : IN  std_logic;           
    
  ------------------------------------------------------------------------------
  --Insert output ports below
     Y      : OUT std_logic
    );
END G01_BUFFER;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G01_BUFFER IS

BEGIN
   -- Simple concurrent signal assignment 
    Y <= X;
END TypeArchitecture;
