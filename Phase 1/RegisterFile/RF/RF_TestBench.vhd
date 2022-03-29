--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:32:22 03/29/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase01/RF_TestBench.vhd
-- Project Name:  HRY302-Phase01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RF
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
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RF_TestBench IS
END RF_TestBench;
 
ARCHITECTURE behavior OF RF_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         Ard1 : IN  std_logic_vector(4 downto 0);
         Ard2 : IN  std_logic_vector(4 downto 0);
         Awr : IN  std_logic_vector(4 downto 0);
         Dout1 : OUT  std_logic_vector(31 downto 0);
         Dout2 : OUT  std_logic_vector(31 downto 0);
         Din : IN  std_logic_vector(31 downto 0);
         WrEn : IN  std_logic;
         Clk : IN  std_logic;
         Rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ard1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Ard2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Awr : std_logic_vector(4 downto 0) := (others => '0');
   signal Din : std_logic_vector(31 downto 0) := (others => '0');
   signal WrEn : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';

 	--Outputs
   signal Dout1 : std_logic_vector(31 downto 0);
   signal Dout2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF PORT MAP (
          Ard1 => Ard1,
          Ard2 => Ard2,
          Awr => Awr,
          Dout1 => Dout1,
          Dout2 => Dout2,
          Din => Din,
          WrEn => WrEn,
          Clk => Clk,
          Rst => Rst
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		-- Reset for 4 circles
		Rst <= '1';
		wait for Clk_period*4;
		
		-- Write on Register 10
		Rst <= '0';
		Awr <= "01010";        
		Din <= "00000000000000000000000000001111";
		WrEn <= '1';
		wait for Clk_period;
		
		-- Write on Register 5
	   Awr <= "00101";
		Din <= "00000000000000000000000000000111";
		WrEn <= '1';
		wait for Clk_period; 
 
		-- Read data from both R10 and R5 (R10 -> Dout1 & R5 -> Dout2)
		WrEn <= '0';
		Ard1 <= "01010";
		Ard2 <= "00101";
		wait for Clk_period;
		
		-- Read data from both R10 and R5 (R10 -> Dout1 & R5 -> Dout2) and check i write(in R15) is working
		WrEn <= '0';
		Ard1 <= "01010";
		Ard2 <= "00101";
		Awr <= "01111";
		Din <= "00000000000000000000001110000000";
		wait for Clk_period;
		
		-- Read data from both R15 to check(must be zero) --> correct!
		Ard1 <= "01111";
		wait for Clk_period;
		
		--Check if all of options working together at once! --> Read R10 and R5, Write on R15
		WrEn <= '1';
		Ard1 <= "01010";
		Ard2 <= "00101";
		Awr <= "01111";
		Din <= "00000000000000000000001110000000";
		wait for Clk_period;		
		
		--Check if R0 is zero:)
		WrEn <= '0';
		Ard1 <= "00000";
		Ard2 <= "00000";
		Awr <= "01111";
		Din <= "00000000000000000000001110000000";
		wait for Clk_period;	
		
		--Check if we can write on R0
		WrEn <= '1';
		Ard1 <= "00000";
		Ard2 <= "00000";
		Awr <= "00000";
		Din <= "10000000000000000000001000000000";
		wait for Clk_period;
		
		-- Write on Register 2
	   Awr <= "00010";
		Din <= "00000000000000000000000000000001";
		WrEn <= '1';
		wait for Clk_period;
		
		-- Read from R2
		Ard1 <= "00010";
		WrEn <= '0';
		wait for Clk_period;
		
		-- Resetting
		Rst <= '1';
		wait for Clk_period;
		
		wait;
   end process;

END;
