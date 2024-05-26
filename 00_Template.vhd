--===============================================================
-- Title       : my_entity
-- File        : my_entity.vhd
-- Author      : Armstrong Subero
-- License     : MIT License
-- Description : This is a template for a VHDL entity
--===============================================================
-- Date        : 2024-05-22
-- Version     : 1.0
--===============================================================
-- Design Name : my_entity
--===============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity my_entity is
    Port (
        clk   : in  STD_LOGIC;
        rst   : in  STD_LOGIC;
        a     : in  STD_LOGIC_VECTOR(7 downto 0);
        b     : in  STD_LOGIC_VECTOR(7 downto 0);
        result: out STD_LOGIC_VECTOR(7 downto 0)
    );
end my_entity;
