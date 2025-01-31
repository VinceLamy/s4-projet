
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


    







#endif