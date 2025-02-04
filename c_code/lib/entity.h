#ifndef ENTITY_H
#define ENTITY_H

#include "includeLib.h"
#include "sprite.h"




struct Entity
{
    //parent
    struct Sprite* sprite;

    //attribut
    int velocity;
    int shootingSpeed;
    int health;
    char* image;
    int priority;
    bool isAlive ;

    //methode
    void (*handleGettingHit)(struct Entity*);
    void (*move_Entity)(struct Entity*, enum Direction direction);
    char (*__str_Entity__)(struct Entity*);
};

struct Entity* __init_Entity__(int health, char* image, int priority, bool isAlive, int shootingSpeed, int velocity);
void __free_Entity__(struct Entity* entity);
char* __str_Entity__(struct Entity* entity);

void handleGettingHit(struct Entity* self);
void move_Entity(struct Entity* self, enum Direction direction);


#endif // ENTITY_H