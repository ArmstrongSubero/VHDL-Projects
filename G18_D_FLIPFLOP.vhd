--------------------------------------------------------------------------------
-- Project : Gates to Android and Linux
-- File    : G18_D_FLIPFLOP
-- Author  : Armstrong Subero
-- Date    : 24/05/23
--
--------------------------------------------------------------------------------
-- Description : Implements a D Flip Flop
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G18_D_FLIPFLOP IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    data_in      : IN  std_logic;                    
    clock        : IN  std_logic; 
  ------------------------------------------------------------------------------
  --Insert output ports below
    data_out     : OUT std_logic                
    );
END G18_D_FLIPFLOP;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G18_D_FLIPFLOP IS

BEGIN
  process(data_in, clock)
  begin
  if (clock='1' and clock'event) then
     data_out <= data_in;
  end if;
  end process;

END TypeArchitecture;
