--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:05:08 04/07/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase03/control_testbench.vhd
-- Project Name:  HRY302-Phase03
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CONTROL
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
 
ENTITY control_testbench IS
END control_testbench;
 
ARCHITECTURE behavior OF control_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONTROL
    PORT(
         PC_Selection : OUT  std_logic;
         PC_LoadEnable : OUT  std_logic;
         Opcode : IN  std_logic_vector(5 downto 0);
         RF_B_Selection : OUT  std_logic;
         RF_WriteEn : OUT  std_logic;
         RF_WriteData_Selection : OUT  std_logic;
         ALU_Control : OUT  std_logic_vector(3 downto 0);
         ALU_Source : OUT  std_logic;
         Rtype_Funct : IN  std_logic_vector(5 downto 0);
         Zero : IN  std_logic;
         Byte_Op : OUT  std_logic;
         MEM_Enable : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Opcode : std_logic_vector(5 downto 0) := (others => '0');
   signal Rtype_Funct : std_logic_vector(5 downto 0) := (others => '0');
   signal Zero : std_logic := '0';

 	--Outputs
   signal PC_Selection : std_logic;
   signal PC_LoadEnable : std_logic;
   signal RF_B_Selection : std_logic;
   signal RF_WriteEn : std_logic;
   signal RF_WriteData_Selection : std_logic;
   signal ALU_Control : std_logic_vector(3 downto 0);
   signal ALU_Source : std_logic;
   signal Byte_Op : std_logic;
   signal MEM_Enable : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROL PORT MAP (
          PC_Selection => PC_Selection,
          PC_LoadEnable => PC_LoadEnable,
          Opcode => Opcode,
          RF_B_Selection => RF_B_Selection,
          RF_WriteEn => RF_WriteEn,
          RF_WriteData_Selection => RF_WriteData_Selection,
          ALU_Control => ALU_Control,
          ALU_Source => ALU_Source,
          Rtype_Funct => Rtype_Funct,
          Zero => Zero,
          Byte_Op => Byte_Op,
          MEM_Enable => MEM_Enable
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
		
		-- add
		Opcode <= "100000";
		Zero <= '0';
		Rtype_Funct <= "110000";
		wait for 100 ns;	
		
		-- sub
		Opcode <= "100000";
		Zero <= '0';
		Rtype_Funct <= "110001";
		wait for 100 ns;

		-- and
		Opcode <= "100000";
		Zero <= '0';
		Rtype_Funct <= "110010";
		wait for 100 ns;

		-- or
		Opcode <= "100000";
		Zero <= '0';
		Rtype_Funct <= "110011";
		wait for 100 ns;

		-- not
		Opcode <= "100000";
		Zero <= '0';
		Rtype_Funct <= "110100";
		wait for 100 ns;
		
		-- nand	
		Opcode <= "100000";
		Zero <= '0';
		Rtype_Funct <= "110101";
		wait for 100 ns;
			
		-- nor
		Opcode <= "100000";
		Zero <= '0';
		Rtype_Funct <= "110110";
		wait for 100 ns;		
		
		-- sra
		Opcode <= "100000";
		Zero <= '0';
		Rtype_Funct <= "111000";
		wait for 100 ns;		
		
		-- srl
		Opcode <= "100000";
		Zero <= '0';
		Rtype_Funct <= "111001";
		wait for 100 ns;		
		
		-- sll
		Opcode <= "100000";
		Zero <= '0';
		Rtype_Funct <= "111010";
		wait for 100 ns;		
		
		-- rol
		Opcode <= "100000";
		Zero <= '0';
		Rtype_Funct <= "111100";
		wait for 100 ns;		

		-- ror
		Opcode <= "100000";
		Zero <= '0';
		Rtype_Funct <= "111101";
		wait for 100 ns;

		-- li
		Opcode <= "111000";
		Zero <= '0';
		Rtype_Funct <= "000000";		--Dont Care
		wait for 100 ns;

		-- lui
		Opcode <= "111001";
		Zero <= '0';
		Rtype_Funct <= "000000";		--Dont Care
		wait for 100 ns;

		-- addi
		Opcode <= "110000";
		Zero <= '0';
		Rtype_Funct <= "000000";		--Dont Care
		wait for 100 ns;	
	
		-- nandi
		Opcode <= "110010";
		Zero <= '0';
		Rtype_Funct <= "000000";		--Dont Care
		wait for 100 ns;
	
		-- ori
		Opcode <= "110011";
		Zero <= '0';
		Rtype_Funct <= "000000";		--Dont Care
		wait for 100 ns;	
	
		-- b
		Opcode <= "111111";
		Zero <= '0';
		Rtype_Funct <= "000000";		--Dont Care
		wait for 100 ns;
	
		-- beq but pc -> +4+signext(immed)<<2
		Opcode <= "000000";
		Zero <= '1';
		Rtype_Funct <= "110000";
		wait for 100 ns;	

		-- bne but pc -> + 4
		Opcode <= "000000";
		Zero <= '1';
		Rtype_Funct <= "110000";
		wait for 100 ns;		
		
		-- lb
		Opcode <= "000011";
		Zero <= '0';
		Rtype_Funct <= "000000";		--Dont Care
		wait for 100 ns;	

		-- sb
		Opcode <= "000111";
		Zero <= '0';
		Rtype_Funct <= "000000";		--Dont Care
		wait for 100 ns;

		-- lw
		Opcode <= "001111";
		Zero <= '0';
		Rtype_Funct <= "000000";		--Dont Care
		wait for 100 ns;
		
		-- sw
		Opcode <= "011111";
		Zero <= '0';
		Rtype_Funct <= "000000";		--Dont Care
		wait for 100 ns;
		
      wait;
   end process;

END;
