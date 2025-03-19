----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2025 02:17:09 PM
-- Design Name: 
-- Module Name: backgroundBuffer - Behavioral
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
use ieee.numeric_std.all;       -- pour to_integer

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity backgroundBuffer is
    Port ( 
           i_clk         : in std_logic;
           i_globalX     : in std_logic_vector(11 downto 0);
           i_globalY     : in std_logic_vector(11 downto 0);
           
           i_WriteEn     : in std_logic;
           i_WriteData   : in std_logic_vector(5 downto 0);
           i_WriteAdress : in unsigned(13 downto 0);
           
           o_tuileID     : out std_logic_vector(5 downto 0);
           o_tuileX      : out std_logic_vector(2 downto 0);
           o_tuileY      : out std_logic_vector(2 downto 0));
end backgroundBuffer;

architecture Behavioral of backgroundBuffer is
    
    type TUILE is array (natural range <>) of std_logic_vector (5 downto 0);
    signal backgroundMemory : TUILE(0 to 16383) := (
others => "000000");       -- Au départ, le background est vide, le CPU le remplis...
    
    signal sReadIndex 	: integer range 0 to 16383;
    
begin
    sReadIndex <= to_integer(unsigned(i_globalX(11 downto 3)) + (unsigned(i_globalY(11 downto 3)) * to_unsigned(128, 14)));
    
    -- Écriture
    process(i_clk)
    begin
        if (rising_edge(i_clk)) then
            if (i_WriteEn = '1') then
                backgroundMemory(to_integer(i_WriteAdress)) <= i_WriteData;
            end if;
        end if;
    end process;
    
    -- Lecture
    o_tuileID <= backgroundMemory(sReadIndex);
    o_tuileX <= i_globalX(2 downto 0);
    o_tuileY <= i_globalY(2 downto 0);

end Behavioral;
