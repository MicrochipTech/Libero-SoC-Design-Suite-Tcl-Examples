
/// Header_Start --->>>



/// Header_End <<<---


/// I/O_Start --->>>

// if dll_dly_diff asserts, wait for next refresh and request a code_update

module DLL_MON( SCLK,
                reset_n,
                code_update,
                dll_dly_diff,
                dfi_ctrlupd_req );

input          SCLK;
input          reset_n;

// Port: System

output         code_update;
input          dll_dly_diff;

// Port: NWL_PHY
input          dfi_ctrlupd_req;


/// I/O_End <<<---

assign code_update = 1'b0;




/// Components_Start --->>>

// File: DLL_MON_BOT.v
/*
DLL_MON_BOT DLL_MON_BOT( .SCLK(SCLK),
                         .reset_n(reset_n),
                         .CODE_UPDATE(CODE_UPDATE),
                         .DLL_DLY_DIFF(DLL_DLY_DIFF) );
*/



/// Components_End <<<---


endmodule

