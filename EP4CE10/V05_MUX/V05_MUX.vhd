-- Desc: (synthesizable) 2_1 MUX
-- ----------------------------------------------------------
-- (c) Armstrong Subero - https://trinirobotics.com/
-- Author  : Armstrong Subero
-- Contact : armstrongsubero@gmail.com
-- File    : VH05_MUX.vhd
-- Target  : EP4CE10F17C8N 
-- Note    : Uses a 50 MHz external crystal
-- Version : 1.0
-- Date    : 08/07/2020


-- library 
library ieee;
use ieee.std_logic_1164.all;

-- entity
entity V05_MUX is	
	port(
		a : in std_logic;
		b : in std_logic;
		s : in std_logic;
		y : out std_logic
	);
end V05_MUX;

-- architecture
architecture arch of V05_MUX is

begin

   -- Process P1 
	P1: process (a, b, s)
		 begin
			if s = '0' then
				y <= a;
			else
				y <= b;
			end if;
		 end process;
		 
	-- End Process P1
	
end arch;
	