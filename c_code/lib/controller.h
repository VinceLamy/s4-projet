#ifndef CONTROLLER_H
#define CONTROLLER_H

#include "includeLib.h"


struct Controller
{
    int up;
    int right;
    int down;
    int left;

    enum Direction (*updateMovement)(struct Controller* self);
};



struct Controller* __init_Controller();
enum Direction updateMovement(struct Controller* self);






#endif