//---------------------------------------------------------
// COPYRIGHT CreVinn Teoranta 2015  
// CreVinn CONFIDENTIAL AND PROPRIETARY   
// Project Name: ms_tip
//---------------------------------------------------------
// $Author: gianl $
// $Data$
// $Log: RDLVL_TRAIN $
//
//
//---------------------------------------------------------


/// I/O_Start --->>>

// Module that contains the two state machines. WIll be instantiated with the number of LANECOUNT parameters

module RDLVL_TRAIN( SCLK,
                    reset_n,
                    rd_direction,
                    rd_load,
                    rd_move,
                    dfi_rdlvl_en,
                    dfi_rdlvl_gate_en,
                    dfi_rdlvl_resp_internal,
                    training_pattern,
                    apb_we,
                    apb_wrdata,
                    dfi_rddata,
                    dfi_rddata_en_p0,
                    dfi_rddata_en_p1,
                    dfi_rddata_en_p2,
                    dfi_rddata_en_p3,
                    dfi_rddata_valid,
                    dfi_rdlvl_cs_0_n,
                    dfi_rdlvl_cs_1_n,
                    dfi_rddata_cs_0_n,
                    dfi_rddata_cs_1_n,
                    apb_addr,
                    apb_data_out,
                    clk_sel,
                    burst_detect,
                    rx_out_of_range,
                    read_access,
                    pinselect_8,
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
					          dq_dqs_block_fifo,
                    // Gian Edit - Merging new tb to new one for new gate training
                    txdelay_direction,
                    txdelay_load,
                    txdelay_move,
                    txdelay_oor,
                    MIN_READS_THRESHOLD

					);


parameter BL8_VALIDATE_CNT = 8;



// Port local
input read_access;
input pinselect_8;

// Port: GlobalPort_1

input          SCLK;
input          reset_n;

// Port: Port_1

output [8:0]   rd_direction;   // To be used by a renaming module to assign the to the LANEx_IOGy_IOG direction signals 
output [8:0]   rd_load;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG load signals
output [8:0]   rd_move;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG move signals

// Port: NWL

input          dfi_rdlvl_en;   // Read level enable. Signal used for read levelling. Comes from the NWL controller
input          dfi_rdlvl_gate_en; // Read level gate enable. Signal used for read gate training. Comes from the NWL controller
output         dfi_rdlvl_resp_internal; // Read training response signal. Indicates that the PHY is done with read training.

// Port: RDLVL_RESULTS
output [7:0]  apb_data_out;


// Port: CONFIG

input [7:0]    training_pattern;

// Port: APB_port

input          apb_we;
input [7:0]    apb_wrdata;


// Port: NWL_IOG

input [63:0]  dfi_rddata;     // Read data bus. This bus transfers read data from the PHY to the
                               // MC.
input          dfi_rddata_en_p0;
input          dfi_rddata_en_p1;
input          dfi_rddata_en_p2;
input          dfi_rddata_en_p3;
input          dfi_rddata_valid;

output         gt_pause;
output         iog_rddata_en_p0_p;
output         iog_rddata_en_p1_p;
output         iog_rddata_en_p2_p;
output         iog_rddata_en_p3_p;
output         iog_rddata_en_p0_n;
output         iog_rddata_en_p1_n;
output         iog_rddata_en_p2_n;
output         iog_rddata_en_p3_n;

// Gian Edit, merging new bench with old 
output  txdelay_direction;
output  txdelay_load;
output  txdelay_move;
input   txdelay_oor;


// Port: NWL_PHY
input          dfi_rdlvl_cs_0_n; // Read level training chip select
input          dfi_rdlvl_cs_1_n; // Read level training chip select
input          dfi_rddata_cs_0_n; // Read data data path chip select
input          dfi_rddata_cs_1_n; // Read data data path chip select

// Port: APB

input [15:0]   apb_addr;       // Internal APB address

// Port: Port_4


output [2:0]  clk_sel;

// Port: PHY

input         burst_detect;
input [8:0]   rx_out_of_range; // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_OUT_OF_RANGE signals

//SMG 31/3/16 - adding signal to block out fifo when needed
output        dq_dqs_block_fifo;

input [9:0]      MIN_READS_THRESHOLD;

/// I/O_End <<<---





// Gian edit

wire          SCLK;
wire          reset_n;

// Port: Port_1

wire [8:0]   rd_direction;   // To be used by a renaming module to assign the to the LANEx_IOGy_IOG direction signals 
wire [8:0]   rd_direction_i;   // To be used by a renaming module to assign the to the LANEx_IOGy_IOG direction signals 
wire [8:0]   rd_load;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG load signals
wire [8:0]   rd_move;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG move signals

// Port: NWL

wire          dfi_rdlvl_en;   // Read level enable. Signal used for read levelling. Comes from the NWL controller
wire          dfi_rdlvl_gate_en; // Read level gate enable. Signal used for read gate training. Comes from the NWL controller
wire          dfi_rdlvl_resp_internal; // Read training response signal. Indicates that the PHY is done with read training.

// Port: RDLVL_RESULTS
wire [7:0]    apb_data_out;

// Port: APB_port

wire          apb_we;
wire [7:0]    apb_wrdata;

// Port: NWL_IOG

wire [63:0]  dfi_rddata;     // Read data bus. This bus transfers read data from the PHY to the
                               // MC.

wire          dfi_rddata_valid;

// Port: NWL_PHY

wire          dfi_rddata_cs_0_n; // Read data data path chip select
wire          dfi_rddata_cs_1_n; // Read data data path chip select

// Port: APB

wire [15:0]   apb_addr;       // Internal APB address

// Port: Port_4


wire [2:0]  clk_sel;

// Port: PHY

wire         burst_detect;
wire [8:0]   rx_out_of_range; // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_OUT_OF_RANGE signals


// Mux response
wire         rdlvl_resp_gate;
wire         rdlvl_resp;
assign dfi_rdlvl_resp_internal = (dfi_rdlvl_gate_en) ?  rdlvl_resp_gate : rdlvl_resp;

// Mux read data
wire [7:0]        gate_data_out;
wire [7:0]        dq_dqs_data_out;
assign apb_data_out = (apb_addr[5] == 1'b1) ?  dq_dqs_data_out : gate_data_out;

wire read_access_gt;
wire read_access_dq_dqs;
assign read_access_gt = (apb_addr[5] == 1'b0) ? read_access:0;
assign read_access_dq_dqs = (apb_addr[5] == 1'b1) ? read_access:0;

output select_rank_1_gt;
wire select_rank_1_gt;

wire gt_error;
wire dq_dqs_error;
output rd_training_error;
wire pre_dqs_mux_gt_pause;
wire dqs_pause;

assign rd_training_error = gt_error | dq_dqs_error;
//assign gt_pause = dfi_rdlvl_en ? dqs_pause : pre_dqs_mux_gt_pause;
assign gt_pause = dfi_rdlvl_en ? 1'b0 : pre_dqs_mux_gt_pause;
assign rd_direction = {9{!rd_direction_i}} ;

// Training SMs
gate_training gate_training(
                          //  input ports
                          .dfi_rdlvl_gate_en(dfi_rdlvl_gate_en),   //  Wire coming from the NWL interface. Signals the training IP to start gate training.
                          .dfi_rddata_en_p0(dfi_rddata_en_p0),
                          .dfi_rddata_en_p1(dfi_rddata_en_p1),   //  Wire coming from the NWL that signifies a read.
                          .dfi_rddata_en_p2(dfi_rddata_en_p2),
                          .dfi_rddata_en_p3(dfi_rddata_en_p3),
                          .burst_detect_in(burst_detect),   //  Burst detect signal coming from the burst detect circuit.
                          .sclk(SCLK),   //  System clock, 200MHz.
                          .reset_n(reset_n),   //  Asynchronous reset. Active low.
                          .dfi_rdlvl_cs_0_n(dfi_rdlvl_cs_0_n),
                          .dfi_rdlvl_cs_1_n(dfi_rdlvl_cs_1_n),
                          .dfi_rddata_cs_0_n(dfi_rddata_cs_0_n),   //  Wire coming from the NWL to signify which chip(rank) to train. High means train rank 1.
                          .dfi_rddata_cs_1_n(dfi_rddata_cs_1_n),
                          .apb_addr(apb_addr),   //  APB address to read the registers.
                          .read_access(read_access_gt),   //  Signifies if the read is directed to the state machine.
 
                          //  output ports
                          .dfi_rdlvl_resp(rdlvl_resp_gate),   //  Wire going to the NWL model to signify completion of gate training.
                          .clk_sel_out(clk_sel),   //  The clk_sel setting output.
                          .apb_data_out(gate_data_out),   //  Read data to APB.
                          .gt_pause(pre_dqs_mux_gt_pause),   //  Pause signal going out to pause the FIFO when changing clk_sel settings.
                          .iog_rddata_en_p0_p(iog_rddata_en_p0_p),
                          .iog_rddata_en_p0_n(iog_rddata_en_p0_n),
                          .iog_rddata_en_p1_p(iog_rddata_en_p1_p),
                          .iog_rddata_en_p1_n(iog_rddata_en_p1_n),
                          .iog_rddata_en_p2_p(iog_rddata_en_p2_p),
                          .iog_rddata_en_p2_n(iog_rddata_en_p2_n),
                          .iog_rddata_en_p3_p(iog_rddata_en_p3_p),
                          .iog_rddata_en_p3_n(iog_rddata_en_p3_n),
						              .select_rank_1_gt(select_rank_1_gt),
						              .gt_error(gt_error),
                          // Gian Edit. Merging of new bench to old one for new gate training
                          .txdly_direction(txdelay_direction),
                          .txdly_load(txdelay_load),
                          .txdly_move(txdelay_move),
                          .txdly_out_of_range(txdelay_oor),
                          .MIN_READS_THRESHOLD(MIN_READS_THRESHOLD)
                         );


dq_align_dqs_optimization dq_align_dqs_optimization (
                              //  input ports
                              .dfi_rdlvl_en(dfi_rdlvl_en),
                              .dfi_rddata_valid(dfi_rddata_valid),
                              .sclk(SCLK),
                              .reset_n(reset_n),
                              .dq_out_of_range(rx_out_of_range[7:0]),
                              .dqs_out_of_range(rx_out_of_range[8]),
                              .dfi_rdlvl_cs_1_n(dfi_rdlvl_cs_1_n),
                              .dfi_rddata(dfi_rddata),
                              .training_pattern(training_pattern),
                              .apb_addr(apb_addr),
                              .dfi_rddata_en(iog_rddata_en_p3_n), //SMG edit - should be coming from output of gate training
                              .pinselect_8(pinselect_8),
 
                              //  output ports
                              .rd_dq_move(rd_move[7:0]),
                              .rd_dq_load(rd_load[7:0]),
                              .rd_dq_direction(rd_direction_i[7:0]),
                              .rd_dqs_move(rd_move[8]),
                              .rd_dqs_load(rd_load[8]),
                              .rd_dqs_direction(rd_direction_i[8]),
                              .dfi_rdlvl_resp(rdlvl_resp),
                              .apb_data_out(dq_dqs_data_out),
                              .read_access(read_access_dq_dqs),
							  .dq_dqs_error(dq_dqs_error),
							  .dqs_pause(dqs_pause),
							  .dq_dqs_block_fifo(dq_dqs_block_fifo)
                              );

endmodule

