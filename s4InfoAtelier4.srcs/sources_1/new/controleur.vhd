----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2025 11:12:12 PM
-- Design Name: 
-- Module Name: controleur - Behavioral
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
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.spaceInvaderLib.all; -- pour la librairie
use ieee.numeric_std.all;       -- pour to_integer

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controleur is
    Port ( i_instruction        : in std_logic_vector(31 downto 0);
           o_enableActorMGMT    : out std_logic;
           o_resetActorMGMT     : out std_logic;
           o_resetBkg           : out std_logic;
           o_writeBkgEn         : out std_logic;
           o_writeBkgAdress     : out unsigned (13 downto 0)
           );
end controleur;

architecture Behavioral of controleur is

signal s_Opcode     : std_logic_vector(2 downto 0);
signal s_Funct      : std_logic_vector(2 downto 0);

begin
    s_Opcode <= i_instruction(31 downto 29);
    s_Funct <= i_instruction(28 downto 26);
    
    -- Acteur
    o_enableActorMGMT <= '1' when s_OpCode = OP_SPRITES
                             else '0';
    
    -- Reset                         
    o_resetActorMGMT <= '1' when s_Opcode = OP_GAME else 
                        '1' when (s_Funct = FUNC_ENDGAME or s_Funct = FUNC_RESETGAME)
                            else '0';
                             
    o_resetBkg <= '1' when s_Opcode = OP_GAME else 
                  '1' when (s_Funct = FUNC_ENDGAME or s_Funct = FUNC_RESETGAME)
                      else '0';
    
    -- Background
    o_writeBkgEn <= '1' when s_Funct = FUNC_INITIALISEBACKGROUNDTILE
                        else '0';
                        
    o_writeBkgAdress <= resize((unsigned(i_instruction(19 downto 13)) + (unsigned(i_instruction(12 downto 6)) * to_unsigned(128, 14))), 14);
    
end Behavioral;
