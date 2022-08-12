`timescale 1 ns/100 ps
// Version: 2022.1 2022.1.0.1


module PF_DDR4_SS_DLL_0_PF_CCC(
       DLL_LOCK,
       DLL_CODE_UPDATE,
       DLL_DELAY_DIFF,
       DLL_REF_CLK,
       DLL_CODE,
       DLL_POWERDOWN_N
    );
output DLL_LOCK;
input  DLL_CODE_UPDATE;
output DLL_DELAY_DIFF;
input  DLL_REF_CLK;
output [7:0] DLL_CODE;
input  DLL_POWERDOWN_N;

    wire gnd_net, vcc_net;
    
    DLL #( .DATA_RATE(0.0), .FORMAL_NAME(""), .INTERFACE_LEVEL(""), .SOFTRESET(1'b0)
        , .PRIMARY_PHASE(2'b0), .SECONDARY_PHASE(2'b00), .PRIMARY_CLK_SEL(2'b0)
        , .SECONDARY_CLK_SEL(2'b0), .REF_SEL(1'b0), .FB_SEL(1'b1), .DIV_SEL(1'b0)
        , .SECONDARY_FINE_PHASE(3'b100), .ALU_UPDATE(2'b0), .PHASE_CODE_SEL(3'b100)
        , .LOCK_TOLERANCE(2'b00), .LOCK_HIGH(4'b0), .LOCK_LOW(4'b0), .SET_ALU(8'b0)
        , .ADJ_DEL4(7'b0), .RESERVED_0(1'b0), .ADJ_CODE(7'b0000000), .INIT_CODE(6'b0)
        , .FAST_RELOCK(1'b0), .POWERDOWN_EN(1'b1), .RESET(1'b0), .SOFT_ALU_HOLD(1'b0)
        , .SOFT_CODE_UPDATE(1'b1), .SOFT_LOCK_DBG(2'b0), .SOFT_LOCK_FRC(1'b0)
        , .SOFT_PHASE_DIRECTION(1'b0), .SOFT_PHASE_LOAD(1'b0), .SOFT_PHASE_MOVE_CLK(1'b0)
        , .SOFT_MOVE_CODE(1'b0), .TEST_RING(1'b0), .DELAY_DIFF_RANGE(3'b0)
        , .DRI_EN(1'b1) )  dll_inst_0 (.CLK_MOVE_DONE(), 
        .CODE_MOVE_DONE(), .LOCK(DLL_LOCK), .DELAY_DIFF(DLL_DELAY_DIFF)
        , .POWERDOWN_N(DLL_POWERDOWN_N), .DIR(gnd_net), .CLK_MOVE(
        gnd_net), .CODE_MOVE(gnd_net), .ALU_HOLD(gnd_net), 
        .CODE_UPDATE(DLL_CODE_UPDATE), .PHASE_LOAD(gnd_net), .CODE({
        DLL_CODE[7], DLL_CODE[6], DLL_CODE[5], DLL_CODE[4], 
        DLL_CODE[3], DLL_CODE[2], DLL_CODE[1], DLL_CODE[0]}), .REF_CLK(
        DLL_REF_CLK), .FB_CLK(gnd_net), .CLK_0(), .CLK_1(), .DRI_CLK(
        gnd_net), .DRI_CTRL({gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net})
        , .DRI_WDATA({gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net})
        , .DRI_ARST_N(vcc_net), .DRI_RDATA({nc0, nc1, nc2, nc3, nc4, 
        nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, nc13, nc14, nc15, 
        nc16, nc17, nc18, nc19, nc20, nc21, nc22, nc23, nc24, nc25, 
        nc26, nc27, nc28, nc29, nc30, nc31, nc32}), .DRI_INTERRUPT());
    VCC vcc_inst (.Y(vcc_net));
    GND gnd_inst (.Y(gnd_net));
    
endmodule
