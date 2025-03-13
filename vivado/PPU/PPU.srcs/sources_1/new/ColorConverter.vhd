library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity ColorConverter is
    Port (
        sel : in STD_LOGIC_VECTOR(3 downto 0); -- Sélecteur 4 bits
        rgb : out STD_LOGIC_VECTOR(23 downto 0) -- Sortie RGB 3 bits
    );
end ColorConverter;
 
architecture Behavioral of ColorConverter is
begin
    process(sel)
    begin
        case sel is
            when "0000" => rgb <= X"000000"; -- Noir
            when "0001" => rgb <= X"00FF00"; -- Bleu
            when "0010" => rgb <= X"0000FF"; -- Vert
            when "0011" => rgb <= X"00FFFF"; -- Cyan
            when "0100" => rgb <= X"FF0000"; -- Rouge
            when "0101" => rgb <= X"FFFF00"; -- Magenta
            when "0110" => rgb <= X"FF00FF"; -- Jaune
            when "0111" => rgb <= X"FFFFFF"; -- Blanc
            when "1000" => rgb <= X"008000"; -- Bleu foncé
            when "1001" => rgb <= X"000080"; -- Vert foncé
            when "1010" => rgb <= X"008080"; -- Cyan foncé
            when "1011" => rgb <= X"800000"; -- Rouge foncé
            when "1100" => rgb <= X"808000"; -- Magenta foncé
            when "1101" => rgb <= X"800080"; -- Jaune foncé
            when "1110" => rgb <= X"C0C0C0"; -- Gris clair
            when "1111" => rgb <= X"000000"; -- Noir (ou autre couleur Mathieu Nicol va en decider)
            when others => rgb <= X"000000"; -- Valeur par défaut
        end case;
    end process;
end Behavioral;