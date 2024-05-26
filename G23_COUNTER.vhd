--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G23_Counter
-- Author  : Armstrong Subero
-- Date    : 24/05/24
--
--------------------------------------------------------------------------------
-- Description : Implements a counter
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY G23_COUNTER IS
  PORT (
    ------------------------------------------------------------------------------
    -- Insert input ports below
    clock : IN  std_logic;
    clear : IN  std_logic;
    count : IN  std_logic;
    ------------------------------------------------------------------------------
    -- Insert output ports below
    Q     : OUT std_logic_vector(1 DOWNTO 0)
  );
END G23_COUNTER;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G23_COUNTER IS
 signal Pre_Q : std_logic_vector(1 DOWNTO 0) := (others => '0');

BEGIN
  process(clock, clear)
  begin 
    if clear = '1' then 
       Pre_Q <= (others => '0');
    elsif rising_edge(clock) then
       if count = '1' then
         Pre_Q <= std_logic_vector(unsigned(Pre_Q) + 1);
       end if;
    end if;
  end process;

  Q <= Pre_Q;


END TypeArchitecture;
