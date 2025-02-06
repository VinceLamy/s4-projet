#include "../lib/main.h"
#include "../lib/map.h"
#include "../lib/cell.h"
#include "../lib/controller.h"

int main()
{
    struct timespec req = {0};
    req.tv_sec = 1; // 1 seconde
    req.tv_nsec = 500000000L; // 500 millisecondes (0,5 seconde)

    system("clear");
    struct Game* game = __init_Game__();
    struct Controller* controller = __init_Controller();
    struct Player* player = game->player;
    

    enum Direction direction;
    while(1)
    {
        direction = controller->updateMovement(controller);
        printf("%d", direction);
        fflush(stdout); // Forcer le vidage de la mémoire tampon
        player->move_Player(player, direction);
        system("clear");
        __str_Map__(game->map);
    }

    __free_Game__(game); // Free the allocated memory before exiting



    return 0;
}