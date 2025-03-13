#ifndef DEBUG_H
#define DEBUG_H


struct Debug
{

    //attributs
    long *debug_instruction;
    char *debug_instructionStr;

    char* (*getInstructionStr)(struct Debug* self);

};


struct Debug* __init_Debug__();
void __free_Debug__(struct Degug* self);

char* getInstructionStr(struct Debug* self)




#endif