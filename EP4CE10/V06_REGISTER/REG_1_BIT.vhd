-- Desc: (synthesizable) 1 bit register
-- ----------------------------------------------------------
-- (c) Armstrong Subero - https://trinirobotics.com/
-- Author  : Armstrong Subero
-- Contact : armstrongsubero@gmail.com
-- File    : REG_1_BIT.vhd
-- Target  : EP4CE10F17C8N 
-- Note    : Uses a 50 MHz external crystal
-- Version : 1.0
-- Date    : 08/07/2020


-- library 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


-- entity
entity REG_1_BIT is 
	port(
		load: in std_logic;
		inp0: in std_logic;
		clk : in std_logic;
		clr : in std_logic;
		q0  : out std_logic
	);
end REG_1_BIT;

-- architecture
architecture arch of REG_1_BIT is
   
	-- signal 
	signal D, q : std_logic;
	
	-- begin architecture
   begin
	
	D <= (q and (not load)) or (inp0 and load);
	
	
	-- Process P1 
	-- D Flip Flop
	P1: process (clk, clr)
		 begin
		 
		 if clr = '1' then
			q <= '0';
			
		 elsif rising_edge(clk) then
			q <= D;
		 end if;
		
		 end process;
		 
	-- End Process P1
		
	q0 <= q;
		
end arch;