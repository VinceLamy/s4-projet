

#include "../lib/controller.h"



struct Controller* __init_Controller()
{
    struct Controller* newController = (struct Controller*)malloc(sizeof(struct Controller));

    newController->updateMovement = updateMovement;
    return newController;
} 

enum Direction updateMovement(struct Controller* self)
{
    char ch = getchar();

    if (ch == 'w' || ch == 'W') {
        return UP;
    }
    if (ch == 'd' || ch == 'D') {
        return RIGHT;
    }
    if (ch == 's' || ch == 'S') {
        return DOWN;
    }
    if (ch == 'a' || ch == 'A') {
        return LEFT;
    }

    return NONE;
}
