
#include "../lib/sprite.h"



struct Sprite* __init_Sprite__()
{
    struct Sprite* newSprite = (struct Sprite*)malloc(sizeof(struct Sprite));
    newSprite->coordinate = __init_Coordonate__();
    newSprite->__str_Sprite__ = __str_Sprite__;

    return newSprite;

};


void __free_Sprite__(struct Sprite* self)
{
    __free_Coordonate__(self->coordinate);
    free(self);
}



char* __str_Sprite__(struct Sprite* self)
{
    return "to complete";
}