--------------------------------------------------------------------------------
-- Project : Gates to Android and Linux
-- File    : G15_MULTIPLIER.vhd
-- Author  : Armstrong Subero
-- Date    : 24/5/2024
--------------------------------------------------------------------------------
-- Description : This VHDL file describes a 2-bit multiplier using
--               the shifting and adding method.
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY G16_MULTIPLIER_SA IS
  PORT (
    ----------------------------------------------------------------------------
    num1    : IN  std_logic_vector(1 DOWNTO 0);                   
    num2    : IN  std_logic_vector(1 DOWNTO 0); 
    ----------------------------------------------------------------------------
    product : OUT std_logic_vector(3 DOWNTO 0)  -- 4-bit output product
  );
END G16_MULTIPLIER_SA;

--------------------------------------------------------------------------------
-- Multiplier Architecture Definition
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G16_MULTIPLIER_SA IS
BEGIN

  PROCESS(num1, num2)
    VARIABLE product_reg : std_logic_vector(3 DOWNTO 0);
    VARIABLE num1_ext : std_logic_vector(3 DOWNTO 0);
  BEGIN
    product_reg := (others => '0');  -- Initialize the product to 0
    num1_ext := "00" & num1;         -- Extend num1 to 4 bits

    -- Shifting and adding algorithm
    FOR i IN 0 TO 1 LOOP
      IF num2(i) = '1' THEN
        product_reg := std_logic_vector(unsigned(product_reg) + (unsigned(num1_ext) sll i));
      END IF;
    END LOOP;

    -- Assign the result to the output
    product <= product_reg;
  END PROCESS;

END TypeArchitecture;
