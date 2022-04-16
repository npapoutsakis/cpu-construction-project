--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:44:57 04/03/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase02/IFSTAGE_TB.vhd
-- Project Name:  HRY302-Phase02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IFSTAGE
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
 
ENTITY IFSTAGE_TB IS
END IFSTAGE_TB;
 
ARCHITECTURE behavior OF IFSTAGE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IFSTAGE
    PORT(
         PC_Immed : IN  std_logic_vector(31 downto 0);
         PC_Sel : IN  std_logic;
         PC_LdEn : IN  std_logic;
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
	 
	 COMPONENT RAM is
     port (
		  clk       : in std_logic;
        inst_addr : in std_logic_vector(10 downto 0); 
        inst_dout : out std_logic_vector(31 downto 0);
        data_we   : in std_logic;
        data_addr : in std_logic_vector(10 downto 0); 
        data_din  : in std_logic_vector(31 downto 0); 
        data_dout : out std_logic_vector(31 downto 0));
	 end COMPONENT;


   --Inputs
   signal PC_Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal PC_Sel : std_logic := '0';
   signal PC_LdEn : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
 	
	
	--Outputs
   signal PC : std_logic_vector(31 downto 0);
	signal inst_dout : std_logic_vector(31 downto 0) := (others => '0');
   
	-- Clock period definitions
   constant Clk_period : time := 100 ns;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IFSTAGE PORT MAP (
          PC_Immed => PC_Immed,
          PC_Sel => PC_Sel,
          PC_LdEn => PC_LdEn,
          Reset => Reset,
          Clk => Clk,
          PC => PC
        );
	
		-- Instantiate the Unit Under Test (UUT)
   uut2: RAM PORT MAP (  clk => Clk,
								 inst_addr => PC(12 downto 2),
								 inst_dout => inst_dout,
								 data_we => '0',
								 data_addr => (others => '0'),
								 data_din => (others => '0'),
								 data_dout => open
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
		Reset <= '1';
		PC_LdEn <= '1';
		wait for 200ns;
		
		Reset <= '0';
		for i in 0 to 30 loop
			PC_Sel <= '0';
			wait for 100ns;	
		end loop;
		
		--Reset the PC -> start again
		PC_Immed <= "11111111111111111111111111100000"; --->(-32)
		PC_Sel <= '1';
		wait for 100ns;	
		
		-- Same as PC + 4 but Sel = '1'
		PC_Immed <= "00000000000000000000000000000000";
		PC_Sel <= '1';
		wait for 100ns;
		
		PC_Immed <= "00000000000000000000000000000001";
		PC_Sel <= '0';
		wait for 100ns;	
		
		-- I want to access the 10th word while am on
		PC_Immed <= "00000000000000000000000000000111";
		PC_Sel <= '1';
		wait for 200ns;  --> 2 periods
		
		
		PC_Sel <= '0';
		wait for 200ns;  --> 2 periods
		
		
		PC_LdEn <= '0';
		wait for 100ns;
		
		Reset <= '1';
		wait;
   end process;

END;
