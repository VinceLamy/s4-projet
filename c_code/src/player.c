#include "../lib/player.h"




struct Player* __init_Player__(int health, int image, int priority, bool isAlive, int shootingSpeed, int velocity)
{
    struct Player* newPlayer = (struct Player*)malloc(sizeof(struct Player));

    newPlayer->entity = __init_Entity__(health, image, priority, isAlive, shootingSpeed, velocity);
}

void __free_Player__(struct Player* self)
{
    __free_Entity__(self->entity);
    free(self);
}


void move(struct Player* self, enum Direction direction)
{
    if(direction == RIGHT || direction == LEFT) self->entity->move(direction);
}