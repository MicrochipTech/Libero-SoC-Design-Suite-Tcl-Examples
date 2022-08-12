`timescale 1 ns/100 ps
// Version: 2022.1 2022.1.0.1


module PF_DDR3_SS_DDRPHY_BLK_LANE_1_IOD_DM_PF_IOD(
       ARST_N,
       RX_SYNC_RST,
       TX_SYNC_RST,
       HS_IO_CLK,
       TX_DQS,
       TX_DATA_0,
       OE_DATA_0,
       DELAY_LINE_MOVE_0,
       DELAY_LINE_DIRECTION_0,
       DELAY_LINE_LOAD_0,
       DELAY_LINE_OUT_OF_RANGE_0,
       FAB_CLK,
       PAD_O,
       RX_FB,
       ODT_EN_0
    );
input  ARST_N;
input  RX_SYNC_RST;
input  TX_SYNC_RST;
input  [0:0] HS_IO_CLK;
input  TX_DQS;
input  [7:0] TX_DATA_0;
input  [3:0] OE_DATA_0;
input  DELAY_LINE_MOVE_0;
input  DELAY_LINE_DIRECTION_0;
input  DELAY_LINE_LOAD_0;
output DELAY_LINE_OUT_OF_RANGE_0;
input  FAB_CLK;
output [0:0] PAD_O;
output RX_FB;
input  ODT_EN_0;

    wire GND_net, VCC_net, D_I_TRIBUFF_FEEDBACK_0_net, 
        E_I_TRIBUFF_FEEDBACK_0_net;
    
    VCC vcc_inst (.Y(VCC_net));
    GND gnd_inst (.Y(GND_net));
    TRIBUFF_FEEDBACK I_TRIBUFF_FEEDBACK_0 (.D(
        D_I_TRIBUFF_FEEDBACK_0_net), .E(E_I_TRIBUFF_FEEDBACK_0_net), 
        .Y(RX_FB), .PAD(PAD_O[0]));
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("DM1:NO_IOD_N_SIDE"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b11)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b0)
        , .FIFO_WR_EN(1'b1), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b1000100)
        , .TX_CLK_SEL(2'b10), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_0 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc0, nc1, 
        nc2, nc3, nc4, nc5, nc6, nc7, nc8, nc9}), 
        .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_0), .TX_DATA({
        TX_DATA_0[7], TX_DATA_0[6], TX_DATA_0[5], TX_DATA_0[4], 
        TX_DATA_0[3], TX_DATA_0[2], TX_DATA_0[1], TX_DATA_0[0]}), 
        .OE_DATA({OE_DATA_0[3], OE_DATA_0[2], OE_DATA_0[1], 
        OE_DATA_0[0]}), .RX_BIT_SLIP(GND_net), 
        .EYE_MONITOR_CLEAR_FLAGS(GND_net), .DELAY_LINE_MOVE(
        DELAY_LINE_MOVE_0), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_0), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_0), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_0), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(GND_net), .TX_DATA_8(GND_net), .ARST_N(ARST_N), 
        .RX_SYNC_RST(RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), 
        .HS_IO_CLK({GND_net, GND_net, GND_net, GND_net, GND_net, 
        HS_IO_CLK[0]}), .RX_DQS_90({GND_net, GND_net}), .TX_DQS(TX_DQS)
        , .TX_DQS_270(GND_net), .FIFO_WR_PTR({GND_net, GND_net, 
        GND_net}), .FIFO_RD_PTR({GND_net, GND_net, GND_net}), .TX(
        D_I_TRIBUFF_FEEDBACK_0_net), .OE(E_I_TRIBUFF_FEEDBACK_0_net), 
        .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc10, nc11, nc12, nc13, 
        nc14, nc15, nc16, nc17, nc18, nc19, nc20}), .SWITCH(), 
        .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), 
        .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT(), .INFF_SL_OUT(), 
        .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    
endmodule
