--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:52:07 03/27/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase01/Register_TestBench.vhd
-- Project Name:  HRY302-Phase01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register32Bit
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
 
ENTITY Register_TestBench IS
END Register_TestBench;
 
ARCHITECTURE behavior OF Register_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register32Bit
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         WE : IN  std_logic;
         Datain : IN  std_logic_vector(31 downto 0);
         Dataout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal WE : std_logic := '0';
   signal Datain : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Dataout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register32Bit PORT MAP (
          CLK => CLK,
          RST => RST,
          WE => WE,
          Datain => Datain,
          Dataout => Dataout
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
		--Reset is On
		RST <= '1';
      wait for 100 ns;	
		
		RST <= '0';
      WE <= '1';
      Datain <= "00000000000000000000000000000100";
      wait for 50 ns;
		
      WE <= '1';
      Datain <= "00000000000000000000000000000001";
      wait for 50 ns;
		
      WE <= '1';
      Datain <= "00000000000000000000000000001111";
      wait for 50 ns;
      
      WE <= '0';
      Datain <= "00000000000000000000000000000000";
      wait for 50 ns;
		
      WE <= '1';
      Datain <= "00000000000000000000000000001000";
      wait for 50 ns;
		
      WE <= '0';
      Datain <= "00000000000000000000000000001111";
      wait for 50 ns;
      
	  WE <= '1';
      Datain <= "11111111111111111111111110000100";
      wait for 50 ns;
		
		WE <= '1';
      Datain <= "11111111111111111111111111111100";
      wait for 50 ns;
		
		wait;
   end process;

END;
