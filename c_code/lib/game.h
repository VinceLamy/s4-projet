
#ifndef GAME_H
#define GAME_H

#include "includeLib.h"
#include "player.h"
#include "map.h"

struct Game
{
    
    //attributs

    int spawnRate; //en delais avant un spawn
    int score;

    struct Player* player;

    struct Map * map;

    //methodes




};

struct Game* __init_Game__();
void __free_Game__(struct Game* self);





#endif 