--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:34:39 03/28/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase01/Mux32to1_TestBench.vhd
-- Project Name:  HRY302-Phase01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux32to1
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
use work.Array_Variable.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Mux32to1_TestBench IS
END Mux32to1_TestBench;
 
ARCHITECTURE behavior OF Mux32to1_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux32to1
    PORT(
         Input : IN  number_of_32_bits;
         Sel : IN  std_logic_vector(4 downto 0);
         Dout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Input : number_of_32_bits;
   signal Sel : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Dout : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux32to1 PORT MAP (
          Input => Input,
          Sel => Sel,
          Dout => Dout
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
		
		for i in 0 to 31 loop
			Input(i) <= (others => '0');
			if i = 3 or i = 10 then
				Input(i) <= "01000000000000000000000000000100";
			end if;
		end loop;
		
		for i in 0 to 31 loop
			Sel <= "00000" + i;
			wait for 30ns;
		end loop;
	
      wait;
   end process;

END;

