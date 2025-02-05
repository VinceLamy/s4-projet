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

    //methodes
    void (*set_Image)(struct Cell* self, char* image);



};

struct Cell* __init_Cell__(char* image, struct Cell* cell_north, struct Cell* cell_east, struct Cell* cell_south, struct Cell* cell_west);
void __free_Cell__(struct Cell* self);
char* __str_Cell__(struct Cell* self);
void set_Image(struct Cell* self, char* image);

#endif



