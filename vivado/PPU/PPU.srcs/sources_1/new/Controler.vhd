----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2025 01:41:33 PM
-- Design Name: 
-- Module Name: Controler - Behavioral
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
use work.SpaceInvaderInstructionsLib.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Controler is
    Port 
    (
        i_instruction : in std_logic_vector(31 downto 0);
        o_enableActorMGMT : out std_logic := '0';
        o_resetActorMGMT : out std_logic := '0';
        o_writeBackbuffer : out std_logic := '0';
        o_resetBackbuffer : out std_logic := '0'
    );
end Controler;

architecture Behavioral of Controler is

    signal opcode : std_logic_vector(31 downto 29) := (others => '0');
    signal func : std_logic_vector(28 downto 26) := (others => '0');


begin

    opcode <= i_instruction(31 downto 29);
    func <= i_instruction(28 downto 26);
    
    process(i_instruction)
    begin
        if func = FUNC_INITIALISEBACKGROUNDTILE then
            o_writeBackbuffer <= '1';
        else o_writeBackbuffer <= '0';
        end if;
        
        if opcode = OP_SPRITES then
            o_enableActorMGMT <= '1';
        else  o_enableActorMGMT <= '0';
        end if;
        
        
        if opcode = OP_GAME then
            if (func = FUNC_ENDGAME  or func = FUNC_RESETGAME) then
                o_resetActorMGMT <= '1';
                o_resetBackbuffer <= '1';
            else 
                o_resetActorMGMT <= '0';
                o_resetBackbuffer <= '0';
            end if;
        end if;
        
    end process;


end Behavioral;
