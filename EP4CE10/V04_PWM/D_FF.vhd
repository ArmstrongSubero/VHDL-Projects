-- Desc: (synthesizable) D Flip Flop
-- ----------------------------------------------------------
-- (c) Armstrong Subero - https://trinirobotics.com/
-- Author  : Armstrong Subero
-- Contact : armstrongsubero@gmail.com
-- File    : D_FF.vhd
-- Target  : EP4CE10F17C8N 
-- Note    : Uses a 50 MHz external crystal
-- Version : 1.0
-- Date    : 07/04/2020


-- library 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


-- entity
entity D_FF is 
	port(
	   clk : in std_logic;
		en : in std_logic;
		D : in std_logic;
		Q : out std_logic
	);
end D_FF;

-- architecture
architecture arch of D_FF is
   
   -- begin architecture
   begin
	
	-- Process P1 
	-- D Flip Flop
	P1: process (clk)
		  begin
		    if (rising_edge(clk)) then
				if (en = '1') then
					Q <= D;
			   end if;
			end if;
			
		  end process;
	-- End Process P1
		
end arch;