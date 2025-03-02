#include "../lib/main.h"
#include "../lib/map.h"
#include "../lib/cell.h"
#include "../lib/controller.h"

int main()
{

    
    struct Game* game = __init_Game__();

    game->startGame(game);

    __free_Game__(game); // Free the allocated memory before exiting



    return 0;
}