----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2025 10:13:46 PM
-- Design Name: 
-- Module Name: tb_MyControlerPPU - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_PPU is
--  Port ( );
end tb_PPU;

architecture Behavioral of tb_PPU is

    constant clk_cycle : time := 1 ns;
	
    signal clk : std_logic;
    
    signal s_pixel_x : std_logic_vector(9 downto 0) := (others => '0');
    signal s_pixel_y : std_logic_vector(9 downto 0) := (others => '0');
    
    
    signal s_instruction : std_logic_vector(31 downto 0) := (others => '0');
    
    signal s_dataPixel : std_logic_vector(23 downto 0);
    signal s_dataValid : std_logic;
    

      
    -- Composante du PPU
    component PPU is
        Port
        (
            i_instruction : in std_logic_vector(31 downto 0) := (others => '0');
            i_pixel_x : in std_logic_vector(9 downto 0) := (others => '0');
            i_pixel_y : in std_logic_vector(9 downto 0) := (others => '0');
            i_clk : in std_logic;
            o_dataPixel : out std_logic_vector(23 downto 0);
            o_dataValid : out std_logic := '0'
        );
    end component;


begin

    utt_PPU : PPU
    port map
    (
        i_instruction    => s_instruction,
        i_pixel_x        => s_pixel_x,
        i_pixel_y        => s_pixel_y,
        i_clk            => clk,
        o_dataPixel      => s_dataPixel,
        o_dataValid      => s_dataValid
    );
    
     -- horloge
    process
    begin
        clk <= '1';
        loop
            wait for clk_cycle/2;
            clk <= not clk;
        end loop;
    end process;
    
    process
        variable i : integer := 0;
        variable j : integer := 0;
    begin
        for i in 0 to 359 loop
            for j in 0 to 639 loop
                s_pixel_y <= std_logic_vector(to_unsigned(i, 10));
                s_pixel_x <= std_logic_vector(to_unsigned(j, 10));
                
                wait until rising_edge(clk); -- attend le front montant de clk à chaque itération
            end loop;
        end loop;
    
        wait; -- arrête le process
    end process;

   
    


end Behavioral;
