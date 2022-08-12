`timescale 1 ns/100 ps
// Version: 2022.1 2022.1.0.1


module PF_DDR3_SS_DDRPHY_BLK_IOD_A_11_0_PF_IOD(
       ARST_N,
       RX_SYNC_RST,
       TX_SYNC_RST,
       HS_IO_CLK,
       TX_DQS_270,
       TX_DATA_0,
       TX_DATA_1,
       TX_DATA_2,
       TX_DATA_3,
       TX_DATA_4,
       TX_DATA_5,
       TX_DATA_6,
       TX_DATA_7,
       TX_DATA_8,
       TX_DATA_9,
       TX_DATA_10,
       TX_DATA_11,
       OE_DATA_0,
       OE_DATA_1,
       OE_DATA_2,
       OE_DATA_3,
       OE_DATA_4,
       OE_DATA_5,
       OE_DATA_6,
       OE_DATA_7,
       OE_DATA_8,
       OE_DATA_9,
       OE_DATA_10,
       OE_DATA_11,
       DELAY_LINE_MOVE_0,
       DELAY_LINE_MOVE_1,
       DELAY_LINE_MOVE_2,
       DELAY_LINE_MOVE_3,
       DELAY_LINE_MOVE_4,
       DELAY_LINE_MOVE_5,
       DELAY_LINE_MOVE_6,
       DELAY_LINE_MOVE_7,
       DELAY_LINE_MOVE_8,
       DELAY_LINE_MOVE_9,
       DELAY_LINE_MOVE_10,
       DELAY_LINE_MOVE_11,
       DELAY_LINE_DIRECTION_0,
       DELAY_LINE_DIRECTION_1,
       DELAY_LINE_DIRECTION_2,
       DELAY_LINE_DIRECTION_3,
       DELAY_LINE_DIRECTION_4,
       DELAY_LINE_DIRECTION_5,
       DELAY_LINE_DIRECTION_6,
       DELAY_LINE_DIRECTION_7,
       DELAY_LINE_DIRECTION_8,
       DELAY_LINE_DIRECTION_9,
       DELAY_LINE_DIRECTION_10,
       DELAY_LINE_DIRECTION_11,
       DELAY_LINE_LOAD_0,
       DELAY_LINE_LOAD_1,
       DELAY_LINE_LOAD_2,
       DELAY_LINE_LOAD_3,
       DELAY_LINE_LOAD_4,
       DELAY_LINE_LOAD_5,
       DELAY_LINE_LOAD_6,
       DELAY_LINE_LOAD_7,
       DELAY_LINE_LOAD_8,
       DELAY_LINE_LOAD_9,
       DELAY_LINE_LOAD_10,
       DELAY_LINE_LOAD_11,
       DELAY_LINE_OUT_OF_RANGE_0,
       DELAY_LINE_OUT_OF_RANGE_1,
       DELAY_LINE_OUT_OF_RANGE_2,
       DELAY_LINE_OUT_OF_RANGE_3,
       DELAY_LINE_OUT_OF_RANGE_4,
       DELAY_LINE_OUT_OF_RANGE_5,
       DELAY_LINE_OUT_OF_RANGE_6,
       DELAY_LINE_OUT_OF_RANGE_7,
       DELAY_LINE_OUT_OF_RANGE_8,
       DELAY_LINE_OUT_OF_RANGE_9,
       DELAY_LINE_OUT_OF_RANGE_10,
       DELAY_LINE_OUT_OF_RANGE_11,
       FAB_CLK,
       PAD_O,
       ODT_EN_0,
       ODT_EN_1,
       ODT_EN_2,
       ODT_EN_3,
       ODT_EN_4,
       ODT_EN_5,
       ODT_EN_6,
       ODT_EN_7,
       ODT_EN_8,
       ODT_EN_9,
       ODT_EN_10,
       ODT_EN_11
    );
input  ARST_N;
input  RX_SYNC_RST;
input  TX_SYNC_RST;
input  [0:0] HS_IO_CLK;
input  TX_DQS_270;
input  [3:0] TX_DATA_0;
input  [3:0] TX_DATA_1;
input  [3:0] TX_DATA_2;
input  [3:0] TX_DATA_3;
input  [3:0] TX_DATA_4;
input  [3:0] TX_DATA_5;
input  [3:0] TX_DATA_6;
input  [3:0] TX_DATA_7;
input  [3:0] TX_DATA_8;
input  [3:0] TX_DATA_9;
input  [3:0] TX_DATA_10;
input  [3:0] TX_DATA_11;
input  [3:0] OE_DATA_0;
input  [3:0] OE_DATA_1;
input  [3:0] OE_DATA_2;
input  [3:0] OE_DATA_3;
input  [3:0] OE_DATA_4;
input  [3:0] OE_DATA_5;
input  [3:0] OE_DATA_6;
input  [3:0] OE_DATA_7;
input  [3:0] OE_DATA_8;
input  [3:0] OE_DATA_9;
input  [3:0] OE_DATA_10;
input  [3:0] OE_DATA_11;
input  DELAY_LINE_MOVE_0;
input  DELAY_LINE_MOVE_1;
input  DELAY_LINE_MOVE_2;
input  DELAY_LINE_MOVE_3;
input  DELAY_LINE_MOVE_4;
input  DELAY_LINE_MOVE_5;
input  DELAY_LINE_MOVE_6;
input  DELAY_LINE_MOVE_7;
input  DELAY_LINE_MOVE_8;
input  DELAY_LINE_MOVE_9;
input  DELAY_LINE_MOVE_10;
input  DELAY_LINE_MOVE_11;
input  DELAY_LINE_DIRECTION_0;
input  DELAY_LINE_DIRECTION_1;
input  DELAY_LINE_DIRECTION_2;
input  DELAY_LINE_DIRECTION_3;
input  DELAY_LINE_DIRECTION_4;
input  DELAY_LINE_DIRECTION_5;
input  DELAY_LINE_DIRECTION_6;
input  DELAY_LINE_DIRECTION_7;
input  DELAY_LINE_DIRECTION_8;
input  DELAY_LINE_DIRECTION_9;
input  DELAY_LINE_DIRECTION_10;
input  DELAY_LINE_DIRECTION_11;
input  DELAY_LINE_LOAD_0;
input  DELAY_LINE_LOAD_1;
input  DELAY_LINE_LOAD_2;
input  DELAY_LINE_LOAD_3;
input  DELAY_LINE_LOAD_4;
input  DELAY_LINE_LOAD_5;
input  DELAY_LINE_LOAD_6;
input  DELAY_LINE_LOAD_7;
input  DELAY_LINE_LOAD_8;
input  DELAY_LINE_LOAD_9;
input  DELAY_LINE_LOAD_10;
input  DELAY_LINE_LOAD_11;
output DELAY_LINE_OUT_OF_RANGE_0;
output DELAY_LINE_OUT_OF_RANGE_1;
output DELAY_LINE_OUT_OF_RANGE_2;
output DELAY_LINE_OUT_OF_RANGE_3;
output DELAY_LINE_OUT_OF_RANGE_4;
output DELAY_LINE_OUT_OF_RANGE_5;
output DELAY_LINE_OUT_OF_RANGE_6;
output DELAY_LINE_OUT_OF_RANGE_7;
output DELAY_LINE_OUT_OF_RANGE_8;
output DELAY_LINE_OUT_OF_RANGE_9;
output DELAY_LINE_OUT_OF_RANGE_10;
output DELAY_LINE_OUT_OF_RANGE_11;
input  FAB_CLK;
output [11:0] PAD_O;
input  ODT_EN_0;
input  ODT_EN_1;
input  ODT_EN_2;
input  ODT_EN_3;
input  ODT_EN_4;
input  ODT_EN_5;
input  ODT_EN_6;
input  ODT_EN_7;
input  ODT_EN_8;
input  ODT_EN_9;
input  ODT_EN_10;
input  ODT_EN_11;

    wire GND_net, VCC_net, D_I_TRIBUFF_0_net, E_I_TRIBUFF_0_net, 
        D_I_TRIBUFF_1_net, E_I_TRIBUFF_1_net, D_I_TRIBUFF_2_net, 
        E_I_TRIBUFF_2_net, D_I_TRIBUFF_3_net, E_I_TRIBUFF_3_net, 
        D_I_TRIBUFF_4_net, E_I_TRIBUFF_4_net, D_I_TRIBUFF_5_net, 
        E_I_TRIBUFF_5_net, D_I_TRIBUFF_6_net, E_I_TRIBUFF_6_net, 
        D_I_TRIBUFF_7_net, E_I_TRIBUFF_7_net, D_I_TRIBUFF_8_net, 
        E_I_TRIBUFF_8_net, D_I_TRIBUFF_9_net, E_I_TRIBUFF_9_net, 
        D_I_TRIBUFF_10_net, E_I_TRIBUFF_10_net, D_I_TRIBUFF_11_net, 
        E_I_TRIBUFF_11_net;
    
    TRIBUFF I_TRIBUFF_11 (.D(D_I_TRIBUFF_11_net), .E(
        E_I_TRIBUFF_11_net), .PAD(PAD_O[11]));
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("A3"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b10)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b1), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b0), .TX_MODE(7'b1010100)
        , .TX_CLK_SEL(2'b11), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b0), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_3 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc0, nc1, 
        nc2, nc3, nc4, nc5, nc6, nc7, nc8, nc9}), 
        .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_3), .TX_DATA({
        GND_net, TX_DATA_3[3], GND_net, TX_DATA_3[2], GND_net, 
        TX_DATA_3[1], GND_net, TX_DATA_3[0]}), .OE_DATA({OE_DATA_3[3], 
        OE_DATA_3[2], OE_DATA_3[1], OE_DATA_3[0]}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(GND_net), .DELAY_LINE_MOVE(
        DELAY_LINE_MOVE_3), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_3), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_3), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_3), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(), .TX_DATA_8(), .ARST_N(ARST_N), .RX_SYNC_RST(
        RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), .HS_IO_CLK({GND_net, 
        GND_net, GND_net, GND_net, GND_net, HS_IO_CLK[0]}), .RX_DQS_90({
        GND_net, GND_net}), .TX_DQS(GND_net), .TX_DQS_270(TX_DQS_270), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(D_I_TRIBUFF_3_net), .OE(
        E_I_TRIBUFF_3_net), .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc10, nc11, nc12, nc13, 
        nc14, nc15, nc16, nc17, nc18, nc19, nc20}), .SWITCH(), 
        .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), 
        .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT(), .INFF_SL_OUT(), 
        .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("A11"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b10)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b1), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b0), .TX_MODE(7'b1010100)
        , .TX_CLK_SEL(2'b11), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b0), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_11 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc21, 
        nc22, nc23, nc24, nc25, nc26, nc27, nc28, nc29, nc30}), 
        .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_11), .TX_DATA({
        GND_net, TX_DATA_11[3], GND_net, TX_DATA_11[2], GND_net, 
        TX_DATA_11[1], GND_net, TX_DATA_11[0]}), .OE_DATA({
        OE_DATA_11[3], OE_DATA_11[2], OE_DATA_11[1], OE_DATA_11[0]}), 
        .RX_BIT_SLIP(GND_net), .EYE_MONITOR_CLEAR_FLAGS(GND_net), 
        .DELAY_LINE_MOVE(DELAY_LINE_MOVE_11), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_11), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_11), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_11), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(), .TX_DATA_8(), .ARST_N(ARST_N), .RX_SYNC_RST(
        RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), .HS_IO_CLK({GND_net, 
        GND_net, GND_net, GND_net, GND_net, HS_IO_CLK[0]}), .RX_DQS_90({
        GND_net, GND_net}), .TX_DQS(GND_net), .TX_DQS_270(TX_DQS_270), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(D_I_TRIBUFF_11_net), .OE(
        E_I_TRIBUFF_11_net), .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc31, nc32, nc33, nc34, 
        nc35, nc36, nc37, nc38, nc39, nc40, nc41}), .SWITCH(), 
        .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), 
        .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT(), .INFF_SL_OUT(), 
        .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    TRIBUFF I_TRIBUFF_8 (.D(D_I_TRIBUFF_8_net), .E(E_I_TRIBUFF_8_net), 
        .PAD(PAD_O[8]));
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("A10"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b10)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b1), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b0), .TX_MODE(7'b1010100)
        , .TX_CLK_SEL(2'b11), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b0), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_10 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc42, 
        nc43, nc44, nc45, nc46, nc47, nc48, nc49, nc50, nc51}), 
        .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_10), .TX_DATA({
        GND_net, TX_DATA_10[3], GND_net, TX_DATA_10[2], GND_net, 
        TX_DATA_10[1], GND_net, TX_DATA_10[0]}), .OE_DATA({
        OE_DATA_10[3], OE_DATA_10[2], OE_DATA_10[1], OE_DATA_10[0]}), 
        .RX_BIT_SLIP(GND_net), .EYE_MONITOR_CLEAR_FLAGS(GND_net), 
        .DELAY_LINE_MOVE(DELAY_LINE_MOVE_10), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_10), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_10), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_10), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(), .TX_DATA_8(), .ARST_N(ARST_N), .RX_SYNC_RST(
        RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), .HS_IO_CLK({GND_net, 
        GND_net, GND_net, GND_net, GND_net, HS_IO_CLK[0]}), .RX_DQS_90({
        GND_net, GND_net}), .TX_DQS(GND_net), .TX_DQS_270(TX_DQS_270), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(D_I_TRIBUFF_10_net), .OE(
        E_I_TRIBUFF_10_net), .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc52, nc53, nc54, nc55, 
        nc56, nc57, nc58, nc59, nc60, nc61, nc62}), .SWITCH(), 
        .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), 
        .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT(), .INFF_SL_OUT(), 
        .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    TRIBUFF I_TRIBUFF_0 (.D(D_I_TRIBUFF_0_net), .E(E_I_TRIBUFF_0_net), 
        .PAD(PAD_O[0]));
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("A0"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b10)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b1), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b0), .TX_MODE(7'b1010100)
        , .TX_CLK_SEL(2'b11), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b0), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_0 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc63, 
        nc64, nc65, nc66, nc67, nc68, nc69, nc70, nc71, nc72}), 
        .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_0), .TX_DATA({
        GND_net, TX_DATA_0[3], GND_net, TX_DATA_0[2], GND_net, 
        TX_DATA_0[1], GND_net, TX_DATA_0[0]}), .OE_DATA({OE_DATA_0[3], 
        OE_DATA_0[2], OE_DATA_0[1], OE_DATA_0[0]}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(GND_net), .DELAY_LINE_MOVE(
        DELAY_LINE_MOVE_0), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_0), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_0), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_0), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(), .TX_DATA_8(), .ARST_N(ARST_N), .RX_SYNC_RST(
        RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), .HS_IO_CLK({GND_net, 
        GND_net, GND_net, GND_net, GND_net, HS_IO_CLK[0]}), .RX_DQS_90({
        GND_net, GND_net}), .TX_DQS(GND_net), .TX_DQS_270(TX_DQS_270), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(D_I_TRIBUFF_0_net), .OE(
        E_I_TRIBUFF_0_net), .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc73, nc74, nc75, nc76, 
        nc77, nc78, nc79, nc80, nc81, nc82, nc83}), .SWITCH(), 
        .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), 
        .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT(), .INFF_SL_OUT(), 
        .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    TRIBUFF I_TRIBUFF_9 (.D(D_I_TRIBUFF_9_net), .E(E_I_TRIBUFF_9_net), 
        .PAD(PAD_O[9]));
    VCC vcc_inst (.Y(VCC_net));
    TRIBUFF I_TRIBUFF_2 (.D(D_I_TRIBUFF_2_net), .E(E_I_TRIBUFF_2_net), 
        .PAD(PAD_O[2]));
    GND gnd_inst (.Y(GND_net));
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("A8"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b10)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b1), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b0), .TX_MODE(7'b1010100)
        , .TX_CLK_SEL(2'b11), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b0), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_8 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc84, 
        nc85, nc86, nc87, nc88, nc89, nc90, nc91, nc92, nc93}), 
        .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_8), .TX_DATA({
        GND_net, TX_DATA_8[3], GND_net, TX_DATA_8[2], GND_net, 
        TX_DATA_8[1], GND_net, TX_DATA_8[0]}), .OE_DATA({OE_DATA_8[3], 
        OE_DATA_8[2], OE_DATA_8[1], OE_DATA_8[0]}), .RX_BIT_SLIP(
        GND_net), .EYE_MONITOR_CLEAR_FLAGS(GND_net), .DELAY_LINE_MOVE(
        DELAY_LINE_MOVE_8), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_8), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_8), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_8), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(), .TX_DATA_8(), .ARST_N(ARST_N), .RX_SYNC_RST(
        RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), .HS_IO_CLK({GND_net, 
        GND_net, GND_net, GND_net, GND_net, HS_IO_CLK[0]}), .RX_DQS_90({
        GND_net, GND_net}), .TX_DQS(GND_net), .TX_DQS_270(TX_DQS_270), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(D_I_TRIBUFF_8_net), .OE(
        E_I_TRIBUFF_8_net), .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc94, nc95, nc96, nc97, 
        nc98, nc99, nc100, nc101, nc102, nc103, nc104}), .SWITCH(), 
        .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), .TX_DATA_OUT_8(), 
        .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT(), .INFF_SL_OUT(), 
        .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("A2"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b10)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b1), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b0), .TX_MODE(7'b1010100)
        , .TX_CLK_SEL(2'b11), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b0), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_2 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc105, 
        nc106, nc107, nc108, nc109, nc110, nc111, nc112, nc113, nc114})
        , .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_2), 
        .TX_DATA({GND_net, TX_DATA_2[3], GND_net, TX_DATA_2[2], 
        GND_net, TX_DATA_2[1], GND_net, TX_DATA_2[0]}), .OE_DATA({
        OE_DATA_2[3], OE_DATA_2[2], OE_DATA_2[1], OE_DATA_2[0]}), 
        .RX_BIT_SLIP(GND_net), .EYE_MONITOR_CLEAR_FLAGS(GND_net), 
        .DELAY_LINE_MOVE(DELAY_LINE_MOVE_2), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_2), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_2), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_2), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(), .TX_DATA_8(), .ARST_N(ARST_N), .RX_SYNC_RST(
        RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), .HS_IO_CLK({GND_net, 
        GND_net, GND_net, GND_net, GND_net, HS_IO_CLK[0]}), .RX_DQS_90({
        GND_net, GND_net}), .TX_DQS(GND_net), .TX_DQS_270(TX_DQS_270), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(D_I_TRIBUFF_2_net), .OE(
        E_I_TRIBUFF_2_net), .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc115, nc116, nc117, 
        nc118, nc119, nc120, nc121, nc122, nc123, nc124, nc125}), 
        .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    TRIBUFF I_TRIBUFF_6 (.D(D_I_TRIBUFF_6_net), .E(E_I_TRIBUFF_6_net), 
        .PAD(PAD_O[6]));
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("A7"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b10)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b1), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b0), .TX_MODE(7'b1010100)
        , .TX_CLK_SEL(2'b11), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b0), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_7 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc126, 
        nc127, nc128, nc129, nc130, nc131, nc132, nc133, nc134, nc135})
        , .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_7), 
        .TX_DATA({GND_net, TX_DATA_7[3], GND_net, TX_DATA_7[2], 
        GND_net, TX_DATA_7[1], GND_net, TX_DATA_7[0]}), .OE_DATA({
        OE_DATA_7[3], OE_DATA_7[2], OE_DATA_7[1], OE_DATA_7[0]}), 
        .RX_BIT_SLIP(GND_net), .EYE_MONITOR_CLEAR_FLAGS(GND_net), 
        .DELAY_LINE_MOVE(DELAY_LINE_MOVE_7), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_7), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_7), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_7), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(), .TX_DATA_8(), .ARST_N(ARST_N), .RX_SYNC_RST(
        RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), .HS_IO_CLK({GND_net, 
        GND_net, GND_net, GND_net, GND_net, HS_IO_CLK[0]}), .RX_DQS_90({
        GND_net, GND_net}), .TX_DQS(GND_net), .TX_DQS_270(TX_DQS_270), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(D_I_TRIBUFF_7_net), .OE(
        E_I_TRIBUFF_7_net), .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc136, nc137, nc138, 
        nc139, nc140, nc141, nc142, nc143, nc144, nc145, nc146}), 
        .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    TRIBUFF I_TRIBUFF_10 (.D(D_I_TRIBUFF_10_net), .E(
        E_I_TRIBUFF_10_net), .PAD(PAD_O[10]));
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("A4"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b10)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b1), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b0), .TX_MODE(7'b1010100)
        , .TX_CLK_SEL(2'b11), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b0), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_4 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc147, 
        nc148, nc149, nc150, nc151, nc152, nc153, nc154, nc155, nc156})
        , .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_4), 
        .TX_DATA({GND_net, TX_DATA_4[3], GND_net, TX_DATA_4[2], 
        GND_net, TX_DATA_4[1], GND_net, TX_DATA_4[0]}), .OE_DATA({
        OE_DATA_4[3], OE_DATA_4[2], OE_DATA_4[1], OE_DATA_4[0]}), 
        .RX_BIT_SLIP(GND_net), .EYE_MONITOR_CLEAR_FLAGS(GND_net), 
        .DELAY_LINE_MOVE(DELAY_LINE_MOVE_4), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_4), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_4), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_4), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(), .TX_DATA_8(), .ARST_N(ARST_N), .RX_SYNC_RST(
        RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), .HS_IO_CLK({GND_net, 
        GND_net, GND_net, GND_net, GND_net, HS_IO_CLK[0]}), .RX_DQS_90({
        GND_net, GND_net}), .TX_DQS(GND_net), .TX_DQS_270(TX_DQS_270), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(D_I_TRIBUFF_4_net), .OE(
        E_I_TRIBUFF_4_net), .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc157, nc158, nc159, 
        nc160, nc161, nc162, nc163, nc164, nc165, nc166, nc167}), 
        .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    TRIBUFF I_TRIBUFF_7 (.D(D_I_TRIBUFF_7_net), .E(E_I_TRIBUFF_7_net), 
        .PAD(PAD_O[7]));
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("A6"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b10)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b1), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b0), .TX_MODE(7'b1010100)
        , .TX_CLK_SEL(2'b11), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b0), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_6 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc168, 
        nc169, nc170, nc171, nc172, nc173, nc174, nc175, nc176, nc177})
        , .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_6), 
        .TX_DATA({GND_net, TX_DATA_6[3], GND_net, TX_DATA_6[2], 
        GND_net, TX_DATA_6[1], GND_net, TX_DATA_6[0]}), .OE_DATA({
        OE_DATA_6[3], OE_DATA_6[2], OE_DATA_6[1], OE_DATA_6[0]}), 
        .RX_BIT_SLIP(GND_net), .EYE_MONITOR_CLEAR_FLAGS(GND_net), 
        .DELAY_LINE_MOVE(DELAY_LINE_MOVE_6), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_6), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_6), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_6), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(), .TX_DATA_8(), .ARST_N(ARST_N), .RX_SYNC_RST(
        RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), .HS_IO_CLK({GND_net, 
        GND_net, GND_net, GND_net, GND_net, HS_IO_CLK[0]}), .RX_DQS_90({
        GND_net, GND_net}), .TX_DQS(GND_net), .TX_DQS_270(TX_DQS_270), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(D_I_TRIBUFF_6_net), .OE(
        E_I_TRIBUFF_6_net), .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc178, nc179, nc180, 
        nc181, nc182, nc183, nc184, nc185, nc186, nc187, nc188}), 
        .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("A1"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b10)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b1), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b0), .TX_MODE(7'b1010100)
        , .TX_CLK_SEL(2'b11), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b0), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_1 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc189, 
        nc190, nc191, nc192, nc193, nc194, nc195, nc196, nc197, nc198})
        , .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_1), 
        .TX_DATA({GND_net, TX_DATA_1[3], GND_net, TX_DATA_1[2], 
        GND_net, TX_DATA_1[1], GND_net, TX_DATA_1[0]}), .OE_DATA({
        OE_DATA_1[3], OE_DATA_1[2], OE_DATA_1[1], OE_DATA_1[0]}), 
        .RX_BIT_SLIP(GND_net), .EYE_MONITOR_CLEAR_FLAGS(GND_net), 
        .DELAY_LINE_MOVE(DELAY_LINE_MOVE_1), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_1), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_1), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_1), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(), .TX_DATA_8(), .ARST_N(ARST_N), .RX_SYNC_RST(
        RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), .HS_IO_CLK({GND_net, 
        GND_net, GND_net, GND_net, GND_net, HS_IO_CLK[0]}), .RX_DQS_90({
        GND_net, GND_net}), .TX_DQS(GND_net), .TX_DQS_270(TX_DQS_270), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(D_I_TRIBUFF_1_net), .OE(
        E_I_TRIBUFF_1_net), .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc199, nc200, nc201, 
        nc202, nc203, nc204, nc205, nc206, nc207, nc208, nc209}), 
        .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    TRIBUFF I_TRIBUFF_4 (.D(D_I_TRIBUFF_4_net), .E(E_I_TRIBUFF_4_net), 
        .PAD(PAD_O[4]));
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("A5"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b10)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b1), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b0), .TX_MODE(7'b1010100)
        , .TX_CLK_SEL(2'b11), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b0), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_5 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc210, 
        nc211, nc212, nc213, nc214, nc215, nc216, nc217, nc218, nc219})
        , .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_5), 
        .TX_DATA({GND_net, TX_DATA_5[3], GND_net, TX_DATA_5[2], 
        GND_net, TX_DATA_5[1], GND_net, TX_DATA_5[0]}), .OE_DATA({
        OE_DATA_5[3], OE_DATA_5[2], OE_DATA_5[1], OE_DATA_5[0]}), 
        .RX_BIT_SLIP(GND_net), .EYE_MONITOR_CLEAR_FLAGS(GND_net), 
        .DELAY_LINE_MOVE(DELAY_LINE_MOVE_5), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_5), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_5), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_5), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(), .TX_DATA_8(), .ARST_N(ARST_N), .RX_SYNC_RST(
        RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), .HS_IO_CLK({GND_net, 
        GND_net, GND_net, GND_net, GND_net, HS_IO_CLK[0]}), .RX_DQS_90({
        GND_net, GND_net}), .TX_DQS(GND_net), .TX_DQS_270(TX_DQS_270), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(D_I_TRIBUFF_5_net), .OE(
        E_I_TRIBUFF_5_net), .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc220, nc221, nc222, 
        nc223, nc224, nc225, nc226, nc227, nc228, nc229, nc230}), 
        .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    TRIBUFF I_TRIBUFF_1 (.D(D_I_TRIBUFF_1_net), .E(E_I_TRIBUFF_1_net), 
        .PAD(PAD_O[1]));
    TRIBUFF I_TRIBUFF_3 (.D(D_I_TRIBUFF_3_net), .E(E_I_TRIBUFF_3_net), 
        .PAD(PAD_O[3]));
    TRIBUFF I_TRIBUFF_5 (.D(D_I_TRIBUFF_5_net), .E(E_I_TRIBUFF_5_net), 
        .PAD(PAD_O[5]));
    IOD #( .DATA_RATE(1333.332), .FORMAL_NAME("A9"), .INTERFACE_NAME("DDR3")
        , .DELAY_LINE_SIMULATION_MODE("ENABLED"), .RESERVED_0(1'b0), .RX_CLK_EN(1'b0)
        , .RX_CLK_INV(1'b0), .TX_CLK_EN(1'b1), .TX_CLK_INV(1'b0), .HS_IO_CLK_SEL(3'b000)
        , .QDR_EN(1'b0), .EDGE_DETECT_EN(1'b0), .DELAY_LINE_MODE(2'b10)
        , .RX_MODE(4'b0000), .EYE_MONITOR_MODE(1'b1), .DYN_DELAY_LINE_EN(1'b1)
        , .FIFO_WR_EN(1'b0), .EYE_MONITOR_EN(1'b0), .TX_MODE(7'b1010100)
        , .TX_CLK_SEL(2'b11), .TX_OE_MODE(3'b010), .TX_OE_CLK_INV(1'b0)
        , .RX_DELAY_VAL(8'b00000001), .RX_DELAY_VAL_X2(1'b0), .TX_DELAY_VAL(8'b00000001)
        , .EYE_MONITOR_WIDTH(3'b001), .EYE_MONITOR_WIDTH_SRC(1'b0), .RESERVED_1(1'b0)
        , .DISABLE_LANECTRL_RESET(1'b0), .INPUT_DELAY_SEL(2'b00), .OEFF_EN_INV(1'b0)
        , .INFF_EN_INV(1'b0), .OUTFF_EN_INV(1'b0) )  I_IOD_9 (
        .EYE_MONITOR_EARLY(), .EYE_MONITOR_LATE(), .RX_DATA({nc231, 
        nc232, nc233, nc234, nc235, nc236, nc237, nc238, nc239, nc240})
        , .DELAY_LINE_OUT_OF_RANGE(DELAY_LINE_OUT_OF_RANGE_9), 
        .TX_DATA({GND_net, TX_DATA_9[3], GND_net, TX_DATA_9[2], 
        GND_net, TX_DATA_9[1], GND_net, TX_DATA_9[0]}), .OE_DATA({
        OE_DATA_9[3], OE_DATA_9[2], OE_DATA_9[1], OE_DATA_9[0]}), 
        .RX_BIT_SLIP(GND_net), .EYE_MONITOR_CLEAR_FLAGS(GND_net), 
        .DELAY_LINE_MOVE(DELAY_LINE_MOVE_9), .DELAY_LINE_DIRECTION(
        DELAY_LINE_DIRECTION_9), .DELAY_LINE_LOAD(DELAY_LINE_LOAD_9), 
        .RX_CLK(GND_net), .TX_CLK(FAB_CLK), .ODT_EN(ODT_EN_9), 
        .INFF_SL(GND_net), .INFF_EN(GND_net), .OUTFF_SL(GND_net), 
        .OUTFF_EN(GND_net), .AL_N(GND_net), .OEFF_LAT_N(GND_net), 
        .OEFF_SD_N(GND_net), .OEFF_AD_N(GND_net), .INFF_LAT_N(GND_net), 
        .INFF_SD_N(GND_net), .INFF_AD_N(GND_net), .OUTFF_LAT_N(GND_net)
        , .OUTFF_SD_N(GND_net), .OUTFF_AD_N(GND_net), .RX_P(), .RX_N(), 
        .TX_DATA_9(), .TX_DATA_8(), .ARST_N(ARST_N), .RX_SYNC_RST(
        RX_SYNC_RST), .TX_SYNC_RST(TX_SYNC_RST), .HS_IO_CLK({GND_net, 
        GND_net, GND_net, GND_net, GND_net, HS_IO_CLK[0]}), .RX_DQS_90({
        GND_net, GND_net}), .TX_DQS(GND_net), .TX_DQS_270(TX_DQS_270), 
        .FIFO_WR_PTR({GND_net, GND_net, GND_net}), .FIFO_RD_PTR({
        GND_net, GND_net, GND_net}), .TX(D_I_TRIBUFF_9_net), .OE(
        E_I_TRIBUFF_9_net), .CDR_CLK(GND_net), .CDR_NEXT_CLK(GND_net), 
        .EYE_MONITOR_LANE_WIDTH({GND_net, GND_net, GND_net}), 
        .DDR_DO_READ(), .CDR_CLK_A_SEL_8(), .CDR_CLK_A_SEL_9(), 
        .CDR_CLK_A_SEL_10(), .CDR_CLK_B_SEL({nc241, nc242, nc243, 
        nc244, nc245, nc246, nc247, nc248, nc249, nc250, nc251}), 
        .SWITCH(), .CDR_CLR_NEXT_CLK_N(), .TX_DATA_OUT_9(), 
        .TX_DATA_OUT_8(), .AL_N_OUT(), .OUTFF_SL_OUT(), .OUTFF_EN_OUT()
        , .INFF_SL_OUT(), .INFF_EN_OUT(), .RX_CLK_OUT(), .TX_CLK_OUT());
    
endmodule
