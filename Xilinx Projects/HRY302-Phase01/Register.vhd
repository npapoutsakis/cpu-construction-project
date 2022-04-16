----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:58 03/27/2022 
-- Design Name: 
-- Module Name:    Register - Behavioral 
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

entity AAegister is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           Datain : in  STD_LOGIC_VECTOR (31 downto 0);
           Dataout : out  STD_LOGIC_VECTOR (31 downto 0));
end Register;

architecture Behavioral of Register is

begin


end Behavioral;

