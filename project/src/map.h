#ifndef MAP_H
#define MAP_H

#include "includeLib.h"
#include "cell.h"

struct Map
{
    int rows;
    int cols;
    struct Cell*** matrix;

    void (*moveViewport)(enum Direction);
};

// Déclaration des fonctions
struct Map* __init_Map__(struct Debug* debug);
void __free_Map__(struct Map* map);
void __str_Map__(struct Map* map);
void moveViewport(enum Direction);

#endif 
