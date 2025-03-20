library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ActorManager is
    Port (
        clk        : in  std_logic;
        global_x   : in  std_logic_vector(9 downto 0);
        global_y   : in  std_logic_vector(9 downto 0);
        instruction: in  std_logic_vector(31 downto 0);
        instruction_en: in std_logic;
        init: in std_logic;
        tuile_id   : out std_logic_vector(5 downto 0);
        tuile_x    : out std_logic_vector(2 downto 0);
        tuile_y    : out std_logic_vector(2 downto 0)
    );
end ActorManager;

architecture Behavioral of ActorManager is
   TYPE Actor IS RECORD
   pos_x  : STD_LOGIC_VECTOR(9 DOWNTO 0);
   pos_y  : STD_LOGIC_VECTOR(9 DOWNTO 0);
   tile_id: STD_LOGIC_VECTOR(5 DOWNTO 0);
END RECORD;

CONSTANT MAX_ACTORS : INTEGER := 64; -- Nombre maximum d'acteurs
TYPE ActorArray IS ARRAY (0 TO MAX_ACTORS-1) OF Actor;
SIGNAL actors : ActorArray;
signal hitActorTuileId : std_logic_vector(5 downto 0);


begin

PROCESS(clk)
   VARIABLE i : INTEGER RANGE 0 TO MAX_ACTORS-1;
   VARIABLE found : BOOLEAN;
   variable deltaX: unsigned(9 downto 0);
   variable deltaY: unsigned(9 downto 0);
   variable spriteIndex: integer range 0 to MAX_ACTORS-1;
BEGIN
    if rising_edge(clk) then
    if(init = '1') then
        actors(0).pos_x <= "0000001110";
        actors(0).pos_y <= "0000001111";
        actors(0).tile_id <= "001010";
        actors(1).pos_x <= "0010011000";
        actors(1).pos_y <= "0010011001";
        actors(1).tile_id <= "010010";
    end if;
      found := FALSE; -- Réinitialisation
      if (instruction_en = '1') then
            spriteIndex := TO_INTEGER(unsigned(instruction(25 downto 20)));
            -- move sprite
            if( instruction(31 downto 26) = "001000") then
                actors(spriteIndex).pos_x <= instruction(19 downto 10);
                actors(spriteIndex).pos_y <= instruction(9 downto 0);
            -- delete sprite
            elsif ( instruction(31 downto 26) = "001001") then
                actors(spriteIndex).tile_id <= "000000";
                actors(spriteIndex).pos_x <= "0000000000";
                actors(spriteIndex).pos_y <= "0000000000";
            -- spawn sprite à 0, 0
            elsif ( instruction(31 downto 26) = "001010") then
                actors(spriteIndex).pos_x <= "0000000000";
                actors(spriteIndex).pos_y <= "0000000000";
                if (instruction(19 downto 17) = "000") then
                    actors(spriteIndex).tile_id <= "001010";
                elsif (instruction(19 downto 17) = "001") then
                    actors(spriteIndex).tile_id <= "001110";
                elsif (instruction(19 downto 17) = "010") then
                    actors(spriteIndex).tile_id <= "010010";
                elsif (instruction(19 downto 17) = "011") then
                    actors(spriteIndex).tile_id <= "010110";
                elsif (instruction(19 downto 17) = "100") then
                    actors(spriteIndex).tile_id <= "011010"; --bullet à faire
                end if;
             --explode sprite
             elsif ( instruction(31 downto 26) = "001011") then
                actors(spriteIndex).tile_id <= "011110"; --explosion à faire
             elsif ( instruction(31 downto 26) = "001100") then
                actors(0).pos_x <= "0000001110";
                actors(0).pos_y <= "0000001111";
                actors(0).tile_id <= "001010";
                actors(1).pos_x <= "0010011000";
                actors(1).pos_y <= "0010011001";
                actors(1).tile_id <= "010010";
                --reset à faire
            end if;
      end if;

      FOR i IN 0 TO MAX_ACTORS-1 LOOP
        IF (unsigned(global_x) >= unsigned(actors(i).pos_x)) AND 
            (unsigned(global_x) < unsigned(actors(i).pos_x) + 16) AND
            (unsigned(global_y) >= unsigned(actors(i).pos_y)) AND
            (unsigned(global_y) < unsigned(actors(i).pos_y) + 16) THEN
            deltaX := unsigned(global_x) - unsigned(actors(i).pos_x);
            deltaY := unsigned(global_y) - unsigned(actors(i).pos_y);
            if (deltaX <= 7 and deltaY <= 7) then
                tuile_id <= actors(i).tile_id;
            elsif (deltaX > 7 and deltaY <= 7) then
                tuile_id <= std_logic_vector(unsigned(actors(i).tile_id) + 1);
            elsif (deltaX <= 7 and deltaY > 7) then
                tuile_id <= std_logic_vector(unsigned(actors(i).tile_id) + 2);
            elsif (deltaX > 7 and deltaY > 7) then
                tuile_id <= std_logic_vector(unsigned(actors(i).tile_id) + 3);
            end if;
            
            tuile_x <= std_logic_vector(deltaX(2 downto 0));
            tuile_y <= std_logic_vector(deltaY(2 downto 0));
            found := TRUE;
        END IF;
      END LOOP;

      -- Si aucun acteur ne correspond, mettre actor_present à '0'
      IF NOT found THEN
         tuile_id <= "000000";
         tuile_x <= "000";
         tuile_y <= "000";
      END IF;
    end if;  
END PROCESS;
    
end Behavioral;
