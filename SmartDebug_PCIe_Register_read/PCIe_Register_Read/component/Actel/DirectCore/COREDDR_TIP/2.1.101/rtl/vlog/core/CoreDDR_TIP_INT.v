
/// Header_Start --->>>
//--------------------------------------------------
//-- -----------------------------------------------------------------------------                                                                                                                                                
//--    Crevinn Teoranta                                                                                                                                         
//-- -----------------------------------------------------------------------------                                                                                                                                                
//-- Author      : $Author:      gianl                                                                                                       
//-- Date        : $Date: 2010-04-29 14:34:52 $                                                                                                                                                
//-- Revision    : $Revision: 1.11 $                                                                                                                                                
//-- Location    : $URL: $                                                                                                                                                
//-- -----------------------------------------------------------------------------                                                                                                                                                
//--------------------------------------------------
// AS: changed top-level module name
//     removed vco_phsinit signals
// - 3/22/18, registered all IOD control outputs
// - 6/13, added optional pipeline stage and DFI control ports


/// Header_End <<<---


/// I/O_Start --->>>


module COREDDR_TIP_INT( SCLK,
                     RESET_N,
                     DFI_INIT_COMPLETE,
                     DFI_INIT_START,                                 
                     DFI_RDLVL_CS_0_N,
                     DFI_RDLVL_CS_1_N,
                     DFI_WRLVL_CS_0_N,
                     DFI_WRLVL_CS_1_N,
                     DFI_RDDATA_CS_0_N_P0,
                     DFI_RDDATA_CS_0_N_P1,
                     DFI_RDDATA_CS_0_N_P2,
                     DFI_RDDATA_CS_0_N_P3,
                     DFI_RDDATA_CS_1_N_P0,
                     DFI_RDDATA_CS_1_N_P1,
                     DFI_RDDATA_CS_1_N_P2,
                     DFI_RDDATA_CS_1_N_P3,
                     DFI_WRDATA_CS_0_N_P0,
                     DFI_WRDATA_CS_0_N_P1,
                     DFI_WRDATA_CS_0_N_P2,
                     DFI_WRDATA_CS_0_N_P3,
                     DFI_WRDATA_CS_1_N_P0,
                     DFI_WRDATA_CS_1_N_P1,
                     DFI_WRDATA_CS_1_N_P2,
                     DFI_WRDATA_CS_1_N_P3,
                     DFI_RDLVL_EN,
                     DFI_RDLVL_GATE_EN,
                     DFI_RDLVL_RESP,
                     DFI_TRAINING_COMPLETE,
                     DFI_WRDATA_EN_P0,
                     DFI_WRDATA_EN_P1,
                     DFI_WRDATA_EN_P2,
                     DFI_WRDATA_EN_P3,
                     DFI_WRLVL_EN,
                     DFI_WRLVL_RESP,
                     DFI_WRLVL_STROBE,
                     BCLK_EYE_MONITOR_CLR_FLAGS,
                     BCLK_EYE_MONITOR_EARLY,
                     BCLK_EYE_MONITOR_LATE,
                     BURST_DETECT,
                     CLK_SEL,                                         // registered, 3/22
                     DELAY_LINE_SEL_RD,                               // regsitered, 3/22
                     DIRECTION,                                       // registered, 3/22
                     IOG_OE_P0,
                     IOG_OE_P1,
                     IOG_OE_P2,
                     IOG_OE_P3,
                     DQS_OE_P0,
                     DQS_OE_P1,
                     DQS_OE_P2,
                     DQS_OE_P3,
                     DM_OE_P0,
                     DM_OE_P1,
                     DM_OE_P2,
                     DM_OE_P3,
                     LOAD,                                            // registered, 3/22
                     MOVE,                                            // registered, 3/22
                     REFCLK_EYE_MONITOR_CLR_FLAGS,
                     REFCLK_EYE_MONITOR_EARLY,
                     REFCLK_EYE_MONITOR_LATE,
                     RX_OUT_OF_RANGE,
                     TWO_RANKS,
                     TX_OUT_OF_RANGE,
                     PADDR,
                     PENABLE,
                     PRDATA,
                     PREADY,
                     PSEL,
                     PWDATA,
                     PWRITE,
                     ODT_DYN_LANE,
                     TRAINING_PATTERN,
                     CODE_UPDATE,
                     DLL_DLY_DIFF,
                     LOADPHS_B,                                       // registered, 3/22
                     VCO_PHSEL_BCLK_SEL,                              // registered, 3/22
                     VCO_PHSEL_REFCLK_SEL,                            // registered, 3/22
                     VCO_PHSEL_ROTATE,                                // registered, 3/22
                     VREF_DIRECTION,                                  // registered, 3/22
                     VREF_MOVE,                                       // registered, 3/22
                     VREF_OUT_OF_RANGE,                               // registered, 3/22
                     VREF_RELOAD,                                     // registered, 3/22
                     DFI_CTRLUPD_REQ,
                     DFI_RDDATA_EN_P0,
                     DFI_RDDATA_EN_P1,
                     DFI_RDDATA_EN_P2,
                     DFI_RDDATA_EN_P3,
                     IOG_RDDATA,
                     IOG_RDDATA_VALID,
                     // AS: DFI_RDATA INTO PHASED SIGNALS
                     DFI_RDDATA_W0,
                     DFI_RDDATA_W1,
                     DFI_RDDATA_W2,
                     DFI_RDDATA_W3,
                     // AS: PHASED SIGNALS INSTEAD OF SINGLE ONE, NOW
                     DFI_RDDATA_VALID_W0,
                     DFI_RDDATA_VALID_W1,
                     DFI_RDDATA_VALID_W2,
                     DFI_RDDATA_VALID_W3,
                     PAD_RDDATA,
                     IOG_RDDATA_EN_P0_P,
                     IOG_RDDATA_EN_P0_N,
                     IOG_RDDATA_EN_P1_P,
                     IOG_RDDATA_EN_P1_N,
                     IOG_RDDATA_EN_P2_P,
                     IOG_RDDATA_EN_P2_N,
                     IOG_RDDATA_EN_P3_P,
                     IOG_RDDATA_EN_P3_N,
                     RD_TRAINING_ERROR,
                     // AS: ADDED THESE SIGNALS FOR ADDITIONAL TRAINING STEPS
                     // DQSW/DQSW270 TRAINING
                     DQSW_EYE_MONITOR_CLR_FLAGS,
                     DQSW_EYE_MONITOR_EARLY,
                     DQSW_EYE_MONITOR_LATE,
                     DQSW270_EYE_MONITOR_CLR_FLAGS,
                     DQSW270_EYE_MONITOR_EARLY,
                     DQSW270_EYE_MONITOR_LATE,
                     // AS: REMOVED VCO_PHSINIT SIGNALS, AS THESE ARE PC BITS
                     DQSW_DELAY_LINE_LOAD,                            // registered, 3/22
                     DQSW_DELAY_LINE_MOVE,                            // registered, 3/22
                     DQSW_DELAY_LINE_DIRECTION,                       // registered, 3/22
                     DQSW270_DELAY_LINE_LOAD,                         // registered, 3/22
                     DQSW270_DELAY_LINE_MOVE,                         // registered, 3/22
                     DQSW270_DELAY_LINE_DIRECTION,                    // registered, 3/22
                     // REFCLK TRAINING
                     REFCLK_DELAY_LINE_LOAD,                          // registered, 3/22
                     REFCLK_DELAY_LINE_MOVE,                          // registered, 3/22
                     REFCLK_DELAY_LINE_DIRECTION,                     // registered, 3/22
                     CMD_EYE_MONITOR_CLR_FLAGS,
                     CMD_EYE_MONITOR_EARLY,
                     CMD_EYE_MONITOR_LATE,
                     CMD_DELAY_LINE_LOAD,                             // registered, 3/22
                     CMD_DELAY_LINE_MOVE,                             // registered, 3/22
                     CMD_DELAY_LINE_DIRECTION,                        // registered, 3/22
                     // AS: ADDED WL_PAUSE
                     VCO_PHSEL_BCLK90_SEL,                            // registered, 3/22
                     // AS: ADDED DQSW CONTROL, CMD_OE
                     DQSW_SELA,                                       // registered, 3/22
                     CMD_OE,
                     CMD_DELAY_LINE_MOVE_TRN,                         // registered, 3/22
                     REFCLK_IGEAR_RX8,
                     DQSW270_IGEAR_RX8,
                     // AS: ADDED THESE CONTROLS
                     DQSW_DELAY_LINE_OOR,
                     DQSW270_DELAY_LINE_OOR,
                     // AS: REPLACED WL_PAUSE AND GT_PAUSE WITH SINGLE
                     // INIT_PAUSE, ADDED INIT_RESET
                     INIT_PAUSE,                                      // registered, 3/22
                     INIT_RESET,
                     PLL_LOCK,
                     // AS: ADDED THESE INPUT/OUTPUT PAIRS TO MUX
                     // BETWEEN TRAINING AND NORMAL OPERATION MODES
                     // INTERNALLY INSTEAD OF IN THE WRAPPER
                     DFI_WRDATA_MASK_P0,
                     DFI_WRDATA_MASK_P1,
                     DFI_WRDATA_MASK_P2,
                     DFI_WRDATA_MASK_P3,
                     // DFI_ADDRESS_P0,
                     // DFI_ADDRESS_P1,
                     // DFI_ADDRESS_P2,
                     // DFI_ADDRESS_P3,
                     IOG_WRDATA_MASK_P0,
                     IOG_WRDATA_MASK_P1,
                     IOG_WRDATA_MASK_P2,
                     IOG_WRDATA_MASK_P3,
                     IOG_ADDRESS_P0,
                     IOG_ADDRESS_P1,
                     IOG_ADDRESS_P2,
                     IOG_ADDRESS_P3,
                     // AS: ADDED NEW PORTS FOR SAR http://bugzilla/show_bug.cgi?id=85957
                     // IN ORDER TO OBVIATE THE USE OF EYE MONITOR FLAGS
                     // EYE MONITOR FLAGS REMAIN FOR LEGACY PURPOSES / IN CASE
                     // SILICON FIX COMES IN FOR REV D
                     BCLK_IGEAR_RX,
                     CMD_IGEAR_RX8,
                     DQSW270_IGEAR_RX,
                     DQSW_IGEAR_RX,
                     CMD_RESET_LANE,
                     // AS: ADDED SKIP_* SIGNALS
                     SKIP_DQSW_TRN,
                     SKIP_BCLK_TRN,
                     SKIP_CA_TRN,
                     SKIP_WRLVL_TRN,
                     SKIP_RDLVL_TRN,
                     BCLK_VCOPHS_OFFSET,
                     ADDR_VCOPHS_OFFSET,
                     WRLVL_TAP_OFFSET,
                     // AS: Added VREF training signals
                     CAL_INIT_MR_W_REQ,
                     CAL_INIT_MR_ADDR,
                     CAL_INIT_MR_WR_DATA,
                     CAL_INIT_MR_WR_MASK,
                     CAL_INIT_ACK,
                     SKIP_VREF_TRAINING,
                     PCLK,
                     VREF_MR6_VALUE,
                     CAL_INIT_CS,
                     CTRLR_READY_IN,
                     CTRLR_READY_OUT,
                     IOG_DQ_TXDATA_IN,
                     IOG_DQ_TXDATA_OUT,
                     IOG_DM_TXDATA_IN,
                     IOG_DM_TXDATA_OUT,
                     CAL_L_R_REQ,  
                     CAL_L_W_REQ,  
                     CAL_L_DATAIN, 
                     CAL_L_DM_IN,  
                     CAL_L_BUSY,   
                     CAL_L_D_REQ,  
                     CAL_L_DATAOUT,
                     CAL_L_R_VALID,
                     CAL_SELECT,
                     ADDR_WAIT_COUNT,
                     WRCAL_WRITE_COUNTER_VALUE,
                     RDGATE_MIN_READS_THRESHOLD,
                     ITER_COUNT,
                     // --------------------------------------------
                     // AS: 6/18 additional ports for pipelining
                     //     (removed already existing ports)
                     // --------------------------------------------
                     DFI_RESET_N_P0            ,
                     DFI_RESET_N_P1            ,
                     DFI_RESET_N_P2            ,
                     DFI_RESET_N_P3            ,
                     DFI_ADDRESS_P0            ,
                     DFI_ADDRESS_P1            ,
                     DFI_ADDRESS_P2            ,
                     DFI_ADDRESS_P3            ,
                     DFI_BANK_P0               ,
                     DFI_BANK_P1               ,
                     DFI_BANK_P2               ,
                     DFI_BANK_P3               ,
                     DFI_CS_N_P0               ,
                     DFI_CS_N_P1               ,
                     DFI_CS_N_P2               ,
                     DFI_CS_N_P3               ,
                     DFI_ODT_P0                ,
                     DFI_ODT_P1                ,
                     DFI_ODT_P2                ,
                     DFI_ODT_P3                ,
                     DFI_CKE_P0                ,
                     DFI_CKE_P1                ,
                     DFI_CKE_P2                ,
                     DFI_CKE_P3                ,
                     DFI_RAS_N_P0              ,
                     DFI_RAS_N_P1              ,
                     DFI_RAS_N_P2              ,
                     DFI_RAS_N_P3              ,
                     DFI_CAS_N_P0              ,
                     DFI_CAS_N_P1              ,
                     DFI_CAS_N_P2              ,
                     DFI_CAS_N_P3              ,
                     DFI_WE_N_P0               ,
                     DFI_WE_N_P1               ,
                     DFI_WE_N_P2               ,
                     DFI_WE_N_P3               ,
                     DFI_ACT_N_P0              ,
                     DFI_ACT_N_P1              ,
                     DFI_ACT_N_P2              ,
                     DFI_ACT_N_P3              ,
                     DFI_RESET_N_P0_OUT        ,
                     DFI_RESET_N_P1_OUT        ,
                     DFI_RESET_N_P2_OUT        ,
                     DFI_RESET_N_P3_OUT        ,
                     DFI_BANK_P0_OUT           ,
                     DFI_BANK_P1_OUT           ,
                     DFI_BANK_P2_OUT           ,
                     DFI_BANK_P3_OUT           ,
                     DFI_CS_N_P0_OUT           ,
                     DFI_CS_N_P1_OUT           ,
                     DFI_CS_N_P2_OUT           ,
                     DFI_CS_N_P3_OUT           ,
                     DFI_ODT_P0_OUT            ,
                     DFI_ODT_P1_OUT            ,
                     DFI_ODT_P2_OUT            ,
                     DFI_ODT_P3_OUT            ,
                     DFI_CKE_P0_OUT            ,
                     DFI_CKE_P1_OUT            ,
                     DFI_CKE_P2_OUT            ,
                     DFI_CKE_P3_OUT            ,
                     DFI_RAS_N_P0_OUT          ,
                     DFI_RAS_N_P1_OUT          ,
                     DFI_RAS_N_P2_OUT          ,
                     DFI_RAS_N_P3_OUT          ,
                     DFI_CAS_N_P0_OUT          ,
                     DFI_CAS_N_P1_OUT          ,
                     DFI_CAS_N_P2_OUT          ,
                     DFI_CAS_N_P3_OUT          ,
                     DFI_WE_N_P0_OUT           ,
                     DFI_WE_N_P1_OUT           ,
                     DFI_WE_N_P2_OUT           ,
                     DFI_WE_N_P3_OUT           ,
                     DFI_ACT_N_P0_OUT          ,
                     DFI_ACT_N_P1_OUT          ,
                     DFI_ACT_N_P2_OUT          ,
                     DFI_ACT_N_P3_OUT          ,
                     DFI_BG_P0_OUT             ,
                     DFI_BG_P1_OUT             ,
                     DFI_BG_P2_OUT             ,
                     DFI_BG_P3_OUT             ,
                     DFI_BG_P0                 ,
                     DFI_BG_P1                 ,
                     DFI_BG_P2                 ,
                     DFI_BG_P3
                     );

                     
parameter FAMILY = 26;
parameter IOG_DQS_LANES = 2;
parameter FIFO_DEPTH = 2;
parameter FIFO_ADDRESS_WIDTH = 7;
parameter NUM_BCLKS = 1;
parameter [3:0] IOG_DQ_WIDTH_L0 = 8;
parameter [3:0] IOG_DQ_WIDTH_L1 = 8;
parameter [3:0] IOG_DQ_WIDTH_L2 = 8;
parameter [3:0] IOG_DQ_WIDTH_L3 = 8;
parameter [3:0] IOG_DQ_WIDTH_L4 = 8;
parameter [3:0] IOG_DQ_WIDTH_L5 = 8;
parameter [3:0] IOG_DQ_WIDTH_L6 = 8;
parameter [3:0] IOG_DQ_WIDTH_L7 = 8;
parameter [3:0] IOG_DQ_WIDTH_L8 = 8;
// AS: 3/27/18 added parameter to determine whether or not to add extra pipeline (for performance in XT)
//             + extra parameter to mux DFI_ADDRESS_PN between DDR3/4/LPDDR3/4 (DDR_TYPE)
parameter PIPELINE = 0;
// DDR_TYPE
// 0 = DDR4
// 1 = DDR4_3DS
// 2 = DDR3
// 3 = DDR3L
// 4 = LPDDR3
// 5 = LPDDR2

//port instead of parameter
//parameter [6:0] VREF_MR6_VALUE  = 0;

input          SCLK;
input          RESET_N;

// PORT: NWL
// NORTHWEST LOGIC CONTROLLER PORT

output         DFI_INIT_COMPLETE; // INITIALIZATION SIGNAL. ALSO USED DURING FREQUENCY CHANGE REQUESTS.
input          DFI_INIT_START; // INITIALIZATION SIGNAL. ALSO USED DURING FREQUENCY CHANGE REQUESTS.

input          DFI_RDLVL_CS_0_N; // READ LEVEL TRAINING CHIP SELECT
input          DFI_RDLVL_CS_1_N; // READ LEVEL TRAINING CHIP SELECT
input          DFI_WRLVL_CS_0_N; // WRITE LEVEL TRAINING CHIP SELECT
input          DFI_WRLVL_CS_1_N; // WRITE LEVEL TRAINING CHIP SELECT

input          DFI_RDDATA_CS_0_N_P0; // READ DATA DATA PATH CHIP SELECT
input          DFI_RDDATA_CS_0_N_P1; // READ DATA DATA PATH CHIP SELECT
input          DFI_RDDATA_CS_0_N_P2; // READ DATA DATA PATH CHIP SELECT
input          DFI_RDDATA_CS_0_N_P3; // READ DATA DATA PATH CHIP SELECT
input          DFI_RDDATA_CS_1_N_P0; // READ DATA DATA PATH CHIP SELECT
input          DFI_RDDATA_CS_1_N_P1; // READ DATA DATA PATH CHIP SELECT
input          DFI_RDDATA_CS_1_N_P2; // READ DATA DATA PATH CHIP SELECT
input          DFI_RDDATA_CS_1_N_P3; // READ DATA DATA PATH CHIP SELECT
input          DFI_WRDATA_CS_0_N_P0; // WRITE DATA DATA PATH CHIP SELECT
input          DFI_WRDATA_CS_0_N_P1; // WRITE DATA DATA PATH CHIP SELECT
input          DFI_WRDATA_CS_0_N_P2; // WRITE DATA DATA PATH CHIP SELECT
input          DFI_WRDATA_CS_0_N_P3; // WRITE DATA DATA PATH CHIP SELECT
input          DFI_WRDATA_CS_1_N_P0; // WRITE DATA DATA PATH CHIP SELECT
input          DFI_WRDATA_CS_1_N_P1; // WRITE DATA DATA PATH CHIP SELECT
input          DFI_WRDATA_CS_1_N_P2; // WRITE DATA DATA PATH CHIP SELECT
input          DFI_WRDATA_CS_1_N_P3; // WRITE DATA DATA PATH CHIP SELECT
input          DFI_RDLVL_EN;   // READ LEVEL ENABLE. SIGNAL USED FOR READ TRAINING. COMES FROM THE NWL CONTROLLER
input          DFI_RDLVL_GATE_EN; // READ LEVEL GATE ENABLE. SIGNAL USED FOR READ GATE TRAINING. COMES FROM THE NWL CONTROLLER
output [IOG_DQS_LANES-1:0] DFI_RDLVL_RESP;
output         DFI_TRAINING_COMPLETE; // SIGNIFIES READ TRAINING, WRITE LEVELLING, AND VREF TRAINING IS DONE.
wire           DFI_TRAINING_COMPLETE; // SIGNIFIES READ TRAINING, WRITE LEVELLING, AND VREF TRAINING IS DONE.
input          DFI_WRDATA_EN_P0;
input          DFI_WRDATA_EN_P1;
input          DFI_WRDATA_EN_P2;
input          DFI_WRDATA_EN_P3;
input          DFI_WRLVL_EN;   // WRITE LEVEL ENABLE. SIGNAL USED FOR WRITE LEVELLING. COMES FROM THE NWL CONTROLLER
output [IOG_DQS_LANES-1:0] DFI_WRLVL_RESP;
reg    [IOG_DQS_LANES-1:0] DFI_WRLVL_RESP;
input          DFI_WRLVL_STROBE; // STROBE SIGNAL USED FOR WRITE LEVELING. COMES FROM THE NWL CONTROLLER
output [IOG_DQS_LANES-1:0]  RD_TRAINING_ERROR;

// PORT: PHY
// PHY PORT

output [NUM_BCLKS-1:0]        BCLK_EYE_MONITOR_CLR_FLAGS; // TO BE USED BY A RENAMING MODULE TO ASSIGN THE TO THE LANEX_IOGY_IOG_EYE_MONITOR_CLR_FLAGS SIGNALS
input  [NUM_BCLKS-1:0]        BCLK_EYE_MONITOR_EARLY;
input  [NUM_BCLKS-1:0]        BCLK_EYE_MONITOR_LATE;
input [IOG_DQS_LANES-1:0] BURST_DETECT;
output [IOG_DQS_LANES*3-1:0] CLK_SEL;
reg    [IOG_DQS_LANES*3-1:0] CLK_SEL;                   // registered, 3/22
wire   [IOG_DQS_LANES*3-1:0] CLK_SEL_INTERNAL;          // registered, 3/22


output [IOG_DQS_LANES-1:0] DELAY_LINE_SEL_RD; 
reg    [IOG_DQS_LANES-1:0] DELAY_LINE_SEL_RD;           // registered, 3/22
wire   [IOG_DQS_LANES-1:0] DELAY_LINE_SEL_RD_INTERNAL;  // registered, 3/22

output [IOG_DQS_LANES*9-1:0] DIRECTION;
reg    [IOG_DQS_LANES*9-1:0] DIRECTION;                 // registered, 3/22
wire   [IOG_DQS_LANES*9-1:0] DIRECTION_INTERNAL;        // registered, 3/22

output [IOG_DQS_LANES-1:0] IOG_OE_P0;
output [IOG_DQS_LANES-1:0] IOG_OE_P1;
output [IOG_DQS_LANES-1:0] IOG_OE_P2;
output [IOG_DQS_LANES-1:0] IOG_OE_P3;
output [IOG_DQS_LANES-1:0] DQS_OE_P0;
output [IOG_DQS_LANES-1:0] DQS_OE_P1;
output [IOG_DQS_LANES-1:0] DQS_OE_P2;
output [IOG_DQS_LANES-1:0] DQS_OE_P3;
output [IOG_DQS_LANES-1:0] DM_OE_P0;
output [IOG_DQS_LANES-1:0] DM_OE_P1;
output [IOG_DQS_LANES-1:0] DM_OE_P2;
output [IOG_DQS_LANES-1:0] DM_OE_P3;

output [IOG_DQS_LANES*9-1:0] LOAD;
output [IOG_DQS_LANES*9-1:0] MOVE;
reg    [IOG_DQS_LANES*9-1:0] LOAD;                      // registered, 3/22
reg    [IOG_DQS_LANES*9-1:0] MOVE;                      // registered, 3/22
wire   [IOG_DQS_LANES*9-1:0] LOAD_INTERNAL;             // registered, 3/22
wire   [IOG_DQS_LANES*9-1:0] MOVE_INTERNAL;             // registered, 3/22

output         REFCLK_EYE_MONITOR_CLR_FLAGS;
input          REFCLK_EYE_MONITOR_EARLY; // TO BE USED BY A RENAMING MODULE TO ASSIGN THE TO THE LANEX_IOGY_IOG_EYE_MONITOR_EARLY SIGNALS
input          REFCLK_EYE_MONITOR_LATE; // TO BE USED BY A RENAMING MODULE TO ASSIGN THE TO THE LANEX_IOGY_IOG_EYE_MONITOR_LATE SIGNALS
input [IOG_DQS_LANES*9-1:0] RX_OUT_OF_RANGE;
input          TWO_RANKS;
input [IOG_DQS_LANES*9-1:0] TX_OUT_OF_RANGE;

// AS: MADE INTERNAL SIGNAL
// output  [IOG_DQS_LANES-1:0] GT_PAUSE;
wire [IOG_DQS_LANES-1:0] GT_PAUSE;
output  [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P0_P;
output  [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P0_N;
output  [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P1_P;
output  [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P1_N;
output  [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P2_P;
output  [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P2_N;
output  [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P3_P;
output  [IOG_DQS_LANES-1:0] IOG_RDDATA_EN_P3_N;

// GIAN EDIT, MERGING NEW BENCH WITH OLD 
// output  [IOG_DQS_LANES-1:0] TXDELAY_DIRECTION;
// output  [IOG_DQS_LANES-1:0] TXDELAY_LOAD;
// output  [IOG_DQS_LANES-1:0] TXDELAY_MOVE;
// input [IOG_DQS_LANES-1:0] TXDELAY_OOR;

// PORT: APB
// APB PORT

input [15:0]   PADDR;          // APB ADDRESS TO THE APB INTERFACE
input          PENABLE;        // APB ENABLE SIGNAL
output [7:0]   PRDATA;         // APB READ DATA SIGNAL FROM THE APB INTERFACE
output         PREADY;         // APB PREADY SIGNAL FROM THE APB INTERFACE
input          PSEL;           // APB SELECT SIGNAL
input [7:0]    PWDATA;         // APB WRITE DATA SIGNAL
input          PWRITE;         // APB WRITE SIGNAL
input          PCLK;           // APB clock (added for performance porpoises)

// PORT: CONFIG
// CONFIG PORT

output [IOG_DQS_LANES-1:0]    ODT_DYN_LANE;
input [7:0]    TRAINING_PATTERN;

// PORT: SYSTEM
// SYSTEM PORT

output         CODE_UPDATE;
input          DLL_DLY_DIFF;
output [NUM_BCLKS-1:0]        LOADPHS_B;
output [NUM_BCLKS-1:0]        VCO_PHSEL_BCLK_SEL;
output         VCO_PHSEL_REFCLK_SEL;
output [NUM_BCLKS-1:0]        VCO_PHSEL_ROTATE;
output         VREF_DIRECTION;
output         VREF_MOVE;

reg [NUM_BCLKS-1:0]        LOADPHS_B;             // registered, 3/22
reg [NUM_BCLKS-1:0]        VCO_PHSEL_BCLK_SEL;    // registered, 3/22
reg         VCO_PHSEL_REFCLK_SEL;                 // registered, 3/22
reg [NUM_BCLKS-1:0]        VCO_PHSEL_ROTATE;      // registered, 3/22
reg         VREF_DIRECTION;                       // registered, 3/22
reg         VREF_MOVE;                            // registered, 3/22

wire [NUM_BCLKS-1:0]        LOADPHS_B_INTERNAL;             // registered, 3/22
wire [NUM_BCLKS-1:0]        VCO_PHSEL_BCLK_SEL_INTERNAL;    // registered, 3/22
wire         VCO_PHSEL_REFCLK_SEL_INTERNAL;                 // registered, 3/22
wire [NUM_BCLKS-1:0]        VCO_PHSEL_ROTATE_INTERNAL;      // registered, 3/22
wire         VREF_DIRECTION_INTERNAL;                       // registered, 3/22
wire         VREF_MOVE_INTERNAL;                            // registered, 3/22


input          VREF_OUT_OF_RANGE;
output         VREF_RELOAD;

// PORT: NWL_PHY

input          DFI_CTRLUPD_REQ;
input          DFI_RDDATA_EN_P0;
input          DFI_RDDATA_EN_P1;
input          DFI_RDDATA_EN_P2;
input          DFI_RDDATA_EN_P3;
input [IOG_DQS_LANES*64-1:0] IOG_RDDATA;
input [IOG_DQS_LANES-1:0] IOG_RDDATA_VALID;

// AS: SPLIT THE DFI_RDDATA BUS UP INTO PHASES
// output [IOG_DQS_LANES_64-1:0] DFI_RDDATA;
// wire [IOG_DQS_LANES_64-1:0] DFI_RDDATA;

output [IOG_DQS_LANES*16-1:0]          DFI_RDDATA_W0;
output [IOG_DQS_LANES*16-1:0]          DFI_RDDATA_W1;
output [IOG_DQS_LANES*16-1:0]          DFI_RDDATA_W2;
output [IOG_DQS_LANES*16-1:0]          DFI_RDDATA_W3;
wire   [IOG_DQS_LANES*16-1:0]          DFI_RDDATA_W0;
wire   [IOG_DQS_LANES*16-1:0]          DFI_RDDATA_W1;
wire   [IOG_DQS_LANES*16-1:0]          DFI_RDDATA_W2;
wire   [IOG_DQS_LANES*16-1:0]          DFI_RDDATA_W3;

// AS: REPLACED WITH PHASED SIGNALS
// DFI_RDDATA_VALID_W0, _W1, _W2, _W3
// output           DFI_RDDATA_VALID;
output DFI_RDDATA_VALID_W0;
output DFI_RDDATA_VALID_W1;
output DFI_RDDATA_VALID_W2;
output DFI_RDDATA_VALID_W3;

// PORT: PAD

input [IOG_DQS_LANES*8-1:0]   PAD_RDDATA;

wire [IOG_DQS_LANES*64-1:0] DFI_RDDATA;
wire           DFI_RDDATA_VALID_INTERNAL;

wire SELECT_RANK_1;

// AS: ADDED FOR MORE IOG SIGNALS ADDITIONAL TRAINING STEPS
output [NUM_BCLKS-1:0]                   VCO_PHSEL_BCLK90_SEL;
reg    [NUM_BCLKS-1:0]                   VCO_PHSEL_BCLK90_SEL;            // registered, 3/22
wire   [NUM_BCLKS-1:0]                   VCO_PHSEL_BCLK90_SEL_INTERNAL;   // registered, 3/22
output [IOG_DQS_LANES-1:0]               DQSW_EYE_MONITOR_CLR_FLAGS;
input  [IOG_DQS_LANES-1:0]              DQSW_EYE_MONITOR_EARLY;
input  [IOG_DQS_LANES-1:0]              DQSW_EYE_MONITOR_LATE;
output [IOG_DQS_LANES-1:0]               DQSW270_EYE_MONITOR_CLR_FLAGS;
wire [IOG_DQS_LANES-1:0]               DQSW270_EYE_MONITOR_CLR_FLAGS;
wire [IOG_DQS_LANES-1:0]               DQSW270_EYE_MONITOR_CLR_FLAGS_I;
input  [IOG_DQS_LANES-1:0]              DQSW270_EYE_MONITOR_EARLY;
input  [IOG_DQS_LANES-1:0]              DQSW270_EYE_MONITOR_LATE;

output [IOG_DQS_LANES-1:0]               DQSW_DELAY_LINE_LOAD;
output [IOG_DQS_LANES-1:0]               DQSW_DELAY_LINE_MOVE;
output [IOG_DQS_LANES-1:0]               DQSW_DELAY_LINE_DIRECTION;
output [IOG_DQS_LANES-1:0]               DQSW270_DELAY_LINE_LOAD;
output [IOG_DQS_LANES-1:0]               DQSW270_DELAY_LINE_MOVE;
output [IOG_DQS_LANES-1:0]               DQSW270_DELAY_LINE_DIRECTION;

reg [IOG_DQS_LANES-1:0]               DQSW_DELAY_LINE_LOAD;          // registered, 3/22 
reg [IOG_DQS_LANES-1:0]               DQSW_DELAY_LINE_MOVE;          // registered, 3/22
reg [IOG_DQS_LANES-1:0]               DQSW_DELAY_LINE_DIRECTION;     // registered, 3/22
reg [IOG_DQS_LANES-1:0]               DQSW270_DELAY_LINE_LOAD;       // registered, 3/22
reg [IOG_DQS_LANES-1:0]               DQSW270_DELAY_LINE_MOVE;       // registered, 3/22
reg [IOG_DQS_LANES-1:0]               DQSW270_DELAY_LINE_DIRECTION;  // registered, 3/22

wire [IOG_DQS_LANES-1:0]              DQSW_DELAY_LINE_LOAD_INTERNAL;          // registered, 3/22 
wire [IOG_DQS_LANES-1:0]              DQSW_DELAY_LINE_MOVE_INTERNAL;          // registered, 3/22
wire [IOG_DQS_LANES-1:0]              DQSW_DELAY_LINE_DIRECTION_INTERNAL;     // registered, 3/22
wire [IOG_DQS_LANES-1:0]              DQSW270_DELAY_LINE_LOAD_INTERNAL;       // registered, 3/22
wire [IOG_DQS_LANES-1:0]              DQSW270_DELAY_LINE_MOVE_INTERNAL;       // registered, 3/22
wire [IOG_DQS_LANES-1:0]              DQSW270_DELAY_LINE_DIRECTION_INTERNAL;  // registered, 3/22

input [IOG_DQS_LANES-1:0]                DQSW270_DELAY_LINE_OOR;
input [IOG_DQS_LANES-1:0]                DQSW_DELAY_LINE_OOR;

// REFCLK TRAINING
output                REFCLK_DELAY_LINE_LOAD;
output                REFCLK_DELAY_LINE_MOVE;
output                REFCLK_DELAY_LINE_DIRECTION;
reg                   REFCLK_DELAY_LINE_LOAD;                 // registered, 3/22
reg                   REFCLK_DELAY_LINE_MOVE;                 // registered, 3/22
reg                   REFCLK_DELAY_LINE_DIRECTION;            // registered, 3/22
wire                  REFCLK_DELAY_LINE_LOAD_INTERNAL;        // registered, 3/22
wire                  REFCLK_DELAY_LINE_MOVE_INTERNAL;        // registered, 3/22
wire                  REFCLK_DELAY_LINE_DIRECTION_INTERNAL;   // registered, 3/22

output                CMD_EYE_MONITOR_CLR_FLAGS;
input                CMD_EYE_MONITOR_EARLY;
input                CMD_EYE_MONITOR_LATE;
output                CMD_DELAY_LINE_LOAD;
output                CMD_DELAY_LINE_MOVE;
output                CMD_DELAY_LINE_DIRECTION;
reg                   CMD_DELAY_LINE_LOAD;                    // registered, 3/22
reg                   CMD_DELAY_LINE_MOVE;                    // registered, 3/22
reg                   CMD_DELAY_LINE_DIRECTION;               // registered, 3/22
wire                  CMD_DELAY_LINE_LOAD_INTERNAL;           // registered, 3/22
wire                  CMD_DELAY_LINE_MOVE_INTERNAL;           // registered, 3/22
wire                  CMD_DELAY_LINE_DIRECTION_INTERNAL;      // registered, 3/22

// AS: ADDED WL_PAUSE
// output [IOG_DQS_LANES-1:0] WL_PAUSE;
wire [IOG_DQS_LANES-1:0] WL_PAUSE;

// AS: ADDED DQSW CONTROL
output [IOG_DQS_LANES*8-1:0] DQSW_SELA;
reg [IOG_DQS_LANES*8-1:0] DQSW_SELA;                          // registered, 3/22
wire [IOG_DQS_LANES*8-1:0] DQSW_SELA_INTERNAL;                // registered, 3/22

output CMD_OE;
wire CMD_OE;

output  CMD_DELAY_LINE_MOVE_TRN;
reg     CMD_DELAY_LINE_MOVE_TRN;                              // registered, 3/22
wire    CMD_DELAY_LINE_MOVE_TRN_INTERNAL;                     // registered, 3/22

input REFCLK_IGEAR_RX8;
input [IOG_DQS_LANES-1:0] DQSW270_IGEAR_RX8;

// AS: ADDED THIS SIGNAL TO REPLACE GT_PAUSE AND WL_PAUSE
output [IOG_DQS_LANES-1:0] INIT_PAUSE;
reg    [IOG_DQS_LANES-1:0] INIT_PAUSE;                        // registered, 3/22
wire   [IOG_DQS_LANES-1:0] INIT_PAUSE_INTERNAL;               // registered, 3/22

// AS: NEW GENERATED-RESET SIGNAL (FROM PLL_LOCK)
input PLL_LOCK;
output INIT_RESET;
// AS: made INIT_RESET combinatorial
// reg INIT_RESET;

// AS: added reset sync
reg reset_n_1, reset_n_2, reset_n_int;

// AS: NEW input/output PORTS FOR MUX'ING

input [IOG_DQS_LANES*2-1:0]     DFI_WRDATA_MASK_P0;
input [IOG_DQS_LANES*2-1:0]     DFI_WRDATA_MASK_P1;
input [IOG_DQS_LANES*2-1:0]     DFI_WRDATA_MASK_P2;
input [IOG_DQS_LANES*2-1:0]     DFI_WRDATA_MASK_P3;

output [IOG_DQS_LANES*2-1:0]    IOG_WRDATA_MASK_P0;
output [IOG_DQS_LANES*2-1:0]    IOG_WRDATA_MASK_P1;
output [IOG_DQS_LANES*2-1:0]    IOG_WRDATA_MASK_P2;
output [IOG_DQS_LANES*2-1:0]    IOG_WRDATA_MASK_P3;
output [19:0]                   IOG_ADDRESS_P0;
output [19:0]                   IOG_ADDRESS_P1;
output [19:0]                   IOG_ADDRESS_P2;
output [19:0]                   IOG_ADDRESS_P3;

// AS: ADDED NEW PORTS FOR SAR http://bugzilla/show_bug.cgi?id=85957
// IN ORDER TO OBVIATE THE USE OF EYE MONITOR FLAGS
// EYE MONITOR FLAGS REMAIN FOR LEGACY PURPOSES / IN CASE
// SILICON FIX COMES IN FOR REV D
input [4*NUM_BCLKS-1:0]         BCLK_IGEAR_RX;
input                           CMD_IGEAR_RX8;
input [IOG_DQS_LANES*2-1:0]     DQSW270_IGEAR_RX;
input [IOG_DQS_LANES*2-1:0]     DQSW_IGEAR_RX;
output                          CMD_RESET_LANE;

// AS: ADDED SKIP_* SIGNALS
input                           SKIP_DQSW_TRN;
input                           SKIP_BCLK_TRN;
input                           SKIP_CA_TRN;
input                           SKIP_WRLVL_TRN;
input                           SKIP_RDLVL_TRN;

// AS: added configuration ports
input [2:0]                     ADDR_VCOPHS_OFFSET;
input [2:0]                     BCLK_VCOPHS_OFFSET;
input [6:0]                     WRLVL_TAP_OFFSET;

// AS: added VREF training signals
output                          CAL_INIT_MR_W_REQ;
output [ 7:0]                   CAL_INIT_MR_ADDR;
output [17:0]                   CAL_INIT_MR_WR_DATA;
output [17:0]                   CAL_INIT_MR_WR_MASK;
input                           CAL_INIT_ACK;
output [1:0]                    CAL_INIT_CS;
input                           SKIP_VREF_TRAINING;

input  [6:0]                    VREF_MR6_VALUE;

input                           CTRLR_READY_IN;
output                          CTRLR_READY_OUT;

// AS: added 6/8 for write callibration
input  [IOG_DQS_LANES*64-1:0]    IOG_DQ_TXDATA_IN;
output [IOG_DQS_LANES*64-1:0]    IOG_DQ_TXDATA_OUT;
input  [IOG_DQS_LANES*8-1:0]     IOG_DM_TXDATA_IN;
output [IOG_DQS_LANES*8-1:0]     IOG_DM_TXDATA_OUT;


output                                CAL_L_R_REQ;                // to NWL CTRLR
output                                CAL_L_W_REQ;                // to NWL CTRLR
output [IOG_DQS_LANES*64-1:0]         CAL_L_DATAIN;               // to NWL CTRLR
output [IOG_DQS_LANES*8-1:0]          CAL_L_DM_IN;                // to NWL CTRLR
input                                 CAL_L_BUSY;                 // to NWL CTRLR
input                                 CAL_L_D_REQ;                // to NWL CTRLR
input  [IOG_DQS_LANES*64-1:0]         CAL_L_DATAOUT;              // to NWL CTRLR
input                                 CAL_L_R_VALID;              // to NWL CTRLR  
output                                CAL_SELECT;                 // to NWL CTRLR

input [9:0]                           ADDR_WAIT_COUNT;
input [7:0]                           WRCAL_WRITE_COUNTER_VALUE;
input [9:0]                           RDGATE_MIN_READS_THRESHOLD;

output [3:0]                          ITER_COUNT;
wire [3:0]                            ITER_COUNT;

// AS: additional ports for pipelining
input                               DFI_RESET_N_P0            ;
input                               DFI_RESET_N_P1            ;
input                               DFI_RESET_N_P2            ;
input                               DFI_RESET_N_P3            ;
input  [19:0]                       DFI_ADDRESS_P0            ;
input  [19:0]                       DFI_ADDRESS_P1            ;
input  [19:0]                       DFI_ADDRESS_P2            ;
input  [19:0]                       DFI_ADDRESS_P3            ;
input  [3:0]                        DFI_BANK_P0               ;
input  [3:0]                        DFI_BANK_P1               ;
input  [3:0]                        DFI_BANK_P2               ;
input  [3:0]                        DFI_BANK_P3               ;
input                               DFI_CS_N_P0               ;
input                               DFI_CS_N_P1               ;
input                               DFI_CS_N_P2               ;
input                               DFI_CS_N_P3               ;
input                               DFI_ODT_P0                ;
input                               DFI_ODT_P1                ;
input                               DFI_ODT_P2                ;
input                               DFI_ODT_P3                ;
input                               DFI_CKE_P0                ;
input                               DFI_CKE_P1                ;
input                               DFI_CKE_P2                ;
input                               DFI_CKE_P3                ;
input                               DFI_RAS_N_P0              ;
input                               DFI_RAS_N_P1              ;
input                               DFI_RAS_N_P2              ;
input                               DFI_RAS_N_P3              ;
input                               DFI_CAS_N_P0              ;
input                               DFI_CAS_N_P1              ;
input                               DFI_CAS_N_P2              ;
input                               DFI_CAS_N_P3              ;
input                               DFI_WE_N_P0               ;
input                               DFI_WE_N_P1               ;
input                               DFI_WE_N_P2               ;
input                               DFI_WE_N_P3               ;
input                               DFI_ACT_N_P0              ;
input                               DFI_ACT_N_P1              ;
input                               DFI_ACT_N_P2              ;
input                               DFI_ACT_N_P3              ;
output                              DFI_RESET_N_P0_OUT        ;
output                              DFI_RESET_N_P1_OUT        ;
output                              DFI_RESET_N_P2_OUT        ;
output                              DFI_RESET_N_P3_OUT        ;
output     [3:0]                    DFI_BANK_P0_OUT           ;  
output     [3:0]                    DFI_BANK_P1_OUT           ;  
output     [3:0]                    DFI_BANK_P2_OUT           ;  
output     [3:0]                    DFI_BANK_P3_OUT           ;  
output                              DFI_CS_N_P0_OUT           ;  
output                              DFI_CS_N_P1_OUT           ;  
output                              DFI_CS_N_P2_OUT           ;  
output                              DFI_CS_N_P3_OUT           ;  
output                              DFI_ODT_P0_OUT            ;  
output                              DFI_ODT_P1_OUT            ;  
output                              DFI_ODT_P2_OUT            ;  
output                              DFI_ODT_P3_OUT            ;  
output                              DFI_CKE_P0_OUT            ;  
output                              DFI_CKE_P1_OUT            ;  
output                              DFI_CKE_P2_OUT            ;  
output                              DFI_CKE_P3_OUT            ;  
output                              DFI_RAS_N_P0_OUT          ;  
output                              DFI_RAS_N_P1_OUT          ;  
output                              DFI_RAS_N_P2_OUT          ;  
output                              DFI_RAS_N_P3_OUT          ;  
output                              DFI_CAS_N_P0_OUT          ;  
output                              DFI_CAS_N_P1_OUT          ;  
output                              DFI_CAS_N_P2_OUT          ;  
output                              DFI_CAS_N_P3_OUT          ;  
output                              DFI_WE_N_P0_OUT           ;  
output                              DFI_WE_N_P1_OUT           ;  
output                              DFI_WE_N_P2_OUT           ;  
output                              DFI_WE_N_P3_OUT           ;
output                              DFI_ACT_N_P0_OUT          ;  
output                              DFI_ACT_N_P1_OUT          ;  
output                              DFI_ACT_N_P2_OUT          ;  
output                              DFI_ACT_N_P3_OUT          ;  
input  [1:0]                        DFI_BG_P0                 ;
input  [1:0]                        DFI_BG_P1                 ;
input  [1:0]                        DFI_BG_P2                 ;
input  [1:0]                        DFI_BG_P3                 ;
output [1:0]                        DFI_BG_P0_OUT             ;  
output [1:0]                        DFI_BG_P1_OUT             ;  
output [1:0]                        DFI_BG_P2_OUT             ;  
output [1:0]                        DFI_BG_P3_OUT             ;

/// I/O_End <<<---

//SMG 31/3/16 - adding signal to block out fifo when needed
wire [IOG_DQS_LANES-1:0]     DQ_DQS_BLOCK_FIFO;
wire [IOG_DQS_LANES-1:0]     APB_BLOCK_FIFO;

wire [IOG_DQS_LANES-1:0] dfi_wrlvl_resp_i;

/// Components_Start --->>>

// (1)Perform write leveling when requested by NWL controller
// (2)Perform read gate training
// (3.1)Provide per DQ bit read training within each lane i.e. line up all the DQ bits within each lane to each other
// (3.2)Provide read training - centre DQS in each lane
// (4)Perform Vref training
// (5)Perform clock alignment
// (6)Instantiate an APB interface and provide access to read registers (TRAUNING VALUES)
// (7)Monitor variables to decide on retraining and request if required
// File: TIP_CTRL_BLK.v

wire [IOG_DQS_LANES-1:0] DQSW270_DELAY_LINE_LOAD_RAW;
assign DQSW270_DELAY_LINE_LOAD_INTERNAL = (DFI_RDLVL_EN?{IOG_DQS_LANES{1'b1}}:DQSW270_DELAY_LINE_LOAD_RAW);

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

// *********************************************************************************
// AS: 3/22/18
// ADDED OUTPUT REGISTERS ON ALL IOD / PLL CONTROLS TO PREVENT GLITCHES
// *********************************************************************************
always @ (posedge SCLK or negedge reset_n_int)
begin : IOD_output_regsiters
  if (reset_n_int == 1'b0)
  begin
    CLK_SEL                     <= {(IOG_DQS_LANES*3){1'b0}};
    DELAY_LINE_SEL_RD           <= {(IOG_DQS_LANES){1'b0}};
    DIRECTION                   <= {(IOG_DQS_LANES*9){1'b0}};
    LOAD                        <= {(IOG_DQS_LANES*9){1'b0}};
    MOVE                        <= {(IOG_DQS_LANES*9){1'b0}};
    LOADPHS_B                   <= {(NUM_BCLKS){1'b1}};
    VCO_PHSEL_BCLK_SEL          <= {(NUM_BCLKS){1'b0}};
    VCO_PHSEL_REFCLK_SEL        <= 1'b0;
    VCO_PHSEL_ROTATE            <= {(NUM_BCLKS){1'b0}};
    VREF_DIRECTION              <= 1'b0;
    VREF_MOVE                   <= 1'b0;
    VCO_PHSEL_BCLK90_SEL        <= {(NUM_BCLKS){1'b0}};
    DQSW_DELAY_LINE_LOAD        <= {(IOG_DQS_LANES){1'b0}};
    DQSW_DELAY_LINE_MOVE        <= {(IOG_DQS_LANES){1'b0}};
    DQSW_DELAY_LINE_DIRECTION   <= {(IOG_DQS_LANES){1'b0}};
    DQSW270_DELAY_LINE_LOAD     <= {(IOG_DQS_LANES){1'b0}};
    DQSW270_DELAY_LINE_MOVE     <= {(IOG_DQS_LANES){1'b0}};
    DQSW270_DELAY_LINE_DIRECTION<= {(IOG_DQS_LANES){1'b0}};
    REFCLK_DELAY_LINE_LOAD      <= 1'b0;
    REFCLK_DELAY_LINE_MOVE      <= 1'b0;
    REFCLK_DELAY_LINE_DIRECTION <= 1'b0;
    CMD_DELAY_LINE_LOAD         <= 1'b0;
    CMD_DELAY_LINE_MOVE         <= 1'b0;
    CMD_DELAY_LINE_DIRECTION    <= 1'b0;
    DQSW_SELA                   <= {(IOG_DQS_LANES*8){1'b0}};
    CMD_DELAY_LINE_MOVE_TRN     <= 1'b0;
    INIT_PAUSE                  <= 1'b0;

  end
  else
  begin
    CLK_SEL                     <= CLK_SEL_INTERNAL;
    DELAY_LINE_SEL_RD           <= DELAY_LINE_SEL_RD_INTERNAL;
    DIRECTION                   <= DIRECTION_INTERNAL;
    LOAD                        <= LOAD_INTERNAL;
    MOVE                        <= MOVE_INTERNAL;
    LOADPHS_B                   <= LOADPHS_B_INTERNAL;
    VCO_PHSEL_BCLK_SEL          <= VCO_PHSEL_BCLK_SEL_INTERNAL;
    VCO_PHSEL_REFCLK_SEL        <= VCO_PHSEL_REFCLK_SEL_INTERNAL;
    VCO_PHSEL_ROTATE            <= VCO_PHSEL_ROTATE_INTERNAL;
    VREF_DIRECTION              <= VREF_DIRECTION_INTERNAL;
    VREF_MOVE                   <= VREF_MOVE_INTERNAL;
    VCO_PHSEL_BCLK90_SEL        <= VCO_PHSEL_BCLK90_SEL_INTERNAL;
    DQSW_DELAY_LINE_LOAD        <= DQSW_DELAY_LINE_LOAD_INTERNAL;
    DQSW_DELAY_LINE_MOVE        <= DQSW_DELAY_LINE_MOVE_INTERNAL;
    DQSW_DELAY_LINE_DIRECTION   <= DQSW_DELAY_LINE_DIRECTION_INTERNAL;
    DQSW270_DELAY_LINE_LOAD     <= DQSW270_DELAY_LINE_LOAD_INTERNAL;
    DQSW270_DELAY_LINE_MOVE     <= DQSW270_DELAY_LINE_MOVE_INTERNAL;
    DQSW270_DELAY_LINE_DIRECTION<= DQSW270_DELAY_LINE_DIRECTION_INTERNAL;
    REFCLK_DELAY_LINE_LOAD      <= REFCLK_DELAY_LINE_LOAD_INTERNAL;
    REFCLK_DELAY_LINE_MOVE      <= REFCLK_DELAY_LINE_MOVE_INTERNAL;
    REFCLK_DELAY_LINE_DIRECTION <= REFCLK_DELAY_LINE_DIRECTION_INTERNAL;
    CMD_DELAY_LINE_LOAD         <= CMD_DELAY_LINE_LOAD_INTERNAL;
    CMD_DELAY_LINE_MOVE         <= CMD_DELAY_LINE_MOVE_INTERNAL;
    CMD_DELAY_LINE_DIRECTION    <= CMD_DELAY_LINE_DIRECTION_INTERNAL;
    DQSW_SELA                   <= DQSW_SELA_INTERNAL;
    CMD_DELAY_LINE_MOVE_TRN     <= CMD_DELAY_LINE_MOVE_TRN_INTERNAL;
    INIT_PAUSE                  <= INIT_PAUSE_INTERNAL;
    
  end
end
// *********************************************************************************


TIP_CTRL_BLK # (
  .IOG_DQS_LANES(IOG_DQS_LANES),
  .NUM_BCLKS(NUM_BCLKS),
  .IOG_DQ_WIDTH_L0(IOG_DQ_WIDTH_L0),
  .IOG_DQ_WIDTH_L1(IOG_DQ_WIDTH_L1),
  .IOG_DQ_WIDTH_L2(IOG_DQ_WIDTH_L2),
  .IOG_DQ_WIDTH_L3(IOG_DQ_WIDTH_L3),
  .IOG_DQ_WIDTH_L4(IOG_DQ_WIDTH_L4),
  .IOG_DQ_WIDTH_L5(IOG_DQ_WIDTH_L5),
  .IOG_DQ_WIDTH_L6(IOG_DQ_WIDTH_L6),
  .IOG_DQ_WIDTH_L7(IOG_DQ_WIDTH_L7),
  .IOG_DQ_WIDTH_L8(IOG_DQ_WIDTH_L8)
  //.VREF_MR6_VALUE(VREF_MR6_VALUE)
) TIP_CTRL_BLK( .SCLK(SCLK),
                           .reset_n(reset_n_int),
                           .dfi_init_complete(DFI_INIT_COMPLETE),
                           .dfi_init_start(DFI_INIT_START),
                           .dfi_rdlvl_cs_0_n(DFI_RDLVL_CS_0_N),
                           .dfi_rdlvl_cs_1_n(DFI_RDLVL_CS_1_N),
                           .dfi_wrlvl_cs_0_n(DFI_WRLVL_CS_0_N),
                           .dfi_wrlvl_cs_1_n(DFI_WRLVL_CS_1_N),
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
                           .dfi_rdlvl_en(DFI_RDLVL_EN),
                           .dfi_rdlvl_gate_en(DFI_RDLVL_GATE_EN),
                           .dfi_rdlvl_resp(DFI_RDLVL_RESP),
                           .dfi_training_complete(DFI_TRAINING_COMPLETE),
                           .dfi_wrdata_en_p0(DFI_WRDATA_EN_P0_WIRE),
                           .dfi_wrdata_en_p1(DFI_WRDATA_EN_P1_WIRE),
                           .dfi_wrdata_en_p2(DFI_WRDATA_EN_P2_WIRE),
                           .dfi_wrdata_en_p3(DFI_WRDATA_EN_P3_WIRE),
                           .dfi_wrlvl_en(DFI_WRLVL_EN),
                           .dfi_wrlvl_resp(dfi_wrlvl_resp_i),
                           .dfi_wrlvl_strobe(DFI_WRLVL_STROBE),
                           .paddr(PADDR),
                           .penable(PENABLE),
                           .prdata(PRDATA),
                           .pready(PREADY),
                           .psel(PSEL),
                           .pwdata(PWDATA),
                           .pwrite(PWRITE),
                           .code_update(CODE_UPDATE),
                           .dll_dly_diff(DLL_DLY_DIFF),
                           .loadphs_b(LOADPHS_B_INTERNAL),
                           .vco_phsel_bclk_sel(VCO_PHSEL_BCLK_SEL_INTERNAL),
                           .vco_phsel_refclk_sel(VCO_PHSEL_REFCLK_SEL_INTERNAL),
                           .vco_phsel_rotate(VCO_PHSEL_ROTATE_INTERNAL),
                           .vref_direction(VREF_DIRECTION_INTERNAL),
                           .vref_move(VREF_MOVE_INTERNAL),
                           .vref_out_of_range(VREF_OUT_OF_RANGE),
                           .vref_reload(VREF_RELOAD),
                           .training_pattern(TRAINING_PATTERN),
                           .odt_dyn_lane(ODT_DYN_LANE),
                           .bclk_eye_monitor_clr_flags(BCLK_EYE_MONITOR_CLR_FLAGS),
                           .bclk_eye_monitor_early(BCLK_EYE_MONITOR_EARLY),
                           .bclk_eye_monitor_late(BCLK_EYE_MONITOR_LATE),
                           .burst_detect(BURST_DETECT_WIRE),
                           .clk_sel(CLK_SEL_INTERNAL),
                           .clock_pause(CLOCK_PAUSE),
                           .delay_line_sel_rd(DELAY_LINE_SEL_RD_INTERNAL),
                           .direction(DIRECTION_INTERNAL),
                           .iog_oe_p0(IOG_OE_P0),
                           .iog_oe_p1(IOG_OE_P1),
                           .iog_oe_p2(IOG_OE_P2),
                           .iog_oe_p3(IOG_OE_P3),
        					         .dqs_oe_p0(DQS_OE_P0),
                           .dqs_oe_p1(DQS_OE_P1),
                           .dqs_oe_p2(DQS_OE_P2),
                           .dqs_oe_p3(DQS_OE_P3),
                           .dm_oe_p0(DM_OE_P0),
                           .dm_oe_p1(DM_OE_P1),
                           .dm_oe_p2(DM_OE_P2),
                           .dm_oe_p3(DM_OE_P3),
                           .load(LOAD_INTERNAL),
                           .move(MOVE_INTERNAL),
                           .refclk_eye_monitor_clr_flags(REFCLK_EYE_MONITOR_CLR_FLAGS),
                           .refclk_eye_monitor_early(REFCLK_EYE_MONITOR_EARLY),
                           .refclk_eye_monitor_late(REFCLK_EYE_MONITOR_LATE),
                           .rx_out_of_range(RX_OUT_OF_RANGE),
                           .two_ranks(TWO_RANKS),
                           .tx_out_of_range(TX_OUT_OF_RANGE),
                           .dfi_ctrlupd_req(DFI_CTRLUPD_REQ),
                           .dfi_rddata(DFI_RDDATA),
                           .dfi_rddata_en_p0(DFI_RDDATA_EN_P0_WIRE),
                           .dfi_rddata_en_p1(DFI_RDDATA_EN_P1_WIRE),
                           .dfi_rddata_en_p2(DFI_RDDATA_EN_P2_WIRE),
                           .dfi_rddata_en_p3(DFI_RDDATA_EN_P3_WIRE),
                           .dfi_rddata_valid(DFI_RDDATA_VALID_INTERNAL),
                           .pad_rddata(PAD_RDDATA),
                           .gt_pause(GT_PAUSE),
                           .iog_rddata_en_p0_p(IOG_RDDATA_EN_P0_P),
                           .iog_rddata_en_p0_n(IOG_RDDATA_EN_P0_N),
                           .iog_rddata_en_p1_p(IOG_RDDATA_EN_P1_P),
                           .iog_rddata_en_p1_n(IOG_RDDATA_EN_P1_N),
                           .iog_rddata_en_p2_p(IOG_RDDATA_EN_P2_P),
                           .iog_rddata_en_p2_n(IOG_RDDATA_EN_P2_N),
                           .iog_rddata_en_p3_p(IOG_RDDATA_EN_P3_P),
                           .iog_rddata_en_p3_n(IOG_RDDATA_EN_P3_N),
                          .select_rank_1(SELECT_RANK_1),
                          .rd_training_error(RD_TRAINING_ERROR),
                          // AS: new ports
                          .vco_phsel_bclk90_sel(VCO_PHSEL_BCLK90_SEL_INTERNAL),
                          .dqsw_eye_monitor_clr_flags(DQSW_EYE_MONITOR_CLR_FLAGS),
                          .dqsw_eye_monitor_early(DQSW_EYE_MONITOR_EARLY),
                          .dqsw_eye_monitor_late(DQSW_EYE_MONITOR_LATE),
                          .dqsw270_eye_monitor_clr_flags(DQSW270_EYE_MONITOR_CLR_FLAGS_I),
                          .dqsw270_eye_monitor_early(DQSW270_EYE_MONITOR_EARLY),
                          .dqsw270_eye_monitor_late(DQSW270_EYE_MONITOR_LATE),
                          .vco_phsinit_refclk(),
                          .vco_phsinit_bclk(),
                          .vco_phsinit_bclk90(),
                          // AS: don't use these anymore (THEY ARE PC BITS)
//                          .vco_phsinit_refclk(VCO_PHSINIT_REFCLK),
//                          .vco_phsinit_bclk(VCO_PHSINIT_BCLK),
//                          .vco_phsinit_bclk90(VCO_PHSINIT_BCLK90),
                          .dqsw_delay_line_load(DQSW_DELAY_LINE_LOAD_INTERNAL),
                          .dqsw_delay_line_move(DQSW_DELAY_LINE_MOVE_INTERNAL),
                          .dqsw_delay_line_direction(DQSW_DELAY_LINE_DIRECTION_INTERNAL),
                          .dqsw270_delay_line_load(DQSW270_DELAY_LINE_LOAD_RAW),
                          .dqsw270_delay_line_move(DQSW270_DELAY_LINE_MOVE_INTERNAL),
                          .dqsw270_delay_line_direction(DQSW270_DELAY_LINE_DIRECTION_INTERNAL),
                          .refclk_delay_line_load(REFCLK_DELAY_LINE_LOAD_INTERNAL),
                          .refclk_delay_line_move(REFCLK_DELAY_LINE_MOVE_INTERNAL),
                          .refclk_delay_line_direction(REFCLK_DELAY_LINE_DIRECTION_INTERNAL),
                          .cmd_eye_monitor_clr_flags(CMD_EYE_MONITOR_CLR_FLAGS),
                          .cmd_eye_monitor_early(CMD_EYE_MONITOR_EARLY),
                          .cmd_eye_monitor_late(CMD_EYE_MONITOR_LATE),
                          .cmd_delay_line_load(CMD_DELAY_LINE_LOAD_INTERNAL),
                          .cmd_delay_line_move(CMD_DELAY_LINE_MOVE_INTERNAL),
                          .cmd_delay_line_direction(CMD_DELAY_LINE_DIRECTION_INTERNAL),
                          .wl_pause(WL_PAUSE),
                          .dqsw_sela(DQSW_SELA_INTERNAL),
                          .cmd_oe(CMD_OE),
                          .cmd_delay_line_move_trn(CMD_DELAY_LINE_MOVE_TRN_INTERNAL),
                          .refclk_igear_rx8(REFCLK_IGEAR_RX8),
                          .dqsw270_igear_rx8(DQSW270_IGEAR_RX8),
						              .dq_dqs_block_fifo(DQ_DQS_BLOCK_FIFO),
						              .apb_block_fifo(APB_BLOCK_FIFO),
                          .dqsw270_delay_line_oor(DQSW270_DELAY_LINE_OOR),
                          .dqsw_delay_line_oor(DQSW_DELAY_LINE_OOR),
                          // Gian Edit. Merging of new bench to old one for new gate training
                          // AS: removed these, added dqsw270 oor
                          // .txdelay_direction(TXDELAY_DIRECTION),
                          // .txdelay_load(TXDELAY_LOAD),
                          // .txdelay_move(TXDELAY_MOVE),
                          // .txdelay_oor(TXDELAY_OOR)   
                          // AS: ADDED NEW PORTS FOR SAR http://bugzilla/show_bug.cgi?id=85957
                          // IN ORDER TO OBVIATE THE USE OF EYE MONITOR FLAGS
                          // EYE MONITOR FLAGS REMAIN FOR LEGACY PURPOSES / IN CASE
                          // SILICON FIX COMES IN FOR REV D
                          .bclk_igear_rx(BCLK_IGEAR_RX),
                          .cmd_igear_rx8(CMD_IGEAR_RX8),
                          .dqsw270_igear_rx(DQSW270_IGEAR_RX),
                          .dqsw_igear_rx(DQSW_IGEAR_RX),
                          .cmd_reset_lane(CMD_RESET_LANE),
                          // AS: ADDED SKIP SIGNALS
                          .skip_dqsw_trn(SKIP_DQSW_TRN),
                          .skip_bclk_trn(SKIP_BCLK_TRN),
                          .skip_ca_trn(SKIP_CA_TRN),
                          .skip_wrlvl_trn(SKIP_WRLVL_TRN),
                          .skip_rdlvl_trn(SKIP_RDLVL_TRN),
                          // AS: ADDED CONFIGURATION PORTS
                          .ADDR_VCOPHS_OFFSET(ADDR_VCOPHS_OFFSET),
                          .BCLK_VCOPHS_OFFSET(BCLK_VCOPHS_OFFSET),
                          .WRLVL_TAP_OFFSET(WRLVL_TAP_OFFSET),
                          .cal_init_mr_w_req(CAL_INIT_MR_W_REQ),
                          .cal_init_mr_addr(CAL_INIT_MR_ADDR),
                          .cal_init_mr_wr_data(CAL_INIT_MR_WR_DATA),
                          .cal_init_mr_wr_mask(CAL_INIT_MR_WR_MASK),
                          .cal_init_ack(CAL_INIT_ACK),
                          .skip_vref_training(SKIP_VREF_TRAINING),
                          .pclk(PCLK),
                          .VREF_MR6_VALUE(VREF_MR6_VALUE),
                          .cal_init_cs(CAL_INIT_CS),
                          .ctrlr_ready_in(CTRLR_READY_IN),
                          .ctrlr_ready_out(CTRLR_READY_OUT),
                          .iog_dq_txdata_in(IOG_DQ_TXDATA_IN_WIRE),
                          .iog_dq_txdata_out(IOG_DQ_TXDATA_OUT),
                          .iog_dm_txdata_in(IOG_DM_TXDATA_IN_WIRE),
                          .iog_dm_txdata_out(IOG_DM_TXDATA_OUT),
                          .cal_l_r_req(CAL_L_R_REQ),  
                          .cal_l_w_req(CAL_L_W_REQ),  
                          .cal_l_datain(CAL_L_DATAIN), 
                          .cal_l_dm_in(CAL_L_DM_IN),  
                          .cal_l_busy(CAL_L_BUSY),   
                          .cal_l_d_req(CAL_L_D_REQ),  
                          .cal_l_dataout(CAL_L_DATAOUT),
                          .cal_l_r_valid(CAL_L_R_VALID),
                          .cal_select(CAL_SELECT),
                          .ADDR_WAIT_COUNT(ADDR_WAIT_COUNT),
                          .WRCAL_WRITE_COUNTER_VALUE(WRCAL_WRITE_COUNTER_VALUE),
                          .RDGATE_MIN_READS_THRESHOLD(RDGATE_MIN_READS_THRESHOLD)
                          
						   );

//ADDED BY ALISTER 9/15/2017

wire [IOG_DQS_LANES-1:0] IOG_RDDATA_VALID_GATED;
reg [3*IOG_DQS_LANES-1:0] VALID_GATE_COUNTER;
wire [IOG_DQS_LANES-1:0] MOVE_LOAD_RESET;


genvar k;
generate
    

    for (k=0; k<IOG_DQS_LANES;k=k+1) begin : VALID_GATING_LOGIC

        assign MOVE_LOAD_RESET[k]= MOVE[9*(k+1)-1] | LOAD[9*(k+1)-1]; 

        always @ (posedge SCLK or posedge MOVE_LOAD_RESET[k] or negedge reset_n_int) 
        begin //Making the move/load reset the counter, this will cause the TIP to immediately gate the valid, preventing move glitches.
            if (reset_n_int == 1'b0)
            begin
              // AS: 2/6/19 changed reset value to match set value
              VALID_GATE_COUNTER[3*(k+1)-1:3*k]<=3'b111;
            end
            else
            begin
              if (MOVE_LOAD_RESET[k]) begin
                  VALID_GATE_COUNTER[3*(k+1)-1:3*k]<=3'b111;
              end
              else 
              begin
                  if (VALID_GATE_COUNTER[3*(k+1)-1:3*k] != 0) VALID_GATE_COUNTER[3*(k+1)-1:3*k]<=VALID_GATE_COUNTER[3*(k+1)-1:3*k]-1;
                  else                                        VALID_GATE_COUNTER[3*(k+1)-1:3*k]<=0;
              end
            end
        end
        assign IOG_RDDATA_VALID_GATED[k]=|VALID_GATE_COUNTER[3*(k+1)-1:3*k] ? 0 : IOG_RDDATA_VALID_WIRE[k];
    end
endgenerate


//END ALISTER CHANGES

// - Clock = sclk
// - Reset = reset_n
// - Eliminate skew between individual lanes
// File: LANE_ALIGNMENT.v

//defparam LANE_ALIGNMENT.IOG_DQS_LANES = IOG_DQS_LANES;
//defparam LANE_ALIGNMENT.FIFO_DEPTH = FIFO_DEPTH;
//defparam LANE_ALIGNMENT.FIFO_ADDRESS_WIDTH = FIFO_ADDRESS_WIDTH;
//defparam LANE_ALIGNMENT.FIFO_ADDRESS_WIDTH_LANE = FIFO_ADDRESS_WIDTH*IOG_DQS_LANES;
//defparam LANE_ALIGNMENT.IOG_DQS_LANES_64 = IOG_DQS_LANES*64;

// AS: added dfi_training_complete
LANE_ALIGNMENT  #
(
  .IOG_DQS_LANES(IOG_DQS_LANES),
  .FIFO_DEPTH(FIFO_DEPTH),
  .FIFO_ADDRESS_WIDTH(FIFO_ADDRESS_WIDTH)
)LANE_ALIGNMENT( .SCLK(SCLK),
                               .reset_n(reset_n_int),
                               .dfi_rddata(DFI_RDDATA),
                               .dfi_rddata_valid(DFI_RDDATA_VALID_INTERNAL),
                               .iog_rddata(IOG_RDDATA_WIRE),
                               .iog_rddata_valid_pre(IOG_RDDATA_VALID_GATED), //ALISTER: ADDING A GATING SIGNAL ON THE VALID
                               .dfi_training_complete(DFI_TRAINING_COMPLETE),
							   .dq_dqs_block_fifo(DQ_DQS_BLOCK_FIFO), //SMG 31/3/16 - bringing in signals to protect FIFO from unwanted 'X's
							   .gt_block_fifo(DFI_RDLVL_GATE_EN), //SMG - using this to block off fifo during gate training
							   .apb_block_fifo(APB_BLOCK_FIFO) //SMG - signal coming from apb control
                              );

// AS: added mechanism for supressing dfi_rddata_valid before training is complete
// AS2: removed this internal signal (no longer needed for phased approach)
// assign DFI_RDDATA_VALID = (DFI_TRAINING_COMPLETE | DFI_RDLVL_EN) ? DFI_RDDATA_VALID_INTERNAL : 1'b0;

// AS: Pulling in logic from wrapper,  (10/24)
genvar i;
generate
for (i=0; i < IOG_DQS_LANES; i=i+1)
begin
  assign INIT_PAUSE_INTERNAL[i] = GT_PAUSE[i] | WL_PAUSE[i];
  assign DQSW270_EYE_MONITOR_CLR_FLAGS[i] = DQSW270_EYE_MONITOR_CLR_FLAGS_I[i] | SELECT_RANK_1;
end
endgenerate

// AS: made INIT_RESET combinatorial
/* always @ (posedge SCLK or negedge RESET_N)
begin : generate_init_reset_sync
  if (RESET_N == 1'b0)
    INIT_RESET <= 1'b1;
  else
    INIT_RESET <= ~reset_n_int;
end */
assign INIT_RESET = ~reset_n_int;

// ALISTER LIANG: ADDING RESET ITERATOR

wire RESET_ITER_N;

ddr_init_iterator ddr_init_iterator(
            //INPUTS
            .clk(SCLK), 
            .SYS_RESET_IN_N(RESET_N), 
            .SYS_RESET_OUT_N(RESET_ITER_N), 
            .ctrlr_ready(CTRLR_READY_OUT),
            .reset_counter(ITER_COUNT)
            );



// AS: added reset synchronization logic
always @ (posedge SCLK or negedge RESET_N)
begin : generate_synchronous_reset
  if (RESET_N == 1'b0)
  begin
    reset_n_1 <= 1'b0; 
    reset_n_2 <= 1'b0;
    reset_n_int <= 1'b0;
  end
  else
  begin
	reset_n_1 <= PLL_LOCK && RESET_N && RESET_ITER_N; //ALISTER: ADDED RESET_ITER_N here to reset the TIP/CTRLR with the reset iterator.
    //reset_n_1 <= PLL_LOCK && RESET_N;
    reset_n_2 <= reset_n_1;
    reset_n_int <= reset_n_2;
  end
end

// AS: added delay registers for generating
//     DFI_RDDATA_VALID from _EN
reg dfi_rddata_en_p0_0;
reg dfi_rddata_en_p1_0;
reg dfi_rddata_en_p2_0;
reg dfi_rddata_en_p3_0;
reg dfi_rddata_en_p0_1;
reg dfi_rddata_en_p1_1;
reg dfi_rddata_en_p2_1;
reg dfi_rddata_en_p3_1;
reg dfi_rddata_en_p0_2;
reg dfi_rddata_en_p1_2;
reg dfi_rddata_en_p2_2;
reg dfi_rddata_en_p3_2;
reg dfi_rddata_en_p0_3;
reg dfi_rddata_en_p1_3;
reg dfi_rddata_en_p2_3;
reg dfi_rddata_en_p3_3;


always @ (posedge SCLK or negedge reset_n_int)
begin : delay_dfi_rddata_en
  if (reset_n_int == 1'b0)
  begin
    dfi_rddata_en_p0_0 <= 1'b0;
    dfi_rddata_en_p1_0 <= 1'b0;
    dfi_rddata_en_p2_0 <= 1'b0;
    dfi_rddata_en_p3_0 <= 1'b0;
    dfi_rddata_en_p0_1 <= 1'b0;
    dfi_rddata_en_p1_1 <= 1'b0;
    dfi_rddata_en_p2_1 <= 1'b0;
    dfi_rddata_en_p3_1 <= 1'b0;
    dfi_rddata_en_p0_2 <= 1'b0;
    dfi_rddata_en_p1_2 <= 1'b0;
    dfi_rddata_en_p2_2 <= 1'b0;
    dfi_rddata_en_p3_2 <= 1'b0;
    dfi_rddata_en_p0_3 <= 1'b0;
    dfi_rddata_en_p1_3 <= 1'b0;
    dfi_rddata_en_p2_3 <= 1'b0;
    dfi_rddata_en_p3_3 <= 1'b0;
  end
  else
  begin
    dfi_rddata_en_p0_0 <= DFI_RDDATA_EN_P0_WIRE;
    dfi_rddata_en_p1_0 <= DFI_RDDATA_EN_P1_WIRE;
    dfi_rddata_en_p2_0 <= DFI_RDDATA_EN_P2_WIRE;
    dfi_rddata_en_p3_0 <= DFI_RDDATA_EN_P3_WIRE;
    dfi_rddata_en_p0_1 <= dfi_rddata_en_p0_0;
    dfi_rddata_en_p1_1 <= dfi_rddata_en_p1_0;
    dfi_rddata_en_p2_1 <= dfi_rddata_en_p2_0;
    dfi_rddata_en_p3_1 <= dfi_rddata_en_p3_0;
    dfi_rddata_en_p0_2 <= dfi_rddata_en_p0_1;
    dfi_rddata_en_p1_2 <= dfi_rddata_en_p1_1;
    dfi_rddata_en_p2_2 <= dfi_rddata_en_p2_1;
    dfi_rddata_en_p3_2 <= dfi_rddata_en_p3_1;
    dfi_rddata_en_p0_3 <= dfi_rddata_en_p0_2;
    dfi_rddata_en_p1_3 <= dfi_rddata_en_p1_2;
    dfi_rddata_en_p2_3 <= dfi_rddata_en_p2_2;
    dfi_rddata_en_p3_3 <= dfi_rddata_en_p3_2;
  end
end

// AS: added pipeline for DFI_WRLVL_RESP
always @ (posedge SCLK or negedge reset_n_int)
begin : wrlvl_pipe
  if (reset_n_int == 1'b0)
  begin
    DFI_WRLVL_RESP[IOG_DQS_LANES-1:0] <= {IOG_DQS_LANES{1'b0}};
  end
  else
  begin
    DFI_WRLVL_RESP[IOG_DQS_LANES-1:0] <= dfi_wrlvl_resp_i[IOG_DQS_LANES-1:0];
  end
end

// generated phased signals
assign DFI_RDDATA_W0 = DFI_RDDATA[IOG_DQS_LANES*16-1:0];
assign DFI_RDDATA_W1 = DFI_RDDATA[IOG_DQS_LANES*32-1:IOG_DQS_LANES*16];
assign DFI_RDDATA_W2 = DFI_RDDATA[IOG_DQS_LANES*48-1:IOG_DQS_LANES*32];
assign DFI_RDDATA_W3 = DFI_RDDATA[IOG_DQS_LANES*64-1:IOG_DQS_LANES*48];

// AS: added derived dfi_rddata_valid from dfi_rddata_en
assign DFI_RDDATA_VALID_W0 = (DFI_TRAINING_COMPLETE | DFI_RDLVL_EN) ? DFI_RDDATA_VALID_INTERNAL : dfi_rddata_en_p0_3;
assign DFI_RDDATA_VALID_W1 = (DFI_TRAINING_COMPLETE | DFI_RDLVL_EN) ? DFI_RDDATA_VALID_INTERNAL : dfi_rddata_en_p0_3;
assign DFI_RDDATA_VALID_W2 = (DFI_TRAINING_COMPLETE | DFI_RDLVL_EN) ? DFI_RDDATA_VALID_INTERNAL : dfi_rddata_en_p0_3;
assign DFI_RDDATA_VALID_W3 = (DFI_TRAINING_COMPLETE | DFI_RDLVL_EN) ? DFI_RDDATA_VALID_INTERNAL : dfi_rddata_en_p0_3;

// x0F FOR TWO LANES
// assign IOG_WRDATA_MASK_P0 = DFI_INIT_COMPLETE ? DFI_WRDATA_MASK_P0 : {(IOG_DQS_LANES*2){1'b1}};
// assign IOG_WRDATA_MASK_P1 = DFI_INIT_COMPLETE ? DFI_WRDATA_MASK_P1 : {(IOG_DQS_LANES*2){1'b1}};
// assign IOG_WRDATA_MASK_P2 = DFI_INIT_COMPLETE ? DFI_WRDATA_MASK_P2 : {(IOG_DQS_LANES*2){1'b0}};
// assign IOG_WRDATA_MASK_P3 = DFI_INIT_COMPLETE ? DFI_WRDATA_MASK_P3 : {(IOG_DQS_LANES*2){1'b0}};

assign IOG_ADDRESS_P0 = DFI_INIT_COMPLETE ? DFI_ADDRESS_P0_WIRE : 20'hFFFFF;
assign IOG_ADDRESS_P1 = DFI_INIT_COMPLETE ? DFI_ADDRESS_P1_WIRE : 20'h00000;
assign IOG_ADDRESS_P2 = DFI_INIT_COMPLETE ? DFI_ADDRESS_P2_WIRE : 20'hFFFFF;
assign IOG_ADDRESS_P3 = DFI_INIT_COMPLETE ? DFI_ADDRESS_P3_WIRE : 20'h00000;



/// Components_End <<<---


endmodule

