

#include "../lib/enemie.h"





struct Settings settings;

struct Enemie* __init_Enemie()
{
    struct Enemie* newEnemie = (struct Enemie*)malloc(sizeof(struct Enemie));

    newEnemie->entity = __init_Entity__(HEALTH_ENEMIES , IMAGES_ENEMIES, PRIORITY_ENEMIES, true, SHOOTINGSPEED_ENEMIES, VELOCITY_ENEMIES);

    return newEnemie;
}


void __free_Enemie__(struct Enemie* self)
{
    __free_Entity__(self->entity);
    free(self);
}