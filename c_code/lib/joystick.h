#ifndef JOYSTICK_H
#define JOYSTICK_H

#include "includeLib.h"
#include <ncurses.h>

struct Joystick
{
    int up;
    int right;
    int down;
    int left;

    void (*updateMovement)(struct Joystick* self);
};




void updateMovement(struct Joystick* self);






#endif