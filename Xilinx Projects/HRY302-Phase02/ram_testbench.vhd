--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:10:26 03/31/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase02/ram_testbench.vhd
-- Project Name:  HRY302-Phase02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM
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
 
ENTITY ram_testbench IS
END ram_testbench;
 
ARCHITECTURE behavior OF ram_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
    PORT(
         clk : IN  std_logic;
         inst_addr : IN  std_logic_vector(10 downto 0);
         inst_dout : OUT  std_logic_vector(31 downto 0);
         data_we : IN  std_logic;
         data_addr : IN  std_logic_vector(10 downto 0);
         data_din : IN  std_logic_vector(31 downto 0);
         data_dout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal inst_addr : std_logic_vector(10 downto 0) := (others => '0');
   signal data_we : std_logic := '0';
   signal data_addr : std_logic_vector(10 downto 0) := (others => '0');
   signal data_din : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal inst_dout : std_logic_vector(31 downto 0);
   signal data_dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          clk => clk,
          inst_addr => inst_addr,
          inst_dout => inst_dout,
          data_we => data_we,
          data_addr => data_addr,
          data_din => data_din,
          data_dout => data_dout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      
		--Initialiazation
		inst_addr <= "00000000000";
		data_we <= '0';
		data_addr <= "10000000000"; --1024
		data_din <= "00000000000000000000000000000000";
		wait for clk_period;	
		
		--Read the first 10 instuctions
		for i in 0 to 9 loop 
			inst_addr <= inst_addr + 1;
			wait for clk_period;
		end loop;
      
		
		data_we <= '1';
		inst_addr <= "00000000000";
		data_din <= "01111000010101111111010010111110";
		wait for clk_period;
		
		--Write my student id in the first 10 positions	
		for i in 0 to 9 loop 
			data_addr <= data_addr + 1;
			wait for clk_period;
		end loop;
		
		data_we <= '0';
		inst_addr <= "00000000000";
		data_addr <= "10000000000"; --1024
		data_din <= "00000000000000000000000000000000";
		wait for clk_period;
		
		--Read the first 10 data to check
		for i in 0 to 9 loop 
			data_addr <= data_addr + 1;
			wait for clk_period;
		end loop;
		
      -- insert stimulus here 

      wait;
   end process;

END;
