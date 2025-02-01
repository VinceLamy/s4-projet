
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
    struct Coordonate* coordinate;

    //methodes du struct
    char** (*__str_Sprite__)(struct Sprite* self);


};

struct Sprite* __init_Sprite__();
void __free_Sprite__(struct Sprite* self);
char** __str_Sprite__(struct Sprite* self);







#endif