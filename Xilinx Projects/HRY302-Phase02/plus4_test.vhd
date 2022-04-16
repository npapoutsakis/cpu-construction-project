--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:31:26 03/31/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase02/plus4_test.vhd
-- Project Name:  HRY302-Phase02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: plus4module
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
 
ENTITY plus4_test IS
END plus4_test;
 
ARCHITECTURE behavior OF plus4_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT plus4module
    PORT(
         input : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: plus4module PORT MAP (
          input => input,
          output => output
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		input <= "00000000000000000000000000000100";
      wait for 100 ns;

		input <= "00000000000000000000000000000101";
      wait for 100 ns;
	
		input <= "00000000000000000000000000000111";
      wait for 100 ns;

      -- wait for <clock>_period*10;
      -- insert stimulus here 

      wait;
   end process;

END;
