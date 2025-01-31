#ifndef ENTITY_H
#define ENTITY_H

#include "includeLib.h"


struct Entity
{
    //parent
    struct Sprite* sprite;

    //attribut
    int shootingSpeed;
    int health;
    int image;
    int priority;
    bool isAlive ;

    //methode
    bool (*handleGettingHit)(struct Entity*);
    bool (*isAlive)(struct Entity*);
};

struct Entity* __init_Entity__(struct Sprite* sprite, int health, int image, int priority, bool isAlive);
void __free_Entity__(struct Entity* entity);
void handleGettingHit(struct Entity* self);

#endif // ENTITY_H