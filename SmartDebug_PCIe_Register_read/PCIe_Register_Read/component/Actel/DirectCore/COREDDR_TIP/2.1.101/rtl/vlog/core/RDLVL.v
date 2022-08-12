
/// Header_Start --->>>



/// Header_End <<<---


/// I/O_Start --->>>

// Perform read gate levelling
// Perform per-bit dq alignment within each lane
// Perform dqs centering on reads

module RDLVL( SCLK,
              reset_n,
              dfi_rdlvl_en,
              dfi_rdlvl_gate_en,
              dfi_rdlvl_resp_internal,
              apb_addr,
              apb_we,
              apb_wrdata,
              rdlvl_rddata,
              rd_direction,
              rd_load,
              rd_move,
              burst_detect,
              rx_out_of_range,
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
              clk_sel,
              training_pattern,
              apb_re,
              read_access,
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

// Port: NWL

input          dfi_rdlvl_en;   // Read level enable. Signal used for read levelling. Comes from the NWL controller
input          dfi_rdlvl_gate_en; // Read level gate enable. Signal used for read gate training. Comes from the NWL controller
output [IOG_DQS_LANES-1:0]   dfi_rdlvl_resp_internal; // Read training response signal. Indicates that the PHY is done with read training.
output [IOG_DQS_LANES-1:0]  rd_training_error; //output to say an error occured. signaled at same time as dfi_rdlvl_resp then cleared

// Port: APB_port

input [15:0]   apb_addr;       // Internal APB address
input          apb_we;
input          apb_re;
input          read_access;
input [7:0]    apb_wrdata;
output [7:0]   rdlvl_rddata;   // Read level read data from the read level block to the APB interface

// Port: IOG_IF

output [(IOG_DQS_LANES*9)-1:0]  rd_direction;   // To be used by a renaming module to assign the to the LANEx_IOGy_IOG direction signals 
output [(IOG_DQS_LANES*9)-1:0]  rd_load;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG load signals
output [(IOG_DQS_LANES*9)-1:0]  rd_move;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG move signals

output  [IOG_DQS_LANES-1:0] gt_pause;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p0_p;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p0_n;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p1_p;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p1_n;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p2_p;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p2_n;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p3_p;
output  [IOG_DQS_LANES-1:0] iog_rddata_en_p3_n;

// Port: PHY

input [IOG_DQS_LANES-1:0]    burst_detect;
output [(IOG_DQS_LANES*3)-1:0]  clk_sel;
input [(IOG_DQS_LANES*9)-1:0]   rx_out_of_range; // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_OUT_OF_RANGE signals

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

// Port: NWL_PHY_SIG_MOD
input          dfi_rdlvl_cs_0_n; // Read level training chip select
input          dfi_rdlvl_cs_1_n; // Read level training chip select

input          dfi_rddata_cs_0_n; // Read data data path chip select
input          dfi_rddata_cs_1_n; // Read data data path chip select

// Port: CONFIG

input [7:0]    training_pattern;

output select_rank_1_gt;
wire select_rank_1_gt;

//SMG 31/3/16 - adding signal to block out fifo when needed
output [IOG_DQS_LANES-1:0]     dq_dqs_block_fifo;

input [9:0]      MIN_READS_THRESHOLD;

/// I/O_End <<<---






/// Components_Start --->>>

// Module that contains the instantiations of the groups of state machines to perform read levelling.
// File: RDLVL_SMS.v

//defparam RDLVL_SMS.IOG_DQS_LANES = IOG_DQS_LANES;
//defparam RDLVL_SMS.IOG_DQS_LANES_3 = IOG_DQS_LANES_3;
//defparam RDLVL_SMS.IOG_DQS_LANES_9 = IOG_DQS_LANES_9;
//
//defparam RDLVL_SMS.IOG_DQ_WIDTH_L0 = IOG_DQ_WIDTH_L0;
//defparam RDLVL_SMS.IOG_DQ_WIDTH_L1 = IOG_DQ_WIDTH_L1;
//defparam RDLVL_SMS.IOG_DQ_WIDTH_L2 = IOG_DQ_WIDTH_L2;
//defparam RDLVL_SMS.IOG_DQ_WIDTH_L3 = IOG_DQ_WIDTH_L3;
//defparam RDLVL_SMS.IOG_DQ_WIDTH_L4 = IOG_DQ_WIDTH_L4;
//defparam RDLVL_SMS.IOG_DQ_WIDTH_L5 = IOG_DQ_WIDTH_L5;
//defparam RDLVL_SMS.IOG_DQ_WIDTH_L6 = IOG_DQ_WIDTH_L6;
//defparam RDLVL_SMS.IOG_DQ_WIDTH_L7 = IOG_DQ_WIDTH_L7;
//defparam RDLVL_SMS.IOG_DQ_WIDTH_L8 = IOG_DQ_WIDTH_L8;

RDLVL_SMS # (
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
) RDLVL_SMS( .SCLK(SCLK),
                     .reset_n(reset_n),
                     .dfi_rdlvl_en(dfi_rdlvl_en),
                     .dfi_rdlvl_gate_en(dfi_rdlvl_gate_en),
                     .dfi_rdlvl_resp_internal(dfi_rdlvl_resp_internal),
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
                     .apb_data_out(rdlvl_rddata),
                     .apb_we(apb_we),
                     .apb_re(apb_re),
                     .read_access(read_access),
                     .apb_wrdata(apb_wrdata),
                     .apb_addr(apb_addr),
                     .burst_detect(burst_detect),
                     .rx_out_of_range(rx_out_of_range),
                     .rd_direction(rd_direction),
                     .rd_load(rd_load),
                     .rd_move(rd_move),
                     .clk_sel(clk_sel),
                     .training_pattern(training_pattern),
                     .gt_pause(gt_pause),
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
                     .MIN_READS_THRESHOLD(MIN_READS_THRESHOLD)
					 );



/// Components_End <<<---


endmodule

