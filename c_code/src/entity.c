#include "../lib/entity.h"


enum Direction
{
    UP = 0,
    RIGHT = 1,
    DOWN = 2,
    LEFT = 3
};

struct Entity* __init_Entity__(int health, int image, int priority, bool isAlive, int shootingSpeed, int velocity)
{
    struct Entity* entity = (struct Entity*)malloc(sizeof(struct Entity));
    if (entity != NULL)
    {
        entity->sprite = __init_Sprite__(velocity);
        entity->shootingSpeed = shootingSpeed; 
        entity->health = health;
        entity->image = image;
        entity->priority = priority;
        entity->isAlive = isAlive;
        entity->handleGettingHit = handleGettingHit; // Initialisation du pointeur de fonction
        entity->move = move;

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

void move(struct Coordonate* self, enum Direction direction, int velocity)
{
    switch (direction)
    {
        case UP:
            self->y += velocity;
            break;
        case RIGHT:
            self->x += velocity;
            break;
        case DOWN:
            self->y -= velocity;
            break;
        case LEFT:
            self->x -= velocity;
            break;
        default:
            break;
    }
}








