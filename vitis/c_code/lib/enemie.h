#ifndef ENEMIE_H
#define ENEMIE_H


#include "includeLib.h"
#include "entity.h"
#include "cell.h"

struct Enemie
{

    //attributs
    struct Entity* entity;
    void (*move_Enemie)(struct Enemie* self, enum Direction direction);
    void (*handleGettingHit_Enemie)(struct Enemie* self);
    void (*set_CellEnemie)(struct Enemie* self, struct Cell* cell);
    void (*set_ImageEnemie)(struct Enemie* self, char* image);
    struct Cell* (*get_Cell)(struct Enemie* self);

};


struct Enemie* __init_Enemie(struct Cell* cell);
void __free_Enemie__(struct Enemie* enemie);

void move_Enemie(struct Enemie* self, enum Direction direction);
struct Cell* get_CellEnemie(struct Enemie* self);
void set_CellEnemie(struct Enemie* self, struct Cell* cell);
void set_ImageEnemie(struct Enemie* self, char* image);
void handleGettingHit_Enemie(struct Enemie* self); //TODO








#endif