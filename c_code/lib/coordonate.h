
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
    void (*move)(struct Coordonate* self);
    void (*setCoordonates)(struct Coordonate* self);
    void (*reset)(struct Coordonate* self);
};

struct Coordonate* __init_Coordonate__();
void __free_Coordonate__();

void setCoordonates(struct Coordonate* self, int x, int y);

void reset(struct Coordonate* self);






















#endif