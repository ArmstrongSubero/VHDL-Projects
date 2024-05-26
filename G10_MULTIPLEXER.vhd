--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android 
-- File    : G10_MULTIPLEXER
-- Author  : Armstrong Subero 
-- Date    : 23/05/24
--
--------------------------------------------------------------------------------
-- Description : This project implements a multiplexer
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G10_MULTIPLEXER IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    I0      : IN  std_logic_vector(2 downto 0);
    I1      : IN  std_logic_vector(2 downto 0);
    I2      : IN  std_logic_vector(2 downto 0);
    I3      : IN  std_logic_vector(2 downto 0);
    S       : IN  std_logic_vector(1 downto 0);
    
    
  ------------------------------------------------------------------------------
  --Insert output ports below
    O       : OUT std_logic_vector(2 DOWNTO 0) 
    );
END G10_MULTIPLEXER;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE behav1 OF G10_MULTIPLEXER IS

BEGIN
   process(I0, I1, I2, I3, S)

   begin
     case S is 
	    when "00" =>	O <= I0;
	    when "01" =>	O <= I1;
	    when "10" =>	O <= I2;
	    when "11" =>	O <= I3;
	    when others =>	O <= "ZZZ";
	end case;
   end process;

END behav1;
