## lib nécessaire:
- **mettre à jour le système**
    ```sh
    sudo apt-get update
    ```
- **installer le debugger C**
    ```sh
    sudo apt-get install valgrind
    ```
- **installer la librairie pour les inputs de clavier**
    ```sh
    sudo apt-get install libncurses5-dev libncursesw5-dev
    ```

## exemple de code classe/struct

### player.h
```c
struct Player
{
    //attributs
    struct Entity* entity;


    //methodes
    void (*move_Player)(struct Player* self, enum Direction direction);
    void (*handleGettingHit_Player)(struct Player* self);
    void (*set_CellPlayer)(struct Player* self, struct Cell* cell);
    void (*set_ImagePlayer)(struct Player* self, char* image);
    struct Cell* (*get_Cell)(struct Player* self);
};

struct Player* __init_Player__(struct Cell* cell);
void __free_Player__(struct Player* self);
void move_Player(struct Player* self, enum Direction direction);
struct Cell* get_CellPlayer(struct Player* self);
void set_CellPlayer(struct Player* self, struct Cell* cell);
void set_ImagePlayer(struct Player* self, char* image);
```

## pointeur de fonction
créer une variable pointeur de fonction dans le struct

```c
void (*move_Player)(struct Player* self, enum Direction direction);
```
définir normalement la classe en dehors du struct

```c
void move_Player(struct Player* self, enum Direction direction);
struct Cell* get_CellPlayer(struct Player* self);
```

### player.c

```c
struct Player* __init_Player__(struct Cell* cell)
{
    struct Player* newPlayer = (struct Player*)malloc(sizeof(struct Player));

    newPlayer->entity = __init_Entity__(cell, HEALTH_PLAYER, IMAGES_PLAYER, PRIORITY_PLAYER, true, SHOOTINGSPEED_PLAYER, VELOCITY_PLAYER);
    newPlayer->move_Player = move_Player;
    newPlayer->set_CellPlayer = set_CellPlayer;
    newPlayer->set_ImagePlayer = set_ImagePlayer;


    return newPlayer;
}

void __free_Player__(struct Player* self)
{
    __free_Entity__(self->entity);
    free(self);
}


void move_Player(struct Player* self, enum Direction direction)
{
    //if(direction == RIGHT || direction == LEFT) self->entity->move_Entity(self->entity, direction);
    self->entity->move_Entity(self->entity, direction);
}
```
dans le constructeur, associer le pointeur de la fonction à la fonction. Si cette opération n'est pas fait, une erreur de segmentation seras retourné.

```c
newPlayer->move_Player = move_Player;
```

définir la fonction

```c
void move_Player(struct Player* self, enum Direction direction)
{
    //if(direction == RIGHT || direction == LEFT) self->entity->move_Entity(self->entity, direction);
    self->entity->move_Entity(self->entity, direction);
}
```

les pointeurs de fonctions ne son pas nécessaire mais il permette de savoir quel fonction appartient à quel objet. De faire self->... va affichier les fonctions qui l'utilise ce qui permet au nouveau programmeur de comprendre quel fonction est associé à quel objet.

mais;

```c
player->move(player, UP);
```

revient à

```c
move(player, UP);
```

mais ici `player->move(player, UP);` est utilisé pour savoir la fonction appartient à qui

## syntaxe du projet C

**équivalent de classe**
```c
struct Player{...};
```

**constructeur**

retourne un struct 
```c
struct Player* __init_Player__(...);
```

**destructeur**
```c
void __free_Player__(struct Player* self)
```

**retour de l'objet en string ou autre**
```c
char* __str_Player__(struct Player self)
```

**self**
*self* est un équivalent de **this** mais comme les méthodes de classes n'existe pas, nous devons passer self en argument si nous voulons modifier les attributs de l'objet parent

## bonne pratique

essayer de rendre le code le plus atomique possible et de faire du polymorphisme. Si la fonction est déjà créé dans le parent, créer une fonction qui va appeler la fonction parent.
ex:



```c
struct Player
{
    struct Entity* entity;

    //methodes
    void (*move_Player)(struct Player* self, enum Direction direction);
    ...
};
```
qui hérite de 
```c
struct Entity
{
    //parent
    struct Sprite* sprite;

    //attribut
    ...

    //methode
    ...
    void (*move_Entity)(struct Entity*, enum Direction direction);
    ...
};
```

la fonction move de player va appeler la fonction de Entity (ici avec des conditions)

```c
void move_Player(struct Player* self, enum Direction direction)
{
    //if(direction == RIGHT || direction == LEFT) self->entity->move_Entity(self->entity, direction);
    self->entity->move_Entity(self->entity, direction);
}
```

pour le programmeur nouveau, il aurait la possibilité de faire

```c
player->movePlayer(player, direction)
```

au lieu de 

```c
player->entity->movePlayer(player, direction)
```

ce qui **rend le code moins lourd** et **améliore sa transparence**

se rappeler des principes solides et d'essayer de les respecter le plus possible

## Principes SOLID

Les principes SOLID sont un ensemble de cinq principes de conception orientée objet qui visent à rendre le code plus compréhensible, flexible et maintenable.

- **S - Principe de responsabilité unique**
Une classe ne doit avoir qu'une seule responsabilité, c'est-à-dire une seule raison de changer.

- **O - Principe ouvert/fermé**
Les entités logicielles (classes, modules, fonctions, etc.) doivent être ouvertes à l'extension, mais fermées à la modification.

- **L - Principe de substitution de Liskov**
Les objets d'une classe dérivée doivent pouvoir remplacer les objets de la classe de base sans altérer le fonctionnement du programme.

- **I - Principe de ségrégation des interfaces**
Les clients ne doivent pas être forcés de dépendre d'interfaces qu'ils n'utilisent pas. Il est préférable de créer des interfaces spécifiques à des clients plutôt qu'une interface générale.

- **D - Principe d'inversion des dépendances**
Les modules de haut niveau ne doivent pas dépendre des modules de bas niveau. Les deux doivent dépendre d'abstractions. Les abstractions ne doivent pas dépendre des détails. Les détails doivent dépendre des abstractions.




     