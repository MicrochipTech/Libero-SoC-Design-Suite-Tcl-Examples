// ****************************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2015 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: 
//
// SVN Revision Information:
// SVN $Revision: 30533 $
// SVN $Date: 2017-09-12 18:53:44 +0530 (Tue, 12 Sep 2017) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// ****************************************************************************/
`timescale 1ns/1ns
module AXI_Master (
    // AXI Interface
    ACLK,
    ARESETN,
    AWID,
    AWADDR,
    AWLEN,
    AWSIZE,
    AWBURST,
    AWVALID,
    AWREADY,
    WID,
    WDATA,
    WSTRB,
    WLAST,
    WVALID,
    WREADY,
    BREADY,
    BID,
    BRESP,
    BVALID,
    ARID,
    ARADDR,
    ARLEN,
    ARSIZE,
    ARBURST,
    ARVALID,
    ARREADY,
    RREADY,
    RID,
    RDATA,
    RRESP,
    RLAST,
    RVALID
);
////////////////////////////////////////////////////////////////////////////
// User modifiable parameters
////////////////////////////////////////////////////////////////////////////
parameter ID_WIDTH       = 4; // Sets the width of the ID field supported.
parameter WRAP_SUPPORT   = 0;
   
parameter RAM_ADDR_WIDTH = 7; // Determines the size of the wr_golden_mem and
                              // rd_actual_mem RAM buffers
parameter RAM_INIT_FILE  = "ram_init.mem";

localparam RAM_DEPTH       = 2048;//(2**RAM_ADDR_WIDTH);
localparam AXI_DWIDTH      = 64; // Sets the width of the Data Width supported.
localparam AXI_STRBWIDTH   = AXI_DWIDTH/8;  // Sets the AXI strobe width depending on AXI data width.
//localparam AXI_DW          = (AXI_DWIDTH == 64) ? 1 : 0;  // Sets the AXI strobe width depending on AXI data width.
localparam TB_DEBUG        = 1;  // 0 - Disable log messages, 1 - Enable log messages
localparam ERROR_LIMIT     = 10;
   
input                           AWREADY;
input                           WREADY;
input [ID_WIDTH-1:0]            BID;
input [1:0]                     BRESP;
input                           BVALID;
input                           ARREADY;
input [ID_WIDTH-1:0]            RID;
input [AXI_DWIDTH-1:0]          RDATA;
input [1:0]                     RRESP;
input                           RLAST;
input                           RVALID;

// Outputs on AXI Interface
input                           ACLK;
input                           ARESETN;
output  [ID_WIDTH-1:0]          AWID;
output  [31:0]                  AWADDR;
output  [3:0]                   AWLEN;
output  [2:0]                   AWSIZE;
output  [1:0]                   AWBURST;
output                          AWVALID;
output  [ID_WIDTH-1:0]          WID;
output  [AXI_DWIDTH-1:0]        WDATA;
output  [AXI_STRBWIDTH-1:0]     WSTRB;
output                          WLAST;
output                          WVALID;
output                          BREADY;
output  [ID_WIDTH-1:0]          ARID;
output  [31:0]                  ARADDR;
output  [3:0]                   ARLEN;
output  [2:0]                   ARSIZE;
output  [1:0]                   ARBURST;
output                          ARVALID;
output                          RREADY;

reg     [ID_WIDTH-1:0]          AWID;
reg     [31:0]                  AWADDR;
reg     [3:0]                   AWLEN;
reg     [2:0]                   AWSIZE;
reg     [1:0]                   AWBURST;
reg                             AWVALID;
reg     [ID_WIDTH-1:0]          WID;
reg     [AXI_DWIDTH-1:0]        WDATA;
reg     [AXI_STRBWIDTH-1:0]     WSTRB;
reg                             WLAST;
reg                             WVALID;
reg                             BREADY;
reg     [ID_WIDTH-1:0]          ARID;
reg     [31:0]                  ARADDR;
reg     [3:0]                   ARLEN;
reg     [2:0]                   ARSIZE;
reg     [1:0]                   ARBURST;
reg                             ARVALID;
reg                             RREADY;

reg     [RAM_ADDR_WIDTH:0]      axi_wr_addr;
reg     [RAM_ADDR_WIDTH:0]      axi_rd_addr;
reg     [31:0]                  read_addr;
reg     [7:0]                   wr_golden_mem [0:RAM_DEPTH-1];
reg     [7:0]                   rd_actual_mem [0:RAM_DEPTH-1];
reg     [4:0]                   len_idx;
integer                         lp_cnt;
reg [ERROR_LIMIT-1:0]           error_cnt;

////////////////////////////////////////////////////////////////////////////////
// Initial value declarations                                               
////////////////////////////////////////////////////////////////////////////////
initial begin
    AWID    = {ID_WIDTH{1'b0}};
    AWADDR  = {32{1'b0}};
    AWLEN   = 4'b0;
    AWSIZE  = 3'b0;
    AWBURST = 2'b0;
    AWVALID = 1'b0;
    WID     = {ID_WIDTH{1'b0}};
    WDATA   = {AXI_DWIDTH{1'b0}};
    WSTRB   = {AXI_STRBWIDTH{1'b0}};
    WLAST   = 1'b0;
    WVALID  = 1'b0;
    BREADY  = 1'b0;
    RREADY  = 1'b0;
    ARID    = {ID_WIDTH{1'b0}};
    ARADDR  = {32{1'b0}};
    ARLEN   = {4{1'b0}};
    ARSIZE  = {3{1'b0}};
    ARBURST = {2{1'b0}};
    ARVALID = 1'b0;
end

////////////////////////////////////////////////////////////////////////////////
// Memory initialization for simulation
////////////////////////////////////////////////////////////////////////////////
initial
begin
    for(lp_cnt = 0; lp_cnt <= RAM_DEPTH-1; lp_cnt = lp_cnt + 1)
    begin
        rd_actual_mem[lp_cnt] <= 8'b0;
    end
   error_cnt = 'h0;
end

////////////////////////////////////////////////////////////////////////////////
// RAM initialization - Populates RAM from input .mem file
////////////////////////////////////////////////////////////////////////////////
initial
begin
    $readmemb(RAM_INIT_FILE, wr_golden_mem);
end

////////////////////////////////////////////////////////////////////////////////
// Write Address Channel task
////////////////////////////////////////////////////////////////////////////////
task axi_write_addr_channel;
    input [ID_WIDTH-1:0]     AWID_in;
    input [31:0]             AWADDR_in;
    input [3:0]              AWLEN_in;
    input [2:0]              AWSIZE_in;
    input [1:0]              AWBURST_in;
    begin
        @(posedge ACLK);
        AWID    = AWID_in;
        AWADDR  = AWADDR_in;
        AWLEN   = AWLEN_in;
        AWSIZE  = AWSIZE_in;
        AWBURST = AWBURST_in;
        AWVALID = 1'b1;
        wait (AWREADY);
        @(posedge ACLK);
        AWVALID = 1'b0;
        AWADDR = 32'b0;
        AWLEN = 4'b0;
        AWSIZE = 3'b0;
        AWBURST = 2'b0;
        AWVALID = 1'b0;
    end
endtask // axi_write_addr_channel 

////////////////////////////////////////////////////////////////////////////////
// Write Data Channel task
////////////////////////////////////////////////////////////////////////////////
task axi_write_data_channel;
    input [ID_WIDTH-1:0]     WID_in;
    input [31:0]             AWADDR_in;
    input [3:0]              AWLEN_in;
    input [2:0]              AWSIZE_in;
    input [1:0]              AWBURST_in;
    input [AXI_STRBWIDTH-1:0]              WSTRB_in_first; 
    input [AXI_STRBWIDTH-1:0]              WSTRB_in_last;
    integer                  i;
    begin
        // send number of data transfer in one burst 
        for (i=0; i<=AWLEN_in; i=i+1)
        begin
            WID = WID_in;
            if (AWSIZE_in[2:0] == 3'b011) // 64-bit transfer size
            begin
                if (i==0) // First beat, unaligned transfer
                    WSTRB = WSTRB_in_first;
                else if (i==AWLEN_in) // Last beat - narrow transfer
                    WSTRB = WSTRB_in_last;
                else 
                    WSTRB = {AXI_STRBWIDTH{1'b1}}; // 8'hFF;
            end
            else if (AWSIZE_in[2:0] == 3'b010) // 32-bit transfer size
            begin
                if (i==0) // First beat, unaligned transfer
                    WSTRB = WSTRB_in_first;
                else if (i==AWLEN_in) // Last beat - narrow transfer
                    WSTRB = WSTRB_in_last; // 8'h0F or 8'hF0
                else 
                    WSTRB = {WSTRB[3:0], WSTRB[7:4]};
            end
            else if (AWSIZE_in[2:0] == 3'b001) // 16-bit transfer size
            begin
                if (i==0) // First beat, unaligned transfer
                    WSTRB = WSTRB_in_first;
                else if (i==AWLEN_in) // Last beat - narrow transfer
                    WSTRB = WSTRB_in_last;
                else
                    WSTRB = {WSTRB[5:0], WSTRB[7:6]}; // 8'h03 or 8'h0C or 8'h30 or 8'hC0
            end
            else if (AWSIZE_in[2:0] == 3'b000) // 8-bit transfer size
            begin
                if (i==0) // First beat, unaligned transfer
                    WSTRB = WSTRB_in_first;
                else if (i==AWLEN_in) // Last beat - narrow transfer
                    WSTRB = WSTRB_in_last;
                else
                    WSTRB = {WSTRB[6:0], WSTRB[7]}; // 8'h01 or 8'h02 or 8'h04 or 8'h08 or
                                                    // 8'h10 or 8'h20 or 8'h40 or 8'h80
            end
            else
            begin
                $display ("%t, Error: Only 64/32/16/8-bit transfer size supported", $time);
            end
            WVALID  = 1'b1;
            WLAST   = (i==AWLEN_in) ? 1'b1 : 1'b0; 
            wait (WREADY);
            @(posedge ACLK);
        end
        WLAST = 1'b0;
        WID = {ID_WIDTH{1'b0}};
        WSTRB = {AXI_STRBWIDTH{1'b0}};//8'b0;
        WVALID = 1'b0;
    end
endtask // axi_write_data_channel

generate
    genvar write_offset;
    for(write_offset=0; write_offset<AXI_STRBWIDTH; write_offset = write_offset + 1)
    begin : WDATA_GEN // Sweep through the byte lanes
        always @ (*)
        begin
            if((WSTRB[write_offset]) & WVALID)
                WDATA[((write_offset + 1) * 8)-1:(write_offset * 8)] = wr_golden_mem[axi_wr_addr + write_offset];  //AXI_STRBWIDTH
            else
              WDATA[((write_offset + 1) * 8)-1:(write_offset * 8)] = 8'b0;            //{AXI_STRBWIDTH{1'b0}};
        end
    end
endgenerate

////////////////////////////////////////////////////////////////////////////////
// Write Response Channel task
////////////////////////////////////////////////////////////////////////////////
task axi_write_response_channel;
    begin
        @(posedge ACLK);
        BREADY = 1'b1;
        wait (BVALID);
        @(posedge ACLK);
        BREADY = 1'b0;
    end
endtask

////////////////////////////////////////////////////////////////////////////////
// AXI Write task
////////////////////////////////////////////////////////////////////////////////
task axi_write;
    input [ID_WIDTH-1:0]     AWID_in;
    input [31:0]             AWADDR_in;
    input [3:0]              AWLEN_in;
    input [2:0]              AWSIZE_in;
    input [1:0]              AWBURST_in;
    input [AXI_STRBWIDTH-1:0]              WSTRB_in_first; 
    input [AXI_STRBWIDTH-1:0]              WSTRB_in_last; 
    begin
        axi_write_addr_channel(AWID_in,AWADDR_in,AWLEN_in,AWSIZE_in,AWBURST_in);
        axi_write_data_channel(AWID_in,AWADDR_in,AWLEN_in,AWSIZE_in,AWBURST_in,WSTRB_in_first, WSTRB_in_last);
        axi_write_response_channel();
    end
endtask // axi_write

////////////////////////////////////////////////////////////////////////////////
// AXI Read Address Channel task
////////////////////////////////////////////////////////////////////////////////
task axi_read_addr_channel;
    input [ID_WIDTH-1:0]     ARID_in;
    input [31:0]             ARADDR_in;
    input [3:0]              ARLEN_in;
    input [2:0]              ARSIZE_in;
    input [1:0]              ARBURST_in;
    begin
        @(posedge ACLK);
        ARID    = ARID_in;
        ARADDR  = ARADDR_in;
        ARLEN   = ARLEN_in;
        ARSIZE  = ARSIZE_in;
        ARBURST = ARBURST_in;
        ARVALID = 1'b1;
        wait (ARREADY);
        @(posedge ACLK);
        ARVALID = 1'b0;
        ARID    = {ID_WIDTH{1'b0}};
        ARADDR  = 32'b0;
        ARLEN   = 4'b0;
        ARSIZE  = 3'b0;
        ARBURST = 2'b0;
    end
endtask // axi_read_addr_channel

////////////////////////////////////////////////////////////////////////////////
// AXI Read Data Channel task
////////////////////////////////////////////////////////////////////////////////
task axi_read_data_channel;
    input [ID_WIDTH-1:0]     ARID_in;
    input [31:0]             ARADDR_in;
    input [3:0]              ARLEN_in;
    input [2:0]              ARSIZE_in;
    input [1:0]              ARBURST_in;
    
    integer                  i;

    // AP - added
    integer                   j;
    integer                   k;
    integer                   l;
    integer                   m;
    integer                   p;
    integer                   q;
    reg                       flag_error;

   begin
      RREADY     = 1'b0;

      axi_rd_addr   = {ARADDR_in[RAM_ADDR_WIDTH:3], 3'b0};
      read_addr     = ARADDR_in;

      flag_error  = 1'b0;

      for (i=0; i<=ARLEN_in; i=i+1)
      begin
          wait (RVALID); // Wait on slave to assert RVALID
          RREADY     = 1'b1;
          @ (posedge ACLK);

          // Store the read data in memory for comparison
          rd_actual_mem[axi_rd_addr  ] = RDATA[7 :0 ];
          rd_actual_mem[axi_rd_addr+1] = RDATA[15:8 ];
          rd_actual_mem[axi_rd_addr+2] = RDATA[23:16];
          rd_actual_mem[axi_rd_addr+3] = RDATA[31:24];
          rd_actual_mem[axi_rd_addr+4] = RDATA[39:32];
          rd_actual_mem[axi_rd_addr+5] = RDATA[47:40];
          rd_actual_mem[axi_rd_addr+6] = RDATA[55:48];
          rd_actual_mem[axi_rd_addr+7] = RDATA[63:56];

      if(TB_DEBUG) begin
         $display("\n======================================================\n");
         $display("  Comparison begins for:: %d data word",i);
      end

      if(ARSIZE_in == 3'b011) begin
         for (j=0; j<=7; j=j+1) begin
            if(rd_actual_mem[axi_rd_addr+j] == wr_golden_mem[axi_rd_addr+j]) begin
                if(TB_DEBUG) begin
		            $display("%t WRITE DATA = %h  READ DATA = %h",$time, wr_golden_mem[axi_rd_addr+j], rd_actual_mem[axi_rd_addr+j]);
                end
            end
            else begin
                flag_error = 1'b1;
                error_cnt   = error_cnt + 'h1;
                if(TB_DEBUG) begin            
		            $display("%t WRITE DATA = %h  READ DATA = %h",$time, wr_golden_mem[axi_rd_addr+j], rd_actual_mem[axi_rd_addr+j]);
                end
            end
         end
      end

      if (ARSIZE_in == 3'b010) begin
          if( read_addr[2]) begin m = 4; end
          if(!read_addr[2]) begin m = 0; end
          for (k=0; k<=3; k=k+1) begin
            if(rd_actual_mem[axi_rd_addr+k+m] == wr_golden_mem[axi_rd_addr+k+m]) begin
                if(TB_DEBUG) begin
		            $display("%t WRITE DATA = %h  READ DATA = %h",$time, wr_golden_mem[axi_rd_addr+k+m], rd_actual_mem[axi_rd_addr+k+m]);
                end
            end
            else begin
                flag_error = 1'b1;
                error_cnt   = error_cnt + 'h1;
                if(TB_DEBUG) begin            
		            $display("%t WRITE DATA = %h  READ DATA = %h",$time, wr_golden_mem[axi_rd_addr+k+m], rd_actual_mem[axi_rd_addr+k+m]);
                end
            end
         end
      end

      if (ARSIZE_in == 3'b001) begin
          if(read_addr[2:1] == 2'b11) begin p = 6; end
          if(read_addr[2:1] == 2'b10) begin p = 4; end
          if(read_addr[2:1] == 2'b01) begin p = 2; end
          if(read_addr[2:1] == 2'b00) begin p = 0; end
          for (l=0; l<=1; l=l+1) begin
            if(rd_actual_mem[axi_rd_addr+l+p] == wr_golden_mem[axi_rd_addr+l+p]) begin
                if(TB_DEBUG) begin
		            $display("%t WRITE DATA = %h  READ DATA = %h",$time, wr_golden_mem[axi_rd_addr+l+p], rd_actual_mem[axi_rd_addr+l+p]);
                end
            end
            else begin
                flag_error = 1'b1;
                error_cnt   = error_cnt + 'h1;
                if(TB_DEBUG) begin            
		            $display("%t WRITE DATA = %h  READ DATA = %h",$time, wr_golden_mem[axi_rd_addr+l+p], rd_actual_mem[axi_rd_addr+l+p]);
                end
            end
         end
      end

      if (ARSIZE_in == 3'b000) begin
          if(read_addr[2:0] == 3'b111) begin q = 7; end
          if(read_addr[2:0] == 3'b110) begin q = 6; end
          if(read_addr[2:0] == 3'b101) begin q = 5; end
          if(read_addr[2:0] == 3'b100) begin q = 4; end
          if(read_addr[2:0] == 3'b011) begin q = 3; end
          if(read_addr[2:0] == 3'b010) begin q = 2; end
          if(read_addr[2:0] == 3'b001) begin q = 1; end
          if(read_addr[2:0] == 3'b000) begin q = 0; end

          if(rd_actual_mem[axi_rd_addr+q] == wr_golden_mem[axi_rd_addr+q]) begin
              if(TB_DEBUG) begin
                  $display("%t WRITE DATA = %h  READ DATA = %h",$time, wr_golden_mem[axi_rd_addr+q], rd_actual_mem[axi_rd_addr+q]);
              end
          end
          else begin
              flag_error = 1'b1;
              error_cnt   = error_cnt + 'h1;
              if(TB_DEBUG) begin            
		          $display("%t WRITE DATA = %h  READ DATA = %h",$time, wr_golden_mem[axi_rd_addr+q], rd_actual_mem[axi_rd_addr+q]);
              end
          end
      end
      
      axi_rd_addr = (axi_rd_addr + 8);

      if (ARSIZE_in == 3'b011)
          read_addr[3:0] = read_addr[3:0] + 8;
      if (ARSIZE_in == 3'b010)
          read_addr[3:0] = read_addr[3:0] + 4;
      if (ARSIZE_in == 3'b001)
          read_addr[3:0] = read_addr[3:0] + 2;
      if (ARSIZE_in == 3'b000)
          read_addr[3:0] = read_addr[3:0] + 1;

      #5;
      end

      $display("\n\n");
      if(flag_error == 1'b0) begin
         $display("////////////////////////////////////////////////////////////////////////////////////////");
         $display("//Transaction passed                                                                  //");
         $display("////////////////////////////////////////////////////////////////////////////////////////");
      end
      else begin
         $display("////////////////////////////////////////////////////////////////////////////////////////");
         $display("//Transaction failed                                                                  //");
         $display("////////////////////////////////////////////////////////////////////////////////////////");
      end
      $display("\n\n");      
      
   end
endtask // axi_read_data_channel 


////////////////////////////////////////////////////////////////////////////////
// 
////////////////////////////////////////////////////////////////////////////////
initial
begin
    wait(ARESETN == 1'b1);
    #100;
    // The AXIMASTER.axi_write function uses the value specified to the
    // WSTRB_first argument to generate WSTRB[7:0] during the first data
    // beat/transfer of the transaction. Similarly, WSTRB[7:0] is generated from
    // the value passed to the STRB_last argument during the last data beat 
    // (with the exception of a transaction containing a single beat/transfer).
    // WSTRB[7:0] is driven out as 8'hFF for all other beats/transfers
    // in the transaction.
    
    // The WDATA is generated as a 64-bit pseudorandom number, unique for each
    // beat of the transfer.
    $display ("****************************************************************");
    $display ("Incremental burst write-read test of all transfer lengths");
    $display ("supported by CoreAXItoAHBL");
    $display ("****************************************************************");
   
   len_idx = 15;
   // This testbench supports only aligned transfers.

   // -----------------------------------
   // Increment transfers for 64-bit size
   // -----------------------------------
   $display ("****************************************");
   $display ("64-bit AXI transfers - Increment burst");
   $display ("****************************************");
   //        ID,   ADDR,         LEN,     SIZE, BURST, WSTRB_first, WSTRB_last
   axi_write(4'h6, 32'h00000000, len_idx, 3'h3, 2'b01, 8'hFF,       8'hFF);
   #500;
   //       ID,   ADDR,         LEN,     SIZE, BURST
   axi_read(4'h6, 32'h00000000, len_idx, 3'h3, 2'b01);
   #500;

   // -----------------------------------
   // Increment transfers for 32-bit size
   // -----------------------------------
   $display ("****************************************");
   $display ("32-bit AXI transfers - Increment burst");
   $display ("****************************************");
   //        ID,   ADDR,         LEN,     SIZE, BURST, WSTRB_first, WSTRB_last
   axi_write(4'h6, 32'h00000004, len_idx, 3'h2, 2'b01, 8'hF0,       8'h0F);
   #500;
   //       ID,   ADDR,         LEN,     SIZE, BURST
   axi_read(4'h6, 32'h00000004, len_idx, 3'h2, 2'b01);
   #500;

   // -----------------------------------
   // Increment transfers for 16-bit size
   // -----------------------------------
   $display ("****************************************");
   $display ("16-bit AXI transfers - Increment burst");
   $display ("****************************************");
   //        ID,   ADDR,         LEN,     SIZE, BURST, WSTRB_first, WSTRB_last
   axi_write(4'h6, 32'h00000006, len_idx, 3'h1, 2'b01, 8'hC0,       8'h30);
   #500;
   //       ID,   ADDR,         LEN,     SIZE, BURST
   axi_read(4'h6, 32'h00000006, len_idx, 3'h1, 2'b01);
   #500;

   // ----------------------------------
   // Increment transfers for 8-bit size
   // ----------------------------------
   $display ("****************************************");
   $display ("8-bit AXI transfers - Increment burst");
   $display ("****************************************");
   //        ID,   ADDR,         LEN,     SIZE, BURST, WSTRB_first, WSTRB_last
   axi_write(4'h6, 32'h00000007, len_idx, 3'h0, 2'b01, 8'h80,       8'h40);
   #500;
   //       ID,   ADDR,         LEN,     SIZE, BURST
   axi_read(4'h6, 32'h00000007, len_idx, 3'h0, 2'b01);
   #500;

   #500;

   if(WRAP_SUPPORT) begin
      $display ("****************************************************************");
      $display ("Wrap burst write-read test");
      $display ("supported by CoreAXItoAHBL");
      $display ("****************************************************************");

      // ------------------------------
      // Wrap transfers for 64-bit size
      // ------------------------------
      $display ("***********************************");
      $display ("64-bit AXI transfers - Wrap burst");
      $display ("***********************************");
      //        ID,   ADDR,         LEN,     SIZE, BURST, WSTRB_first, WSTRB_last
      axi_write(4'h6, 32'h00000000, len_idx, 3'h3, 2'b10, 8'hFF,       8'hFF);
      #500;
      //       ID,   ADDR,         LEN,     SIZE, BURST
      axi_read(4'h6, 32'h00000000, len_idx, 3'h3, 2'b10);
      #500;

      // ------------------------------
      // Wrap transfers for 32-bit size
      // ------------------------------
      $display ("***********************************");
      $display ("32-bit AXI transfers - Wrap burst");
      $display ("***********************************");
      //        ID,   ADDR,         LEN,     SIZE, BURST, WSTRB_first, WSTRB_last
      axi_write(4'h6, 32'h00000004, len_idx, 3'h2, 2'b10, 8'hF0,       8'h0F);
      #500;
      //       ID,   ADDR,         LEN,     SIZE, BURST
      axi_read(4'h6, 32'h00000004, len_idx, 3'h2, 2'b10);
      #500;

      // ------------------------------
      // Wrap transfers for 16-bit size
      // ------------------------------
      $display ("***********************************");
      $display ("16-bit AXI transfers - Wrap burst");
      $display ("***********************************");
      //        ID,   ADDR,         LEN,     SIZE, BURST, WSTRB_first, WSTRB_last
      axi_write(4'h6, 32'h00000006, len_idx, 3'h1, 2'b10, 8'hC0,       8'h30);
      #500;
      //       ID,   ADDR,         LEN,     SIZE, BURST
      axi_read(4'h6, 32'h00000006, len_idx, 3'h1, 2'b10);
      #500;

      // -----------------------------
      // Wrap transfers for 8-bit size
      // -----------------------------
      $display ("***********************************");
      $display ("8-bit AXI transfers - Wrap burst");
      $display ("***********************************");
      //        ID,   ADDR,         LEN,     SIZE, BURST, WSTRB_first, WSTRB_last
      axi_write(4'h6, 32'h00000007, len_idx, 3'h0, 2'b10, 8'h80,       8'h40);
      #500;
      //       ID,   ADDR,         LEN,     SIZE, BURST
      axi_read(4'h6, 32'h00000007, len_idx, 3'h0, 2'b10);
      #500;
   end
   
   #1000;
   //Stop the simulation
   $stop;
end

////////////////////////////////////////////////////////////////////////////////
// AXI Read task
////////////////////////////////////////////////////////////////////////////////
task axi_read;
    input [ID_WIDTH-1:0]     ARID_in;
    input [31:0]             ARADDR_in;
    input [3:0]              ARLEN_in;
    input [2:0]              ARSIZE_in;
    input [1:0]              ARBURST_in;
    begin
       axi_read_addr_channel(ARID_in,ARADDR_in,ARLEN_in,ARSIZE_in,ARBURST_in);

       axi_read_data_channel(ARID_in,ARADDR_in,ARLEN_in,ARSIZE_in,ARBURST_in);
    end
endtask // axi_read 

////////////////////////////////////////////////////////////////////////////////
// Capture the write address & store the write data in memory for comparison
////////////////////////////////////////////////////////////////////////////////
always @ (posedge ACLK)
begin
    if (AWVALID & AWREADY)
        axi_wr_addr <= {AWADDR[RAM_ADDR_WIDTH:3], 3'b0}; // Align the start address to 64-bit transfer
    else if (WREADY & WVALID)
        axi_wr_addr <= axi_wr_addr + 4'd8;
end

endmodule
