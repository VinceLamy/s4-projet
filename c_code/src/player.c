#include "../lib/player.h"




struct Player* __init_Player__()
{
    struct Player* newPlayer = (struct Player*)malloc(sizeof(struct Player));

    newPlayer->entity = __init_Entity__(HEALTH_PLAYER, IMAGES_PLAYER, PRIORITY_PLAYER, true, SHOOTINGSPEED_PLAYER, VELOCITY_PLAYER);

    return newPlayer;
}

void __free_Player__(struct Player* self)
{
    __free_Entity__(self->entity);
    free(self);
}


void move_Player(struct Player* self, enum Direction direction)
{
    if(direction == RIGHT || direction == LEFT) self->entity->move_Entity(self->entity, direction);
}