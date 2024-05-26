--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G11_Decoder
-- Author  : Armstrong Subero
-- Date    : 23/05/24
--
--------------------------------------------------------------------------------
-- Description : This project implements a decoder
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G11_DECODER IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    I       : IN  std_logic_vector(1 DOWNTO 0); 
  ------------------------------------------------------------------------------
  --Insert output ports below
    O        : OUT std_logic_vector(3 DOWNTO 0)  
    );
END G11_DECODER;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G11_DECODER IS
BEGIN
    process (I)
    begin
    case I is
	    when "00" => O <= "0001";
	    when "01" => O <= "0010";
	    when "10" => O <= "0100";
	    when "11" => O <= "1000";
	    when others => O <= "XXXX";
	end case;
    end process;

END TypeArchitecture;
