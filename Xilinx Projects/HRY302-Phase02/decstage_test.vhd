--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:42:13 04/01/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase02/decstage_test.vhd
-- Project Name:  HRY302-Phase02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DECSTAGE
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
 
ENTITY decstage_test IS
END decstage_test;
 
ARCHITECTURE behavior OF decstage_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECSTAGE
    PORT(
         Instr : IN  std_logic_vector(31 downto 0);
         RF_WrEn : IN  std_logic;
         ALU_out : IN  std_logic_vector(31 downto 0);
         MEM_out : IN  std_logic_vector(31 downto 0);
         RF_WrData_sel : IN  std_logic;
         RF_B_sel : IN  std_logic;
--       ImmExt : IN  std_logic_vector(1 downto 0);
         Clk : IN  std_logic;
         Immed : OUT  std_logic_vector(31 downto 0);
         RF_A : OUT  std_logic_vector(31 downto 0);
         RF_B : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrEn : std_logic := '0';
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_out : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrData_sel : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
--   signal ImmExt : std_logic_vector(1 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
   signal RF_A : std_logic_vector(31 downto 0);
   signal RF_B : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECSTAGE PORT MAP (
          Instr => Instr,
          RF_WrEn => RF_WrEn,
          ALU_out => ALU_out,
          MEM_out => MEM_out,
          RF_WrData_sel => RF_WrData_sel,
          RF_B_sel => RF_B_sel,
			 --ImmExt => ImmExt,
          Clk => Clk,
          Immed => Immed,
          RF_A => RF_A,
          RF_B => RF_B
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
      -- hold reset state for 100 ns.
--		Instr <= "opcode_regiS_regiD_regiT_unuse_functn		
--		Instr <= "opcode_regiS_regiD_....16bitImm....
--		Instr <= "111000_00000_00000_0000000000000001";
      wait for 200 ns;	
		
		--Store ALU_out in R1.
		Instr <= "00000000000000010000000000000001"; 
		ALU_out <= "00000000000000000000000000000011";
		MEM_out <= "00000000000000000000000000000000";
		RF_WrData_sel <= '0';		
		RF_WrEn <= '1';
		RF_B_sel <= '0';
		wait for 100 ns;
		
		--Store ALU_out in R2.
		Instr <= "00000000000000100000000000000100"; 
		ALU_out <= "00000000000000000000000000000111";
		MEM_out <= "00000000000000000000000000000000";
		wait for 100 ns;
		
		--Read from R1 and R2
		Instr <= "00000000001000100000000000000100";
		RF_WrEn <= '0';
		RF_B_sel <= '1';
		wait for 100 ns;
		
		--Test writing on R0
		Instr <= "10000000000000000000000000001111";
		RF_WrEn <= '1';
		wait for 100 ns;

      -- insert stimulus here 
      wait;
   end process;

END;
