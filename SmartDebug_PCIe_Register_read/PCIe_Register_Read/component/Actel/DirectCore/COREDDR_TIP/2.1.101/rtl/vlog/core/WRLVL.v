
/// Header_Start --->>>



/// Header_End <<<---


/// I/O_Start --->>>

// Perform write levelling


module WRLVL( SCLK,
              reset_n,
              dfi_wrlvl_en,
              dfi_wrlvl_resp,
              dfi_wrlvl_strobe,
              wr_direction,
              wr_load,
              wr_move,
              apb_addr,
              apb_we,
              apb_wrdata,
              wrlvl_rddata,
              tx_out_of_range,
              dfi_wrlvl_cs_0_n,
              dfi_wrlvl_cs_1_n,
              pause,
              pad_rddata,
              TAP_OFFSET

              );
              
parameter IOG_DQS_LANES = 9; // Number of Lanes

input          SCLK;
input          reset_n;

// Port: CONFIG
input  [6:0]      TAP_OFFSET;

// Port: NWL

input          dfi_wrlvl_en;   // Write level enable. Signal used for write levelling. Comes from the NWL controller
output [IOG_DQS_LANES-1:0]   dfi_wrlvl_resp; // Write level response signal. Indicates that the PHY is done with write levelling.
input          dfi_wrlvl_strobe; // Strobe signal used for write leveling. Comes from the NWL controller
output [IOG_DQS_LANES-1:0]  wr_direction;   // To be used by a renaming module to assign the to the LANEx_IOGy_IOG direction signals
output [IOG_DQS_LANES-1:0]  wr_load;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG load signals
output [IOG_DQS_LANES-1:0]  wr_move;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG move signals

// Port: APB

input [15:0]   apb_addr;       // Internal APB address
input          apb_we;
input [7:0]    apb_wrdata;
output [7:0]   wrlvl_rddata;   // Write level read data from the read level block to the APB interface

// Port: IOG

input [((IOG_DQS_LANES*9)-1):0]   tx_out_of_range; // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_OUT_OF_RANGE signals

// Port: NWL_PHY_SIG_MOD

input                         dfi_wrlvl_cs_0_n;
input                         dfi_wrlvl_cs_1_n; 

// Port: PHY

output [IOG_DQS_LANES-1:0] pause;

// Port: PAD

input [IOG_DQS_LANES*8-1:0]   pad_rddata;

// AS: replaced with WRLVL wrapper code

reg [7:0] wrlvl_rddata;
// internal
wire [62:0]     delay_val0;
wire [62:0]     delay_val1;
wire [IOG_DQS_LANES-1:0] error;

wire [IOG_DQS_LANES-1:0]   dfi_wrlvl_resp_i;
wire wr;

assign wr = & dfi_wrlvl_resp_i;
assign dfi_wrlvl_resp = wr ? {IOG_DQS_LANES{1'b1}} : {IOG_DQS_LANES{1'b0}};


// apb output assignment
/* always@(*)
begin: prdata_out
 */
// output data assignment
always@(*)
begin : wrlvl_rdata_output
  case (apb_addr[4:0])
    5'h00:
      wrlvl_rddata[7:0] = {1'b0,delay_val0[6:0]};
    5'h01:
      wrlvl_rddata[7:0] = {1'b0,delay_val0[13:7]};
    5'h02: 
      wrlvl_rddata[7:0] = {1'b0,delay_val0[20:14]};
    5'h03: 
      wrlvl_rddata[7:0] = {1'b0,delay_val0[27:21]};
    5'h04:
      wrlvl_rddata[7:0] = {1'b0,delay_val0[34:28]};
    5'h05:
      wrlvl_rddata[7:0] = {1'b0,delay_val0[41:35]};
    5'h06:
      wrlvl_rddata[7:0] = {1'b0,delay_val0[48:42]};
    5'h07:
      wrlvl_rddata[7:0] = {1'b0,delay_val0[55:49]};      
    5'h08:
      wrlvl_rddata[7:0] = {1'b0,delay_val0[62:56]};
    5'h09:
      wrlvl_rddata[7:0] = {1'b0,delay_val1[6:0]};
    5'h0A:                           
      wrlvl_rddata[7:0] = {1'b0,delay_val1[13:7]};
    5'h0B:                           
      wrlvl_rddata[7:0] = {1'b0,delay_val1[20:14]};
    5'h0C:                           
      wrlvl_rddata[7:0] = {1'b0,delay_val1[27:21]};
    5'h0D:                           
      wrlvl_rddata[7:0] = {1'b0,delay_val1[34:28]};
    5'h0E:                           
      wrlvl_rddata[7:0] = {1'b0,delay_val1[41:35]};
    5'h0F:                           
      wrlvl_rddata[7:0] = {1'b0,delay_val1[48:42]};
    5'h10:                           
      wrlvl_rddata[7:0] = {1'b0,delay_val1[55:49]};      
    5'h11:                           
      wrlvl_rddata[7:0] = {1'b0,delay_val1[62:56]};
    default:
      wrlvl_rddata[7:0] = 8'h00;
  endcase
end

genvar n;
generate
  for (n=0; n<=IOG_DQS_LANES-1; n=n+1) begin  : wrlvl_instances
    WRLVL_BOT uWrlvl
    (
      .sclk                   (SCLK),
      .reset_b                (reset_n),
      .dfi_wrlvl_en           (dfi_wrlvl_en),
      .dfi_wrlvl_strobe       (dfi_wrlvl_strobe),
      .dfi_wrlvl_cs_n         (dfi_wrlvl_cs_0_n),
      .dfi_wrlvl_resp         (dfi_wrlvl_resp_i[n]),
      .delay_line_oor         (tx_out_of_range[((n+1)*9)-1]),
      .delay_line_load        (wr_load[n]),
      .delay_line_direction   (wr_direction[n]),
      .delay_line_move        (wr_move[n]),
      .pause                  (pause[n]),
      .dq_in                  (pad_rddata[(n*8)+7:(n*8)]),
      .delay_val0             (delay_val0[(n*7)+6:(n*7)]),
      .delay_val1             (delay_val1[(n*7)+6:(n*7)]),
      .error                  (error[n]), // unused for now
      .TAP_OFFSET             (TAP_OFFSET)
    );
  end
endgenerate

/* // Take in enable - delay - spit out response
// Gian

reg [8:0] dfi_wrlvl_resp;
reg [3:0] count;

// WRLVL READ TEST





always @(posedge SCLK or negedge reset_n) begin
	if(reset_n == 0) begin
			count <= 0;
			dfi_wrlvl_resp <= 0;
	end else begin
		if(count == 10) begin
			dfi_wrlvl_resp <= 9'h1ff;
			count <= 0;
		end else begin
			dfi_wrlvl_resp <= 0;
			if(dfi_wrlvl_en) begin
				count <= count + 1;
			end
		end
	end
end
	

assign wr_direction = 0;
assign wr_move = 0;
assign wr_load = 0;
assign wrlvl_rddata = 'haf;
assign oe = 0;
 */



/// Components_Start --->>>


/// Components_End <<<---


endmodule

