#ifndef BULLET_H
#define BULLET_H

#include "includeLib.h"
#include "entity.h"

struct Bullet{

    struct Entity* entity;
};



struct Bullet* __init_Bullet();
void __free_Bullet__(struct Bullet* self);








#endif
