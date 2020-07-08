-- Desc: (synthesizable) Generates a PWM Output
-- ----------------------------------------------------------
-- (c) Armstrong Subero - https://trinirobotics.com/
-- Author  : Armstrong Subero
-- Contact : armstrongsubero@gmail.com
-- File    : V04_PWM.vhd
-- Target  : EP4CE10F17C8N 
-- Note    : Uses a 50 MHz external crystal
--         : PWM Signal is 5 MHz
-- Version : 1.0
-- Date    : 07/04/2020


-- library 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


-- entity
entity V04_PWM is 
	port(
	   --50 MHz Clock
	   clk : in std_logic;    
		
		-- Increase duty cycle button
		increase_duty_cycle : in std_logic;
		
		-- Decrease duty cycle button
		decrease_duty_cycle : in std_logic;
		
		-- pwm output signal
		pwm_output : out std_logic
	);
end V04_PWM;

-- architecture
architecture arch of V04_PWM is

   -- architecture components 
	-- D Flip Flop for Debouncing
	component D_FF
	port(
	   clk : in std_logic;
		en  : in std_logic;
		D   : in std_logic;
		Q   : out std_logic
	);
	end component;
	
  
   -- architecture signals
	
	-- slow clock for debouncing
	signal slow_clk_en : std_logic := '0';
	
	-- counter for creating slow clock
	signal counter_slow : std_logic_vector(27 downto 0);
	
	-- temporary signals for debouncing
	signal tmp1, tmp2, duty_inc: std_logic;
	signal tmp3, tmp4, duty_dec: std_logic;
	
	-- counter for the pwm signal
	signal counter_pwm: std_logic_vector(3 downto 0):=(others => '0');
	signal duty_cycle: std_logic_vector(3 downto 0):= x"5";
   
   -- begin architecture
   begin
		
	-- Process P1 
	-- generate slow clock enable for debouncing
	P1: process (clk)
		  begin
		     if (rising_edge(clk)) then
				   counter_slow <= counter_slow + x"0000001";
					
			  if (counter_slow >= x"17D7840") then
					counter_slow <= x"0000000";
			  end if;
			  end if;
		 end process;
		 
	-- End Process P1
	
	
   slow_clk_en <= '1' when counter_slow = x"17D7840" else '0';
	
	-- debounce for increasing duty cycle button
	stage0 : D_FF port map(clk, slow_clk_en, increase_duty_cycle, tmp1);
	stage1 : D_FF port map(clk, slow_clk_en, tmp1, tmp2);
	
	duty_inc <= tmp1 and (not tmp2) and slow_clk_en;
	
	-- debounce for decreaing duty cycle button
	stage2 : D_FF port map(clk, slow_clk_en, decrease_duty_cycle, tmp3);
   stage3 : D_FF port map(clk, slow_clk_en, tmp3, tmp4);

	duty_dec <= tmp3 and (not tmp4) and slow_clk_en;
	
	
	-- Process P2 
	-- controls duty cycle with buttons
	P2: process (clk)
		  begin
			if (rising_edge(clk)) then
				if(duty_inc = '1' and duty_cycle <= x"9") then
					duty_cycle <= duty_cycle + x"1";
				
				elsif(duty_dec = '1' and duty_cycle >= x"1") then
					duty_cycle <= duty_cycle - x"1";
				end if;
			end if;
		 end process;
		 
	-- End Process P2
	
	-- Process P3 
	-- Generate 5 MHz PWM Signal
	P3: process (clk)
		  begin
			if (rising_edge(clk)) then
				counter_pwm <= counter_pwm + x"1";
			
			if (counter_pwm >= x"9") then
				counter_pwm <= x"0";
			end if;
			end if;
		 end process;
		 
	-- End Process P3
	
	pwm_output <= '1' when counter_pwm < duty_cycle else '0';
		
end arch;