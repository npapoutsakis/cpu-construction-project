--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:43:35 03/27/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase01/Decoder5to32_TestBench.vhd
-- Project Name:  HRY302-Phase01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder5to32
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
 
ENTITY Decoder5to32_TestBench IS
END Decoder5to32_TestBench;
 
ARCHITECTURE behavior OF Decoder5to32_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder5to32
    PORT(
         DecoderInput : IN  std_logic_vector(4 downto 0);
         DecoderOutput : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DecoderInput : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal DecoderOutput : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder5to32 PORT MAP (
          DecoderInput => DecoderInput,
          DecoderOutput => DecoderOutput
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
      DecoderInput <= "11111";
		wait for 100 ns;	

      DecoderInput <= "00100";
		wait for 100 ns;	

		DecoderInput <= "00000";
		wait for 100 ns;	

		DecoderInput <= "00110";
		wait for 100 ns;

		DecoderInput <= "00111";
		wait for 100 ns;      
		
		wait;
   end process;

END;
