
#ifndef PLAYER_H
#define PLAYER_H

#include "includeLib.h"
#include "entity.h"
#include "cell.h"




struct Player
{
    struct Entity* entity;


    //methodes
    void (*move_Player)(struct Player* self, enum Direction direction);
    void (*handleGettingHit_Player)(struct Player* self);
    void (*set_CellPlayer)(struct Player* self, struct Cell* cell);
    void (*set_ImagePlayer)(struct Player* self, char* image);
    struct Cell* (*get_Cell)(struct Player* self);
};


struct Player* __init_Player__(struct Cell* cell);
void __free_Player__(struct Player* self);
void move_Player(struct Player* self, enum Direction direction);
struct Cell* get_CellPlayer(struct Player* self);
void set_CellPlayer(struct Player* self, struct Cell* cell);
void set_ImagePlayer(struct Player* self, char* image);
void handleGettingHit_Player(struct Player* self); //TODO
    







#endif