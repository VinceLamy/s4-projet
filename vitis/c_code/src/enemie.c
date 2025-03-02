

#include "../lib/enemie.h"





struct Settings settings;

struct Enemie* __init_Enemie(struct Cell* cell)
{
    struct Enemie* newEnemie = (struct Enemie*)malloc(sizeof(struct Enemie));

    newEnemie->entity = __init_Entity__(cell, HEALTH_ENEMIES , IMAGES_ENEMIES, PRIORITY_ENEMIES, true, SHOOTINGSPEED_ENEMIES, VELOCITY_ENEMIES);
    newEnemie->move_Enemie = move_Enemie;
    newEnemie->set_CellEnemie = set_CellEnemie;
    newEnemie->set_ImageEnemie = set_ImageEnemie;


    return newEnemie;
}


void __free_Enemie__(struct Enemie* self)
{
    __free_Entity__(self->entity);
    free(self);
}




void move_Enemie(struct Enemie* self, enum Direction direction)
{
    //if(direction == RIGHT || direction == LEFT) self->entity->move_Entity(self->entity, direction);
    self->entity->move_Entity(self->entity, direction);
}

struct Cell* get_CellEnemie(struct Enemie* self)
{
    return self->entity->get_CellEntity(self->entity);
}

void set_CellEnemie(struct Enemie* self, struct Cell* cell)
{
    self->entity->set_CellEntity(self->entity, cell);
}

void set_ImageEnemie(struct Enemie* self, char* image)
{

    self->entity->set_ImageEntity(self->entity, image);
}