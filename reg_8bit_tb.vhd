library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_8bit_tb is
end reg_8bit_tb;

architecture behavior of reg_8bit_tb is 

    -- Component Declaration for the Unit Under Test (UUT)
    component reg_8bit
    port(
         D     : in  std_logic_vector(7 downto 0);
         LOAD  : in  std_logic;
         CLK   : in  std_logic;
         RESET : in  std_logic;
         Q     : out std_logic_vector(7 downto 0)
        );
    end component;

   -- Inputs
   signal D     : std_logic_vector(7 downto 0) := (others => '0');
   signal LOAD  : std_logic := '0';
   signal CLK   : std_logic := '0';
   signal RESET : std_logic := '0';

   -- Outputs
   signal Q : std_logic_vector(7 downto 0);

   -- Clock period definition (20 ns)
   constant CLK_period : time := 20 ns;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: reg_8bit port map (
          D     => D,
          LOAD  => LOAD,
          CLK   => CLK,
          RESET => RESET,
          Q     => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- 1. Initial Reset (Q hobe 00000000)
      RESET <= '1';
      wait for 40 ns;
      RESET <= '0';
      wait for 20 ns;

      -- 2. Load Data: 10101010 (AA) jokhon LOAD = '1'
      LOAD <= '1';
      D <= "10101010";
      wait for 40 ns;

      -- 3. Hold Data: D change kore 11111111 dilam kintu LOAD = '0', tai Q ager 10101010 dhore rakhbe
      LOAD <= '0';
      D <= "11111111";
      wait for 40 ns;

      -- 4. Load New Data: 01010101 (55) jokhon abar LOAD = '1' kora holo
      LOAD <= '1';
      D <= "01010101";
      wait for 40 ns;

      -- 5. Asynchronous Reset Test (Q shathe shathe 00000000 hoye jabe)
      RESET <= '1';
      wait for 40 ns;
      RESET <= '0';

      wait;
   end process;

end behavior;