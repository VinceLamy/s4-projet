library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity actorManager is
    Port (
        i_clk        : in  std_logic;
        i_globalX   : in  std_logic_vector(9 downto 0);
        i_globalY   : in  std_logic_vector(9 downto 0);
        o_tuileID   : out std_logic_vector(5 downto 0);
        o_tuileX    : out std_logic_vector(2 downto 0);
        o_tuileY    : out std_logic_vector(2 downto 0)
    );
end actorManager;


architecture Behavioral of actorManager is

    
    CONSTANT MAX_ACTORS : INTEGER := 4; -- Nombre maximum d'acteurs
    
    --------------------------
    -- Actor est un record -- 
    --------------------------
    TYPE Actor IS RECORD
    pos_x  : STD_LOGIC_VECTOR(9 DOWNTO 0);
    pos_y  : STD_LOGIC_VECTOR(9 DOWNTO 0);
    tile_id: STD_LOGIC_VECTOR(5 DOWNTO 0);
    END RECORD;
    
    ---------------------------------------
    -- ActorArray contient les acteurs  -- 
    ---------------------------------------
    
    TYPE ActorArray IS ARRAY (0 TO MAX_ACTORS-1) OF Actor;
    SIGNAL actors : ActorArray;
    
    -- signal hitActorTuileId : std_logic_vector(5 downto 0);

begin
    -- Initialisation des acteurs 0 et 1
    actors(0).pos_x <= "0000001110";
    actors(0).pos_y <= "0000001111";
    actors(0).tile_id <= "001010";
    actors(1).pos_x <= "0010011000";
    actors(1).pos_y <= "0010011001";
    actors(1).tile_id <= "010010";
    

    process(i_clk)
       variable i : INTEGER RANGE 0 TO MAX_ACTORS-1;
       variable found : BOOLEAN;
       variable deltaX: unsigned(9 downto 0);
       variable deltaY: unsigned(9 downto 0);
    begin
        if rising_edge(i_clk) then
          found := FALSE; -- Réinitialisation
    
          for i in 0 TO MAX_ACTORS-1 loop
            if (unsigned(i_globalX) >= unsigned(actors(i).pos_x)) and 
                (unsigned(i_globalX) < unsigned(actors(i).pos_x) + 16) and
                (unsigned(i_globalY) >= unsigned(actors(i).pos_y)) and
                (unsigned(i_globalY) < unsigned(actors(i).pos_y) + 16) then
                deltaX := unsigned(i_globalX) - unsigned(actors(i).pos_x);
                deltaY := unsigned(i_globalY) - unsigned(actors(i).pos_y);
                if (deltaX <= 7 and deltaY <= 7) then
                    o_tuileID <= actors(i).tile_id;
                elsif (deltaX > 7 and deltaY <= 7) then
                    o_tuileID <= std_logic_vector(unsigned(actors(i).tile_id) + 1);
                elsif (deltaX <= 7 and deltaY > 7) then
                    o_tuileID <= std_logic_vector(unsigned(actors(i).tile_id) + 2);
                elsif (deltaX > 7 and deltaY > 7) then
                    o_tuileID <= std_logic_vector(unsigned(actors(i).tile_id) + 3);
                end if;
                
                o_tuileX <= std_logic_vector(deltaX(2 downto 0));
                o_tuileY <= std_logic_vector(deltaY(2 downto 0));
                found := TRUE;
            end if;
          end loop;
    
          -- Si aucun acteur ne correspond, mettre actor_present à '0'
          if not found then
             o_tuileID <= "000000";
             o_tuileX <= "000";
             o_tuileY <= "000";
          end if;
        end if;  
    end process;
end Behavioral;
