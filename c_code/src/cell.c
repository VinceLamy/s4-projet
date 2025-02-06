#include "../lib/cell.h"

   

struct Cell* __init_Cell__(char* image, struct Cell* cell_north, struct Cell* cell_east, struct Cell* cell_south, struct Cell* cell_west)
{
    struct Cell* newCell = (struct Cell*)malloc(sizeof(struct Cell));
    if (newCell == NULL) {
        fprintf(stderr, "Failed to allocate memory for Cell\n");
        exit(EXIT_FAILURE);
    }

    newCell->north = cell_north;
    newCell->east = cell_east;
    newCell->south = cell_south;
    newCell->west = cell_west;


    newCell->set_ImageCell = set_ImageCell;
    newCell->get_cellInDirectionX = get_cellInDirectionX;
    newCell->reset_Image = reset_Image;
    newCell->enterCell = enterCell;
    
    newCell->set_ImageCell(newCell, image);


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

void reset_Image(struct Cell* self)
{
    set_ImageCell(self, self->defaultImage);
}

void set_ImageCell(struct Cell* self, char* image)
{

    if (self->image != NULL) {
        free(self->image); // Libérer l'ancienne image si nécessaire
    }

    self->image = (char*)malloc((strlen(image) + 1) * sizeof(char));

    strcpy(self->image, image);

    if (self->defaultImage == NULL)
    {
        self->defaultImage = (char*)malloc((strlen(image) + 1) * sizeof(char));
        strcpy(self->defaultImage, image);
    }
}


struct Cell* get_cellInDirectionX(struct Cell* self, enum Direction direction)
{
    switch (direction)
    {
    case UP:
        if (self->north != NULL)
        {
            return self->north;
        }
        return self;
    case RIGHT:
        if (self->east != NULL)
        {
            return self->east;
        }
        return self;
    case DOWN:
        if (self->south != NULL)
        {
            return self->south;
        }
        return self;
    case LEFT:
        if (self->west != NULL)
        {
            return self->west;
        }
        return self;
    default:
        return self;
        break;
        
    }
}





struct Cell* enterCell(struct Cell* self, char* imageOfEntity, enum Direction direction)
{
    self->reset_Image(self);
    if(direction != NONE)
    {
        struct Cell* p_newCell = self->get_cellInDirectionX(self, direction);
        p_newCell->set_ImageCell(p_newCell, imageOfEntity);
        return p_newCell;
    }
    else
    {
        self->set_ImageCell(self, imageOfEntity);
        return self;
    }


    
}
