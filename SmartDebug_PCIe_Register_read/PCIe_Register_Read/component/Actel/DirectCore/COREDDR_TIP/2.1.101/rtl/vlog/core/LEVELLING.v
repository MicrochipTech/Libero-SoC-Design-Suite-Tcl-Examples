
/// Header_Start --->>>



/// Header_End <<<---


/// I/O_Start --->>>

// Perform read gate training
// Perform per-bit dq alignment within each lane
// Perform dqs centering on reads

module LEVELLING( SCLK,
                  reset_n,
                  apb_addr,
                  apb_we,
                  apb_wrdata,
                  rdlvl_rddata,
                  vref_rddata,
                  wrlvl_rddata,
                  debug_rddata,
                  dfi_rdlvl_en,
                  dfi_rdlvl_gate_en,
                  dfi_rdlvl_resp,
                  dfi_training_complete,
                  dfi_wrlvl_en,
                  dfi_wrlvl_resp,
                  dfi_wrlvl_strobe,
                  training_pattern,
                  vref_direction,
                  vref_move,
                  vref_out_of_range,
                  vref_reload,
                  burst_detect,
                  clk_sel,
                  direction,
                  load,
                  move,
                  wl_pause,
                  rx_out_of_range,
                  two_ranks,
                  tx_out_of_range,
                  dfi_rddata,
                  dfi_rddata_en_p0,
                  dfi_rddata_en_p1,
                  dfi_rddata_en_p2,
                  dfi_rddata_en_p3,
                  dfi_rddata_valid,
                  dfi_rdlvl_cs_0_n,
                  dfi_rdlvl_cs_1_n,
                  dfi_wrlvl_cs_0_n,
                  dfi_wrlvl_cs_1_n,
                  dfi_rddata_cs_0_n,
                  dfi_rddata_cs_1_n,
                  pad_rddata,
                  apb_re,
                  read_access,
                  trn_delay_line_sel,
                  delay_line_sel_rd,
                  apb_ctrl_chip_sel,
                  apb_iog_on,
                  gt_pause,
                  iog_rddata_en_p0_p,
                  iog_rddata_en_p0_n,
                  iog_rddata_en_p1_p,
                  iog_rddata_en_p1_n,
                  iog_rddata_en_p2_p,
                  iog_rddata_en_p2_n,
                  iog_rddata_en_p3_p,
                  iog_rddata_en_p3_n,
                  select_rank_1_gt,
                  rd_training_error,
                  // AS: added DQSW control
                  dqsw_sela,
                  dfi_init_complete,
                  wrdly_delay_line_load,
                  wrdly_delay_line_move,
                  wrdly_delay_line_direction,
                  txdly_delay_line_load,
                  txdly_delay_line_move,
                  txdly_delay_line_direction,
                  //SMG 31/3/16
                  dq_dqs_block_fifo,
                  apb_block_fifo,
                  // Gian Edit - Merging new tb to new one for new gate training
                  txdelay_direction,
                  txdelay_load,
                  txdelay_move,
                  txdelay_oor,
                  WRLVL_TAP_OFFSET,
                  RDGATE_MIN_READS_THRESHOLD
				  );

parameter IOG_DQS_LANES = 9; // Number of Lanes
//parameter IOG_DQS_LANES_9 = IOG_DQS_LANES*9; // Derived parameter from IOG_DQS_LANES
//parameter IOG_DQS_LANES_3 = IOG_DQS_LANES*3; // Derived parameter from IOG_DQS_LANES

parameter [3:0] IOG_DQ_WIDTH_L0 = 8;
parameter [3:0] IOG_DQ_WIDTH_L1 = 8;
parameter [3:0] IOG_DQ_WIDTH_L2 = 8;
parameter [3:0] IOG_DQ_WIDTH_L3 = 8;
parameter [3:0] IOG_DQ_WIDTH_L4 = 8;
parameter [3:0] IOG_DQ_WIDTH_L5 = 8;
parameter [3:0] IOG_DQ_WIDTH_L6 = 8;
parameter [3:0] IOG_DQ_WIDTH_L7 = 8;
parameter [3:0] IOG_DQ_WIDTH_L8 = 8;

input          SCLK;
input          reset_n;

// Port: APB_port

input [15:0]   apb_addr;       // Internal APB address
input          apb_we;
input          apb_re;
input [6:0]    read_access;
input [7:0]    apb_wrdata;
output [7:0]   rdlvl_rddata;   // Read level read data from the read level block to the APB interface
output [7:0]   vref_rddata;    // Vref read data from the read level block to the APB interface
output [7:0]   wrlvl_rddata;   // Write level read data from the read level block to the APB interface
output [7:0]   debug_rddata;


// Port: NWL

input          dfi_rdlvl_en;   // Read level enable. Signal used for read levelling. Comes from the NWL controller
input          dfi_rdlvl_gate_en; // Read level gate enable. Signal used for read gate training. Comes from the NWL controller
output [IOG_DQS_LANES-1:0]   dfi_rdlvl_resp; // Read training response signal. Indicates that the PHY is done with read training.
output         dfi_training_complete; // Signifies read training, write levelling, and Vref training is done.
input          dfi_wrlvl_en;   // Write level enable. Signal used for write levelling. Comes from the NWL controller
output [IOG_DQS_LANES-1:0]   dfi_wrlvl_resp; // Write level response signal. Indicates that the PHY is done with write levelling.
input          dfi_wrlvl_strobe; // Strobe signal used for write leveling. Comes from the NWL controller
output [IOG_DQS_LANES-1:0]  rd_training_error; //output to say an error occured. signaled at same time as dfi_rdlvl_resp then cleared
// Port: Config

input [7:0]    training_pattern;
input [6:0]    WRLVL_TAP_OFFSET;

// Port: System

output         vref_direction;
output         vref_move;
input          vref_out_of_range;
output         vref_reload;

// Port: PHY

input [IOG_DQS_LANES-1:0]    burst_detect;
output [(IOG_DQS_LANES*3)-1:0]  clk_sel;
output [(IOG_DQS_LANES*9)-1:0]  direction;      // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_DIRECTION signals
output [(IOG_DQS_LANES*9)-1:0]  load;           // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_LOAD signals
output [(IOG_DQS_LANES*9)-1:0]  move;           // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_MOVE signals
// AS: added wl_pause
output [IOG_DQS_LANES-1:0] wl_pause;
wire [IOG_DQS_LANES-1:0] wl_pause;
input  [(IOG_DQS_LANES*9)-1:0]  rx_out_of_range; // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_OUT_OF_RANGE signals
input          two_ranks;
input  [(IOG_DQS_LANES*9)-1:0]   tx_out_of_range; // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_OUT_OF_RANGE signals

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
output  [IOG_DQS_LANES-1:0] txdelay_direction;
output  [IOG_DQS_LANES-1:0] txdelay_load;
output  [IOG_DQS_LANES-1:0] txdelay_move;
input [IOG_DQS_LANES-1:0] txdelay_oor;
// Port: NWL_PHY

input [(IOG_DQS_LANES*64)-1:0]  dfi_rddata;     // Read data bus. This bus transfers read data from the PHY to the
                               // MC.
input          dfi_rddata_en_p0;
input          dfi_rddata_en_p1;
input          dfi_rddata_en_p2;
input          dfi_rddata_en_p3;
input          dfi_rddata_valid;

// Port: NW_PHY_SIG_MOD
input          dfi_rdlvl_cs_0_n; // Read level training chip select
input          dfi_rdlvl_cs_1_n; // Read level training chip select
input          dfi_wrlvl_cs_0_n; // Write level training chip select
input          dfi_wrlvl_cs_1_n; // Write level training chip select


input          dfi_rddata_cs_0_n; // Read data data path chip select
input          dfi_rddata_cs_1_n; // Read data data path chip select

// Port: PAD

input [IOG_DQS_LANES*8-1:0]   pad_rddata;


wire [IOG_DQS_LANES-1:0]     dfi_rdlvl_resp_internal; // Read training response signal. Indicates that the PHY is done with read training.
wire           do_train_vref;
wire [(IOG_DQS_LANES*9)-1:0]    rd_direction;   // To be used by a renaming module to assign the to the LANEx_IOGy_IOG direction signals 
wire [(IOG_DQS_LANES*9)-1:0]    rd_load;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG load signals
wire [(IOG_DQS_LANES*9)-1:0]    rd_move;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG move signals
wire           vref_training_complete;
wire [IOG_DQS_LANES-1:0]    wr_direction;   // To be used by a renaming module to assign the to the LANEx_IOGy_IOG direction signals
wire [IOG_DQS_LANES-1:0]    wr_load;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG load signals
wire [IOG_DQS_LANES-1:0]    wr_move;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG move signals



wire           dfi_training_complete;

output [IOG_DQS_LANES-1:0] delay_line_sel_rd;
input [IOG_DQS_LANES-1:0] trn_delay_line_sel;

output apb_ctrl_chip_sel;
output apb_iog_on;

output select_rank_1_gt;
wire select_rank_1_gt;

// AS: added DQSW control
output [IOG_DQS_LANES*8-1:0] dqsw_sela;
wire [IOG_DQS_LANES*8-1:0] dqsw_sela;

// AS: added DQSW and DQSW270 input from TRN_CLK block
// in order to mux with the write leveling signals
input [IOG_DQS_LANES-1:0]             wrdly_delay_line_load;
input [IOG_DQS_LANES-1:0]             wrdly_delay_line_move;
input [IOG_DQS_LANES-1:0]             wrdly_delay_line_direction;
input [IOG_DQS_LANES-1:0]             txdly_delay_line_load;
input [IOG_DQS_LANES-1:0]             txdly_delay_line_move;
input [IOG_DQS_LANES-1:0]             txdly_delay_line_direction;

input dfi_init_complete;

//SMG 31/3/16 - adding signal to block out fifo when needed
output [IOG_DQS_LANES-1:0]     dq_dqs_block_fifo;
output [IOG_DQS_LANES-1:0]     apb_block_fifo;
wire [IOG_DQS_LANES-1:0]     apb_pause;
wire  [IOG_DQS_LANES-1:0] gt_pause_pre_mux;

//SMG - Give control over the pause signal to APB after training is complete (As is done with move/load etc)
assign gt_pause = dfi_training_complete ? apb_pause : gt_pause_pre_mux;

//AS: 5/12/17 - adding extra mux for DQSW
wire          apb_ctrl_dqsw_sel;

input [9:0]      RDGATE_MIN_READS_THRESHOLD;

/// I/O_End <<<---



/// Components_Start --->>>

// Perform read gate levelling
// Perform per-bit dq alignment within each lane
// Perform dqs centering on reads
// File: RDLVL.v

//defparam RDLVL.IOG_DQS_LANES = IOG_DQS_LANES;
//defparam RDLVL.IOG_DQS_LANES_9 = IOG_DQS_LANES_9;
//defparam RDLVL.IOG_DQS_LANES_3 = IOG_DQS_LANES_3;
//
//defparam RDLVL.IOG_DQ_WIDTH_L0 = IOG_DQ_WIDTH_L0;
//defparam RDLVL.IOG_DQ_WIDTH_L1 = IOG_DQ_WIDTH_L1;
//defparam RDLVL.IOG_DQ_WIDTH_L2 = IOG_DQ_WIDTH_L2;
//defparam RDLVL.IOG_DQ_WIDTH_L3 = IOG_DQ_WIDTH_L3;
//defparam RDLVL.IOG_DQ_WIDTH_L4 = IOG_DQ_WIDTH_L4;
//defparam RDLVL.IOG_DQ_WIDTH_L5 = IOG_DQ_WIDTH_L5;
//defparam RDLVL.IOG_DQ_WIDTH_L6 = IOG_DQ_WIDTH_L6;
//defparam RDLVL.IOG_DQ_WIDTH_L7 = IOG_DQ_WIDTH_L7;
//defparam RDLVL.IOG_DQ_WIDTH_L8 = IOG_DQ_WIDTH_L8;

RDLVL # (
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
) RDLVL( .SCLK(SCLK),
             .reset_n(reset_n),
             .dfi_rdlvl_en(dfi_rdlvl_en),
             .dfi_rdlvl_gate_en(dfi_rdlvl_gate_en),
             .dfi_rdlvl_resp_internal(dfi_rdlvl_resp_internal),
             .apb_addr(apb_addr),
             .apb_we(apb_we),
             .apb_re(apb_re),
             .apb_wrdata(apb_wrdata),
             .rdlvl_rddata(rdlvl_rddata),
             .rd_direction(rd_direction),
             .rd_load(rd_load),
             .rd_move(rd_move),
             .burst_detect(burst_detect),
             .rx_out_of_range(rx_out_of_range),
             .dfi_rddata(dfi_rddata),
             .dfi_rddata_en_p0(dfi_rddata_en_p0),
             .dfi_rddata_en_p1(dfi_rddata_en_p1),
             .dfi_rddata_en_p2(dfi_rddata_en_p2),
             .dfi_rddata_en_p3(dfi_rddata_en_p3),
             .dfi_rddata_valid(dfi_rddata_valid),
             .dfi_rdlvl_cs_0_n(dfi_rdlvl_cs_0_n),
             .dfi_rdlvl_cs_1_n(dfi_rdlvl_cs_1_n),
             .dfi_rddata_cs_0_n(dfi_rddata_cs_0_n),
             .dfi_rddata_cs_1_n(dfi_rddata_cs_1_n),
             .clk_sel(clk_sel),
             .training_pattern(training_pattern),
             .read_access(read_access[0]),
             .gt_pause(gt_pause_pre_mux),
             .iog_rddata_en_p0_p(iog_rddata_en_p0_p),
             .iog_rddata_en_p0_n(iog_rddata_en_p0_n),
             .iog_rddata_en_p1_p(iog_rddata_en_p1_p),
             .iog_rddata_en_p1_n(iog_rddata_en_p1_n),
             .iog_rddata_en_p2_p(iog_rddata_en_p2_p),
             .iog_rddata_en_p2_n(iog_rddata_en_p2_n),
             .iog_rddata_en_p3_p(iog_rddata_en_p3_p),
             .iog_rddata_en_p3_n(iog_rddata_en_p3_n),
             .select_rank_1_gt(select_rank_1_gt),
             .rd_training_error(rd_training_error),
             .dq_dqs_block_fifo(dq_dqs_block_fifo),

             // Gian Edit. Merging of new bench to old one for new gate training
             .txdelay_direction(txdelay_direction),
             .txdelay_load(txdelay_load),
             .txdelay_move(txdelay_move),
             .txdelay_oor(txdelay_oor),
             .MIN_READS_THRESHOLD(RDGATE_MIN_READS_THRESHOLD)
        
			 );

// Perform write levelling
// File: WRLVL.v

//defparam WRLVL.IOG_DQS_LANES = IOG_DQS_LANES;

WRLVL # (
  .IOG_DQS_LANES(IOG_DQS_LANES)
) WRLVL( .SCLK(SCLK),
             .reset_n(reset_n),
             .dfi_wrlvl_en(dfi_wrlvl_en),
             .dfi_wrlvl_resp(dfi_wrlvl_resp),
             .dfi_wrlvl_strobe(dfi_wrlvl_strobe),
             .wr_direction(wr_direction),
             .wr_load(wr_load),
             .wr_move(wr_move),
             .apb_addr(apb_addr),
             .apb_we(apb_we),
             .apb_wrdata(apb_wrdata),
             .dfi_wrlvl_cs_0_n(dfi_wrlvl_cs_0_n),
             .dfi_wrlvl_cs_1_n(dfi_wrlvl_cs_1_n),
             .wrlvl_rddata(wrlvl_rddata),
             .tx_out_of_range(tx_out_of_range),
             .pause(wl_pause),
             .pad_rddata(pad_rddata),
             .TAP_OFFSET(WRLVL_TAP_OFFSET)
             );

// Perform Vref training
// File: VREF_TR.v
//defparam VREF_TR.IOG_DQS_LANES = IOG_DQS_LANES;
VREF_TR # (
  .IOG_DQS_LANES(IOG_DQS_LANES)
) VREF_TR( .SCLK(SCLK),
                 .reset_n(reset_n),
                 .vref_done(vref_training_complete),
                 .vref_direction(vref_direction),
                 .vref_move(vref_move),
                 .vref_out_of_range(vref_out_of_range),
                 .vref_reload(vref_reload),
                 .apb_addr(apb_addr),
                 .apb_we(apb_we),
                 .apb_wrdata(apb_wrdata),
                 .vref_rddata(vref_rddata),
                 .dfi_rddata(dfi_rddata),
                 .dfi_rdlvl_cs_0_n(dfi_rddata_cs_0_n),
                 .dfi_rdlvl_cs_1_n(dfi_rddata_cs_1_n),
                 .do_train_vref(do_train_vref) );

// MUX write/read levelling IOG output signals
// File: IOG_IF.v

// defparam IOG_IF.IOG_DQS_LANES = IOG_DQS_LANES;
// defparam IOG_IF.IOG_DQS_LANES_9 = IOG_DQS_LANES_9;

// AS: added a mux block to select between txdly controls
//     and write leveling controls
wire [IOG_DQS_LANES-1:0] dqsw270_direction_mux, dqsw270_load_mux, dqsw270_move_mux;
wire wr_select = dfi_wrlvl_en | !dfi_init_complete;

assign dqsw270_direction_mux = (dfi_wrlvl_en == 1'b1) ? wr_direction : txdly_delay_line_direction;
assign dqsw270_move_mux = (dfi_wrlvl_en == 1'b1) ? wr_move : txdly_delay_line_move;
assign dqsw270_load_mux = (dfi_wrlvl_en == 1'b1) ? wr_load : txdly_delay_line_load;

IOG_IF # (
  .IOG_DQS_LANES(IOG_DQS_LANES)
) IOG_IF( .SCLK(SCLK),
               .reset_n(reset_n),
               .wr_select(wr_select),
               .wr_direction(dqsw270_direction_mux),
               .apb_addr(apb_addr),
               .apb_we(apb_we),
               .debug_rddata(debug_rddata),
               .apb_wrdata(apb_wrdata),
               .wr_load(dqsw270_load_mux),
               .wr_move(dqsw270_move_mux),
               .rd_direction(rd_direction),
               .rd_load(rd_load),
               .rd_move(rd_move),
               .direction(direction),
               .load(load),
               .move(move),
               .dfi_training_complete(dfi_training_complete),
               .rx_out_of_range(rx_out_of_range),
               .trn_delay_line_sel(trn_delay_line_sel),
               .delay_line_sel_rd(delay_line_sel_rd)	,
               .apb_ctrl_chip_sel(apb_ctrl_chip_sel),			   
               .apb_iog_on(apb_iog_on),
               .apb_block_fifo(apb_block_fifo),
               .apb_pause(apb_pause),
               .apb_ctrl_dqsw_sel(apb_ctrl_dqsw_sel)
			   );

// Handles the dfi_training_complete done assertion
// File: TRN_COMPLETE.v
// defparam TRN_COMPLETE.IOG_DQS_LANES = IOG_DQS_LANES;
TRN_COMPLETE # (
  .IOG_DQS_LANES(IOG_DQS_LANES)
) TRN_COMPLETE( .SCLK(SCLK),
                           .reset_n(reset_n),
                           .dfi_training_complete(dfi_training_complete),
                           .dfi_rdlvl_en(dfi_rdlvl_en),
                           .dfi_rdlvl_gate_en(dfi_rdlvl_gate_en),
                           .dfi_rdlvl_resp(dfi_rdlvl_resp),
                           .dfi_wrlvl_en(dfi_wrlvl_en),
                           .vref_training_complete(vref_training_complete),
                           .dfi_rdlvl_cs_1_n(dfi_rdlvl_cs_1_n),
						               .dfi_rdlvl_cs_0_n(dfi_rdlvl_cs_0_n),
                           .do_train_vref(do_train_vref),
                           .dfi_rdlvl_resp_internal(dfi_rdlvl_resp_internal),
                           .two_ranks(two_ranks) );

// AS: Added this block
// Generate delay control for dqsw_sela (which doesn't use normal
// delay control) + a mux to switch input between clock training and wrlvl
// Note: MV/DIRECTION/LOAD:   DQSW270 -->   txdly controls
//       SELA:                DQSW    -->   wrdly controls

wire [IOG_DQS_LANES-1:0] dqsw_direction_mux, dqsw_load_mux, dqsw_move_mux;
wire [IOG_DQS_LANES-1:0] dqsw_direction_apb, dqsw_load_apb, dqsw_move_apb;

// AS: added apb_ctrl_dqsw_sel to MUX
assign dqsw_direction_mux = (apb_ctrl_dqsw_sel == 1'b1)? dqsw_direction_apb : (dfi_wrlvl_en == 1'b1) ? wr_direction : wrdly_delay_line_direction;
assign dqsw_move_mux      = (apb_ctrl_dqsw_sel == 1'b1)? dqsw_move_apb      : (dfi_wrlvl_en == 1'b1) ? wr_move      : wrdly_delay_line_move;
assign dqsw_load_mux      = (apb_ctrl_dqsw_sel == 1'b1)? dqsw_load_apb      : (dfi_wrlvl_en == 1'b1) ? wr_load      : wrdly_delay_line_load;



genvar n;
generate
  for (n=0; n<=IOG_DQS_LANES-1; n=n+1) begin  : delay_ctrl_instances
    DELAY_CTRL # (
      .WIDTH(8),
      .RESET_VAL(1)
    ) U_DELAY_CTRL (
      .sclk(SCLK),
      .reset_n(reset_n),
      .direction(dqsw_direction_mux[n]),
      .load(dqsw_load_mux[n]),
      .move(dqsw_move_mux[n]),
      .enable(1'b1), // temp
      .out_reg(dqsw_sela[(n*8+7):(n*8)]),
      .out_of_range() // temp
    );
    
    // AS: added for separate post-training control
    //     of DQSW (sela) versus DQSW270
    assign dqsw_direction_apb[n] = direction[n*9+8];
    assign dqsw_load_apb[n] = load[n*9+8];
    assign dqsw_move_apb[n] = move[n*9+8];
    
  end
endgenerate


/// Components_End <<<---


endmodule
