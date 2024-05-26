--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G25_ROM.vhd
-- Author  : Armstrong Subero
-- Date    : 25/05/24
--
--------------------------------------------------------------------------------
-- Description :
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY G25_ROM IS
  PORT (
  ------------------------------------------------------------------------------
  -- Insert input ports below
    clock      : IN  std_logic;                    -- input bit example
    reset      : IN  std_logic;
    enable     : IN  std_logic;
    read       : IN  std_logic;
    address    : IN  std_logic_vector(4 downto 0);
    
  ------------------------------------------------------------------------------
  -- Insert output ports below
    data_out   : OUT std_logic_vector(7 DOWNTO 0)
  );
END G25_ROM;

--------------------------------------------------------------------------------
-- Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G25_ROM IS
  TYPE ROM_ARRAY IS ARRAY(0 TO 31) OF std_logic_vector(7 downto 0);

  CONSTANT content : ROM_ARRAY := (
       0  => "00000001", -- Suppose ROM has 
       1  => "00000010", -- prestored value
       2  => "00000011", -- like this table
       3  => "00000100", 
       4  => "00000101", 
       5  => "00000110", 
       6  => "00000111", 
       7  => "00001000", 
       8  => "00001001", 
       9  => "00001010", 
      10  => "00001011", 
      11  => "00001100", 
      12  => "00001101", 
      13  => "00001110", 
      14  => "00001111", 
      OTHERS => "11111111" 
  );

BEGIN

  PROCESS(clock, reset)
  BEGIN
    IF (reset = '1') THEN
      data_out <= (others => 'Z');
    ELSIF (clock'event AND clock = '1') THEN
      IF enable = '1' THEN
        IF (read = '1') THEN
          data_out <= content(to_integer(unsigned(address)));
        ELSE
          data_out <= (others => 'Z');
        END IF;
      END IF;
    END IF;
  END PROCESS;

END TypeArchitecture;
