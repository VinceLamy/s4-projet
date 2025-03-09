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
    newGame->startGame = startGame;


    __str_Map__(newGame->map);

    return newGame;

}
void __free_Game__(struct Game* self)
{
    __free_Map__(self->map);
    __free_Player__(self->player);
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

    if(DEBUG_MODE == 0)
    {
        system("clear");
        clear(); 
    }
    
    __str_Map__(self->map);
    while(!controller->quit)
    {

        controller->updateMovement(controller);
        if(controller->up || controller->right || controller->down || controller->left)
        {
            if(controller->up) player->move_Player(player, UP);
            if(controller->right) player->move_Player(player, RIGHT);
            if(controller->down) player->move_Player(player, DOWN);
            if(controller->left) player->move_Player(player, LEFT);


                if(DEBUG_MODE == 0)
                {
                    system("clear");
                    clear(); 
                }
            __str_Map__(self->map);
        }


        nanosleep(&req, (struct timespec *)NULL);



    }
        
        
        
}

