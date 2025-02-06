

#include "../lib/joystick.h"





void updateMovement(struct Joystick* self)
{
    initscr();            // Initialiser ncurses
    cbreak();             // Désactiver le buffering de ligne
    noecho();             // Ne pas afficher les caractères saisis
    timeout(0);           // Ne pas bloquer en attente d'entrée

    int ch = getch();     // Lire un caractère

    if (ch == 'w' || ch == 'W') {
        self->up = 1;
    } else self->up = 0;

    if (ch == 'd' || ch == 'D') {
        self->right = 1;
    } else self->right = 0;

    if (ch == 's' || ch == 'S') {
        self->down = 1;
    } else self->down = 0;

    if (ch == 'a' || ch == 'A') {
        self->left = 1;
    } else self->left = 0;

    endwin();             // Terminer ncurses
}
