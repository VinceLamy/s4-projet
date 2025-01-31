#include "../lib/game.h"



struct Game* __init_Game__(int spawnRate)
{
    struct Game* newGame = (struct Game*)malloc(sizeof(struct Game));

    newGame->spawnRate = spawnRate;
    newGame->score = 0;

    newGame->player = __init_Player__();


}
void __free_Game__(struct Game* self)
{
    free(self);
}


void startGame()
{
    //TODO
}