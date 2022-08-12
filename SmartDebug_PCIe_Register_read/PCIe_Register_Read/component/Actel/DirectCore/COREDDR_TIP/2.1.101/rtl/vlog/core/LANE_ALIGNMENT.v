
/// Header_Start --->>>
//---------------------------------------------------------
// COPYRIGHT CreVinn Teoranta 2015  
// CreVinn CONFIDENTIAL AND PROPRIETARY   
// Project Name: ms_tip
//---------------------------------------------------------
// $Author: gianl $
// $Data$
// $Log: LANE_ALIGNMENT.v $
//
//
//---------------------------------------------------------


/// Header_End <<<---


/// I/O_Start --->>>

// - Clock = sclk
// - Reset = reset_n
// - Eliminate skew between individual lanes

// AS: added dfi_training_complete for generating FIFO reset after done

module LANE_ALIGNMENT( SCLK,
                       reset_n,
                       dfi_rddata,
                       dfi_rddata_valid,
                       iog_rddata,
                       iog_rddata_valid_pre,
                       dfi_training_complete,
                       dq_dqs_block_fifo,
                       gt_block_fifo,
					   apb_block_fifo);

//parameter IOG_DQS_LANES = `IOG_DQS_LANES_DEF; // Number of lanes
parameter IOG_DQS_LANES = 2; // Number of lanes
parameter FIFO_DEPTH = 3; // EON. Depth of the individual FIFOs. (Next line ensures min of 3 implemented) 
parameter FIF_DEPTH = (FIFO_DEPTH<3) ? (3):(FIFO_DEPTH) ; // Force FIF_DEPTH to be min of 3, passed down to lower levels

//parameter FIF_DEPTH = `FIF_DEPTH_DEF; // Depth of the individual FIFOs
parameter FIFO_ADDRESS_WIDTH = 2;//not used...can be removed if not in module header in level above

//parameter IOG_DQS_LANES_64 = IOG_DQS_LANES*64; 

input          SCLK;
input          reset_n;

// Port: TIP_CTRL_BLK

output [IOG_DQS_LANES*64-1:0] dfi_rddata;
output         dfi_rddata_valid;

// Port: NWL_PHY

input [IOG_DQS_LANES*64-1:0] iog_rddata;
input [IOG_DQS_LANES-1:0] iog_rddata_valid_pre;
wire [IOG_DQS_LANES-1:0] iog_rddata_valid;


wire [IOG_DQS_LANES-1:0] entries_in_FIFO_N;//EON...bit per lane .. each bit indicates at least one entry in that lane fifo
wire           read_FIFO_en;
reg [IOG_DQS_LANES*64-1:0] dfi_rddata;
wire [IOG_DQS_LANES*64-1:0] early_dfi_rddata;
reg         dfi_rddata_valid;
wire         early_dfi_rddata_valid;


// AS: added input and reg

input dfi_training_complete;
reg dfi_training_complete_reg;
wire reset_after_training_n;

//SMG 31/3/16 - adding signal to block out fifo when needed
input [IOG_DQS_LANES-1:0]     dq_dqs_block_fifo;
input	gt_block_fifo;
input [IOG_DQS_LANES-1:0]     apb_block_fifo;
wire  [IOG_DQS_LANES-1:0]     block_fifo;
reg [IOG_DQS_LANES-1:0]     dq_dqs_block_fifo_reg;//EON..register this here as comb source.
/// I/O_End <<<---



/// Components_Start --->>>

// - read_FIFO_en = 1 when entries_in_FIFO > 0
// - generate dfi_rddata_valid to NWL while entries in FIFO are non-zero.
// File: LANE_CTRL.v

// AS: added this sync block to generate reset for FIFO

// detect 0-->1 on dfi_training complete, pulse active low
assign reset_after_training_n = (!dfi_training_complete_reg && dfi_training_complete) ? 1'b0 : 1'b1;
//EON ..register dq_dqs_block_fifo here as comb source
always@(posedge SCLK)
begin
   dq_dqs_block_fifo_reg <= dq_dqs_block_fifo;
   dfi_rddata <= early_dfi_rddata; //EON..have added in a register stage for data and valid to help timing
end

always@(posedge SCLK or negedge reset_n)
begin: register_training_complete
  if (!reset_n)
  begin
    dfi_training_complete_reg <= 0;
    dfi_rddata_valid <=0;
  end
  else
  begin
    dfi_training_complete_reg <= dfi_training_complete;
    dfi_rddata_valid <= early_dfi_rddata_valid;//EON..have added in a register stage for data o/p and valid from lane_alignment to help timing
  end
end

LANE_CTRL #(
  .IOG_DQS_LANES(IOG_DQS_LANES)
  //.FIF_DEPTH(FIF_DEPTH)
) LANE_CTRL( .SCLK(SCLK),
                     .reset_n(reset_n),
                     .dfi_rddata_valid(early_dfi_rddata_valid),//EON..have added in a register stage for data and valid now
                     .entries_in_FIFO_N(entries_in_FIFO_N),
                     .read_FIFO_en(read_FIFO_en) );


// AS: remapped read bus
wire [IOG_DQS_LANES*64-1:0] iog_rddata_mapped;
                     
genvar i;

generate
  for (i=0; i < IOG_DQS_LANES; i = i + 1) begin
    assign iog_rddata_mapped[(((i+1)*64)-1):(i*64)] = {
            iog_rddata[(i*8)+(IOG_DQS_LANES*56 + 7):(i*8)+(IOG_DQS_LANES*56)],
            iog_rddata[(i*8)+(IOG_DQS_LANES*48 + 7):(i*8)+(IOG_DQS_LANES*48)],
            iog_rddata[(i*8)+(IOG_DQS_LANES*40 + 7):(i*8)+(IOG_DQS_LANES*40)],
            iog_rddata[(i*8)+(IOG_DQS_LANES*32 + 7):(i*8)+(IOG_DQS_LANES*32)],
            iog_rddata[(i*8)+(IOG_DQS_LANES*24 + 7):(i*8)+(IOG_DQS_LANES*24)],
            iog_rddata[(i*8)+(IOG_DQS_LANES*16 + 7):(i*8)+(IOG_DQS_LANES*16)],
            iog_rddata[(i*8)+(IOG_DQS_LANES*8 + 7):(i*8)+(IOG_DQS_LANES*8)],
            iog_rddata[(i*8)+7:(i*8)]};
  

  //SMG - adding logic to protect FIFO from unwanted 'X' signals on iog_rddata_valid 
  assign block_fifo[i] =  (dq_dqs_block_fifo_reg[i] | gt_block_fifo | apb_block_fifo[i]);
  assign iog_rddata_valid[i] = iog_rddata_valid_pre[i] & !(block_fifo[i]);
  
  // AS: don't want to gate a reset so adding this logic
  reg fifo_reset_n;
  always@(posedge SCLK or negedge reset_n)
  begin
    if (!reset_n)
      fifo_reset_n <= 1'b0;
    else begin
      fifo_reset_n <= reset_after_training_n;
    end
  end

  
  FIFO_BLK # (
    .FIF_DEPTH(FIF_DEPTH)
  ) FIFO_BLK(     .SCLK(SCLK),
                         .reset_n(fifo_reset_n),
      
                         // Output ports
                         .entries_in_FIFO(entries_in_FIFO_N[i]), //EON...a bit per lane...at least one entry in per lane fifo
                         .dfi_rddata({
                                early_dfi_rddata[8*i+7+IOG_DQS_LANES*56 : 8*i+IOG_DQS_LANES*56] //EON..have added in a register stage for data and valid now
                                ,early_dfi_rddata[8*i+7+IOG_DQS_LANES*48 : 8*i+IOG_DQS_LANES*48]
                                ,early_dfi_rddata[8*i+7+IOG_DQS_LANES*40 : 8*i+IOG_DQS_LANES*40]
                                ,early_dfi_rddata[8*i+7+IOG_DQS_LANES*32 : 8*i+IOG_DQS_LANES*32]
                                ,early_dfi_rddata[8*i+7+IOG_DQS_LANES*24 : 8*i+IOG_DQS_LANES*24]
                                ,early_dfi_rddata[8*i+7+IOG_DQS_LANES*16 : 8*i+IOG_DQS_LANES*16]
                                ,early_dfi_rddata[8*i+7+IOG_DQS_LANES*8 : 8*i+IOG_DQS_LANES*8]
                                ,early_dfi_rddata[8*i+7:8*i]}),

                         // Input ports
                         .iog_rddata(iog_rddata_mapped[(i*64)+63:(i*64)]),
                         .iog_rddata_valid(iog_rddata_valid[i]),
                         .read_FIFO_en(read_FIFO_en) );
  end

endgenerate

/// Components_End <<<---


endmodule

