#include "map.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h> // Pour memcpy


struct Map* __init_Map__()
{
    struct Map* newMap = (struct Map*)malloc(sizeof(struct Map));
    if (newMap != NULL)
    {
        newMap->rows = N_ROWS;
        newMap->cols = N_COLS;
        newMap->matrix = (struct Cell***)malloc(N_ROWS * sizeof(struct Cell**));
        for (int i = 0; i < N_ROWS; i++) {
            newMap->matrix[i] = (struct Cell**)malloc(N_COLS * sizeof(struct Cell*));
            for (int j = 0; j < N_COLS; j++) {
                newMap->matrix[i][j] = (struct Cell*)malloc(sizeof(struct Cell));
            }
        }

        // Initialisation de la matrice avec des valeurs par défaut
        for (int i = 0; i < N_ROWS; i++) {
            for (int j = 0; j < N_COLS; j++) {
                char* image = (char*)malloc(20 * sizeof(char));
                if (image != NULL) {
                    sprintf(image, "|%d,%d|", i, j); // Utilisation de sprintf pour formater la chaîne
                    newMap->matrix[i][j] = __init_Cell__(image, NULL, NULL, NULL, NULL);
                }
            }
        }

        // Initialisation des cases voisines (exemple)
        for (int i = 0; i < N_ROWS; i++) {
            for (int j = 0; j < N_COLS; j++) {
                newMap->matrix[i][j]->north = (i > 0) ? newMap->matrix[i-1][j] : NULL;
                newMap->matrix[i][j]->south = (i < N_ROWS - 1) ? newMap->matrix[i+1][j] : NULL;
                newMap->matrix[i][j]->west = (j > 0) ? newMap->matrix[i][j-1] : NULL;
                newMap->matrix[i][j]->east = (j < N_COLS - 1) ? newMap->matrix[i][j+1] : NULL;

                char* img;
                sprintf(img, "| %d, %d |", i, j);
                newMap->matrix[i][j]->set_Image(newMap->matrix[i][j], img);
            }
        }
    }
    return newMap;
}



void __free_Map__(struct Map* map)
{
    if (map != NULL)
    {
        for (int i = 0; i < map->rows; i++) {
            for (int j = 0; j < map->cols; j++) {
                free(map->matrix[i][j]->image); // Libérer la mémoire allouée pour l'image
                free(map->matrix[i][j]); // Libérer la mémoire allouée pour chaque Cell
            }
            free(map->matrix[i]); // Libérer la mémoire allouée pour chaque ligne
        }
        free(map->matrix); // Libérer la mémoire allouée pour la matrice
        free(map); // Libérer la mémoire allouée pour la structure Map
    }
}



void __str_Map__(struct Map* map)
{
    for (int i = 0; i < map->rows; i++) {
        for (int j = 0; j < map->cols; j++) {
            printf("%s ", __str_Cell__(map->matrix[i][j]));
        }
        printf("\n");
    }
}

