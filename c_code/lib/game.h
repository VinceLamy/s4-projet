
#ifndef GAME_H
#define GAME_H

#include "includeLib.h"
#include "player.h"

struct Game
{
    
    //attributs

    int spawnRate; //en delais avant un spawn
    int score;

    struct Player* player;

    //methodes




};

struct Game* __init_Game__(int spawnRate);
void __free_Game__();
void startGame();




#endif 