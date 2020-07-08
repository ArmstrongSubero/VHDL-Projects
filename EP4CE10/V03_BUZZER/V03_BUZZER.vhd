-- Desc: (synthesizable) Buzzer
-- ----------------------------------------------------------
-- (c) Armstrong Subero - https://trinirobotics.com/
-- Author  : Armstrong Subero
-- Contact : armstrongsubero@gmail.com
-- File    : VH03_BUZZER.vhd
-- Target  : EP4CE10F17C8N 
-- Note    : Uses a 50 MHz external crystal
--         : Buzzer is driven by PNP Transistor
-- Version : 1.0
-- Date    : 07/04/2020


-- library 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


-- entity
entity V03_BUZZER is 
	port(
	   clk :    in std_logic;
		buzzer:  out std_logic
	);
end V03_BUZZER;

-- architecture
architecture arch of V03_BUZZER is
   
   -- begin architecture
   begin
	
	-- Process P1 
	-- Generates a tone for the buzzer
	P1: process (clk)
	    variable cnt: integer range 0 to 24999999;
		 variable ff: std_logic;
		 
		 begin
			if clk'event and clk='1' then
				if cnt < 24999 then 
					cnt := cnt + 1;
				else
					cnt := 0;
				   ff := not ff;
				end if;
			end if;
		
		 buzzer <= not ff;
		 	
		end process;
		 
	-- End Process P1
		
end arch;