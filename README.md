# Règles importantes
1. **NE JAMAIS FAIRE " git add * "**
2. Avant de faire quoi que ce soit, suivre les sections **Créer un répertoire local** et **Premier pas** dans l'ordre!
3. Ne faites **AUCUN** changement dans la configuration du git (par exemple: le .gitignore) sans en avoir parlé à l'équipe entière et avoir son approbation (Voir avec Vincent si vous n'êtes pas sûr à 100% de ce que vous faites avec le Git)!
6. Si vous avez des questions par rapport au git, contactez Vincent Lamy!

# Créer un répertoire local
1. Ouvrez le terminal de commande dans un dossier pour le projet (Pas besoin de créer un dossier root pour le projet, Git s'en occupe)
2. Copiez-collez la commande suivante : git clone https://github.com/VinceLamy/s4-projet.git

# Premiers pas
1. Créez un projet Vivado que vous nommez "s4-projet-vivado" dans le dossier "s4-projet"
2. Assurez vous d'importer les fichiers du Git dans les bonnes sections de Vivado
3. Si vous voulez utiliser Github Desktop, voir la section **Utilisation de Github Desktop**
4. Créez vous une branche (voir la section **Création de branches**)

# Utilisation de Github Desktop
1. Dans Github Desktop, lorsque vous ajouter un nouveau répertoire, sélectionner "Ajouter un répertoire existant"
> IMPORTANT : Ne clonez pas le projet à partir de Github car il peut y avoir des problème avec Vivacon
2. Allez chercher le répertoire précédemment créé "s4-projet"

# Création de branches
Lorsque vous vous créer une branche, donnez lui un nom significatif en suivant le modèle suivant :
Modèle : Prénom-NomDeLaFonctionnalité (Tout est en minuscule et en anglais)
Exemple : vincent-character

# Commandes utiles

- git add {NomFichier}

> Permet d'ajouter un fichier au répertoire Git.\
> IMPORTANT : ne **JAMAIS** faire "git add *" ou vous allez briser le répertoire...
