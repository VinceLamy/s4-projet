
#ifndef PLAYER_H
#define PLAYER_H

#include "includeLib.h"
#include "entity.h"




struct Player
{
    struct Entity* entity;


    //methodes
    void (*move)(struct Player*, enum Direction direction);
    void (*handleGettingHit_Player)
};


struct Player* __init_Player__();
void __free_Player__(struct Player* self);
void move_Player(struct Player* self, enum Direction direction);
    







#endif