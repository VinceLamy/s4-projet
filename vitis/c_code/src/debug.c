#include "../lib/debug.h"






struct Debug* __init_Debug__()
{
    struct Debug *newDebug = (struct Debug*)malloc(sizeof(struct Debug));

    newDebug->debug_instruction = (long*)malloc(sizeof(long));
    newDebug->debug_instructionStr = (char*)malloc(10 * sizeof(char));
    return newDebug;
}




void __free_Debug__(struct Degug* self)
{
    free(self);
}



char* getInstructionStr(struct Debug* self)
{
    // Allouer de la mémoire pour la chaîne de caractères
    

    // Convertir le long en string
    sprintf(self->debug_instructionStr, "%ld", *(self->debug_instruction));

    return self->debug_instructionStr;
}
