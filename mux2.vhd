library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
    Port ( D0  : in  STD_LOGIC;
           D1  : in  STD_LOGIC;
           SEL : in  STD_LOGIC;
           Y   : out STD_LOGIC);
end mux2;

architecture Behavioral of mux2 is
begin
    process(D0, D1, SEL)
    begin
        if SEL = '0' then
            Y <= D0;
        else
            Y <= D1;
        end if;
    end process;
end Behavioral;