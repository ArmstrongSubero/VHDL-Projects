--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G19_JK_FLIP_FLOP
-- Author  : Armstrong Subero
-- Date    : 24/05/24
--
--------------------------------------------------------------------------------
-- Description : Implements a JK Flip Flop
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G19_JK_FLIPFLOP IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clock      : IN  std_logic;    
    J, K       : IN  std_logic;
    reset      : IN  std_logic; 
  ------------------------------------------------------------------------------
  --Insert output ports below
    Q, Qbar    : OUT std_logic
    );
END G19_JK_FLIPFLOP;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G19_JK_FLIPFLOP IS

    signal state: std_logic;
    signal input: std_logic_vector(1 downto 0);

BEGIN

   -- combine inputs into vector
    input <= J & K;		

    p: process(clock, reset) is
    begin
	
	if (reset='1') then
	    state <= '0';
	elsif (rising_edge(clock)) then

            -- compare to the truth table
	    case (input) is
		when "11" =>
		    state <= not state;
		when "10" =>
		    state <= '1';
		when "01" =>
		    state <= '0';
		when others =>
		    null;
		end case;
	end if;

    end process;
	
    -- concurrent statements
    Q <= state;
    Qbar <= not state;

END TypeArchitecture;
