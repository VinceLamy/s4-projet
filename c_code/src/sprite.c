#include "../lib/sprite.h"



struct Sprite* __init_Sprite__(struct Cell* cell)
{
    struct Sprite* newSprite = (struct Sprite*)malloc(sizeof(struct Sprite));
    if (newSprite == NULL) {
        fprintf(stderr, "Failed to allocate memory for Sprite\n");
        exit(EXIT_FAILURE);
    }

    newSprite->__str_Sprite__ = __str_Sprite__;
    newSprite->set_CellSprite = set_CellSprite;
    newSprite->get_CellSprite = get_CellSprite;

    newSprite->cell = cell;
    newSprite->__str_Sprite__ = __str_Sprite__;

    return newSprite;

};


void __free_Sprite__(struct Sprite* self)
{
    free(self);
}



char* __str_Sprite__(struct Sprite* self)
{
    return "to complete";
}


void set_CellSprite(struct Sprite* self, struct Cell* cell)
{
    self->cell = cell;
}


struct Cell* get_CellSprite(struct Sprite* self)
{
    return self->cell;
}