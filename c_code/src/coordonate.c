#include "../lib/coordonate.h"


struct Coordonate* __init_Coordonate__()
{
    struct Coordonate* newCoordonate = (struct Coordonate*)malloc(sizeof(struct Coordonate));
    
    if (newCoordonate != NULL)
    {
        newCoordonate->move = move;
        newCoordonate->setCoordonates = setCoordonates;
        newCoordonate->reset = reset;
        newCoordonate->setCoordonates(newCoordonate, 0, 0);
    }
    return newCoordonate;

};


void __free_Coordonate__(struct Coordonate* self)
{
    free(self);
}

void setCoordonates(struct Coordonate* self, int x, int y)
{
    self->x = x;
    self->y = y;
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



void reset(struct Coordonate* self)
{
    self->x = 0;
    self->y = 0;
}