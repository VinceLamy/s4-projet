
#ifndef SPRITE_H
#define SPRITE_H


#include "includeLib.h"



#include "coordonate.h"



struct Sprite
{

    //attributs
    struct Coordonate* coordinate;

    //methodes du struct
    char* (*__str_Sprite__)(struct Sprite* self);


};

struct Sprite* __init_Sprite__();
void __free_Sprite__(struct Sprite* self);
char* __str_Sprite__(struct Sprite* self);







#endif