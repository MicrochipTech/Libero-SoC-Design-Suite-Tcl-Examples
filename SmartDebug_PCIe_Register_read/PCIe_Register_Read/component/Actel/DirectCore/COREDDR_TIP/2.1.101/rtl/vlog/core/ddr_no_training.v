///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: training_wrap.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::G5> <Die::PA5M300> <Package::Fully Bonded Package>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1ns / 1ps

module COREDDR_TIP_SIM_NO_TRN #(
    // parameters
    parameter FAMILY              =  26,
    parameter FIFO_ADDRESS_WIDTH  =  64,
    parameter FIFO_DEPTH          =   2,
    parameter IOG_DQS_LANES       =   2,
    parameter NUM_BCLKS           =   1,
    parameter IOG_DQ_WIDTH_L0     =   8,
    parameter IOG_DQ_WIDTH_L1     =   8,
    parameter IOG_DQ_WIDTH_L2     =   8,
    parameter IOG_DQ_WIDTH_L3     =   8,
    parameter IOG_DQ_WIDTH_L4     =   8,
    parameter IOG_DQ_WIDTH_L5     =   8,
    parameter IOG_DQ_WIDTH_L6     =   8,
    parameter IOG_DQ_WIDTH_L7     =   8,
    parameter IOG_DQ_WIDTH_L8     =   8,
    parameter PIPELINE            =   0
    ) (
        
    input SCLK,
    input RESET_N,

    // Not used in current solution 
    // => Tie-off APB interface [DONE by packaging]
    input  [15:0] PADDR,
    input         PENABLE,
    output [7:0]  PRDATA,
    output        PREADY,
    input         PSEL,
    input  [7:0]  PWDATA,
    input         PWRITE,

    // Not used by TIP for now (no use model at this time)
    // => Promote to top [DONE]
    // => tieoff DLL_DLY_DIFF to 'GND' at next level [DONE]
    output                     CODE_UPDATE,
    input                      DLL_DLY_DIFF,

    // PLL/TIP 
    // => Promote to top [DONE]
    // => Connect to PLL [DONE]
    input                  PLL_LOCK,
    output [NUM_BCLKS-1:0] LOADPHS_B,
    output [NUM_BCLKS-1:0] VCO_PHSEL_BCLK_SEL,
    output [NUM_BCLKS-1:0] VCO_PHSEL_BCLK90_SEL,
    output                 VCO_PHSEL_REFCLK_SEL,
    output [NUM_BCLKS-1:0] VCO_PHSEL_ROTATE,

    // Connected to LANECTRL ODT_EN port [DONE]
    output [IOG_DQS_LANES-1:0] ODT_DYN_LANE,

    // Tie-off to '10101010' (0xAA) [DONE]
    input  [7:0]               TRAINING_PATTERN,

    // Unused [DONE] => Debug/User signal?
    output [IOG_DQS_LANES-1:0] RD_TRAINING_ERROR,

    //   TWO_RANKS = '0' if 1 rank, 1 is 2 ranks [DONE]
    //   SWITCH output of READ_TRAINING IOD goes to SWITCH in of LANECTRL [DONE]
    input TWO_RANKS,

    output [IOG_DQS_LANES*3-1:0] CLK_SEL,

    output reg [IOG_DQS_LANES-1:0] INIT_PAUSE,
    output                     INIT_RESET,

    input  [IOG_DQS_LANES-1:0] BURST_DETECT,

    output REFCLK_EYE_MONITOR_CLR_FLAGS,
    input  REFCLK_EYE_MONITOR_EARLY,
    input  REFCLK_EYE_MONITOR_LATE,
    output REFCLK_DELAY_LINE_MOVE,
    output REFCLK_DELAY_LINE_DIRECTION,
    output REFCLK_DELAY_LINE_LOAD,
    input  REFCLK_IGEAR_RX8,

    output [NUM_BCLKS-1:0] BCLK_EYE_MONITOR_CLR_FLAGS,
    input  [NUM_BCLKS-1:0] BCLK_EYE_MONITOR_EARLY,
    input  [NUM_BCLKS-1:0] BCLK_EYE_MONITOR_LATE,

    output CMD_EYE_MONITOR_CLR_FLAGS,
    input  CMD_EYE_MONITOR_EARLY,
    input  CMD_EYE_MONITOR_LATE,
    output CMD_DELAY_LINE_MOVE,
    output CMD_DELAY_LINE_MOVE_TRN,
    output CMD_DELAY_LINE_DIRECTION,
    output CMD_DELAY_LINE_LOAD,

    // Goes to A13 OE_DATA[3:0] [DONE]
    output CMD_OE,

    // LOCAL VREF training not needed in current solution for DDR3 [DONE]
    // REMOTE VREF training MUST for FFR4. Not in TIP yet.
    output VREF_MOVE,
    output VREF_DIRECTION,
    output VREF_RELOAD,
    input  VREF_OUT_OF_RANGE,

    // DQSW training [DONE]
    output [IOG_DQS_LANES-1:0]   DQSW_EYE_MONITOR_CLR_FLAGS,
    input  [IOG_DQS_LANES-1:0]   DQSW_EYE_MONITOR_EARLY,
    input  [IOG_DQS_LANES-1:0]   DQSW_EYE_MONITOR_LATE,
    output [IOG_DQS_LANES-1:0]   DQSW_DELAY_LINE_MOVE,
    output [IOG_DQS_LANES-1:0]   DQSW_DELAY_LINE_DIRECTION,
    output [IOG_DQS_LANES-1:0]   DQSW_DELAY_LINE_LOAD,
    input  [IOG_DQS_LANES-1:0]   DQSW_DELAY_LINE_OOR,
    output reg [IOG_DQS_LANES*8-1:0] DQSW_SELA,

    // DQSW270 training [DONE]
    output [IOG_DQS_LANES-1:0] DQSW270_EYE_MONITOR_CLR_FLAGS,
    input  [IOG_DQS_LANES-1:0] DQSW270_EYE_MONITOR_EARLY,
    input  [IOG_DQS_LANES-1:0] DQSW270_EYE_MONITOR_LATE,
    output [IOG_DQS_LANES-1:0] DQSW270_DELAY_LINE_MOVE,
    output [IOG_DQS_LANES-1:0] DQSW270_DELAY_LINE_DIRECTION,
    output [IOG_DQS_LANES-1:0] DQSW270_DELAY_LINE_LOAD,
    input  [IOG_DQS_LANES-1:0] DQSW270_DELAY_LINE_OOR,
    input  [IOG_DQS_LANES-1:0] DQSW270_IGEAR_RX8,

    input  [IOG_DQS_LANES*9-1:0] RX_OUT_OF_RANGE,
    input  [IOG_DQS_LANES*9-1:0] TX_OUT_OF_RANGE,
    output reg [IOG_DQS_LANES*9-1:0] MOVE,
    output reg [IOG_DQS_LANES*9-1:0] DIRECTION,
    output reg [IOG_DQS_LANES*9-1:0] LOAD,
    output reg [IOG_DQS_LANES-1:0]   DELAY_LINE_SEL_RD,

    // RDATA Training
    input  [IOG_DQS_LANES*8-1:0]   PAD_RDDATA,
    input  [IOG_DQS_LANES*8*8-1:0] IOG_RDDATA,
    input  [IOG_DQS_LANES-1:0]     IOG_RDDATA_VALID,
    output reg [IOG_DQS_LANES*8*2-1:0] DFI_RDDATA_W0,
    output reg [IOG_DQS_LANES*8*2-1:0] DFI_RDDATA_W1,
    output reg [IOG_DQS_LANES*8*2-1:0] DFI_RDDATA_W2,
    output reg [IOG_DQS_LANES*8*2-1:0] DFI_RDDATA_W3,
    output reg                        DFI_RDDATA_VALID_W0,
    output reg                        DFI_RDDATA_VALID_W1,
    output reg                        DFI_RDDATA_VALID_W2,
    output reg                        DFI_RDDATA_VALID_W3,

    input [IOG_DQS_LANES*2-1:0]    DFI_WRDATA_MASK_P0,
    input [IOG_DQS_LANES*2-1:0]    DFI_WRDATA_MASK_P1,
    input [IOG_DQS_LANES*2-1:0]    DFI_WRDATA_MASK_P2,
    input [IOG_DQS_LANES*2-1:0]    DFI_WRDATA_MASK_P3,
    // input [19:0]                   DFI_ADDRESS_P0,
    // input [19:0]                   DFI_ADDRESS_P1,
    // input [19:0]                   DFI_ADDRESS_P2,
    // input [19:0]                   DFI_ADDRESS_P3,
    output [IOG_DQS_LANES*2-1:0]   IOG_WRDATA_MASK_P0,
    output [IOG_DQS_LANES*2-1:0]   IOG_WRDATA_MASK_P1,
    output [IOG_DQS_LANES*2-1:0]   IOG_WRDATA_MASK_P2,
    output [IOG_DQS_LANES*2-1:0]   IOG_WRDATA_MASK_P3,
    output [19:0]                  IOG_ADDRESS_P0,
    output [19:0]                  IOG_ADDRESS_P1,
    output [19:0]                  IOG_ADDRESS_P2,
    output [19:0]                  IOG_ADDRESS_P3,

    input  DFI_RDLVL_EN,
    input  DFI_RDLVL_GATE_EN,
    input  DFI_WRLVL_EN,
    input  DFI_WRLVL_STROBE,

    input  DFI_INIT_START,
    output DFI_INIT_COMPLETE,
    output DFI_TRAINING_COMPLETE,

    input  DFI_RDLVL_CS_0_N,
    input  DFI_RDLVL_CS_1_N,
    input  DFI_WRLVL_CS_0_N,
    input  DFI_WRLVL_CS_1_N,

    // TIP to NWL [DONE] - DEBUG -
    output [IOG_DQS_LANES-1:0] DFI_RDLVL_RESP,
    output [IOG_DQS_LANES-1:0] DFI_WRLVL_RESP,

    input  DFI_CTRLUPD_REQ,

    input  DFI_RDDATA_CS_0_N_P0,
    input  DFI_RDDATA_CS_1_N_P0,
    input  DFI_RDDATA_CS_0_N_P1,
    input  DFI_RDDATA_CS_1_N_P1,
    input  DFI_RDDATA_CS_0_N_P2,
    input  DFI_RDDATA_CS_1_N_P2,
    input  DFI_RDDATA_CS_0_N_P3,
    input  DFI_RDDATA_CS_1_N_P3,

    input  DFI_WRDATA_CS_0_N_P0,
    input  DFI_WRDATA_CS_1_N_P0,
    input  DFI_WRDATA_CS_0_N_P1,
    input  DFI_WRDATA_CS_1_N_P1,
    input  DFI_WRDATA_CS_0_N_P2,
    input  DFI_WRDATA_CS_1_N_P2,
    input  DFI_WRDATA_CS_0_N_P3,
    input  DFI_WRDATA_CS_1_N_P3,

    // Map to PHY:DFI_RDDATA_EN_P0[0] [DONE]
    input  DFI_RDDATA_EN_P0,
    input  DFI_RDDATA_EN_P1,
    input  DFI_RDDATA_EN_P2,
    input  DFI_RDDATA_EN_P3,

    // Map to PHY:DFI_WRDATA_EN_P0[0] [DONE]
    input  DFI_WRDATA_EN_P0,
    input  DFI_WRDATA_EN_P1,
    input  DFI_WRDATA_EN_P2,
    input  DFI_WRDATA_EN_P3,

    // Goes to READ_TRAINING TX_DATA[7:0] [DONE]
    output [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P0_P,
    output [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P0_N,
    output [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P1_P,
    output [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P1_N,
    output [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P2_P,
    output [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P2_N,
    output [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P3_P,
    output [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P3_N,

    // Goes to all DQ OE_DATA[3:0] in a lane [DONE]
    output reg [IOG_DQS_LANES-1:0] IOG_OE_P0,
    output reg [IOG_DQS_LANES-1:0] IOG_OE_P1,
    output reg [IOG_DQS_LANES-1:0] IOG_OE_P2,
    output reg [IOG_DQS_LANES-1:0] IOG_OE_P3,

    // Goes to DQS OE_DATA[3:0] in a lane [DONE]
    output reg [IOG_DQS_LANES-1:0] DQS_OE_P0,
    output reg [IOG_DQS_LANES-1:0] DQS_OE_P1,
    output reg [IOG_DQS_LANES-1:0] DQS_OE_P2,
    output reg [IOG_DQS_LANES-1:0] DQS_OE_P3,

    // Goes to DM OE_DATA[3:0] in a lane [DONE]
    output reg [IOG_DQS_LANES-1:0] DM_OE_P0,
    output reg [IOG_DQS_LANES-1:0] DM_OE_P1,
    output reg [IOG_DQS_LANES-1:0] DM_OE_P2,
    output reg [IOG_DQS_LANES-1:0] DM_OE_P3,

    // AS: added VREF training signals
    output                          CAL_INIT_MR_W_REQ,
    output [ 7:0]                   CAL_INIT_MR_ADDR,
    output [17:0]                   CAL_INIT_MR_WR_DATA,
    output [17:0]                   CAL_INIT_MR_WR_MASK,
    input                           CAL_INIT_ACK,
    output [1:0]                    CAL_INIT_CS,
    input                           SKIP_VREF_TRAINING,
    input                           PCLK,
    input  [6:0]                    VREF_MR6_VALUE,
    input                           CTRLR_READY_IN,
    output   reg                     CTRLR_READY_OUT,
    output reg CMD_RESET_LANE,
    
    // AS: added 6/8 for write callibration
    input  [IOG_DQS_LANES*64-1:0]    IOG_DQ_TXDATA_IN,
    output reg [IOG_DQS_LANES*64-1:0]    IOG_DQ_TXDATA_OUT,
    input  [IOG_DQS_LANES*8-1:0]     IOG_DM_TXDATA_IN,
    output reg [IOG_DQS_LANES*8-1:0]     IOG_DM_TXDATA_OUT,
    
    output  reg                              CAL_L_R_REQ,                // to NWL CTRLR
    output    reg                            CAL_L_W_REQ,                // to NWL CTRLR
    output reg [IOG_DQS_LANES*64-1:0]         CAL_L_DATAIN,               // to NWL CTRLR
    output reg [IOG_DQS_LANES*8-1:0]          CAL_L_DM_IN,                // to NWL CTRLR
    input                                 CAL_L_BUSY,                 // to NWL CTRLR
    input                                 CAL_L_D_REQ,                // to NWL CTRLR
    input  [IOG_DQS_LANES*64-1:0]         CAL_L_DATAOUT,              // to NWL CTRLR
    input                                 CAL_L_R_VALID,              // to NWL CTRLR  
    output  reg                           CAL_SELECT,                 // to NWL CTRLR
    input [7:0]                           WRCAL_WRITE_COUNTER_VALUE,
    input [2:0]                           ADDR_VCOPHS_OFFSET,
    
    // AS: additional ports for pipelining
    input                               DFI_RESET_N_P0            ,
    input                               DFI_RESET_N_P1            ,
    input                               DFI_RESET_N_P2            ,
    input                               DFI_RESET_N_P3            ,
    input  [19:0]                       DFI_ADDRESS_P0            ,
    input  [19:0]                       DFI_ADDRESS_P1            ,
    input  [19:0]                       DFI_ADDRESS_P2            ,
    input  [19:0]                       DFI_ADDRESS_P3            ,
    input  [3:0]                        DFI_BANK_P0               ,
    input  [3:0]                        DFI_BANK_P1               ,
    input  [3:0]                        DFI_BANK_P2               ,
    input  [3:0]                        DFI_BANK_P3               ,
    input                               DFI_CS_N_P0               ,
    input                               DFI_CS_N_P1               ,
    input                               DFI_CS_N_P2               ,
    input                               DFI_CS_N_P3               ,
    input                               DFI_ODT_P0                ,
    input                               DFI_ODT_P1                ,
    input                               DFI_ODT_P2                ,
    input                               DFI_ODT_P3                ,
    input                               DFI_CKE_P0                ,
    input                               DFI_CKE_P1                ,
    input                               DFI_CKE_P2                ,
    input                               DFI_CKE_P3                ,
    input                               DFI_RAS_N_P0              ,
    input                               DFI_RAS_N_P1              ,
    input                               DFI_RAS_N_P2              ,
    input                               DFI_RAS_N_P3              ,
    input                               DFI_CAS_N_P0              ,
    input                               DFI_CAS_N_P1              ,
    input                               DFI_CAS_N_P2              ,
    input                               DFI_CAS_N_P3              ,
    input                               DFI_WE_N_P0               ,
    input                               DFI_WE_N_P1               ,
    input                               DFI_WE_N_P2               ,
    input                               DFI_WE_N_P3               ,
    input                               DFI_ACT_N_P0              ,
    input                               DFI_ACT_N_P1              ,
    input                               DFI_ACT_N_P2              ,
    input                               DFI_ACT_N_P3              ,
    output                              DFI_RESET_N_P0_OUT        ,
    output                              DFI_RESET_N_P1_OUT        ,
    output                              DFI_RESET_N_P2_OUT        ,
    output                              DFI_RESET_N_P3_OUT        ,
    output     [3:0]                    DFI_BANK_P0_OUT           ,  
    output     [3:0]                    DFI_BANK_P1_OUT           ,  
    output     [3:0]                    DFI_BANK_P2_OUT           ,  
    output     [3:0]                    DFI_BANK_P3_OUT           ,  
    output                              DFI_CS_N_P0_OUT           ,  
    output                              DFI_CS_N_P1_OUT           ,  
    output                              DFI_CS_N_P2_OUT           ,  
    output                              DFI_CS_N_P3_OUT           ,  
    output                              DFI_ODT_P0_OUT            ,  
    output                              DFI_ODT_P1_OUT            ,  
    output                              DFI_ODT_P2_OUT            ,  
    output                              DFI_ODT_P3_OUT            ,  
    output                              DFI_CKE_P0_OUT            ,  
    output                              DFI_CKE_P1_OUT            ,  
    output                              DFI_CKE_P2_OUT            ,  
    output                              DFI_CKE_P3_OUT            ,  
    output                              DFI_RAS_N_P0_OUT          ,  
    output                              DFI_RAS_N_P1_OUT          ,  
    output                              DFI_RAS_N_P2_OUT          ,  
    output                              DFI_RAS_N_P3_OUT          ,  
    output                              DFI_CAS_N_P0_OUT          ,  
    output                              DFI_CAS_N_P1_OUT          ,  
    output                              DFI_CAS_N_P2_OUT          ,  
    output                              DFI_CAS_N_P3_OUT          ,  
    output                              DFI_WE_N_P0_OUT           ,  
    output                              DFI_WE_N_P1_OUT           ,  
    output                              DFI_WE_N_P2_OUT           ,  
    output                              DFI_WE_N_P3_OUT           ,
    output                              DFI_ACT_N_P0_OUT          ,  
    output                              DFI_ACT_N_P1_OUT          ,  
    output                              DFI_ACT_N_P2_OUT          ,  
    output                              DFI_ACT_N_P3_OUT          ,
    input  [1:0]                          DFI_BG_P0               ,
    input  [1:0]                          DFI_BG_P1               ,
    input  [1:0]                          DFI_BG_P2               ,
    input  [1:0]                          DFI_BG_P3               ,
    output [1:0]                          DFI_BG_P0_OUT           ,  
    output [1:0]                          DFI_BG_P1_OUT           ,  
    output [1:0]                          DFI_BG_P2_OUT           ,  
    output [1:0]                          DFI_BG_P3_OUT             

    
    );

    localparam HOLD_ODT_CYCLES = 2;

    // Output Tie-Offs
    assign PRDATA                          = 'b0;
    assign PREADY                          = 'b0;
    
    assign CODE_UPDATE                     = 'b0;
    assign RD_TRAINING_ERROR               = 'b0;

    assign REFCLK_EYE_MONITOR_CLR_FLAGS    = 'b0;
    assign REFCLK_DELAY_LINE_MOVE          = 'b0;
    assign REFCLK_DELAY_LINE_DIRECTION     = 'b0;
    assign REFCLK_DELAY_LINE_LOAD          = 'b0;
    assign BCLK_EYE_MONITOR_CLR_FLAGS      = 'b0;

    assign CMD_EYE_MONITOR_CLR_FLAGS       = 'b0;
    assign CMD_DELAY_LINE_MOVE             = 'b0;
    assign CMD_DELAY_LINE_MOVE_TRN         = 'b0;
    assign CMD_DELAY_LINE_DIRECTION        = 'b0;
    assign CMD_DELAY_LINE_LOAD             = 'b0;

    assign CMD_OE                          = 'b1;
    
    assign VREF_MOVE                       = 'b0;
    assign VREF_DIRECTION                  = 'b0;
    assign VREF_RELOAD                     = 'b0;
    
    assign DQSW_EYE_MONITOR_CLR_FLAGS      = 'b0;
    assign DQSW_DELAY_LINE_MOVE            = 'b0;
    assign DQSW_DELAY_LINE_DIRECTION       = 'b0;
    assign DQSW_DELAY_LINE_LOAD            = 'b0;
    //assign DQSW_SELA                       = 'b0;
    
    assign DQSW270_EYE_MONITOR_CLR_FLAGS   = 'b0;
    assign DQSW270_DELAY_LINE_MOVE         = 'b0;
    assign DQSW270_DELAY_LINE_DIRECTION    = 'b0;
    assign DQSW270_DELAY_LINE_LOAD         = 'b0;
    

    
    assign DFI_RDLVL_RESP                  = 'b0;
    assign DFI_WRLVL_RESP                  = 'b0;

    reg read_gate_en;

    wire [IOG_DQS_LANES-1:0] dq_oe_p0;
    wire [IOG_DQS_LANES-1:0] dq_oe_p1;
    wire [IOG_DQS_LANES-1:0] dq_oe_p2;
    wire [IOG_DQS_LANES-1:0] dq_oe_p3;

    wire [IOG_DQS_LANES*64-1:0]    IOG_DQ_TXDATA_OUT_int;
    wire [IOG_DQS_LANES*8-1:0]     IOG_DM_TXDATA_OUT_int;

    wire [IOG_DQS_LANES-1:0] IOG_OE_P0_int;
    wire [IOG_DQS_LANES-1:0] IOG_OE_P1_int;
    wire [IOG_DQS_LANES-1:0] IOG_OE_P2_int;
    wire [IOG_DQS_LANES-1:0] IOG_OE_P3_int;
    wire [IOG_DQS_LANES-1:0] DQS_OE_P0_int;
    wire [IOG_DQS_LANES-1:0] DQS_OE_P1_int;
    wire [IOG_DQS_LANES-1:0] DQS_OE_P2_int;
    wire [IOG_DQS_LANES-1:0] DQS_OE_P3_int;
    wire [IOG_DQS_LANES-1:0] DM_OE_P0_int;
    wire [IOG_DQS_LANES-1:0] DM_OE_P1_int;
    wire [IOG_DQS_LANES-1:0] DM_OE_P2_int;
    wire [IOG_DQS_LANES-1:0] DM_OE_P3_int;

    wire INIT_RESET_int;
    assign INIT_RESET_int = PLL_LOCK && RESET_N;
    assign INIT_RESET = ~INIT_RESET_int;
    wire [IOG_DQS_LANES*3-1:0] write_callibration_offset;

    reg [2:0]  write_cal_offset;
    reg [2:0]  read_gate_phase_sel;

    reg DFI_RDDATA_EN_P0_reg;
    reg DFI_RDDATA_EN_P1_reg;
    reg DFI_RDDATA_EN_P2_reg;
    reg DFI_RDDATA_EN_P3_reg;

    reg DFI_RDDATA_EN_P0_reg2;
    reg DFI_RDDATA_EN_P1_reg2;
    reg DFI_RDDATA_EN_P2_reg2;
    reg DFI_RDDATA_EN_P3_reg2;

    reg DFI_RDDATA_EN_P0_int;
    reg DFI_RDDATA_EN_P1_int;
    reg DFI_RDDATA_EN_P2_int;
    reg DFI_RDDATA_EN_P3_int;

    reg CAL_L_DATAOUT_reg;
    reg hold_init_complete;

    real  t1,t2;
    reg [7:0] nbmv;

// ***********************************************************************
// AS: 6/18
// ADDED PIPELINE REGISTER BANK FOR OPTIONAL PIPELINING
// ***********************************************************************

// wires for internal routing
wire [19:0]                     DFI_ADDRESS_P0_WIRE;
wire [19:0]                     DFI_ADDRESS_P1_WIRE;
wire [19:0]                     DFI_ADDRESS_P2_WIRE;
wire [19:0]                     DFI_ADDRESS_P3_WIRE;
wire                            DFI_WRDATA_EN_P0_WIRE;
wire                            DFI_WRDATA_EN_P1_WIRE;
wire                            DFI_WRDATA_EN_P2_WIRE;
wire                            DFI_WRDATA_EN_P3_WIRE;

wire [IOG_DQS_LANES*64-1:0]     IOG_DQ_TXDATA_IN_WIRE;
wire [IOG_DQS_LANES*8-1:0]      IOG_DM_TXDATA_IN_WIRE;

wire                            DFI_WRDATA_CS_0_N_P0_WIRE;
wire                            DFI_WRDATA_CS_0_N_P1_WIRE;
wire                            DFI_WRDATA_CS_0_N_P2_WIRE;
wire                            DFI_WRDATA_CS_0_N_P3_WIRE;
wire                            DFI_WRDATA_CS_1_N_P0_WIRE;
wire                            DFI_WRDATA_CS_1_N_P1_WIRE;
wire                            DFI_WRDATA_CS_1_N_P2_WIRE;
wire                            DFI_WRDATA_CS_1_N_P3_WIRE;

wire                            DFI_RDDATA_EN_P0_WIRE;
wire                            DFI_RDDATA_EN_P1_WIRE;
wire                            DFI_RDDATA_EN_P2_WIRE;
wire                            DFI_RDDATA_EN_P3_WIRE;
wire [IOG_DQS_LANES-1:0]        IOG_RDDATA_VALID_WIRE;
wire [IOG_DQS_LANES*64-1:0]     IOG_RDDATA_WIRE;

wire                            DFI_RDDATA_CS_0_N_P0_WIRE;
wire                            DFI_RDDATA_CS_0_N_P1_WIRE;
wire                            DFI_RDDATA_CS_0_N_P2_WIRE;
wire                            DFI_RDDATA_CS_0_N_P3_WIRE;
wire                            DFI_RDDATA_CS_1_N_P0_WIRE;
wire                            DFI_RDDATA_CS_1_N_P1_WIRE;
wire                            DFI_RDDATA_CS_1_N_P2_WIRE;
wire                            DFI_RDDATA_CS_1_N_P3_WIRE;
wire [IOG_DQS_LANES-1:0]        BURST_DETECT_WIRE;



// register bank instance
register_bank # (
  .PIPELINE(PIPELINE),
  .IOG_DQS_LANES(IOG_DQS_LANES)
) u_register_bank (
  // write path / control
  // inputs
  .SCLK                      ( SCLK                       ),
  .RESET_N                   ( RESET_N                    ),
  .DFI_RESET_N_P0            ( DFI_RESET_N_P0             ),
  .DFI_RESET_N_P1            ( DFI_RESET_N_P1             ),
  .DFI_RESET_N_P2            ( DFI_RESET_N_P2             ),
  .DFI_RESET_N_P3            ( DFI_RESET_N_P3             ),
  .DFI_ADDRESS_P0            ( DFI_ADDRESS_P0             ),
  .DFI_ADDRESS_P1            ( DFI_ADDRESS_P1             ),
  .DFI_ADDRESS_P2            ( DFI_ADDRESS_P2             ),
  .DFI_ADDRESS_P3            ( DFI_ADDRESS_P3             ),
  .DFI_BANK_P0               ( DFI_BANK_P0                ),
  .DFI_BANK_P1               ( DFI_BANK_P1                ),
  .DFI_BANK_P2               ( DFI_BANK_P2                ),
  .DFI_BANK_P3               ( DFI_BANK_P3                ),
  .DFI_CS_N_P0               ( DFI_CS_N_P0                ),
  .DFI_CS_N_P1               ( DFI_CS_N_P1                ),
  .DFI_CS_N_P2               ( DFI_CS_N_P2                ),
  .DFI_CS_N_P3               ( DFI_CS_N_P3                ),
  .DFI_ODT_P0                ( DFI_ODT_P0                 ),
  .DFI_ODT_P1                ( DFI_ODT_P1                 ),
  .DFI_ODT_P2                ( DFI_ODT_P2                 ),
  .DFI_ODT_P3                ( DFI_ODT_P3                 ),
  .DFI_CKE_P0                ( DFI_CKE_P0                 ),
  .DFI_CKE_P1                ( DFI_CKE_P1                 ),
  .DFI_CKE_P2                ( DFI_CKE_P2                 ),
  .DFI_CKE_P3                ( DFI_CKE_P3                 ),
  .DFI_RAS_N_P0              ( DFI_RAS_N_P0               ),
  .DFI_RAS_N_P1              ( DFI_RAS_N_P1               ),
  .DFI_RAS_N_P2              ( DFI_RAS_N_P2               ),
  .DFI_RAS_N_P3              ( DFI_RAS_N_P3               ),
  .DFI_CAS_N_P0              ( DFI_CAS_N_P0               ),
  .DFI_CAS_N_P1              ( DFI_CAS_N_P1               ),
  .DFI_CAS_N_P2              ( DFI_CAS_N_P2               ),
  .DFI_CAS_N_P3              ( DFI_CAS_N_P3               ),
  .DFI_WE_N_P0               ( DFI_WE_N_P0                ),
  .DFI_WE_N_P1               ( DFI_WE_N_P1                ),
  .DFI_WE_N_P2               ( DFI_WE_N_P2                ),
  .DFI_WE_N_P3               ( DFI_WE_N_P3                ),
  .DFI_ACT_N_P0              ( DFI_ACT_N_P0               ),
  .DFI_ACT_N_P1              ( DFI_ACT_N_P1               ),
  .DFI_ACT_N_P2              ( DFI_ACT_N_P2               ),
  .DFI_ACT_N_P3              ( DFI_ACT_N_P3               ),
  .DFI_WRDATA_EN_P0          ( DFI_WRDATA_EN_P0           ),
  .DFI_WRDATA_EN_P1          ( DFI_WRDATA_EN_P1           ),
  .DFI_WRDATA_EN_P2          ( DFI_WRDATA_EN_P2           ),
  .DFI_WRDATA_EN_P3          ( DFI_WRDATA_EN_P3           ),
  .IOG_DQ_TXDATA_IN          ( IOG_DQ_TXDATA_IN           ),
  .IOG_DM_TXDATA_IN          ( IOG_DM_TXDATA_IN           ),
  .DFI_WRDATA_CS_0_N_P0      ( DFI_WRDATA_CS_0_N_P0       ),
  .DFI_WRDATA_CS_0_N_P1      ( DFI_WRDATA_CS_0_N_P1       ),
  .DFI_WRDATA_CS_0_N_P2      ( DFI_WRDATA_CS_0_N_P2       ),
  .DFI_WRDATA_CS_0_N_P3      ( DFI_WRDATA_CS_0_N_P3       ),
  .DFI_WRDATA_CS_1_N_P0      ( DFI_WRDATA_CS_1_N_P0       ),
  .DFI_WRDATA_CS_1_N_P1      ( DFI_WRDATA_CS_1_N_P1       ),
  .DFI_WRDATA_CS_1_N_P2      ( DFI_WRDATA_CS_1_N_P2       ),
  .DFI_WRDATA_CS_1_N_P3      ( DFI_WRDATA_CS_1_N_P3       ),
  // outputs
  .DFI_RESET_N_P0_OUT        ( DFI_RESET_N_P0_OUT         ),
  .DFI_RESET_N_P1_OUT        ( DFI_RESET_N_P1_OUT         ),
  .DFI_RESET_N_P2_OUT        ( DFI_RESET_N_P2_OUT         ),
  .DFI_RESET_N_P3_OUT        ( DFI_RESET_N_P3_OUT         ),
  .DFI_ADDRESS_P0_OUT        ( DFI_ADDRESS_P0_WIRE        ),  
  .DFI_ADDRESS_P1_OUT        ( DFI_ADDRESS_P1_WIRE        ),  
  .DFI_ADDRESS_P2_OUT        ( DFI_ADDRESS_P2_WIRE        ),  
  .DFI_ADDRESS_P3_OUT        ( DFI_ADDRESS_P3_WIRE        ),  
  .DFI_BANK_P0_OUT           ( DFI_BANK_P0_OUT            ),  
  .DFI_BANK_P1_OUT           ( DFI_BANK_P1_OUT            ),  
  .DFI_BANK_P2_OUT           ( DFI_BANK_P2_OUT            ),  
  .DFI_BANK_P3_OUT           ( DFI_BANK_P3_OUT            ),  
  .DFI_CS_N_P0_OUT           ( DFI_CS_N_P0_OUT            ),  
  .DFI_CS_N_P1_OUT           ( DFI_CS_N_P1_OUT            ),  
  .DFI_CS_N_P2_OUT           ( DFI_CS_N_P2_OUT            ),  
  .DFI_CS_N_P3_OUT           ( DFI_CS_N_P3_OUT            ),  
  .DFI_ODT_P0_OUT            ( DFI_ODT_P0_OUT             ),  
  .DFI_ODT_P1_OUT            ( DFI_ODT_P1_OUT             ),  
  .DFI_ODT_P2_OUT            ( DFI_ODT_P2_OUT             ),  
  .DFI_ODT_P3_OUT            ( DFI_ODT_P3_OUT             ),  
  .DFI_CKE_P0_OUT            ( DFI_CKE_P0_OUT             ),  
  .DFI_CKE_P1_OUT            ( DFI_CKE_P1_OUT             ),  
  .DFI_CKE_P2_OUT            ( DFI_CKE_P2_OUT             ),  
  .DFI_CKE_P3_OUT            ( DFI_CKE_P3_OUT             ),  
  .DFI_RAS_N_P0_OUT          ( DFI_RAS_N_P0_OUT           ),  
  .DFI_RAS_N_P1_OUT          ( DFI_RAS_N_P1_OUT           ),  
  .DFI_RAS_N_P2_OUT          ( DFI_RAS_N_P2_OUT           ),  
  .DFI_RAS_N_P3_OUT          ( DFI_RAS_N_P3_OUT           ),  
  .DFI_CAS_N_P0_OUT          ( DFI_CAS_N_P0_OUT           ),  
  .DFI_CAS_N_P1_OUT          ( DFI_CAS_N_P1_OUT           ),  
  .DFI_CAS_N_P2_OUT          ( DFI_CAS_N_P2_OUT           ),  
  .DFI_CAS_N_P3_OUT          ( DFI_CAS_N_P3_OUT           ),  
  .DFI_WE_N_P0_OUT           ( DFI_WE_N_P0_OUT            ),  
  .DFI_WE_N_P1_OUT           ( DFI_WE_N_P1_OUT            ),  
  .DFI_WE_N_P2_OUT           ( DFI_WE_N_P2_OUT            ),  
  .DFI_WE_N_P3_OUT           ( DFI_WE_N_P3_OUT            ),
  .DFI_ACT_N_P0_OUT          ( DFI_ACT_N_P0_OUT           ),  
  .DFI_ACT_N_P1_OUT          ( DFI_ACT_N_P1_OUT           ),  
  .DFI_ACT_N_P2_OUT          ( DFI_ACT_N_P2_OUT           ),  
  .DFI_ACT_N_P3_OUT          ( DFI_ACT_N_P3_OUT           ),  
  .DFI_WRDATA_EN_P0_OUT      ( DFI_WRDATA_EN_P0_WIRE      ),  
  .DFI_WRDATA_EN_P1_OUT      ( DFI_WRDATA_EN_P1_WIRE      ),  
  .DFI_WRDATA_EN_P2_OUT      ( DFI_WRDATA_EN_P2_WIRE      ),  
  .DFI_WRDATA_EN_P3_OUT      ( DFI_WRDATA_EN_P3_WIRE      ),
  .IOG_DQ_TXDATA_OUT         ( IOG_DQ_TXDATA_IN_WIRE      ),
  .IOG_DM_TXDATA_OUT         ( IOG_DM_TXDATA_IN_WIRE      ),
  .DFI_WRDATA_CS_0_N_P0_OUT  ( DFI_WRDATA_CS_0_N_P0_WIRE  ),  
  .DFI_WRDATA_CS_0_N_P1_OUT  ( DFI_WRDATA_CS_0_N_P1_WIRE  ),  
  .DFI_WRDATA_CS_0_N_P2_OUT  ( DFI_WRDATA_CS_0_N_P2_WIRE  ),  
  .DFI_WRDATA_CS_0_N_P3_OUT  ( DFI_WRDATA_CS_0_N_P3_WIRE  ),   
  .DFI_WRDATA_CS_1_N_P0_OUT  ( DFI_WRDATA_CS_1_N_P0_WIRE  ),  
  .DFI_WRDATA_CS_1_N_P1_OUT  ( DFI_WRDATA_CS_1_N_P1_WIRE  ),  
  .DFI_WRDATA_CS_1_N_P2_OUT  ( DFI_WRDATA_CS_1_N_P2_WIRE  ),  
  .DFI_WRDATA_CS_1_N_P3_OUT  ( DFI_WRDATA_CS_1_N_P3_WIRE  ),
  // read data path
  // inputs
  .DFI_RDDATA_EN_P0          ( DFI_RDDATA_EN_P0           ),
  .DFI_RDDATA_EN_P1          ( DFI_RDDATA_EN_P1           ),
  .DFI_RDDATA_EN_P2          ( DFI_RDDATA_EN_P2           ),
  .DFI_RDDATA_EN_P3          ( DFI_RDDATA_EN_P3           ),
  .IOG_RDDATA_VALID          ( IOG_RDDATA_VALID           ),
  .IOG_RDDATA                ( IOG_RDDATA                 ),
  .DFI_RDDATA_CS_0_N_P0      ( DFI_RDDATA_CS_0_N_P0       ),
  .DFI_RDDATA_CS_0_N_P1      ( DFI_RDDATA_CS_0_N_P1       ),
  .DFI_RDDATA_CS_0_N_P2      ( DFI_RDDATA_CS_0_N_P2       ),
  .DFI_RDDATA_CS_0_N_P3      ( DFI_RDDATA_CS_0_N_P3       ),
  .DFI_RDDATA_CS_1_N_P0      ( DFI_RDDATA_CS_1_N_P0       ),
  .DFI_RDDATA_CS_1_N_P1      ( DFI_RDDATA_CS_1_N_P1       ),
  .DFI_RDDATA_CS_1_N_P2      ( DFI_RDDATA_CS_1_N_P2       ),
  .DFI_RDDATA_CS_1_N_P3      ( DFI_RDDATA_CS_1_N_P3       ),
  .BURST_DETECT              ( BURST_DETECT               ),
  // outputs
  .DFI_RDDATA_EN_P0_OUT      ( DFI_RDDATA_EN_P0_WIRE      ),
  .DFI_RDDATA_EN_P1_OUT      ( DFI_RDDATA_EN_P1_WIRE      ),
  .DFI_RDDATA_EN_P2_OUT      ( DFI_RDDATA_EN_P2_WIRE      ),
  .DFI_RDDATA_EN_P3_OUT      ( DFI_RDDATA_EN_P3_WIRE      ),
  .IOG_RDDATA_VALID_OUT      ( IOG_RDDATA_VALID_WIRE      ),
  .IOG_RDDATA_OUT            ( IOG_RDDATA_WIRE            ),
  .DFI_RDDATA_CS_0_N_P0_OUT  ( DFI_RDDATA_CS_0_N_P0_WIRE  ),
  .DFI_RDDATA_CS_0_N_P1_OUT  ( DFI_RDDATA_CS_0_N_P1_WIRE  ),
  .DFI_RDDATA_CS_0_N_P2_OUT  ( DFI_RDDATA_CS_0_N_P2_WIRE  ),
  .DFI_RDDATA_CS_0_N_P3_OUT  ( DFI_RDDATA_CS_0_N_P3_WIRE  ),
  .DFI_RDDATA_CS_1_N_P0_OUT  ( DFI_RDDATA_CS_1_N_P0_WIRE  ),
  .DFI_RDDATA_CS_1_N_P1_OUT  ( DFI_RDDATA_CS_1_N_P1_WIRE  ),
  .DFI_RDDATA_CS_1_N_P2_OUT  ( DFI_RDDATA_CS_1_N_P2_WIRE  ),
  .DFI_RDDATA_CS_1_N_P3_OUT  ( DFI_RDDATA_CS_1_N_P3_WIRE  ),
  .BURST_DETECT_OUT          ( BURST_DETECT_WIRE          ),
  .DFI_BG_P0                 ( DFI_BG_P0                  ),
  .DFI_BG_P1                 ( DFI_BG_P1                  ),
  .DFI_BG_P2                 ( DFI_BG_P2                  ),
  .DFI_BG_P3                 ( DFI_BG_P3                  ),
  .DFI_BG_P0_OUT             ( DFI_BG_P0_OUT              ),
  .DFI_BG_P1_OUT             ( DFI_BG_P1_OUT              ),
  .DFI_BG_P2_OUT             ( DFI_BG_P2_OUT              ),
  .DFI_BG_P3_OUT             ( DFI_BG_P3_OUT              )

);

// ***********************************************************************
// END PIPELINING BLOCK
// ***********************************************************************

    
    initial begin
        hold_init_complete = 1'b1;
        wait(PLL_LOCK == 1'b1);
        wait(SCLK==1'b1);
        wait(SCLK==1'b0);
        t1 = $realtime;
        wait(SCLK==1'b1);
        t2 = $realtime;

	//109215 
        //divide by /2 instead of /4  only when ADDR_VCOPHS_OFFSET is 0 (since we are setting this value to 4 for DDR3/4 and to 0 for LPDDR3)
        nbmv = (ADDR_VCOPHS_OFFSET == 'd0) ? ((t2-t1)*1000/20/2) :  ((t2-t1)*1000/20/4);
        DQSW_SELA = {(IOG_DQS_LANES){nbmv}};
        #1000
        hold_init_complete = 1'b0;
    end


    genvar i;
    generate
        for ( i = 0; i < IOG_DQS_LANES; i = i + 1 ) 
        begin :glue
                assign IOG_RDDATA_EN_P0_P[i]  = DFI_RDDATA_EN_P0_int;
                assign IOG_RDDATA_EN_P0_N[i]  = DFI_RDDATA_EN_P0_int;
                
                assign IOG_RDDATA_EN_P1_P[i]  = DFI_RDDATA_EN_P1_int;
                assign IOG_RDDATA_EN_P1_N[i]  = DFI_RDDATA_EN_P1_int;

                assign IOG_RDDATA_EN_P2_P[i]  = DFI_RDDATA_EN_P2_int;
                assign IOG_RDDATA_EN_P2_N[i]  = DFI_RDDATA_EN_P2_int;

                assign IOG_RDDATA_EN_P3_P[i]  = DFI_RDDATA_EN_P3_int;
                assign IOG_RDDATA_EN_P3_N[i]  = DFI_RDDATA_EN_P3_int;
         end
    endgenerate

    always @(posedge SCLK or negedge INIT_RESET_int)
    begin
        if ( INIT_RESET_int == 1'b0 ) begin
            DFI_RDDATA_EN_P3_reg <= 1'b0;
            DFI_RDDATA_EN_P0_reg <= 1'b0;
            DFI_RDDATA_EN_P1_reg <= 1'b0;
            DFI_RDDATA_EN_P2_reg <= 1'b0;
            DFI_RDDATA_EN_P3_reg2 <= 1'b0;
            DFI_RDDATA_EN_P0_reg2 <= 1'b0;
            DFI_RDDATA_EN_P1_reg2 <= 1'b0;
            DFI_RDDATA_EN_P2_reg2 <= 1'b0;
        end else begin
            DFI_RDDATA_EN_P0_reg <=  DFI_RDDATA_EN_P0_WIRE;
            DFI_RDDATA_EN_P1_reg <=  DFI_RDDATA_EN_P1_WIRE;
            DFI_RDDATA_EN_P2_reg <=  DFI_RDDATA_EN_P2_WIRE;
            DFI_RDDATA_EN_P3_reg <=  DFI_RDDATA_EN_P3_WIRE;
            DFI_RDDATA_EN_P0_reg2 <=  DFI_RDDATA_EN_P0_reg;
            DFI_RDDATA_EN_P1_reg2 <=  DFI_RDDATA_EN_P1_reg;
            DFI_RDDATA_EN_P2_reg2 <=  DFI_RDDATA_EN_P2_reg;
            DFI_RDDATA_EN_P3_reg2 <=  DFI_RDDATA_EN_P3_reg;
        end
    end

    always @(*) begin
        if ( read_gate_phase_sel == 0 ) begin
            DFI_RDDATA_EN_P0_int = DFI_RDDATA_EN_P0_WIRE;
            DFI_RDDATA_EN_P1_int = DFI_RDDATA_EN_P1_WIRE;
            DFI_RDDATA_EN_P2_int = DFI_RDDATA_EN_P2_WIRE;
            DFI_RDDATA_EN_P3_int = DFI_RDDATA_EN_P3_WIRE;
        end else if  ( read_gate_phase_sel == 0 ) begin
            DFI_RDDATA_EN_P0_int = DFI_RDDATA_EN_P3_reg;
            DFI_RDDATA_EN_P1_int = DFI_RDDATA_EN_P0_WIRE;
            DFI_RDDATA_EN_P2_int = DFI_RDDATA_EN_P1_WIRE;
            DFI_RDDATA_EN_P3_int = DFI_RDDATA_EN_P2_WIRE;
        end else if  ( read_gate_phase_sel == 1 ) begin
            DFI_RDDATA_EN_P0_int = DFI_RDDATA_EN_P2_reg;
            DFI_RDDATA_EN_P1_int = DFI_RDDATA_EN_P3_reg;
            DFI_RDDATA_EN_P2_int = DFI_RDDATA_EN_P0_WIRE;
            DFI_RDDATA_EN_P3_int = DFI_RDDATA_EN_P1_WIRE;
        end else if  ( read_gate_phase_sel == 2 ) begin
            DFI_RDDATA_EN_P0_int = DFI_RDDATA_EN_P1_reg;
            DFI_RDDATA_EN_P1_int = DFI_RDDATA_EN_P2_reg;
            DFI_RDDATA_EN_P2_int = DFI_RDDATA_EN_P3_reg;
            DFI_RDDATA_EN_P3_int = DFI_RDDATA_EN_P0_WIRE;
        end else if  ( read_gate_phase_sel == 3 ) begin
            DFI_RDDATA_EN_P0_int = DFI_RDDATA_EN_P0_reg;
            DFI_RDDATA_EN_P1_int = DFI_RDDATA_EN_P1_reg;
            DFI_RDDATA_EN_P2_int = DFI_RDDATA_EN_P2_reg;
            DFI_RDDATA_EN_P3_int = DFI_RDDATA_EN_P3_reg;
        end else if  ( read_gate_phase_sel == 4 ) begin
            DFI_RDDATA_EN_P0_int = DFI_RDDATA_EN_P3_reg2;
            DFI_RDDATA_EN_P1_int = DFI_RDDATA_EN_P0_reg;
            DFI_RDDATA_EN_P2_int = DFI_RDDATA_EN_P1_reg;
            DFI_RDDATA_EN_P3_int = DFI_RDDATA_EN_P2_reg;
        end else if  ( read_gate_phase_sel == 5 ) begin
            DFI_RDDATA_EN_P0_int = DFI_RDDATA_EN_P2_reg2;
            DFI_RDDATA_EN_P1_int = DFI_RDDATA_EN_P3_reg2;
            DFI_RDDATA_EN_P2_int = DFI_RDDATA_EN_P0_reg;
            DFI_RDDATA_EN_P3_int = DFI_RDDATA_EN_P1_reg;
        end else if  ( read_gate_phase_sel == 6 ) begin
            DFI_RDDATA_EN_P0_int = DFI_RDDATA_EN_P1_reg2;
            DFI_RDDATA_EN_P1_int = DFI_RDDATA_EN_P2_reg2;
            DFI_RDDATA_EN_P2_int = DFI_RDDATA_EN_P3_reg2;
            DFI_RDDATA_EN_P3_int = DFI_RDDATA_EN_P0_reg;
        end else if  ( read_gate_phase_sel == 7 ) begin
            DFI_RDDATA_EN_P0_int = DFI_RDDATA_EN_P0_reg2;
            DFI_RDDATA_EN_P1_int = DFI_RDDATA_EN_P1_reg2;
            DFI_RDDATA_EN_P2_int = DFI_RDDATA_EN_P2_reg2;
            DFI_RDDATA_EN_P3_int = DFI_RDDATA_EN_P3_reg2;
        end
    end


    
    PHY_SIG_MOD #( .IOG_DQS_LANES( IOG_DQS_LANES ) ) phy_sig_mod_0 ( .SCLK( SCLK ),
                    .reset_n( INIT_RESET_int) ,
                    .dfi_rdlvl_en('b0),
                    .dfi_rdlvl_gate_en('b0),
                    .dfi_wrdata_en_p0(DFI_WRDATA_EN_P0_WIRE),
                    .dfi_wrdata_en_p1(DFI_WRDATA_EN_P1_WIRE),
                    .dfi_wrdata_en_p2(DFI_WRDATA_EN_P2_WIRE),
                    .dfi_wrdata_en_p3(DFI_WRDATA_EN_P3_WIRE),
                    .dfi_wrlvl_en('b0),
                    .trn_delay_line_sel(trn_delay_line_sel),
                    .iog_oe_p0(IOG_OE_P0_int),
                    .iog_oe_p1(IOG_OE_P1_int),
                    .iog_oe_p2(IOG_OE_P2_int),
                    .iog_oe_p3(IOG_OE_P3_int),
                    .dqs_oe_p0(DQS_OE_P0_int),
                    .dqs_oe_p1(DQS_OE_P1_int),
                    .dqs_oe_p2(DQS_OE_P2_int),
                    .dqs_oe_p3(DQS_OE_P3_int),
                    // AS: added dm_oe
                    .dm_oe_p0(DM_OE_P0_int),
                    .dm_oe_p1(DM_OE_P1_int),
                    .dm_oe_p2(DM_OE_P2_int),
                    .dm_oe_p3(DM_OE_P3_int),
                    .dfi_rddata_cs_0_n_p0(DFI_RDDATA_CS_0_N_P0_WIRE),
                    .dfi_rddata_cs_0_n_p1(DFI_RDDATA_CS_0_N_P1_WIRE),
                    .dfi_rddata_cs_0_n_p2(DFI_RDDATA_CS_0_N_P2_WIRE),
                    .dfi_rddata_cs_0_n_p3(DFI_RDDATA_CS_0_N_P3_WIRE),
                    .dfi_rddata_cs_1_n_p0(DFI_RDDATA_CS_1_N_P0_WIRE),
                    .dfi_rddata_cs_1_n_p1(DFI_RDDATA_CS_1_N_P1_WIRE),
                    .dfi_rddata_cs_1_n_p2(DFI_RDDATA_CS_1_N_P2_WIRE),
                    .dfi_rddata_cs_1_n_p3(DFI_RDDATA_CS_1_N_P3_WIRE),
                    .dfi_wrdata_cs_0_n_p0(DFI_WRDATA_CS_0_N_P0_WIRE),
                    .dfi_wrdata_cs_0_n_p1(DFI_WRDATA_CS_0_N_P1_WIRE),
                    .dfi_wrdata_cs_0_n_p2(DFI_WRDATA_CS_0_N_P2_WIRE),
                    .dfi_wrdata_cs_0_n_p3(DFI_WRDATA_CS_0_N_P3_WIRE),
                    .dfi_wrdata_cs_1_n_p0(DFI_WRDATA_CS_1_N_P0_WIRE),
                    .dfi_wrdata_cs_1_n_p1(DFI_WRDATA_CS_1_N_P1_WIRE),
                    .dfi_wrdata_cs_1_n_p2(DFI_WRDATA_CS_1_N_P2_WIRE),
                    .dfi_wrdata_cs_1_n_p3(DFI_WRDATA_CS_1_N_P3_WIRE),
                    .dfi_rddata_cs_0_n(),
                    .dfi_rddata_cs_1_n(),
                    .apb_ctrl_chip_sel('b0),
                    .apb_iog_on('b0),
                    .odt_dyn_lane(ODT_DYN_LANE),
                    .dfi_rddata_en_p3(DFI_RDDATA_EN_P3),
                    .iog_rddata_en_p0_p(iog_rddata_en_p0_p),
                    .select_rank_1_gt('b0),
                    .select_rank_1(),
                    .dfi_init_complete(1),
                    // AS: added new signals for write callibration
                    // Note: final register for all write datapath signals is 
                    // outside of the PHY_SIG_MOD block, for code clarity
                    .iog_dq_txdata_in(IOG_DQ_TXDATA_IN_WIRE),
                    .iog_dq_txdata_out(IOG_DQ_TXDATA_OUT_int),
                    .iog_dm_txdata_in(IOG_DM_TXDATA_IN_WIRE),
                    .iog_dm_txdata_out(IOG_DM_TXDATA_OUT_int),
                    .write_callibration_offset({(IOG_DQS_LANES){write_cal_offset}})
          
          
                    );


    always @(posedge SCLK)
    begin

        DFI_RDDATA_W0 <= IOG_RDDATA_WIRE[IOG_DQS_LANES*16-1:0];
        DFI_RDDATA_W1 <= IOG_RDDATA_WIRE[IOG_DQS_LANES*32-1:IOG_DQS_LANES*16];
        DFI_RDDATA_W2 <= IOG_RDDATA_WIRE[IOG_DQS_LANES*48-1:IOG_DQS_LANES*32];
        DFI_RDDATA_W3 <= IOG_RDDATA_WIRE[IOG_DQS_LANES*64-1:IOG_DQS_LANES*48];

        DFI_RDDATA_VALID_W0 <= (read_gate_en)? DFI_RDDATA_EN_P0_WIRE: &IOG_RDDATA_VALID_WIRE;
        DFI_RDDATA_VALID_W1 <= (read_gate_en)? DFI_RDDATA_EN_P0_WIRE: &IOG_RDDATA_VALID_WIRE;
        DFI_RDDATA_VALID_W2 <= (read_gate_en)? DFI_RDDATA_EN_P0_WIRE: &IOG_RDDATA_VALID_WIRE;
        DFI_RDDATA_VALID_W3 <= (read_gate_en)? DFI_RDDATA_EN_P0_WIRE: &IOG_RDDATA_VALID_WIRE;
        
        IOG_DQ_TXDATA_OUT <= IOG_DQ_TXDATA_OUT_int;
        IOG_DM_TXDATA_OUT <= IOG_DM_TXDATA_OUT_int;

        IOG_OE_P0 <= IOG_OE_P0_int;
        IOG_OE_P1 <= IOG_OE_P1_int;
        IOG_OE_P2 <= IOG_OE_P2_int;
        IOG_OE_P3 <= IOG_OE_P3_int;
        DQS_OE_P0 <= DQS_OE_P0_int;
        DQS_OE_P1 <= DQS_OE_P1_int;
        DQS_OE_P2 <= DQS_OE_P2_int;
        DQS_OE_P3 <= DQS_OE_P3_int;
        DM_OE_P0 <= DM_OE_P0_int;
        DM_OE_P1 <= DM_OE_P1_int;
        DM_OE_P2 <= DM_OE_P2_int;
        DM_OE_P3 <= DM_OE_P3_int;
    end


    assign CAL_INIT_MR_W_REQ = 'h0;
    assign CAL_INIT_MR_ADDR = 'h0;
    assign CAL_INIT_MR_WR_DATA = 'h0;
    assign CAL_INIT_MR_WR_MASK = 'h0;
    assign CAL_INIT_CS = 'h0;

    
    assign IOG_ADDRESS_P0 = DFI_ADDRESS_P0_WIRE;
    assign IOG_ADDRESS_P1 = DFI_ADDRESS_P1_WIRE;
    assign IOG_ADDRESS_P2 = DFI_ADDRESS_P2_WIRE;
    assign IOG_ADDRESS_P3 = DFI_ADDRESS_P3_WIRE;

    
    assign CLK_SEL = {
        3'b010,
        3'b010,
        3'b010,
        3'b010,
        3'b010,
        3'b010,
        3'b010,
        3'b010,
        3'b010 };

    reg init_complete;
    reg training_complete;

    assign DFI_INIT_COMPLETE     = init_complete;
    assign DFI_TRAINING_COMPLETE = training_complete;


    /* [O] Update the logic to be synthesizable */

    reg [31:0] cnt;
    reg [7:0] state, next_state;

    localparam IDLE = 0;
    localparam CLK_ROTATE_SEL = 1;
    localparam CLK_ROTATE_WAIT = 2;
    localparam CLK_ROTATE = 3;
    localparam CLK_ROTATE_WAIT_2 = 4;
    localparam CMD_RESET = 5;
    localparam WAIT_HOLD_INIT_COMPLETE = 6;
    localparam PHY_INIT_COMPLETE = 7;
    localparam WAIT_CTRL_READY = 8;
    localparam WRITE_MOVE_START = 9;
    localparam WRITE_MOVE = 10;
    localparam WRITE_MOVE_PULSE = 11;
    localparam READ_GATE_START = 12;
    localparam READ_GATE_READ_REQ = 13;
    localparam READ_GATE_WAIT_DFI_RDDATA_EN_P0 = 14;
    localparam READ_GATE_WAIT_GOOD_BURST = 15;
    localparam READ_GATE_NEXT_PHASE = 16;
    localparam WRITE_CAL_START = 17;
    localparam WRITE_CAL_W_REQ = 18;
    localparam WRITE_CAL_D_REQ = 19;
    localparam WRITE_CAL_WAIT_BUSY = 20;
    localparam WRITE_CAL_READ_REQ = 21;
    localparam WRITE_CAL_WAIT_VAL = 22;
    localparam WRITE_CAL_CHECK_DATA = 23;
    localparam WRITE_CAL_INCR = 24;
    localparam DONE = 25;
    localparam END = 26;


    localparam WRITE_CALLIBRATION_PATTERN = 64'h6644_99FF_AACC_3355;

    wire [7:0] pattern7, pattern6, pattern5, pattern4, pattern3, pattern2, pattern1, pattern0;
    assign pattern7 = ( WRITE_CALLIBRATION_PATTERN & 64'hFF00_0000_0000_0000 ) >> 56;
    assign pattern6 = ( WRITE_CALLIBRATION_PATTERN & 64'h00FF_0000_0000_0000 ) >> 48;
    assign pattern5 = ( WRITE_CALLIBRATION_PATTERN & 64'h0000_FF00_0000_0000 ) >> 40;
    assign pattern4 = ( WRITE_CALLIBRATION_PATTERN & 64'h0000_00FF_0000_0000 ) >> 32;
    assign pattern3 = ( WRITE_CALLIBRATION_PATTERN & 64'h0000_0000_FF00_0000 ) >> 24;
    assign pattern2 = ( WRITE_CALLIBRATION_PATTERN & 64'h0000_0000_00FF_0000 ) >> 16;
    assign pattern1 = ( WRITE_CALLIBRATION_PATTERN & 64'h0000_0000_0000_FF00 ) >> 08;
    assign pattern0 = ( WRITE_CALLIBRATION_PATTERN & 64'h0000_0000_0000_00FF )      ;




    reg gate_good_burst;
    reg BURST_DETECT_reg;
    reg BURST_DETECT_reg_1;
    reg BURST_DETECT_reg_2;
    reg write_cal_match;
    wire [IOG_DQS_LANES*64-1:0] pattern = {{(IOG_DQS_LANES){pattern7}},
                   {(IOG_DQS_LANES){pattern6}},
                   {(IOG_DQS_LANES){pattern5}},
                   {(IOG_DQS_LANES){pattern4}},
                   {(IOG_DQS_LANES){pattern3}},
                   {(IOG_DQS_LANES){pattern2}},
                   {(IOG_DQS_LANES){pattern1}},
                   {(IOG_DQS_LANES){pattern0}}};


    always @(posedge SCLK or negedge INIT_RESET_int)
    begin
        if ( INIT_RESET_int == 1'b0 ) begin
            gate_good_burst <= 0;
            BURST_DETECT_reg <= 0;
            BURST_DETECT_reg_1 <= 0;
            BURST_DETECT_reg_2 <= 0;
        end else begin
            gate_good_burst = (BURST_DETECT_reg == 1'b0) && (BURST_DETECT_reg_1==1'b1) && (BURST_DETECT_reg_2==1'b0);
            BURST_DETECT_reg <= BURST_DETECT_WIRE[0];
            BURST_DETECT_reg_1 <= BURST_DETECT_reg;
            BURST_DETECT_reg_2 <= BURST_DETECT_reg_1;
            write_cal_match <= (CAL_L_DATAOUT == pattern);
        end
    end


    always @(posedge SCLK or negedge INIT_RESET_int)
    begin
        if ( INIT_RESET_int == 1'b0 )
            state <= IDLE;
        else
            state <= next_state;
    end



    always @(*)
    begin
        case ( state )
            IDLE: 
                next_state <= CLK_ROTATE_SEL;

            CLK_ROTATE_SEL:
                next_state <= CLK_ROTATE_WAIT;

            CLK_ROTATE_WAIT:
                next_state <= CLK_ROTATE;

            CLK_ROTATE:
                next_state <= CLK_ROTATE_WAIT_2;

            CLK_ROTATE_WAIT_2:
                if( cnt ==  7 ) begin
                   next_state <= CMD_RESET;
                end else begin
                   next_state <= CLK_ROTATE_SEL;
                end

            CMD_RESET:
                next_state <= WAIT_HOLD_INIT_COMPLETE;

            WAIT_HOLD_INIT_COMPLETE:
                if( hold_init_complete )
                    next_state <= WAIT_HOLD_INIT_COMPLETE;
                else
                    next_state <= PHY_INIT_COMPLETE;

            PHY_INIT_COMPLETE:
                    next_state <= WAIT_CTRL_READY;

            WAIT_CTRL_READY:
                if( CTRLR_READY_IN == 1'b1 )
                    next_state <= WRITE_MOVE_START;
                else begin
                    next_state <= WAIT_CTRL_READY;
                end

            WRITE_MOVE_START:
                next_state <= WRITE_MOVE;

            WRITE_MOVE:
                if( cnt == nbmv )
                    next_state <= READ_GATE_START;
                else
                    next_state <= WRITE_MOVE_PULSE;
            
            WRITE_MOVE_PULSE:
                next_state <= WRITE_MOVE;

            READ_GATE_START:
                next_state <= READ_GATE_READ_REQ;

            READ_GATE_READ_REQ:
                next_state <= READ_GATE_WAIT_DFI_RDDATA_EN_P0;

            READ_GATE_WAIT_DFI_RDDATA_EN_P0:
                if( DFI_RDDATA_EN_P0_WIRE == 1'b1 )
                    next_state <= READ_GATE_WAIT_GOOD_BURST;
                else begin
                    next_state <= READ_GATE_WAIT_DFI_RDDATA_EN_P0;
                end

            READ_GATE_WAIT_GOOD_BURST:
                if( gate_good_burst == 1'b1 )
                    next_state <= WRITE_CAL_START;
                else if( cnt == 64 )
                    next_state <= READ_GATE_NEXT_PHASE;
                else begin
                    next_state <= READ_GATE_WAIT_GOOD_BURST;
                end

            READ_GATE_NEXT_PHASE:
                next_state <= READ_GATE_READ_REQ;

            WRITE_CAL_START:
                next_state <= WRITE_CAL_W_REQ;

            WRITE_CAL_W_REQ:
                next_state <= WRITE_CAL_D_REQ;

            WRITE_CAL_D_REQ:
                if( CAL_L_D_REQ )
                    next_state <= WRITE_CAL_WAIT_BUSY;
                else begin
                    next_state <= WRITE_CAL_D_REQ;
                end

            WRITE_CAL_WAIT_BUSY:
                if( CAL_L_BUSY )
                    next_state <= WRITE_CAL_WAIT_BUSY;
                else begin
                    next_state <= WRITE_CAL_READ_REQ;
                end

            WRITE_CAL_READ_REQ:
                next_state <= WRITE_CAL_WAIT_VAL;

            WRITE_CAL_WAIT_VAL:
                if( CAL_L_R_VALID )
                    next_state <= WRITE_CAL_CHECK_DATA;
                else begin
                    next_state <= WRITE_CAL_WAIT_VAL;
                end

            WRITE_CAL_CHECK_DATA:
                if( write_cal_match )
                    next_state <= DONE;
                else begin
                    next_state <= WRITE_CAL_INCR;
                end

            WRITE_CAL_INCR:
                next_state <= WRITE_CAL_W_REQ;

            DONE:
                next_state <= END;

            END:
                next_state <= END;
            
            default:
                next_state <= IDLE;
        endcase
    end

    reg regLOADPHS_B;            
    reg regVCO_PHSEL_BCLK_SEL;   
    reg regVCO_PHSEL_BCLK90_SEL; 
    reg regVCO_PHSEL_REFCLK_SEL; 
    reg regVCO_PHSEL_ROTATE;     

    assign LOADPHS_B            = regLOADPHS_B;            
    assign VCO_PHSEL_BCLK_SEL   = regVCO_PHSEL_BCLK_SEL;   
    assign VCO_PHSEL_BCLK90_SEL = regVCO_PHSEL_BCLK90_SEL; 
    assign VCO_PHSEL_REFCLK_SEL = regVCO_PHSEL_REFCLK_SEL; 
    assign VCO_PHSEL_ROTATE     = regVCO_PHSEL_ROTATE;     

    always @(posedge SCLK or negedge INIT_RESET_int)
    begin
        if ( INIT_RESET_int == 1'b0 ) begin
            init_complete <= 1'b0;
            training_complete <= 1'b0;
            cnt <= 9'b0;
            regLOADPHS_B                      <= 1'b0;
            regVCO_PHSEL_BCLK_SEL             <= 1'b0;
            regVCO_PHSEL_BCLK90_SEL           <= 1'b0;
            regVCO_PHSEL_REFCLK_SEL           <= 1'b0;
            regVCO_PHSEL_ROTATE               <= 1'b0;
            MOVE                            <= 'b0;
            DIRECTION                       <= {(IOG_DQS_LANES*9){1'b1}};
            LOAD                            <= 'h0;
            DELAY_LINE_SEL_RD               <= {(IOG_DQS_LANES){1'b1}};
            INIT_PAUSE <= 9'b000000000;
            CMD_RESET_LANE <= 1'b0;
            CTRLR_READY_OUT <= 1'b0;
            CAL_L_R_REQ <= 1'b0;
            CAL_L_DATAIN <= 'b0;
            CAL_L_W_REQ <= 1'b0;
            CAL_L_DM_IN <= 'b0;
            CAL_SELECT <= 1'b0;
            write_cal_offset <= 'b0;
            read_gate_phase_sel <= 'h7;
            read_gate_en <= 1'b0;

            //CTRLR_READY_OUT <= 1'b0;
        end else begin
            case( state ) 
                IDLE: begin
                    cnt <= 9'b0;
                    regLOADPHS_B <= 1'b1;
                end

                CLK_ROTATE_SEL: begin
                    regLOADPHS_B <= 1'b0;

                    if ( cnt <= ADDR_VCOPHS_OFFSET  + 9'd1  ) // ck 180 of bclk
                        regVCO_PHSEL_REFCLK_SEL <= 1'b1;
                    else
                        regVCO_PHSEL_REFCLK_SEL <= 1'b0;
                    
                    regVCO_PHSEL_ROTATE <= 1'b0;

                    if ( cnt <= 9'd3 ) // bclk90 90 of bclk
                        regVCO_PHSEL_BCLK90_SEL <= 1'b1;
                    else
                        regVCO_PHSEL_BCLK90_SEL <= 1'b0;

                    if( cnt <= 9'd1 ) // bclk 90 of sclk
                        regVCO_PHSEL_BCLK_SEL <= 1'b1;
                    else
                        regVCO_PHSEL_BCLK_SEL <= 1'b0;

                    if( cnt <= 9'd1 )
                        MOVE <= {(IOG_DQS_LANES){9'h100}};
                end

                //CLK_ROTATE_WAIT:

                CLK_ROTATE: begin
                    regVCO_PHSEL_ROTATE <= 1'b1;
                    cnt <= cnt + 1;
                    MOVE <= 'b0;
                end

                //CLK_ROTATE_WAIT_2:
                    

                CMD_RESET:
                    CMD_RESET_LANE <= 1'b1;

                WAIT_HOLD_INIT_COMPLETE:
                    CMD_RESET_LANE <= 1'b0; 

                PHY_INIT_COMPLETE: begin
                    init_complete <= 1'b1;
                end

                WAIT_CTRL_READY:
                    if( CTRLR_READY_IN == 1'b1 )
                        next_state <= WRITE_MOVE_START;
                    else begin
                        next_state <= WAIT_CTRL_READY;
                    end

                WRITE_MOVE_START: begin
                    DELAY_LINE_SEL_RD  <= {(IOG_DQS_LANES){1'b0}};
                    cnt <= 'b0;
                end

                WRITE_MOVE:
                     MOVE <= {(IOG_DQS_LANES){9'h000}};
                
                WRITE_MOVE_PULSE: begin
                     MOVE <= {(IOG_DQS_LANES){9'h100}};
                     cnt <= cnt + 1;
                end

                READ_GATE_START: begin
                    read_gate_en <= 1'b1;
                    INIT_PAUSE <= 9'b111111111;
                    CAL_SELECT <= 1'b1;
                end

                READ_GATE_READ_REQ:  begin
                    CAL_L_R_REQ <= 1'b1;
                    INIT_PAUSE <= 9'b000000000;
                    cnt <= 'b0;
                end 

                READ_GATE_WAIT_DFI_RDDATA_EN_P0: begin
                    CAL_L_R_REQ <= 1'b0;
                end
                
                READ_GATE_WAIT_GOOD_BURST: begin
                    cnt <= cnt + 1;
                    CAL_L_R_REQ <= 1'b0;
                end

                READ_GATE_NEXT_PHASE: begin
                    read_gate_phase_sel <= read_gate_phase_sel - 1; // start away and decrement to avoid latching DDR4 preamble
                    INIT_PAUSE <= 9'b111111111;
                end

                WRITE_CAL_START:
                    read_gate_en <= 1'b0;

                WRITE_CAL_W_REQ:
                    CAL_L_W_REQ <= 1'b1;

                WRITE_CAL_D_REQ: begin
                    CAL_L_W_REQ <= 1'b0;
                    CAL_L_DATAIN <= pattern;
                end

                //WRITE_CAL_WAIT_BUSY:

                WRITE_CAL_READ_REQ:
                    CAL_L_R_REQ <= 1'b1;

                WRITE_CAL_WAIT_VAL:
                    CAL_L_R_REQ <= 1'b0;

               // WRITE_CAL_CHECK_DATA:

                WRITE_CAL_INCR:
                    write_cal_offset <= write_cal_offset + 1 ;

                DONE: begin
                    training_complete <= 1'b1;
                    CTRLR_READY_OUT <= 1'b1;
                    CAL_SELECT <= 1'b0;
                end

               // END:
               

            endcase   
        end
    end

endmodule
