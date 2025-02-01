
#ifndef PLAYER_H
#define PLAYER_H

#include "includeLib.h"
#include "entity.h"




struct Player
{
    struct Entity* entity;


    //methodes
    void (*move)(struct Player*);
};


struct Player* __init_Player__(int health, int image, int priority, bool isAlive, int shootingSpeed, int velocity);
void __free_Player__(struct Player* self);
void move(struct Player* self, enum Direction direction);
    







#endif