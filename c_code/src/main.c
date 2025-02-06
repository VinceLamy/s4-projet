#include "../lib/main.h"
#include "../lib/map.h"
#include "../lib/cell.h"

int main()
{
    struct Map* map = __init_Map__();
    __str_Map__(map);
    __free_Map__(map); // Free the allocated memory before exiting
    return 0;
}