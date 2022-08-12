
/// Header_Start --->>>



/// Header_End <<<---


/// I/O_Start --->>>

// (1)Perform write leveling when requested by NWL controller
// (2)Perform read gate training
// (3.1)Provide per DQ bit read training within each lane i.e. line up all the DQ bits within each lane to each other
// (3.2)Provide read training - centre DQS in each lane
// (4)Perform Vref training
// (5)Perform clock alignment
// (6)Instantiate an APB interface and provide access to read registers (trauning values)
// (7)Monitor variables to decide on retraining and request if required

module TIP_CTRL_BLK( SCLK,
                reset_n,
                dfi_init_complete,
                dfi_init_start,
                dfi_rdlvl_cs_0_n,
                dfi_rdlvl_cs_1_n,
                dfi_wrlvl_cs_0_n,
                dfi_wrlvl_cs_1_n,
                dfi_rddata_cs_0_n_p0,
                dfi_rddata_cs_0_n_p1,
                dfi_rddata_cs_0_n_p2,
                dfi_rddata_cs_0_n_p3,
                dfi_wrdata_cs_0_n_p0,
                dfi_wrdata_cs_0_n_p1,
                dfi_wrdata_cs_0_n_p2,
                dfi_wrdata_cs_0_n_p3,
                dfi_wrdata_cs_1_n_p0,
                dfi_wrdata_cs_1_n_p1,
                dfi_wrdata_cs_1_n_p2,
                dfi_wrdata_cs_1_n_p3,
                dfi_rddata_cs_1_n_p0,
                dfi_rddata_cs_1_n_p1,
                dfi_rddata_cs_1_n_p2,
                dfi_rddata_cs_1_n_p3,
                dfi_rdlvl_en,
                dfi_rdlvl_gate_en,
                dfi_rdlvl_resp,
                dfi_training_complete,
                dfi_wrdata_en_p0,
                dfi_wrdata_en_p1,
                dfi_wrdata_en_p2,
                dfi_wrdata_en_p3,
                dfi_wrlvl_en,
                dfi_wrlvl_resp,
                dfi_wrlvl_strobe,
                paddr,
                penable,
                prdata,
                pready,
                psel,
                pwdata,
                pwrite,
                code_update,
                dll_dly_diff,
                loadphs_b,
                vco_phsel_bclk_sel,
                vco_phsel_refclk_sel,
                vco_phsel_rotate,
                vref_direction,
                vref_move,
                vref_out_of_range,
                vref_reload,
                training_pattern,
                odt_dyn_lane,
                bclk_eye_monitor_clr_flags,
                bclk_eye_monitor_early,
                bclk_eye_monitor_late,
                burst_detect,
                clk_sel,
                clock_pause,
                delay_line_sel_rd,
                direction,
                iog_oe_p0,
                iog_oe_p1,
                iog_oe_p2,
                iog_oe_p3,
                dqs_oe_p0,
                dqs_oe_p1,
                dqs_oe_p2,
                dqs_oe_p3,
                dm_oe_p0,
                dm_oe_p1,
                dm_oe_p2,
                dm_oe_p3,
                load,
                move,
                refclk_eye_monitor_clr_flags,
                refclk_eye_monitor_early,
                refclk_eye_monitor_late,
                rx_out_of_range,
                two_ranks,
                tx_out_of_range,
                dfi_ctrlupd_req,
                dfi_rddata,
                dfi_rddata_en_p0,
                dfi_rddata_en_p1,
                dfi_rddata_en_p2,
                dfi_rddata_en_p3,
                dfi_rddata_valid,
                pad_rddata,
                gt_pause,
                iog_rddata_en_p0_p,
                iog_rddata_en_p0_n,
                iog_rddata_en_p1_p,
                iog_rddata_en_p1_n,
                iog_rddata_en_p2_p,
                iog_rddata_en_p2_n,
                iog_rddata_en_p3_p,
                iog_rddata_en_p3_n,
                select_rank_1,
                rd_training_error,
                // AS: Added these signals for additional training steps
                // DQSW/DQSW270 training
                vco_phsel_bclk90_sel,
                dqsw_eye_monitor_clr_flags,
                dqsw_eye_monitor_early,
                dqsw_eye_monitor_late,
                dqsw270_eye_monitor_clr_flags,
                dqsw270_eye_monitor_early,
                dqsw270_eye_monitor_late,
                vco_phsinit_refclk,
                vco_phsinit_bclk,
                vco_phsinit_bclk90,
                dqsw_delay_line_load,
                dqsw_delay_line_move,
                dqsw_delay_line_direction,
                dqsw270_delay_line_load,
                dqsw270_delay_line_move,
                dqsw270_delay_line_direction,
                // REFCLK training
                refclk_delay_line_load,
                refclk_delay_line_move,
                refclk_delay_line_direction,
                cmd_eye_monitor_clr_flags,
                cmd_eye_monitor_early,
                cmd_eye_monitor_late,
                cmd_delay_line_load,
                cmd_delay_line_move,
                cmd_delay_line_direction,
                // AS: added wl_pause
                wl_pause,
                // AS: added DQSW control
                dqsw_sela,
                cmd_oe,
                cmd_delay_line_move_trn,
                refclk_igear_rx8,
                dqsw270_igear_rx8,
                dq_dqs_block_fifo,
				        apb_block_fifo,
                
                // AS: added these controls
                dqsw_delay_line_oor,
                dqsw270_delay_line_oor,
                
                  // Gian Edit - Merging new tb to new one for new gate training
                  //txdelay_direction,
                  //txdelay_load,
                  //txdelay_move,
                  //txdelay_oor
                // AS: removed txdly* signals for internal mux'ing
                // AS: ADDED NEW PORTS FOR SAR http://bugzilla/show_bug.cgi?id=85957
                // IN ORDER TO OBVIATE THE USE OF EYE MONITOR FLAGS
                // EYE MONITOR FLAGS REMAIN FOR LEGACY PURPOSES / IN CASE
                // SILICON FIX COMES IN FOR REV D
                bclk_igear_rx,
                cmd_igear_rx8,
                dqsw270_igear_rx,
                dqsw_igear_rx,
                cmd_reset_lane,
                // AS: ADDED SKIP_* SIGNALS
                skip_dqsw_trn,
                skip_bclk_trn,
                skip_ca_trn,
                skip_wrlvl_trn,
                skip_rdlvl_trn,
                BCLK_VCOPHS_OFFSET,
                ADDR_VCOPHS_OFFSET,
                WRLVL_TAP_OFFSET,
                // AS: Added VREF training signals
                cal_init_mr_w_req,
                cal_init_mr_addr,
                cal_init_mr_wr_data,
                cal_init_mr_wr_mask,
                cal_init_ack,
                skip_vref_training,
                pclk,
                VREF_MR6_VALUE,
                cal_init_cs,
                ctrlr_ready_in,
                ctrlr_ready_out,
                iog_dq_txdata_in,
                iog_dq_txdata_out,
                iog_dm_txdata_in,
                iog_dm_txdata_out,
                cal_l_r_req,  
                cal_l_w_req,  
                cal_l_datain, 
                cal_l_dm_in,  
                cal_l_busy,   
                cal_l_d_req,  
                cal_l_dataout,
                cal_l_r_valid,
                cal_select,
                ADDR_WAIT_COUNT,
                WRCAL_WRITE_COUNTER_VALUE,
                RDGATE_MIN_READS_THRESHOLD
                
);

parameter IOG_DQS_LANES = 2;
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

// AS: port instead of parameter
//parameter [6:0] VREF_MR6_VALUE  = 0;

input          SCLK;
input          reset_n;

// Port: NWL

output         dfi_init_complete; // Initialization signal. Also used during frequency change requests.
wire           dfi_init_complete; // Initialization signal. Also used during frequency change requests.
input          dfi_init_start; // Initialization signal. Also used during frequency change requests.
input          dfi_rdlvl_cs_0_n; // Read level training chip select
input          dfi_rdlvl_cs_1_n; // Read level training chip select
input          dfi_wrlvl_cs_0_n; // Write level training chip select
input          dfi_wrlvl_cs_1_n; // Write level training chip select

input          dfi_rddata_cs_0_n_p0; // Read data data path chip select
input          dfi_rddata_cs_0_n_p1; // Read data data path chip select
input          dfi_rddata_cs_0_n_p2; // Read data data path chip select
input          dfi_rddata_cs_0_n_p3; // Read data data path chip select
input          dfi_rddata_cs_1_n_p0; // Read data data path chip select
input          dfi_rddata_cs_1_n_p1; // Read data data path chip select
input          dfi_rddata_cs_1_n_p2; // Read data data path chip select
input          dfi_rddata_cs_1_n_p3; // Read data data path chip select

input          dfi_wrdata_cs_0_n_p0; // Write data data path chip select
input          dfi_wrdata_cs_0_n_p1; // Write data data path chip select
input          dfi_wrdata_cs_0_n_p2; // Write data data path chip select
input          dfi_wrdata_cs_0_n_p3; // Write data data path chip select
input          dfi_wrdata_cs_1_n_p0; // Write data data path chip select
input          dfi_wrdata_cs_1_n_p1; // Write data data path chip select
input          dfi_wrdata_cs_1_n_p2; // Write data data path chip select
input          dfi_wrdata_cs_1_n_p3; // Write data data path chip select


input          dfi_rdlvl_en;   // Read level enable. Signal used for read levelling. Comes from the NWL controller
input          dfi_rdlvl_gate_en; // Read level gate enable. Signal used for read gate training. Comes from the NWL controller
output [IOG_DQS_LANES-1:0] dfi_rdlvl_resp;
output         dfi_training_complete; // Signifies read training, write levelling, and Vref training is done.
input          dfi_wrdata_en_p0;
input          dfi_wrdata_en_p1;
input          dfi_wrdata_en_p2;
input          dfi_wrdata_en_p3;
input          dfi_wrlvl_en;   // Write level enable. Signal used for write levelling. Comes from the NWL controller
output [IOG_DQS_LANES-1:0] dfi_wrlvl_resp;
input          dfi_wrlvl_strobe; // Strobe signal used for write leveling. Comes from the NWL controller
output [IOG_DQS_LANES-1:0]  rd_training_error;

// Port: APB

input [15:0]   paddr;          // APB address to the APB interface
input          penable;        // APB enable signal  to the APB interface
output [7:0]   prdata;         // APB read data signal from the APB interface
output         pready;         // APB PREADY signal from the APB interface
input          psel;           // APB select signal  to the APB interface
input [7:0]    pwdata;         // APB write data signal to the interface
input          pwrite;         // APB write signal  to the APB interface
input          pclk;           // APB clock (added for performance porpoises)

// Port: System

output         code_update;
input          dll_dly_diff;

// AS: add possibility of second BCLK trainer
// (widened BCLK training bus)
//output         loadphs_b;
//output         vco_phsel_bclk90_sel;
//output         vco_phsel_bclk_sel;
//output         vco_phsel_rotate;
output [NUM_BCLKS-1:0]        loadphs_b;
output [NUM_BCLKS-1:0]        vco_phsel_bclk90_sel;
output [NUM_BCLKS-1:0]        vco_phsel_bclk_sel;
output [NUM_BCLKS-1:0]        vco_phsel_rotate;
output         vco_phsel_refclk_sel;

output         vref_direction;
output         vref_move;
input          vref_out_of_range;
output         vref_reload;

// Port: Config

input [7:0]                 training_pattern;
output [IOG_DQS_LANES-1:0]  odt_dyn_lane;
input [6:0]                 WRLVL_TAP_OFFSET;
input [6:0]                 VREF_MR6_VALUE;

// Port: PHY

output [NUM_BCLKS-1:0]        bclk_eye_monitor_clr_flags; // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_EYE_MONITOR_CLR_FLAGS signals
input  [NUM_BCLKS-1:0]        bclk_eye_monitor_early;
input  [NUM_BCLKS-1:0]        bclk_eye_monitor_late;
input [IOG_DQS_LANES-1:0] burst_detect;
output [IOG_DQS_LANES*3-1:0] clk_sel;
output         clock_pause;
output [IOG_DQS_LANES-1:0] delay_line_sel_rd;
output [IOG_DQS_LANES*9-1:0] direction;
output [IOG_DQS_LANES-1:0] iog_oe_p0;
output [IOG_DQS_LANES-1:0] iog_oe_p1;
output [IOG_DQS_LANES-1:0] iog_oe_p2;
output [IOG_DQS_LANES-1:0] iog_oe_p3;
output [IOG_DQS_LANES-1:0] dqs_oe_p0;
output [IOG_DQS_LANES-1:0] dqs_oe_p1;
output [IOG_DQS_LANES-1:0] dqs_oe_p2;
output [IOG_DQS_LANES-1:0] dqs_oe_p3;
output [IOG_DQS_LANES-1:0] dm_oe_p0;
output [IOG_DQS_LANES-1:0] dm_oe_p1;
output [IOG_DQS_LANES-1:0] dm_oe_p2;
output [IOG_DQS_LANES-1:0] dm_oe_p3;
// AS: for write data path registering
reg    [IOG_DQS_LANES-1:0] iog_oe_p0;
reg    [IOG_DQS_LANES-1:0] iog_oe_p1;
reg    [IOG_DQS_LANES-1:0] iog_oe_p2;
reg    [IOG_DQS_LANES-1:0] iog_oe_p3;
reg    [IOG_DQS_LANES-1:0] dqs_oe_p0;
reg    [IOG_DQS_LANES-1:0] dqs_oe_p1;
reg    [IOG_DQS_LANES-1:0] dqs_oe_p2;
reg    [IOG_DQS_LANES-1:0] dqs_oe_p3;
reg    [IOG_DQS_LANES-1:0] dm_oe_p0;
reg    [IOG_DQS_LANES-1:0] dm_oe_p1;
reg    [IOG_DQS_LANES-1:0] dm_oe_p2;
reg    [IOG_DQS_LANES-1:0] dm_oe_p3;

output [IOG_DQS_LANES*9-1:0] load;
output [IOG_DQS_LANES*9-1:0] move;
output         refclk_eye_monitor_clr_flags;
input          refclk_eye_monitor_early; // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_EYE_MONITOR_EARLY signals
input          refclk_eye_monitor_late; // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_EYE_MONITOR_LATE signals
input [IOG_DQS_LANES*9-1:0] rx_out_of_range;
input          two_ranks;
input [IOG_DQS_LANES*9-1:0] tx_out_of_range;

output  [IOG_DQS_LANES-1:0] gt_pause;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p0_p;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p0_n;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p1_p;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p1_n;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p2_p;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p2_n;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p3_p;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p3_n;

// Gian Edit, merging new bench with old 
// AS: changed these to wire's for musx'in
//output  [IOG_DQS_LANES-1:0] txdelay_direction;
//output  [IOG_DQS_LANES-1:0] txdelay_load;
//output  [IOG_DQS_LANES-1:0] txdelay_move;
wire  [IOG_DQS_LANES-1:0] txdelay_move;
wire  [IOG_DQS_LANES-1:0] txdelay_direction;
wire  [IOG_DQS_LANES-1:0] txdelay_load;
//input [IOG_DQS_LANES-1:0] txdelay_oor;

// Port: NWL_PHY

input          dfi_ctrlupd_req;
input [(IOG_DQS_LANES*64)-1:0]  dfi_rddata;     // Read data bus. This bus transfers read data from the PHY to the
                               // MC.
input          dfi_rddata_en_p0;
input          dfi_rddata_en_p1;
input          dfi_rddata_en_p2;
input          dfi_rddata_en_p3;
input          dfi_rddata_valid;

// Port: PAD

input [IOG_DQS_LANES*8-1:0]   pad_rddata;

wire [15:0]    apb_addr;       // APB address from the levelling block
wire           apb_re;
wire           apb_we;
wire [7:0]     apb_wrdata;
wire [7:0]     debug_rddata;
wire [7:0]     rdlvl_rddata;   // Read level read data from the read level block to the APB interface
wire [6:0]     read_access;
wire [7:0]     vref_rddata;    // Vref read data from the read level block to the APB interface
wire [7:0]     wrlvl_rddata;   // Write level read data from the read level block to the APB interface
wire [7:0]     wrcal_rddata;
wire [7:0]     bclk_rddata;
wire [7:0]     addcmd_rddata;

wire [IOG_DQS_LANES-1:0]   trn_delay_line_sel;

wire apb_ctrl_chip_sel;
wire apb_iog_on;

wire dfi_rddata_cs_0_n;
wire dfi_rddata_cs_1_n;

wire select_rank_1_gt;
output select_rank_1;
wire select_rank_1;

// AS: Added for more IOG signals additional training steps
output  [IOG_DQS_LANES-1:0]              dqsw_eye_monitor_clr_flags;
input   [IOG_DQS_LANES-1:0]              dqsw_eye_monitor_early;
input   [IOG_DQS_LANES-1:0]              dqsw_eye_monitor_late;
output  [IOG_DQS_LANES-1:0]              dqsw270_eye_monitor_clr_flags;
input   [IOG_DQS_LANES-1:0]              dqsw270_eye_monitor_early;
input   [IOG_DQS_LANES-1:0]              dqsw270_eye_monitor_late;
output  [2:0]          vco_phsinit_refclk;
output  [2:0]          vco_phsinit_bclk;
output  [2:0]          vco_phsinit_bclk90;
output  [IOG_DQS_LANES-1:0]              dqsw_delay_line_load;
output  [IOG_DQS_LANES-1:0]              dqsw_delay_line_move;
output  [IOG_DQS_LANES-1:0]              dqsw_delay_line_direction;
output  [IOG_DQS_LANES-1:0]              dqsw270_delay_line_load;
output  [IOG_DQS_LANES-1:0]              dqsw270_delay_line_move;
output  [IOG_DQS_LANES-1:0]              dqsw270_delay_line_direction;

// AS: added for mux'ing between clk training and read gate training
wire  [IOG_DQS_LANES-1:0]              dqsw270_delay_line_load_i;
wire  [IOG_DQS_LANES-1:0]              dqsw270_delay_line_move_i;
wire  [IOG_DQS_LANES-1:0]              dqsw270_delay_line_direction_i;

input [IOG_DQS_LANES-1:0]                dqsw270_delay_line_oor;
input [IOG_DQS_LANES-1:0]                dqsw_delay_line_oor;

                // REFCLK training
output                refclk_delay_line_load;
output                refclk_delay_line_move;
output                refclk_delay_line_direction;
output                cmd_eye_monitor_clr_flags;
input                cmd_eye_monitor_early;
input                cmd_eye_monitor_late;
output                cmd_delay_line_load;
output                cmd_delay_line_move;
output                cmd_delay_line_direction;

//SMG 31/3/16 - adding signal to block out fifo when needed
output [IOG_DQS_LANES-1:0]     dq_dqs_block_fifo;
output [IOG_DQS_LANES-1:0]     apb_block_fifo;

// AS: added wl_pause for write leveling
output [IOG_DQS_LANES-1:0] wl_pause;
wire [IOG_DQS_LANES-1:0] wl_pause;

// AS: added DQSW control
output [IOG_DQS_LANES*8-1:0] dqsw_sela;
wire [IOG_DQS_LANES*8-1:0] dqsw_sela;

output cmd_oe;
wire cmd_oe;

output cmd_delay_line_move_trn;
wire cmd_delay_line_move_trn;

input refclk_igear_rx8;
input [IOG_DQS_LANES-1:0] dqsw270_igear_rx8;

// AS: ADDED NEW PORTS FOR SAR http://bugzilla/show_bug.cgi?id=85957
// IN ORDER TO OBVIATE THE USE OF EYE MONITOR FLAGS
// EYE MONITOR FLAGS REMAIN FOR LEGACY PURPOSES / IN CASE
// SILICON FIX COMES IN FOR REV D
input [4*NUM_BCLKS-1:0]         bclk_igear_rx;
input                           cmd_igear_rx8;
input [IOG_DQS_LANES*2-1:0]     dqsw270_igear_rx;
input [IOG_DQS_LANES*2-1:0]     dqsw_igear_rx;
output                          cmd_reset_lane;

// AS: added pause from DQSW training
wire ct_pause;
wire [IOG_DQS_LANES-1:0] gt_pause_i;

// AS: ADDED SKIP_* SIGNALS
input                           skip_dqsw_trn;
input                           skip_bclk_trn;
input                           skip_ca_trn;
input                           skip_wrlvl_trn;
input                           skip_rdlvl_trn;

// AS: added configuration ports
input [2:0]                     ADDR_VCOPHS_OFFSET;
input [2:0]                     BCLK_VCOPHS_OFFSET;

// AS: added VREF training signals
output                                cal_init_mr_w_req;
output [ 7:0]                         cal_init_mr_addr;
output [17:0]                         cal_init_mr_wr_data;
output [17:0]                         cal_init_mr_wr_mask;
input                                 cal_init_ack;
output [1:0]                          cal_init_cs;
input                                 skip_vref_training;

input ctrlr_ready_in;
output ctrlr_ready_out;

// AS: added 6/8 for write callibration
input  [IOG_DQS_LANES*64-1:0]    iog_dq_txdata_in;
output [IOG_DQS_LANES*64-1:0]    iog_dq_txdata_out;
reg    [IOG_DQS_LANES*64-1:0]    iog_dq_txdata_out;
input  [IOG_DQS_LANES*8-1:0]     iog_dm_txdata_in;
output [IOG_DQS_LANES*8-1:0]     iog_dm_txdata_out;
reg    [IOG_DQS_LANES*8-1:0]     iog_dm_txdata_out;

output                                cal_l_r_req;                // to NWL CTRLR
output                                cal_l_w_req;                // to NWL CTRLR
output [IOG_DQS_LANES*64-1:0]         cal_l_datain;               // to NWL CTRLR
output [IOG_DQS_LANES*8-1:0]          cal_l_dm_in;                // to NWL CTRLR
input                                 cal_l_busy;                 // to NWL CTRLR
input                                 cal_l_d_req;                // to NWL CTRLR
input  [IOG_DQS_LANES*64-1:0]         cal_l_dataout;              // to NWL CTRLR
input                                 cal_l_r_valid;              // to NWL CTRLR  

output                                cal_select;

input [9:0]                           ADDR_WAIT_COUNT;
input [7:0]                           WRCAL_WRITE_COUNTER_VALUE;
input [9:0]                           RDGATE_MIN_READS_THRESHOLD;

/// I/O_End <<<---

// AS: OR'ed ct_pause with gt_pause
// AS: mux dqsw270_* versus txdly_* signals (they use the same IOG)
genvar n;
generate
  for (n=0; n<=IOG_DQS_LANES-1; n=n+1) begin  : gt_pause_assign
    assign gt_pause[n] = ct_pause | gt_pause_i[n];
   
  end
endgenerate





// discreet lane-level controls, to be muxed with write leveling signals
wire  [IOG_DQS_LANES-1:0]              wrdly_delay_line_load;
wire  [IOG_DQS_LANES-1:0]              wrdly_delay_line_move;
wire  [IOG_DQS_LANES-1:0]              wrdly_delay_line_direction;
wire  [IOG_DQS_LANES-1:0]              txdly_delay_line_load;
wire  [IOG_DQS_LANES-1:0]              txdly_delay_line_move;
wire  [IOG_DQS_LANES-1:0]              txdly_delay_line_direction;



// MUX b/w read gate training control and dqsw training control
assign dqsw270_delay_line_load      = (dfi_init_complete == 1'b1) ? txdelay_load       : dqsw270_delay_line_load_i;
assign dqsw270_delay_line_move      = (dfi_init_complete == 1'b1) ? txdelay_move       : dqsw270_delay_line_move_i;    
assign dqsw270_delay_line_direction = (dfi_init_complete == 1'b1) ? txdelay_direction  : dqsw270_delay_line_direction_i;

// AS: added callibration offset signals
wire  [IOG_DQS_LANES*3-1:0]          write_callibration_offset;

wire    [IOG_DQS_LANES-1:0] iog_oe_p0_internal;
wire    [IOG_DQS_LANES-1:0] iog_oe_p1_internal;
wire    [IOG_DQS_LANES-1:0] iog_oe_p2_internal;
wire    [IOG_DQS_LANES-1:0] iog_oe_p3_internal;
wire    [IOG_DQS_LANES-1:0] dqs_oe_p0_internal;
wire    [IOG_DQS_LANES-1:0] dqs_oe_p1_internal;
wire    [IOG_DQS_LANES-1:0] dqs_oe_p2_internal;
wire    [IOG_DQS_LANES-1:0] dqs_oe_p3_internal;
wire    [IOG_DQS_LANES-1:0] dm_oe_p0_internal;
wire    [IOG_DQS_LANES-1:0] dm_oe_p1_internal;
wire    [IOG_DQS_LANES-1:0] dm_oe_p2_internal;
wire    [IOG_DQS_LANES-1:0] dm_oe_p3_internal;
wire    [IOG_DQS_LANES*64-1:0]    iog_dq_txdata_out_internal;
wire    [IOG_DQS_LANES*8-1:0]     iog_dm_txdata_out_internal;

// AS: added cal_select OR
wire select_vref, select_write_callibration;

assign cal_select = select_vref | select_write_callibration;

// AS: added register phase for write data path

//AL extending DQS_OE pulses during write calib

reg    [IOG_DQS_LANES-1:0] dqs_oe_p0_internal_reg;
reg    [IOG_DQS_LANES-1:0] dqs_oe_p1_internal_reg;
reg    [IOG_DQS_LANES-1:0] dqs_oe_p2_internal_reg;
reg    [IOG_DQS_LANES-1:0] dqs_oe_p3_internal_reg;
always @(posedge SCLK or negedge reset_n)
begin : register_write_data_path
  if (!reset_n)
  begin
    iog_oe_p0         <= 0;
    iog_oe_p1         <= 0;
    iog_oe_p2         <= 0;
    iog_oe_p3         <= 0;
    dqs_oe_p0         <= 0;
    dqs_oe_p1         <= 0;
    dqs_oe_p2         <= 0;
    dqs_oe_p3         <= 0;
    dm_oe_p0          <= 0;
    dm_oe_p1          <= 0;
    dm_oe_p2          <= 0;
    dm_oe_p3          <= 0;
    iog_dq_txdata_out <= 0;
    iog_dm_txdata_out <= 0;
  end
  else
  begin
    if (ctrlr_ready_out) begin
        iog_oe_p0         <= iog_oe_p0_internal;
        iog_oe_p1         <= iog_oe_p1_internal;
        iog_oe_p2         <= iog_oe_p2_internal;
        iog_oe_p3         <= iog_oe_p3_internal;
        dqs_oe_p0         <= dqs_oe_p0_internal;
        dqs_oe_p1         <= dqs_oe_p1_internal;
        dqs_oe_p2         <= dqs_oe_p2_internal;
        dqs_oe_p3         <= dqs_oe_p3_internal;
        dm_oe_p0          <= dm_oe_p0_internal;
        dm_oe_p1          <= dm_oe_p1_internal;
        dm_oe_p2          <= dm_oe_p2_internal;
        dm_oe_p3          <= dm_oe_p3_internal;
        iog_dq_txdata_out <= iog_dq_txdata_out_internal;
        if (dfi_init_complete)
        iog_dm_txdata_out <= iog_dm_txdata_out_internal;
        else
        iog_dm_txdata_out <= {IOG_DQS_LANES{8'h0F}};
    end else begin
        //AL:prior to completing write calibration, registering internal OE values
        dqs_oe_p0_internal_reg<=dqs_oe_p0_internal;
        dqs_oe_p1_internal_reg<=dqs_oe_p1_internal;
        dqs_oe_p2_internal_reg<=dqs_oe_p2_internal;
        dqs_oe_p3_internal_reg<=dqs_oe_p3_internal;

        iog_oe_p0         <= iog_oe_p0_internal;
        iog_oe_p1         <= iog_oe_p1_internal;
        iog_oe_p2         <= iog_oe_p2_internal;
        iog_oe_p3         <= iog_oe_p3_internal;

        //AL: extending the OE by 1 cycle by making the output OR the previous cycle with the current.
        dqs_oe_p0         <= dqs_oe_p0_internal|dqs_oe_p2_internal_reg;
        dqs_oe_p1         <= dqs_oe_p1_internal|dqs_oe_p3_internal_reg;
        dqs_oe_p2         <= dqs_oe_p2_internal|dqs_oe_p0_internal;
        dqs_oe_p3         <= dqs_oe_p3_internal|dqs_oe_p1_internal;
        dm_oe_p0          <= dm_oe_p0_internal;
        dm_oe_p1          <= dm_oe_p1_internal;
        dm_oe_p2          <= dm_oe_p2_internal;
        dm_oe_p3          <= dm_oe_p3_internal;
        iog_dq_txdata_out <= iog_dq_txdata_out_internal;
        if (dfi_init_complete)
        iog_dm_txdata_out <= iog_dm_txdata_out_internal;
        else
        iog_dm_txdata_out <= {IOG_DQS_LANES{8'h0F}};
    end
  end
end

/// Components_Start --->>>

// Interface CSRs
// File: APB_IF.v

APB_IF APB_IF( .SCLK(SCLK),
               .reset_n(reset_n),
               .paddr(paddr),
               .penable(penable),
               .prdata(prdata),
               .pready(pready),
               .psel(psel),
               .pwdata(pwdata),
               .pwrite(pwrite),
               .apb_addr(apb_addr),
               .apb_re(apb_re),
               .apb_we(apb_we),
               .apb_wrdata(apb_wrdata),
               .debug_rddata(debug_rddata),
               .rdlvl_rddata(rdlvl_rddata),
               .read_access(read_access),
               .vref_rddata(vref_rddata),
               .wrlvl_rddata(wrlvl_rddata),
               .pclk(pclk),
               // AS: new read registers
               .wrcal_rddata(wrcal_rddata),
               .bclk_rddata(bclk_rddata),
               .addcmd_rddata(addcmd_rddata)
               
                );

// File: TRN_CLK.v

TRN_CLK # (
  .IOG_DQS_LANES(IOG_DQS_LANES),
  .NUM_BCLKS(NUM_BCLKS)
)TRN_CLK( .SCLK(SCLK),
                 .reset_n(reset_n),
                 .code_update(),
                 .loadphs_b(loadphs_b),
                 .vco_phsel_bclk90_sel(vco_phsel_bclk90_sel),
                 .vco_phsel_bclk_sel(vco_phsel_bclk_sel),
                 .vco_phsel_refclk_sel(vco_phsel_refclk_sel),
                 .vco_phsel_rotate(vco_phsel_rotate),
                 .dfi_init_complete(dfi_init_complete),
                 .dfi_init_start(dfi_init_start),
                 .bclk_eye_monitor_clr_flags(bclk_eye_monitor_clr_flags),
                 .bclk_eye_monitor_early(bclk_eye_monitor_early),
                 .bclk_eye_monitor_late(bclk_eye_monitor_late),
                 .clock_pause(clock_pause),
                 .refclk_eye_monitor_clr_flags(refclk_eye_monitor_clr_flags),
                 .refclk_eye_monitor_early(refclk_eye_monitor_early),
                 .refclk_eye_monitor_late(refclk_eye_monitor_late),
                // AS: new ports
                .dqsw_eye_monitor_clr_flags(dqsw_eye_monitor_clr_flags),
                .dqsw_eye_monitor_early(dqsw_eye_monitor_early),
                .dqsw_eye_monitor_late(dqsw_eye_monitor_late),
                .dqsw270_eye_monitor_clr_flags(dqsw270_eye_monitor_clr_flags),
                .dqsw270_eye_monitor_early(dqsw270_eye_monitor_early),
                .dqsw270_eye_monitor_late(dqsw270_eye_monitor_late),
                .vco_phsinit_refclk(vco_phsinit_refclk),
                .vco_phsinit_bclk(vco_phsinit_bclk),
                .vco_phsinit_bclk90(vco_phsinit_bclk90),
                .dqsw_delay_line_load(dqsw_delay_line_load),
                .dqsw_delay_line_move(dqsw_delay_line_move),
                .dqsw_delay_line_direction(dqsw_delay_line_direction),
                .dqsw270_delay_line_load(dqsw270_delay_line_load_i),
                .dqsw270_delay_line_move(dqsw270_delay_line_move_i),
                .dqsw270_delay_line_direction(dqsw270_delay_line_direction_i),
                .refclk_delay_line_load(refclk_delay_line_load),
                .refclk_delay_line_move(refclk_delay_line_move),
                .refclk_delay_line_direction(refclk_delay_line_direction),
                .cmd_eye_monitor_clr_flags(cmd_eye_monitor_clr_flags),
                .cmd_eye_monitor_early(cmd_eye_monitor_early),
                .cmd_eye_monitor_late(cmd_eye_monitor_late),
                .cmd_delay_line_load(cmd_delay_line_load),
                .cmd_delay_line_move(cmd_delay_line_move),
                .cmd_delay_line_direction(cmd_delay_line_direction),
                .cmd_oe(cmd_oe),
                .wrdly_delay_line_load(wrdly_delay_line_load),
                .wrdly_delay_line_move(wrdly_delay_line_move),
                .wrdly_delay_line_direction(wrdly_delay_line_direction),
                .txdly_delay_line_load(txdly_delay_line_load),
                .txdly_delay_line_move(txdly_delay_line_move),
                .txdly_delay_line_direction(txdly_delay_line_direction),
                .pause(ct_pause),
                .cmd_delay_line_move_trn(cmd_delay_line_move_trn),
                .refclk_igear_rx8(refclk_igear_rx8),
                .dqsw270_igear_rx8(dqsw270_igear_rx8),
                // AS: ADDED NEW PORTS FOR SAR http://bugzilla/show_bug.cgi?id=85957
                // IN ORDER TO OBVIATE THE USE OF EYE MONITOR FLAGS
                // EYE MONITOR FLAGS REMAIN FOR LEGACY PURPOSES / IN CASE
                // SILICON FIX COMES IN FOR REV D
                .bclk_igear_rx(bclk_igear_rx),
                .cmd_igear_rx8(cmd_igear_rx8),
                .dqsw270_igear_rx(dqsw270_igear_rx),
                .dqsw_igear_rx(dqsw_igear_rx),
                .cmd_reset_lane(cmd_reset_lane),
                // AS: ADDED SKIP SIGNALS (TRN_CLK)
                .skip_dqsw_trn(skip_dqsw_trn),
                .skip_bclk_trn(skip_bclk_trn),
                .skip_ca_trn(skip_ca_trn),
                // AS: ADDED CONFIGURATION PORTS
                .ADDR_VCOPHS_OFFSET(ADDR_VCOPHS_OFFSET),
                .BCLK_VCOPHS_OFFSET(BCLK_VCOPHS_OFFSET),
                // AS: added APB signals
                .apb_addr(apb_addr),
                .bclk_rddata(bclk_rddata),
                .addcmd_rddata(addcmd_rddata),
                .ADDR_WAIT_COUNT(ADDR_WAIT_COUNT)
                
                 );

// if dll_dly_diff asserts, wait for next refresh and request a code_update
// File: DLL_MON.v

DLL_MON DLL_MON( .SCLK(SCLK),
                 .reset_n(reset_n),
                 .code_update(code_update),
                 .dll_dly_diff(dll_dly_diff),
                 .dfi_ctrlupd_req(dfi_ctrlupd_req) );

// Perform read gate training
// Perform per-bit dq alignment within each lane
// Perform dqs centering on reads
// File: LEVELLING.v

//defparam LEVELLING.IOG_DQS_LANES = IOG_DQS_LANES;
//defparam LEVELLING.IOG_DQS_LANES_9 = IOG_DQS_LANES_9;
//defparam LEVELLING.IOG_DQS_LANES_3 = IOG_DQS_LANES_3;
//
//defparam LEVELLING.IOG_DQ_WIDTH_L0 = IOG_DQ_WIDTH_L0;
//defparam LEVELLING.IOG_DQ_WIDTH_L1 = IOG_DQ_WIDTH_L1;
//defparam LEVELLING.IOG_DQ_WIDTH_L2 = IOG_DQ_WIDTH_L2;
//defparam LEVELLING.IOG_DQ_WIDTH_L3 = IOG_DQ_WIDTH_L3;
//defparam LEVELLING.IOG_DQ_WIDTH_L4 = IOG_DQ_WIDTH_L4;
//defparam LEVELLING.IOG_DQ_WIDTH_L5 = IOG_DQ_WIDTH_L5;
//defparam LEVELLING.IOG_DQ_WIDTH_L6 = IOG_DQ_WIDTH_L6;
//defparam LEVELLING.IOG_DQ_WIDTH_L7 = IOG_DQ_WIDTH_L7;
//defparam LEVELLING.IOG_DQ_WIDTH_L8 = IOG_DQ_WIDTH_L8;

// AS: added SKIP signals in instantiation:
// - skip_wrlvl_trn
// - skip_lvl_trn
// (ties off _en and _resp signals when skip_*
//  are asserted)
wire dfi_rdlvl_en_i;
wire dfi_wrlvl_en_i;
wire [IOG_DQS_LANES-1:0] dfi_rdlvl_resp_i;
wire [IOG_DQS_LANES-1:0] dfi_wrlvl_resp_i;

assign dfi_rdlvl_en_i = skip_rdlvl_trn ? 1'b0 : dfi_rdlvl_en;
assign dfi_wrlvl_en_i = skip_wrlvl_trn ? 1'b0 : dfi_wrlvl_en;

assign dfi_rdlvl_resp = skip_rdlvl_trn ? {IOG_DQS_LANES{1'b1}} : dfi_rdlvl_resp_i;
assign dfi_wrlvl_resp = skip_wrlvl_trn ? {IOG_DQS_LANES{1'b1}} : dfi_wrlvl_resp_i;

LEVELLING # (
  .IOG_DQS_LANES(IOG_DQS_LANES),
  .IOG_DQ_WIDTH_L0(IOG_DQ_WIDTH_L0),
  .IOG_DQ_WIDTH_L1(IOG_DQ_WIDTH_L1),
  .IOG_DQ_WIDTH_L2(IOG_DQ_WIDTH_L2),
  .IOG_DQ_WIDTH_L3(IOG_DQ_WIDTH_L3),
  .IOG_DQ_WIDTH_L4(IOG_DQ_WIDTH_L4),
  .IOG_DQ_WIDTH_L5(IOG_DQ_WIDTH_L5),
  .IOG_DQ_WIDTH_L6(IOG_DQ_WIDTH_L6),
  .IOG_DQ_WIDTH_L7(IOG_DQ_WIDTH_L7),
  .IOG_DQ_WIDTH_L8(IOG_DQ_WIDTH_L8)
) LEVELLING( .SCLK(SCLK),
                     .reset_n(reset_n),
                     .apb_addr(apb_addr),
                     .apb_re(apb_re),
                     .apb_we(apb_we),
                     .apb_wrdata(apb_wrdata),
                     .debug_rddata(debug_rddata),
                     .rdlvl_rddata(rdlvl_rddata),
                     .read_access(read_access),
                     .vref_rddata(vref_rddata),
                     .wrlvl_rddata(wrlvl_rddata),
                     //.dfi_rdlvl_en(dfi_rdlvl_en),
                     .dfi_rdlvl_en(dfi_rdlvl_en_i),
                     .dfi_rdlvl_gate_en(dfi_rdlvl_gate_en),
                     //.dfi_rdlvl_resp(dfi_rdlvl_resp),
                     .dfi_rdlvl_resp(dfi_rdlvl_resp_i),
                     .dfi_training_complete(dfi_training_complete),
                     //.dfi_wrlvl_en(dfi_wrlvl_en),
                     .dfi_wrlvl_en(dfi_wrlvl_en_i),
                     //.dfi_wrlvl_resp(dfi_wrlvl_resp),
                     .dfi_wrlvl_resp(dfi_wrlvl_resp_i),
                     .dfi_wrlvl_strobe(dfi_wrlvl_strobe),
                     .training_pattern(training_pattern),
                     .vref_direction(vref_direction),
                     .vref_move(vref_move),
                     .vref_out_of_range(vref_out_of_range),
                     .vref_reload(vref_reload),
                     .burst_detect(burst_detect),
                     .clk_sel(clk_sel),
                     .direction(direction),
                     .load(load),
                     .move(move),
                     .wl_pause(wl_pause),
                     .rx_out_of_range(rx_out_of_range),
                     .two_ranks(two_ranks),
                     .tx_out_of_range(tx_out_of_range),
                     .dfi_rddata(dfi_rddata),
                     .dfi_rddata_en_p0(dfi_rddata_en_p0),
                     .dfi_rddata_en_p1(dfi_rddata_en_p1),
                     .dfi_rddata_en_p2(dfi_rddata_en_p2),
                     .dfi_rddata_en_p3(dfi_rddata_en_p3),
                     .dfi_rddata_valid(dfi_rddata_valid),
                     .dfi_rdlvl_cs_0_n(dfi_rdlvl_cs_0_n),
                     .dfi_rdlvl_cs_1_n(dfi_rdlvl_cs_1_n),
                     .dfi_wrlvl_cs_0_n(dfi_wrlvl_cs_0_n),
                     .dfi_wrlvl_cs_1_n(dfi_wrlvl_cs_1_n),
                     .dfi_rddata_cs_0_n(dfi_rddata_cs_0_n),
                     .dfi_rddata_cs_1_n(dfi_rddata_cs_1_n),
                     .pad_rddata(pad_rddata),
                     .trn_delay_line_sel(trn_delay_line_sel),
                     .delay_line_sel_rd(delay_line_sel_rd),
                     .apb_ctrl_chip_sel(apb_ctrl_chip_sel),							   
                     .apb_iog_on(apb_iog_on),
                     .gt_pause(gt_pause_i),
                     .iog_rddata_en_p0_p(iog_rddata_en_p0_p),
                     .iog_rddata_en_p0_n(iog_rddata_en_p0_n),
                     .iog_rddata_en_p1_p(iog_rddata_en_p1_p),
                     .iog_rddata_en_p1_n(iog_rddata_en_p1_n),
                     .iog_rddata_en_p2_p(iog_rddata_en_p2_p),
                     .iog_rddata_en_p2_n(iog_rddata_en_p2_n),
                     .iog_rddata_en_p3_p(iog_rddata_en_p3_p),
                     .iog_rddata_en_p3_n(iog_rddata_en_p3_n),
                     .select_rank_1_gt(select_rank_1_gt),
                     // AS: added output of dqsw register
                     // AS: added dfi_init_complete for mux'ing purposes
                     // AS: added dqsw/270 controls for mux'ing
                     .rd_training_error(rd_training_error),
                     .dqsw_sela(dqsw_sela),
                     .dfi_init_complete(dfi_init_complete),
                     .wrdly_delay_line_load(wrdly_delay_line_load),
                     .wrdly_delay_line_move(wrdly_delay_line_move),
                     .wrdly_delay_line_direction(wrdly_delay_line_direction),
                     .txdly_delay_line_load(txdly_delay_line_load),
                     .txdly_delay_line_move(txdly_delay_line_move),
                     .txdly_delay_line_direction(txdly_delay_line_direction),
                     .dq_dqs_block_fifo(dq_dqs_block_fifo),
                     .apb_block_fifo(apb_block_fifo),

                          // Gian Edit. Merging of new bench to old one for new gate training
                          // AS: swapped out the oor signal
                          .txdelay_direction(txdelay_direction),
                          .txdelay_load(txdelay_load),
                          .txdelay_move(txdelay_move),
                          .txdelay_oor(dqsw270_delay_line_oor),
                          .WRLVL_TAP_OFFSET(WRLVL_TAP_OFFSET),
                          .RDGATE_MIN_READS_THRESHOLD(RDGATE_MIN_READS_THRESHOLD)
);

// Transfer output enable from the DFI interface to the IOG. Inserting required delays.
// File: PHY_SIG_MOD.v

//defparam PHY_SIG_MOD.IOG_DQS_LANES = IOG_DQS_LANES;

PHY_SIG_MOD # (
  .IOG_DQS_LANES(IOG_DQS_LANES)
) PHY_SIG_MOD( .SCLK(SCLK),
					.reset_n(reset_n),
					.dfi_rdlvl_en(dfi_rdlvl_en),
					.dfi_rdlvl_gate_en(dfi_rdlvl_gate_en),
					.dfi_wrdata_en_p0(dfi_wrdata_en_p0),
					.dfi_wrdata_en_p1(dfi_wrdata_en_p1),
					.dfi_wrdata_en_p2(dfi_wrdata_en_p2),
					.dfi_wrdata_en_p3(dfi_wrdata_en_p3),
					.dfi_wrlvl_en(dfi_wrlvl_en),
					.trn_delay_line_sel(trn_delay_line_sel),
					.iog_oe_p0(iog_oe_p0_internal),
					.iog_oe_p1(iog_oe_p1_internal),
					.iog_oe_p2(iog_oe_p2_internal),
					.iog_oe_p3(iog_oe_p3_internal),
					.dqs_oe_p0(dqs_oe_p0_internal),
					.dqs_oe_p1(dqs_oe_p1_internal),
					.dqs_oe_p2(dqs_oe_p2_internal),
					.dqs_oe_p3(dqs_oe_p3_internal),
          .dm_oe_p0(dm_oe_p0_internal),
          .dm_oe_p1(dm_oe_p1_internal),
          .dm_oe_p2(dm_oe_p2_internal),
          .dm_oe_p3(dm_oe_p3_internal),
					.dfi_rddata_cs_0_n_p0(dfi_rddata_cs_0_n_p0),
					.dfi_rddata_cs_0_n_p1(dfi_rddata_cs_0_n_p1),
					.dfi_rddata_cs_0_n_p2(dfi_rddata_cs_0_n_p2),
					.dfi_rddata_cs_0_n_p3(dfi_rddata_cs_0_n_p3),
					.dfi_rddata_cs_1_n_p0(dfi_rddata_cs_1_n_p0),
					.dfi_rddata_cs_1_n_p1(dfi_rddata_cs_1_n_p1),
					.dfi_rddata_cs_1_n_p2(dfi_rddata_cs_1_n_p2),
					.dfi_rddata_cs_1_n_p3(dfi_rddata_cs_1_n_p3),
          .dfi_wrdata_cs_0_n_p0(dfi_wrdata_cs_0_n_p0),
          .dfi_wrdata_cs_0_n_p1(dfi_wrdata_cs_0_n_p1),
          .dfi_wrdata_cs_0_n_p2(dfi_wrdata_cs_0_n_p2),
          .dfi_wrdata_cs_0_n_p3(dfi_wrdata_cs_0_n_p3),
          .dfi_wrdata_cs_1_n_p0(dfi_wrdata_cs_1_n_p0),
          .dfi_wrdata_cs_1_n_p1(dfi_wrdata_cs_1_n_p1),
          .dfi_wrdata_cs_1_n_p2(dfi_wrdata_cs_1_n_p2),
          .dfi_wrdata_cs_1_n_p3(dfi_wrdata_cs_1_n_p3),
					.dfi_rddata_cs_0_n(dfi_rddata_cs_0_n),
					.dfi_rddata_cs_1_n(dfi_rddata_cs_1_n),
					.apb_ctrl_chip_sel(apb_ctrl_chip_sel),							   
					.apb_iog_on(apb_iog_on),
					.odt_dyn_lane(odt_dyn_lane),
					.dfi_rddata_en_p3(dfi_rddata_en_p3), //earliest guaranteed entry to start odt_dyn_lane with
					.iog_rddata_en_p0_p(iog_rddata_en_p0_p), //latest guaranteed entry to finish odt_dyn_lane with
					.select_rank_1_gt(select_rank_1_gt),
					.select_rank_1(select_rank_1),
          .dfi_init_complete(dfi_init_complete),
          .write_callibration_offset(write_callibration_offset),
          .iog_dq_txdata_in(iog_dq_txdata_in),
          .iog_dq_txdata_out(iog_dq_txdata_out_internal),
          .iog_dm_txdata_in(iog_dm_txdata_in),
          .iog_dm_txdata_out(iog_dm_txdata_out_internal)
					);

// AS: added DDR4 vref training block
// TO-DO, optionally skip this for DDR3?
// AS: make MR6 value a port instead of parameter
//ddr4_vref # (
//  .VREF_MR6_VALUE(VREF_MR6_VALUE)
//  ) ddr4_vref_trainer (


wire vref_complete;
ddr4_vref ddr4_vref_trainer (

    .SCLK(SCLK),
    .reset_n(reset_n),
    .training_complete(ctrlr_ready_in),
    .ddr4_vref_complete(vref_complete),
    .cal_init_mr_w_req(cal_init_mr_w_req),
    .cal_init_mr_addr(cal_init_mr_addr),
    .cal_init_mr_wr_data(cal_init_mr_wr_data),
    .cal_init_mr_wr_mask(cal_init_mr_wr_mask),
    .cal_init_ack(cal_init_ack),
    .skip_vref_training(skip_vref_training),
    .VREF_MR6_VALUE(VREF_MR6_VALUE),
    .cal_init_cs(cal_init_cs),
    .select(select_vref)
);

// AS: added write callibration module
// hooks into top-level for NWL (cal_l_* bus)
// and PHY_SIG_MOD (write_callibration_offset)
write_callibrator # (
  .IOG_DQS_LANES(IOG_DQS_LANES)
) u_write_callibrator (
  .sclk(SCLK),
  .reset_n(reset_n),
  .dfi_ctrlr_ready(vref_complete),         
  .cal_l_r_req(cal_l_r_req),             
  .cal_l_w_req(cal_l_w_req),             
  .cal_l_datain(cal_l_datain),            
  .cal_l_dm_in(cal_l_dm_in),             
  .cal_l_busy(cal_l_busy),              
  .cal_l_d_req(cal_l_d_req),             
  .cal_l_dataout(cal_l_dataout),           
  .cal_l_r_valid(cal_l_r_valid),           
  .write_callibration_offset(write_callibration_offset),
  .select(select_write_callibration),
  .write_callibration_done(ctrlr_ready_out),
  // AS: added APB signals
  .apb_addr(apb_addr),
  .wrcal_rddata(wrcal_rddata),
  .WRITE_COUNTER_VALUE(WRCAL_WRITE_COUNTER_VALUE)
);

/// Components_End <<<---


endmodule

