#include "../lib/player.h"




struct Player* __init_Player__(struct Cell* cell)
{
    struct Player* newPlayer = (struct Player*)malloc(sizeof(struct Player));

    newPlayer->entity = __init_Entity__(cell, HEALTH_PLAYER, IMAGES_PLAYER, PRIORITY_PLAYER, true, SHOOTINGSPEED_PLAYER, VELOCITY_PLAYER);
    newPlayer->move_Player = move_Player;
    newPlayer->set_CellPlayer = set_CellPlayer;
    newPlayer->set_ImagePlayer = set_ImagePlayer;


    return newPlayer;
}

void __free_Player__(struct Player* self)
{
    __free_Entity__(self->entity);
    free(self);
}


void move_Player(struct Player* self, enum Direction direction)
{
    //if(direction == RIGHT || direction == LEFT) self->entity->move_Entity(self->entity, direction);
    self->entity->move_Entity(self->entity, direction);
}

struct Cell* get_CellPlayer(struct Player* self)
{
    return self->entity->get_CellEntity(self->entity);
}

void set_CellPlayer(struct Player* self, struct Cell* cell)
{
    self->entity->set_CellEntity(self->entity, cell);
}

void set_ImagePlayer(struct Player* self, char* image)
{

    self->entity->set_ImageEntity(self->entity, image);

}