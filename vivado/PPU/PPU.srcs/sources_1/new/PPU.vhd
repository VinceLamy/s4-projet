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

entity PPU is
    Port 
    (
        i_instruction : in std_logic_vector(31 downto 0) := (others => '0');
        i_pixel_x : in std_logic_vector(9 downto 0) := (others => '0');
        i_pixel_y : in std_logic_vector(9 downto 0) := (others => '0');
        i_clk : in std_logic;
        i_resetn : in std_logic := '0';
        o_dataPixel : out std_logic_vector(23 downto 0);
        o_dataValid : out std_logic := '0'
    );
end PPU;

architecture Behavioral of PPU is

    
    
   
    
    signal s_tuileID     :  std_logic_vector(5 downto 0);
    signal s_tuile_x      :  std_logic_vector(2 downto 0);
    signal s_tuile_y      :  std_logic_vector(2 downto 0);
	signal s_enableActorMGMT :   std_logic := '0';
    signal s_resetActorMGMT :    std_logic := '0';
    signal s_writeBackbuffer :  std_logic := '0';
    signal s_resetBackbuffer :   std_logic := '0';
    
    signal s_cc :  std_logic_vector(3 downto 0);
    
    signal s_dataPixel : std_logic_vector(23 downto 0);
    

      
    -- Composante du PPU
    component Controler is
    Port 
        (
            i_instruction :      in std_logic_vector(31 downto 0);
            o_enableActorMGMT :  out std_logic := '0';
            o_resetActorMGMT :   out std_logic := '0';
            o_writeBackbuffer : out std_logic := '0';
            o_resetBackbuffer :  out std_logic := '0'
        );
    end component;
    
    component ActorTuileBuffer is
    Port ( i_tuile_id : in STD_LOGIC_VECTOR (5 downto 0);
           i_tuile_x : in STD_LOGIC_VECTOR (2 downto 0);
           i_tuile_y : in STD_LOGIC_VECTOR (2 downto 0);
           o_cc : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component BackgroundTuileBuffer is
    Port ( i_tuile_id : in STD_LOGIC_VECTOR (5 downto 0);
           i_tuile_x : in STD_LOGIC_VECTOR (2 downto 0);
           i_tuile_y : in STD_LOGIC_VECTOR (2 downto 0);
           o_cc : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component BackgroundBuffer is
    Port ( 
           i_clk         : in std_logic;
           i_globalX     : in std_logic_vector(9 downto 0);
           i_globalY     : in std_logic_vector(9 downto 0);
           
           i_WriteEn     : in std_logic;
           i_WriteData   : in std_logic_vector(5 downto 0);
           i_WriteAdress : integer range 0 to 16383;
           
           o_tuileID     : out std_logic_vector(5 downto 0);
           o_tuileX      : out std_logic_vector(2 downto 0);
           o_tuileY      : out std_logic_vector(2 downto 0));
    end component;
    
    component MonitorInstruction is
     Port 
        (
            i_instruction : in std_logic_vector(31 downto 0)
        );
    end component;
    
    component ColorConverter is
        Port (
            sel : in STD_LOGIC_VECTOR(3 downto 0); -- Sélecteur 4 bits
            rgb : out STD_LOGIC_VECTOR(23 downto 0) -- Sortie RGB 3 bits
        );
    end component;
    

    


begin

     -- horloge
    
    
    

   
    -- Add user logic here
    
	-- User logic ends
	
	contr : Controler
        port map
        (
            i_instruction => i_instruction,
            o_enableActorMGMT => s_enableActorMGMT,
            o_resetActorMGMT => s_resetActorMGMT,
            o_writeBackbuffer => s_writeBackBuffer,
            o_resetBackbuffer => s_resetBackBuffer
        );
        


    
    backTileBuff : BackgroundTuileBuffer
        port map 
        ( 
            i_tuile_id => s_tuileID,
            i_tuile_x => s_tuile_x,
            i_tuile_y => s_tuile_y,
            o_cc => s_cc
        );
        
    colorConv : ColorConverter
        port map 
        (
            sel => s_cc,
            rgb => s_dataPixel
        );

    
    backgroundBuff : BackgroundBuffer
        port map
        ( 
            i_clk => i_clk,
            i_globalX =>i_pixel_x,
            i_globalY =>i_pixel_y,
               
            i_WriteEn => '0',
            i_WriteData => "000000",
            i_WriteAdress => 0,
               
            o_tuileID => s_tuileID,
            o_tuileX => s_tuile_x,
            o_tuileY => s_tuile_y
        );
    
    monitorInstr : MonitorInstruction
    port map 
        (
            i_instruction => i_instruction
        );
        
    o_dataPixel <= s_dataPixel;


end Behavioral;
