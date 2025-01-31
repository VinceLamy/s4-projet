
#ifndef SPRITE_H
#define SPRITE_H

#ifndef INCLUDELIB_H
    #include "includeLib.h"
#endif

#ifndef COORDONATE_H
    #include "coordonate.h"
#endif


struct Sprite
{

    //attributs
    int velocity; //en pixel par itération
    struct Coordonate* coordinate;

    //methodes

    char** (*toString)(struct Sprite* self);

};

struct Sprite* __init_Sprite__(int velocity);
void __free_Sprite__(struct Sprite* self);


char** toString(struct Sprite* self);





#endif