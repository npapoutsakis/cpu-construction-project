--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:10:08 04/03/2022
-- Design Name:   
-- Module Name:   C:/Users/Nick-PC/Documents/VHDL/HRY302-Phase02/mem_testbench.vhd
-- Project Name:  HRY302-Phase02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MEMSTAGE
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
 
ENTITY mem_testbench IS
END mem_testbench;
 
ARCHITECTURE behavior OF mem_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MEMSTAGE
    PORT(
         ByteOp : IN  std_logic;
         Mem_WrEn : IN  std_logic;
         ALU_MEM_Addr : IN  std_logic_vector(31 downto 0);
         MEM_DataIn : IN  std_logic_vector(31 downto 0);
         MEM_DataOut : OUT  std_logic_vector(31 downto 0);
         MM_WrEn : OUT  std_logic;
         MM_Addr : OUT  std_logic_vector(31 downto 0);
         MM_WrData : OUT  std_logic_vector(31 downto 0);
         MM_RdData : IN  std_logic_vector(31 downto 0)
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
   signal ByteOp : std_logic := '0';
   signal Mem_WrEn : std_logic := '0';
   signal ALU_MEM_Addr : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_DataIn : std_logic_vector(31 downto 0) := (others => '0');
   signal MM_RdData : std_logic_vector(31 downto 0) := (others => '0');
	signal clk : std_logic := '0';
 	
	--Outputs
   signal MEM_DataOut : std_logic_vector(31 downto 0);
   signal MM_WrEn : std_logic;
   signal MM_Addr : std_logic_vector(31 downto 0);
   signal MM_WrData : std_logic_vector(31 downto 0);
 
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MEMSTAGE PORT MAP (
          ByteOp => ByteOp,
          Mem_WrEn => Mem_WrEn,
          ALU_MEM_Addr => ALU_MEM_Addr,
          MEM_DataIn => MEM_DataIn,
          MEM_DataOut => MEM_DataOut,
          MM_WrEn => MM_WrEn,
          MM_Addr => MM_Addr,
          MM_WrData => MM_WrData,
          MM_RdData => MM_RdData
        );

		-- Instantiate the Unit Under Test (UUT)
   uut2: RAM PORT MAP (  clk => clk,
								 inst_addr => (others => '0'),
								 inst_dout => open,
								 data_we => MM_WrEn,
								 data_addr => MM_Addr(12 downto 2),
								 data_din => MM_WrData,
								 data_dout => MM_RdData 
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
		wait for 100ns;
		
		ByteOp <= '0';														-- Storing a word (4 bytes)
		ALU_MEM_Addr <= "00000000000000000000000000000100"; 	-- Result of ALU -> gives an address to store in mem
		Mem_WrEn <= '1'; 													-- Write in mem flag Enabled!
		MEM_DataIn <= "00000000000000000000000000001000";		-- Data to be written
		wait for 100 ns;			
		
		ByteOp <= '0';														-- Storing a word (4 byte)
		ALU_MEM_Addr <= "00000000000000000000000000001000"; 	-- Result of ALU -> gives an address to store in mem
		Mem_WrEn <= '1'; 													-- Write in mem flag Enabled!
		MEM_DataIn <= "00000000001000000001100000001100";		-- Data to be written
		wait for 100 ns;

		ByteOp <= '0';														-- Storing a word (4 bytes)
		ALU_MEM_Addr <= "00000000000000000000000000010000"; 	-- Result of ALU -> gives an address to store in mem
		Mem_WrEn <= '1'; 													-- Write in mem flag not enabled!
		MEM_DataIn <= "11111111111000010100100000001100";		-- Data to be written
		wait for 100 ns;
		
		--Reading a word
		Mem_WrEn <= '0';
		ALU_MEM_Addr <= "00000000000000000000000000000100"; 	-- Result of ALU -> gives an address to store or load in/from mem
		wait for 100 ns;
		
		--Reading a byte
		Mem_WrEn <= '0';
		ByteOp <= '1';
		ALU_MEM_Addr <= "00000000000000000000000000001000"; 	-- Result of ALU -> gives an address to store or load in/from mem
		wait for 100 ns;
		
		--Write a byte and then read it
		ByteOp <= '1';														-- Storing a word (1 byte)
		ALU_MEM_Addr <= "00000000000000000000000000001100"; 	-- Result of ALU -> gives an address to store in mem
		Mem_WrEn <= '1'; 													-- Write in mem flag not enabled!
		MEM_DataIn <= "11111111111000010100100000100000";		-- Data to be written
		wait for 100 ns;
		
		--Reading the previous byte
		Mem_WrEn <= '0';
		ByteOp <= '1';
		ALU_MEM_Addr <= "00000000000000000000000000001100"; 	-- Result of ALU -> gives an address to store or load in/from mem
		wait for 100 ns;
		
		--Reading a byte from a word
		Mem_WrEn <= '0';
		ByteOp <= '1';
		ALU_MEM_Addr <= "00000000000000000000000000000100"; 	-- Result of ALU -> gives an address to store or load in/from mem
		wait for 100 ns;
		
		--Reading a word
		Mem_WrEn <= '0';
		ByteOp <= '0';
		ALU_MEM_Addr <= "00000000000000000000000000001100"; 	-- Result of ALU -> gives an address to store or load in/from mem
		wait for 100 ns;


		ByteOp <= '0';														-- Storing a word (4 bytes)
		ALU_MEM_Addr <= "00000000000000000000000000010000"; 	-- Result of ALU -> gives an address to store in mem
		Mem_WrEn <= '1'; 													-- Write in mem flag not enabled!
		MEM_DataIn <= "11111111111000010100100000001100";		-- Data to be written
		wait for 100 ns;
		
		--Reading a word
		Mem_WrEn <= '0';
		ALU_MEM_Addr <= "00000000000000000000000000000100"; 	-- Result of ALU -> gives an address to store or load in/from mem
		wait for 100 ns;
      wait;
   end process;

END;
