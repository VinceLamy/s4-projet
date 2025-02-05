#include "../lib/coordonate.h"


struct Coordonate* __init_Coordonate__()
{
    struct Coordonate* newCoordonate = (struct Coordonate*)malloc(sizeof(struct Coordonate));
    if (newCoordonate == NULL) {
        fprintf(stderr, "Failed to allocate memory for Coordonate\n");
        exit(EXIT_FAILURE);
    }

    newCoordonate->setCoordonates = setCoordonates;
    newCoordonate->reset = reset;
    newCoordonate->setCoordonates(newCoordonate, 0, 0);

    return newCoordonate;

};

void incrementCoordonate(struct Coordonate* self, enum Direction direction)
{
    switch (direction)
    {
        case UP:
            self->y++;
            break;
        case DOWN:
            self->y--;
            break;
        case LEFT:
            self->x--;
            break;
        case RIGHT:
            self->x++;
            break;
    }
}


void __free_Coordonate__(struct Coordonate* self)
{
    free(self);
}

void setCoordonates(struct Coordonate* self, int x, int y)
{
    self->x = x;
    self->y = y;
}





void reset(struct Coordonate* self)
{
    self->x = 0;
    self->y = 0;
}