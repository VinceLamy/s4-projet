#include "../lib/entity.h"




struct Entity* __init_Entity__(int health, char* image, int priority, bool isAlive, int shootingSpeed, int velocity)
{
    struct Entity* entity = (struct Entity*)malloc(sizeof(struct Entity));
    if (entity == NULL) {
        fprintf(stderr, "Failed to allocate memory for Entity\n");
        exit(EXIT_FAILURE);
    }

    entity->sprite = __init_Sprite__();
    entity->velocity = velocity;
    entity->shootingSpeed = shootingSpeed; 
    entity->health = health;
    entity->image = image;
    entity->priority = priority;
    entity->isAlive = isAlive;
    entity->handleGettingHit = handleGettingHit; // Initialisation du pointeur de fonction
    entity->move_Entity = move_Entity;

    return entity;
}

void __free_Entity__(struct Entity* self)
{
    __free_Sprite__(self->sprite);
    free(self);
}

char* __str_Entity__(struct Entity* self)
{
    return "to complete";
}

void handleGettingHit(struct Entity* self)
{
    if(self->health > 1) self->health--;
    else self->health = 0;
}

void move_Entity(struct Entity* self, enum Direction direction)
{
    self->sprite->coordinate->incrementCoordonate(self->sprite->coordinate, direction);
}








