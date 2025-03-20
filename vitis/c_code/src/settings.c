#include "settings.h"

int DEBUG_MODE = 0;

// Définition des variables globales
int VELOCITY_BULLETS = 2;
int VELOCITY_PLAYER = 1;
int VELOCITY_ENEMIES = 1;

char* IMAGES_BULLETS = "o";
char* IMAGES_PLAYER = "P";
char* IMAGES_ENEMIES = "X";

int PRIORITY_BULLETS = 1;
int PRIORITY_PLAYER = 1;
int PRIORITY_ENEMIES = 1;

int SHOOTINGSPEED_BULLETS = 0;
int SHOOTINGSPEED_PLAYER = 0;
int SHOOTINGSPEED_ENEMIES = 1;

int HEALTH_BULLETS = 1;
int HEALTH_PLAYER = 5;
int HEALTH_ENEMIES = 1;

int N_ROWS = 20;
int N_COLS = 20;



/**har INITIAL_MAP[11][10] = {
    {'|',' ',' ',' ',' ',' ',' ',' ',' ','|'},
    {'|','*',' ',' ',' ',' ',' ',' ',' ','|'},
    {'|',' ',' ',' ',' ',' ',' ',' ',' ','|'},
    {'|',' ',' ','*',' ',' ',' ',' ',' ','|'},
    {'|',' ',' ',' ',' ',' ',' ',' ',' ','|'},
    {'|',' ',' ',' ',' ',' ',' ',' ',' ','|'},
    {'|',' ',' ',' ',' ',' ','*',' ',' ','|'},
    {'|',' ',' ',' ',' ',' ',' ',' ',' ','|'},
    {'|','*',' ',' ',' ',' ',' ',' ',' ','|'},
    {'|',' ',' ',' ',' ',' ',' ',' ','*','|'},
    {'|',' ',' ',' ',' ',' ',' ',' ',' ','|'},
};**/

int INITIAL_PLAYERPOSITION[2] = {10 /**ligne*/,5 /**colonne*/};


int SPAWNRATE = 1;