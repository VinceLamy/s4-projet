#include "../lib/entity.h"




struct Entity* __init_Entity__(struct Cell* cell, int health, char* image, int priority, bool isAlive, int shootingSpeed, int velocity)
{
    struct Entity* entity = (struct Entity*)malloc(sizeof(struct Entity));

    entity->sprite = __init_Sprite__(cell);
    entity->velocity = velocity;
    entity->shootingSpeed = shootingSpeed; 
    entity->health = health;
    entity->priority = priority;
    entity->isAlive = isAlive;
    entity->handleGettingHit = handleGettingHit; // Initialisation du pointeur de fonction
    entity->move_Entity = move_Entity;
    entity->get_CellEntity = get_CellEntity;
    entity->set_ImageEntity = set_ImageEntity;
    entity->set_ImageEntity(entity, image);

    cell->enterCell(cell, image, NONE);

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
    struct Cell* p_cell = self->sprite->get_CellSprite(self->sprite);

    p_cell = p_cell->enterCell(p_cell, self->image, direction);
    self->sprite->set_CellSprite(self->sprite, p_cell);
}

void set_CellEntity(struct Entity* self, struct Cell* cell)
{
    self->sprite->set_CellSprite(self->sprite, cell);
}

struct Cell* get_CellEntity(struct Entity* self)
{
    return self->sprite->get_CellSprite(self->sprite);
}

void set_ImageEntity(struct Entity* self, char* image)
{
    self->image = (char*)malloc((strlen(image) + 1) * sizeof(char));

    strcpy(self->image, image);
}








