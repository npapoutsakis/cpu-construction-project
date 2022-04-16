----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:16:13 03/27/2022 
-- Design Name: 
-- Module Name:    Decoder5-to-32 - Behavioral 
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
    Port ( Dec_Input : in  STD_LOGIC_VECTOR (4 downto 0);
           Dec_Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Decoder5to32;

architecture Behavioral of Decoder5to32 is

begin


end Behavioral;

