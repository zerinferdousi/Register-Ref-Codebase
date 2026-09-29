library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_1bit is
    Port ( D     : in  STD_LOGIC;
           LOAD  : in  STD_LOGIC;
           CLK   : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Q     : out STD_LOGIC);
end reg_1bit;

architecture Structural of reg_1bit is

    -- mux2 component
    component mux2 is
        Port ( D0  : in  STD_LOGIC;
               D1  : in  STD_LOGIC;
               SEL : in  STD_LOGIC;
               Y   : out STD_LOGIC);
    end component;

    -- d_ff component
    component d_ff is
        Port ( D     : in  STD_LOGIC;
               CLK   : in  STD_LOGIC;
               RESET : in  STD_LOGIC;
               Q     : out STD_LOGIC);
    end component;

    signal mux_out    : STD_LOGIC;
    signal q_internal : STD_LOGIC;

begin

    -- LOAD='0' hole ager data (q_internal), LOAD='1' hole notun data (D)
    MUX_INST: mux2 port map (
        D0  => q_internal,
        D1  => D,
        SEL => LOAD,
        Y   => mux_out
    );

    -- D Flip-Flop
    FF_INST: d_ff port map (
        D     => mux_out,
        CLK   => CLK,
        RESET => RESET,
        Q     => q_internal
    );

    Q <= q_internal;

end Structural;