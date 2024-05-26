--------------------------------------------------------------------------------
-- Project : Gates to Android and Linux
-- File    : G17_LATCH
-- Author  : Armstrong Subero
-- Date    : 24/05/24
--
--------------------------------------------------------------------------------
-- Description : In this program we create a 
--               latch
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G17_LATCH IS
  PORT (
  ------------------------------------------------------------------------------
    data_in      : IN  std_logic;                  
    enable       : IN  std_logic;
  ------------------------------------------------------------------------------
  --Insert output ports below
    data_out     : OUT std_logic
    );
END G17_LATCH;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G17_LATCH IS

BEGIN
 
    process(data_in, enable)
    begin
        if (enable='1') then
            -- no clock signal here
	    data_out <= data_in;  
	end if;
    end process;	


END TypeArchitecture;
