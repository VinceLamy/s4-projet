----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2025 09:03:32 PM
-- Design Name: 
-- Module Name: ppu - Behavioral
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

entity ppu is
    Port (
    clk             : in std_logic;
    rstn            : in std_logic;
    i_x             : in std_logic_vector(11 downto 0);
    i_y             : in std_logic_vector(11 downto 0);
    i_instruction   : in std_logic_vector(31 downto 0);
    o_dataValid     : out std_logic;
    o_dataPixel     : out std_logic_vector(23 downto 0)
    );
end ppu;

architecture Behavioral of ppu is

--------------------------
-- DÉBUT COMPONENT -- 
--------------------------
component controleur is
    Port ( i_instruction        : in std_logic_vector(31 downto 0);
           o_enableActorMGMT    : out std_logic;
           o_resetActorMGMT     : out std_logic;
           o_resetBkg           : out std_logic;
           o_writeBkgEn         : out std_logic;
           o_writeBkgAdress     : out unsigned (13 downto 0)
           );
end component;


component backgroundBuffer is
    Port ( i_clk         : in std_logic;
           i_globalX     : in std_logic_vector(11 downto 0);
           i_globalY     : in std_logic_vector(11 downto 0);
           
           i_WriteEn     : in std_logic;
           i_WriteData   : in std_logic_vector(5 downto 0);
           i_WriteAdress : in unsigned(13 downto 0);
           
           o_tuileID     : out std_logic_vector(5 downto 0);
           o_tuileX      : out std_logic_vector(2 downto 0);
           o_tuileY      : out std_logic_vector(2 downto 0)
           );
end component;

component bacTuileBuffer is
    Port ( i_tuileID     : in std_logic_vector(5 downto 0);
           i_tuileX      : in std_logic_vector(2 downto 0);
           i_tuileY      : in std_logic_vector(2 downto 0);
           o_cc          : out std_logic_vector(3 downto 0)
           );
end component;

component actorManager is
    Port (
        i_clk        : in  std_logic;
        i_globalX   : in  std_logic_vector(9 downto 0);
        i_globalY   : in  std_logic_vector(9 downto 0);
        o_tuileID   : out std_logic_vector(5 downto 0);
        o_tuileX    : out std_logic_vector(2 downto 0);
        o_tuileY    : out std_logic_vector(2 downto 0)
    );
end component;

component actorTuileBuffer is
    Port ( 
        i_tuileID : in STD_LOGIC_VECTOR (5 downto 0);
        i_tuileX : in STD_LOGIC_VECTOR (2 downto 0);
        i_tuileY : in STD_LOGIC_VECTOR (2 downto 0);
        o_cc : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component colorConverter is
    Port ( sel           : in std_logic_vector(3 downto 0);
           rbg           : out std_logic_vector(23 downto 0)
           );
end component;

--------------------------
-- FIN COMPONENT -- 
--------------------------

signal s_writeBkgEn : std_logic;
signal s_writeBkgAdress : unsigned (13 downto 0);

signal s_bkgTuileID : std_logic_vector(5 downto 0);
signal s_bkgTuileX : std_logic_vector(2 downto 0);
signal s_bkgTuileY : std_logic_vector(2 downto 0);
signal s_bkgCC : std_logic_vector(3 downto 0);

signal s_actTuileID : std_logic_vector(5 downto 0);
signal s_actTuileX : std_logic_vector(2 downto 0);
signal s_actTuileY : std_logic_vector(2 downto 0);
signal s_actCC : std_logic_vector(3 downto 0);

signal s_CC  : std_logic_vector(3 downto 0);
signal s_rbg : std_logic_vector(23 downto 0);
    
begin

--------------------------
-- DÉBUT INSTANTIATION -- 
--------------------------

inst_ctrl: controleur
port map (
    i_instruction => i_instruction,
    o_enableActorMGMT => open,
    o_resetActorMGMT => open, 
    o_resetBkg => open,
    o_writeBkgEn => s_writeBkgEn,
    o_writeBkgAdress => s_writeBkgAdress
    );
    
inst_bkgBuffer: backgroundBuffer
port map (
    i_clk => clk,
    i_globalX => i_x,
    i_globalY => i_y,
    
    i_WriteEn => s_writeBkgEn,
    i_WriteData => i_instruction(25 downto 20),
    i_WriteAdress => s_writeBkgAdress,
    
    o_tuileID => s_bkgTuileID,
    o_tuileX => s_bkgTuileX,
    o_tuileY => s_bkgTuileY
    );

inst_bacTuileBuffer : bacTuileBuffer
port map (
    i_tuileID => s_bkgTuileID,
    i_tuileX => s_bkgTuileX,
    i_tuileY => s_bkgTuileY,
    o_cc => s_bkgCC
    );

inst_actorManager : actorManager
port map (
    i_clk => clk,
    i_globalX => i_x(9 downto 0),
    i_globalY => i_y(9 downto 0),
    o_tuileID => s_actTuileID,
    o_tuileX => s_actTuileX,
    o_tuileY => s_actTuileY
    );
    
inst_actorTuileBuffer : actorTuileBuffer
port map (
    i_tuileID => s_actTuileID,
    i_tuileX => s_actTuileX,
    i_tuileY => s_actTuileY,
    o_cc => s_actCC
    );

process(clk, s_actCC, s_bkgCC)
begin
    if (s_actCC = "0000") then
        s_CC <= s_bkgCC;
    else
        s_CC <= s_actCC;
    end if;
end process;

inst_colorConv : colorConverter
port map (
    sel => s_CC,
    rbg => s_rbg
    );
    
--------------------------
-- FIN INSTANTIATION -- 
--------------------------

o_dataPixel <= s_rbg;
o_dataValid <= '1';

end Behavioral;