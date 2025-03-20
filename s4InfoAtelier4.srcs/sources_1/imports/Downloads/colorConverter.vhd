library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity colorConverter is
    Port (
        sel : in STD_LOGIC_VECTOR(3 downto 0); -- Sélecteur 4 bits
        rbg : out STD_LOGIC_VECTOR(23 downto 0) -- Sortie RBG 23 bits
    );
end colorConverter;
 
architecture Behavioral of colorConverter is
begin
    process(sel)
    begin
        case sel is
            when "0000" => rbg <= X"000000"; -- Noir
            when "0001" => rbg <= X"414141"; -- Gris foncé
            when "0010" => rbg <= X"686868"; -- Gris moyen
            when "0011" => rbg <= X"A1A1A1"; -- Gris pâle
            when "0100" => rbg <= X"FFFFFF"; -- Blanc
            when "0101" => rbg <= X"E90202"; -- Rouge
            when "0110" => rbg <= X"FF007A"; -- Orange
            when "0111" => rbg <= X"FF00CE"; -- Jaune
            when "1000" => rbg <= X"8F0303"; -- Rouge foncé
            when "1001" => rbg <= X"140058"; -- Vert foncé
            when "1010" => rbg <= X"0B109D"; -- Vert moyen
            when "1011" => rbg <= X"1018ED"; -- Vert pâle
            when "1100" => rbg <= X"00E847"; -- Bleu foncé
            when "1101" => rbg <= X"00E8A2"; -- Bleu moyen
            when "1110" => rbg <= X"48FFE6"; -- Bleu pâle
            when "1111" => rbg <= X"000000"; -- Noir (ou autre couleur Mathieu Nicol va en decider)
            when others => rbg <= X"000000"; -- Valeur par défaut
        end case;
    end process;
end Behavioral;