#ifndef CONTROLLER_H
#define CONTROLLER_H

#include "includeLib.h"


struct Controller
{
    int up;
    int right;
    int down;
    int left;
    int quit;

    void (*updateMovement)(struct Controller* self);
    enum Direction (*updateMovementAsync)(struct Controller* self);
};



struct Controller* __init_Controller__();
void __free_Controller__(struct Controller* self);
void updateMovement(struct Controller* self);
enum Direction updateMovementAsync(struct Controller* self);






#endif