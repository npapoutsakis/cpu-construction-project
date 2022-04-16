--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:06:10 04/01/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase02/cloud_test.vhd
-- Project Name:  HRY302-Phase02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cloud
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
 
ENTITY cloud_test IS
END cloud_test;
 
ARCHITECTURE behavior OF cloud_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cloud
    PORT(
         Instr15to0 : IN  std_logic_vector(15 downto 0);
         ImExt : IN  std_logic_vector(1 downto 0);
         CloudResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instr15to0 : std_logic_vector(15 downto 0) := (others => '0');
   signal ImExt : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal CloudResult : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cloud PORT MAP (
          Instr15to0 => Instr15to0,
          ImExt => ImExt,
          CloudResult => CloudResult
        );

   -- Clock process definitions
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
		Instr15to0 <= "1000000000000010";		--sign ext
		ImExt <= "00";
		wait for 100 ns;	
		
		ImExt <= "10";									--sign ext + shift << 2
		wait for 100 ns;
		
		ImExt <= "01";									--zero fill
		wait for 100 ns;
		
		ImExt <= "11";									--zero fill + shift<<16
		wait for 100 ns;
		
      wait;
   end process;

END;
