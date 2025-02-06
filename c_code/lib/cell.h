#ifndef CELL_H
#define CELL_H


#include "includeLib.h" 


struct Cell
{

    //attributs
    struct Cell * north;
    struct Cell * east;
    struct Cell * south;
    struct Cell * west;

    char * image;
    char * defaultImage;

    //methodes
    void (*set_ImageCell)(struct Cell* self, char* image);
    void (*set_defaultImageCell)(struct Cell* self, char* image);
    struct Cell* (*get_cellInDirectionX)(struct Cell* self, enum Direction direction);
    struct Cell* (*enterCell)(struct Cell* self, char* imageOfEntity, enum Direction direction);
    void (*reset_Image)(struct Cell* self);


};

struct Cell* __init_Cell__(char* image, struct Cell* cell_north, struct Cell* cell_east, struct Cell* cell_south, struct Cell* cell_west);
void __free_Cell__(struct Cell* self);
char* __str_Cell__(struct Cell* self);
void set_ImageCell(struct Cell* self, char* image);
void set_defaultImageCell(struct Cell* self, char* image);
void reset_Image(struct Cell* self);
struct Cell* get_cellInDirectionX(struct Cell* self, enum Direction direction);
struct Cell* enterCell(struct Cell* self, char* imageOfEntity, enum Direction direction);

#endif



