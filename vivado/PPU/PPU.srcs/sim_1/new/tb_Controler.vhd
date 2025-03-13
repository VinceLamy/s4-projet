----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2025 04:14:39 PM
-- Design Name: 
-- Module Name: tb_Controler - Behavioral
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

entity tb_Controler is
end tb_Controler;

architecture Behavioral of tb_Controler is

    component Controler is
    Port 
        (
            i_instruction :      in std_logic_vector(31 downto 0);
            o_enableActorMGMT :  out std_logic := '0';
            o_resetActorMGMT :   out std_logic := '0';
            o_enableBackbuffer : out std_logic := '0';
            o_resetBackbuffer :  out std_logic := '0'
        );
    end component;
    
    component monitorInstruction is
        Port 
        (
            i_instruction : in std_logic_vector(31 downto 0)
        );
    end component;
    

    signal s_enableActorMGMT :   std_logic := '0';
    signal s_resetActorMGMT :    std_logic := '0';
    signal s_enableBackbuffer :  std_logic := '0';
    signal s_resetBackbuffer :   std_logic := '0';
    signal s_singleInstruction : std_logic_vector(31 downto 0);
    
    type instruction_array is array (0 to 255) of std_logic_vector(31 downto 0);
    
    
    
    --Instructions
    signal s_instruction : instruction_array := (
        X"00000000",
        X"04000000",
        X"08000000",
        X"20000000",
        X"24000000",
        X"28000000",
        X"2c000000",
        X"30000000",
        X"40000000",
        X"44000000",
        
        others => X"48000000"
    );
    
    signal s_Index : integer range 0 to 255 := 0;
    
    constant clk_cycle : time := 10 ns;
	
    signal clk : std_logic;

    
begin

    -- horloge
    process
    begin
        clk <= '1';
        loop
            wait for clk_cycle/2;
            clk <= not clk;
        end loop;
    end process;
    


    -- Sorties

    

    contr : Controler
        port map
        (
            i_instruction => s_singleInstruction,
            o_enableActorMGMT => s_enableActorMGMT,
            o_resetActorMGMT => s_resetActorMGMT,
            o_enableBackbuffer => s_enableBackBuffer,
            o_resetBackbuffer => s_resetBackBuffer
        );
        
    monInstruction : monitorInstruction
    port map
    (
        i_instruction => s_singleInstruction
    );
        


    process(clk)
    begin
    
        if rising_edge(clk) then
            s_singleInstruction <= s_instruction(s_Index);
            s_Index <= s_Index + 1;
        end if;
    end process;


end Behavioral;
