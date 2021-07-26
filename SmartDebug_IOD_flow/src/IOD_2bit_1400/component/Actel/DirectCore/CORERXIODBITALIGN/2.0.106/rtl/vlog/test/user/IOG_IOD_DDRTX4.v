//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Jun 24 11:22:55 2019
// Version: v12.1 12.600.0.14
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// IOG_IOD_DDRTX4
module IOG_IOD_DDRTX4(
    // Inputs
    ARST_N,
    HS_IO_CLK,
    L0_TXD_DATA,
    TX_CLK_G,
    // Outputs
    TXD,
    TXD_N,
    TX_CLK,
    TX_CLK_N
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        ARST_N;
input        HS_IO_CLK;
input  [7:0] L0_TXD_DATA;
input        TX_CLK_G;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [0:0] TXD;
output [0:0] TXD_N;
output       TX_CLK;
output       TX_CLK_N;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         ARST_N;
wire         DFN1_PAUSE_S0_Q;
wire         DFN1_PAUSE_S1_Q;
wire         DFN1_PAUSE_S2_Q;
wire         HS_IO_CLK;
wire   [7:0] L0_TXD_DATA;
wire         LANECTRL_ADDR_CMD_0_ARST_N;
wire         LANECTRL_ADDR_CMD_0_RX_SYNC_RST;
wire         LANECTRL_ADDR_CMD_0_TX_DQS;
wire         LANECTRL_ADDR_CMD_0_TX_DQS_270;
wire         LANECTRL_ADDR_CMD_0_TX_SYNC_RST;
wire   [0:0] TX_CLK_net_0;
wire         TX_CLK_G;
wire   [0:0] TX_CLK_N_net_0;
wire   [0:0] TXD_net_0;
wire   [0:0] TXD_N_net_0;
wire         TX_CLK_net_1;
wire         TX_CLK_N_net_1;
wire   [0:0] TXD_net_1;
wire   [0:0] TXD_N_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
wire         VCC_net;
wire   [3:0] OE_DATA_0_const_net_0;
wire   [3:0] TX_DATA_0_const_net_0;
wire   [1:0] OE_DATA_0_const_net_1;
wire   [7:0] DLL_CODE_const_net_0;
wire   [2:0] READ_CLK_SEL_const_net_0;
wire   [2:0] EYE_MONITOR_WIDTH_IN_const_net_0;
wire   [7:0] CDR_CLK_A_SEL_const_net_0;
wire   [10:0]CDR_CLK_B_SEL_const_net_0;
wire   [1:0] RX_DQS_90_const_net_0;
wire   [2:0] FIFO_WR_PTR_const_net_0;
wire   [2:0] FIFO_RD_PTR_const_net_0;
wire   [2:0] EYE_MONITOR_LANE_WIDTH_const_net_0;
wire   [7:0] TX_DATA_1_const_net_0;
wire   [7:0] TX_DATA_2_const_net_0;
wire   [7:0] TX_DATA_3_const_net_0;
wire   [7:0] TX_DATA_4_const_net_0;
wire   [7:0] TX_DATA_5_const_net_0;
wire   [7:0] TX_DATA_6_const_net_0;
wire   [7:0] TX_DATA_7_const_net_0;
wire   [7:0] TX_DATA_8_const_net_0;
wire   [7:0] TX_DATA_9_const_net_0;
wire   [7:0] TX_DATA_10_const_net_0;
wire   [7:0] TX_DATA_11_const_net_0;
wire   [7:0] TX_DATA_12_const_net_0;
wire   [7:0] TX_DATA_13_const_net_0;
wire   [7:0] TX_DATA_14_const_net_0;
wire   [7:0] TX_DATA_15_const_net_0;
wire   [7:0] TX_DATA_16_const_net_0;
wire   [7:0] TX_DATA_17_const_net_0;
wire   [7:0] TX_DATA_18_const_net_0;
wire   [7:0] TX_DATA_19_const_net_0;
wire   [7:0] TX_DATA_20_const_net_0;
wire   [7:0] TX_DATA_21_const_net_0;
wire   [7:0] TX_DATA_22_const_net_0;
wire   [7:0] TX_DATA_23_const_net_0;
wire   [7:0] TX_DATA_24_const_net_0;
wire   [7:0] TX_DATA_25_const_net_0;
wire   [7:0] TX_DATA_26_const_net_0;
wire   [7:0] TX_DATA_27_const_net_0;
wire   [7:0] TX_DATA_28_const_net_0;
wire   [7:0] TX_DATA_29_const_net_0;
wire   [7:0] TX_DATA_30_const_net_0;
wire   [7:0] TX_DATA_31_const_net_0;
wire   [7:0] TX_DATA_32_const_net_0;
wire   [7:0] TX_DATA_33_const_net_0;
wire   [7:0] TX_DATA_34_const_net_0;
wire   [7:0] TX_DATA_35_const_net_0;
wire   [7:0] TX_DATA_36_const_net_0;
wire   [7:0] TX_DATA_37_const_net_0;
wire   [7:0] TX_DATA_38_const_net_0;
wire   [7:0] TX_DATA_39_const_net_0;
wire   [7:0] TX_DATA_40_const_net_0;
wire   [7:0] TX_DATA_41_const_net_0;
wire   [7:0] TX_DATA_42_const_net_0;
wire   [7:0] TX_DATA_43_const_net_0;
wire   [7:0] TX_DATA_44_const_net_0;
wire   [7:0] TX_DATA_45_const_net_0;
wire   [7:0] TX_DATA_46_const_net_0;
wire   [7:0] TX_DATA_47_const_net_0;
wire   [7:0] TX_DATA_48_const_net_0;
wire   [7:0] TX_DATA_49_const_net_0;
wire   [7:0] TX_DATA_50_const_net_0;
wire   [7:0] TX_DATA_51_const_net_0;
wire   [7:0] TX_DATA_52_const_net_0;
wire   [7:0] TX_DATA_53_const_net_0;
wire   [7:0] TX_DATA_54_const_net_0;
wire   [7:0] TX_DATA_55_const_net_0;
wire   [7:0] TX_DATA_56_const_net_0;
wire   [7:0] TX_DATA_57_const_net_0;
wire   [7:0] TX_DATA_58_const_net_0;
wire   [7:0] TX_DATA_59_const_net_0;
wire   [7:0] TX_DATA_60_const_net_0;
wire   [7:0] TX_DATA_61_const_net_0;
wire   [7:0] TX_DATA_62_const_net_0;
wire   [7:0] TX_DATA_63_const_net_0;
wire   [3:0] OE_DATA_1_const_net_0;
wire   [3:0] OE_DATA_2_const_net_0;
wire   [3:0] OE_DATA_3_const_net_0;
wire   [3:0] OE_DATA_4_const_net_0;
wire   [3:0] OE_DATA_5_const_net_0;
wire   [3:0] OE_DATA_6_const_net_0;
wire   [3:0] OE_DATA_7_const_net_0;
wire   [3:0] OE_DATA_8_const_net_0;
wire   [3:0] OE_DATA_9_const_net_0;
wire   [3:0] OE_DATA_10_const_net_0;
wire   [3:0] OE_DATA_11_const_net_0;
wire   [3:0] OE_DATA_12_const_net_0;
wire   [3:0] OE_DATA_13_const_net_0;
wire   [3:0] OE_DATA_14_const_net_0;
wire   [3:0] OE_DATA_15_const_net_0;
wire   [3:0] OE_DATA_16_const_net_0;
wire   [3:0] OE_DATA_17_const_net_0;
wire   [3:0] OE_DATA_18_const_net_0;
wire   [3:0] OE_DATA_19_const_net_0;
wire   [3:0] OE_DATA_20_const_net_0;
wire   [3:0] OE_DATA_21_const_net_0;
wire   [3:0] OE_DATA_22_const_net_0;
wire   [3:0] OE_DATA_23_const_net_0;
wire   [3:0] OE_DATA_24_const_net_0;
wire   [3:0] OE_DATA_25_const_net_0;
wire   [3:0] OE_DATA_26_const_net_0;
wire   [3:0] OE_DATA_27_const_net_0;
wire   [3:0] OE_DATA_28_const_net_0;
wire   [3:0] OE_DATA_29_const_net_0;
wire   [3:0] OE_DATA_30_const_net_0;
wire   [3:0] OE_DATA_31_const_net_0;
wire   [3:0] OE_DATA_32_const_net_0;
wire   [3:0] OE_DATA_33_const_net_0;
wire   [3:0] OE_DATA_34_const_net_0;
wire   [3:0] OE_DATA_35_const_net_0;
wire   [3:0] OE_DATA_36_const_net_0;
wire   [3:0] OE_DATA_37_const_net_0;
wire   [3:0] OE_DATA_38_const_net_0;
wire   [3:0] OE_DATA_39_const_net_0;
wire   [3:0] OE_DATA_40_const_net_0;
wire   [3:0] OE_DATA_41_const_net_0;
wire   [3:0] OE_DATA_42_const_net_0;
wire   [3:0] OE_DATA_43_const_net_0;
wire   [3:0] OE_DATA_44_const_net_0;
wire   [3:0] OE_DATA_45_const_net_0;
wire   [3:0] OE_DATA_46_const_net_0;
wire   [3:0] OE_DATA_47_const_net_0;
wire   [3:0] OE_DATA_48_const_net_0;
wire   [3:0] OE_DATA_49_const_net_0;
wire   [3:0] OE_DATA_50_const_net_0;
wire   [3:0] OE_DATA_51_const_net_0;
wire   [3:0] OE_DATA_52_const_net_0;
wire   [3:0] OE_DATA_53_const_net_0;
wire   [3:0] OE_DATA_54_const_net_0;
wire   [3:0] OE_DATA_55_const_net_0;
wire   [3:0] OE_DATA_56_const_net_0;
wire   [3:0] OE_DATA_57_const_net_0;
wire   [3:0] OE_DATA_58_const_net_0;
wire   [3:0] OE_DATA_59_const_net_0;
wire   [3:0] OE_DATA_60_const_net_0;
wire   [3:0] OE_DATA_61_const_net_0;
wire   [3:0] OE_DATA_62_const_net_0;
wire   [3:0] OE_DATA_63_const_net_0;
wire   [1:0] RX_DQS_90_const_net_1;
wire   [2:0] FIFO_WR_PTR_const_net_1;
wire   [2:0] FIFO_RD_PTR_const_net_1;
wire   [2:0] EYE_MONITOR_LANE_WIDTH_const_net_1;
wire   [3:0] TX_DATA_1_const_net_1;
wire   [3:0] TX_DATA_2_const_net_1;
wire   [3:0] TX_DATA_3_const_net_1;
wire   [3:0] TX_DATA_4_const_net_1;
wire   [3:0] TX_DATA_5_const_net_1;
wire   [3:0] TX_DATA_6_const_net_1;
wire   [3:0] TX_DATA_7_const_net_1;
wire   [3:0] TX_DATA_8_const_net_1;
wire   [3:0] TX_DATA_9_const_net_1;
wire   [3:0] TX_DATA_10_const_net_1;
wire   [3:0] TX_DATA_11_const_net_1;
wire   [3:0] TX_DATA_12_const_net_1;
wire   [3:0] TX_DATA_13_const_net_1;
wire   [3:0] TX_DATA_14_const_net_1;
wire   [3:0] TX_DATA_15_const_net_1;
wire   [3:0] TX_DATA_16_const_net_1;
wire   [3:0] TX_DATA_17_const_net_1;
wire   [3:0] TX_DATA_18_const_net_1;
wire   [3:0] TX_DATA_19_const_net_1;
wire   [3:0] TX_DATA_20_const_net_1;
wire   [3:0] TX_DATA_21_const_net_1;
wire   [3:0] TX_DATA_22_const_net_1;
wire   [3:0] TX_DATA_23_const_net_1;
wire   [3:0] TX_DATA_24_const_net_1;
wire   [3:0] TX_DATA_25_const_net_1;
wire   [3:0] TX_DATA_26_const_net_1;
wire   [3:0] TX_DATA_27_const_net_1;
wire   [3:0] TX_DATA_28_const_net_1;
wire   [3:0] TX_DATA_29_const_net_1;
wire   [3:0] TX_DATA_30_const_net_1;
wire   [3:0] TX_DATA_31_const_net_1;
wire   [3:0] TX_DATA_32_const_net_1;
wire   [3:0] TX_DATA_33_const_net_1;
wire   [3:0] TX_DATA_34_const_net_1;
wire   [3:0] TX_DATA_35_const_net_1;
wire   [3:0] TX_DATA_36_const_net_1;
wire   [3:0] TX_DATA_37_const_net_1;
wire   [3:0] TX_DATA_38_const_net_1;
wire   [3:0] TX_DATA_39_const_net_1;
wire   [3:0] TX_DATA_40_const_net_1;
wire   [3:0] TX_DATA_41_const_net_1;
wire   [3:0] TX_DATA_42_const_net_1;
wire   [3:0] TX_DATA_43_const_net_1;
wire   [3:0] TX_DATA_44_const_net_1;
wire   [3:0] TX_DATA_45_const_net_1;
wire   [3:0] TX_DATA_46_const_net_1;
wire   [3:0] TX_DATA_47_const_net_1;
wire   [3:0] TX_DATA_48_const_net_1;
wire   [3:0] TX_DATA_49_const_net_1;
wire   [3:0] TX_DATA_50_const_net_1;
wire   [3:0] TX_DATA_51_const_net_1;
wire   [3:0] TX_DATA_52_const_net_1;
wire   [3:0] TX_DATA_53_const_net_1;
wire   [3:0] TX_DATA_54_const_net_1;
wire   [3:0] TX_DATA_55_const_net_1;
wire   [3:0] TX_DATA_56_const_net_1;
wire   [3:0] TX_DATA_57_const_net_1;
wire   [3:0] TX_DATA_58_const_net_1;
wire   [3:0] TX_DATA_59_const_net_1;
wire   [3:0] TX_DATA_60_const_net_1;
wire   [3:0] TX_DATA_61_const_net_1;
wire   [3:0] TX_DATA_62_const_net_1;
wire   [3:0] TX_DATA_63_const_net_1;
wire   [1:0] OE_DATA_1_const_net_1;
wire   [1:0] OE_DATA_2_const_net_1;
wire   [1:0] OE_DATA_3_const_net_1;
wire   [1:0] OE_DATA_4_const_net_1;
wire   [1:0] OE_DATA_5_const_net_1;
wire   [1:0] OE_DATA_6_const_net_1;
wire   [1:0] OE_DATA_7_const_net_1;
wire   [1:0] OE_DATA_8_const_net_1;
wire   [1:0] OE_DATA_9_const_net_1;
wire   [1:0] OE_DATA_10_const_net_1;
wire   [1:0] OE_DATA_11_const_net_1;
wire   [1:0] OE_DATA_12_const_net_1;
wire   [1:0] OE_DATA_13_const_net_1;
wire   [1:0] OE_DATA_14_const_net_1;
wire   [1:0] OE_DATA_15_const_net_1;
wire   [1:0] OE_DATA_16_const_net_1;
wire   [1:0] OE_DATA_17_const_net_1;
wire   [1:0] OE_DATA_18_const_net_1;
wire   [1:0] OE_DATA_19_const_net_1;
wire   [1:0] OE_DATA_20_const_net_1;
wire   [1:0] OE_DATA_21_const_net_1;
wire   [1:0] OE_DATA_22_const_net_1;
wire   [1:0] OE_DATA_23_const_net_1;
wire   [1:0] OE_DATA_24_const_net_1;
wire   [1:0] OE_DATA_25_const_net_1;
wire   [1:0] OE_DATA_26_const_net_1;
wire   [1:0] OE_DATA_27_const_net_1;
wire   [1:0] OE_DATA_28_const_net_1;
wire   [1:0] OE_DATA_29_const_net_1;
wire   [1:0] OE_DATA_30_const_net_1;
wire   [1:0] OE_DATA_31_const_net_1;
wire   [1:0] OE_DATA_32_const_net_1;
wire   [1:0] OE_DATA_33_const_net_1;
wire   [1:0] OE_DATA_34_const_net_1;
wire   [1:0] OE_DATA_35_const_net_1;
wire   [1:0] OE_DATA_36_const_net_1;
wire   [1:0] OE_DATA_37_const_net_1;
wire   [1:0] OE_DATA_38_const_net_1;
wire   [1:0] OE_DATA_39_const_net_1;
wire   [1:0] OE_DATA_40_const_net_1;
wire   [1:0] OE_DATA_41_const_net_1;
wire   [1:0] OE_DATA_42_const_net_1;
wire   [1:0] OE_DATA_43_const_net_1;
wire   [1:0] OE_DATA_44_const_net_1;
wire   [1:0] OE_DATA_45_const_net_1;
wire   [1:0] OE_DATA_46_const_net_1;
wire   [1:0] OE_DATA_47_const_net_1;
wire   [1:0] OE_DATA_48_const_net_1;
wire   [1:0] OE_DATA_49_const_net_1;
wire   [1:0] OE_DATA_50_const_net_1;
wire   [1:0] OE_DATA_51_const_net_1;
wire   [1:0] OE_DATA_52_const_net_1;
wire   [1:0] OE_DATA_53_const_net_1;
wire   [1:0] OE_DATA_54_const_net_1;
wire   [1:0] OE_DATA_55_const_net_1;
wire   [1:0] OE_DATA_56_const_net_1;
wire   [1:0] OE_DATA_57_const_net_1;
wire   [1:0] OE_DATA_58_const_net_1;
wire   [1:0] OE_DATA_59_const_net_1;
wire   [1:0] OE_DATA_60_const_net_1;
wire   [1:0] OE_DATA_61_const_net_1;
wire   [1:0] OE_DATA_62_const_net_1;
wire   [1:0] OE_DATA_63_const_net_1;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire         HS_IO_CLK_PAUSE_IN_POST_INV0_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                            = 1'b0;
assign VCC_net                            = 1'b1;
assign OE_DATA_0_const_net_0              = 4'hF;
assign TX_DATA_0_const_net_0              = 4'h5;
assign OE_DATA_0_const_net_1              = 2'h3;
assign DLL_CODE_const_net_0               = 8'h00;
assign READ_CLK_SEL_const_net_0           = 3'h0;
assign EYE_MONITOR_WIDTH_IN_const_net_0   = 3'h0;
assign CDR_CLK_A_SEL_const_net_0          = 8'h00;
assign CDR_CLK_B_SEL_const_net_0          = 11'h000;
assign RX_DQS_90_const_net_0              = 2'h0;
assign FIFO_WR_PTR_const_net_0            = 3'h0;
assign FIFO_RD_PTR_const_net_0            = 3'h0;
assign EYE_MONITOR_LANE_WIDTH_const_net_0 = 3'h0;
assign TX_DATA_1_const_net_0              = 8'h00;
assign TX_DATA_2_const_net_0              = 8'h00;
assign TX_DATA_3_const_net_0              = 8'h00;
assign TX_DATA_4_const_net_0              = 8'h00;
assign TX_DATA_5_const_net_0              = 8'h00;
assign TX_DATA_6_const_net_0              = 8'h00;
assign TX_DATA_7_const_net_0              = 8'h00;
assign TX_DATA_8_const_net_0              = 8'h00;
assign TX_DATA_9_const_net_0              = 8'h00;
assign TX_DATA_10_const_net_0             = 8'h00;
assign TX_DATA_11_const_net_0             = 8'h00;
assign TX_DATA_12_const_net_0             = 8'h00;
assign TX_DATA_13_const_net_0             = 8'h00;
assign TX_DATA_14_const_net_0             = 8'h00;
assign TX_DATA_15_const_net_0             = 8'h00;
assign TX_DATA_16_const_net_0             = 8'h00;
assign TX_DATA_17_const_net_0             = 8'h00;
assign TX_DATA_18_const_net_0             = 8'h00;
assign TX_DATA_19_const_net_0             = 8'h00;
assign TX_DATA_20_const_net_0             = 8'h00;
assign TX_DATA_21_const_net_0             = 8'h00;
assign TX_DATA_22_const_net_0             = 8'h00;
assign TX_DATA_23_const_net_0             = 8'h00;
assign TX_DATA_24_const_net_0             = 8'h00;
assign TX_DATA_25_const_net_0             = 8'h00;
assign TX_DATA_26_const_net_0             = 8'h00;
assign TX_DATA_27_const_net_0             = 8'h00;
assign TX_DATA_28_const_net_0             = 8'h00;
assign TX_DATA_29_const_net_0             = 8'h00;
assign TX_DATA_30_const_net_0             = 8'h00;
assign TX_DATA_31_const_net_0             = 8'h00;
assign TX_DATA_32_const_net_0             = 8'h00;
assign TX_DATA_33_const_net_0             = 8'h00;
assign TX_DATA_34_const_net_0             = 8'h00;
assign TX_DATA_35_const_net_0             = 8'h00;
assign TX_DATA_36_const_net_0             = 8'h00;
assign TX_DATA_37_const_net_0             = 8'h00;
assign TX_DATA_38_const_net_0             = 8'h00;
assign TX_DATA_39_const_net_0             = 8'h00;
assign TX_DATA_40_const_net_0             = 8'h00;
assign TX_DATA_41_const_net_0             = 8'h00;
assign TX_DATA_42_const_net_0             = 8'h00;
assign TX_DATA_43_const_net_0             = 8'h00;
assign TX_DATA_44_const_net_0             = 8'h00;
assign TX_DATA_45_const_net_0             = 8'h00;
assign TX_DATA_46_const_net_0             = 8'h00;
assign TX_DATA_47_const_net_0             = 8'h00;
assign TX_DATA_48_const_net_0             = 8'h00;
assign TX_DATA_49_const_net_0             = 8'h00;
assign TX_DATA_50_const_net_0             = 8'h00;
assign TX_DATA_51_const_net_0             = 8'h00;
assign TX_DATA_52_const_net_0             = 8'h00;
assign TX_DATA_53_const_net_0             = 8'h00;
assign TX_DATA_54_const_net_0             = 8'h00;
assign TX_DATA_55_const_net_0             = 8'h00;
assign TX_DATA_56_const_net_0             = 8'h00;
assign TX_DATA_57_const_net_0             = 8'h00;
assign TX_DATA_58_const_net_0             = 8'h00;
assign TX_DATA_59_const_net_0             = 8'h00;
assign TX_DATA_60_const_net_0             = 8'h00;
assign TX_DATA_61_const_net_0             = 8'h00;
assign TX_DATA_62_const_net_0             = 8'h00;
assign TX_DATA_63_const_net_0             = 8'h00;
assign OE_DATA_1_const_net_0              = 4'h0;
assign OE_DATA_2_const_net_0              = 4'h0;
assign OE_DATA_3_const_net_0              = 4'h0;
assign OE_DATA_4_const_net_0              = 4'h0;
assign OE_DATA_5_const_net_0              = 4'h0;
assign OE_DATA_6_const_net_0              = 4'h0;
assign OE_DATA_7_const_net_0              = 4'h0;
assign OE_DATA_8_const_net_0              = 4'h0;
assign OE_DATA_9_const_net_0              = 4'h0;
assign OE_DATA_10_const_net_0             = 4'h0;
assign OE_DATA_11_const_net_0             = 4'h0;
assign OE_DATA_12_const_net_0             = 4'h0;
assign OE_DATA_13_const_net_0             = 4'h0;
assign OE_DATA_14_const_net_0             = 4'h0;
assign OE_DATA_15_const_net_0             = 4'h0;
assign OE_DATA_16_const_net_0             = 4'h0;
assign OE_DATA_17_const_net_0             = 4'h0;
assign OE_DATA_18_const_net_0             = 4'h0;
assign OE_DATA_19_const_net_0             = 4'h0;
assign OE_DATA_20_const_net_0             = 4'h0;
assign OE_DATA_21_const_net_0             = 4'h0;
assign OE_DATA_22_const_net_0             = 4'h0;
assign OE_DATA_23_const_net_0             = 4'h0;
assign OE_DATA_24_const_net_0             = 4'h0;
assign OE_DATA_25_const_net_0             = 4'h0;
assign OE_DATA_26_const_net_0             = 4'h0;
assign OE_DATA_27_const_net_0             = 4'h0;
assign OE_DATA_28_const_net_0             = 4'h0;
assign OE_DATA_29_const_net_0             = 4'h0;
assign OE_DATA_30_const_net_0             = 4'h0;
assign OE_DATA_31_const_net_0             = 4'h0;
assign OE_DATA_32_const_net_0             = 4'h0;
assign OE_DATA_33_const_net_0             = 4'h0;
assign OE_DATA_34_const_net_0             = 4'h0;
assign OE_DATA_35_const_net_0             = 4'h0;
assign OE_DATA_36_const_net_0             = 4'h0;
assign OE_DATA_37_const_net_0             = 4'h0;
assign OE_DATA_38_const_net_0             = 4'h0;
assign OE_DATA_39_const_net_0             = 4'h0;
assign OE_DATA_40_const_net_0             = 4'h0;
assign OE_DATA_41_const_net_0             = 4'h0;
assign OE_DATA_42_const_net_0             = 4'h0;
assign OE_DATA_43_const_net_0             = 4'h0;
assign OE_DATA_44_const_net_0             = 4'h0;
assign OE_DATA_45_const_net_0             = 4'h0;
assign OE_DATA_46_const_net_0             = 4'h0;
assign OE_DATA_47_const_net_0             = 4'h0;
assign OE_DATA_48_const_net_0             = 4'h0;
assign OE_DATA_49_const_net_0             = 4'h0;
assign OE_DATA_50_const_net_0             = 4'h0;
assign OE_DATA_51_const_net_0             = 4'h0;
assign OE_DATA_52_const_net_0             = 4'h0;
assign OE_DATA_53_const_net_0             = 4'h0;
assign OE_DATA_54_const_net_0             = 4'h0;
assign OE_DATA_55_const_net_0             = 4'h0;
assign OE_DATA_56_const_net_0             = 4'h0;
assign OE_DATA_57_const_net_0             = 4'h0;
assign OE_DATA_58_const_net_0             = 4'h0;
assign OE_DATA_59_const_net_0             = 4'h0;
assign OE_DATA_60_const_net_0             = 4'h0;
assign OE_DATA_61_const_net_0             = 4'h0;
assign OE_DATA_62_const_net_0             = 4'h0;
assign OE_DATA_63_const_net_0             = 4'h0;
assign RX_DQS_90_const_net_1              = 2'h0;
assign FIFO_WR_PTR_const_net_1            = 3'h0;
assign FIFO_RD_PTR_const_net_1            = 3'h0;
assign EYE_MONITOR_LANE_WIDTH_const_net_1 = 3'h0;
assign TX_DATA_1_const_net_1              = 4'h0;
assign TX_DATA_2_const_net_1              = 4'h0;
assign TX_DATA_3_const_net_1              = 4'h0;
assign TX_DATA_4_const_net_1              = 4'h0;
assign TX_DATA_5_const_net_1              = 4'h0;
assign TX_DATA_6_const_net_1              = 4'h0;
assign TX_DATA_7_const_net_1              = 4'h0;
assign TX_DATA_8_const_net_1              = 4'h0;
assign TX_DATA_9_const_net_1              = 4'h0;
assign TX_DATA_10_const_net_1             = 4'h0;
assign TX_DATA_11_const_net_1             = 4'h0;
assign TX_DATA_12_const_net_1             = 4'h0;
assign TX_DATA_13_const_net_1             = 4'h0;
assign TX_DATA_14_const_net_1             = 4'h0;
assign TX_DATA_15_const_net_1             = 4'h0;
assign TX_DATA_16_const_net_1             = 4'h0;
assign TX_DATA_17_const_net_1             = 4'h0;
assign TX_DATA_18_const_net_1             = 4'h0;
assign TX_DATA_19_const_net_1             = 4'h0;
assign TX_DATA_20_const_net_1             = 4'h0;
assign TX_DATA_21_const_net_1             = 4'h0;
assign TX_DATA_22_const_net_1             = 4'h0;
assign TX_DATA_23_const_net_1             = 4'h0;
assign TX_DATA_24_const_net_1             = 4'h0;
assign TX_DATA_25_const_net_1             = 4'h0;
assign TX_DATA_26_const_net_1             = 4'h0;
assign TX_DATA_27_const_net_1             = 4'h0;
assign TX_DATA_28_const_net_1             = 4'h0;
assign TX_DATA_29_const_net_1             = 4'h0;
assign TX_DATA_30_const_net_1             = 4'h0;
assign TX_DATA_31_const_net_1             = 4'h0;
assign TX_DATA_32_const_net_1             = 4'h0;
assign TX_DATA_33_const_net_1             = 4'h0;
assign TX_DATA_34_const_net_1             = 4'h0;
assign TX_DATA_35_const_net_1             = 4'h0;
assign TX_DATA_36_const_net_1             = 4'h0;
assign TX_DATA_37_const_net_1             = 4'h0;
assign TX_DATA_38_const_net_1             = 4'h0;
assign TX_DATA_39_const_net_1             = 4'h0;
assign TX_DATA_40_const_net_1             = 4'h0;
assign TX_DATA_41_const_net_1             = 4'h0;
assign TX_DATA_42_const_net_1             = 4'h0;
assign TX_DATA_43_const_net_1             = 4'h0;
assign TX_DATA_44_const_net_1             = 4'h0;
assign TX_DATA_45_const_net_1             = 4'h0;
assign TX_DATA_46_const_net_1             = 4'h0;
assign TX_DATA_47_const_net_1             = 4'h0;
assign TX_DATA_48_const_net_1             = 4'h0;
assign TX_DATA_49_const_net_1             = 4'h0;
assign TX_DATA_50_const_net_1             = 4'h0;
assign TX_DATA_51_const_net_1             = 4'h0;
assign TX_DATA_52_const_net_1             = 4'h0;
assign TX_DATA_53_const_net_1             = 4'h0;
assign TX_DATA_54_const_net_1             = 4'h0;
assign TX_DATA_55_const_net_1             = 4'h0;
assign TX_DATA_56_const_net_1             = 4'h0;
assign TX_DATA_57_const_net_1             = 4'h0;
assign TX_DATA_58_const_net_1             = 4'h0;
assign TX_DATA_59_const_net_1             = 4'h0;
assign TX_DATA_60_const_net_1             = 4'h0;
assign TX_DATA_61_const_net_1             = 4'h0;
assign TX_DATA_62_const_net_1             = 4'h0;
assign TX_DATA_63_const_net_1             = 4'h0;
assign OE_DATA_1_const_net_1              = 2'h0;
assign OE_DATA_2_const_net_1              = 2'h0;
assign OE_DATA_3_const_net_1              = 2'h0;
assign OE_DATA_4_const_net_1              = 2'h0;
assign OE_DATA_5_const_net_1              = 2'h0;
assign OE_DATA_6_const_net_1              = 2'h0;
assign OE_DATA_7_const_net_1              = 2'h0;
assign OE_DATA_8_const_net_1              = 2'h0;
assign OE_DATA_9_const_net_1              = 2'h0;
assign OE_DATA_10_const_net_1             = 2'h0;
assign OE_DATA_11_const_net_1             = 2'h0;
assign OE_DATA_12_const_net_1             = 2'h0;
assign OE_DATA_13_const_net_1             = 2'h0;
assign OE_DATA_14_const_net_1             = 2'h0;
assign OE_DATA_15_const_net_1             = 2'h0;
assign OE_DATA_16_const_net_1             = 2'h0;
assign OE_DATA_17_const_net_1             = 2'h0;
assign OE_DATA_18_const_net_1             = 2'h0;
assign OE_DATA_19_const_net_1             = 2'h0;
assign OE_DATA_20_const_net_1             = 2'h0;
assign OE_DATA_21_const_net_1             = 2'h0;
assign OE_DATA_22_const_net_1             = 2'h0;
assign OE_DATA_23_const_net_1             = 2'h0;
assign OE_DATA_24_const_net_1             = 2'h0;
assign OE_DATA_25_const_net_1             = 2'h0;
assign OE_DATA_26_const_net_1             = 2'h0;
assign OE_DATA_27_const_net_1             = 2'h0;
assign OE_DATA_28_const_net_1             = 2'h0;
assign OE_DATA_29_const_net_1             = 2'h0;
assign OE_DATA_30_const_net_1             = 2'h0;
assign OE_DATA_31_const_net_1             = 2'h0;
assign OE_DATA_32_const_net_1             = 2'h0;
assign OE_DATA_33_const_net_1             = 2'h0;
assign OE_DATA_34_const_net_1             = 2'h0;
assign OE_DATA_35_const_net_1             = 2'h0;
assign OE_DATA_36_const_net_1             = 2'h0;
assign OE_DATA_37_const_net_1             = 2'h0;
assign OE_DATA_38_const_net_1             = 2'h0;
assign OE_DATA_39_const_net_1             = 2'h0;
assign OE_DATA_40_const_net_1             = 2'h0;
assign OE_DATA_41_const_net_1             = 2'h0;
assign OE_DATA_42_const_net_1             = 2'h0;
assign OE_DATA_43_const_net_1             = 2'h0;
assign OE_DATA_44_const_net_1             = 2'h0;
assign OE_DATA_45_const_net_1             = 2'h0;
assign OE_DATA_46_const_net_1             = 2'h0;
assign OE_DATA_47_const_net_1             = 2'h0;
assign OE_DATA_48_const_net_1             = 2'h0;
assign OE_DATA_49_const_net_1             = 2'h0;
assign OE_DATA_50_const_net_1             = 2'h0;
assign OE_DATA_51_const_net_1             = 2'h0;
assign OE_DATA_52_const_net_1             = 2'h0;
assign OE_DATA_53_const_net_1             = 2'h0;
assign OE_DATA_54_const_net_1             = 2'h0;
assign OE_DATA_55_const_net_1             = 2'h0;
assign OE_DATA_56_const_net_1             = 2'h0;
assign OE_DATA_57_const_net_1             = 2'h0;
assign OE_DATA_58_const_net_1             = 2'h0;
assign OE_DATA_59_const_net_1             = 2'h0;
assign OE_DATA_60_const_net_1             = 2'h0;
assign OE_DATA_61_const_net_1             = 2'h0;
assign OE_DATA_62_const_net_1             = 2'h0;
assign OE_DATA_63_const_net_1             = 2'h0;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign HS_IO_CLK_PAUSE_IN_POST_INV0_0 = ~ DFN1_PAUSE_S2_Q;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign TX_CLK_net_1   = TX_CLK_net_0[0];
assign TX_CLK         = TX_CLK_net_1;
assign TX_CLK_N_net_1 = TX_CLK_N_net_0[0];
assign TX_CLK_N       = TX_CLK_N_net_1;
assign TXD_net_1[0]   = TXD_net_0[0];
assign TXD[0:0]       = TXD_net_1[0];
assign TXD_N_net_1[0] = TXD_N_net_0[0];
assign TXD_N[0:0]     = TXD_N_net_1[0];
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------DFN1C0
DFN1C0 DFN1_PAUSE_S0(
        // Inputs
        .D   ( ARST_N ),
        .CLK ( TX_CLK_G ),
        .CLR ( ARST_N ),
        // Outputs
        .Q   ( DFN1_PAUSE_S0_Q ) 
        );

//--------DFN1C0
DFN1C0 DFN1_PAUSE_S1(
        // Inputs
        .D   ( DFN1_PAUSE_S0_Q ),
        .CLK ( TX_CLK_G ),
        .CLR ( ARST_N ),
        // Outputs
        .Q   ( DFN1_PAUSE_S1_Q ) 
        );

//--------DFN1C0
DFN1C0 DFN1_PAUSE_S2(
        // Inputs
        .D   ( DFN1_PAUSE_S1_Q ),
        .CLK ( TX_CLK_G ),
        .CLR ( ARST_N ),
        // Outputs
        .Q   ( DFN1_PAUSE_S2_Q ) 
        );

//--------IOG_IOD_DDRTX4_LANECTRL_ADDR_CMD_0_PF_LANECTRL   -   Actel:SgCore:PF_LANECTRL:1.0.204
IOG_IOD_DDRTX4_LANECTRL_ADDR_CMD_0_PF_LANECTRL LANECTRL_ADDR_CMD_0(
        // Inputs
        .HS_IO_CLK                  ( HS_IO_CLK ),
        .FAB_CLK                    ( TX_CLK_G ),
        .RESET                      ( GND_net ),
        .DDR_READ                   ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_SEL             ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_LOAD            ( VCC_net ),
        .DELAY_LINE_DIRECTION       ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_MOVE            ( GND_net ), // tied to 1'b0 from definition
        .HS_IO_CLK_PAUSE            ( HS_IO_CLK_PAUSE_IN_POST_INV0_0 ),
        .EYE_MONITOR_WIDTH_IN       ( EYE_MONITOR_WIDTH_IN_const_net_0 ), // tied to 3'h0 from definition
        .CDR_CLK_A_SEL              ( CDR_CLK_A_SEL_const_net_0 ), // tied to 8'h00 from definition
        // Outputs
        .EYE_MONITOR_WIDTH_OUT      (  ),
        .RX_DQS_90                  (  ),
        .TX_DQS                     ( LANECTRL_ADDR_CMD_0_TX_DQS ),
        .TX_DQS_270                 ( LANECTRL_ADDR_CMD_0_TX_DQS_270 ),
        .FIFO_WR_PTR                (  ),
        .FIFO_RD_PTR                (  ),
        .ARST_N                     ( LANECTRL_ADDR_CMD_0_ARST_N ),
        .RX_SYNC_RST                ( LANECTRL_ADDR_CMD_0_RX_SYNC_RST ),
        .TX_SYNC_RST                ( LANECTRL_ADDR_CMD_0_TX_SYNC_RST ),
        .RX_DATA_VALID              (  ),
        .RX_BURST_DETECT            (  ),
        .RX_DELAY_LINE_OUT_OF_RANGE (  ),
        .TX_DELAY_LINE_OUT_OF_RANGE (  ),
        .A_OUT_RST_N                (  ) 
        );

//--------IOG_IOD_DDRTX4_PF_IOD_TX_PF_IOD   -   Actel:SgCore:PF_IOD:1.0.214
IOG_IOD_DDRTX4_PF_IOD_TX_PF_IOD PF_IOD_TX(
        // Inputs
        .ARST_N      ( LANECTRL_ADDR_CMD_0_ARST_N ),
        .RX_SYNC_RST ( LANECTRL_ADDR_CMD_0_RX_SYNC_RST ),
        .TX_SYNC_RST ( LANECTRL_ADDR_CMD_0_TX_SYNC_RST ),
        .HS_IO_CLK   ( HS_IO_CLK ),
        .TX_DQS      ( LANECTRL_ADDR_CMD_0_TX_DQS ),
        .TX_DQS_270  ( LANECTRL_ADDR_CMD_0_TX_DQS_270 ),
        .TX_DATA_0   ( L0_TXD_DATA ),
        .OE_DATA_0   ( OE_DATA_0_const_net_0 ),
        .FAB_CLK     ( TX_CLK_G ),
        .ODT_EN_0    ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .PAD_O       ( TXD_net_0 ),
        .PAD_O_N     ( TXD_N_net_0 ) 
        );

//--------IOG_IOD_DDRTX4_PF_IOD_TX_CLK_PF_IOD   -   Actel:SgCore:PF_IOD:1.0.214
IOG_IOD_DDRTX4_PF_IOD_TX_CLK_PF_IOD PF_IOD_TX_CLK(
        // Inputs
        .ARST_N      ( LANECTRL_ADDR_CMD_0_ARST_N ),
        .RX_SYNC_RST ( LANECTRL_ADDR_CMD_0_RX_SYNC_RST ),
        .TX_SYNC_RST ( LANECTRL_ADDR_CMD_0_TX_SYNC_RST ),
        .HS_IO_CLK   ( HS_IO_CLK ),
        .TX_DQS      ( LANECTRL_ADDR_CMD_0_TX_DQS ),
        .TX_DQS_270  ( LANECTRL_ADDR_CMD_0_TX_DQS_270 ),
        .TX_DATA_0   ( TX_DATA_0_const_net_0 ),
        .OE_DATA_0   ( OE_DATA_0_const_net_1 ),
        .FAB_CLK     ( TX_CLK_G ),
        .ODT_EN_0    ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .PAD_O       ( TX_CLK_net_0 ),
        .PAD_O_N     ( TX_CLK_N_net_0 ) 
        );


endmodule
