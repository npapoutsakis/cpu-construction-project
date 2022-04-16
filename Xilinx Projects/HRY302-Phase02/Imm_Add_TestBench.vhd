--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:01:51 03/31/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase02/Imm_Add_TestBench.vhd
-- Project Name:  HRY302-Phase02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: addition_module
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Imm_Add_TestBench IS
END Imm_Add_TestBench;
 
ARCHITECTURE behavior OF Imm_Add_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT addition_module
    PORT(
         PCImmed : IN  std_logic_vector(31 downto 0);
         pc_plus4 : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PCImmed : std_logic_vector(31 downto 0) := (others => '0');
   signal pc_plus4 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addition_module PORT MAP (
          PCImmed => PCImmed,
          pc_plus4 => pc_plus4,
          result => result
        );

-- 	Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		PCImmed <= "00000000000000000000000000000101";
		pc_plus4 <= "00000000000000000000000000000101";
		wait for 100ns;

		PCImmed <= "00000000000000000000000000000111";
		pc_plus4 <= "00000000000000000000000000000111";
		wait for 100ns;

		PCImmed <= "00000000000000000000000000000001";
		pc_plus4 <= "00000000000000000000000000000001";
		wait for 100ns;

		PCImmed <= "00000000000000000000000000000011";
		pc_plus4 <= "00000000000000000000000000000011";
		wait for 100ns;

		PCImmed <= "00000000000000000000000000000001";
		pc_plus4 <= "00000000000000000000000000000011";
		wait for 100ns;
		
      wait;
   end process;

END;
