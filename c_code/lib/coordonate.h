
#ifndef COORDONATE_H
#define COORDONATE_H

#ifndef INCLUDELIB_H
    #include "includeLib.h"
#endif



struct Coordonate
{
    

    
    //attrinuts
    int x;
    int y;

    //methodes
    void (*setCoordonates)(struct Coordonate* self);
    void (*reset)(struct Coordonate* self);
    void (*incrementCoordonate)(struct Coordonatge* self, enum Direction direction)
};

struct Coordonate* __init_Coordonate__();
void __free_Coordonate__();
void setCoordonates(struct Coordonate* self, int x, int y);

void incrementCoordonate(struct Coordonate* self, enum Direction direction);

void reset(struct Coordonate* self);






















#endif