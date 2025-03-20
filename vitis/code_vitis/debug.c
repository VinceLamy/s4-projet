#include "debug.h"





struct Debug* __init_Debug__()
{
	struct Debug *newDebug = (struct Debug*)malloc(sizeof(struct Debug));
	return newDebug;
}

void __free_Debug__(struct Debug *self)
{
	free(self);
}




void printDebugCell(struct Debug *self)
{
	// Le seul changement est sur le tuileID
	// Instruction1 = 000 010 000001 0000000 0000000 000000
	int instruction1 = 0x08102000;

	// Instruction2 = 000 010 000010 0000000 0000000 000000
	int instruction2 = 0x08202000;

	while(1)
	{
		MYCOLORREGISTER_mWriteReg(XPAR_MYCOLORREGISTER_0_S00_AXI_BASEADDR, 0, instruction1);
		sleep(1);
		MYCOLORREGISTER_mWriteReg(XPAR_MYCOLORREGISTER_0_S00_AXI_BASEADDR, 0, instruction2);
		sleep(1);
	}
}
