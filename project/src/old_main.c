#include "scaler.h"
#include "vdma.h"
#include "xil_printf.h"
#include "myColorRegister.h"
#include "sleep.h"

int old_main()
{
	configureScaler();
    configureVdma();

    // Le seul changement est sur le tuileID
    // Instruction1 = 000 010 000001 0000000 0000000 000000
    int instruction1 = 0x8100000;

    // Instruction2 = 000 010 000010 0000000 0000000 000000
    int instruction2 = 0x8200000;

    while(1)
    {
		MYCOLORREGISTER_mWriteReg(XPAR_MYCOLORREGISTER_0_S00_AXI_BASEADDR, 0, instruction1);
		sleep(1);
		MYCOLORREGISTER_mWriteReg(XPAR_MYCOLORREGISTER_0_S00_AXI_BASEADDR, 0, instruction2);
		sleep(1);
    }

    return 0;
}
