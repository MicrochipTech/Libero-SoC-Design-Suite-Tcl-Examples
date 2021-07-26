//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sat Dec 21 19:40:33 2019
// Version: v12.2 12.700.0.21
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// PF_IOD_GENERIC_TX_C0
module PF_IOD_GENERIC_TX_C0(
    // Inputs
    HS_IO_CLK,
    HS_IO_CLK_90,
    HS_IO_CLK_PAUSE,
    TXD_DATA,
    TX_CLK_G,
    // Outputs
    CLK_ALIGN_IOD_RX,
    TXD,
    TXD_N,
    TX_CLK,
    TX_CLK_N
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        HS_IO_CLK;
input        HS_IO_CLK_90;
input        HS_IO_CLK_PAUSE;
input  [3:0] TXD_DATA;
input        TX_CLK_G;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [1:0] CLK_ALIGN_IOD_RX;
output [0:0] TXD;
output [0:0] TXD_N;
output       TX_CLK;
output       TX_CLK_N;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [0:0] CLK_ALIGN_IOD_RX_net_0;
wire   [2:2] CLK_ALIGN_IOD_RX_0;
wire         HS_IO_CLK;
wire         HS_IO_CLK_90;
wire         HS_IO_CLK_PAUSE;
wire         LANECTRL_ADDR_CMD_0_ARST_N;
wire         LANECTRL_ADDR_CMD_0_RX_SYNC_RST;
wire         LANECTRL_ADDR_CMD_0_TX_DQS;
wire         LANECTRL_ADDR_CMD_0_TX_DQS_270;
wire         LANECTRL_ADDR_CMD_0_TX_SYNC_RST;
wire   [0:0] TX_CLK_net_0;
wire         TX_CLK_G;
wire   [0:0] TX_CLK_N_net_0;
wire   [0:0] TXD_net_0;
wire   [0:0] TXD_DATA_slice_0;
wire   [1:1] TXD_DATA_slice_1;
wire   [2:2] TXD_DATA_slice_2;
wire   [3:3] TXD_DATA_slice_3;
wire   [0:0] TXD_N_net_0;
wire         TX_CLK_net_1;
wire         TX_CLK_N_net_1;
wire   [0:0] TXD_net_1;
wire   [0:0] TXD_N_net_1;
wire   [0:0] CLK_ALIGN_IOD_RX_net_1;
wire   [1:1] CLK_ALIGN_IOD_RX_0_net_0;
wire   [1:0] HS_IO_CLK_net_0;
wire   [3:0] TX_DATA_0_net_0;
wire   [3:0] TXD_DATA;
wire   [3:0] RX_DATA_0_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
wire         VCC_net;
wire   [1:0] OE_DATA_0_const_net_0;
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
wire   [3:0] TX_DATA_0_const_net_1;
wire   [3:0] TX_DATA_1_const_net_0;
wire   [3:0] TX_DATA_2_const_net_0;
wire   [3:0] TX_DATA_3_const_net_0;
wire   [3:0] TX_DATA_4_const_net_0;
wire   [3:0] TX_DATA_5_const_net_0;
wire   [3:0] TX_DATA_6_const_net_0;
wire   [3:0] TX_DATA_7_const_net_0;
wire   [3:0] TX_DATA_8_const_net_0;
wire   [3:0] TX_DATA_9_const_net_0;
wire   [3:0] TX_DATA_10_const_net_0;
wire   [3:0] TX_DATA_11_const_net_0;
wire   [3:0] TX_DATA_12_const_net_0;
wire   [3:0] TX_DATA_13_const_net_0;
wire   [3:0] TX_DATA_14_const_net_0;
wire   [3:0] TX_DATA_15_const_net_0;
wire   [3:0] TX_DATA_16_const_net_0;
wire   [3:0] TX_DATA_17_const_net_0;
wire   [3:0] TX_DATA_18_const_net_0;
wire   [3:0] TX_DATA_19_const_net_0;
wire   [3:0] TX_DATA_20_const_net_0;
wire   [3:0] TX_DATA_21_const_net_0;
wire   [3:0] TX_DATA_22_const_net_0;
wire   [3:0] TX_DATA_23_const_net_0;
wire   [3:0] TX_DATA_24_const_net_0;
wire   [3:0] TX_DATA_25_const_net_0;
wire   [3:0] TX_DATA_26_const_net_0;
wire   [3:0] TX_DATA_27_const_net_0;
wire   [3:0] TX_DATA_28_const_net_0;
wire   [3:0] TX_DATA_29_const_net_0;
wire   [3:0] TX_DATA_30_const_net_0;
wire   [3:0] TX_DATA_31_const_net_0;
wire   [3:0] TX_DATA_32_const_net_0;
wire   [3:0] TX_DATA_33_const_net_0;
wire   [3:0] TX_DATA_34_const_net_0;
wire   [3:0] TX_DATA_35_const_net_0;
wire   [3:0] TX_DATA_36_const_net_0;
wire   [3:0] TX_DATA_37_const_net_0;
wire   [3:0] TX_DATA_38_const_net_0;
wire   [3:0] TX_DATA_39_const_net_0;
wire   [3:0] TX_DATA_40_const_net_0;
wire   [3:0] TX_DATA_41_const_net_0;
wire   [3:0] TX_DATA_42_const_net_0;
wire   [3:0] TX_DATA_43_const_net_0;
wire   [3:0] TX_DATA_44_const_net_0;
wire   [3:0] TX_DATA_45_const_net_0;
wire   [3:0] TX_DATA_46_const_net_0;
wire   [3:0] TX_DATA_47_const_net_0;
wire   [3:0] TX_DATA_48_const_net_0;
wire   [3:0] TX_DATA_49_const_net_0;
wire   [3:0] TX_DATA_50_const_net_0;
wire   [3:0] TX_DATA_51_const_net_0;
wire   [3:0] TX_DATA_52_const_net_0;
wire   [3:0] TX_DATA_53_const_net_0;
wire   [3:0] TX_DATA_54_const_net_0;
wire   [3:0] TX_DATA_55_const_net_0;
wire   [3:0] TX_DATA_56_const_net_0;
wire   [3:0] TX_DATA_57_const_net_0;
wire   [3:0] TX_DATA_58_const_net_0;
wire   [3:0] TX_DATA_59_const_net_0;
wire   [3:0] TX_DATA_60_const_net_0;
wire   [3:0] TX_DATA_61_const_net_0;
wire   [3:0] TX_DATA_62_const_net_0;
wire   [3:0] TX_DATA_63_const_net_0;
wire   [1:0] OE_DATA_0_const_net_2;
wire   [1:0] OE_DATA_1_const_net_0;
wire   [1:0] OE_DATA_2_const_net_0;
wire   [1:0] OE_DATA_3_const_net_0;
wire   [1:0] OE_DATA_4_const_net_0;
wire   [1:0] OE_DATA_5_const_net_0;
wire   [1:0] OE_DATA_6_const_net_0;
wire   [1:0] OE_DATA_7_const_net_0;
wire   [1:0] OE_DATA_8_const_net_0;
wire   [1:0] OE_DATA_9_const_net_0;
wire   [1:0] OE_DATA_10_const_net_0;
wire   [1:0] OE_DATA_11_const_net_0;
wire   [1:0] OE_DATA_12_const_net_0;
wire   [1:0] OE_DATA_13_const_net_0;
wire   [1:0] OE_DATA_14_const_net_0;
wire   [1:0] OE_DATA_15_const_net_0;
wire   [1:0] OE_DATA_16_const_net_0;
wire   [1:0] OE_DATA_17_const_net_0;
wire   [1:0] OE_DATA_18_const_net_0;
wire   [1:0] OE_DATA_19_const_net_0;
wire   [1:0] OE_DATA_20_const_net_0;
wire   [1:0] OE_DATA_21_const_net_0;
wire   [1:0] OE_DATA_22_const_net_0;
wire   [1:0] OE_DATA_23_const_net_0;
wire   [1:0] OE_DATA_24_const_net_0;
wire   [1:0] OE_DATA_25_const_net_0;
wire   [1:0] OE_DATA_26_const_net_0;
wire   [1:0] OE_DATA_27_const_net_0;
wire   [1:0] OE_DATA_28_const_net_0;
wire   [1:0] OE_DATA_29_const_net_0;
wire   [1:0] OE_DATA_30_const_net_0;
wire   [1:0] OE_DATA_31_const_net_0;
wire   [1:0] OE_DATA_32_const_net_0;
wire   [1:0] OE_DATA_33_const_net_0;
wire   [1:0] OE_DATA_34_const_net_0;
wire   [1:0] OE_DATA_35_const_net_0;
wire   [1:0] OE_DATA_36_const_net_0;
wire   [1:0] OE_DATA_37_const_net_0;
wire   [1:0] OE_DATA_38_const_net_0;
wire   [1:0] OE_DATA_39_const_net_0;
wire   [1:0] OE_DATA_40_const_net_0;
wire   [1:0] OE_DATA_41_const_net_0;
wire   [1:0] OE_DATA_42_const_net_0;
wire   [1:0] OE_DATA_43_const_net_0;
wire   [1:0] OE_DATA_44_const_net_0;
wire   [1:0] OE_DATA_45_const_net_0;
wire   [1:0] OE_DATA_46_const_net_0;
wire   [1:0] OE_DATA_47_const_net_0;
wire   [1:0] OE_DATA_48_const_net_0;
wire   [1:0] OE_DATA_49_const_net_0;
wire   [1:0] OE_DATA_50_const_net_0;
wire   [1:0] OE_DATA_51_const_net_0;
wire   [1:0] OE_DATA_52_const_net_0;
wire   [1:0] OE_DATA_53_const_net_0;
wire   [1:0] OE_DATA_54_const_net_0;
wire   [1:0] OE_DATA_55_const_net_0;
wire   [1:0] OE_DATA_56_const_net_0;
wire   [1:0] OE_DATA_57_const_net_0;
wire   [1:0] OE_DATA_58_const_net_0;
wire   [1:0] OE_DATA_59_const_net_0;
wire   [1:0] OE_DATA_60_const_net_0;
wire   [1:0] OE_DATA_61_const_net_0;
wire   [1:0] OE_DATA_62_const_net_0;
wire   [1:0] OE_DATA_63_const_net_0;
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
wire   [1:0] RX_DQS_90_const_net_2;
wire   [2:0] FIFO_WR_PTR_const_net_2;
wire   [2:0] FIFO_RD_PTR_const_net_2;
wire   [2:0] EYE_MONITOR_LANE_WIDTH_const_net_2;
wire   [3:0] TX_DATA_1_const_net_2;
wire   [3:0] TX_DATA_2_const_net_2;
wire   [3:0] TX_DATA_3_const_net_2;
wire   [3:0] TX_DATA_4_const_net_2;
wire   [3:0] TX_DATA_5_const_net_2;
wire   [3:0] TX_DATA_6_const_net_2;
wire   [3:0] TX_DATA_7_const_net_2;
wire   [3:0] TX_DATA_8_const_net_2;
wire   [3:0] TX_DATA_9_const_net_2;
wire   [3:0] TX_DATA_10_const_net_2;
wire   [3:0] TX_DATA_11_const_net_2;
wire   [3:0] TX_DATA_12_const_net_2;
wire   [3:0] TX_DATA_13_const_net_2;
wire   [3:0] TX_DATA_14_const_net_2;
wire   [3:0] TX_DATA_15_const_net_2;
wire   [3:0] TX_DATA_16_const_net_2;
wire   [3:0] TX_DATA_17_const_net_2;
wire   [3:0] TX_DATA_18_const_net_2;
wire   [3:0] TX_DATA_19_const_net_2;
wire   [3:0] TX_DATA_20_const_net_2;
wire   [3:0] TX_DATA_21_const_net_2;
wire   [3:0] TX_DATA_22_const_net_2;
wire   [3:0] TX_DATA_23_const_net_2;
wire   [3:0] TX_DATA_24_const_net_2;
wire   [3:0] TX_DATA_25_const_net_2;
wire   [3:0] TX_DATA_26_const_net_2;
wire   [3:0] TX_DATA_27_const_net_2;
wire   [3:0] TX_DATA_28_const_net_2;
wire   [3:0] TX_DATA_29_const_net_2;
wire   [3:0] TX_DATA_30_const_net_2;
wire   [3:0] TX_DATA_31_const_net_2;
wire   [3:0] TX_DATA_32_const_net_2;
wire   [3:0] TX_DATA_33_const_net_2;
wire   [3:0] TX_DATA_34_const_net_2;
wire   [3:0] TX_DATA_35_const_net_2;
wire   [3:0] TX_DATA_36_const_net_2;
wire   [3:0] TX_DATA_37_const_net_2;
wire   [3:0] TX_DATA_38_const_net_2;
wire   [3:0] TX_DATA_39_const_net_2;
wire   [3:0] TX_DATA_40_const_net_2;
wire   [3:0] TX_DATA_41_const_net_2;
wire   [3:0] TX_DATA_42_const_net_2;
wire   [3:0] TX_DATA_43_const_net_2;
wire   [3:0] TX_DATA_44_const_net_2;
wire   [3:0] TX_DATA_45_const_net_2;
wire   [3:0] TX_DATA_46_const_net_2;
wire   [3:0] TX_DATA_47_const_net_2;
wire   [3:0] TX_DATA_48_const_net_2;
wire   [3:0] TX_DATA_49_const_net_2;
wire   [3:0] TX_DATA_50_const_net_2;
wire   [3:0] TX_DATA_51_const_net_2;
wire   [3:0] TX_DATA_52_const_net_2;
wire   [3:0] TX_DATA_53_const_net_2;
wire   [3:0] TX_DATA_54_const_net_2;
wire   [3:0] TX_DATA_55_const_net_2;
wire   [3:0] TX_DATA_56_const_net_2;
wire   [3:0] TX_DATA_57_const_net_2;
wire   [3:0] TX_DATA_58_const_net_2;
wire   [3:0] TX_DATA_59_const_net_2;
wire   [3:0] TX_DATA_60_const_net_2;
wire   [3:0] TX_DATA_61_const_net_2;
wire   [3:0] TX_DATA_62_const_net_2;
wire   [3:0] TX_DATA_63_const_net_2;
wire   [1:0] OE_DATA_1_const_net_2;
wire   [1:0] OE_DATA_2_const_net_2;
wire   [1:0] OE_DATA_3_const_net_2;
wire   [1:0] OE_DATA_4_const_net_2;
wire   [1:0] OE_DATA_5_const_net_2;
wire   [1:0] OE_DATA_6_const_net_2;
wire   [1:0] OE_DATA_7_const_net_2;
wire   [1:0] OE_DATA_8_const_net_2;
wire   [1:0] OE_DATA_9_const_net_2;
wire   [1:0] OE_DATA_10_const_net_2;
wire   [1:0] OE_DATA_11_const_net_2;
wire   [1:0] OE_DATA_12_const_net_2;
wire   [1:0] OE_DATA_13_const_net_2;
wire   [1:0] OE_DATA_14_const_net_2;
wire   [1:0] OE_DATA_15_const_net_2;
wire   [1:0] OE_DATA_16_const_net_2;
wire   [1:0] OE_DATA_17_const_net_2;
wire   [1:0] OE_DATA_18_const_net_2;
wire   [1:0] OE_DATA_19_const_net_2;
wire   [1:0] OE_DATA_20_const_net_2;
wire   [1:0] OE_DATA_21_const_net_2;
wire   [1:0] OE_DATA_22_const_net_2;
wire   [1:0] OE_DATA_23_const_net_2;
wire   [1:0] OE_DATA_24_const_net_2;
wire   [1:0] OE_DATA_25_const_net_2;
wire   [1:0] OE_DATA_26_const_net_2;
wire   [1:0] OE_DATA_27_const_net_2;
wire   [1:0] OE_DATA_28_const_net_2;
wire   [1:0] OE_DATA_29_const_net_2;
wire   [1:0] OE_DATA_30_const_net_2;
wire   [1:0] OE_DATA_31_const_net_2;
wire   [1:0] OE_DATA_32_const_net_2;
wire   [1:0] OE_DATA_33_const_net_2;
wire   [1:0] OE_DATA_34_const_net_2;
wire   [1:0] OE_DATA_35_const_net_2;
wire   [1:0] OE_DATA_36_const_net_2;
wire   [1:0] OE_DATA_37_const_net_2;
wire   [1:0] OE_DATA_38_const_net_2;
wire   [1:0] OE_DATA_39_const_net_2;
wire   [1:0] OE_DATA_40_const_net_2;
wire   [1:0] OE_DATA_41_const_net_2;
wire   [1:0] OE_DATA_42_const_net_2;
wire   [1:0] OE_DATA_43_const_net_2;
wire   [1:0] OE_DATA_44_const_net_2;
wire   [1:0] OE_DATA_45_const_net_2;
wire   [1:0] OE_DATA_46_const_net_2;
wire   [1:0] OE_DATA_47_const_net_2;
wire   [1:0] OE_DATA_48_const_net_2;
wire   [1:0] OE_DATA_49_const_net_2;
wire   [1:0] OE_DATA_50_const_net_2;
wire   [1:0] OE_DATA_51_const_net_2;
wire   [1:0] OE_DATA_52_const_net_2;
wire   [1:0] OE_DATA_53_const_net_2;
wire   [1:0] OE_DATA_54_const_net_2;
wire   [1:0] OE_DATA_55_const_net_2;
wire   [1:0] OE_DATA_56_const_net_2;
wire   [1:0] OE_DATA_57_const_net_2;
wire   [1:0] OE_DATA_58_const_net_2;
wire   [1:0] OE_DATA_59_const_net_2;
wire   [1:0] OE_DATA_60_const_net_2;
wire   [1:0] OE_DATA_61_const_net_2;
wire   [1:0] OE_DATA_62_const_net_2;
wire   [1:0] OE_DATA_63_const_net_2;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                            = 1'b0;
assign VCC_net                            = 1'b1;
assign OE_DATA_0_const_net_0              = 2'h3;
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
assign TX_DATA_0_const_net_1              = 4'h0;
assign TX_DATA_1_const_net_0              = 4'h0;
assign TX_DATA_2_const_net_0              = 4'h0;
assign TX_DATA_3_const_net_0              = 4'h0;
assign TX_DATA_4_const_net_0              = 4'h0;
assign TX_DATA_5_const_net_0              = 4'h0;
assign TX_DATA_6_const_net_0              = 4'h0;
assign TX_DATA_7_const_net_0              = 4'h0;
assign TX_DATA_8_const_net_0              = 4'h0;
assign TX_DATA_9_const_net_0              = 4'h0;
assign TX_DATA_10_const_net_0             = 4'h0;
assign TX_DATA_11_const_net_0             = 4'h0;
assign TX_DATA_12_const_net_0             = 4'h0;
assign TX_DATA_13_const_net_0             = 4'h0;
assign TX_DATA_14_const_net_0             = 4'h0;
assign TX_DATA_15_const_net_0             = 4'h0;
assign TX_DATA_16_const_net_0             = 4'h0;
assign TX_DATA_17_const_net_0             = 4'h0;
assign TX_DATA_18_const_net_0             = 4'h0;
assign TX_DATA_19_const_net_0             = 4'h0;
assign TX_DATA_20_const_net_0             = 4'h0;
assign TX_DATA_21_const_net_0             = 4'h0;
assign TX_DATA_22_const_net_0             = 4'h0;
assign TX_DATA_23_const_net_0             = 4'h0;
assign TX_DATA_24_const_net_0             = 4'h0;
assign TX_DATA_25_const_net_0             = 4'h0;
assign TX_DATA_26_const_net_0             = 4'h0;
assign TX_DATA_27_const_net_0             = 4'h0;
assign TX_DATA_28_const_net_0             = 4'h0;
assign TX_DATA_29_const_net_0             = 4'h0;
assign TX_DATA_30_const_net_0             = 4'h0;
assign TX_DATA_31_const_net_0             = 4'h0;
assign TX_DATA_32_const_net_0             = 4'h0;
assign TX_DATA_33_const_net_0             = 4'h0;
assign TX_DATA_34_const_net_0             = 4'h0;
assign TX_DATA_35_const_net_0             = 4'h0;
assign TX_DATA_36_const_net_0             = 4'h0;
assign TX_DATA_37_const_net_0             = 4'h0;
assign TX_DATA_38_const_net_0             = 4'h0;
assign TX_DATA_39_const_net_0             = 4'h0;
assign TX_DATA_40_const_net_0             = 4'h0;
assign TX_DATA_41_const_net_0             = 4'h0;
assign TX_DATA_42_const_net_0             = 4'h0;
assign TX_DATA_43_const_net_0             = 4'h0;
assign TX_DATA_44_const_net_0             = 4'h0;
assign TX_DATA_45_const_net_0             = 4'h0;
assign TX_DATA_46_const_net_0             = 4'h0;
assign TX_DATA_47_const_net_0             = 4'h0;
assign TX_DATA_48_const_net_0             = 4'h0;
assign TX_DATA_49_const_net_0             = 4'h0;
assign TX_DATA_50_const_net_0             = 4'h0;
assign TX_DATA_51_const_net_0             = 4'h0;
assign TX_DATA_52_const_net_0             = 4'h0;
assign TX_DATA_53_const_net_0             = 4'h0;
assign TX_DATA_54_const_net_0             = 4'h0;
assign TX_DATA_55_const_net_0             = 4'h0;
assign TX_DATA_56_const_net_0             = 4'h0;
assign TX_DATA_57_const_net_0             = 4'h0;
assign TX_DATA_58_const_net_0             = 4'h0;
assign TX_DATA_59_const_net_0             = 4'h0;
assign TX_DATA_60_const_net_0             = 4'h0;
assign TX_DATA_61_const_net_0             = 4'h0;
assign TX_DATA_62_const_net_0             = 4'h0;
assign TX_DATA_63_const_net_0             = 4'h0;
assign OE_DATA_0_const_net_2              = 2'h0;
assign OE_DATA_1_const_net_0              = 2'h0;
assign OE_DATA_2_const_net_0              = 2'h0;
assign OE_DATA_3_const_net_0              = 2'h0;
assign OE_DATA_4_const_net_0              = 2'h0;
assign OE_DATA_5_const_net_0              = 2'h0;
assign OE_DATA_6_const_net_0              = 2'h0;
assign OE_DATA_7_const_net_0              = 2'h0;
assign OE_DATA_8_const_net_0              = 2'h0;
assign OE_DATA_9_const_net_0              = 2'h0;
assign OE_DATA_10_const_net_0             = 2'h0;
assign OE_DATA_11_const_net_0             = 2'h0;
assign OE_DATA_12_const_net_0             = 2'h0;
assign OE_DATA_13_const_net_0             = 2'h0;
assign OE_DATA_14_const_net_0             = 2'h0;
assign OE_DATA_15_const_net_0             = 2'h0;
assign OE_DATA_16_const_net_0             = 2'h0;
assign OE_DATA_17_const_net_0             = 2'h0;
assign OE_DATA_18_const_net_0             = 2'h0;
assign OE_DATA_19_const_net_0             = 2'h0;
assign OE_DATA_20_const_net_0             = 2'h0;
assign OE_DATA_21_const_net_0             = 2'h0;
assign OE_DATA_22_const_net_0             = 2'h0;
assign OE_DATA_23_const_net_0             = 2'h0;
assign OE_DATA_24_const_net_0             = 2'h0;
assign OE_DATA_25_const_net_0             = 2'h0;
assign OE_DATA_26_const_net_0             = 2'h0;
assign OE_DATA_27_const_net_0             = 2'h0;
assign OE_DATA_28_const_net_0             = 2'h0;
assign OE_DATA_29_const_net_0             = 2'h0;
assign OE_DATA_30_const_net_0             = 2'h0;
assign OE_DATA_31_const_net_0             = 2'h0;
assign OE_DATA_32_const_net_0             = 2'h0;
assign OE_DATA_33_const_net_0             = 2'h0;
assign OE_DATA_34_const_net_0             = 2'h0;
assign OE_DATA_35_const_net_0             = 2'h0;
assign OE_DATA_36_const_net_0             = 2'h0;
assign OE_DATA_37_const_net_0             = 2'h0;
assign OE_DATA_38_const_net_0             = 2'h0;
assign OE_DATA_39_const_net_0             = 2'h0;
assign OE_DATA_40_const_net_0             = 2'h0;
assign OE_DATA_41_const_net_0             = 2'h0;
assign OE_DATA_42_const_net_0             = 2'h0;
assign OE_DATA_43_const_net_0             = 2'h0;
assign OE_DATA_44_const_net_0             = 2'h0;
assign OE_DATA_45_const_net_0             = 2'h0;
assign OE_DATA_46_const_net_0             = 2'h0;
assign OE_DATA_47_const_net_0             = 2'h0;
assign OE_DATA_48_const_net_0             = 2'h0;
assign OE_DATA_49_const_net_0             = 2'h0;
assign OE_DATA_50_const_net_0             = 2'h0;
assign OE_DATA_51_const_net_0             = 2'h0;
assign OE_DATA_52_const_net_0             = 2'h0;
assign OE_DATA_53_const_net_0             = 2'h0;
assign OE_DATA_54_const_net_0             = 2'h0;
assign OE_DATA_55_const_net_0             = 2'h0;
assign OE_DATA_56_const_net_0             = 2'h0;
assign OE_DATA_57_const_net_0             = 2'h0;
assign OE_DATA_58_const_net_0             = 2'h0;
assign OE_DATA_59_const_net_0             = 2'h0;
assign OE_DATA_60_const_net_0             = 2'h0;
assign OE_DATA_61_const_net_0             = 2'h0;
assign OE_DATA_62_const_net_0             = 2'h0;
assign OE_DATA_63_const_net_0             = 2'h0;
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
assign RX_DQS_90_const_net_2              = 2'h0;
assign FIFO_WR_PTR_const_net_2            = 3'h0;
assign FIFO_RD_PTR_const_net_2            = 3'h0;
assign EYE_MONITOR_LANE_WIDTH_const_net_2 = 3'h0;
assign TX_DATA_1_const_net_2              = 4'h0;
assign TX_DATA_2_const_net_2              = 4'h0;
assign TX_DATA_3_const_net_2              = 4'h0;
assign TX_DATA_4_const_net_2              = 4'h0;
assign TX_DATA_5_const_net_2              = 4'h0;
assign TX_DATA_6_const_net_2              = 4'h0;
assign TX_DATA_7_const_net_2              = 4'h0;
assign TX_DATA_8_const_net_2              = 4'h0;
assign TX_DATA_9_const_net_2              = 4'h0;
assign TX_DATA_10_const_net_2             = 4'h0;
assign TX_DATA_11_const_net_2             = 4'h0;
assign TX_DATA_12_const_net_2             = 4'h0;
assign TX_DATA_13_const_net_2             = 4'h0;
assign TX_DATA_14_const_net_2             = 4'h0;
assign TX_DATA_15_const_net_2             = 4'h0;
assign TX_DATA_16_const_net_2             = 4'h0;
assign TX_DATA_17_const_net_2             = 4'h0;
assign TX_DATA_18_const_net_2             = 4'h0;
assign TX_DATA_19_const_net_2             = 4'h0;
assign TX_DATA_20_const_net_2             = 4'h0;
assign TX_DATA_21_const_net_2             = 4'h0;
assign TX_DATA_22_const_net_2             = 4'h0;
assign TX_DATA_23_const_net_2             = 4'h0;
assign TX_DATA_24_const_net_2             = 4'h0;
assign TX_DATA_25_const_net_2             = 4'h0;
assign TX_DATA_26_const_net_2             = 4'h0;
assign TX_DATA_27_const_net_2             = 4'h0;
assign TX_DATA_28_const_net_2             = 4'h0;
assign TX_DATA_29_const_net_2             = 4'h0;
assign TX_DATA_30_const_net_2             = 4'h0;
assign TX_DATA_31_const_net_2             = 4'h0;
assign TX_DATA_32_const_net_2             = 4'h0;
assign TX_DATA_33_const_net_2             = 4'h0;
assign TX_DATA_34_const_net_2             = 4'h0;
assign TX_DATA_35_const_net_2             = 4'h0;
assign TX_DATA_36_const_net_2             = 4'h0;
assign TX_DATA_37_const_net_2             = 4'h0;
assign TX_DATA_38_const_net_2             = 4'h0;
assign TX_DATA_39_const_net_2             = 4'h0;
assign TX_DATA_40_const_net_2             = 4'h0;
assign TX_DATA_41_const_net_2             = 4'h0;
assign TX_DATA_42_const_net_2             = 4'h0;
assign TX_DATA_43_const_net_2             = 4'h0;
assign TX_DATA_44_const_net_2             = 4'h0;
assign TX_DATA_45_const_net_2             = 4'h0;
assign TX_DATA_46_const_net_2             = 4'h0;
assign TX_DATA_47_const_net_2             = 4'h0;
assign TX_DATA_48_const_net_2             = 4'h0;
assign TX_DATA_49_const_net_2             = 4'h0;
assign TX_DATA_50_const_net_2             = 4'h0;
assign TX_DATA_51_const_net_2             = 4'h0;
assign TX_DATA_52_const_net_2             = 4'h0;
assign TX_DATA_53_const_net_2             = 4'h0;
assign TX_DATA_54_const_net_2             = 4'h0;
assign TX_DATA_55_const_net_2             = 4'h0;
assign TX_DATA_56_const_net_2             = 4'h0;
assign TX_DATA_57_const_net_2             = 4'h0;
assign TX_DATA_58_const_net_2             = 4'h0;
assign TX_DATA_59_const_net_2             = 4'h0;
assign TX_DATA_60_const_net_2             = 4'h0;
assign TX_DATA_61_const_net_2             = 4'h0;
assign TX_DATA_62_const_net_2             = 4'h0;
assign TX_DATA_63_const_net_2             = 4'h0;
assign OE_DATA_1_const_net_2              = 2'h0;
assign OE_DATA_2_const_net_2              = 2'h0;
assign OE_DATA_3_const_net_2              = 2'h0;
assign OE_DATA_4_const_net_2              = 2'h0;
assign OE_DATA_5_const_net_2              = 2'h0;
assign OE_DATA_6_const_net_2              = 2'h0;
assign OE_DATA_7_const_net_2              = 2'h0;
assign OE_DATA_8_const_net_2              = 2'h0;
assign OE_DATA_9_const_net_2              = 2'h0;
assign OE_DATA_10_const_net_2             = 2'h0;
assign OE_DATA_11_const_net_2             = 2'h0;
assign OE_DATA_12_const_net_2             = 2'h0;
assign OE_DATA_13_const_net_2             = 2'h0;
assign OE_DATA_14_const_net_2             = 2'h0;
assign OE_DATA_15_const_net_2             = 2'h0;
assign OE_DATA_16_const_net_2             = 2'h0;
assign OE_DATA_17_const_net_2             = 2'h0;
assign OE_DATA_18_const_net_2             = 2'h0;
assign OE_DATA_19_const_net_2             = 2'h0;
assign OE_DATA_20_const_net_2             = 2'h0;
assign OE_DATA_21_const_net_2             = 2'h0;
assign OE_DATA_22_const_net_2             = 2'h0;
assign OE_DATA_23_const_net_2             = 2'h0;
assign OE_DATA_24_const_net_2             = 2'h0;
assign OE_DATA_25_const_net_2             = 2'h0;
assign OE_DATA_26_const_net_2             = 2'h0;
assign OE_DATA_27_const_net_2             = 2'h0;
assign OE_DATA_28_const_net_2             = 2'h0;
assign OE_DATA_29_const_net_2             = 2'h0;
assign OE_DATA_30_const_net_2             = 2'h0;
assign OE_DATA_31_const_net_2             = 2'h0;
assign OE_DATA_32_const_net_2             = 2'h0;
assign OE_DATA_33_const_net_2             = 2'h0;
assign OE_DATA_34_const_net_2             = 2'h0;
assign OE_DATA_35_const_net_2             = 2'h0;
assign OE_DATA_36_const_net_2             = 2'h0;
assign OE_DATA_37_const_net_2             = 2'h0;
assign OE_DATA_38_const_net_2             = 2'h0;
assign OE_DATA_39_const_net_2             = 2'h0;
assign OE_DATA_40_const_net_2             = 2'h0;
assign OE_DATA_41_const_net_2             = 2'h0;
assign OE_DATA_42_const_net_2             = 2'h0;
assign OE_DATA_43_const_net_2             = 2'h0;
assign OE_DATA_44_const_net_2             = 2'h0;
assign OE_DATA_45_const_net_2             = 2'h0;
assign OE_DATA_46_const_net_2             = 2'h0;
assign OE_DATA_47_const_net_2             = 2'h0;
assign OE_DATA_48_const_net_2             = 2'h0;
assign OE_DATA_49_const_net_2             = 2'h0;
assign OE_DATA_50_const_net_2             = 2'h0;
assign OE_DATA_51_const_net_2             = 2'h0;
assign OE_DATA_52_const_net_2             = 2'h0;
assign OE_DATA_53_const_net_2             = 2'h0;
assign OE_DATA_54_const_net_2             = 2'h0;
assign OE_DATA_55_const_net_2             = 2'h0;
assign OE_DATA_56_const_net_2             = 2'h0;
assign OE_DATA_57_const_net_2             = 2'h0;
assign OE_DATA_58_const_net_2             = 2'h0;
assign OE_DATA_59_const_net_2             = 2'h0;
assign OE_DATA_60_const_net_2             = 2'h0;
assign OE_DATA_61_const_net_2             = 2'h0;
assign OE_DATA_62_const_net_2             = 2'h0;
assign OE_DATA_63_const_net_2             = 2'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign TX_CLK_net_1                = TX_CLK_net_0[0];
assign TX_CLK                      = TX_CLK_net_1;
assign TX_CLK_N_net_1              = TX_CLK_N_net_0[0];
assign TX_CLK_N                    = TX_CLK_N_net_1;
assign TXD_net_1[0]                = TXD_net_0[0];
assign TXD[0:0]                    = TXD_net_1[0];
assign TXD_N_net_1[0]              = TXD_N_net_0[0];
assign TXD_N[0:0]                  = TXD_N_net_1[0];
assign CLK_ALIGN_IOD_RX_net_1[0]   = CLK_ALIGN_IOD_RX_net_0[0];
assign CLK_ALIGN_IOD_RX[0:0]       = CLK_ALIGN_IOD_RX_net_1[0];
assign CLK_ALIGN_IOD_RX_0_net_0[1] = CLK_ALIGN_IOD_RX_0[2];
assign CLK_ALIGN_IOD_RX[1:1]       = CLK_ALIGN_IOD_RX_0_net_0[1];
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign CLK_ALIGN_IOD_RX_net_0[0] = RX_DATA_0_net_0[0:0];
assign CLK_ALIGN_IOD_RX_0[2]     = RX_DATA_0_net_0[2:2];
assign TXD_DATA_slice_0[0]       = TXD_DATA[0:0];
assign TXD_DATA_slice_1[1]       = TXD_DATA[1:1];
assign TXD_DATA_slice_2[2]       = TXD_DATA[2:2];
assign TXD_DATA_slice_3[3]       = TXD_DATA[3:3];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign HS_IO_CLK_net_0 = { HS_IO_CLK , HS_IO_CLK_90 };
assign TX_DATA_0_net_0 = { TXD_DATA_slice_3[3] , TXD_DATA_slice_2[2] , TXD_DATA_slice_1[1] , TXD_DATA_slice_0[0] };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_IOD_GENERIC_TX_C0_LANECTRL_ADDR_CMD_0_PF_LANECTRL   -   Actel:SgCore:PF_LANECTRL:2.0.102
PF_IOD_GENERIC_TX_C0_LANECTRL_ADDR_CMD_0_PF_LANECTRL LANECTRL_ADDR_CMD_0(
        // Inputs
        .HS_IO_CLK                  ( HS_IO_CLK_net_0 ),
        .FAB_CLK                    ( TX_CLK_G ),
        .RESET                      ( GND_net ),
        .DDR_READ                   ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_SEL             ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_LOAD            ( VCC_net ),
        .DELAY_LINE_DIRECTION       ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_MOVE            ( GND_net ), // tied to 1'b0 from definition
        .HS_IO_CLK_PAUSE            ( HS_IO_CLK_PAUSE ),
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

//--------PF_IOD_GENERIC_TX_C0_PF_IOD_CLK_TRAINING_PF_IOD   -   Actel:SgCore:PF_IOD:1.0.216
PF_IOD_GENERIC_TX_C0_PF_IOD_CLK_TRAINING_PF_IOD PF_IOD_CLK_TRAINING(
        // Inputs
        .ARST_N                    ( LANECTRL_ADDR_CMD_0_ARST_N ),
        .RX_SYNC_RST               ( LANECTRL_ADDR_CMD_0_RX_SYNC_RST ),
        .TX_SYNC_RST               ( LANECTRL_ADDR_CMD_0_TX_SYNC_RST ),
        .HS_IO_CLK                 ( HS_IO_CLK ),
        .EYE_MONITOR_LANE_WIDTH    ( EYE_MONITOR_LANE_WIDTH_const_net_0 ), // tied to 3'h0 from definition
        .EYE_MONITOR_CLEAR_FLAGS_0 ( VCC_net ),
        .FAB_CLK                   ( TX_CLK_G ),
        .ODT_EN_0                  ( GND_net ),
        // Outputs
        .EYE_MONITOR_EARLY_0       (  ),
        .EYE_MONITOR_LATE_0        (  ),
        .RX_DATA_0                 ( RX_DATA_0_net_0 ) 
        );

//--------PF_IOD_GENERIC_TX_C0_PF_IOD_TX_PF_IOD   -   Actel:SgCore:PF_IOD:1.0.216
PF_IOD_GENERIC_TX_C0_PF_IOD_TX_PF_IOD PF_IOD_TX(
        // Inputs
        .ARST_N      ( LANECTRL_ADDR_CMD_0_ARST_N ),
        .RX_SYNC_RST ( LANECTRL_ADDR_CMD_0_RX_SYNC_RST ),
        .TX_SYNC_RST ( LANECTRL_ADDR_CMD_0_TX_SYNC_RST ),
        .HS_IO_CLK   ( HS_IO_CLK ),
        .TX_DQS      ( LANECTRL_ADDR_CMD_0_TX_DQS ),
        .TX_DQS_270  ( LANECTRL_ADDR_CMD_0_TX_DQS_270 ),
        .TX_DATA_0   ( TX_DATA_0_net_0 ),
        .OE_DATA_0   ( OE_DATA_0_const_net_0 ),
        .FAB_CLK     ( TX_CLK_G ),
        .ODT_EN_0    ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .PAD_O       ( TXD_net_0 ),
        .PAD_O_N     ( TXD_N_net_0 ) 
        );

//--------PF_IOD_GENERIC_TX_C0_PF_IOD_TX_CLK_PF_IOD   -   Actel:SgCore:PF_IOD:1.0.216
PF_IOD_GENERIC_TX_C0_PF_IOD_TX_CLK_PF_IOD PF_IOD_TX_CLK(
        // Inputs
        .ARST_N      ( LANECTRL_ADDR_CMD_0_ARST_N ),
        .RX_SYNC_RST ( LANECTRL_ADDR_CMD_0_RX_SYNC_RST ),
        .TX_SYNC_RST ( LANECTRL_ADDR_CMD_0_TX_SYNC_RST ),
        .HS_IO_CLK   ( HS_IO_CLK_90 ),
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
