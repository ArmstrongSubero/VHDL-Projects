--------------------------------------------------------------------------------
-- Project : RAM Module
-- File    : G24_RAM.vhdl
-- Author  : Armstrong Subero
-- Date    : 24/05/24
--------------------------------------------------------------------------------
-- Description : A fixed-size RAM module with read and write functionality.
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; -- Use this library for arithmetic operations

ENTITY G24_RAM IS
  PORT (
    ------------------------------------------------------------------------------
    -- Insert input ports below
    clock      : IN  std_logic;
    enable     : IN  std_logic;
    read       : IN  std_logic;
    write      : IN  std_logic;
    read_addr  : IN  std_logic_vector(1 downto 0); -- 2-bit address for 4-depth
    write_addr : IN  std_logic_vector(1 downto 0); -- 2-bit address for 4-depth
    data_in    : IN  std_logic_vector(3 downto 0); -- 4-bit data input
    ------------------------------------------------------------------------------
    -- Insert output ports below
    data_out   : OUT std_logic_vector(3 downto 0)  -- 4-bit data output
  );
END G24_RAM;

--------------------------------------------------------------------------------
-- Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G24_RAM IS

  -- Constants for fixed RAM size
  CONSTANT width : integer := 4; -- Data width
  CONSTANT depth : integer := 4; -- Depth
  CONSTANT addr  : integer := 2; -- Address width (log2(depth))

  -- Type declaration for RAM array
  TYPE ram_type IS ARRAY (0 TO depth-1) OF std_logic_vector(width-1 downto 0);
  
  -- Signal declaration for the RAM
  SIGNAL tmp_ram : ram_type := (OTHERS => (OTHERS => '0'));

BEGIN
  -- Read Functional Section
  PROCESS (clock)
  BEGIN
    IF rising_edge(clock) THEN
      IF enable = '1' THEN
        IF read = '1' THEN
          data_out <= tmp_ram(to_integer(unsigned(read_addr)));
        ELSE
          data_out <= (OTHERS => 'Z');
        END IF;
      END IF;
    END IF;
  END PROCESS;
	
  -- Write Functional Section
  PROCESS (clock)
  BEGIN
    IF rising_edge(clock) THEN
      IF enable = '1' THEN
        IF write = '1' THEN
          tmp_ram(to_integer(unsigned(write_addr))) <= data_in;
        END IF;
      END IF;
    END IF;
  END PROCESS;

END TypeArchitecture;
