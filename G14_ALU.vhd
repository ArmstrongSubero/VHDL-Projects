--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G14_ALU.vhd
-- Author  : Armstrong Subero
-- Date    : 24/05/2024
--------------------------------------------------------------------------------
-- Description : This VHDL file describes an Arithmetic Logic Unit (ALU)
--               with 4-bit input operands and 3-bit select lines.
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY G14_ALU IS
  PORT (
    ----------------------------------------------------------------------------
    A      : IN  std_logic_vector(3 DOWNTO 0);  -- 4-bit input A
    B      : IN  std_logic_vector(3 DOWNTO 0);  -- 4-bit input B
    Sel    : IN  std_logic_vector(2 DOWNTO 0);  -- 3-bit selection input
    ----------------------------------------------------------------------------
    Result : OUT std_logic_vector(3 DOWNTO 0)  -- 4-bit output for the result
  );
END G14_ALU;

--------------------------------------------------------------------------------
-- ALU Architecture Definition
--------------------------------------------------------------------------------

ARCHITECTURE Behavioral OF G14_ALU IS

  -- Signal declarations for intermediate results
  SIGNAL A_int, B_int : unsigned(3 DOWNTO 0);  -- Intermediate unsigned signals for A and B
  SIGNAL Result_int   : unsigned(3 DOWNTO 0);  -- Intermediate 4-bit unsigned result

BEGIN

  -- Convert std_logic_vector to unsigned for arithmetic operations
  A_int <= unsigned(A);
  B_int <= unsigned(B);

  PROCESS(A_int, B_int, Sel)
  BEGIN
    -- Use case statement to achieve different operations of ALU
    CASE Sel IS
      WHEN "000" =>
        Result_int <= A_int + B_int;  -- Addition
      WHEN "001" =>
        Result_int <= A_int - B_int;  -- Subtraction
      WHEN "010" =>
        Result_int <= A_int AND B_int;  -- Logical AND
      WHEN "011" =>
        Result_int <= A_int OR B_int;   -- Logical OR
      WHEN "100" =>
        Result_int <= A_int XOR B_int;  -- Logical XOR
      WHEN "101" =>
        Result_int <= NOT A_int;        -- Logical NOT A
      WHEN OTHERS =>
        Result_int <= (others => '0');  -- Default operation
    END CASE;
  END PROCESS;

  -- Assign the intermediate result to the output
  Result <= std_logic_vector(Result_int);

END Behavioral;
