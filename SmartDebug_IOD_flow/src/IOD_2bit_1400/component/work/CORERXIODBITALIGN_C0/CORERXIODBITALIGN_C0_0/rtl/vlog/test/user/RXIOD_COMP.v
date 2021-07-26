//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun May  3 18:21:37 2020
// Version: v12.4 12.900.0.14
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// RXIOD_COMP
module RXIOD_COMP(
    // Inputs
    ARST_N,
    CLK_TRAIN_HOLD,
    CLK_TRAIN_RESTART,
    CLK_TRAIN_SKIP,
    DELAY_LINE_DIRECTION,
    DELAY_LINE_LOAD,
    DELAY_LINE_MOVE,
    EYE_MONITOR_CLEAR_FLAGS,
    EYE_MONITOR_WIDTH,
    HS_IO_CLK_PAUSE,
    RXD,
    RXD_N,
    RX_CLK_N,
    RX_CLK_P,
    // Outputs
    CLK_TRAIN_DONE,
    CLK_TRAIN_ERROR,
    DELAY_LINE_OUT_OF_RANGE,
    EYE_MONITOR_EARLY,
    EYE_MONITOR_LATE,
    L0_RXD_DATA,
    RX_CLK_G
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        ARST_N;
input        CLK_TRAIN_HOLD;
input        CLK_TRAIN_RESTART;
input        CLK_TRAIN_SKIP;
input  [0:0] DELAY_LINE_DIRECTION;
input  [0:0] DELAY_LINE_LOAD;
input  [0:0] DELAY_LINE_MOVE;
input  [0:0] EYE_MONITOR_CLEAR_FLAGS;
input  [2:0] EYE_MONITOR_WIDTH;
input        HS_IO_CLK_PAUSE;
input  [0:0] RXD;
input  [0:0] RXD_N;
input        RX_CLK_N;
input        RX_CLK_P;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       CLK_TRAIN_DONE;
output       CLK_TRAIN_ERROR;
output [0:0] DELAY_LINE_OUT_OF_RANGE;
output [0:0] EYE_MONITOR_EARLY;
output [0:0] EYE_MONITOR_LATE;
output [7:0] L0_RXD_DATA;
output       RX_CLK_G;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         ARST_N;
wire         CLK_0_Y;
wire         CLK_TRAIN_DONE_net_0;
wire         CLK_TRAIN_ERROR_net_0;
wire         CLK_TRAIN_HOLD;
wire         CLK_TRAIN_RESTART;
wire         CLK_TRAIN_SKIP;
wire         COREBCLKSCLKALIGN_0_BCLKSCLK_ALGN_PAUSE;
wire         COREBCLKSCLKALIGN_0_ICB_CLK_ALGN_CLR_FLGS;
wire         COREBCLKSCLKALIGN_0_ICB_CLK_ALGN_DIR;
wire         COREBCLKSCLKALIGN_0_ICB_CLK_ALGN_LOAD;
wire         COREBCLKSCLKALIGN_0_ICB_CLK_ALGN_MOV;
wire   [0:0] DELAY_LINE_DIRECTION;
wire   [0:0] DELAY_LINE_LOAD;
wire   [0:0] DELAY_LINE_MOVE;
wire         DELAY_LINE_OUT_OF_RANGE_net_0;
wire   [0:0] EYE_MONITOR_CLEAR_FLAGS;
wire         EYE_MONITOR_EARLY_net_0;
wire         EYE_MONITOR_LATE_net_0;
wire   [2:0] EYE_MONITOR_WIDTH;
wire         HS_IO_CLK_CASCADED_Y;
wire         HS_IO_CLK_FIFO_Y;
wire         HS_IO_CLK_PAUSE;
wire         HS_IO_CLK_RX_Y;
wire   [7:0] L0_RXD_DATA_net_0;
wire         PAUSE_MX_0_Y;
wire         PF_CLK_DIV_FIFO_CLK_DIV_OUT;
wire         PF_CLK_DIV_FIFO_CLK_OUT_HS_IO_CLK;
wire         PF_CLK_DIV_FIFO_DELAY_LINE_OUT_OF_RANGE;
wire         PF_CLK_DIV_RXCLK_CLK_OUT_HS_IO_CLK;
wire         PF_IOD_CLK_TRAINING_EYE_MONITOR_EARLY_0;
wire         PF_IOD_CLK_TRAINING_EYE_MONITOR_LATE_0;
wire         PF_LANECTRL_0_ARST_N;
wire   [2:0] PF_LANECTRL_0_EYE_MONITOR_WIDTH_OUT;
wire   [2:0] PF_LANECTRL_0_FIFO_RD_PTR;
wire   [2:0] PF_LANECTRL_0_FIFO_WR_PTR;
wire   [0:0] PF_LANECTRL_0_RX_DQS_90;
wire         PF_LANECTRL_0_RX_SYNC_RST;
wire         PF_LANECTRL_0_TX_SYNC_RST;
wire         RX_CLK_G_net_0;
wire         RX_CLK_N;
wire         RX_CLK_P;
wire   [0:0] RXD;
wire   [0:0] RXD_N;
wire   [7:0] L0_RXD_DATA_net_1;
wire         RX_CLK_G_net_1;
wire   [0:0] EYE_MONITOR_EARLY_net_1;
wire   [0:0] EYE_MONITOR_LATE_net_1;
wire   [0:0] DELAY_LINE_OUT_OF_RANGE_net_1;
wire         CLK_TRAIN_DONE_net_1;
wire         CLK_TRAIN_ERROR_net_1;
wire   [1:0] HS_IO_CLK_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [2:0] PLL_BCLKPHS_OFFSET_const_net_0;
wire   [7:0] ICB_BCLKPHS_OFFSET_const_net_0;
wire   [3:0] BCLK_IGEAR_RX_const_net_0;
wire         GND_net;
wire   [1:0] RX_DQS_90_const_net_0;
wire   [2:0] FIFO_WR_PTR_const_net_0;
wire   [2:0] FIFO_RD_PTR_const_net_0;
wire   [7:0] TX_DATA_0_const_net_0;
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
wire   [3:0] OE_DATA_0_const_net_0;
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
wire   [7:0] TX_DATA_0_const_net_1;
wire   [7:0] TX_DATA_1_const_net_1;
wire   [7:0] TX_DATA_2_const_net_1;
wire   [7:0] TX_DATA_3_const_net_1;
wire   [7:0] TX_DATA_4_const_net_1;
wire   [7:0] TX_DATA_5_const_net_1;
wire   [7:0] TX_DATA_6_const_net_1;
wire   [7:0] TX_DATA_7_const_net_1;
wire   [7:0] TX_DATA_8_const_net_1;
wire   [7:0] TX_DATA_9_const_net_1;
wire   [7:0] TX_DATA_10_const_net_1;
wire   [7:0] TX_DATA_11_const_net_1;
wire   [7:0] TX_DATA_12_const_net_1;
wire   [7:0] TX_DATA_13_const_net_1;
wire   [7:0] TX_DATA_14_const_net_1;
wire   [7:0] TX_DATA_15_const_net_1;
wire   [7:0] TX_DATA_16_const_net_1;
wire   [7:0] TX_DATA_17_const_net_1;
wire   [7:0] TX_DATA_18_const_net_1;
wire   [7:0] TX_DATA_19_const_net_1;
wire   [7:0] TX_DATA_20_const_net_1;
wire   [7:0] TX_DATA_21_const_net_1;
wire   [7:0] TX_DATA_22_const_net_1;
wire   [7:0] TX_DATA_23_const_net_1;
wire   [7:0] TX_DATA_24_const_net_1;
wire   [7:0] TX_DATA_25_const_net_1;
wire   [7:0] TX_DATA_26_const_net_1;
wire   [7:0] TX_DATA_27_const_net_1;
wire   [7:0] TX_DATA_28_const_net_1;
wire   [7:0] TX_DATA_29_const_net_1;
wire   [7:0] TX_DATA_30_const_net_1;
wire   [7:0] TX_DATA_31_const_net_1;
wire   [7:0] TX_DATA_32_const_net_1;
wire   [7:0] TX_DATA_33_const_net_1;
wire   [7:0] TX_DATA_34_const_net_1;
wire   [7:0] TX_DATA_35_const_net_1;
wire   [7:0] TX_DATA_36_const_net_1;
wire   [7:0] TX_DATA_37_const_net_1;
wire   [7:0] TX_DATA_38_const_net_1;
wire   [7:0] TX_DATA_39_const_net_1;
wire   [7:0] TX_DATA_40_const_net_1;
wire   [7:0] TX_DATA_41_const_net_1;
wire   [7:0] TX_DATA_42_const_net_1;
wire   [7:0] TX_DATA_43_const_net_1;
wire   [7:0] TX_DATA_44_const_net_1;
wire   [7:0] TX_DATA_45_const_net_1;
wire   [7:0] TX_DATA_46_const_net_1;
wire   [7:0] TX_DATA_47_const_net_1;
wire   [7:0] TX_DATA_48_const_net_1;
wire   [7:0] TX_DATA_49_const_net_1;
wire   [7:0] TX_DATA_50_const_net_1;
wire   [7:0] TX_DATA_51_const_net_1;
wire   [7:0] TX_DATA_52_const_net_1;
wire   [7:0] TX_DATA_53_const_net_1;
wire   [7:0] TX_DATA_54_const_net_1;
wire   [7:0] TX_DATA_55_const_net_1;
wire   [7:0] TX_DATA_56_const_net_1;
wire   [7:0] TX_DATA_57_const_net_1;
wire   [7:0] TX_DATA_58_const_net_1;
wire   [7:0] TX_DATA_59_const_net_1;
wire   [7:0] TX_DATA_60_const_net_1;
wire   [7:0] TX_DATA_61_const_net_1;
wire   [7:0] TX_DATA_62_const_net_1;
wire   [7:0] TX_DATA_63_const_net_1;
wire   [7:0] TX_DATA_64_const_net_1;
wire   [7:0] TX_DATA_65_const_net_1;
wire   [7:0] TX_DATA_66_const_net_1;
wire   [7:0] TX_DATA_67_const_net_1;
wire   [7:0] TX_DATA_68_const_net_1;
wire   [7:0] TX_DATA_69_const_net_1;
wire   [7:0] TX_DATA_70_const_net_1;
wire   [7:0] TX_DATA_71_const_net_1;
wire   [7:0] TX_DATA_72_const_net_1;
wire   [7:0] TX_DATA_73_const_net_1;
wire   [7:0] TX_DATA_74_const_net_1;
wire   [7:0] TX_DATA_75_const_net_1;
wire   [7:0] TX_DATA_76_const_net_1;
wire   [7:0] TX_DATA_77_const_net_1;
wire   [7:0] TX_DATA_78_const_net_1;
wire   [7:0] TX_DATA_79_const_net_1;
wire   [7:0] TX_DATA_80_const_net_1;
wire   [7:0] TX_DATA_81_const_net_1;
wire   [7:0] TX_DATA_82_const_net_1;
wire   [7:0] TX_DATA_83_const_net_1;
wire   [7:0] TX_DATA_84_const_net_1;
wire   [7:0] TX_DATA_85_const_net_1;
wire   [7:0] TX_DATA_86_const_net_1;
wire   [7:0] TX_DATA_87_const_net_1;
wire   [7:0] TX_DATA_88_const_net_1;
wire   [7:0] TX_DATA_89_const_net_1;
wire   [7:0] TX_DATA_90_const_net_1;
wire   [7:0] TX_DATA_91_const_net_1;
wire   [7:0] TX_DATA_92_const_net_1;
wire   [7:0] TX_DATA_93_const_net_1;
wire   [7:0] TX_DATA_94_const_net_1;
wire   [7:0] TX_DATA_95_const_net_1;
wire   [7:0] TX_DATA_96_const_net_1;
wire   [7:0] TX_DATA_97_const_net_1;
wire   [7:0] TX_DATA_98_const_net_1;
wire   [7:0] TX_DATA_99_const_net_1;
wire   [7:0] TX_DATA_100_const_net_1;
wire   [7:0] TX_DATA_101_const_net_1;
wire   [7:0] TX_DATA_102_const_net_1;
wire   [7:0] TX_DATA_103_const_net_1;
wire   [7:0] TX_DATA_104_const_net_1;
wire   [7:0] TX_DATA_105_const_net_1;
wire   [7:0] TX_DATA_106_const_net_1;
wire   [7:0] TX_DATA_107_const_net_1;
wire   [7:0] TX_DATA_108_const_net_1;
wire   [7:0] TX_DATA_109_const_net_1;
wire   [7:0] TX_DATA_110_const_net_1;
wire   [7:0] TX_DATA_111_const_net_1;
wire   [7:0] TX_DATA_112_const_net_1;
wire   [7:0] TX_DATA_113_const_net_1;
wire   [7:0] TX_DATA_114_const_net_1;
wire   [7:0] TX_DATA_115_const_net_1;
wire   [7:0] TX_DATA_116_const_net_1;
wire   [7:0] TX_DATA_117_const_net_1;
wire   [7:0] TX_DATA_118_const_net_1;
wire   [7:0] TX_DATA_119_const_net_1;
wire   [7:0] TX_DATA_120_const_net_1;
wire   [7:0] TX_DATA_121_const_net_1;
wire   [7:0] TX_DATA_122_const_net_1;
wire   [7:0] TX_DATA_123_const_net_1;
wire   [7:0] TX_DATA_124_const_net_1;
wire   [7:0] TX_DATA_125_const_net_1;
wire   [7:0] TX_DATA_126_const_net_1;
wire   [7:0] TX_DATA_127_const_net_1;
wire   [3:0] OE_DATA_0_const_net_1;
wire   [3:0] OE_DATA_1_const_net_1;
wire   [3:0] OE_DATA_2_const_net_1;
wire   [3:0] OE_DATA_3_const_net_1;
wire   [3:0] OE_DATA_4_const_net_1;
wire   [3:0] OE_DATA_5_const_net_1;
wire   [3:0] OE_DATA_6_const_net_1;
wire   [3:0] OE_DATA_7_const_net_1;
wire   [3:0] OE_DATA_8_const_net_1;
wire   [3:0] OE_DATA_9_const_net_1;
wire   [3:0] OE_DATA_10_const_net_1;
wire   [3:0] OE_DATA_11_const_net_1;
wire   [3:0] OE_DATA_12_const_net_1;
wire   [3:0] OE_DATA_13_const_net_1;
wire   [3:0] OE_DATA_14_const_net_1;
wire   [3:0] OE_DATA_15_const_net_1;
wire   [3:0] OE_DATA_16_const_net_1;
wire   [3:0] OE_DATA_17_const_net_1;
wire   [3:0] OE_DATA_18_const_net_1;
wire   [3:0] OE_DATA_19_const_net_1;
wire   [3:0] OE_DATA_20_const_net_1;
wire   [3:0] OE_DATA_21_const_net_1;
wire   [3:0] OE_DATA_22_const_net_1;
wire   [3:0] OE_DATA_23_const_net_1;
wire   [3:0] OE_DATA_24_const_net_1;
wire   [3:0] OE_DATA_25_const_net_1;
wire   [3:0] OE_DATA_26_const_net_1;
wire   [3:0] OE_DATA_27_const_net_1;
wire   [3:0] OE_DATA_28_const_net_1;
wire   [3:0] OE_DATA_29_const_net_1;
wire   [3:0] OE_DATA_30_const_net_1;
wire   [3:0] OE_DATA_31_const_net_1;
wire   [3:0] OE_DATA_32_const_net_1;
wire   [3:0] OE_DATA_33_const_net_1;
wire   [3:0] OE_DATA_34_const_net_1;
wire   [3:0] OE_DATA_35_const_net_1;
wire   [3:0] OE_DATA_36_const_net_1;
wire   [3:0] OE_DATA_37_const_net_1;
wire   [3:0] OE_DATA_38_const_net_1;
wire   [3:0] OE_DATA_39_const_net_1;
wire   [3:0] OE_DATA_40_const_net_1;
wire   [3:0] OE_DATA_41_const_net_1;
wire   [3:0] OE_DATA_42_const_net_1;
wire   [3:0] OE_DATA_43_const_net_1;
wire   [3:0] OE_DATA_44_const_net_1;
wire   [3:0] OE_DATA_45_const_net_1;
wire   [3:0] OE_DATA_46_const_net_1;
wire   [3:0] OE_DATA_47_const_net_1;
wire   [3:0] OE_DATA_48_const_net_1;
wire   [3:0] OE_DATA_49_const_net_1;
wire   [3:0] OE_DATA_50_const_net_1;
wire   [3:0] OE_DATA_51_const_net_1;
wire   [3:0] OE_DATA_52_const_net_1;
wire   [3:0] OE_DATA_53_const_net_1;
wire   [3:0] OE_DATA_54_const_net_1;
wire   [3:0] OE_DATA_55_const_net_1;
wire   [3:0] OE_DATA_56_const_net_1;
wire   [3:0] OE_DATA_57_const_net_1;
wire   [3:0] OE_DATA_58_const_net_1;
wire   [3:0] OE_DATA_59_const_net_1;
wire   [3:0] OE_DATA_60_const_net_1;
wire   [3:0] OE_DATA_61_const_net_1;
wire   [3:0] OE_DATA_62_const_net_1;
wire   [3:0] OE_DATA_63_const_net_1;
wire   [3:0] OE_DATA_64_const_net_1;
wire   [3:0] OE_DATA_65_const_net_1;
wire   [3:0] OE_DATA_66_const_net_1;
wire   [3:0] OE_DATA_67_const_net_1;
wire   [3:0] OE_DATA_68_const_net_1;
wire   [3:0] OE_DATA_69_const_net_1;
wire   [3:0] OE_DATA_70_const_net_1;
wire   [3:0] OE_DATA_71_const_net_1;
wire   [3:0] OE_DATA_72_const_net_1;
wire   [3:0] OE_DATA_73_const_net_1;
wire   [3:0] OE_DATA_74_const_net_1;
wire   [3:0] OE_DATA_75_const_net_1;
wire   [3:0] OE_DATA_76_const_net_1;
wire   [3:0] OE_DATA_77_const_net_1;
wire   [3:0] OE_DATA_78_const_net_1;
wire   [3:0] OE_DATA_79_const_net_1;
wire   [3:0] OE_DATA_80_const_net_1;
wire   [3:0] OE_DATA_81_const_net_1;
wire   [3:0] OE_DATA_82_const_net_1;
wire   [3:0] OE_DATA_83_const_net_1;
wire   [3:0] OE_DATA_84_const_net_1;
wire   [3:0] OE_DATA_85_const_net_1;
wire   [3:0] OE_DATA_86_const_net_1;
wire   [3:0] OE_DATA_87_const_net_1;
wire   [3:0] OE_DATA_88_const_net_1;
wire   [3:0] OE_DATA_89_const_net_1;
wire   [3:0] OE_DATA_90_const_net_1;
wire   [3:0] OE_DATA_91_const_net_1;
wire   [3:0] OE_DATA_92_const_net_1;
wire   [3:0] OE_DATA_93_const_net_1;
wire   [3:0] OE_DATA_94_const_net_1;
wire   [3:0] OE_DATA_95_const_net_1;
wire   [3:0] OE_DATA_96_const_net_1;
wire   [3:0] OE_DATA_97_const_net_1;
wire   [3:0] OE_DATA_98_const_net_1;
wire   [3:0] OE_DATA_99_const_net_1;
wire   [3:0] OE_DATA_100_const_net_1;
wire   [3:0] OE_DATA_101_const_net_1;
wire   [3:0] OE_DATA_102_const_net_1;
wire   [3:0] OE_DATA_103_const_net_1;
wire   [3:0] OE_DATA_104_const_net_1;
wire   [3:0] OE_DATA_105_const_net_1;
wire   [3:0] OE_DATA_106_const_net_1;
wire   [3:0] OE_DATA_107_const_net_1;
wire   [3:0] OE_DATA_108_const_net_1;
wire   [3:0] OE_DATA_109_const_net_1;
wire   [3:0] OE_DATA_110_const_net_1;
wire   [3:0] OE_DATA_111_const_net_1;
wire   [3:0] OE_DATA_112_const_net_1;
wire   [3:0] OE_DATA_113_const_net_1;
wire   [3:0] OE_DATA_114_const_net_1;
wire   [3:0] OE_DATA_115_const_net_1;
wire   [3:0] OE_DATA_116_const_net_1;
wire   [3:0] OE_DATA_117_const_net_1;
wire   [3:0] OE_DATA_118_const_net_1;
wire   [3:0] OE_DATA_119_const_net_1;
wire   [3:0] OE_DATA_120_const_net_1;
wire   [3:0] OE_DATA_121_const_net_1;
wire   [3:0] OE_DATA_122_const_net_1;
wire   [3:0] OE_DATA_123_const_net_1;
wire   [3:0] OE_DATA_124_const_net_1;
wire   [3:0] OE_DATA_125_const_net_1;
wire   [3:0] OE_DATA_126_const_net_1;
wire   [3:0] OE_DATA_127_const_net_1;
wire   [7:0] DLL_CODE_const_net_0;
wire   [2:0] READ_CLK_SEL_const_net_0;
wire   [7:0] CDR_CLK_A_SEL_const_net_0;
wire         VCC_net;
wire   [10:0]CDR_CLK_B_SEL_const_net_0;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire         RESET_IN_POST_INV0_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign PLL_BCLKPHS_OFFSET_const_net_0 = 3'h0;
assign ICB_BCLKPHS_OFFSET_const_net_0 = 8'h00;
assign BCLK_IGEAR_RX_const_net_0      = 4'h0;
assign GND_net                        = 1'b0;
assign RX_DQS_90_const_net_0          = 2'h0;
assign FIFO_WR_PTR_const_net_0        = 3'h0;
assign FIFO_RD_PTR_const_net_0        = 3'h0;
assign TX_DATA_0_const_net_0          = 8'h00;
assign TX_DATA_1_const_net_0          = 8'h00;
assign TX_DATA_2_const_net_0          = 8'h00;
assign TX_DATA_3_const_net_0          = 8'h00;
assign TX_DATA_4_const_net_0          = 8'h00;
assign TX_DATA_5_const_net_0          = 8'h00;
assign TX_DATA_6_const_net_0          = 8'h00;
assign TX_DATA_7_const_net_0          = 8'h00;
assign TX_DATA_8_const_net_0          = 8'h00;
assign TX_DATA_9_const_net_0          = 8'h00;
assign TX_DATA_10_const_net_0         = 8'h00;
assign TX_DATA_11_const_net_0         = 8'h00;
assign TX_DATA_12_const_net_0         = 8'h00;
assign TX_DATA_13_const_net_0         = 8'h00;
assign TX_DATA_14_const_net_0         = 8'h00;
assign TX_DATA_15_const_net_0         = 8'h00;
assign TX_DATA_16_const_net_0         = 8'h00;
assign TX_DATA_17_const_net_0         = 8'h00;
assign TX_DATA_18_const_net_0         = 8'h00;
assign TX_DATA_19_const_net_0         = 8'h00;
assign TX_DATA_20_const_net_0         = 8'h00;
assign TX_DATA_21_const_net_0         = 8'h00;
assign TX_DATA_22_const_net_0         = 8'h00;
assign TX_DATA_23_const_net_0         = 8'h00;
assign TX_DATA_24_const_net_0         = 8'h00;
assign TX_DATA_25_const_net_0         = 8'h00;
assign TX_DATA_26_const_net_0         = 8'h00;
assign TX_DATA_27_const_net_0         = 8'h00;
assign TX_DATA_28_const_net_0         = 8'h00;
assign TX_DATA_29_const_net_0         = 8'h00;
assign TX_DATA_30_const_net_0         = 8'h00;
assign TX_DATA_31_const_net_0         = 8'h00;
assign TX_DATA_32_const_net_0         = 8'h00;
assign TX_DATA_33_const_net_0         = 8'h00;
assign TX_DATA_34_const_net_0         = 8'h00;
assign TX_DATA_35_const_net_0         = 8'h00;
assign TX_DATA_36_const_net_0         = 8'h00;
assign TX_DATA_37_const_net_0         = 8'h00;
assign TX_DATA_38_const_net_0         = 8'h00;
assign TX_DATA_39_const_net_0         = 8'h00;
assign TX_DATA_40_const_net_0         = 8'h00;
assign TX_DATA_41_const_net_0         = 8'h00;
assign TX_DATA_42_const_net_0         = 8'h00;
assign TX_DATA_43_const_net_0         = 8'h00;
assign TX_DATA_44_const_net_0         = 8'h00;
assign TX_DATA_45_const_net_0         = 8'h00;
assign TX_DATA_46_const_net_0         = 8'h00;
assign TX_DATA_47_const_net_0         = 8'h00;
assign TX_DATA_48_const_net_0         = 8'h00;
assign TX_DATA_49_const_net_0         = 8'h00;
assign TX_DATA_50_const_net_0         = 8'h00;
assign TX_DATA_51_const_net_0         = 8'h00;
assign TX_DATA_52_const_net_0         = 8'h00;
assign TX_DATA_53_const_net_0         = 8'h00;
assign TX_DATA_54_const_net_0         = 8'h00;
assign TX_DATA_55_const_net_0         = 8'h00;
assign TX_DATA_56_const_net_0         = 8'h00;
assign TX_DATA_57_const_net_0         = 8'h00;
assign TX_DATA_58_const_net_0         = 8'h00;
assign TX_DATA_59_const_net_0         = 8'h00;
assign TX_DATA_60_const_net_0         = 8'h00;
assign TX_DATA_61_const_net_0         = 8'h00;
assign TX_DATA_62_const_net_0         = 8'h00;
assign TX_DATA_63_const_net_0         = 8'h00;
assign TX_DATA_64_const_net_0         = 8'h00;
assign TX_DATA_65_const_net_0         = 8'h00;
assign TX_DATA_66_const_net_0         = 8'h00;
assign TX_DATA_67_const_net_0         = 8'h00;
assign TX_DATA_68_const_net_0         = 8'h00;
assign TX_DATA_69_const_net_0         = 8'h00;
assign TX_DATA_70_const_net_0         = 8'h00;
assign TX_DATA_71_const_net_0         = 8'h00;
assign TX_DATA_72_const_net_0         = 8'h00;
assign TX_DATA_73_const_net_0         = 8'h00;
assign TX_DATA_74_const_net_0         = 8'h00;
assign TX_DATA_75_const_net_0         = 8'h00;
assign TX_DATA_76_const_net_0         = 8'h00;
assign TX_DATA_77_const_net_0         = 8'h00;
assign TX_DATA_78_const_net_0         = 8'h00;
assign TX_DATA_79_const_net_0         = 8'h00;
assign TX_DATA_80_const_net_0         = 8'h00;
assign TX_DATA_81_const_net_0         = 8'h00;
assign TX_DATA_82_const_net_0         = 8'h00;
assign TX_DATA_83_const_net_0         = 8'h00;
assign TX_DATA_84_const_net_0         = 8'h00;
assign TX_DATA_85_const_net_0         = 8'h00;
assign TX_DATA_86_const_net_0         = 8'h00;
assign TX_DATA_87_const_net_0         = 8'h00;
assign TX_DATA_88_const_net_0         = 8'h00;
assign TX_DATA_89_const_net_0         = 8'h00;
assign TX_DATA_90_const_net_0         = 8'h00;
assign TX_DATA_91_const_net_0         = 8'h00;
assign TX_DATA_92_const_net_0         = 8'h00;
assign TX_DATA_93_const_net_0         = 8'h00;
assign TX_DATA_94_const_net_0         = 8'h00;
assign TX_DATA_95_const_net_0         = 8'h00;
assign TX_DATA_96_const_net_0         = 8'h00;
assign TX_DATA_97_const_net_0         = 8'h00;
assign TX_DATA_98_const_net_0         = 8'h00;
assign TX_DATA_99_const_net_0         = 8'h00;
assign TX_DATA_100_const_net_0        = 8'h00;
assign TX_DATA_101_const_net_0        = 8'h00;
assign TX_DATA_102_const_net_0        = 8'h00;
assign TX_DATA_103_const_net_0        = 8'h00;
assign TX_DATA_104_const_net_0        = 8'h00;
assign TX_DATA_105_const_net_0        = 8'h00;
assign TX_DATA_106_const_net_0        = 8'h00;
assign TX_DATA_107_const_net_0        = 8'h00;
assign TX_DATA_108_const_net_0        = 8'h00;
assign TX_DATA_109_const_net_0        = 8'h00;
assign TX_DATA_110_const_net_0        = 8'h00;
assign TX_DATA_111_const_net_0        = 8'h00;
assign TX_DATA_112_const_net_0        = 8'h00;
assign TX_DATA_113_const_net_0        = 8'h00;
assign TX_DATA_114_const_net_0        = 8'h00;
assign TX_DATA_115_const_net_0        = 8'h00;
assign TX_DATA_116_const_net_0        = 8'h00;
assign TX_DATA_117_const_net_0        = 8'h00;
assign TX_DATA_118_const_net_0        = 8'h00;
assign TX_DATA_119_const_net_0        = 8'h00;
assign TX_DATA_120_const_net_0        = 8'h00;
assign TX_DATA_121_const_net_0        = 8'h00;
assign TX_DATA_122_const_net_0        = 8'h00;
assign TX_DATA_123_const_net_0        = 8'h00;
assign TX_DATA_124_const_net_0        = 8'h00;
assign TX_DATA_125_const_net_0        = 8'h00;
assign TX_DATA_126_const_net_0        = 8'h00;
assign TX_DATA_127_const_net_0        = 8'h00;
assign OE_DATA_0_const_net_0          = 4'h0;
assign OE_DATA_1_const_net_0          = 4'h0;
assign OE_DATA_2_const_net_0          = 4'h0;
assign OE_DATA_3_const_net_0          = 4'h0;
assign OE_DATA_4_const_net_0          = 4'h0;
assign OE_DATA_5_const_net_0          = 4'h0;
assign OE_DATA_6_const_net_0          = 4'h0;
assign OE_DATA_7_const_net_0          = 4'h0;
assign OE_DATA_8_const_net_0          = 4'h0;
assign OE_DATA_9_const_net_0          = 4'h0;
assign OE_DATA_10_const_net_0         = 4'h0;
assign OE_DATA_11_const_net_0         = 4'h0;
assign OE_DATA_12_const_net_0         = 4'h0;
assign OE_DATA_13_const_net_0         = 4'h0;
assign OE_DATA_14_const_net_0         = 4'h0;
assign OE_DATA_15_const_net_0         = 4'h0;
assign OE_DATA_16_const_net_0         = 4'h0;
assign OE_DATA_17_const_net_0         = 4'h0;
assign OE_DATA_18_const_net_0         = 4'h0;
assign OE_DATA_19_const_net_0         = 4'h0;
assign OE_DATA_20_const_net_0         = 4'h0;
assign OE_DATA_21_const_net_0         = 4'h0;
assign OE_DATA_22_const_net_0         = 4'h0;
assign OE_DATA_23_const_net_0         = 4'h0;
assign OE_DATA_24_const_net_0         = 4'h0;
assign OE_DATA_25_const_net_0         = 4'h0;
assign OE_DATA_26_const_net_0         = 4'h0;
assign OE_DATA_27_const_net_0         = 4'h0;
assign OE_DATA_28_const_net_0         = 4'h0;
assign OE_DATA_29_const_net_0         = 4'h0;
assign OE_DATA_30_const_net_0         = 4'h0;
assign OE_DATA_31_const_net_0         = 4'h0;
assign OE_DATA_32_const_net_0         = 4'h0;
assign OE_DATA_33_const_net_0         = 4'h0;
assign OE_DATA_34_const_net_0         = 4'h0;
assign OE_DATA_35_const_net_0         = 4'h0;
assign OE_DATA_36_const_net_0         = 4'h0;
assign OE_DATA_37_const_net_0         = 4'h0;
assign OE_DATA_38_const_net_0         = 4'h0;
assign OE_DATA_39_const_net_0         = 4'h0;
assign OE_DATA_40_const_net_0         = 4'h0;
assign OE_DATA_41_const_net_0         = 4'h0;
assign OE_DATA_42_const_net_0         = 4'h0;
assign OE_DATA_43_const_net_0         = 4'h0;
assign OE_DATA_44_const_net_0         = 4'h0;
assign OE_DATA_45_const_net_0         = 4'h0;
assign OE_DATA_46_const_net_0         = 4'h0;
assign OE_DATA_47_const_net_0         = 4'h0;
assign OE_DATA_48_const_net_0         = 4'h0;
assign OE_DATA_49_const_net_0         = 4'h0;
assign OE_DATA_50_const_net_0         = 4'h0;
assign OE_DATA_51_const_net_0         = 4'h0;
assign OE_DATA_52_const_net_0         = 4'h0;
assign OE_DATA_53_const_net_0         = 4'h0;
assign OE_DATA_54_const_net_0         = 4'h0;
assign OE_DATA_55_const_net_0         = 4'h0;
assign OE_DATA_56_const_net_0         = 4'h0;
assign OE_DATA_57_const_net_0         = 4'h0;
assign OE_DATA_58_const_net_0         = 4'h0;
assign OE_DATA_59_const_net_0         = 4'h0;
assign OE_DATA_60_const_net_0         = 4'h0;
assign OE_DATA_61_const_net_0         = 4'h0;
assign OE_DATA_62_const_net_0         = 4'h0;
assign OE_DATA_63_const_net_0         = 4'h0;
assign OE_DATA_64_const_net_0         = 4'h0;
assign OE_DATA_65_const_net_0         = 4'h0;
assign OE_DATA_66_const_net_0         = 4'h0;
assign OE_DATA_67_const_net_0         = 4'h0;
assign OE_DATA_68_const_net_0         = 4'h0;
assign OE_DATA_69_const_net_0         = 4'h0;
assign OE_DATA_70_const_net_0         = 4'h0;
assign OE_DATA_71_const_net_0         = 4'h0;
assign OE_DATA_72_const_net_0         = 4'h0;
assign OE_DATA_73_const_net_0         = 4'h0;
assign OE_DATA_74_const_net_0         = 4'h0;
assign OE_DATA_75_const_net_0         = 4'h0;
assign OE_DATA_76_const_net_0         = 4'h0;
assign OE_DATA_77_const_net_0         = 4'h0;
assign OE_DATA_78_const_net_0         = 4'h0;
assign OE_DATA_79_const_net_0         = 4'h0;
assign OE_DATA_80_const_net_0         = 4'h0;
assign OE_DATA_81_const_net_0         = 4'h0;
assign OE_DATA_82_const_net_0         = 4'h0;
assign OE_DATA_83_const_net_0         = 4'h0;
assign OE_DATA_84_const_net_0         = 4'h0;
assign OE_DATA_85_const_net_0         = 4'h0;
assign OE_DATA_86_const_net_0         = 4'h0;
assign OE_DATA_87_const_net_0         = 4'h0;
assign OE_DATA_88_const_net_0         = 4'h0;
assign OE_DATA_89_const_net_0         = 4'h0;
assign OE_DATA_90_const_net_0         = 4'h0;
assign OE_DATA_91_const_net_0         = 4'h0;
assign OE_DATA_92_const_net_0         = 4'h0;
assign OE_DATA_93_const_net_0         = 4'h0;
assign OE_DATA_94_const_net_0         = 4'h0;
assign OE_DATA_95_const_net_0         = 4'h0;
assign OE_DATA_96_const_net_0         = 4'h0;
assign OE_DATA_97_const_net_0         = 4'h0;
assign OE_DATA_98_const_net_0         = 4'h0;
assign OE_DATA_99_const_net_0         = 4'h0;
assign OE_DATA_100_const_net_0        = 4'h0;
assign OE_DATA_101_const_net_0        = 4'h0;
assign OE_DATA_102_const_net_0        = 4'h0;
assign OE_DATA_103_const_net_0        = 4'h0;
assign OE_DATA_104_const_net_0        = 4'h0;
assign OE_DATA_105_const_net_0        = 4'h0;
assign OE_DATA_106_const_net_0        = 4'h0;
assign OE_DATA_107_const_net_0        = 4'h0;
assign OE_DATA_108_const_net_0        = 4'h0;
assign OE_DATA_109_const_net_0        = 4'h0;
assign OE_DATA_110_const_net_0        = 4'h0;
assign OE_DATA_111_const_net_0        = 4'h0;
assign OE_DATA_112_const_net_0        = 4'h0;
assign OE_DATA_113_const_net_0        = 4'h0;
assign OE_DATA_114_const_net_0        = 4'h0;
assign OE_DATA_115_const_net_0        = 4'h0;
assign OE_DATA_116_const_net_0        = 4'h0;
assign OE_DATA_117_const_net_0        = 4'h0;
assign OE_DATA_118_const_net_0        = 4'h0;
assign OE_DATA_119_const_net_0        = 4'h0;
assign OE_DATA_120_const_net_0        = 4'h0;
assign OE_DATA_121_const_net_0        = 4'h0;
assign OE_DATA_122_const_net_0        = 4'h0;
assign OE_DATA_123_const_net_0        = 4'h0;
assign OE_DATA_124_const_net_0        = 4'h0;
assign OE_DATA_125_const_net_0        = 4'h0;
assign OE_DATA_126_const_net_0        = 4'h0;
assign OE_DATA_127_const_net_0        = 4'h0;
assign TX_DATA_0_const_net_1          = 8'h00;
assign TX_DATA_1_const_net_1          = 8'h00;
assign TX_DATA_2_const_net_1          = 8'h00;
assign TX_DATA_3_const_net_1          = 8'h00;
assign TX_DATA_4_const_net_1          = 8'h00;
assign TX_DATA_5_const_net_1          = 8'h00;
assign TX_DATA_6_const_net_1          = 8'h00;
assign TX_DATA_7_const_net_1          = 8'h00;
assign TX_DATA_8_const_net_1          = 8'h00;
assign TX_DATA_9_const_net_1          = 8'h00;
assign TX_DATA_10_const_net_1         = 8'h00;
assign TX_DATA_11_const_net_1         = 8'h00;
assign TX_DATA_12_const_net_1         = 8'h00;
assign TX_DATA_13_const_net_1         = 8'h00;
assign TX_DATA_14_const_net_1         = 8'h00;
assign TX_DATA_15_const_net_1         = 8'h00;
assign TX_DATA_16_const_net_1         = 8'h00;
assign TX_DATA_17_const_net_1         = 8'h00;
assign TX_DATA_18_const_net_1         = 8'h00;
assign TX_DATA_19_const_net_1         = 8'h00;
assign TX_DATA_20_const_net_1         = 8'h00;
assign TX_DATA_21_const_net_1         = 8'h00;
assign TX_DATA_22_const_net_1         = 8'h00;
assign TX_DATA_23_const_net_1         = 8'h00;
assign TX_DATA_24_const_net_1         = 8'h00;
assign TX_DATA_25_const_net_1         = 8'h00;
assign TX_DATA_26_const_net_1         = 8'h00;
assign TX_DATA_27_const_net_1         = 8'h00;
assign TX_DATA_28_const_net_1         = 8'h00;
assign TX_DATA_29_const_net_1         = 8'h00;
assign TX_DATA_30_const_net_1         = 8'h00;
assign TX_DATA_31_const_net_1         = 8'h00;
assign TX_DATA_32_const_net_1         = 8'h00;
assign TX_DATA_33_const_net_1         = 8'h00;
assign TX_DATA_34_const_net_1         = 8'h00;
assign TX_DATA_35_const_net_1         = 8'h00;
assign TX_DATA_36_const_net_1         = 8'h00;
assign TX_DATA_37_const_net_1         = 8'h00;
assign TX_DATA_38_const_net_1         = 8'h00;
assign TX_DATA_39_const_net_1         = 8'h00;
assign TX_DATA_40_const_net_1         = 8'h00;
assign TX_DATA_41_const_net_1         = 8'h00;
assign TX_DATA_42_const_net_1         = 8'h00;
assign TX_DATA_43_const_net_1         = 8'h00;
assign TX_DATA_44_const_net_1         = 8'h00;
assign TX_DATA_45_const_net_1         = 8'h00;
assign TX_DATA_46_const_net_1         = 8'h00;
assign TX_DATA_47_const_net_1         = 8'h00;
assign TX_DATA_48_const_net_1         = 8'h00;
assign TX_DATA_49_const_net_1         = 8'h00;
assign TX_DATA_50_const_net_1         = 8'h00;
assign TX_DATA_51_const_net_1         = 8'h00;
assign TX_DATA_52_const_net_1         = 8'h00;
assign TX_DATA_53_const_net_1         = 8'h00;
assign TX_DATA_54_const_net_1         = 8'h00;
assign TX_DATA_55_const_net_1         = 8'h00;
assign TX_DATA_56_const_net_1         = 8'h00;
assign TX_DATA_57_const_net_1         = 8'h00;
assign TX_DATA_58_const_net_1         = 8'h00;
assign TX_DATA_59_const_net_1         = 8'h00;
assign TX_DATA_60_const_net_1         = 8'h00;
assign TX_DATA_61_const_net_1         = 8'h00;
assign TX_DATA_62_const_net_1         = 8'h00;
assign TX_DATA_63_const_net_1         = 8'h00;
assign TX_DATA_64_const_net_1         = 8'h00;
assign TX_DATA_65_const_net_1         = 8'h00;
assign TX_DATA_66_const_net_1         = 8'h00;
assign TX_DATA_67_const_net_1         = 8'h00;
assign TX_DATA_68_const_net_1         = 8'h00;
assign TX_DATA_69_const_net_1         = 8'h00;
assign TX_DATA_70_const_net_1         = 8'h00;
assign TX_DATA_71_const_net_1         = 8'h00;
assign TX_DATA_72_const_net_1         = 8'h00;
assign TX_DATA_73_const_net_1         = 8'h00;
assign TX_DATA_74_const_net_1         = 8'h00;
assign TX_DATA_75_const_net_1         = 8'h00;
assign TX_DATA_76_const_net_1         = 8'h00;
assign TX_DATA_77_const_net_1         = 8'h00;
assign TX_DATA_78_const_net_1         = 8'h00;
assign TX_DATA_79_const_net_1         = 8'h00;
assign TX_DATA_80_const_net_1         = 8'h00;
assign TX_DATA_81_const_net_1         = 8'h00;
assign TX_DATA_82_const_net_1         = 8'h00;
assign TX_DATA_83_const_net_1         = 8'h00;
assign TX_DATA_84_const_net_1         = 8'h00;
assign TX_DATA_85_const_net_1         = 8'h00;
assign TX_DATA_86_const_net_1         = 8'h00;
assign TX_DATA_87_const_net_1         = 8'h00;
assign TX_DATA_88_const_net_1         = 8'h00;
assign TX_DATA_89_const_net_1         = 8'h00;
assign TX_DATA_90_const_net_1         = 8'h00;
assign TX_DATA_91_const_net_1         = 8'h00;
assign TX_DATA_92_const_net_1         = 8'h00;
assign TX_DATA_93_const_net_1         = 8'h00;
assign TX_DATA_94_const_net_1         = 8'h00;
assign TX_DATA_95_const_net_1         = 8'h00;
assign TX_DATA_96_const_net_1         = 8'h00;
assign TX_DATA_97_const_net_1         = 8'h00;
assign TX_DATA_98_const_net_1         = 8'h00;
assign TX_DATA_99_const_net_1         = 8'h00;
assign TX_DATA_100_const_net_1        = 8'h00;
assign TX_DATA_101_const_net_1        = 8'h00;
assign TX_DATA_102_const_net_1        = 8'h00;
assign TX_DATA_103_const_net_1        = 8'h00;
assign TX_DATA_104_const_net_1        = 8'h00;
assign TX_DATA_105_const_net_1        = 8'h00;
assign TX_DATA_106_const_net_1        = 8'h00;
assign TX_DATA_107_const_net_1        = 8'h00;
assign TX_DATA_108_const_net_1        = 8'h00;
assign TX_DATA_109_const_net_1        = 8'h00;
assign TX_DATA_110_const_net_1        = 8'h00;
assign TX_DATA_111_const_net_1        = 8'h00;
assign TX_DATA_112_const_net_1        = 8'h00;
assign TX_DATA_113_const_net_1        = 8'h00;
assign TX_DATA_114_const_net_1        = 8'h00;
assign TX_DATA_115_const_net_1        = 8'h00;
assign TX_DATA_116_const_net_1        = 8'h00;
assign TX_DATA_117_const_net_1        = 8'h00;
assign TX_DATA_118_const_net_1        = 8'h00;
assign TX_DATA_119_const_net_1        = 8'h00;
assign TX_DATA_120_const_net_1        = 8'h00;
assign TX_DATA_121_const_net_1        = 8'h00;
assign TX_DATA_122_const_net_1        = 8'h00;
assign TX_DATA_123_const_net_1        = 8'h00;
assign TX_DATA_124_const_net_1        = 8'h00;
assign TX_DATA_125_const_net_1        = 8'h00;
assign TX_DATA_126_const_net_1        = 8'h00;
assign TX_DATA_127_const_net_1        = 8'h00;
assign OE_DATA_0_const_net_1          = 4'h0;
assign OE_DATA_1_const_net_1          = 4'h0;
assign OE_DATA_2_const_net_1          = 4'h0;
assign OE_DATA_3_const_net_1          = 4'h0;
assign OE_DATA_4_const_net_1          = 4'h0;
assign OE_DATA_5_const_net_1          = 4'h0;
assign OE_DATA_6_const_net_1          = 4'h0;
assign OE_DATA_7_const_net_1          = 4'h0;
assign OE_DATA_8_const_net_1          = 4'h0;
assign OE_DATA_9_const_net_1          = 4'h0;
assign OE_DATA_10_const_net_1         = 4'h0;
assign OE_DATA_11_const_net_1         = 4'h0;
assign OE_DATA_12_const_net_1         = 4'h0;
assign OE_DATA_13_const_net_1         = 4'h0;
assign OE_DATA_14_const_net_1         = 4'h0;
assign OE_DATA_15_const_net_1         = 4'h0;
assign OE_DATA_16_const_net_1         = 4'h0;
assign OE_DATA_17_const_net_1         = 4'h0;
assign OE_DATA_18_const_net_1         = 4'h0;
assign OE_DATA_19_const_net_1         = 4'h0;
assign OE_DATA_20_const_net_1         = 4'h0;
assign OE_DATA_21_const_net_1         = 4'h0;
assign OE_DATA_22_const_net_1         = 4'h0;
assign OE_DATA_23_const_net_1         = 4'h0;
assign OE_DATA_24_const_net_1         = 4'h0;
assign OE_DATA_25_const_net_1         = 4'h0;
assign OE_DATA_26_const_net_1         = 4'h0;
assign OE_DATA_27_const_net_1         = 4'h0;
assign OE_DATA_28_const_net_1         = 4'h0;
assign OE_DATA_29_const_net_1         = 4'h0;
assign OE_DATA_30_const_net_1         = 4'h0;
assign OE_DATA_31_const_net_1         = 4'h0;
assign OE_DATA_32_const_net_1         = 4'h0;
assign OE_DATA_33_const_net_1         = 4'h0;
assign OE_DATA_34_const_net_1         = 4'h0;
assign OE_DATA_35_const_net_1         = 4'h0;
assign OE_DATA_36_const_net_1         = 4'h0;
assign OE_DATA_37_const_net_1         = 4'h0;
assign OE_DATA_38_const_net_1         = 4'h0;
assign OE_DATA_39_const_net_1         = 4'h0;
assign OE_DATA_40_const_net_1         = 4'h0;
assign OE_DATA_41_const_net_1         = 4'h0;
assign OE_DATA_42_const_net_1         = 4'h0;
assign OE_DATA_43_const_net_1         = 4'h0;
assign OE_DATA_44_const_net_1         = 4'h0;
assign OE_DATA_45_const_net_1         = 4'h0;
assign OE_DATA_46_const_net_1         = 4'h0;
assign OE_DATA_47_const_net_1         = 4'h0;
assign OE_DATA_48_const_net_1         = 4'h0;
assign OE_DATA_49_const_net_1         = 4'h0;
assign OE_DATA_50_const_net_1         = 4'h0;
assign OE_DATA_51_const_net_1         = 4'h0;
assign OE_DATA_52_const_net_1         = 4'h0;
assign OE_DATA_53_const_net_1         = 4'h0;
assign OE_DATA_54_const_net_1         = 4'h0;
assign OE_DATA_55_const_net_1         = 4'h0;
assign OE_DATA_56_const_net_1         = 4'h0;
assign OE_DATA_57_const_net_1         = 4'h0;
assign OE_DATA_58_const_net_1         = 4'h0;
assign OE_DATA_59_const_net_1         = 4'h0;
assign OE_DATA_60_const_net_1         = 4'h0;
assign OE_DATA_61_const_net_1         = 4'h0;
assign OE_DATA_62_const_net_1         = 4'h0;
assign OE_DATA_63_const_net_1         = 4'h0;
assign OE_DATA_64_const_net_1         = 4'h0;
assign OE_DATA_65_const_net_1         = 4'h0;
assign OE_DATA_66_const_net_1         = 4'h0;
assign OE_DATA_67_const_net_1         = 4'h0;
assign OE_DATA_68_const_net_1         = 4'h0;
assign OE_DATA_69_const_net_1         = 4'h0;
assign OE_DATA_70_const_net_1         = 4'h0;
assign OE_DATA_71_const_net_1         = 4'h0;
assign OE_DATA_72_const_net_1         = 4'h0;
assign OE_DATA_73_const_net_1         = 4'h0;
assign OE_DATA_74_const_net_1         = 4'h0;
assign OE_DATA_75_const_net_1         = 4'h0;
assign OE_DATA_76_const_net_1         = 4'h0;
assign OE_DATA_77_const_net_1         = 4'h0;
assign OE_DATA_78_const_net_1         = 4'h0;
assign OE_DATA_79_const_net_1         = 4'h0;
assign OE_DATA_80_const_net_1         = 4'h0;
assign OE_DATA_81_const_net_1         = 4'h0;
assign OE_DATA_82_const_net_1         = 4'h0;
assign OE_DATA_83_const_net_1         = 4'h0;
assign OE_DATA_84_const_net_1         = 4'h0;
assign OE_DATA_85_const_net_1         = 4'h0;
assign OE_DATA_86_const_net_1         = 4'h0;
assign OE_DATA_87_const_net_1         = 4'h0;
assign OE_DATA_88_const_net_1         = 4'h0;
assign OE_DATA_89_const_net_1         = 4'h0;
assign OE_DATA_90_const_net_1         = 4'h0;
assign OE_DATA_91_const_net_1         = 4'h0;
assign OE_DATA_92_const_net_1         = 4'h0;
assign OE_DATA_93_const_net_1         = 4'h0;
assign OE_DATA_94_const_net_1         = 4'h0;
assign OE_DATA_95_const_net_1         = 4'h0;
assign OE_DATA_96_const_net_1         = 4'h0;
assign OE_DATA_97_const_net_1         = 4'h0;
assign OE_DATA_98_const_net_1         = 4'h0;
assign OE_DATA_99_const_net_1         = 4'h0;
assign OE_DATA_100_const_net_1        = 4'h0;
assign OE_DATA_101_const_net_1        = 4'h0;
assign OE_DATA_102_const_net_1        = 4'h0;
assign OE_DATA_103_const_net_1        = 4'h0;
assign OE_DATA_104_const_net_1        = 4'h0;
assign OE_DATA_105_const_net_1        = 4'h0;
assign OE_DATA_106_const_net_1        = 4'h0;
assign OE_DATA_107_const_net_1        = 4'h0;
assign OE_DATA_108_const_net_1        = 4'h0;
assign OE_DATA_109_const_net_1        = 4'h0;
assign OE_DATA_110_const_net_1        = 4'h0;
assign OE_DATA_111_const_net_1        = 4'h0;
assign OE_DATA_112_const_net_1        = 4'h0;
assign OE_DATA_113_const_net_1        = 4'h0;
assign OE_DATA_114_const_net_1        = 4'h0;
assign OE_DATA_115_const_net_1        = 4'h0;
assign OE_DATA_116_const_net_1        = 4'h0;
assign OE_DATA_117_const_net_1        = 4'h0;
assign OE_DATA_118_const_net_1        = 4'h0;
assign OE_DATA_119_const_net_1        = 4'h0;
assign OE_DATA_120_const_net_1        = 4'h0;
assign OE_DATA_121_const_net_1        = 4'h0;
assign OE_DATA_122_const_net_1        = 4'h0;
assign OE_DATA_123_const_net_1        = 4'h0;
assign OE_DATA_124_const_net_1        = 4'h0;
assign OE_DATA_125_const_net_1        = 4'h0;
assign OE_DATA_126_const_net_1        = 4'h0;
assign OE_DATA_127_const_net_1        = 4'h0;
assign DLL_CODE_const_net_0           = 8'h00;
assign READ_CLK_SEL_const_net_0       = 3'h0;
assign CDR_CLK_A_SEL_const_net_0      = 8'h00;
assign VCC_net                        = 1'b1;
assign CDR_CLK_B_SEL_const_net_0      = 11'h000;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign RESET_IN_POST_INV0_0 = ~ ARST_N;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign L0_RXD_DATA_net_1                = L0_RXD_DATA_net_0;
assign L0_RXD_DATA[7:0]                 = L0_RXD_DATA_net_1;
assign RX_CLK_G_net_1                   = RX_CLK_G_net_0;
assign RX_CLK_G                         = RX_CLK_G_net_1;
assign EYE_MONITOR_EARLY_net_1[0]       = EYE_MONITOR_EARLY_net_0;
assign EYE_MONITOR_EARLY[0:0]           = EYE_MONITOR_EARLY_net_1[0];
assign EYE_MONITOR_LATE_net_1[0]        = EYE_MONITOR_LATE_net_0;
assign EYE_MONITOR_LATE[0:0]            = EYE_MONITOR_LATE_net_1[0];
assign DELAY_LINE_OUT_OF_RANGE_net_1[0] = DELAY_LINE_OUT_OF_RANGE_net_0;
assign DELAY_LINE_OUT_OF_RANGE[0:0]     = DELAY_LINE_OUT_OF_RANGE_net_1[0];
assign CLK_TRAIN_DONE_net_1             = CLK_TRAIN_DONE_net_0;
assign CLK_TRAIN_DONE                   = CLK_TRAIN_DONE_net_1;
assign CLK_TRAIN_ERROR_net_1            = CLK_TRAIN_ERROR_net_0;
assign CLK_TRAIN_ERROR                  = CLK_TRAIN_ERROR_net_1;
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign HS_IO_CLK_net_0 = { HS_IO_CLK_RX_Y , HS_IO_CLK_FIFO_Y };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------INBUF_DIFF
INBUF_DIFF CLK_0(
        // Inputs
        .PADP ( RX_CLK_P ),
        .PADN ( RX_CLK_N ),
        // Outputs
        .Y    ( CLK_0_Y ) 
        );

//--------CLKINT
CLKINT CLKINT_0(
        // Inputs
        .A ( PF_CLK_DIV_FIFO_CLK_DIV_OUT ),
        // Outputs
        .Y ( RX_CLK_G_net_0 ) 
        );

//--------RXIOD_COMP_TR
RXIOD_COMP_TR COREBCLKSCLKALIGN_0(
        // Inputs
        .SCLK                    ( RX_CLK_G_net_0 ),
        .RESETN                  ( ARST_N ),
        .PLL_BCLKPHS_OFFSET      ( PLL_BCLKPHS_OFFSET_const_net_0 ),
        .ICB_BCLKPHS_OFFSET      ( ICB_BCLKPHS_OFFSET_const_net_0 ),
        .CLK_ALGN_RSTRT          ( CLK_TRAIN_RESTART ),
        .CLK_ALGN_HOLD           ( CLK_TRAIN_HOLD ),
        .CLK_ALGN_SKIP           ( CLK_TRAIN_SKIP ),
        .BCLKSCLK_TRAIN_START    ( ARST_N ),
        .IOD_EARLY               ( PF_IOD_CLK_TRAINING_EYE_MONITOR_EARLY_0 ),
        .IOD_LATE                ( PF_IOD_CLK_TRAINING_EYE_MONITOR_LATE_0 ),
        .IOD_OOR                 ( PF_CLK_DIV_FIFO_DELAY_LINE_OUT_OF_RANGE ),
        .BCLK_IGEAR_RX           ( BCLK_IGEAR_RX_const_net_0 ),
        // Outputs
        .PLL_VCOPHSEL_SCLK_SEL   (  ),
        .PLL_VCOPHSEL_BCLK_SEL   (  ),
        .PLL_VCOPHSEL_BCLK90_SEL (  ),
        .PLL_VCOPHSEL_MCLK_SEL   (  ),
        .PLL_LOADPHS             (  ),
        .PLL_PHS_ROTATE          (  ),
        .PLL_PHS_DIRECTION       (  ),
        .ICB_CLK_ALGN_ERR        ( CLK_TRAIN_ERROR_net_0 ),
        .BCLKSCLK_TRAIN_DONE     ( CLK_TRAIN_DONE_net_0 ),
        .BCLKSCLK_BCLK_VCOPHSEL  (  ),
        .ICB_CLK_ALGN_TAPDLY     (  ),
        .ICB_CLK_ALGN_LOAD       ( COREBCLKSCLKALIGN_0_ICB_CLK_ALGN_LOAD ),
        .ICB_CLK_ALGN_MOV        ( COREBCLKSCLKALIGN_0_ICB_CLK_ALGN_MOV ),
        .ICB_CLK_ALGN_DIR        ( COREBCLKSCLKALIGN_0_ICB_CLK_ALGN_DIR ),
        .ICB_CLK_ALGN_CLR_FLGS   ( COREBCLKSCLKALIGN_0_ICB_CLK_ALGN_CLR_FLGS ),
        .BCLKSCLK_ALGN_PAUSE     ( COREBCLKSCLKALIGN_0_BCLKSCLK_ALGN_PAUSE ) 
        );

//--------HS_IO_CLK
HS_IO_CLK HS_IO_CLK_CASCADED(
        // Inputs
        .A ( CLK_0_Y ),
        // Outputs
        .Y ( HS_IO_CLK_CASCADED_Y ) 
        );

//--------HS_IO_CLK
HS_IO_CLK HS_IO_CLK_FIFO(
        // Inputs
        .A ( PF_CLK_DIV_FIFO_CLK_OUT_HS_IO_CLK ),
        // Outputs
        .Y ( HS_IO_CLK_FIFO_Y ) 
        );

//--------HS_IO_CLK
HS_IO_CLK HS_IO_CLK_RX(
        // Inputs
        .A ( PF_CLK_DIV_RXCLK_CLK_OUT_HS_IO_CLK ),
        // Outputs
        .Y ( HS_IO_CLK_RX_Y ) 
        );

//--------MX2
MX2 PAUSE_MX_0(
        // Inputs
        .A ( COREBCLKSCLKALIGN_0_BCLKSCLK_ALGN_PAUSE ),
        .B ( HS_IO_CLK_PAUSE ),
        .S ( CLK_TRAIN_DONE_net_0 ),
        // Outputs
        .Y ( PAUSE_MX_0_Y ) 
        );

//--------RXIOD_COMP_PF_CLK_DIV_FIFO_PF_CLK_DIV_DELAY   -   Actel:SgCore:PF_CLK_DIV_DELAY:1.1.101
RXIOD_COMP_PF_CLK_DIV_FIFO_PF_CLK_DIV_DELAY PF_CLK_DIV_FIFO(
        // Inputs
        .CLK_IN                  ( HS_IO_CLK_CASCADED_Y ),
        .DELAY_LINE_DIR          ( COREBCLKSCLKALIGN_0_ICB_CLK_ALGN_DIR ),
        .DELAY_LINE_MOVE         ( COREBCLKSCLKALIGN_0_ICB_CLK_ALGN_MOV ),
        .DELAY_LINE_LOAD         ( COREBCLKSCLKALIGN_0_ICB_CLK_ALGN_LOAD ),
        // Outputs
        .CLK_OUT_HS_IO_CLK       ( PF_CLK_DIV_FIFO_CLK_OUT_HS_IO_CLK ),
        .CLK_DIV_OUT             ( PF_CLK_DIV_FIFO_CLK_DIV_OUT ),
        .DELAY_LINE_OUT_OF_RANGE ( PF_CLK_DIV_FIFO_DELAY_LINE_OUT_OF_RANGE ) 
        );

//--------RXIOD_COMP_PF_CLK_DIV_RXCLK_PF_CLK_DIV_DELAY   -   Actel:SgCore:PF_CLK_DIV_DELAY:1.1.101
RXIOD_COMP_PF_CLK_DIV_RXCLK_PF_CLK_DIV_DELAY PF_CLK_DIV_RXCLK(
        // Inputs
        .CLK_IN            ( HS_IO_CLK_CASCADED_Y ),
        // Outputs
        .CLK_OUT_HS_IO_CLK ( PF_CLK_DIV_RXCLK_CLK_OUT_HS_IO_CLK ),
        .CLK_DIV_OUT       (  ) 
        );

//--------RXIOD_COMP_PF_IOD_CLK_TRAINING_PF_IOD   -   Actel:SgCore:PF_IOD:1.0.218
RXIOD_COMP_PF_IOD_CLK_TRAINING_PF_IOD PF_IOD_CLK_TRAINING(
        // Inputs
        .ARST_N                    ( PF_LANECTRL_0_ARST_N ),
        .RX_SYNC_RST               ( PF_LANECTRL_0_RX_SYNC_RST ),
        .TX_SYNC_RST               ( PF_LANECTRL_0_TX_SYNC_RST ),
        .HS_IO_CLK                 ( HS_IO_CLK_FIFO_Y ),
        .EYE_MONITOR_LANE_WIDTH    ( PF_LANECTRL_0_EYE_MONITOR_WIDTH_OUT ),
        .EYE_MONITOR_CLEAR_FLAGS_0 ( COREBCLKSCLKALIGN_0_ICB_CLK_ALGN_CLR_FLGS ),
        .FAB_CLK                   ( RX_CLK_G_net_0 ),
        .ODT_EN_0                  ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .EYE_MONITOR_EARLY_0       ( PF_IOD_CLK_TRAINING_EYE_MONITOR_EARLY_0 ),
        .EYE_MONITOR_LATE_0        ( PF_IOD_CLK_TRAINING_EYE_MONITOR_LATE_0 ),
        .RX_DATA_0                 (  ) 
        );

//--------RXIOD_COMP_PF_IOD_RX_PF_IOD   -   Actel:SgCore:PF_IOD:1.0.218
RXIOD_COMP_PF_IOD_RX_PF_IOD PF_IOD_RX(
        // Inputs
        .ARST_N                    ( PF_LANECTRL_0_ARST_N ),
        .RX_SYNC_RST               ( PF_LANECTRL_0_RX_SYNC_RST ),
        .TX_SYNC_RST               ( PF_LANECTRL_0_TX_SYNC_RST ),
        .HS_IO_CLK                 ( HS_IO_CLK_FIFO_Y ),
        .RX_DQS_90                 ( PF_LANECTRL_0_RX_DQS_90 ),
        .FIFO_WR_PTR               ( PF_LANECTRL_0_FIFO_WR_PTR ),
        .FIFO_RD_PTR               ( PF_LANECTRL_0_FIFO_RD_PTR ),
        .EYE_MONITOR_LANE_WIDTH    ( PF_LANECTRL_0_EYE_MONITOR_WIDTH_OUT ),
        .EYE_MONITOR_CLEAR_FLAGS_0 ( EYE_MONITOR_CLEAR_FLAGS ),
        .DELAY_LINE_MOVE_0         ( DELAY_LINE_MOVE ),
        .DELAY_LINE_DIRECTION_0    ( DELAY_LINE_DIRECTION ),
        .DELAY_LINE_LOAD_0         ( DELAY_LINE_LOAD ),
        .FAB_CLK                   ( RX_CLK_G_net_0 ),
        .PAD_I                     ( RXD ),
        .PAD_I_N                   ( RXD_N ),
        // Outputs
        .DELAY_LINE_OUT_OF_RANGE_0 ( DELAY_LINE_OUT_OF_RANGE_net_0 ),
        .EYE_MONITOR_EARLY_0       ( EYE_MONITOR_EARLY_net_0 ),
        .EYE_MONITOR_LATE_0        ( EYE_MONITOR_LATE_net_0 ),
        .RX_DATA_0                 ( L0_RXD_DATA_net_0 ) 
        );

//--------RXIOD_COMP_PF_LANECTRL_0_PF_LANECTRL   -   Actel:SgCore:PF_LANECTRL:2.0.102
RXIOD_COMP_PF_LANECTRL_0_PF_LANECTRL PF_LANECTRL_0(
        // Inputs
        .HS_IO_CLK                  ( HS_IO_CLK_net_0 ),
        .DLL_CODE                   ( DLL_CODE_const_net_0 ), // tied to 8'h00 from definition
        .FAB_CLK                    ( RX_CLK_G_net_0 ),
        .RESET                      ( RESET_IN_POST_INV0_0 ),
        .DELAY_LINE_SEL             ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_LOAD            ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_DIRECTION       ( GND_net ), // tied to 1'b0 from definition
        .DELAY_LINE_MOVE            ( GND_net ), // tied to 1'b0 from definition
        .HS_IO_CLK_PAUSE            ( PAUSE_MX_0_Y ),
        .EYE_MONITOR_WIDTH_IN       ( EYE_MONITOR_WIDTH ),
        // Outputs
        .EYE_MONITOR_WIDTH_OUT      ( PF_LANECTRL_0_EYE_MONITOR_WIDTH_OUT ),
        .RX_DQS_90                  ( PF_LANECTRL_0_RX_DQS_90 ),
        .TX_DQS                     (  ),
        .TX_DQS_270                 (  ),
        .FIFO_WR_PTR                ( PF_LANECTRL_0_FIFO_WR_PTR ),
        .FIFO_RD_PTR                ( PF_LANECTRL_0_FIFO_RD_PTR ),
        .ARST_N                     ( PF_LANECTRL_0_ARST_N ),
        .RX_SYNC_RST                ( PF_LANECTRL_0_RX_SYNC_RST ),
        .TX_SYNC_RST                ( PF_LANECTRL_0_TX_SYNC_RST ),
        .RX_DELAY_LINE_OUT_OF_RANGE (  ),
        .TX_DELAY_LINE_OUT_OF_RANGE (  ),
        .A_OUT_RST_N                (  ) 
        );


endmodule
