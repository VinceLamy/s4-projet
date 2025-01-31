
#ifndef COORDONATE_H
#define COORDONATE_H

#ifndef INCLUDELIB_H
    #include "includeLib.h"
#endif

enum Direction
{
    UP = 0,
    RIGHT = 1,
    DOWN = 2,
    LEFT = 3
};

struct Coordonate
{
    

    
    //attrinuts
    int x;
    int y;

    //methodes
    void (*move)(struct Coordonate* self);
    void (*setCoordonates)(struct Coordonate* self);
    void (*reset)(struct Coordonate* self);
};

struct Coordonate* __init_Coordonate__();
void __free_Coordonate__();

void setCoordonates(struct Coordonate* self, int x, int y);
void move(struct Coordonate* self, enum Direction direction, int velocity);
void reset(struct Coordonate* self);






















#endif