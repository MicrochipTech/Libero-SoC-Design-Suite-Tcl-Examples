//---------------------------------------------------------
// COPYRIGHT CreVinn Teoranta 2015  
// CreVinn CONFIDENTIAL AND PROPRIETARY   
// Project Name: ms_tip
//---------------------------------------------------------
// $Author: gianl $
// $Data$
// $Log: RDLVL_SMS $
//
//
//---------------------------------------------------------


/// I/O_Start --->>>

// Module that contains the instantiations of the groups of state machines to perform read levelling.

module RDLVL_SMS( SCLK,
                  reset_n,
                  dfi_rdlvl_en,
                  dfi_rdlvl_gate_en,
                  dfi_rdlvl_resp_internal,
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
                  apb_data_out,
                  apb_we,
                  apb_wrdata,
                  apb_addr,
                  burst_detect,
                  rx_out_of_range,
                  rd_direction,
                  rd_load,
                  rd_move,
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
//parameter IOG_DQS_LANES_3 = IOG_DQS_LANES*3; // Derived parameter from IOG_DQS_LANES
//parameter IOG_DQS_LANES_9 = IOG_DQS_LANES*9; // Derived parameter from IOG_DQS_LANES

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

// Port: NWL_IOG

input [(IOG_DQS_LANES*64)-1:0]  dfi_rddata;     // Read data bus. This bus transfers read data from the PHY to the
                               // MC.
input          dfi_rddata_en_p0;
input          dfi_rddata_en_p1;
input          dfi_rddata_en_p2;
input          dfi_rddata_en_p3;
input          dfi_rddata_valid;

// Port: NWL_PHY
input          dfi_rdlvl_cs_0_n; // Read level training chip select
input          dfi_rdlvl_cs_1_n; // Read level training chip select
input          dfi_rddata_cs_0_n; // Read data data path chip select
input          dfi_rddata_cs_1_n; // Read data data path chip select

// Port: RDLVL_RESULTS

output [7:0]   apb_data_out;
reg [7:0]   apb_data_out;


// Port: APB_port

input          apb_we;
input          apb_re;
input          read_access;
input [7:0]    apb_wrdata;


// Port: APB

input [15:0]   apb_addr;       // Internal APB address

// Port: PHY

input [IOG_DQS_LANES-1:0]    burst_detect;
input [(IOG_DQS_LANES*9)-1:0]   rx_out_of_range; // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_OUT_OF_RANGE signals

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




// Port: IOG_IF

output [(IOG_DQS_LANES*9)-1:0]  rd_direction;   // To be used by a renaming module to assign the to the LANEx_IOGy_IOG direction signals 
output [(IOG_DQS_LANES*9)-1:0]  rd_load;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG load signals
output [(IOG_DQS_LANES*9)-1:0]  rd_move;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG move signals

// Port: PHY_SIG_MOD

output [(IOG_DQS_LANES*3)-1:0]  clk_sel;

// Port: CONFIG

input [7:0]    training_pattern;

//SMG 31/3/16 - adding signal to block out fifo when needed
output [IOG_DQS_LANES-1:0]     dq_dqs_block_fifo;

// Rank select gate training to go to phy sig mod
output select_rank_1_gt;
wire select_rank_1_gt;

wire [IOG_DQS_LANES-1:0] select_rank_1_gt_in;

assign select_rank_1_gt = &select_rank_1_gt_in;

input [9:0]      MIN_READS_THRESHOLD;

/// I/O_End <<<---


// Gian edit

// Generate SM group instances

// Wires
wire                        dfi_rdlvl_gate_en;
wire                        dfi_rddata_en_p0;
wire                        dfi_rddata_en_p1;
wire                        dfi_rddata_en_p2;
wire                        dfi_rddata_en_p3;
wire  [IOG_DQS_LANES-1:0]       burst_detect;
wire                        dfi_rddata_cs_1_n;
wire  [(IOG_DQS_LANES*3)-1:0]   clk_sel;
wire  [IOG_DQS_LANES-1:0]       dfi_rdlvl_resp_internal;
wire          dfi_rdlvl_en;
wire          dfi_rddata_valid;       

wire  [(IOG_DQS_LANES*9)-1:0]  rd_move;
wire  [(IOG_DQS_LANES*9)-1:0]  rd_load;
wire  [(IOG_DQS_LANES*9)-1:0]  rd_direction;

// GIAN:: apb_data_out mux
wire [71:0] apb_data_out_internal;
reg  [8:0]  read_access_internal;
always @(posedge SCLK or negedge reset_n)
begin
  if(reset_n == 0) begin
    apb_data_out <= 0;
    read_access_internal <= 0;
  end else
  case(apb_addr[9:6]) 
    0: 
        begin
          apb_data_out <= apb_data_out_internal[7:0];
          read_access_internal <= {8'b0,read_access};
        end
    1: 
        begin
          apb_data_out <= apb_data_out_internal[15:8];
          read_access_internal <= {7'b0,read_access,1'b0};
        end
    2: 
        begin
          apb_data_out <= apb_data_out_internal[23:16];
          read_access_internal <= {6'b0,read_access,2'b0};

        end
    3: 
        begin
          apb_data_out <= apb_data_out_internal[31:24];
          read_access_internal <= {5'b0,read_access,3'b0};
        end
    4: 
        begin
          apb_data_out <= apb_data_out_internal[39:32];
          read_access_internal <= {4'b0,read_access,4'b0};
        end
    5: 
        begin
          apb_data_out <= apb_data_out_internal[47:40];
          read_access_internal <= {3'b0,read_access,5'b0};
        end
    6: 
        begin
          apb_data_out <= apb_data_out_internal[55:48];
          read_access_internal <= {2'b0,read_access,6'b0};
        end
    7: 
        begin
          apb_data_out <= apb_data_out_internal[63:56];
          read_access_internal <= {1'b0,read_access,7'b0};
        end
    8: 
        begin
          apb_data_out <= apb_data_out_internal[71:64];
          read_access_internal <= {read_access,8'b0};
        end
    default : 
        begin
          apb_data_out <= 0;
          read_access_internal <= 0;
        end  
  endcase
end



/// Components_Start --->>>

wire  [8:0] pinselect_8;

assign pinselect_8[0] = (IOG_DQ_WIDTH_L0==8)? 1:0;
assign pinselect_8[1] = (IOG_DQ_WIDTH_L1==8)? 1:0;
assign pinselect_8[2] = (IOG_DQ_WIDTH_L2==8)? 1:0;
assign pinselect_8[3] = (IOG_DQ_WIDTH_L3==8)? 1:0;
assign pinselect_8[4] = (IOG_DQ_WIDTH_L4==8)? 1:0;
assign pinselect_8[5] = (IOG_DQ_WIDTH_L5==8)? 1:0;
assign pinselect_8[6] = (IOG_DQ_WIDTH_L6==8)? 1:0;
assign pinselect_8[7] = (IOG_DQ_WIDTH_L7==8)? 1:0;
assign pinselect_8[8] = (IOG_DQ_WIDTH_L8==8)? 1:0;

genvar i;

wire [(IOG_DQS_LANES*64)-1:0] dfi_rddata_mapped;



generate






  for (i=0; i < IOG_DQS_LANES; i = i + 1) begin

    // Edited by AS (3/15/16): added mapping for rddata to split between lanes
    assign dfi_rddata_mapped[(((i+1)*64)-1):(i*64)] = {
        dfi_rddata[(i*8)+(IOG_DQS_LANES*56 + 7):(i*8)+(IOG_DQS_LANES*56)], 
        dfi_rddata[(i*8)+(IOG_DQS_LANES*48 + 7):(i*8)+(IOG_DQS_LANES*48)], 
        dfi_rddata[(i*8)+(IOG_DQS_LANES*40 + 7):(i*8)+(IOG_DQS_LANES*40)], 
        dfi_rddata[(i*8)+(IOG_DQS_LANES*32 + 7):(i*8)+(IOG_DQS_LANES*32)], 
        dfi_rddata[(i*8)+(IOG_DQS_LANES*24 + 7):(i*8)+(IOG_DQS_LANES*24)], 
        dfi_rddata[(i*8)+(IOG_DQS_LANES*16 + 7):(i*8)+(IOG_DQS_LANES*16)], 
        dfi_rddata[(i*8)+(IOG_DQS_LANES*8 + 7):(i*8)+(IOG_DQS_LANES*8)], 
        dfi_rddata[(i*8)+7:(i*8)]
      };

  
  RDLVL_TRAIN RDLVL_TRAIN( .SCLK(SCLK),
                         .reset_n(reset_n),
                         .rd_direction(rd_direction[(i*9)+8:(i*9)]),
                         .rd_load(rd_load[(i*9)+8:(i*9)]),
                         .rd_move(rd_move[(i*9)+8:(i*9)]),
                         .dfi_rdlvl_en(dfi_rdlvl_en),
                         .dfi_rdlvl_gate_en(dfi_rdlvl_gate_en),
                         .dfi_rdlvl_resp_internal(dfi_rdlvl_resp_internal[i]),
                         .apb_data_out(apb_data_out_internal[(i*8)+7:(i*8)]),
                         .training_pattern(training_pattern),
                         .apb_we(apb_we),
                         .apb_wrdata(apb_wrdata),
                         .dfi_rddata(dfi_rddata_mapped[(((i+1)*64)-1):(i*64)]),
                         .dfi_rddata_en_p0(dfi_rddata_en_p0),
                         .dfi_rddata_en_p1(dfi_rddata_en_p1),
                         .dfi_rddata_en_p2(dfi_rddata_en_p2),
                         .dfi_rddata_en_p3(dfi_rddata_en_p3),
                         .dfi_rddata_valid(dfi_rddata_valid),
                         .dfi_rdlvl_cs_0_n(dfi_rdlvl_cs_0_n),
                         .dfi_rdlvl_cs_1_n(dfi_rdlvl_cs_1_n),
                         .dfi_rddata_cs_0_n(dfi_rddata_cs_0_n),
                         .dfi_rddata_cs_1_n(dfi_rddata_cs_1_n),
                         .apb_addr(apb_addr),
                         .clk_sel(clk_sel[((i*3)+2):(i*3)]),
                         .burst_detect(burst_detect[i]),
                         .rx_out_of_range(rx_out_of_range[(i*9)+8:(i*9)]),
                         .read_access(read_access_internal[i] && apb_re),
                         .pinselect_8(pinselect_8[i]),
                         .gt_pause(gt_pause[i]),
                         .iog_rddata_en_p0_p(iog_rddata_en_p0_p[i]),
                         .iog_rddata_en_p0_n(iog_rddata_en_p0_n[i]),
                         .iog_rddata_en_p1_p(iog_rddata_en_p1_p[i]),
                         .iog_rddata_en_p1_n(iog_rddata_en_p1_n[i]),
                         .iog_rddata_en_p2_p(iog_rddata_en_p2_p[i]),
                         .iog_rddata_en_p2_n(iog_rddata_en_p2_n[i]),
                         .iog_rddata_en_p3_p(iog_rddata_en_p3_p[i]),
                         .iog_rddata_en_p3_n(iog_rddata_en_p3_n[i]),
                         .select_rank_1_gt(select_rank_1_gt_in[i]),
                         .rd_training_error(rd_training_error[i]),
                         .dq_dqs_block_fifo(dq_dqs_block_fifo[i]),

                         // Gian Edit. Merging of new bench to old one for new gate training
                         .txdelay_direction(txdelay_direction[i]),
                         .txdelay_load(txdelay_load[i]),
                         .txdelay_move(txdelay_move[i]),
                         .txdelay_oor(txdelay_oor[i]),
                         .MIN_READS_THRESHOLD(MIN_READS_THRESHOLD)
						 );

  end
endgenerate



/// Components_End <<<---


endmodule

