

#include "../lib/controller.h"



struct Controller* __init_Controller__()
{

    initscr();            // Initialiser ncurses
    cbreak();             // Désactiver le buffering de ligne
    noecho();             // Ne pas afficher les caractères saisis
    timeout(0);           // Ne pas bloquer en attente d'entrée

    struct Controller* newController = (struct Controller*)malloc(sizeof(struct Controller));

    newController->updateMovement = updateMovement;
    newController->updateMovementAsync = updateMovementAsync;
    return newController;
} 

void __free_Controller__(struct Controller* self)
{
    endwin(); // Terminer ncurses
    free(self);
}

void updateMovement(struct Controller* self)
{
    int ch = getch(); // Lire un caractère à partir de l'entrée standard

    self->up = (ch == 'w' || ch == 'W') ? 1 : 0;
    self->right = (ch == 'd' || ch == 'D') ? 1 : 0;
    self->down = (ch == 's' || ch == 'S') ? 1 : 0;
    self->left = (ch == 'a' || ch == 'A') ? 1 : 0;
    self->quit = (ch == 'q' || ch == 'Q') ? 1 : 0;
}

enum Direction updateMovementAsync(struct Controller* self)
{
    char ch = getchar();

    if (ch == 'w' || ch == 'W') {
        return UP;
    }
    if (ch == 'd' || ch == 'D') {
        return RIGHT;
    }
    if (ch == 's' || ch == 'S') {
        return DOWN;
    }
    if (ch == 'a' || ch == 'A') {
        return LEFT;
    }

    return NONE;
}
