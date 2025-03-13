


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.SpaceInvaderInstructionsLib.all;

library std;
use std.env.stop;


entity MonitorInstruction is
 Port 
    (
        i_instruction : in std_logic_vector(31 downto 0)
    );
end MonitorInstruction;

architecture Behavioral of MonitorInstruction is

	signal show_Instruction		: op_type;
	signal show_Function: function_type;
	
	signal flag_endgame				: std_logic;

    
begin




EncapsulerExtraction: block
    constant c_EndProgramCode : integer := 10;
    
	signal s_Instruction		: std_logic_vector (31 downto 0);
begin
	
	show_Instruction	<= f_DisplayOp(i_instruction);
	show_Function	<= f_DisplayFunc(i_instruction);

    flag_endgame <= '1' when show_Function = sim_FUNC_ENDGAME else '0';

end block;
	
process
begin
    wait until flag_endgame'event;
    if(flag_endgame = '1') then
        wait for 20 ns;
        stop;
    end if;
end process;

end Behavioral;


