----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2025 12:29:08 PM
-- Design Name: 
-- Module Name: BacTuileBuffer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BackgroundTuileBuffer is
    Port ( i_tuile_id : in STD_LOGIC_VECTOR (5 downto 0);
           i_tuile_x : in STD_LOGIC_VECTOR (2 downto 0);
           i_tuile_y : in STD_LOGIC_VECTOR (2 downto 0);
           o_cc : out STD_LOGIC_VECTOR (3 downto 0));
end BackgroundTuileBuffer;

architecture Behavioral of BackgroundTuileBuffer is

begin
    process(i_tuile_id, i_tuile_x, i_tuile_y)
    begin
        case i_tuile_id is
            when "000000" => o_cc <= "0000";
            when "000001" =>
                if (i_tuile_x = "110" and i_tuile_y = "101") then
                    o_cc <= "0011";
                elsif (i_tuile_x = "111" and i_tuile_y = "101") then
                    o_cc <= "0100";
                else
                    o_cc <= "0000";
                end if;
            when "000010" =>
                if (i_tuile_x = "010" and i_tuile_y = "001") or
                    (i_tuile_x = "001" and i_tuile_y = "011") or
                    (i_tuile_x = "011" and i_tuile_y = "011") or
                    (i_tuile_x = "000" and i_tuile_y = "100") or
                    (i_tuile_x = "100" and i_tuile_y = "100") or
                    (i_tuile_x = "110" and i_tuile_y = "101") or
                    (i_tuile_x = "000" and i_tuile_y = "110") or
                    (i_tuile_x = "100" and i_tuile_y = "110") or
                    (i_tuile_x = "001" and i_tuile_y = "111") or
                    (i_tuile_x = "011" and i_tuile_y = "111") then
                    o_cc <= "0011";
                elsif (i_tuile_x = "010" and i_tuile_y = "010") or
                    (i_tuile_x = "010" and i_tuile_y = "011") or
                    (i_tuile_x = "001" and i_tuile_y = "100") or
                    (i_tuile_x = "010" and i_tuile_y = "100") or
                    (i_tuile_x = "011" and i_tuile_y = "100") or
                    (i_tuile_x = "000" and i_tuile_y = "101") or
                    (i_tuile_x = "001" and i_tuile_y = "101") or
                    (i_tuile_x = "010" and i_tuile_y = "101") or
                    (i_tuile_x = "011" and i_tuile_y = "101") or
                    (i_tuile_x = "100" and i_tuile_y = "101") or
                    (i_tuile_x = "101" and i_tuile_y = "101") or
                    (i_tuile_x = "001" and i_tuile_y = "110") or
                    (i_tuile_x = "010" and i_tuile_y = "110") or
                    (i_tuile_x = "011" and i_tuile_y = "110") or
                    (i_tuile_x = "010" and i_tuile_y = "111") then
                    o_cc <= "0100";
                else
                    o_cc <= "0000";
                end if;
            when "000011" =>
                if (i_tuile_x = "010" and i_tuile_y = "001") then
                    o_cc <= "0011";
                elsif (i_tuile_x = "010" and i_tuile_y = "000") then
                    o_cc <= "0100";
                else
                    o_cc <= "0000";
                end if;
            when "000100" =>
                if (i_tuile_x = "100" and i_tuile_y = "011") or
                    (i_tuile_x = "011" and i_tuile_y = "101") or
                    (i_tuile_x = "101" and i_tuile_y = "101") or
                    (i_tuile_x = "010" and i_tuile_y = "110") or
                    (i_tuile_x = "110" and i_tuile_y = "110") or
                    (i_tuile_x = "000" and i_tuile_y = "111") then
                    o_cc <= "0011";
                elsif (i_tuile_x = "100" and i_tuile_y = "100") or
                    (i_tuile_x = "100" and i_tuile_y = "101") or
                    (i_tuile_x = "011" and i_tuile_y = "110") or
                    (i_tuile_x = "100" and i_tuile_y = "110") or
                    (i_tuile_x = "101" and i_tuile_y = "110") or
                    (i_tuile_x = "001" and i_tuile_y = "111") or
                    (i_tuile_x = "010" and i_tuile_y = "111") or
                    (i_tuile_x = "011" and i_tuile_y = "111") or
                    (i_tuile_x = "100" and i_tuile_y = "111") or
                    (i_tuile_x = "101" and i_tuile_y = "111") or
                    (i_tuile_x = "110" and i_tuile_y = "111") or
                    (i_tuile_x = "111" and i_tuile_y = "111") then
                    o_cc <= "0100";
                else
                    o_cc <= "0000";
                end if;
            when "000101" =>
                if (i_tuile_x = "000" and i_tuile_y = "111") then
                    o_cc <= "0011";
                else
                    o_cc <= "0000";
                end if;
            when "000110" =>
                if (i_tuile_x = "010" and i_tuile_y = "000") or
                    (i_tuile_x = "110" and i_tuile_y = "000") or
                    (i_tuile_x = "011" and i_tuile_y = "001") or
                    (i_tuile_x = "101" and i_tuile_y = "001") or
                    (i_tuile_x = "100" and i_tuile_y = "011") then
                    o_cc <= "0011";
                elsif (i_tuile_x = "011" and i_tuile_y = "000") or
                    (i_tuile_x = "100" and i_tuile_y = "000") or
                    (i_tuile_x = "101" and i_tuile_y = "000") or
                    (i_tuile_x = "100" and i_tuile_y = "001") or
                    (i_tuile_x = "100" and i_tuile_y = "010") then
                    o_cc <= "0100";
                else
                    o_cc <= "0000";
                end if;
            when "000111" =>
                if (i_tuile_x = "001" and i_tuile_y = "111") then
                    o_cc <= "0011";
                else
                    o_cc <= "0000";
                end if;
            when "001000" =>
                if (i_tuile_x = "111" and i_tuile_y = "010") or
                    (i_tuile_x = "101" and i_tuile_y = "011") or
                    (i_tuile_x = "111" and i_tuile_y = "100") then
                    o_cc <= "0011";
                elsif (i_tuile_x = "110" and i_tuile_y = "011") or
                    (i_tuile_x = "111" and i_tuile_y = "011") then
                    o_cc <= "0100";
                else
                    o_cc <= "0000";
                end if;
            when "001001" =>
                if (i_tuile_x = "000" and i_tuile_y = "001") or
                    (i_tuile_x = "010" and i_tuile_y = "001") or
                    (i_tuile_x = "011" and i_tuile_y = "010") or
                    (i_tuile_x = "101" and i_tuile_y = "011") or
                    (i_tuile_x = "011" and i_tuile_y = "100") or
                    (i_tuile_x = "010" and i_tuile_y = "101") or
                    (i_tuile_x = "000" and i_tuile_y = "101") or
                    (i_tuile_x = "001" and i_tuile_y = "111") then
                    o_cc <= "0011";
                elsif (i_tuile_x = "001" and i_tuile_y = "000") or
                    (i_tuile_x = "001" and i_tuile_y = "001") or
                    (i_tuile_x = "000" and i_tuile_y = "010") or
                    (i_tuile_x = "001" and i_tuile_y = "010") or
                    (i_tuile_x = "010" and i_tuile_y = "010") or
                    (i_tuile_x = "000" and i_tuile_y = "011") or
                    (i_tuile_x = "001" and i_tuile_y = "011") or
                    (i_tuile_x = "010" and i_tuile_y = "011") or
                    (i_tuile_x = "011" and i_tuile_y = "011") or
                    (i_tuile_x = "100" and i_tuile_y = "011") or
                    (i_tuile_x = "000" and i_tuile_y = "100") or
                    (i_tuile_x = "001" and i_tuile_y = "100") or
                    (i_tuile_x = "010" and i_tuile_y = "100") or
                    (i_tuile_x = "001" and i_tuile_y = "101") or
                    (i_tuile_x = "001" and i_tuile_y = "110") then
                    o_cc <= "0100";
                else
                    o_cc <= "0000";
                end if;
            when others => 
                o_cc <= "0000";
        end case;
    end process;

end Behavioral;
