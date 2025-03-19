#include "game.h"



struct Game* __init_Game__()
{
    struct Game* newGame = (struct Game*)malloc(sizeof(struct Game));
    if (newGame == NULL) {
        fprintf(stderr, "Failed to allocate memory for Game\n");
        exit(EXIT_FAILURE);
    }
    
    newGame->map = __init_Map__(newGame->debug);
    newGame->spawnRate = SPAWNRATE;
    newGame->score = 0;
    newGame->debug = __init_Debug__();

    struct Cell* initialPlayerCell = newGame->map->matrix[INITIAL_PLAYERPOSITION[0]][INITIAL_PLAYERPOSITION[1]];
    newGame->player = __init_Player__(initialPlayerCell);
    newGame->startGame = startGame;


    __str_Map__(newGame->map);

    return newGame;

}
void __free_Game__(struct Game* self)
{
    __free_Map__(self->map);
    __free_Player__(self->player);
    __free_Debug__(self->debug);
    free(self);
}

void startGame(struct Game* self)
{   
    struct timespec req = {0};
    req.tv_sec = 0; // 1 seconde
    req.tv_nsec = 50000000L; // 50 millisecondes (0,5 seconde)

    system("clear");
    struct Controller* controller = __init_Controller__();
    struct Player* player = self->player;
    

    enum Direction direction;

    // Instruction1 = 000 010 000001 0000000 0000000 000000
    int instruction1 = 0x8100000;

    // Instruction2 = 000 010 000010 0000000 0000000 000000
    int instruction2 = 0x8200000;
    
    // Instruction1 = 000 010 000001 0000000 0000000 000000
    int instruction3 = 0x8101000;

    // Instruction2 = 000 010 000010 0000000 0000000 000000
    int instruction4 = 0x8200040;

    __str_Map__(self->map);
    while(!controller->quit)
    {

        controller->updateMovementAsync(controller);
        if(controller->up || controller->right || controller->down || controller->left)
        {
            if(controller->up) player->move_Player(player, UP);
            if(controller->right) player->move_Player(player, RIGHT);
            if(controller->down) player->move_Player(player, DOWN);
            if(controller->left) player->move_Player(player, LEFT);



            __str_Map__(self->map);
        }




    }
        
        
        
}

