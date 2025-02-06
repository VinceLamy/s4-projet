
#ifndef SPRITE_H
#define SPRITE_H


#include "includeLib.h"


#include "cell.h"
#include "coordonate.h"



struct Sprite
{

    //attributs
    struct Cell* cell;

    //methodes du struct
    char* (*__str_Sprite__)(struct Sprite* self);
    void (*set_CellSprite)(struct Sprite* self, struct Cell* cell);
    struct Cell* (*get_CellSprite)(struct Sprite* self);

};

struct Sprite* __init_Sprite__(struct Cell* cell);
void __free_Sprite__(struct Sprite* self);
char* __str_Sprite__(struct Sprite* self);
void set_CellSprite(struct Sprite* self, struct Cell* cell);
struct Cell* get_CellSprite(struct Sprite* self);








#endif