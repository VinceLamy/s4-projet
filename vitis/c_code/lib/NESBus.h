#ifndef NESBUS_H
#define NESBUS_H



struct NESBus
{

    //attributs


    //methodes
    void (*sendInstrution)(long instruction);

};



struct NESBus __init_NESBus__();
void __free_NESBus__();

void sendInstruction(long instruction, struct Debug* debug);

long binToHexa()

void sendInstruction_initialiseBackgroundTile()









#endif