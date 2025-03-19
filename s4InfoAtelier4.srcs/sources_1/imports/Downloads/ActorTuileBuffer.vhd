----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2025 02:10:39 PM
-- Design Name: 
-- Module Name: ActorTuileBuffer - Behavioral
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

entity actorTuileBuffer is
    Port ( i_tuileID : in STD_LOGIC_VECTOR (5 downto 0);
           i_tuileX : in STD_LOGIC_VECTOR (2 downto 0);
           i_tuileY : in STD_LOGIC_VECTOR (2 downto 0);
           o_cc : out STD_LOGIC_VECTOR (3 downto 0)
           );
end actorTuileBuffer;

architecture Behavioral of actorTuileBuffer is

begin
    process(i_tuileID, i_tuileX, i_tuileY)
    begin
        case i_tuileID is
            when "001010" => 
                if (i_tuileX = "110" and i_tuileY = "000") or
                    (i_tuileX = "101" and i_tuileY = "001") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "100") or
                    (i_tuileX = "100" and i_tuileY = "101") or
                    (i_tuileX = "101" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "110") or
                    (i_tuileX = "101" and i_tuileY = "110") or
                    (i_tuileX = "010" and i_tuileY = "111") or
                    (i_tuileX = "101" and i_tuileY = "111") then
                    o_cc <= "0001";
                elsif (i_tuileX = "111" and i_tuileY = "111") then
                    o_cc <= "0010";
                elsif (i_tuileX = "111" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "111" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "101") or
                    (i_tuileX = "111" and i_tuileY = "101") or
                    (i_tuileX = "110" and i_tuileY = "110") or
                    (i_tuileX = "111" and i_tuileY = "110") or
                    (i_tuileX = "110" and i_tuileY = "111") or
                    (i_tuileX = "100" and i_tuileY = "111") then
                    o_cc <= "0011";
                elsif (i_tuileX = "111" and i_tuileY = "000") or
                    (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "100" and i_tuileY = "110") or
                    (i_tuileX = "011" and i_tuileY = "111") then
                    o_cc <= "0100";
                else
                    o_cc <= "0000";
                end if;
            when "001011" => 
                if (i_tuileX = "001" and i_tuileY = "000") or
                    (i_tuileX = "010" and i_tuileY = "001") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "100") or
                    (i_tuileX = "010" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "101") or
                    (i_tuileX = "010" and i_tuileY = "110") or
                    (i_tuileX = "100" and i_tuileY = "110") or
                    (i_tuileX = "010" and i_tuileY = "111") or
                    (i_tuileX = "101" and i_tuileY = "111") then
                    o_cc <= "0001";
                elsif (i_tuileX = "001" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "000" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "000" and i_tuileY = "101") or
                    (i_tuileX = "001" and i_tuileY = "101") or
                    (i_tuileX = "000" and i_tuileY = "110") or
                    (i_tuileX = "001" and i_tuileY = "110") or
                    (i_tuileX = "000" and i_tuileY = "111") or
                    (i_tuileX = "001" and i_tuileY = "111") then
                    o_cc <= "0010";
                elsif (i_tuileX = "000" and i_tuileY = "000") or
                    (i_tuileX = "000" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "110") or
                    (i_tuileX = "011" and i_tuileY = "111") or
                    (i_tuileX = "100" and i_tuileY = "111") then
                    o_cc <= "0011";
                else
                    o_cc <= "0000";
                end if;
            when "001100" =>
                if (i_tuileX = "001" and i_tuileY = "000") or
                    (i_tuileX = "101" and i_tuileY = "000") or
                    (i_tuileX = "000" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "001") or
                    (i_tuileX = "101" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "011" and i_tuileY = "010") or
                    (i_tuileX = "100" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "000" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "011") or
                    (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "111" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "010" and i_tuileY = "100") then
                    o_cc <= "0001";
                elsif (i_tuileX = "100" and i_tuileY = "000") or
                    (i_tuileX = "111" and i_tuileY = "000") or
                    (i_tuileX = "011" and i_tuileY = "001") or
                    (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "001") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "011") then
                    o_cc <= "0010";
                elsif (i_tuileX = "011" and i_tuileY = "000") or
                    (i_tuileX = "110" and i_tuileY = "000") or
                    (i_tuileX = "010" and i_tuileY = "001") or
                    (i_tuileX = "001" and i_tuileY = "010") then
                    o_cc <= "0011";
                elsif (i_tuileX = "010" and i_tuileY = "000") or
                    (i_tuileX = "001" and i_tuileY = "001") then
                    o_cc <= "0100";
                elsif (i_tuileX = "100" and i_tuileY = "100") or
                    (i_tuileX = "100" and i_tuileY = "101") or
                    (i_tuileX = "101" and i_tuileY = "101") or
                    (i_tuileX = "101" and i_tuileY = "110") or
                    (i_tuileX = "110" and i_tuileY = "110") or
                    (i_tuileX = "111" and i_tuileY = "111") then
                    o_cc <= "0101";
                elsif (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "101") or
                    (i_tuileX = "111" and i_tuileY = "110") then
                    o_cc <= "0110";
                elsif (i_tuileX = "101" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "111" and i_tuileY = "101") then
                    o_cc <= "0111";
                else
                    o_cc <= "0000";
                end if;
            when "001101" =>
                if (i_tuileX = "110" and i_tuileY = "000") or
                    (i_tuileX = "010" and i_tuileY = "000") or
                    (i_tuileX = "111" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "001") or
                    (i_tuileX = "010" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "100" and i_tuileY = "010") or
                    (i_tuileX = "011" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "111" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "011") or
                    (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "011") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "101" and i_tuileY = "100") then
                    o_cc <= "0001";
                elsif (i_tuileX = "000" and i_tuileY = "000") or
                    (i_tuileX = "001" and i_tuileY = "000") or
                    (i_tuileX = "100" and i_tuileY = "000") or
                    (i_tuileX = "101" and i_tuileY = "000") or
                    (i_tuileX = "000" and i_tuileY = "001") or
                    (i_tuileX = "001" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "001") or
                    (i_tuileX = "101" and i_tuileY = "001") or
                    (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "111" and i_tuileY = "011") then
                    o_cc <= "0010";
                elsif (i_tuileX = "011" and i_tuileY = "000") then
                    o_cc <= "0011";
                elsif (i_tuileX = "011" and i_tuileY = "100") or
                    (i_tuileX = "011" and i_tuileY = "101") or
                    (i_tuileX = "010" and i_tuileY = "101") or
                    (i_tuileX = "010" and i_tuileY = "110") or
                    (i_tuileX = "001" and i_tuileY = "110") or
                    (i_tuileX = "000" and i_tuileY = "111") then
                    o_cc <= "0101";
                elsif (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "101") or
                    (i_tuileX = "000" and i_tuileY = "110") then
                    o_cc <= "0110";
                elsif (i_tuileX = "010" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "000" and i_tuileY = "101") then
                    o_cc <= "0111";
                else
                    o_cc <= "0000";
                end if;
            when "001110" =>
                if (i_tuileX = "001" and i_tuileY = "000") or
                    (i_tuileX = "001" and i_tuileY = "001") or
                    (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "001") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "011" and i_tuileY = "100") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "010" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "101") or
                    (i_tuileX = "110" and i_tuileY = "101") or
                    (i_tuileX = "111" and i_tuileY = "101") or
                    (i_tuileX = "001" and i_tuileY = "110") or
                    (i_tuileX = "110" and i_tuileY = "110") or
                    (i_tuileX = "111" and i_tuileY = "110") or
                    (i_tuileX = "000" and i_tuileY = "111") or
                    (i_tuileX = "111" and i_tuileY = "111") then
                    o_cc <= "1100";
                elsif (i_tuileX = "010" and i_tuileY = "000") or
                    (i_tuileX = "010" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "010") or
                    (i_tuileX = "100" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "111" and i_tuileY = "011") or
                    (i_tuileX = "100" and i_tuileY = "100") or
                    (i_tuileX = "100" and i_tuileY = "101") or
                    (i_tuileX = "101" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "110") or
                    (i_tuileX = "100" and i_tuileY = "110") or
                    (i_tuileX = "101" and i_tuileY = "110") or
                    (i_tuileX = "001" and i_tuileY = "111") or
                    (i_tuileX = "100" and i_tuileY = "111") or
                    (i_tuileX = "110" and i_tuileY = "111") then
                    o_cc <= "1101";
                elsif (i_tuileX = "011" and i_tuileY = "000") or
                    (i_tuileX = "100" and i_tuileY = "001") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "010" and i_tuileY = "110") or
                    (i_tuileX = "010" and i_tuileY = "111") or
                    (i_tuileX = "011" and i_tuileY = "111") or
                    (i_tuileX = "101" and i_tuileY = "111") then
                    o_cc <= "1110";
                else
                    o_cc <= "0000";
                end if;
            when "001111" =>
                if (i_tuileX = "110" and i_tuileY = "000") or
                    (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "001" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "001") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "100" and i_tuileY = "100") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "101" and i_tuileY = "101") or
                    (i_tuileX = "100" and i_tuileY = "101") or
                    (i_tuileX = "001" and i_tuileY = "101") or
                    (i_tuileX = "000" and i_tuileY = "101") or
                    (i_tuileX = "110" and i_tuileY = "110") or
                    (i_tuileX = "001" and i_tuileY = "110") or
                    (i_tuileX = "000" and i_tuileY = "110") or
                    (i_tuileX = "111" and i_tuileY = "111") or
                    (i_tuileX = "000" and i_tuileY = "111") then
                    o_cc <= "1100";
                elsif (i_tuileX = "101" and i_tuileY = "000") or
                    (i_tuileX = "101" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "010") or
                    (i_tuileX = "011" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "011") or
                    (i_tuileX = "011" and i_tuileY = "100") or
                    (i_tuileX = "011" and i_tuileY = "101") or
                    (i_tuileX = "010" and i_tuileY = "101") or
                    (i_tuileX = "100" and i_tuileY = "110") or
                    (i_tuileX = "011" and i_tuileY = "110") or
                    (i_tuileX = "010" and i_tuileY = "110") or
                    (i_tuileX = "110" and i_tuileY = "111") or
                    (i_tuileX = "011" and i_tuileY = "111") or
                    (i_tuileX = "001" and i_tuileY = "111") then
                    o_cc <= "1101";
                elsif (i_tuileX = "100" and i_tuileY = "000") or
                    (i_tuileX = "011" and i_tuileY = "001") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "101" and i_tuileY = "110") or
                    (i_tuileX = "101" and i_tuileY = "111") or
                    (i_tuileX = "100" and i_tuileY = "111") or
                    (i_tuileX = "010" and i_tuileY = "111") then
                    o_cc <= "1110";
                else
                    o_cc <= "0000";
                end if;
            when "010000" =>
                if (i_tuileX = "000" and i_tuileY = "000") or
                    (i_tuileX = "000" and i_tuileY = "001") or
                    (i_tuileX = "010" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "000" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "011") or
                    (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "011" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "000" and i_tuileY = "101") or
                    (i_tuileX = "100" and i_tuileY = "101") or
                    (i_tuileX = "111" and i_tuileY = "101") or
                    (i_tuileX = "001" and i_tuileY = "110") or
                    (i_tuileX = "100" and i_tuileY = "110") or
                    (i_tuileX = "010" and i_tuileY = "111") or
                    (i_tuileX = "011" and i_tuileY = "111") then
                    o_cc <= "1100";
                elsif (i_tuileX = "001" and i_tuileY = "000") or
                    (i_tuileX = "011" and i_tuileY = "000") or
                    (i_tuileX = "101" and i_tuileY = "000") or
                    (i_tuileX = "110" and i_tuileY = "000") or
                    (i_tuileX = "111" and i_tuileY = "000") or
                    (i_tuileX = "001" and i_tuileY = "001") or
                    (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "111" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "100") or
                    (i_tuileX = "010" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "101") then
                    o_cc <= "1101";
                elsif (i_tuileX = "010" and i_tuileY = "000") or
                    (i_tuileX = "100" and i_tuileY = "000") or
                    (i_tuileX = "011" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "001") or
                    (i_tuileX = "101" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "101") or
                    (i_tuileX = "010" and i_tuileY = "110") or
                    (i_tuileX = "011" and i_tuileY = "110") then
                    o_cc <= "1110";
                else
                    o_cc <= "0000";
                end if;
            when "010001" =>
                if (i_tuileX = "111" and i_tuileY = "000") or
                    (i_tuileX = "111" and i_tuileY = "001") or
                    (i_tuileX = "101" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "111" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "011") or
                    (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "011") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "100" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "111" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "101") or
                    (i_tuileX = "000" and i_tuileY = "101") or
                    (i_tuileX = "001" and i_tuileY = "110") or
                    (i_tuileX = "011" and i_tuileY = "110") or
                    (i_tuileX = "101" and i_tuileY = "111") or
                    (i_tuileX = "100" and i_tuileY = "111") then
                    o_cc <= "1100";
                elsif (i_tuileX = "110" and i_tuileY = "000") or
                    (i_tuileX = "100" and i_tuileY = "000") or
                    (i_tuileX = "010" and i_tuileY = "000") or
                    (i_tuileX = "001" and i_tuileY = "000") or
                    (i_tuileX = "000" and i_tuileY = "000") or
                    (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "001" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "100") or
                    (i_tuileX = "101" and i_tuileY = "101") or
                    (i_tuileX = "100" and i_tuileY = "101") then
                    o_cc <= "1101";
                elsif (i_tuileX = "101" and i_tuileY = "000") or
                    (i_tuileX = "011" and i_tuileY = "000") or
                    (i_tuileX = "100" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "001") or
                    (i_tuileX = "010" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "101") or
                    (i_tuileX = "101" and i_tuileY = "110") or
                    (i_tuileX = "100" and i_tuileY = "110") then
                    o_cc <= "1110";
                else
                    o_cc <= "0000";
                end if;
            when "010010" =>
                if (i_tuileX = "101" and i_tuileY = "000") or
                    (i_tuileX = "110" and i_tuileY = "000") or
                    (i_tuileX = "111" and i_tuileY = "000") or
                    (i_tuileX = "010" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "001") or
                    (i_tuileX = "101" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "100" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "111" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "000" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "101") or
                    (i_tuileX = "100" and i_tuileY = "101") or
                    (i_tuileX = "010" and i_tuileY = "110") or
                    (i_tuileX = "101" and i_tuileY = "110") or
                    (i_tuileX = "110" and i_tuileY = "110") or
                    (i_tuileX = "101" and i_tuileY = "111") or
                    (i_tuileX = "111" and i_tuileY = "111") then
                    o_cc <= "1000";
                elsif (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "010") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "011") or
                    (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "010" and i_tuileY = "100") or
                    (i_tuileX = "011" and i_tuileY = "100") or
                    (i_tuileX = "100" and i_tuileY = "100") or
                    (i_tuileX = "101" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "101" and i_tuileY = "101") or
                    (i_tuileX = "110" and i_tuileY = "101") or
                    (i_tuileX = "111" and i_tuileY = "101") then
                    o_cc <= "0101";
                elsif (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "101") or
                    (i_tuileX = "010" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "110") or
                    (i_tuileX = "100" and i_tuileY = "110") or
                    (i_tuileX = "111" and i_tuileY = "110") or
                    (i_tuileX = "110" and i_tuileY = "111") then
                    o_cc <= "0110";
                else
                    o_cc <= "0000";
                end if;
            when "010011" =>
                if (i_tuileX = "010" and i_tuileY = "000") or
                    (i_tuileX = "001" and i_tuileY = "000") or
                    (i_tuileX = "000" and i_tuileY = "000") or
                    (i_tuileX = "101" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "001") or
                    (i_tuileX = "010" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "011" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "011") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "111" and i_tuileY = "101") or
                    (i_tuileX = "100" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "101") or
                    (i_tuileX = "101" and i_tuileY = "110") or
                    (i_tuileX = "010" and i_tuileY = "110") or
                    (i_tuileX = "001" and i_tuileY = "110") or
                    (i_tuileX = "010" and i_tuileY = "111") or
                    (i_tuileX = "000" and i_tuileY = "111") then
                    o_cc <= "1000";
                elsif (i_tuileX = "001" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "010") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "011") or
                    (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "101" and i_tuileY = "100") or
                    (i_tuileX = "100" and i_tuileY = "100") or
                    (i_tuileX = "011" and i_tuileY = "100") or
                    (i_tuileX = "010" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "010" and i_tuileY = "101") or
                    (i_tuileX = "001" and i_tuileY = "101") or
                    (i_tuileX = "000" and i_tuileY = "101") then
                    o_cc <= "0101";
                elsif (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "101") or
                    (i_tuileX = "101" and i_tuileY = "101") or
                    (i_tuileX = "100" and i_tuileY = "110") or
                    (i_tuileX = "011" and i_tuileY = "110") or
                    (i_tuileX = "000" and i_tuileY = "110") or
                    (i_tuileX = "001" and i_tuileY = "111") then
                    o_cc <= "0110";
                else
                    o_cc <= "0000";
                end if;
            when "010100" =>
                if (i_tuileX = "001" and i_tuileY = "000") or
                    (i_tuileX = "010" and i_tuileY = "000") or
                    (i_tuileX = "110" and i_tuileY = "000") or
                    (i_tuileX = "000" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "100" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "100") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "101") or
                    (i_tuileX = "100" and i_tuileY = "101") or
                    (i_tuileX = "000" and i_tuileY = "110") or
                    (i_tuileX = "101" and i_tuileY = "110") or
                    (i_tuileX = "110" and i_tuileY = "111") then
                    o_cc <= "1000";
                elsif (i_tuileX = "111" and i_tuileY = "000") or
                    (i_tuileX = "001" and i_tuileY = "001") or
                    (i_tuileX = "010" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "001") or
                    (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "001") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "101" and i_tuileY = "101") then
                    o_cc <= "0101";
                elsif (i_tuileX = "011" and i_tuileY = "000") or
                    (i_tuileX = "100" and i_tuileY = "000") or
                    (i_tuileX = "101" and i_tuileY = "000") or
                    (i_tuileX = "101" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "011") or
                    (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "111" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "101") or
                    (i_tuileX = "001" and i_tuileY = "110") or
                    (i_tuileX = "100" and i_tuileY = "110") or
                    (i_tuileX = "101" and i_tuileY = "111") then
                    o_cc <= "0110";
                else
                    o_cc <= "0000";
                end if;
            when "010101" =>
                if (i_tuileX = "110" and i_tuileY = "000") or
                    (i_tuileX = "101" and i_tuileY = "000") or
                    (i_tuileX = "001" and i_tuileY = "000") or
                    (i_tuileX = "111" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "011" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "100") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "101") or
                    (i_tuileX = "111" and i_tuileY = "110") or
                    (i_tuileX = "010" and i_tuileY = "110") or
                    (i_tuileX = "001" and i_tuileY = "111") then
                    o_cc <= "1000";
                elsif (i_tuileX = "000" and i_tuileY = "000") or
                    (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "101" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "001") or
                    (i_tuileX = "001" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "001") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "010" and i_tuileY = "101") then
                    o_cc <= "0101";
                elsif (i_tuileX = "100" and i_tuileY = "000") or
                    (i_tuileX = "011" and i_tuileY = "000") or
                    (i_tuileX = "010" and i_tuileY = "000") or
                    (i_tuileX = "010" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "011") or
                    (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "011") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "101") or
                    (i_tuileX = "110" and i_tuileY = "110") or
                    (i_tuileX = "011" and i_tuileY = "110") or
                    (i_tuileX = "010" and i_tuileY = "111") then
                    o_cc <= "0110";
                else
                    o_cc <= "0000";
                end if;
            when "010110" =>
                if (i_tuileX = "111" and i_tuileY = "000") or
                    (i_tuileX = "001" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "000" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "101") or
                    (i_tuileX = "101" and i_tuileY = "101") or
                    (i_tuileX = "111" and i_tuileY = "101") or
                    (i_tuileX = "001" and i_tuileY = "110") or
                    (i_tuileX = "100" and i_tuileY = "111") or
                    (i_tuileX = "111" and i_tuileY = "111") then
                    o_cc <= "1001";
                elsif (i_tuileX = "010" and i_tuileY = "001") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "011" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "111" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "100") or
                    (i_tuileX = "101" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "101") or
                    (i_tuileX = "000" and i_tuileY = "111") or
                    (i_tuileX = "010" and i_tuileY = "111") or
                    (i_tuileX = "101" and i_tuileY = "111") then
                    o_cc <= "1010";
                elsif (i_tuileX = "111" and i_tuileY = "001") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "000" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "011" and i_tuileY = "100") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "010" and i_tuileY = "101") or
                    (i_tuileX = "110" and i_tuileY = "101") or
                    (i_tuileX = "010" and i_tuileY = "110") or
                    (i_tuileX = "101" and i_tuileY = "110") or
                    (i_tuileX = "110" and i_tuileY = "110") or
                    (i_tuileX = "111" and i_tuileY = "110") or
                    (i_tuileX = "001" and i_tuileY = "111") or
                    (i_tuileX = "110" and i_tuileY = "111") then
                    o_cc <= "1011";
                else
                    o_cc <= "0000";
                end if;
            when "010111" =>
                if (i_tuileX = "000" and i_tuileY = "000") or
                    (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "111" and i_tuileY = "101") or
                    (i_tuileX = "100" and i_tuileY = "101") or
                    (i_tuileX = "010" and i_tuileY = "101") or
                    (i_tuileX = "000" and i_tuileY = "101") or
                    (i_tuileX = "110" and i_tuileY = "110") or
                    (i_tuileX = "011" and i_tuileY = "111") or
                    (i_tuileX = "000" and i_tuileY = "111") then
                    o_cc <= "1001";
                elsif (i_tuileX = "101" and i_tuileY = "001") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "100" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "100") or
                    (i_tuileX = "010" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "101") or
                    (i_tuileX = "111" and i_tuileY = "111") or
                    (i_tuileX = "101" and i_tuileY = "111") or
                    (i_tuileX = "010" and i_tuileY = "111") then
                    o_cc <= "1010";
                elsif (i_tuileX = "000" and i_tuileY = "001") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "111" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "100" and i_tuileY = "100") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "101" and i_tuileY = "101") or
                    (i_tuileX = "001" and i_tuileY = "101") or
                    (i_tuileX = "101" and i_tuileY = "110") or
                    (i_tuileX = "010" and i_tuileY = "110") or
                    (i_tuileX = "001" and i_tuileY = "110") or
                    (i_tuileX = "000" and i_tuileY = "110") or
                    (i_tuileX = "110" and i_tuileY = "111") or
                    (i_tuileX = "001" and i_tuileY = "111") then
                    o_cc <= "1011";
                else
                    o_cc <= "0000";
                end if;
            when "011000" =>
                if (i_tuileX = "101" and i_tuileY = "000") or
                    (i_tuileX = "000" and i_tuileY = "001") or
                    (i_tuileX = "010" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "001") or
                    (i_tuileX = "011" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "101") or
                    (i_tuileX = "100" and i_tuileY = "110") or
                    (i_tuileX = "011" and i_tuileY = "111") or
                    (i_tuileX = "101" and i_tuileY = "111") then
                    o_cc <= "1001";
                elsif (i_tuileX = "001" and i_tuileY = "000") or
                    (i_tuileX = "100" and i_tuileY = "000") or
                    (i_tuileX = "110" and i_tuileY = "000") or
                    (i_tuileX = "111" and i_tuileY = "000") or
                    (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "010") or
                    (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "111" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "100") or
                    (i_tuileX = "011" and i_tuileY = "101") or
                    (i_tuileX = "100" and i_tuileY = "101") or
                    (i_tuileX = "101" and i_tuileY = "101") or
                    (i_tuileX = "111" and i_tuileY = "101") or
                    (i_tuileX = "101" and i_tuileY = "110") or
                    (i_tuileX = "111" and i_tuileY = "110") or
                    (i_tuileX = "100" and i_tuileY = "111") then
                    o_cc <= "1010";
                elsif (i_tuileX = "000" and i_tuileY = "000") or
                    (i_tuileX = "001" and i_tuileY = "001") or
                    (i_tuileX = "111" and i_tuileY = "010") or
                    (i_tuileX = "010" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "011") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "011" and i_tuileY = "100") or
                    (i_tuileX = "100" and i_tuileY = "100") or
                    (i_tuileX = "111" and i_tuileY = "100") or
                    (i_tuileX = "110" and i_tuileY = "110") or
                    (i_tuileX = "101" and i_tuileY = "111") then
                    o_cc <= "1011";
                else
                    o_cc <= "0000";
                end if;
            when "011001" =>
                if (i_tuileX = "010" and i_tuileY = "000") or
                    (i_tuileX = "111" and i_tuileY = "001") or
                    (i_tuileX = "101" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "001") or
                    (i_tuileX = "100" and i_tuileY = "010") or
                    (i_tuileX = "001" and i_tuileY = "010") or
                    (i_tuileX = "110" and i_tuileY = "011") or
                    (i_tuileX = "011" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "110") or
                    (i_tuileX = "100" and i_tuileY = "111") or
                    (i_tuileX = "010" and i_tuileY = "111") then
                    o_cc <= "1001";
                elsif (i_tuileX = "110" and i_tuileY = "000") or
                    (i_tuileX = "011" and i_tuileY = "000") or
                    (i_tuileX = "001" and i_tuileY = "000") or
                    (i_tuileX = "000" and i_tuileY = "000") or
                    (i_tuileX = "001" and i_tuileY = "001") or
                    (i_tuileX = "110" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "010") or
                    (i_tuileX = "100" and i_tuileY = "011") or
                    (i_tuileX = "000" and i_tuileY = "011") or
                    (i_tuileX = "101" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "100") or
                    (i_tuileX = "100" and i_tuileY = "101") or
                    (i_tuileX = "011" and i_tuileY = "101") or
                    (i_tuileX = "010" and i_tuileY = "101") or
                    (i_tuileX = "000" and i_tuileY = "101") or
                    (i_tuileX = "010" and i_tuileY = "110") or
                    (i_tuileX = "000" and i_tuileY = "110") or
                    (i_tuileX = "011" and i_tuileY = "111") then
                    o_cc <= "1010";
                elsif (i_tuileX = "111" and i_tuileY = "000") or
                    (i_tuileX = "110" and i_tuileY = "001") or
                    (i_tuileX = "000" and i_tuileY = "010") or
                    (i_tuileX = "101" and i_tuileY = "011") or
                    (i_tuileX = "010" and i_tuileY = "011") or
                    (i_tuileX = "001" and i_tuileY = "011") or
                    (i_tuileX = "100" and i_tuileY = "100") or
                    (i_tuileX = "011" and i_tuileY = "100") or
                    (i_tuileX = "000" and i_tuileY = "100") or
                    (i_tuileX = "001" and i_tuileY = "110") or
                    (i_tuileX = "010" and i_tuileY = "111") then
                    o_cc <= "1011";
                else
                    o_cc <= "0000";
                end if;
            
            -- Si ça ne fait pas partie des autres tuiles!
            when others => 
                o_cc <= "0000";
        end case;
    end process;

end Behavioral;
