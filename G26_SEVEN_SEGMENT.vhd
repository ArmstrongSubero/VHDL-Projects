--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G26_SEVEN_SEGMENT
-- Author  : Armstrong Subero
-- Date    : 31/05/24
--
--------------------------------------------------------------------------------
-- Description : Creates a seven segment display
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY G26_SEVEN_SEGMENT IS
  PORT (
  ------------------------------------------------------------------------------
  -- Insert input ports below
    clk      : IN  std_logic;                    -- input bit example
    reset    : IN  std_logic; 
  ------------------------------------------------------------------------------
  -- Insert output ports below
    seout    : OUT std_logic_vector(6 downto 0); -- Bit width to match segment count
    clkout   : OUT std_logic                    
  );
END G26_SEVEN_SEGMENT;

--------------------------------------------------------------------------------
-- Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G26_SEVEN_SEGMENT IS
      signal clk_sig : std_logic;
      signal discnt  : std_logic_vector(3 downto 0) := "0000";
BEGIN
   -- Clock divider section 
   p1: process(clk, reset)
     variable cnt : integer := 0;
     begin
       if (reset = '0') then 
          clk_sig <= '0';
          cnt := 0;
       elsif rising_edge(clk) then 
          if (cnt = 4) then 
           clk_sig <= not(clk_sig);
           cnt := 0;
         else
           cnt := cnt + 1;
         end if; 
       end if;
     end process;

   clkout <= clk_sig;

   -- Seven-segment display counter section 
   p2: process(clk_sig)
     begin
       if rising_edge(clk_sig) then 
         if (discnt = "1001") then 
           discnt <= "0000";
         else
           discnt <= discnt + 1;
         end if;
       end if;
     end process;

   -- Seven-segment display section
   p3: process(discnt)
     begin 
       case discnt is 
         when "0000" => seout <= "0111111"; -- '0' turns on segments a, b, c, d, e, f (g is off)
         when "0001" => seout <= "0000110"; -- '1' turns on segments b, c (others are off)
         when "0010" => seout <= "1011011"; -- '2' turns on segments a, b, d, e, g (f, c are off)
         when "0011" => seout <= "1001111"; -- '3' turns on segments a, b, c, d, g (e, f are off)
         when "0100" => seout <= "1100110"; -- '4' turns on segments b, c, f, g (a, d, e are off)
         when "0101" => seout <= "1101101"; -- '5' turns on segments a, c, d, f, g (b, e are off)
         when "0110" => seout <= "1111101"; -- '6' turns on segments a, c, d, e, f, g (b is off)
         when "0111" => seout <= "0000111"; -- '7' turns on segments a, b, c (d, e, f, g are off)
         when "1000" => seout <= "1111111"; -- '8' turns on all segments
         when "1001" => seout <= "1101111"; -- '9' turns on segments a, b, c, d, f, g (e is off)
         when others => seout <= "0000000"; -- All segments off (invalid input)
       end case; 
     end process;

END TypeArchitecture;
