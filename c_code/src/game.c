#include "../lib/game.h"



struct Game* __init_Game__()
{
    struct Game* newGame = (struct Game*)malloc(sizeof(struct Game));
    if (newGame == NULL) {
        fprintf(stderr, "Failed to allocate memory for Game\n");
        exit(EXIT_FAILURE);
    }
    
    newGame->map = __init_Map__();
    newGame->spawnRate = SPAWNRATE;
    newGame->score = 0;

    struct Cell* initialPlayerCell = newGame->map->matrix[INITIAL_PLAYERPOSITION[0]][INITIAL_PLAYERPOSITION[1]];
    newGame->player = __init_Player__(initialPlayerCell);


    __str_Map__(newGame->map);

    return newGame;

}
void __free_Game__(struct Game* self)
{
    __free_Map__(self->map);
    __free_Player__(self->player);
    free(self);
}

