-- Desc: (synthesizable) LED Chaser
-- ----------------------------------------------------------
-- (c) Armstrong Subero - https://trinirobotics.com/
-- Author  : Armstrong Subero
-- Contact : armstrongsubero@gmail.com
-- File    : VH01_LEDS.vhd
-- Target  : EP4CE10F17C8N 
-- Note    : Uses a 50 MHz external crystal
-- Version : 1.0
-- Date    : 07/04/2020


-- library 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


-- entity
entity V01_LEDS is 
	port(
		clk: in std_logic;
		leds: out std_logic_vector(3 downto 0)
	);
end V01_LEDS;

-- architecture
architecture arch of V01_LEDS is
   
	-- signal 
	signal clk1, clk2 : std_logic;
	
	-- begin architecture
   begin
	
	
	-- Process P1 
	P1: process (clk)
		 variable count : integer range 0 to 9999999;
		
		  begin
			if clk'event and clk='1' then
				if count <= 4999999 then
					clk1 <= '0';
					count := count + 1;
					
				elsif count >= 4999999 and count <= 9999999 then
					clk1 <= '1';
					count := count + 1;
				else count := 0;
			  end if;
			 end if;
		 end process;
		 
	-- End Process P1
	
		
	-- Process P2
	P2: process(clk1)
		 begin	
			if clk1'event and clk1 = '1' then
				clk2 <= not clk2;
			end if;
		 end process;
		 
	-- End Process P2 

	
	-- Process P3	 
	P3: process(clk2)
		 variable count1: integer range 0 to 16;
	    
		 begin
			if clk2'event and clk2='1' then
				if count1 <= 4 then
					if count1 = 4 then
						count1 := 0;
					end if;
				
				case count1 is 
					when 0=> leds <="1110";
					when 1=> leds <="1101";
					when 2=> leds <="1011";
					when 3=> leds <="0111";
					
					when others=> leds <="1111";
				end case;
			
			   count1 := count1 + 1;
		     end if;
		   end if;
		 end process;
		 
	-- End process P3	 
		
end arch;