
#ifndef COORDONATE_H
#define COORDONATE_H


#include "includeLib.h"




struct Coordonate
{
    

    
    //attrinuts
    int x;
    int y;

    //methodes
    void (*setCoordonates)(struct Coordonate* self, int x, int y);
    void (*reset)(struct Coordonate* self);
    void (*incrementCoordonate)(struct Coordonate* self, enum Direction direction);
};

struct Coordonate* __init_Coordonate__();
void __free_Coordonate__(struct Coordonate* self);

void setCoordonates(struct Coordonate* self, int x, int y);
void incrementCoordonate(struct Coordonate* self, enum Direction direction);
void reset(struct Coordonate* self);






















#endif