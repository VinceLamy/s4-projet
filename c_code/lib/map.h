#ifndef MAP_H
#define MAP_H

#include "includeLib.h"
#include "cell.h"

struct Map
{
    int rows;
    int cols;
    struct Cell*** matrix;
};

// Déclaration des fonctions
struct Map* __init_Map__();
void __free_Map__(struct Map* map);
void __str_Map__(struct Map* map);
void send_Map(struct Map* map, void (*sendFunction)(void* data, size_t size));

#endif 
