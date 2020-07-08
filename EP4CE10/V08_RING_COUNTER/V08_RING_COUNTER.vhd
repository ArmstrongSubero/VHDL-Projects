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
entity V08_RING_COUNTER is 
	port(
		clk : in std_logic;
		clr : in std_logic;
		q  : out std_logic_vector(3 downto 0)
	);
end V08_RING_COUNTER;

-- architecture
architecture arch of V08_RING_COUNTER is
   
	-- signal 
	signal qs: std_logic_vector(3 downto 0);
	
	signal count : integer :=1;
   signal clk1 : std_logic :='0';

	
	-- begin architecture
   begin
	
	-- Process P0 
	-- 1 Hz Clock
	P0: process(clk) 
	   begin
		   if rising_edge(clk) then
			  count <=count+1;
			  
			  if(count = 24999999) then
			   clk1 <= not clk1;
			   count <=1;
			  end if;
			end if;
	   end process;
	-- End Process P0
	
	-- Process P1 
	-- 4-bit ring counter
	P1: process (clk1, clr)
		 begin
		 
		 if clr = '0' then
			qs <= "0001";
			
		 elsif rising_edge(clk1) then
			qs(3) <= qs(0);
			qs(2 downto 0) <= qs(3 downto 1);
		 end if;
		 
		 if qs = "1111" then
			qs <= "0001";
		 end if;
		
		 end process;
		 
	-- End Process P1
		
	q <= qs;
		
end arch;