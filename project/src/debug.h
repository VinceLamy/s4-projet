#ifndef DEBUG_H
#define DEBUG_H

#include "includeLib.h"



struct Debug
{




	//void (*printDebugCell)(struct Debug *self);

};


struct Debug* __init_Debug__();
void __free_Debug__(struct Debug *self);
void printDebugCell(struct Debug *self);









#endif
