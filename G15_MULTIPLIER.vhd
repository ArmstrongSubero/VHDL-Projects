--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G15_MULTIPLIER.vhd
-- Author  : Armstrong Subero
-- Date    : 24/5/2024
--------------------------------------------------------------------------------
-- Description : This VHDL file describes a 2-bit multiplier
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY G15_MULTIPLIER IS
  PORT (
    ----------------------------------------------------------------------------
    num1    : IN  std_logic_vector(1 DOWNTO 0);                   
    num2    : IN  std_logic_vector(1 DOWNTO 0); 
    ----------------------------------------------------------------------------
    product : OUT std_logic_vector(3 DOWNTO 0)  -- 4-bit output product
  );
END G15_MULTIPLIER;

--------------------------------------------------------------------------------
-- Multiplier Architecture Definition
--------------------------------------------------------------------------------

ARCHITECTURE Behavioral OF G15_MULTIPLIER IS
BEGIN

  PROCESS(num1, num2)
    VARIABLE num1_unsigned   : unsigned(1 DOWNTO 0);
    VARIABLE num2_unsigned   : unsigned(1 DOWNTO 0);
    VARIABLE product_unsigned: unsigned(3 DOWNTO 0);
  BEGIN
    -- Convert std_logic_vector inputs to unsigned
    num1_unsigned := unsigned(num1);
    num2_unsigned := unsigned(num2);

    -- Perform multiplication
    product_unsigned := num1_unsigned * num2_unsigned;

    -- Convert the result back to std_logic_vector
    product <= std_logic_vector(product_unsigned);
  END PROCESS;

END Behavioral;
