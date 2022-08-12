`timescale 1ns / 1ns
///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: MICROSEMI
//
// IP Core: COREAXI4INTERCONNECT
//
//  Description  : The AMBA AXI4 Interconnect core connects one or more AXI memory-mapped master devices to one or
//                 more memory-mapped slave devices. The AMBA AXI protocol supports high-performance, high-frequency
//                 system designs.
//
//     Abstract  : Holding register for DWC read control
//
//  COPYRIGHT 2017 BY MICROSEMI 
//  THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
//  FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
//  MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
//  NO BACK-UP OF THE FILE SHOULD BE MADE. 
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 



module caxi4interconnect_DWC_DownConv_Hold_Reg_Wr (
          // Inputs
          ACLK,
          sysReset,

          DWC_DownConv_hold_data_in,
          DWC_DownConv_hold_fifo_empty,

          DWC_DownConv_hold_get_next_data,

          // Outputs
          DWC_DownConv_hold_fifo_rd_en,
          DWC_DownConv_hold_data_out,
          DWC_DownConv_hold_reg_empty,
          
          // Decoded outputs
          slaveLen_M1,
          master_ADDR_masked,
          second_Beat_Addr,
          sizeCnt_comb_EQ_SizeMax,
          sizeCnt_comb_P1
          );

  parameter integer  CMD_FIFO_DATA_WIDTH = 29;
  parameter integer  ID_WIDTH = 1;

  input wire  ACLK;
  input wire  sysReset;

  input wire [CMD_FIFO_DATA_WIDTH-1:0] DWC_DownConv_hold_data_in;
  input wire  DWC_DownConv_hold_fifo_empty;

  input wire  DWC_DownConv_hold_get_next_data;

  output wire DWC_DownConv_hold_fifo_rd_en;
  output reg  [CMD_FIFO_DATA_WIDTH-1:0] DWC_DownConv_hold_data_out;
  output wire DWC_DownConv_hold_reg_empty;
  
  output reg [7:0] slaveLen_M1;
  output reg [5:0] master_ADDR_masked;
  output reg [5:0] second_Beat_Addr;
  output reg       sizeCnt_comb_EQ_SizeMax;
  output reg [5:0] sizeCnt_comb_P1;

  wire DWC_DownConv_hold_reg_empty_inv;

  wire DWC_DownConv_pass_data;
  
  
  
  always @(posedge ACLK or negedge sysReset) begin
    if (!sysReset) begin
      DWC_DownConv_hold_data_out <= 0;
      
      // Set decoded outputs to 0
          slaveLen_M1              <= 0;
          master_ADDR_masked       <= 0;
          second_Beat_Addr         <= 0;
          sizeCnt_comb_EQ_SizeMax  <= 0;
          sizeCnt_comb_P1          <= 0;
      
      
    end
    else begin
      if (DWC_DownConv_pass_data)
        begin
        DWC_DownConv_hold_data_out <= DWC_DownConv_hold_data_in;
      
      // Assign decoded outputs
          slaveLen_M1              <= ( DWC_DownConv_hold_data_in[22:14] - 1 );
          master_ADDR_masked       <= ( DWC_DownConv_hold_data_in[28:23] & (~(( ~((1 << DWC_DownConv_hold_data_in[10:8]) - 1) ))) );
          second_Beat_Addr         <= ( DWC_DownConv_hold_data_in[28:23] + ( 1 << DWC_DownConv_hold_data_in[13:11] ) );
          sizeCnt_comb_EQ_SizeMax  <= ( (DWC_DownConv_hold_data_in[(35+ID_WIDTH):(30+ID_WIDTH)]) == (DWC_DownConv_hold_data_in[6:1]) );
          sizeCnt_comb_P1          <= ( DWC_DownConv_hold_data_in[(35+ID_WIDTH):(30+ID_WIDTH)] + 1 );
      end
      
    end
  end
  
  
  assign DWC_DownConv_hold_reg_empty = !DWC_DownConv_hold_reg_empty_inv;
  
caxi4interconnect_Hold_Reg_Ctrl DWC_DownConv_Hold_Reg_Ctrl (

      .rst(sysReset), // input
      .clk(ACLK), // input

      .src_data_valid( !DWC_DownConv_hold_fifo_empty ), // input
      .get_next_data_hold( DWC_DownConv_hold_get_next_data ), // input
    
      .pass_data( DWC_DownConv_pass_data ), // output // Control the holding register
      .get_next_data_src( DWC_DownConv_hold_fifo_rd_en ), // output
      .hold_data_valid( DWC_DownConv_hold_reg_empty_inv ) // output
);

endmodule
