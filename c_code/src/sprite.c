
#include "../lib/sprite.h"



struct Sprite* __init_Sprite__(int velocity)
{
    struct Sprite* newSprite = (struct Sprite*)malloc(sizeof(struct Sprite));
    newSprite->velocity = velocity;
    newSprite->coordinate = __init_Coordonate__();
    newSprite->toString = toString;
    newSprite->move = move;

};


void __free_Sprite__(struct Sprite* self)
{
    free(self);
}


void move(struct Sprite* self)
{
    self->coordinate->move(self->coordinate, self->velocity);
}

char** toString()
{
    return "to complete";
}