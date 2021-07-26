`timescale 1 ns/100 ps
// Version: v12.1 12.600.0.14


module IOG_IOD_DDRX4_PF_PF_IOD_RX_PF_IOD(
       ARST_N,
       RX_SYNC_RST,
       TX_SYNC_RST,
       HS_IO_CLK,
       RX_DQS_90,
       FIFO_WR_PTR,
       FIFO_RD_PTR,
       EYE_MONITOR_LANE_WIDTH,
       EYE_MONITOR_CLEAR_FLAGS_0,
       EYE_MONITOR_CLEAR_FLAGS_1,
       DELAY_LINE_MOVE_0,
       DELAY_LINE_MOVE_1,
       DELAY_LINE_DIRECTION_0,
       DELAY_LINE_DIRECTION_1,
       DELAY_LINE_LOAD_0,
       DELAY_LINE_LOAD_1,
       DELAY_LINE_OUT_OF_RANGE_0,
       DELAY_LINE_OUT_OF_RANGE_1,
       FAB_CLK,
       EYE_MONITOR_EARLY_0,
       EYE_MONITOR_EARLY_1,
       EYE_MONITOR_LATE_0,
       EYE_MONITOR_LATE_1,
       RX_DATA_0,
       RX_DATA_1,
       PAD_I,
       PAD_I_N
    );
input  ARST_N;
input  RX_SYNC_RST;
input  TX_SYNC_RST;
input  [0:0] HS_IO_CLK;
input  [0:0] RX_DQS_90;
input  [2:0] FIFO_WR_PTR;
input  [2:0] FIFO_RD_PTR;
input  [2:0] EYE_MONITOR_LANE_WIDTH;
input  EYE_MONITOR_CLEAR_FLAGS_0;
input  EYE_MONITOR_CLEAR_FLAGS_1;
input  DELAY_LINE_MOVE_0;
input  DELAY_LINE_MOVE_1;
input  DELAY_LINE_DIRECTION_0;
input  DELAY_LINE_DIRECTION_1;
input  DELAY_LINE_LOAD_0;
input  DELAY_LINE_LOAD_1;
output DELAY_LINE_OUT_OF_RANGE_0;
output DELAY_LINE_OUT_OF_RANGE_1;
input  FAB_CLK;
output EYE_MONITOR_EARLY_0;
output EYE_MONITOR_EARLY_1;
output EYE_MONITOR_LATE_0;
output EYE_MONITOR_LATE_1;
output [7:0] RX_DATA_0;
output [7:0] RX_DATA_1;
input  [1:0] PAD_I;
input  [1:0] PAD_I_N;

    wire GND_net, VCC_net, Y_I_INBUF_DIFF_0_net, Y_I_INBUF_DIFF_1_net;
    
    IOD #( .DATA_RATE(1000.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDRX_B_G_DYN")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b1100), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b1), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_1 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_1), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_1), .RX_DATA({RX_DATA_1[7], RX_DATA_1[6], 
        RX_DATA_1[5], RX_DATA_1[4], RX_DATA_1[3], RX_DATA_1[2], 
        RX_DATA_1[1], RX_DATA_1[0], nc0, nc1}), 
        .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_1), .TX_DATA({
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net}), .OE_DATA({GND_net, GND_net, GND_net, GND_net}), 
        .RX_BIT_SLIP(GND_net), .EYE_MONITOR_CLEAR_FLAGS(
        EYE_MONITOR_CLEAR_FLAGS_1), .DELAY_LINE_MOVE(DELAY_LINE_MOVE_1)
        , .DELAY_LINE_DIRECTION(DELAY_LINE_DIRECTION_1), 
        .DELAY_LINE_LOAD(DELAY_LINE_LOAD_1), .RX_CLK(FAB_CLK), .TX_CLK(
        GND_net), .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(
        GND_net), .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(
        GND_net), .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), 
        .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), 
        .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(
        GND_net), .OUTFF_AD_N(GND_net), .RX_P(Y_I_INBUF_DIFF_1_net), 
        .RX_N(), .TX_DATA_9(GND_net), .TX_DATA_8(GND_net), .ARST_N(
        ARST_N), .RX_SYNC_RST(RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), 
        .HS_IO_CLK({GND_net, GND_net, GND_net, GND_net, GND_net, 
        HS_IO_CLK[0]}), .RX_DQS_90({GND_net, RX_DQS_90[0]}), .TX_DQS(
        GND_net), .TX_DQS_270(GND_net), .FIFO_WR_PTR({FIFO_WR_PTR[2], 
        FIFO_WR_PTR[1], FIFO_WR_PTR[0]}), .FIFO_RD_PTR({FIFO_RD_PTR[2], 
        FIFO_RD_PTR[1], FIFO_RD_PTR[0]}), .TX(), .OE(), .CDR_CLK(
        GND_net), .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc2, 
        nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12}), .SWITCH(
        ), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), 
        .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT(), .INFF_SL_OUT(), 
        .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    INBUF_DIFF I_INBUF_DIFF_0 (.PADP(PAD_I[0]), .PADN(PAD_I_N[0]), .Y(
        Y_I_INBUF_DIFF_0_net));
    VCC vcc_inst (.Y(VCC_net));
    GND gnd_inst (.Y(GND_net));
    IOD #( .DATA_RATE(1000.0), .FORMAL_NAME("RXD%STATIC_DELAY"), .INTERFACE_NAME("RX_DDRX_B_G_DYN")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b1)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b0), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b01)
        , .RX_MODE(4'b1100), .EYE_MONITOR_MODE(1'b0), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b1), .EYE_MONITOR_EN(1'b1), .TX_MODE(7'b0000000)
        , .TX_CLK_SEL(2'b00), .TX_OE_MODE(3'b111), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b1), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_0 (
        .EYE_MONITOR_EARLY(EYE_MONITOR_EARLY_0), .EYE_MONITOR_LATE(
        EYE_MONITOR_LATE_0), .RX_DATA({RX_DATA_0[7], RX_DATA_0[6], 
        RX_DATA_0[5], RX_DATA_0[4], RX_DATA_0[3], RX_DATA_0[2], 
        RX_DATA_0[1], RX_DATA_0[0], nc13, nc14}), 
        .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_0), .TX_DATA({
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net}), .OE_DATA({GND_net, GND_net, GND_net, GND_net}), 
        .RX_BIT_SLIP(GND_net), .EYE_MONITOR_CLEAR_FLAGS(
        EYE_MONITOR_CLEAR_FLAGS_0), .DELAY_LINE_MOVE(DELAY_LINE_MOVE_0)
        , .DELAY_LINE_DIRECTION(DELAY_LINE_DIRECTION_0), 
        .DELAY_LINE_LOAD(DELAY_LINE_LOAD_0), .RX_CLK(FAB_CLK), .TX_CLK(
        GND_net), .ODT_EN(GND_net), .INFF_SL(GND_net), .INFF_EN(
        GND_net), .OUTFF_SL(GND_net), .OUTFF_EN(GND_net), .AL_N(
        GND_net), .OEFF_LAT_N(GND_net), .OEFF_SD_N(GND_net), 
        .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), .INFF_SD_N(GND_net), 
        .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net), .OUTFF_SD_N(
        GND_net), .OUTFF_AD_N(GND_net), .RX_P(Y_I_INBUF_DIFF_0_net), 
        .RX_N(), .TX_DATA_9(GND_net), .TX_DATA_8(GND_net), .ARST_N(
        ARST_N), .RX_SYNC_RST(RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), 
        .HS_IO_CLK({GND_net, GND_net, GND_net, GND_net, GND_net, 
        HS_IO_CLK[0]}), .RX_DQS_90({GND_net, RX_DQS_90[0]}), .TX_DQS(
        GND_net), .TX_DQS_270(GND_net), .FIFO_WR_PTR({FIFO_WR_PTR[2], 
        FIFO_WR_PTR[1], FIFO_WR_PTR[0]}), .FIFO_RD_PTR({FIFO_RD_PTR[2], 
        FIFO_RD_PTR[1], FIFO_RD_PTR[0]}), .TX(), .OE(), .CDR_CLK(
        GND_net), .CDR_NEXT_CLK(GND_net), .EYE_MONITOR_LANE_WIDTH({
        EYE_MONITOR_LANE_WIDTH[2], EYE_MONITOR_LANE_WIDTH[1], 
        EYE_MONITOR_LANE_WIDTH[0]}), .DDR_DO_READ(), .CDR_CLK_A_SEL_8()
        , .CDR_CLK_A_SEL_9(), .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({
        nc15, nc16, nc17, nc18, nc19, nc20, nc21, nc22, nc23, nc24, 
        nc25}), .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    INBUF_DIFF I_INBUF_DIFF_1 (.PADP(PAD_I[1]), .PADN(PAD_I_N[1]), .Y(
        Y_I_INBUF_DIFF_1_net));
    
endmodule
