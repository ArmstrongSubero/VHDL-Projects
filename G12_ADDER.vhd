--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G12_ADDER
-- Author  : Armstrong Subero
-- Date    : 23/05/24
--------------------------------------------------------------------------------
-- Description : This program implements an adder
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY G12_ADDER IS
    PORT (
        A      : IN  std_logic_vector(1 DOWNTO 0);                   
        B      : IN  std_logic_vector(1 DOWNTO 0);
        carry  : OUT std_logic;                    
        sum    : OUT std_logic_vector(1 DOWNTO 0)
    );
END G12_ADDER;

--------------------------------------------------------------------------------
-- Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G12_ADDER IS

-- Signal to store the result
signal result: std_logic_vector(2 DOWNTO 0);

BEGIN
    -- The 3rd bit should be carry
    result <= std_logic_vector(unsigned('0' & A) + unsigned('0' & B));
    sum <= result(1 DOWNTO 0);
    carry <= result(2);

END TypeArchitecture;
