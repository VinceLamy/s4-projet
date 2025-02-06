# lib nécessaire:
**mettre à jour le systême**
    sudo apt-get update
**installer le debugger C**
    sudo apt-get install valgrind
**installer la librairie pour les inputs de clavier** 
    sudo apt-get install libncurses5-dev libncursesw5-dev


# exemple de code .h
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

# pointeur de fonction
    void (*handleGettingHit_Player)(struct Player* self);


     