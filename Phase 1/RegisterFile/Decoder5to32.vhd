----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:21:00 03/27/2022 
-- Design Name: 
-- Module Name:    Decoder5to32 - Behavioral 
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

entity Decoder5to32 is
    Port ( DecoderInput : in  STD_LOGIC_VECTOR (4 downto 0);
           DecoderOutput : out  STD_LOGIC_VECTOR (31 downto 0));
end Decoder5to32;

architecture Behavioral of Decoder5to32 is

signal early_output : STD_LOGIC_VECTOR (31 downto 0);

begin
	
	with (DecoderInput)	select 
		early_output <=  "00000000000000000000000000000001" when "00000",
							  "00000000000000000000000000000010" when "00001",	
							  "00000000000000000000000000000100" when "00010",
							  "00000000000000000000000000001000" when "00011",
							  "00000000000000000000000000010000" when "00100",
							  "00000000000000000000000000100000" when "00101",
							  "00000000000000000000000001000000" when "00110",
							  "00000000000000000000000010000000" when "00111",
							  "00000000000000000000000100000000" when "01000",
							  "00000000000000000000001000000000" when "01001",
							  "00000000000000000000010000000000" when "01010",
							  "00000000000000000000100000000000" when "01011",
							  "00000000000000000001000000000000" when "01100",
							  "00000000000000000010000000000000" when "01101",
							  "00000000000000000100000000000000" when "01110",
							  "00000000000000001000000000000000" when "01111",
							  "00000000000000010000000000000000" when "10000",
							  "00000000000000100000000000000000" when "10001",
							  "00000000000001000000000000000000" when "10010",
							  "00000000000010000000000000000000" when "10011",
							  "00000000000100000000000000000000" when "10100",
							  "00000000001000000000000000000000" when "10101",
							  "00000000010000000000000000000000" when "10110",
							  "00000000100000000000000000000000" when "10111",
							  "00000001000000000000000000000000" when "11000",
							  "00000010000000000000000000000000" when "11001",
							  "00000100000000000000000000000000" when "11010",
							  "00001000000000000000000000000000" when "11011",
							  "00010000000000000000000000000000" when "11100",
							  "00100000000000000000000000000000" when "11101",
							  "01000000000000000000000000000000" when "11110",
							  "10000000000000000000000000000000" when "11111",
							  "00000000000000000000000000000000" when others;


		DecoderOutput <= early_output after 10ns;

end Behavioral;