#include "../lib/entity.h"


struct Entity* __init_Entity__(struct Sprite* sprite, int health, int image, int priority, bool isAlive, int shootingSpeed)
{
    struct Entity* entity = (struct Entity*)malloc(sizeof(struct Entity));
    if (entity != NULL)
    {
        entity->sprite = sprite;
        entity->shootingSpeed; 
        entity->health = health;
        entity->image = image;
        entity->priority = priority;
        entity->isAlive = isAlive;
        entity->handleGettingHit = handleGettingHit; // Initialisation du pointeur de fonction

    }
    return entity;
}

void __free_Entity__(struct Entity* entity)
{
    free(entity);
}

void handleGettingHit(struct Entity* self)
{
    if(self->health > 1) self->health--;
    else self->health = 0;
}






