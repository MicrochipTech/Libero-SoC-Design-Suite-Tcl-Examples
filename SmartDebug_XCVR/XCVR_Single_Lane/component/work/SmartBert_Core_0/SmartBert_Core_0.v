//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon May 16 17:00:25 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of SmartBert_Core_0 to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component SmartBert_Core_0
create_and_configure_core -core_vlnv {Actel:SystemBuilder:CORESMARTBERT:2.8.101} -component_name {SmartBert_Core_0} -params {\
"UI_CDR_REFERENCE_CLK_FREQ:156.25" \
"UI_CDR_REFERENCE_CLK_SOURCE:Dedicated" \
"UI_DATA_RATE:5000" \
"UI_NUMBER_OF_LANES:1" \
"UI_PATTERN_PRBS23:true" \
"UI_PATTERN_PRBS31:true" \
"UI_PATTERN_PRBS7:true" \
"UI_PATTERN_PRBS9:true" \
"UI_TX_CLK_DIV_FACTOR:1" }
# Exporting Component Description of SmartBert_Core_0 to TCL done
*/

// SmartBert_Core_0
module SmartBert_Core_0(
    // Inputs
    LANE0_CDR_REF_CLK_0,
    LANE0_RXD_N,
    LANE0_RXD_P,
    SYS_RESET_N,
    TX_BIT_CLK_0,
    TX_PLL_LOCK_0,
    TX_PLL_REF_CLK_0,
    // Outputs
    LANE0_TXD_N,
    LANE0_TXD_P
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  LANE0_CDR_REF_CLK_0;
input  LANE0_RXD_N;
input  LANE0_RXD_P;
input  SYS_RESET_N;
input  TX_BIT_CLK_0;
input  TX_PLL_LOCK_0;
input  TX_PLL_REF_CLK_0;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output LANE0_TXD_N;
output LANE0_TXD_P;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          TX_BIT_CLK_0;
wire          TX_PLL_LOCK_0;
wire          TX_PLL_REF_CLK_0;
wire          LANE0_CDR_REF_CLK_0;
wire          LANE0_RXD_N;
wire          LANE0_RXD_P;
wire          LANE0_TXD_N_net_0;
wire          LANE0_TXD_P_net_0;
wire          PF_XCVR_0_LANE0_RX_CLK_R;
wire   [79:0] PF_XCVR_0_LANE0_RX_DATA;
wire          PF_XCVR_0_LANE0_RX_READY;
wire          PF_XCVR_0_LANE0_RX_VAL;
wire          PF_XCVR_0_LANE0_TX_CLK_R;
wire          PF_XCVR_0_LANE0_TX_CLK_STABLE;
wire   [31:0] SB_GEN_CHKR_0_LANE0_PRBS_ERR_CNT;
wire          SB_GEN_CHKR_0_LANE0_RX_ALIGN;
wire          SB_GEN_CHKR_0_LANE0_RX_SLIP;
wire   [79:0] SB_GEN_CHKR_0_LANE0_TX_DATA;
wire          SB_VER_GEN_0_LANE0_PRBS_ERR_CNT_CLR;
wire          SB_VER_GEN_0_LANE0_PRBS_ERR_GEN;
wire          SB_VER_GEN_0_LANE0_RX_DATA_EN;
wire   [1:0]  SB_VER_GEN_0_LANE0_RX_PRBS_SEL;
wire          SB_VER_GEN_0_LANE0_TX_DATA_EN;
wire   [1:0]  SB_VER_GEN_0_LANE0_TX_PRBS_SEL;
wire          SYS_RESET_N;
wire          LANE0_TXD_P_net_1;
wire          LANE0_TXD_N_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [19:0] LANE0_TX_DISPFNC_const_net_0;
wire   [9:0]  LANE0_8B10B_TX_K_const_net_0;
wire   [3:0]  LANE0_TX_HDR_const_net_0;
wire   [3:0]  LANE0_TXDATAK_const_net_0;
wire   [1:0]  LANE0_SATA_TX_OOB_const_net_0;
wire   [1:0]  LANE0_POWERDOWN_const_net_0;
wire   [1:0]  LANE0_SATA_RATE_const_net_0;
wire   [1:0]  LANE0_TXPATTERN_const_net_0;
wire   [1:0]  LANE0_CDR_LOCKMODE_const_net_0;
wire   [79:0] LANE1_TX_DATA_const_net_0;
wire   [19:0] LANE1_TX_DISPFNC_const_net_0;
wire   [9:0]  LANE1_8B10B_TX_K_const_net_0;
wire   [3:0]  LANE1_TX_HDR_const_net_0;
wire   [3:0]  LANE1_TXDATAK_const_net_0;
wire   [1:0]  LANE1_SATA_TX_OOB_const_net_0;
wire   [1:0]  LANE1_POWERDOWN_const_net_0;
wire   [1:0]  LANE1_SATA_RATE_const_net_0;
wire   [1:0]  LANE1_TXPATTERN_const_net_0;
wire   [1:0]  LANE1_CDR_LOCKMODE_const_net_0;
wire   [79:0] LANE2_TX_DATA_const_net_0;
wire   [19:0] LANE2_TX_DISPFNC_const_net_0;
wire   [9:0]  LANE2_8B10B_TX_K_const_net_0;
wire   [3:0]  LANE2_TX_HDR_const_net_0;
wire   [3:0]  LANE2_TXDATAK_const_net_0;
wire   [1:0]  LANE2_SATA_TX_OOB_const_net_0;
wire   [1:0]  LANE2_POWERDOWN_const_net_0;
wire   [1:0]  LANE2_SATA_RATE_const_net_0;
wire   [1:0]  LANE2_TXPATTERN_const_net_0;
wire   [1:0]  LANE2_CDR_LOCKMODE_const_net_0;
wire   [79:0] LANE3_TX_DATA_const_net_0;
wire   [19:0] LANE3_TX_DISPFNC_const_net_0;
wire   [9:0]  LANE3_8B10B_TX_K_const_net_0;
wire   [3:0]  LANE3_TX_HDR_const_net_0;
wire   [3:0]  LANE3_TXDATAK_const_net_0;
wire   [1:0]  LANE3_SATA_TX_OOB_const_net_0;
wire   [1:0]  LANE3_POWERDOWN_const_net_0;
wire   [1:0]  LANE3_SATA_RATE_const_net_0;
wire   [1:0]  LANE3_TXPATTERN_const_net_0;
wire   [1:0]  LANE3_CDR_LOCKMODE_const_net_0;
wire   [1:0]  POWERDOWN_const_net_0;
wire   [2:0]  TXMARGIN_const_net_0;
wire   [32:0] LANE0_DRI_WDATA_const_net_0;
wire   [10:0] LANE0_DRI_CTRL_const_net_0;
wire   [32:0] LANE1_DRI_WDATA_const_net_0;
wire   [10:0] LANE1_DRI_CTRL_const_net_0;
wire   [32:0] LANE2_DRI_WDATA_const_net_0;
wire   [10:0] LANE2_DRI_CTRL_const_net_0;
wire   [32:0] LANE3_DRI_WDATA_const_net_0;
wire   [10:0] LANE3_DRI_CTRL_const_net_0;
wire   [2:0]  LANE0_LINK_ADDR_const_net_0;
wire   [3:0]  LANE0_LINK_WDATA_const_net_0;
wire   [2:0]  LANE1_LINK_ADDR_const_net_0;
wire   [3:0]  LANE1_LINK_WDATA_const_net_0;
wire   [2:0]  LANE2_LINK_ADDR_const_net_0;
wire   [3:0]  LANE2_LINK_WDATA_const_net_0;
wire   [2:0]  LANE3_LINK_ADDR_const_net_0;
wire   [3:0]  LANE3_LINK_WDATA_const_net_0;
wire   [1:0]  LANE1_TX_PRBS_SEL_const_net_0;
wire   [1:0]  LANE1_RX_PRBS_SEL_const_net_0;
wire   [79:0] LANE1_RX_DATA_const_net_0;
wire   [1:0]  LANE2_TX_PRBS_SEL_const_net_0;
wire   [1:0]  LANE2_RX_PRBS_SEL_const_net_0;
wire   [79:0] LANE2_RX_DATA_const_net_0;
wire   [1:0]  LANE3_TX_PRBS_SEL_const_net_0;
wire   [1:0]  LANE3_RX_PRBS_SEL_const_net_0;
wire   [79:0] LANE3_RX_DATA_const_net_0;
wire   [31:0] LANE1_PRBS_ERR_CNT_const_net_0;
wire   [31:0] LANE2_PRBS_ERR_CNT_const_net_0;
wire   [31:0] LANE3_PRBS_ERR_CNT_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                        = 1'b0;
assign LANE0_TX_DISPFNC_const_net_0   = 20'h00000;
assign LANE0_8B10B_TX_K_const_net_0   = 10'h000;
assign LANE0_TX_HDR_const_net_0       = 4'h0;
assign LANE0_TXDATAK_const_net_0      = 4'h0;
assign LANE0_SATA_TX_OOB_const_net_0  = 2'h0;
assign LANE0_POWERDOWN_const_net_0    = 2'h0;
assign LANE0_SATA_RATE_const_net_0    = 2'h0;
assign LANE0_TXPATTERN_const_net_0    = 2'h0;
assign LANE0_CDR_LOCKMODE_const_net_0 = 2'h0;
assign LANE1_TX_DATA_const_net_0      = 80'h00000000000000000000;
assign LANE1_TX_DISPFNC_const_net_0   = 20'h00000;
assign LANE1_8B10B_TX_K_const_net_0   = 10'h000;
assign LANE1_TX_HDR_const_net_0       = 4'h0;
assign LANE1_TXDATAK_const_net_0      = 4'h0;
assign LANE1_SATA_TX_OOB_const_net_0  = 2'h0;
assign LANE1_POWERDOWN_const_net_0    = 2'h0;
assign LANE1_SATA_RATE_const_net_0    = 2'h0;
assign LANE1_TXPATTERN_const_net_0    = 2'h0;
assign LANE1_CDR_LOCKMODE_const_net_0 = 2'h0;
assign LANE2_TX_DATA_const_net_0      = 80'h00000000000000000000;
assign LANE2_TX_DISPFNC_const_net_0   = 20'h00000;
assign LANE2_8B10B_TX_K_const_net_0   = 10'h000;
assign LANE2_TX_HDR_const_net_0       = 4'h0;
assign LANE2_TXDATAK_const_net_0      = 4'h0;
assign LANE2_SATA_TX_OOB_const_net_0  = 2'h0;
assign LANE2_POWERDOWN_const_net_0    = 2'h0;
assign LANE2_SATA_RATE_const_net_0    = 2'h0;
assign LANE2_TXPATTERN_const_net_0    = 2'h0;
assign LANE2_CDR_LOCKMODE_const_net_0 = 2'h0;
assign LANE3_TX_DATA_const_net_0      = 80'h00000000000000000000;
assign LANE3_TX_DISPFNC_const_net_0   = 20'h00000;
assign LANE3_8B10B_TX_K_const_net_0   = 10'h000;
assign LANE3_TX_HDR_const_net_0       = 4'h0;
assign LANE3_TXDATAK_const_net_0      = 4'h0;
assign LANE3_SATA_TX_OOB_const_net_0  = 2'h0;
assign LANE3_POWERDOWN_const_net_0    = 2'h0;
assign LANE3_SATA_RATE_const_net_0    = 2'h0;
assign LANE3_TXPATTERN_const_net_0    = 2'h0;
assign LANE3_CDR_LOCKMODE_const_net_0 = 2'h0;
assign POWERDOWN_const_net_0          = 2'h0;
assign TXMARGIN_const_net_0           = 3'h0;
assign LANE0_DRI_WDATA_const_net_0    = 33'h000000000;
assign LANE0_DRI_CTRL_const_net_0     = 11'h000;
assign LANE1_DRI_WDATA_const_net_0    = 33'h000000000;
assign LANE1_DRI_CTRL_const_net_0     = 11'h000;
assign LANE2_DRI_WDATA_const_net_0    = 33'h000000000;
assign LANE2_DRI_CTRL_const_net_0     = 11'h000;
assign LANE3_DRI_WDATA_const_net_0    = 33'h000000000;
assign LANE3_DRI_CTRL_const_net_0     = 11'h000;
assign LANE0_LINK_ADDR_const_net_0    = 3'h0;
assign LANE0_LINK_WDATA_const_net_0   = 4'h0;
assign LANE1_LINK_ADDR_const_net_0    = 3'h0;
assign LANE1_LINK_WDATA_const_net_0   = 4'h0;
assign LANE2_LINK_ADDR_const_net_0    = 3'h0;
assign LANE2_LINK_WDATA_const_net_0   = 4'h0;
assign LANE3_LINK_ADDR_const_net_0    = 3'h0;
assign LANE3_LINK_WDATA_const_net_0   = 4'h0;
assign LANE1_TX_PRBS_SEL_const_net_0  = 2'h0;
assign LANE1_RX_PRBS_SEL_const_net_0  = 2'h0;
assign LANE1_RX_DATA_const_net_0      = 80'h00000000000000000000;
assign LANE2_TX_PRBS_SEL_const_net_0  = 2'h0;
assign LANE2_RX_PRBS_SEL_const_net_0  = 2'h0;
assign LANE2_RX_DATA_const_net_0      = 80'h00000000000000000000;
assign LANE3_TX_PRBS_SEL_const_net_0  = 2'h0;
assign LANE3_RX_PRBS_SEL_const_net_0  = 2'h0;
assign LANE3_RX_DATA_const_net_0      = 80'h00000000000000000000;
assign LANE1_PRBS_ERR_CNT_const_net_0 = 32'h00000000;
assign LANE2_PRBS_ERR_CNT_const_net_0 = 32'h00000000;
assign LANE3_PRBS_ERR_CNT_const_net_0 = 32'h00000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LANE0_TXD_P_net_1 = LANE0_TXD_P_net_0;
assign LANE0_TXD_P       = LANE0_TXD_P_net_1;
assign LANE0_TXD_N_net_1 = LANE0_TXD_N_net_0;
assign LANE0_TXD_N       = LANE0_TXD_N_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------SmartBert_Core_0_PF_XCVR_0_PF_XCVR   -   Actel:SgCore:PF_XCVR:2.1.101
SmartBert_Core_0_PF_XCVR_0_PF_XCVR PF_XCVR_0(
        // Inputs
        .LANE0_TX_DATA        ( SB_GEN_CHKR_0_LANE0_TX_DATA ),
        .LANE0_CDR_REF_CLK_0  ( LANE0_CDR_REF_CLK_0 ),
        .LANE0_RX_SLIP        ( SB_GEN_CHKR_0_LANE0_RX_SLIP ),
        .LANE0_PCS_ARST_N     ( SYS_RESET_N ),
        .LANE0_PMA_ARST_N     ( SYS_RESET_N ),
        .TX_BIT_CLK_0         ( TX_BIT_CLK_0 ),
        .TX_PLL_REF_CLK_0     ( TX_PLL_REF_CLK_0 ),
        .TX_PLL_LOCK_0        ( TX_PLL_LOCK_0 ),
        .LANE0_RXD_P          ( LANE0_RXD_P ),
        .LANE0_RXD_N          ( LANE0_RXD_N ),
        // Outputs
        .LANE0_RX_DATA        ( PF_XCVR_0_LANE0_RX_DATA ),
        .LANE0_TX_CLK_R       ( PF_XCVR_0_LANE0_TX_CLK_R ),
        .LANE0_RX_CLK_R       ( PF_XCVR_0_LANE0_RX_CLK_R ),
        .LANE0_RX_IDLE        (  ),
        .LANE0_RX_READY       ( PF_XCVR_0_LANE0_RX_READY ),
        .LANE0_RX_VAL         ( PF_XCVR_0_LANE0_RX_VAL ),
        .LANE0_TX_CLK_STABLE  ( PF_XCVR_0_LANE0_TX_CLK_STABLE ),
        .LANE0_RX_BYPASS_DATA (  ),
        .LANE0_TXD_P          ( LANE0_TXD_P_net_0 ),
        .LANE0_TXD_N          ( LANE0_TXD_N_net_0 ) 
        );

//--------SB_GEN_CHKR   -   Actel:SgCore:SB_GEN_CHKR:0.0.20
SB_GEN_CHKR #( 
        .DATA_WIDTH     ( 80 ),
        .ERR_CHK_DELAY  ( 32 ),
        .NUM_OF_LANES   ( 1 ),
        .PATTERN_PRBS7  ( 1 ),
        .PATTERN_PRBS9  ( 1 ),
        .PATTERN_PRBS23 ( 1 ),
        .PATTERN_PRBS31 ( 1 ) )
SB_GEN_CHKR_0(
        // Inputs
        .SYS_RESET_N            ( SYS_RESET_N ),
        .LANE0_TX_PRBS_SEL      ( SB_VER_GEN_0_LANE0_TX_PRBS_SEL ),
        .LANE0_RX_PRBS_SEL      ( SB_VER_GEN_0_LANE0_RX_PRBS_SEL ),
        .LANE0_TX_CLK           ( PF_XCVR_0_LANE0_TX_CLK_R ),
        .LANE0_TX_CLK_STABLE    ( PF_XCVR_0_LANE0_TX_CLK_STABLE ),
        .LANE0_PRBS_ERR_GEN     ( SB_VER_GEN_0_LANE0_PRBS_ERR_GEN ),
        .LANE0_RX_CLK           ( PF_XCVR_0_LANE0_RX_CLK_R ),
        .LANE0_RX_READY         ( PF_XCVR_0_LANE0_RX_READY ),
        .LANE0_RX_VAL           ( PF_XCVR_0_LANE0_RX_VAL ),
        .LANE0_RX_DATA          ( PF_XCVR_0_LANE0_RX_DATA ),
        .LANE0_RX_DATA_EN       ( SB_VER_GEN_0_LANE0_RX_DATA_EN ),
        .LANE0_TX_DATA_EN       ( SB_VER_GEN_0_LANE0_TX_DATA_EN ),
        .LANE0_PRBS_ERR_CNT_CLR ( SB_VER_GEN_0_LANE0_PRBS_ERR_CNT_CLR ),
        .LANE1_TX_PRBS_SEL      ( LANE1_TX_PRBS_SEL_const_net_0 ), // tied to 2'h0 from definition
        .LANE1_RX_PRBS_SEL      ( LANE1_RX_PRBS_SEL_const_net_0 ), // tied to 2'h0 from definition
        .LANE1_TX_CLK           ( GND_net ), // tied to 1'b0 from definition
        .LANE1_TX_CLK_STABLE    ( GND_net ), // tied to 1'b0 from definition
        .LANE1_PRBS_ERR_GEN     ( GND_net ), // tied to 1'b0 from definition
        .LANE1_RX_CLK           ( GND_net ), // tied to 1'b0 from definition
        .LANE1_RX_READY         ( GND_net ), // tied to 1'b0 from definition
        .LANE1_RX_VAL           ( GND_net ), // tied to 1'b0 from definition
        .LANE1_RX_DATA          ( LANE1_RX_DATA_const_net_0 ), // tied to 80'h00000000000000000000 from definition
        .LANE1_RX_DATA_EN       ( GND_net ), // tied to 1'b0 from definition
        .LANE1_TX_DATA_EN       ( GND_net ), // tied to 1'b0 from definition
        .LANE1_PRBS_ERR_CNT_CLR ( GND_net ), // tied to 1'b0 from definition
        .LANE2_TX_PRBS_SEL      ( LANE2_TX_PRBS_SEL_const_net_0 ), // tied to 2'h0 from definition
        .LANE2_RX_PRBS_SEL      ( LANE2_RX_PRBS_SEL_const_net_0 ), // tied to 2'h0 from definition
        .LANE2_TX_CLK           ( GND_net ), // tied to 1'b0 from definition
        .LANE2_TX_CLK_STABLE    ( GND_net ), // tied to 1'b0 from definition
        .LANE2_PRBS_ERR_GEN     ( GND_net ), // tied to 1'b0 from definition
        .LANE2_RX_CLK           ( GND_net ), // tied to 1'b0 from definition
        .LANE2_RX_READY         ( GND_net ), // tied to 1'b0 from definition
        .LANE2_RX_VAL           ( GND_net ), // tied to 1'b0 from definition
        .LANE2_RX_DATA          ( LANE2_RX_DATA_const_net_0 ), // tied to 80'h00000000000000000000 from definition
        .LANE2_RX_DATA_EN       ( GND_net ), // tied to 1'b0 from definition
        .LANE2_TX_DATA_EN       ( GND_net ), // tied to 1'b0 from definition
        .LANE2_PRBS_ERR_CNT_CLR ( GND_net ), // tied to 1'b0 from definition
        .LANE3_TX_PRBS_SEL      ( LANE3_TX_PRBS_SEL_const_net_0 ), // tied to 2'h0 from definition
        .LANE3_RX_PRBS_SEL      ( LANE3_RX_PRBS_SEL_const_net_0 ), // tied to 2'h0 from definition
        .LANE3_TX_CLK           ( GND_net ), // tied to 1'b0 from definition
        .LANE3_TX_CLK_STABLE    ( GND_net ), // tied to 1'b0 from definition
        .LANE3_PRBS_ERR_GEN     ( GND_net ), // tied to 1'b0 from definition
        .LANE3_RX_CLK           ( GND_net ), // tied to 1'b0 from definition
        .LANE3_RX_READY         ( GND_net ), // tied to 1'b0 from definition
        .LANE3_RX_VAL           ( GND_net ), // tied to 1'b0 from definition
        .LANE3_RX_DATA          ( LANE3_RX_DATA_const_net_0 ), // tied to 80'h00000000000000000000 from definition
        .LANE3_RX_DATA_EN       ( GND_net ), // tied to 1'b0 from definition
        .LANE3_TX_DATA_EN       ( GND_net ), // tied to 1'b0 from definition
        .LANE3_PRBS_ERR_CNT_CLR ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .LANE0_TX_DATA          ( SB_GEN_CHKR_0_LANE0_TX_DATA ),
        .LANE0_PRBS_ERR_CNT     ( SB_GEN_CHKR_0_LANE0_PRBS_ERR_CNT ),
        .LANE0_RX_SLIP          ( SB_GEN_CHKR_0_LANE0_RX_SLIP ),
        .LANE0_RX_ALIGN         ( SB_GEN_CHKR_0_LANE0_RX_ALIGN ),
        .LANE1_TX_DATA          (  ),
        .LANE1_PRBS_ERR_CNT     (  ),
        .LANE1_RX_SLIP          (  ),
        .LANE1_RX_ALIGN         (  ),
        .LANE2_TX_DATA          (  ),
        .LANE2_PRBS_ERR_CNT     (  ),
        .LANE2_RX_SLIP          (  ),
        .LANE2_RX_ALIGN         (  ),
        .LANE3_TX_DATA          (  ),
        .LANE3_PRBS_ERR_CNT     (  ),
        .LANE3_RX_SLIP          (  ),
        .LANE3_RX_ALIGN         (  ) 
        );

//--------SB_VER_GEN   -   Actel:SgCore:SB_VER_GEN:0.0.18
SB_VER_GEN #( 
        .MAJOR                       ( 2 ),
        .MINOR                       ( 1 ),
        .UI_CDR_REFERENCE_CLK_FREQ   ( 8 ),
        .UI_CDR_REFERENCE_CLK_SOURCE ( 0 ),
        .UI_DATA_RATE                ( 5000 ),
        .UI_NUMBER_OF_LANES          ( 1 ),
        .UI_PATTERN_PRBS7            ( 1 ),
        .UI_PATTERN_PRBS9            ( 1 ),
        .UI_PATTERN_PRBS23           ( 1 ),
        .UI_PATTERN_PRBS31           ( 1 ),
        .UI_TX_CLK_DIV_FACTOR        ( 1 ) )
SB_VER_GEN_0(
        // Inputs
        .SYS_RESET_N            ( SYS_RESET_N ),
        .LANE0_RX_ALIGN         ( SB_GEN_CHKR_0_LANE0_RX_ALIGN ),
        .LANE1_RX_ALIGN         ( GND_net ), // tied to 1'b0 from definition
        .LANE2_RX_ALIGN         ( GND_net ), // tied to 1'b0 from definition
        .LANE3_RX_ALIGN         ( GND_net ), // tied to 1'b0 from definition
        .LANE0_TX_CLK           ( PF_XCVR_0_LANE0_TX_CLK_R ),
        .LANE1_TX_CLK           ( GND_net ), // tied to 1'b0 from definition
        .LANE2_TX_CLK           ( GND_net ), // tied to 1'b0 from definition
        .LANE3_TX_CLK           ( GND_net ), // tied to 1'b0 from definition
        .LANE0_RX_CLK           ( PF_XCVR_0_LANE0_RX_CLK_R ),
        .LANE1_RX_CLK           ( GND_net ), // tied to 1'b0 from definition
        .LANE2_RX_CLK           ( GND_net ), // tied to 1'b0 from definition
        .LANE3_RX_CLK           ( GND_net ), // tied to 1'b0 from definition
        .LANE0_PRBS_ERR_CNT     ( SB_GEN_CHKR_0_LANE0_PRBS_ERR_CNT ),
        .LANE1_PRBS_ERR_CNT     ( LANE1_PRBS_ERR_CNT_const_net_0 ), // tied to 32'h00000000 from definition
        .LANE2_PRBS_ERR_CNT     ( LANE2_PRBS_ERR_CNT_const_net_0 ), // tied to 32'h00000000 from definition
        .LANE3_PRBS_ERR_CNT     ( LANE3_PRBS_ERR_CNT_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .LANE0_TX_DATA_EN       ( SB_VER_GEN_0_LANE0_TX_DATA_EN ),
        .LANE1_TX_DATA_EN       (  ),
        .LANE2_TX_DATA_EN       (  ),
        .LANE3_TX_DATA_EN       (  ),
        .LANE0_RX_DATA_EN       ( SB_VER_GEN_0_LANE0_RX_DATA_EN ),
        .LANE1_RX_DATA_EN       (  ),
        .LANE2_RX_DATA_EN       (  ),
        .LANE3_RX_DATA_EN       (  ),
        .LANE0_TX_PRBS_SEL      ( SB_VER_GEN_0_LANE0_TX_PRBS_SEL ),
        .LANE1_TX_PRBS_SEL      (  ),
        .LANE2_TX_PRBS_SEL      (  ),
        .LANE3_TX_PRBS_SEL      (  ),
        .LANE0_RX_PRBS_SEL      ( SB_VER_GEN_0_LANE0_RX_PRBS_SEL ),
        .LANE1_RX_PRBS_SEL      (  ),
        .LANE2_RX_PRBS_SEL      (  ),
        .LANE3_RX_PRBS_SEL      (  ),
        .LANE0_PRBS_ERR_GEN     ( SB_VER_GEN_0_LANE0_PRBS_ERR_GEN ),
        .LANE1_PRBS_ERR_GEN     (  ),
        .LANE2_PRBS_ERR_GEN     (  ),
        .LANE3_PRBS_ERR_GEN     (  ),
        .LANE0_PRBS_ERR_CNT_CLR ( SB_VER_GEN_0_LANE0_PRBS_ERR_CNT_CLR ),
        .LANE1_PRBS_ERR_CNT_CLR (  ),
        .LANE2_PRBS_ERR_CNT_CLR (  ),
        .LANE3_PRBS_ERR_CNT_CLR (  ) 
        );


endmodule
