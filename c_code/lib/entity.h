#ifndef ENTITY_H
#define ENTITY_H

#include "includeLib.h"
#include "sprite.h"




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
    void (*move)(struct Entity*);
    
};

struct Entity* __init_Entity__(int health, int image, int priority, bool isAlive, int shootingSpeed, int velocity);
void __free_Entity__(struct Entity* entity);
void handleGettingHit(struct Entity* self);
void move(struct Coordonate* self, enum Direction direction, int velocity);

#endif // ENTITY_H