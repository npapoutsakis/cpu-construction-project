----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:54:40 04/04/2022 
-- Design Name: 
-- Module Name:    dec_encoder - Behavioral 
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

entity dec_encoder is
    Port ( encoder_in : in  STD_LOGIC_VECTOR (5 downto 0);
           encoder_out : out  STD_LOGIC_VECTOR (1 downto 0));
end dec_encoder;

architecture Behavioral of dec_encoder is

begin
	-- See CHARIS.
	ImmExtSelection : process(encoder_in)
	begin
		case encoder_in is
			-- Sign Ext
			when "111000" | "110000" | "000011" | "000111" | "001111" | "011111" =>
				encoder_out <= "00";
			
			-- Sign Ext << 2
			when "111111" | "000000" | "000001" =>
				encoder_out <= "10";
			
			-- ZeroFill
			when "110010" | "110011" =>
				encoder_out <= "01";
			
			-- Shift<<16 & ZeroFill
			when "111001" =>
				encoder_out <= "11";
			
			when others => 
				encoder_out <= "--";
		
		end case;
	
	end process;

end Behavioral;

