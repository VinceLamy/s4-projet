

#include "controller.h"



struct Controller* __init_Controller__()
{


    struct Controller* newController = (struct Controller*)malloc(sizeof(struct Controller));


    newController->updateMovementAsync = updateMovementAsync;
    return newController;
} 

void __free_Controller__(struct Controller* self)
{
    free(self);
}


enum Direction updateMovementAsync(struct Controller* self)
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
