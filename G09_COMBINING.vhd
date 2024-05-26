--------------------------------------------------------------------------------
-- Project : Gates to Linux and Android
-- File    : G09_COMBINING
-- Author  : Armstrong Subero
-- Date    : 23/05/24
--------------------------------------------------------------------------------
-- Description : This project demonstrates combining components
--               these components can be in separate files
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY G09_COMBINING IS
    PORT (
        ------------------------------------------------------------------------------
        --Insert input ports below
        A : IN std_logic;                    
        B : IN std_logic;
        C : IN std_logic;
        ------------------------------------------------------------------------------
        --Insert output ports below
        Z : OUT std_logic               
    );
END G09_COMBINING;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF G09_COMBINING IS

    component AND_GATE is     -- AND gate component
        port(
            X: in std_logic;
            Y: in std_logic;
            Z: out std_logic
        );
    end component;

    component OR_GATE is 
        port(
            X: in std_logic;
            Y: in std_logic;
            Z: out std_logic
        );
    end component;

    -- interfacing signal
    signal wire: std_logic;

BEGIN
    -- pin mapping 
    Gate1: AND_GATE port map (X => A, Y => B, Z => wire);
    Gate2: OR_GATE  port map (X => wire, Y => C, Z => Z);

END TypeArchitecture;

--------------------------------------------------------------------------------
-- Component 1: OR_GATE
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity OR_GATE is
    port( 
        X: in std_logic;
        Y: in std_logic;
        Z: out std_logic
    );
end OR_GATE;

architecture behavioral of OR_GATE is
begin
    Z <= X or Y;
end behavioral;

--------------------------------------------------------------------------------
-- Component 2: AND_GATE
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity AND_GATE is
    port( 
        X: in std_logic;
        Y: in std_logic;
        Z: out std_logic
    );
end AND_GATE;

architecture behavioral of AND_GATE is
begin
    Z <= X and Y;
end behavioral;
