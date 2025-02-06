#ifndef SETTINGS_H
#define SETTINGS_H

// Déclaration des variables globales
extern int VELOCITY_BULLETS;
extern int VELOCITY_PLAYER;
extern int VELOCITY_ENEMIES;

extern char* IMAGES_BULLETS;
extern char* IMAGES_PLAYER;
extern char* IMAGES_ENEMIES;

extern int PRIORITY_BULLETS;
extern int PRIORITY_PLAYER;
extern int PRIORITY_ENEMIES;

extern int SHOOTINGSPEED_BULLETS;
extern int SHOOTINGSPEED_PLAYER;
extern int SHOOTINGSPEED_ENEMIES;

extern int HEALTH_BULLETS;
extern int HEALTH_PLAYER;
extern int HEALTH_ENEMIES;

extern int N_COLS;
extern int N_ROWS;

extern int SPAWNRATE;

extern char INITIAL_MAP[11][10];

extern int INITIAL_PLAYERPOSITION[2];

#endif // SETTINGS_H