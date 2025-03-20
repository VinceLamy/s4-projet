----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2025 04:47:34 PM
-- Design Name: 
-- Module Name: spaceInvaderLib - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package spaceInvaderLib is
    
    -- opcodes dans le décodage d'instructions
    constant OP_BACKGROUND : std_logic_vector( 2 downto 0 ) := "000";
    constant OP_SPRITES : std_logic_vector( 2 downto 0 ) := "001";
    constant OP_GAME : std_logic_vector( 2 downto 0 ) := "010";

    
    -- fonction dans le décodage de l'instruction
    constant FUNC_MOVEVIEWPORT                  : std_logic_vector(2 downto 0) := "000";
    constant FUNC_RESETVIEWPORT                 : std_logic_vector(2 downto 0) := "001";
    constant FUNC_INITIALISEBACKGROUNDTILE      : std_logic_vector(2 downto 0) := "010";
    constant FUNC_MOVESPRITE                    : std_logic_vector(2 downto 0) := "000";
    constant FUNC_REMOVESPRITE                  : std_logic_vector(2 downto 0) := "001";
    constant FUNC_ADDSPRITES                    : std_logic_vector(2 downto 0) := "010";
    constant FUNC_EXPLODESPRITE                 : std_logic_vector(2 downto 0) := "011";
    constant FUNC_RESETSPRITE                   : std_logic_vector(2 downto 0) := "100";
    constant FUNC_INCREMENTSCORE                : std_logic_vector(2 downto 0) := "000";
    constant FUNC_RESETGAME                     : std_logic_vector(2 downto 0) := "001";
    constant FUNC_ENDGAME                       : std_logic_vector(2 downto 0) := "010";
	
	
    type op_type is (
		sim_OP_BACKGROUND,
		sim_OP_SPRITES,
		sim_OP_GAME,
        sim_OP_Undefined
    );
    
    type function_type is (
		sim_FUNC_MOVEVIEWPORT,
		sim_FUNC_RESETVIEWPORT,
		sim_FUNC_INITIALISEBACKGROUNDTILE,
		sim_FUNC_MOVESPRITE,
		sim_FUNC_REMOVESPRITE,
		sim_FUNC_ADDSPRITES,
		sim_FUNC_EXPLODESPRITE,
		sim_FUNC_RESETSPRITE,
		sim_FUNC_INCREMENTSCORE,
		sim_FUNC_RESETGAME,
		sim_FUNC_ENDGAME,
        sim_FUNC_Undefined
    );
    
    
function f_DisplayOp(InstructionDebug : std_logic_vector( 31 downto 0 )
                    ) return op_type;
                    
function f_DisplayFunc(InstructionDebug : std_logic_vector( 31 downto 0 )
                    ) return function_type;
                        

	
end package spaceInvaderLib;

package body spaceInvaderLib is

function f_DisplayOp(InstructionDebug : std_logic_vector( 31 downto 0 )
                        ) return op_type is 
	variable CurrentOp : op_type;
	variable OpField : std_logic_vector(2 downto 0);
	
begin

	OpField	:= InstructionDebug(31 downto 29);     

	case OpField is
	   when OP_BACKGROUND =>
	       CurrentOp := sim_OP_BACKGROUND;
	

	   when OP_SPRITES =>
	       CurrentOp := sim_OP_SPRITES;
		   

	   when OP_GAME =>
	       CurrentOp := sim_OP_GAME;
	       
			
	   when others =>
	       CurrentOp := sim_OP_Undefined;

	end case;
	
	return CurrentOp;
end function;

function f_DisplayFunc(InstructionDebug : std_logic_vector( 31 downto 0 )
                        ) return function_type is 
	variable CurrentOp : op_type;
	variable CurrentFunct : function_type;
	variable OpField : std_logic_vector(2 downto 0);
	variable FunctField  : std_logic_vector(2 downto 0);
	
begin

	OpField	        := InstructionDebug(31 downto 29);
	FunctField		:= InstructionDebug(28 downto 26);
	
	case OpField is
	   when OP_BACKGROUND =>
	       CurrentOp := sim_OP_BACKGROUND;
	       	case FunctField is 
				when FUNC_MOVEVIEWPORT =>
				    CurrentFunct := sim_FUNC_MOVEVIEWPORT;
		        when FUNC_RESETVIEWPORT => 
		            CurrentFunct := sim_FUNC_RESETVIEWPORT;
		        when FUNC_INITIALISEBACKGROUNDTILE => 
		            CurrentFunct := sim_FUNC_INITIALISEBACKGROUNDTILE;
				when others =>
					CurrentFunct := sim_FUNC_Undefined;
			end case;

	   when OP_SPRITES =>
	       CurrentOp := sim_OP_SPRITES;
	       case FunctField is 
				when FUNC_MOVESPRITE =>
				    CurrentFunct := sim_FUNC_MOVESPRITE;
		        when FUNC_REMOVESPRITE => 
		            CurrentFunct := sim_FUNC_REMOVESPRITE;
		        when FUNC_ADDSPRITES => 
		            CurrentFunct := sim_FUNC_ADDSPRITES;
		        when FUNC_EXPLODESPRITE => 
		            CurrentFunct := sim_FUNC_EXPLODESPRITE;
		        when FUNC_RESETSPRITE => 
		            CurrentFunct := sim_FUNC_RESETSPRITE;
				when others =>
					CurrentFunct := sim_FUNC_Undefined;
		   end case;

	   when OP_GAME =>
	       CurrentOp := sim_OP_GAME;
	       case FunctField is 
				when FUNC_INCREMENTSCORE =>
				    CurrentFunct := sim_FUNC_INCREMENTSCORE;
		        when FUNC_RESETGAME => 
		            CurrentFunct := sim_FUNC_RESETGAME;
		        when FUNC_ENDGAME => 
		            CurrentFunct := sim_FUNC_ENDGAME;
				when others =>
					CurrentFunct := sim_FUNC_Undefined;
		   end case;
			
	   when others =>
	       CurrentOp := sim_OP_Undefined;
	       CurrentFunct := sim_FUNC_Undefined;
	end case;
	
	return CurrentFunct;
end function;

end package body spaceInvaderLib;