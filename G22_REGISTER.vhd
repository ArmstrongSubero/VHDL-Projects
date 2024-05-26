--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G22_REGISTER
-- Author  : Armstrong Subero
-- Date    : 24/05/24
--
--------------------------------------------------------------------------------
-- Description : This project demonstrates how to 
--               create a register
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G22_REGISTER IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clock      : IN  std_logic;                    
    I          : IN  std_logic_vector(1 downto 0);
    load       : IN  std_logic;
    clear      : IN  std_logic;
  ------------------------------------------------------------------------------
  --Insert output ports below
    Q        : OUT std_logic_vector(1 DOWNTO 0)
    );
END G22_REGISTER;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G22_REGISTER IS
  signal Q_tmp: std_logic_vector(1 DOWNTO 0);

BEGIN
  -- sensitivity list have clock and clear needed 
  -- to trigger the process
  process(clock, clear)
  begin 
    -- check clear independent of clock edge
    if clear = '1' then
      Q_tmp <= (others => '0');
    elsif rising_edge(clock) then
      if load = '1' then
        Q_tmp <= I;
      end if;
    end if;
  end process;

  -- concurrent statement for output
  Q <= Q_tmp;


END TypeArchitecture;
