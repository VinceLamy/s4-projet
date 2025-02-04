#include "../lib/game.h"



struct Game* __init_Game__()
{
    struct Game* newGame = (struct Game*)malloc(sizeof(struct Game));
    
    newGame->map = __init_Map__();
    newGame->spawnRate = SPAWNRATE;
    newGame->score = 0;

    newGame->player = __init_Player__();


    __str_Map__(newGame->map);

    return newGame;

}
void __free_Game__(struct Game* self)
{
    __free_Map__(self->map);
    __free_Player__(self->player);
    free(self);
}

