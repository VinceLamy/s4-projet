

#include "../lib/cell.h"

   

struct Cell* __init_Cell__(char* image, struct Cell* cell_north, struct Cell* cell_east, struct Cell* cell_south, struct Cell* cell_west)
{
    struct Cell* newCell = (struct Cell*)malloc(sizeof(struct Cell));

    newCell->north = cell_north;
    newCell->east = cell_east;
    newCell->south = cell_south;
    newCell->west = cell_west;


    // Allouer de la mémoire pour l'image et copier l'image
    newCell->image = (char*)malloc((strlen(image) + 1) * sizeof(char));

    strcpy(newCell->image, image);


    return newCell;
}

void __free_Cell__(struct Cell* self)
{
    free(self->image); // Libérer la mémoire allouée pour l'image
    free(self);
}

char* __str_Cell__(struct Cell* self)
{
    return self->image;
}

void set_Image(struct Cell* self, char * image)
{

    free(self->set_Image);

    // Allouer de la mémoire pour l'image et copier l'image
    self->image = (char*)malloc((strlen(image) + 1) * sizeof(char));

    strcpy(self->image, image);

}