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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


-- entity
entity V03_BUZZER_SEC is 
	port(
	   clk :    in std_logic;
		buzzer:  out std_logic
	);
end V03_BUZZER_SEC;

-- architecture
architecture arch of V03_BUZZER_SEC is
   
   -- begin architecture
   begin
	
	-- Process P1 
	-- Generates a tone for the buzzer
	-- every second
	P1: process (clk)
	    variable i : integer := 0;
		 
		 begin
			if clk'event and clk='1' then
				if i <= 50000000 then 
					i := i + 1;
					buzzer <= '1';
					 
				elsif i > 50000000 and i < 100000000 then
					i := i + 1;
					buzzer <= '0';
					
				elsif i = 100000000 then
					i := 0;
				end if;
			end if;
		 	
		end process;
		 
	-- End Process P1
		
end arch;