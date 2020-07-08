-- Desc: (synthesizable) LED Switch
-- ----------------------------------------------------------
-- (c) Armstrong Subero - https://trinirobotics.com/
-- Author  : Armstrong Subero
-- Contact : armstrongsubero@gmail.com
-- File    : VH02_SWITCH.vhd
-- Target  : EP4CE10F17C8N 
-- Note    : Uses a 50 MHz external crystal
-- Version : 1.0
-- Date    : 07/04/2020


-- library 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


-- entity
entity V02_SWITCH is 
	port(
		data:  in std_logic_vector(4 downto 0);
		leds:  out std_logic_vector(3 downto 0)
	);
end V02_SWITCH;

-- architecture
architecture arch of V02_SWITCH is
   
   -- begin architecture
   begin
	
	
	-- Process P1 
	-- Turn on LED according to which switch is pressed
	P1: process (data)
		  begin
		  
			 if (data = "11110") then
				leds <= "1110";
				
			 elsif (data = "11101") then
				leds <= "1101";
			
			 elsif (data = "10111") then
				leds <= "1011";
			
			 elsif (data = "01111") then	
				leds <= "1010";
			
			 else
				leds <= "1111";
				
	       end if;
			
		 end process;
		 
	-- End Process P1
		
end arch;