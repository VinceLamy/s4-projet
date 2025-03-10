#include "bullet.h"

struct Settings settings;

struct Bullet* __init_Bullet(struct Cell* cell)
{
    struct Bullet* newBullet = (struct Bullet*)malloc(sizeof(struct Bullet));
    if (newBullet == NULL) {
        fprintf(stderr, "Failed to allocate memory for Bullet\n");
        exit(EXIT_FAILURE);
    }

    newBullet->entity = __init_Entity__(cell, HEALTH_BULLETS , IMAGES_BULLETS, PRIORITY_BULLETS, true, SHOOTINGSPEED_BULLETS, VELOCITY_BULLETS);

    return newBullet;
}


void __free_Bullet__(struct Bullet* self)
{
    __free_Entity__(self->entity);
    free(self);
}