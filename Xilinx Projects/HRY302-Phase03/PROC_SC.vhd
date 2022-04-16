----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:24:18 04/07/2022 
-- Design Name: 
-- Module Name:    PROC_SC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PROC_SC is
    Port ( RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC);
end PROC_SC;

architecture Behavioral of PROC_SC is

component CONTROL is
    Port ( PC_Selection : out  STD_LOGIC;								--nPC_sel
           PC_LoadEnable : out  STD_LOGIC;							--Register Enable
           Opcode : in  STD_LOGIC_VECTOR (5 downto 0);			--Opcode of Instruction
			  RF_B_Selection : out  STD_LOGIC;							--RegDst
           RF_WriteEn : out  STD_LOGIC;								--RegWr
           RF_WriteData_Selection : out  STD_LOGIC;				--MemToReg
           ALU_Control : out  STD_LOGIC_VECTOR (3 downto 0);	--ALU_Opcode
			  ALU_Source : out  STD_LOGIC;								--ALUSrc --> ALU_Bin_Sel
			  Rtype_Funct : in  STD_LOGIC_VECTOR (5 downto 0);		--Funct
           Zero : in  STD_LOGIC;											--ALU_Zero
           Byte_Op : out  STD_LOGIC;									--word/byte
           MEM_Enable : out  STD_LOGIC);								--MemWr
end component;

component DATAPATH is
    Port ( 
			  -- IFSTAGE
			  D_CLK : in  STD_LOGIC;                                          --General
           D_Reset : in  STD_LOGIC;														--General
           D_PC_Sel : in  STD_LOGIC;													--Comes from control
           D_PC_LdEn : in  STD_LOGIC;													--Comes from control
			  D_PC : out  STD_LOGIC_VECTOR (31 downto 0);							--Goes to MEM for instr
           
			  -- DECSTAGE
			  D_Instr : in  STD_LOGIC_VECTOR (31 downto 0);							--Takes from MEM (text segment)
           D_RF_WrEnable : in  STD_LOGIC;												--Comes from control -> RegWrite
           D_RF_WrData_Selection : in  STD_LOGIC;									--Comes from control -> ALU_OUT or MEM_OUT
           D_RF_B_Selection : in  STD_LOGIC;											--Comes from control -> RegDest
			  
			  -- EXSTAGE
           D_ALU_Bin_Selection : in  STD_LOGIC;										--Comes from control -> ALUScr
           D_ALU_Function : in  STD_LOGIC_VECTOR (3 downto 0);					--Comes from control -> ALUCtrl
			  D_ALU_Zero : out  STD_LOGIC;												--Will connect it to control
			  
			  -- MEMSTAGE
           D_Byte_Operation : in  STD_LOGIC;											--Comes from control
           D_MEM_WrEnable : in  STD_LOGIC;											--Comes from control
           D_MM_ReadData : in  STD_LOGIC_VECTOR (31 downto 0);					--Will come from RAM
			  D_MM_Addr : out STD_LOGIC_VECTOR (31 downto 0);						--Goes to RAM -> data_addr
			  D_MM_WrEn : out STD_LOGIC;												   --Goes to RAM -> data_we
			  D_MM_WrData : out STD_LOGIC_VECTOR (31 downto 0)						--Goes to RAM -> data_in	  
			 );     
end component;


component RAM is
     port (
		  clk       : in std_logic;
        inst_addr : in std_logic_vector(10 downto 0); 
        inst_dout : out std_logic_vector(31 downto 0);
        data_we   : in std_logic;
        data_addr : in std_logic_vector(10 downto 0); 
        data_din  : in std_logic_vector(31 downto 0); 
        data_dout : out std_logic_vector(31 downto 0));
end component;


signal instruction_address : std_logic_vector(31 downto 0);
signal instruction_signal : std_logic_vector(31 downto 0);
signal mem_enable_signal : std_logic;
signal data_mem_address : std_logic_vector(31 downto 0);
signal data_in_mem : std_logic_vector(31 downto 0);
signal data_took_fromMem : std_logic_vector(31 downto 0);

signal program_counter_selector : std_logic;
signal program_counter_loadEn : std_logic;
signal register_write : std_logic;
signal memToReg : std_logic;
signal alu_src : std_logic;
signal reg_dst : std_logic;
signal alu_control_signal : std_logic_vector(3 downto 0);
signal alu_zero_signal : std_logic;
signal byte_op_signal : std_logic;
signal mem_en_control : std_logic;

begin

	MEM : RAM 
		port map ( clk => CLK,	
					  inst_addr => instruction_address(12 downto 2),
					  inst_dout => instruction_signal,
					  data_we	=> mem_enable_signal,
					  data_addr	=> data_mem_address(12 downto 2),
					  data_din	=> data_in_mem,
					  data_dout => data_took_fromMem
					);

	
	PATH : DATAPATH
		port map ( D_CLK => CLK,
					  D_Reset => RESET,
					  D_PC_Sel => program_counter_selector,
					  D_PC_LdEn => program_counter_loadEn,
					  D_PC => instruction_address,
					  D_Instr => instruction_signal,
					  D_RF_WrEnable => register_write,
					  D_RF_WrData_Selection => memToReg,
					  D_RF_B_Selection => reg_dst,
					  D_ALU_Bin_Selection => alu_src,
					  D_ALU_Function => alu_control_signal,
					  D_ALU_Zero => alu_zero_signal,
					  D_Byte_Operation => byte_op_signal,
					  D_MEM_WrEnable => mem_en_control,
					  D_MM_ReadData => data_took_fromMem,
					  D_MM_Addr => data_mem_address,
					  D_MM_WrEn => mem_enable_signal,
					  D_MM_WrData => data_in_mem
					);



	CTRL : CONTROL
		port map ( PC_Selection => program_counter_selector,
					  PC_LoadEnable => program_counter_loadEn,
					  Opcode => instruction_signal(31 downto 26),
					  RF_B_Selection => reg_dst,
					  RF_WriteEn => register_write,
					  RF_WriteData_Selection => memToReg,
					  ALU_Control => alu_control_signal,
					  ALU_Source => alu_src,
					  Rtype_Funct => instruction_signal(5 downto 0),
					  Zero => alu_zero_signal,
					  Byte_Op => byte_op_signal,				  
					  MEM_Enable => mem_en_control	  
					);

end Behavioral;

