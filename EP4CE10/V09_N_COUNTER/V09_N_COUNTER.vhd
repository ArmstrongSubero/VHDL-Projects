-- Desc: (synthesizable) N bit counter
-- ----------------------------------------------------------
-- (c) Armstrong Subero - https://trinirobotics.com/
-- Author  : Armstrong Subero
-- Contact : armstrongsubero@gmail.com
-- File    : V09_N_COUNTER.vhd
-- Target  : EP4CE10F17C8N 
-- Note    : Uses a 50 MHz external crystal
--         : Each output divides clock by 2
-- Version : 1.0
-- Date    : 08/07/2020


-- library 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


-- entity
entity V09_N_COUNTER is 
   
	-- generic
	-- 25 MHz
	-- 12.5 MHz
	-- 6.25 MHz
	-- 3.125 MHz
	generic(N : integer := 4);
	port(
		clk : in std_logic;
		clr : in std_logic;
		q   : out std_logic_vector(N-1 downto 0)
	);
end V09_N_COUNTER;

-- architecture
architecture arch of V09_N_COUNTER is
   
	-- signal 
	signal count : std_logic_vector(N-1 downto 0);
	
	-- begin architecture
   begin
		
	-- Process P1 
	-- N-bit Counter
	P1: process (clk, clr)
		 begin
		 
		 -- if clear pushed
		 -- make all outputs zero
		 if clr = '0' then
			count <= (others => '0');
		 
		 -- on rising edge inc count
		 elsif rising_edge(clk) then
			count <= count + 1;
		 end if;
		
		end process;
		 
	-- End Process P1
		
	q <= count;
		
end arch;