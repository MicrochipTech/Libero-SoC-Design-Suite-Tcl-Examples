set_component PF_DDR4_SS
########################################################## IOG CONSTRAINTS ##########################################################

set_false_path -to [get_pins { DDRPHY_BLK_0/*/I_IOD_*/ARST_N }]
set_false_path -to [get_pins { DDRPHY_BLK_0/LANE_*_CTRL/I_LANECTRL/HS_IO_CLK_PAUSE } ]
set_false_path -to [get_pins { DDRPHY_BLK_0/LANECTRL_ADDR_CMD_0/I_LANECTRL*/HS_IO_CLK_PAUSE } ]
set_false_path -to [get_pins { DDRPHY_BLK_0/*/I_IOD_*/RX_SYNC_RST* } ]
set_false_path -to [get_pins { DDRPHY_BLK_0/*/I_IOD_*/DELAY_LINE_MOVE } ]
set_false_path -through [ get_pins { DDRPHY_BLK_0/*/I_IOD_*/DELAY_LINE_OUT_OF_RANGE } ]

########################################################## LANECTRL CONSTRAINTS ##########################################################

set_false_path -to [get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DDR_READ } ]
set_false_path -to [get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/RESET } ]
set_false_path -to [get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DELAY_LINE_DIRECTION } ]
set_false_path -to [get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DELAY_LINE_MOVE } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DELAY_LINE_LOAD DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DELAY_LINE_SEL } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/SWITCH } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/READ_CLK_SEL[2] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DLL_CODE[0] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DLL_CODE[1] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DLL_CODE[2] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DLL_CODE[3] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DLL_CODE[4] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DLL_CODE[5] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DLL_CODE[6] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_0_CTRL/I_LANECTRL/DLL_CODE[7] } ]
set_false_path -to [get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DDR_READ } ]
set_false_path -to [get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/RESET } ]
set_false_path -to [get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DELAY_LINE_DIRECTION } ]
set_false_path -to [get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DELAY_LINE_MOVE } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DELAY_LINE_LOAD DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DELAY_LINE_SEL } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/SWITCH } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/READ_CLK_SEL[2] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DLL_CODE[0] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DLL_CODE[1] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DLL_CODE[2] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DLL_CODE[3] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DLL_CODE[4] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DLL_CODE[5] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DLL_CODE[6] } ]
set_false_path -to [ get_pins { DDRPHY_BLK_0/LANE_1_CTRL/I_LANECTRL/DLL_CODE[7] } ]

########################################################## IOA CONSTRAINTS ##########################################################

set_false_path -through [get_pins { DDRPHY_BLK_0/*/I_*FEEDBACK*/Y }]
set_false_path -through [get_pins { DDRPHY_BLK_0/OB_DIFF_CK0/Y }]
set_false_path -through [get_pins { DDRPHY_BLK_0/OB_A_12/Y }]
set_false_path -through [get_pins { DDRPHY_BLK_0/*/I_TRIBUFF_*/D } ]
set_false_path -through [get_pins { DDRPHY_BLK_0/*/I_TRIBUFF_*/E } ]
set_false_path -through [get_pins { DDRPHY_BLK_0/*/I_BIBUF*/D } ]
set_false_path -through [get_pins { DDRPHY_BLK_0/*/I_BIBUF*/E } ]
set_false_path -through [get_pins { DDRPHY_BLK_0/*/I_BIBUF*/Y } ]
set_false_path -through [ get_pins { DDRPHY_BLK_0/*/I_BIBUF_DIFF_DQS_*/YN } ]

########################################################## PLL/DLL CONSTRAINTS ##########################################################

set_false_path -to [ get_pins { CCC_0/pll_inst_0/PHASE_OUT0_SEL } ]
set_false_path -to [ get_pins { CCC_0/pll_inst_0/PHASE_OUT2_SEL } ]
set_false_path -to [ get_pins { CCC_0/pll_inst_0/PHASE_OUT3_SEL } ]

########################################################## TIP CONSTRAINTS ##########################################################

set_multicycle_path -setup_only 2 -from [ get_cells { DDRPHY_BLK_0/IOD_TRAINING_0/COREDDR_TIP_INT_U/TIP_CTRL_BLK/u_write_callibrator/select* } ]

########################################################## CTRL CONSTRAINTS ##########################################################

