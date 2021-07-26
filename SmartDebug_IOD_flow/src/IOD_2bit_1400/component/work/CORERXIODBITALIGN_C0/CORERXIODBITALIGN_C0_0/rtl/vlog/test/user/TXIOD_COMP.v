//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun May  3 18:24:17 2020
// Version: v12.4 12.900.0.14
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// TXIOD_COMP
module TXIOD_COMP(
    // Inputs
    ARST_N,
    HS_IO_CLK,
    HS_IO_CLK_90,
    HS_IO_CLK_PAUSE,
    TXD_DATA,
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
input        HS_IO_CLK_90;
input        HS_IO_CLK_PAUSE;
input  [7:0] TXD_DATA;
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
wire         HS_IO_CLK;
wire         HS_IO_CLK_90;
wire         HS_IO_CLK_PAUSE;
wire         LANECTRL_ADDR_CMD_0_ARST_N;
wire         LANECTRL_ADDR_CMD_0_RX_SYNC_RST;
wire         LANECTRL_ADDR_CMD_0_TX_DQS;
wire         LANECTRL_ADDR_CMD_0_TX_DQS_270;
wire         LANECTRL_ADDR_CMD_0_TX_SYNC_RST;
wire         OR2_PAUSE_Y;
wire   [0:0] TX_CLK_net_0;
wire         TX_CLK_G;
wire   [0:0] TX_CLK_N_net_0;
wire   [0:0] TXD_net_0;
wire   [0:0] TXD_DATA_slice_0;
wire   [1:1] TXD_DATA_slice_1;
wire   [2:2] TXD_DATA_slice_2;
wire   [3:3] TXD_DATA_slice_3;
wire   [4:4] TXD_DATA_slice_4;
wire   [5:5] TXD_DATA_slice_5;
wire   [6:6] TXD_DATA_slice_6;
wire   [7:7] TXD_DATA_slice_7;
wire   [0:0] TXD_N_net_0;
wire         TX_CLK_net_1;
wire         TX_CLK_N_net_1;
wire   [0:0] TXD_net_1;
wire   [0:0] TXD_N_net_1;
wire   [1:0] HS_IO_CLK_net_0;
wire   [7:0] TX_DATA_0_net_0;
wire   [7:0] TXD_DATA;
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
wire   [7:0] TX_DATA_64_const_net_0;
wire   [7:0] TX_DATA_65_const_net_0;
wire   [7:0] TX_DATA_66_const_net_0;
wire   [7:0] TX_DATA_67_const_net_0;
wire   [7:0] TX_DATA_68_const_net_0;
wire   [7:0] TX_DATA_69_const_net_0;
wire   [7:0] TX_DATA_70_const_net_0;
wire   [7:0] TX_DATA_71_const_net_0;
wire   [7:0] TX_DATA_72_const_net_0;
wire   [7:0] TX_DATA_73_const_net_0;
wire   [7:0] TX_DATA_74_const_net_0;
wire   [7:0] TX_DATA_75_const_net_0;
wire   [7:0] TX_DATA_76_const_net_0;
wire   [7:0] TX_DATA_77_const_net_0;
wire   [7:0] TX_DATA_78_const_net_0;
wire   [7:0] TX_DATA_79_const_net_0;
wire   [7:0] TX_DATA_80_const_net_0;
wire   [7:0] TX_DATA_81_const_net_0;
wire   [7:0] TX_DATA_82_const_net_0;
wire   [7:0] TX_DATA_83_const_net_0;
wire   [7:0] TX_DATA_84_const_net_0;
wire   [7:0] TX_DATA_85_const_net_0;
wire   [7:0] TX_DATA_86_const_net_0;
wire   [7:0] TX_DATA_87_const_net_0;
wire   [7:0] TX_DATA_88_const_net_0;
wire   [7:0] TX_DATA_89_const_net_0;
wire   [7:0] TX_DATA_90_const_net_0;
wire   [7:0] TX_DATA_91_const_net_0;
wire   [7:0] TX_DATA_92_const_net_0;
wire   [7:0] TX_DATA_93_const_net_0;
wire   [7:0] TX_DATA_94_const_net_0;
wire   [7:0] TX_DATA_95_const_net_0;
wire   [7:0] TX_DATA_96_const_net_0;
wire   [7:0] TX_DATA_97_const_net_0;
wire   [7:0] TX_DATA_98_const_net_0;
wire   [7:0] TX_DATA_99_const_net_0;
wire   [7:0] TX_DATA_100_const_net_0;
wire   [7:0] TX_DATA_101_const_net_0;
wire   [7:0] TX_DATA_102_const_net_0;
wire   [7:0] TX_DATA_103_const_net_0;
wire   [7:0] TX_DATA_104_const_net_0;
wire   [7:0] TX_DATA_105_const_net_0;
wire   [7:0] TX_DATA_106_const_net_0;
wire   [7:0] TX_DATA_107_const_net_0;
wire   [7:0] TX_DATA_108_const_net_0;
wire   [7:0] TX_DATA_109_const_net_0;
wire   [7:0] TX_DATA_110_const_net_0;
wire   [7:0] TX_DATA_111_const_net_0;
wire   [7:0] TX_DATA_112_const_net_0;
wire   [7:0] TX_DATA_113_const_net_0;
wire   [7:0] TX_DATA_114_const_net_0;
wire   [7:0] TX_DATA_115_const_net_0;
wire   [7:0] TX_DATA_116_const_net_0;
wire   [7:0] TX_DATA_117_const_net_0;
wire   [7:0] TX_DATA_118_const_net_0;
wire   [7:0] TX_DATA_119_const_net_0;
wire   [7:0] TX_DATA_120_const_net_0;
wire   [7:0] TX_DATA_121_const_net_0;
wire   [7:0] TX_DATA_122_const_net_0;
wire   [7:0] TX_DATA_123_const_net_0;
wire   [7:0] TX_DATA_124_const_net_0;
wire   [7:0] TX_DATA_125_const_net_0;
wire   [7:0] TX_DATA_126_const_net_0;
wire   [7:0] TX_DATA_127_const_net_0;
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
wire   [3:0] OE_DATA_64_const_net_0;
wire   [3:0] OE_DATA_65_const_net_0;
wire   [3:0] OE_DATA_66_const_net_0;
wire   [3:0] OE_DATA_67_const_net_0;
wire   [3:0] OE_DATA_68_const_net_0;
wire   [3:0] OE_DATA_69_const_net_0;
wire   [3:0] OE_DATA_70_const_net_0;
wire   [3:0] OE_DATA_71_const_net_0;
wire   [3:0] OE_DATA_72_const_net_0;
wire   [3:0] OE_DATA_73_const_net_0;
wire   [3:0] OE_DATA_74_const_net_0;
wire   [3:0] OE_DATA_75_const_net_0;
wire   [3:0] OE_DATA_76_const_net_0;
wire   [3:0] OE_DATA_77_const_net_0;
wire   [3:0] OE_DATA_78_const_net_0;
wire   [3:0] OE_DATA_79_const_net_0;
wire   [3:0] OE_DATA_80_const_net_0;
wire   [3:0] OE_DATA_81_const_net_0;
wire   [3:0] OE_DATA_82_const_net_0;
wire   [3:0] OE_DATA_83_const_net_0;
wire   [3:0] OE_DATA_84_const_net_0;
wire   [3:0] OE_DATA_85_const_net_0;
wire   [3:0] OE_DATA_86_const_net_0;
wire   [3:0] OE_DATA_87_const_net_0;
wire   [3:0] OE_DATA_88_const_net_0;
wire   [3:0] OE_DATA_89_const_net_0;
wire   [3:0] OE_DATA_90_const_net_0;
wire   [3:0] OE_DATA_91_const_net_0;
wire   [3:0] OE_DATA_92_const_net_0;
wire   [3:0] OE_DATA_93_const_net_0;
wire   [3:0] OE_DATA_94_const_net_0;
wire   [3:0] OE_DATA_95_const_net_0;
wire   [3:0] OE_DATA_96_const_net_0;
wire   [3:0] OE_DATA_97_const_net_0;
wire   [3:0] OE_DATA_98_const_net_0;
wire   [3:0] OE_DATA_99_const_net_0;
wire   [3:0] OE_DATA_100_const_net_0;
wire   [3:0] OE_DATA_101_const_net_0;
wire   [3:0] OE_DATA_102_const_net_0;
wire   [3:0] OE_DATA_103_const_net_0;
wire   [3:0] OE_DATA_104_const_net_0;
wire   [3:0] OE_DATA_105_const_net_0;
wire   [3:0] OE_DATA_106_const_net_0;
wire   [3:0] OE_DATA_107_const_net_0;
wire   [3:0] OE_DATA_108_const_net_0;
wire   [3:0] OE_DATA_109_const_net_0;
wire   [3:0] OE_DATA_110_const_net_0;
wire   [3:0] OE_DATA_111_const_net_0;
wire   [3:0] OE_DATA_112_const_net_0;
wire   [3:0] OE_DATA_113_const_net_0;
wire   [3:0] OE_DATA_114_const_net_0;
wire   [3:0] OE_DATA_115_const_net_0;
wire   [3:0] OE_DATA_116_const_net_0;
wire   [3:0] OE_DATA_117_const_net_0;
wire   [3:0] OE_DATA_118_const_net_0;
wire   [3:0] OE_DATA_119_const_net_0;
wire   [3:0] OE_DATA_120_const_net_0;
wire   [3:0] OE_DATA_121_const_net_0;
wire   [3:0] OE_DATA_122_const_net_0;
wire   [3:0] OE_DATA_123_const_net_0;
wire   [3:0] OE_DATA_124_const_net_0;
wire   [3:0] OE_DATA_125_const_net_0;
wire   [3:0] OE_DATA_126_const_net_0;
wire   [3:0] OE_DATA_127_const_net_0;
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
wire   [3:0] TX_DATA_64_const_net_1;
wire   [3:0] TX_DATA_65_const_net_1;
wire   [3:0] TX_DATA_66_const_net_1;
wire   [3:0] TX_DATA_67_const_net_1;
wire   [3:0] TX_DATA_68_const_net_1;
wire   [3:0] TX_DATA_69_const_net_1;
wire   [3:0] TX_DATA_70_const_net_1;
wire   [3:0] TX_DATA_71_const_net_1;
wire   [3:0] TX_DATA_72_const_net_1;
wire   [3:0] TX_DATA_73_const_net_1;
wire   [3:0] TX_DATA_74_const_net_1;
wire   [3:0] TX_DATA_75_const_net_1;
wire   [3:0] TX_DATA_76_const_net_1;
wire   [3:0] TX_DATA_77_const_net_1;
wire   [3:0] TX_DATA_78_const_net_1;
wire   [3:0] TX_DATA_79_const_net_1;
wire   [3:0] TX_DATA_80_const_net_1;
wire   [3:0] TX_DATA_81_const_net_1;
wire   [3:0] TX_DATA_82_const_net_1;
wire   [3:0] TX_DATA_83_const_net_1;
wire   [3:0] TX_DATA_84_const_net_1;
wire   [3:0] TX_DATA_85_const_net_1;
wire   [3:0] TX_DATA_86_const_net_1;
wire   [3:0] TX_DATA_87_const_net_1;
wire   [3:0] TX_DATA_88_const_net_1;
wire   [3:0] TX_DATA_89_const_net_1;
wire   [3:0] TX_DATA_90_const_net_1;
wire   [3:0] TX_DATA_91_const_net_1;
wire   [3:0] TX_DATA_92_const_net_1;
wire   [3:0] TX_DATA_93_const_net_1;
wire   [3:0] TX_DATA_94_const_net_1;
wire   [3:0] TX_DATA_95_const_net_1;
wire   [3:0] TX_DATA_96_const_net_1;
wire   [3:0] TX_DATA_97_const_net_1;
wire   [3:0] TX_DATA_98_const_net_1;
wire   [3:0] TX_DATA_99_const_net_1;
wire   [3:0] TX_DATA_100_const_net_1;
wire   [3:0] TX_DATA_101_const_net_1;
wire   [3:0] TX_DATA_102_const_net_1;
wire   [3:0] TX_DATA_103_const_net_1;
wire   [3:0] TX_DATA_104_const_net_1;
wire   [3:0] TX_DATA_105_const_net_1;
wire   [3:0] TX_DATA_106_const_net_1;
wire   [3:0] TX_DATA_107_const_net_1;
wire   [3:0] TX_DATA_108_const_net_1;
wire   [3:0] TX_DATA_109_const_net_1;
wire   [3:0] TX_DATA_110_const_net_1;
wire   [3:0] TX_DATA_111_const_net_1;
wire   [3:0] TX_DATA_112_const_net_1;
wire   [3:0] TX_DATA_113_const_net_1;
wire   [3:0] TX_DATA_114_const_net_1;
wire   [3:0] TX_DATA_115_const_net_1;
wire   [3:0] TX_DATA_116_const_net_1;
wire   [3:0] TX_DATA_117_const_net_1;
wire   [3:0] TX_DATA_118_const_net_1;
wire   [3:0] TX_DATA_119_const_net_1;
wire   [3:0] TX_DATA_120_const_net_1;
wire   [3:0] TX_DATA_121_const_net_1;
wire   [3:0] TX_DATA_122_const_net_1;
wire   [3:0] TX_DATA_123_const_net_1;
wire   [3:0] TX_DATA_124_const_net_1;
wire   [3:0] TX_DATA_125_const_net_1;
wire   [3:0] TX_DATA_126_const_net_1;
wire   [3:0] TX_DATA_127_const_net_1;
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
wire   [1:0] OE_DATA_64_const_net_1;
wire   [1:0] OE_DATA_65_const_net_1;
wire   [1:0] OE_DATA_66_const_net_1;
wire   [1:0] OE_DATA_67_const_net_1;
wire   [1:0] OE_DATA_68_const_net_1;
wire   [1:0] OE_DATA_69_const_net_1;
wire   [1:0] OE_DATA_70_const_net_1;
wire   [1:0] OE_DATA_71_const_net_1;
wire   [1:0] OE_DATA_72_const_net_1;
wire   [1:0] OE_DATA_73_const_net_1;
wire   [1:0] OE_DATA_74_const_net_1;
wire   [1:0] OE_DATA_75_const_net_1;
wire   [1:0] OE_DATA_76_const_net_1;
wire   [1:0] OE_DATA_77_const_net_1;
wire   [1:0] OE_DATA_78_const_net_1;
wire   [1:0] OE_DATA_79_const_net_1;
wire   [1:0] OE_DATA_80_const_net_1;
wire   [1:0] OE_DATA_81_const_net_1;
wire   [1:0] OE_DATA_82_const_net_1;
wire   [1:0] OE_DATA_83_const_net_1;
wire   [1:0] OE_DATA_84_const_net_1;
wire   [1:0] OE_DATA_85_const_net_1;
wire   [1:0] OE_DATA_86_const_net_1;
wire   [1:0] OE_DATA_87_const_net_1;
wire   [1:0] OE_DATA_88_const_net_1;
wire   [1:0] OE_DATA_89_const_net_1;
wire   [1:0] OE_DATA_90_const_net_1;
wire   [1:0] OE_DATA_91_const_net_1;
wire   [1:0] OE_DATA_92_const_net_1;
wire   [1:0] OE_DATA_93_const_net_1;
wire   [1:0] OE_DATA_94_const_net_1;
wire   [1:0] OE_DATA_95_const_net_1;
wire   [1:0] OE_DATA_96_const_net_1;
wire   [1:0] OE_DATA_97_const_net_1;
wire   [1:0] OE_DATA_98_const_net_1;
wire   [1:0] OE_DATA_99_const_net_1;
wire   [1:0] OE_DATA_100_const_net_1;
wire   [1:0] OE_DATA_101_const_net_1;
wire   [1:0] OE_DATA_102_const_net_1;
wire   [1:0] OE_DATA_103_const_net_1;
wire   [1:0] OE_DATA_104_const_net_1;
wire   [1:0] OE_DATA_105_const_net_1;
wire   [1:0] OE_DATA_106_const_net_1;
wire   [1:0] OE_DATA_107_const_net_1;
wire   [1:0] OE_DATA_108_const_net_1;
wire   [1:0] OE_DATA_109_const_net_1;
wire   [1:0] OE_DATA_110_const_net_1;
wire   [1:0] OE_DATA_111_const_net_1;
wire   [1:0] OE_DATA_112_const_net_1;
wire   [1:0] OE_DATA_113_const_net_1;
wire   [1:0] OE_DATA_114_const_net_1;
wire   [1:0] OE_DATA_115_const_net_1;
wire   [1:0] OE_DATA_116_const_net_1;
wire   [1:0] OE_DATA_117_const_net_1;
wire   [1:0] OE_DATA_118_const_net_1;
wire   [1:0] OE_DATA_119_const_net_1;
wire   [1:0] OE_DATA_120_const_net_1;
wire   [1:0] OE_DATA_121_const_net_1;
wire   [1:0] OE_DATA_122_const_net_1;
wire   [1:0] OE_DATA_123_const_net_1;
wire   [1:0] OE_DATA_124_const_net_1;
wire   [1:0] OE_DATA_125_const_net_1;
wire   [1:0] OE_DATA_126_const_net_1;
wire   [1:0] OE_DATA_127_const_net_1;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire         B_IN_POST_INV0_0;
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
assign TX_DATA_64_const_net_0             = 8'h00;
assign TX_DATA_65_const_net_0             = 8'h00;
assign TX_DATA_66_const_net_0             = 8'h00;
assign TX_DATA_67_const_net_0             = 8'h00;
assign TX_DATA_68_const_net_0             = 8'h00;
assign TX_DATA_69_const_net_0             = 8'h00;
assign TX_DATA_70_const_net_0             = 8'h00;
assign TX_DATA_71_const_net_0             = 8'h00;
assign TX_DATA_72_const_net_0             = 8'h00;
assign TX_DATA_73_const_net_0             = 8'h00;
assign TX_DATA_74_const_net_0             = 8'h00;
assign TX_DATA_75_const_net_0             = 8'h00;
assign TX_DATA_76_const_net_0             = 8'h00;
assign TX_DATA_77_const_net_0             = 8'h00;
assign TX_DATA_78_const_net_0             = 8'h00;
assign TX_DATA_79_const_net_0             = 8'h00;
assign TX_DATA_80_const_net_0             = 8'h00;
assign TX_DATA_81_const_net_0             = 8'h00;
assign TX_DATA_82_const_net_0             = 8'h00;
assign TX_DATA_83_const_net_0             = 8'h00;
assign TX_DATA_84_const_net_0             = 8'h00;
assign TX_DATA_85_const_net_0             = 8'h00;
assign TX_DATA_86_const_net_0             = 8'h00;
assign TX_DATA_87_const_net_0             = 8'h00;
assign TX_DATA_88_const_net_0             = 8'h00;
assign TX_DATA_89_const_net_0             = 8'h00;
assign TX_DATA_90_const_net_0             = 8'h00;
assign TX_DATA_91_const_net_0             = 8'h00;
assign TX_DATA_92_const_net_0             = 8'h00;
assign TX_DATA_93_const_net_0             = 8'h00;
assign TX_DATA_94_const_net_0             = 8'h00;
assign TX_DATA_95_const_net_0             = 8'h00;
assign TX_DATA_96_const_net_0             = 8'h00;
assign TX_DATA_97_const_net_0             = 8'h00;
assign TX_DATA_98_const_net_0             = 8'h00;
assign TX_DATA_99_const_net_0             = 8'h00;
assign TX_DATA_100_const_net_0            = 8'h00;
assign TX_DATA_101_const_net_0            = 8'h00;
assign TX_DATA_102_const_net_0            = 8'h00;
assign TX_DATA_103_const_net_0            = 8'h00;
assign TX_DATA_104_const_net_0            = 8'h00;
assign TX_DATA_105_const_net_0            = 8'h00;
assign TX_DATA_106_const_net_0            = 8'h00;
assign TX_DATA_107_const_net_0            = 8'h00;
assign TX_DATA_108_const_net_0            = 8'h00;
assign TX_DATA_109_const_net_0            = 8'h00;
assign TX_DATA_110_const_net_0            = 8'h00;
assign TX_DATA_111_const_net_0            = 8'h00;
assign TX_DATA_112_const_net_0            = 8'h00;
assign TX_DATA_113_const_net_0            = 8'h00;
assign TX_DATA_114_const_net_0            = 8'h00;
assign TX_DATA_115_const_net_0            = 8'h00;
assign TX_DATA_116_const_net_0            = 8'h00;
assign TX_DATA_117_const_net_0            = 8'h00;
assign TX_DATA_118_const_net_0            = 8'h00;
assign TX_DATA_119_const_net_0            = 8'h00;
assign TX_DATA_120_const_net_0            = 8'h00;
assign TX_DATA_121_const_net_0            = 8'h00;
assign TX_DATA_122_const_net_0            = 8'h00;
assign TX_DATA_123_const_net_0            = 8'h00;
assign TX_DATA_124_const_net_0            = 8'h00;
assign TX_DATA_125_const_net_0            = 8'h00;
assign TX_DATA_126_const_net_0            = 8'h00;
assign TX_DATA_127_const_net_0            = 8'h00;
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
assign OE_DATA_64_const_net_0             = 4'h0;
assign OE_DATA_65_const_net_0             = 4'h0;
assign OE_DATA_66_const_net_0             = 4'h0;
assign OE_DATA_67_const_net_0             = 4'h0;
assign OE_DATA_68_const_net_0             = 4'h0;
assign OE_DATA_69_const_net_0             = 4'h0;
assign OE_DATA_70_const_net_0             = 4'h0;
assign OE_DATA_71_const_net_0             = 4'h0;
assign OE_DATA_72_const_net_0             = 4'h0;
assign OE_DATA_73_const_net_0             = 4'h0;
assign OE_DATA_74_const_net_0             = 4'h0;
assign OE_DATA_75_const_net_0             = 4'h0;
assign OE_DATA_76_const_net_0             = 4'h0;
assign OE_DATA_77_const_net_0             = 4'h0;
assign OE_DATA_78_const_net_0             = 4'h0;
assign OE_DATA_79_const_net_0             = 4'h0;
assign OE_DATA_80_const_net_0             = 4'h0;
assign OE_DATA_81_const_net_0             = 4'h0;
assign OE_DATA_82_const_net_0             = 4'h0;
assign OE_DATA_83_const_net_0             = 4'h0;
assign OE_DATA_84_const_net_0             = 4'h0;
assign OE_DATA_85_const_net_0             = 4'h0;
assign OE_DATA_86_const_net_0             = 4'h0;
assign OE_DATA_87_const_net_0             = 4'h0;
assign OE_DATA_88_const_net_0             = 4'h0;
assign OE_DATA_89_const_net_0             = 4'h0;
assign OE_DATA_90_const_net_0             = 4'h0;
assign OE_DATA_91_const_net_0             = 4'h0;
assign OE_DATA_92_const_net_0             = 4'h0;
assign OE_DATA_93_const_net_0             = 4'h0;
assign OE_DATA_94_const_net_0             = 4'h0;
assign OE_DATA_95_const_net_0             = 4'h0;
assign OE_DATA_96_const_net_0             = 4'h0;
assign OE_DATA_97_const_net_0             = 4'h0;
assign OE_DATA_98_const_net_0             = 4'h0;
assign OE_DATA_99_const_net_0             = 4'h0;
assign OE_DATA_100_const_net_0            = 4'h0;
assign OE_DATA_101_const_net_0            = 4'h0;
assign OE_DATA_102_const_net_0            = 4'h0;
assign OE_DATA_103_const_net_0            = 4'h0;
assign OE_DATA_104_const_net_0            = 4'h0;
assign OE_DATA_105_const_net_0            = 4'h0;
assign OE_DATA_106_const_net_0            = 4'h0;
assign OE_DATA_107_const_net_0            = 4'h0;
assign OE_DATA_108_const_net_0            = 4'h0;
assign OE_DATA_109_const_net_0            = 4'h0;
assign OE_DATA_110_const_net_0            = 4'h0;
assign OE_DATA_111_const_net_0            = 4'h0;
assign OE_DATA_112_const_net_0            = 4'h0;
assign OE_DATA_113_const_net_0            = 4'h0;
assign OE_DATA_114_const_net_0            = 4'h0;
assign OE_DATA_115_const_net_0            = 4'h0;
assign OE_DATA_116_const_net_0            = 4'h0;
assign OE_DATA_117_const_net_0            = 4'h0;
assign OE_DATA_118_const_net_0            = 4'h0;
assign OE_DATA_119_const_net_0            = 4'h0;
assign OE_DATA_120_const_net_0            = 4'h0;
assign OE_DATA_121_const_net_0            = 4'h0;
assign OE_DATA_122_const_net_0            = 4'h0;
assign OE_DATA_123_const_net_0            = 4'h0;
assign OE_DATA_124_const_net_0            = 4'h0;
assign OE_DATA_125_const_net_0            = 4'h0;
assign OE_DATA_126_const_net_0            = 4'h0;
assign OE_DATA_127_const_net_0            = 4'h0;
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
assign TX_DATA_64_const_net_1             = 4'h0;
assign TX_DATA_65_const_net_1             = 4'h0;
assign TX_DATA_66_const_net_1             = 4'h0;
assign TX_DATA_67_const_net_1             = 4'h0;
assign TX_DATA_68_const_net_1             = 4'h0;
assign TX_DATA_69_const_net_1             = 4'h0;
assign TX_DATA_70_const_net_1             = 4'h0;
assign TX_DATA_71_const_net_1             = 4'h0;
assign TX_DATA_72_const_net_1             = 4'h0;
assign TX_DATA_73_const_net_1             = 4'h0;
assign TX_DATA_74_const_net_1             = 4'h0;
assign TX_DATA_75_const_net_1             = 4'h0;
assign TX_DATA_76_const_net_1             = 4'h0;
assign TX_DATA_77_const_net_1             = 4'h0;
assign TX_DATA_78_const_net_1             = 4'h0;
assign TX_DATA_79_const_net_1             = 4'h0;
assign TX_DATA_80_const_net_1             = 4'h0;
assign TX_DATA_81_const_net_1             = 4'h0;
assign TX_DATA_82_const_net_1             = 4'h0;
assign TX_DATA_83_const_net_1             = 4'h0;
assign TX_DATA_84_const_net_1             = 4'h0;
assign TX_DATA_85_const_net_1             = 4'h0;
assign TX_DATA_86_const_net_1             = 4'h0;
assign TX_DATA_87_const_net_1             = 4'h0;
assign TX_DATA_88_const_net_1             = 4'h0;
assign TX_DATA_89_const_net_1             = 4'h0;
assign TX_DATA_90_const_net_1             = 4'h0;
assign TX_DATA_91_const_net_1             = 4'h0;
assign TX_DATA_92_const_net_1             = 4'h0;
assign TX_DATA_93_const_net_1             = 4'h0;
assign TX_DATA_94_const_net_1             = 4'h0;
assign TX_DATA_95_const_net_1             = 4'h0;
assign TX_DATA_96_const_net_1             = 4'h0;
assign TX_DATA_97_const_net_1             = 4'h0;
assign TX_DATA_98_const_net_1             = 4'h0;
assign TX_DATA_99_const_net_1             = 4'h0;
assign TX_DATA_100_const_net_1            = 4'h0;
assign TX_DATA_101_const_net_1            = 4'h0;
assign TX_DATA_102_const_net_1            = 4'h0;
assign TX_DATA_103_const_net_1            = 4'h0;
assign TX_DATA_104_const_net_1            = 4'h0;
assign TX_DATA_105_const_net_1            = 4'h0;
assign TX_DATA_106_const_net_1            = 4'h0;
assign TX_DATA_107_const_net_1            = 4'h0;
assign TX_DATA_108_const_net_1            = 4'h0;
assign TX_DATA_109_const_net_1            = 4'h0;
assign TX_DATA_110_const_net_1            = 4'h0;
assign TX_DATA_111_const_net_1            = 4'h0;
assign TX_DATA_112_const_net_1            = 4'h0;
assign TX_DATA_113_const_net_1            = 4'h0;
assign TX_DATA_114_const_net_1            = 4'h0;
assign TX_DATA_115_const_net_1            = 4'h0;
assign TX_DATA_116_const_net_1            = 4'h0;
assign TX_DATA_117_const_net_1            = 4'h0;
assign TX_DATA_118_const_net_1            = 4'h0;
assign TX_DATA_119_const_net_1            = 4'h0;
assign TX_DATA_120_const_net_1            = 4'h0;
assign TX_DATA_121_const_net_1            = 4'h0;
assign TX_DATA_122_const_net_1            = 4'h0;
assign TX_DATA_123_const_net_1            = 4'h0;
assign TX_DATA_124_const_net_1            = 4'h0;
assign TX_DATA_125_const_net_1            = 4'h0;
assign TX_DATA_126_const_net_1            = 4'h0;
assign TX_DATA_127_const_net_1            = 4'h0;
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
assign OE_DATA_64_const_net_1             = 2'h0;
assign OE_DATA_65_const_net_1             = 2'h0;
assign OE_DATA_66_const_net_1             = 2'h0;
assign OE_DATA_67_const_net_1             = 2'h0;
assign OE_DATA_68_const_net_1             = 2'h0;
assign OE_DATA_69_const_net_1             = 2'h0;
assign OE_DATA_70_const_net_1             = 2'h0;
assign OE_DATA_71_const_net_1             = 2'h0;
assign OE_DATA_72_const_net_1             = 2'h0;
assign OE_DATA_73_const_net_1             = 2'h0;
assign OE_DATA_74_const_net_1             = 2'h0;
assign OE_DATA_75_const_net_1             = 2'h0;
assign OE_DATA_76_const_net_1             = 2'h0;
assign OE_DATA_77_const_net_1             = 2'h0;
assign OE_DATA_78_const_net_1             = 2'h0;
assign OE_DATA_79_const_net_1             = 2'h0;
assign OE_DATA_80_const_net_1             = 2'h0;
assign OE_DATA_81_const_net_1             = 2'h0;
assign OE_DATA_82_const_net_1             = 2'h0;
assign OE_DATA_83_const_net_1             = 2'h0;
assign OE_DATA_84_const_net_1             = 2'h0;
assign OE_DATA_85_const_net_1             = 2'h0;
assign OE_DATA_86_const_net_1             = 2'h0;
assign OE_DATA_87_const_net_1             = 2'h0;
assign OE_DATA_88_const_net_1             = 2'h0;
assign OE_DATA_89_const_net_1             = 2'h0;
assign OE_DATA_90_const_net_1             = 2'h0;
assign OE_DATA_91_const_net_1             = 2'h0;
assign OE_DATA_92_const_net_1             = 2'h0;
assign OE_DATA_93_const_net_1             = 2'h0;
assign OE_DATA_94_const_net_1             = 2'h0;
assign OE_DATA_95_const_net_1             = 2'h0;
assign OE_DATA_96_const_net_1             = 2'h0;
assign OE_DATA_97_const_net_1             = 2'h0;
assign OE_DATA_98_const_net_1             = 2'h0;
assign OE_DATA_99_const_net_1             = 2'h0;
assign OE_DATA_100_const_net_1            = 2'h0;
assign OE_DATA_101_const_net_1            = 2'h0;
assign OE_DATA_102_const_net_1            = 2'h0;
assign OE_DATA_103_const_net_1            = 2'h0;
assign OE_DATA_104_const_net_1            = 2'h0;
assign OE_DATA_105_const_net_1            = 2'h0;
assign OE_DATA_106_const_net_1            = 2'h0;
assign OE_DATA_107_const_net_1            = 2'h0;
assign OE_DATA_108_const_net_1            = 2'h0;
assign OE_DATA_109_const_net_1            = 2'h0;
assign OE_DATA_110_const_net_1            = 2'h0;
assign OE_DATA_111_const_net_1            = 2'h0;
assign OE_DATA_112_const_net_1            = 2'h0;
assign OE_DATA_113_const_net_1            = 2'h0;
assign OE_DATA_114_const_net_1            = 2'h0;
assign OE_DATA_115_const_net_1            = 2'h0;
assign OE_DATA_116_const_net_1            = 2'h0;
assign OE_DATA_117_const_net_1            = 2'h0;
assign OE_DATA_118_const_net_1            = 2'h0;
assign OE_DATA_119_const_net_1            = 2'h0;
assign OE_DATA_120_const_net_1            = 2'h0;
assign OE_DATA_121_const_net_1            = 2'h0;
assign OE_DATA_122_const_net_1            = 2'h0;
assign OE_DATA_123_const_net_1            = 2'h0;
assign OE_DATA_124_const_net_1            = 2'h0;
assign OE_DATA_125_const_net_1            = 2'h0;
assign OE_DATA_126_const_net_1            = 2'h0;
assign OE_DATA_127_const_net_1            = 2'h0;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign B_IN_POST_INV0_0 = ~ ARST_N;
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
// Slices assignments
//--------------------------------------------------------------------
assign TXD_DATA_slice_0[0] = TXD_DATA[0:0];
assign TXD_DATA_slice_1[1] = TXD_DATA[1:1];
assign TXD_DATA_slice_2[2] = TXD_DATA[2:2];
assign TXD_DATA_slice_3[3] = TXD_DATA[3:3];
assign TXD_DATA_slice_4[4] = TXD_DATA[4:4];
assign TXD_DATA_slice_5[5] = TXD_DATA[5:5];
assign TXD_DATA_slice_6[6] = TXD_DATA[6:6];
assign TXD_DATA_slice_7[7] = TXD_DATA[7:7];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign HS_IO_CLK_net_0 = { HS_IO_CLK , HS_IO_CLK_90 };
assign TX_DATA_0_net_0 = { TXD_DATA_slice_7[7] , TXD_DATA_slice_6[6] , TXD_DATA_slice_5[5] , TXD_DATA_slice_4[4] , TXD_DATA_slice_3[3] , TXD_DATA_slice_2[2] , TXD_DATA_slice_1[1] , TXD_DATA_slice_0[0] };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------TXIOD_COMP_LANECTRL_ADDR_CMD_0_PF_LANECTRL   -   Actel:SgCore:PF_LANECTRL:2.0.102
TXIOD_COMP_LANECTRL_ADDR_CMD_0_PF_LANECTRL LANECTRL_ADDR_CMD_0(
        // Inputs
        .HS_IO_CLK                  ( HS_IO_CLK_net_0 ),
        .FAB_CLK                    ( TX_CLK_G ),
        .RESET                      ( GND_net ),
        .DDR_READ                   ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_SEL             ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_LOAD            ( VCC_net ),
        .DELAY_LINE_DIRECTION       ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_MOVE            ( GND_net ), // tied to 1'b0 from definition
        .HS_IO_CLK_PAUSE            ( OR2_PAUSE_Y ),
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

//--------OR2
OR2 OR2_PAUSE(
        // Inputs
        .A ( HS_IO_CLK_PAUSE ),
        .B ( B_IN_POST_INV0_0 ),
        // Outputs
        .Y ( OR2_PAUSE_Y ) 
        );

//--------TXIOD_COMP_PF_IOD_TX_PF_IOD   -   Actel:SgCore:PF_IOD:1.0.218
TXIOD_COMP_PF_IOD_TX_PF_IOD PF_IOD_TX(
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

//--------TXIOD_COMP_PF_IOD_TX_CLK_PF_IOD   -   Actel:SgCore:PF_IOD:1.0.218
TXIOD_COMP_PF_IOD_TX_CLK_PF_IOD PF_IOD_TX_CLK(
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
