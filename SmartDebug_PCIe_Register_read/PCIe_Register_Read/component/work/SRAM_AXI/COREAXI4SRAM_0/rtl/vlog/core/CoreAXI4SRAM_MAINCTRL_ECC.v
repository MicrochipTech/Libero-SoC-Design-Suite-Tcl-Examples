// ********************************************************************/
// Actel Corporation Proprietary and Confidential
//  Copyright 2011 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:  CoreAXI4SRAM_MAINCTRL
//               
//               
//
//
// Revision Information:
// Date     Description
//
// SVN Revision Information:
// SVN $Revision: 4805 $
// SVN $Date: 2012-06-21 17:48:48 +0530 (Thu, 21 Jun 2012) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
//               
//
//  Structure:
//            CoreAXI4SRAM (TOP) _   
//                               |
//                               |_ CoreAXI4_SLVIF
//                               |
//                               |_ CoreAXI4_MAINCTRL
//               
//
// ********************************************************************/
module SRAM_AXI_COREAXI4SRAM_0_CoreAXI4SRAM_MAINCTRL_ECC(
                             ACLK,
                             ARESETN,
							 
							 //AXI Write Channel Logic Ports
							 
                             AWID_slvif,
                             AWVALID_slvif,
                             AWADDR_slvif,
                             AWSIZE_slvif,
                             AWLEN_slvif,
                             AWBURST_slvif,
                             WDATA_slvif,
                             WSTRB_slvif,
                             WLAST_slvif,
                             WVALID_slvif,
                             BREADY_slvif,
                             AWVALID,
                             AWADDR,
                             AWSIZE,
                             AWBURST,
							 
							 waddrchset_mc,
                             awready_mc,
                             wready_mc,
                             bvalid_mc,
                             bid_mc,
                             bresp_mc,
							 
                             //AXI Read Channel LogicPorts
                            							 
                             ARBURST_slvif,
                             ARID_slvif,
                             ARVALID_slvif,
                             ARADDR_slvif,
                             ARVALID,
                             ARADDR,
                             ARSIZE,
                             ARBURST,
                             ARLEN,
                             ARSIZE_slvif,
                             ARLEN_slvif, 
                             RREADY_slvif,                             ,
                             raddrchset_mc,
                             arready_mc,
                             rvalid_mc,
                             rid_mc,
                             rlast_mc,
                             rresp_mc,
                             rdata_mc,
							 
                             // To SRAM Memory Interface
                             wbyteen_sc,
                             waddr_sc,
                             wdata_sc,
                             wen_sc,
                             ren_sc,
                             raddr_sc,
                             rdata_sc
                          
                             );


   // --------------------------------------------------------------------------
   // PARAMETER Declaration
   // --------------------------------------------------------------------------
   parameter FAMILY           = 25;
   parameter AXI4_DWIDTH      = 64;
   parameter AXI4_AWIDTH      = 32;
   parameter AXI4_IFTYPE_WR   = 1;
   parameter AXI4_IFTYPE_RD   = 1;
   parameter SEL_SRAM_TYPE    = 1;
   parameter MEM_DEPTH        = 512;
   parameter PIPE          = 1;
   parameter AXI4_IDWIDTH     = 4;
   parameter MEM_AWIDTH       = 9;
   parameter WRAP_SUPPORT     = 1; // Enables to handle the AXI wapping burst type.
                                    // Must be enabled in order for the wrapping burst
                                    // transactions to work.
   
   parameter ECC              = 1;
   // --------------------------------------------------------------------------
   // Local Parameter Declaration
   // --------------------------------------------------------------------------
   localparam BRESP_OK         = 2'b00;
   localparam BRESP_ERR        = 2'b01;
   localparam RRESP_OK         = 2'b00;
   localparam RRESP_ERR        = 2'b01;
   
   localparam HIGH_PERF        = 1'b1; // 1 - high throughput, 0 - low throughput

   // -------------------------------------------------------------------------
   // I/O Signals
   // -------------------------------------------------------------------------
   // Clock and Clock control signals
   input                        ACLK;
   input                        ARESETN;

   // From AXI4 Slave interface
   input [AXI4_IDWIDTH-1:0]     AWID_slvif;   
   input                        AWVALID_slvif;
   input [AXI4_AWIDTH - 1:0]    AWADDR_slvif;
   input [2:0]                  AWSIZE_slvif;   
   input [7:0]                  AWLEN_slvif; 
   input [1:0]                  AWBURST_slvif;   
   input                        BREADY_slvif;
   input [AXI4_DWIDTH - 1:0]    WDATA_slvif;
   input [AXI4_DWIDTH/8-1:0]    WSTRB_slvif;
   input                        WLAST_slvif;
   input                        WVALID_slvif;
   input                        AWVALID;
   input [AXI4_AWIDTH - 1:0]    AWADDR;
   input [2:0]                  AWSIZE;   
   input [1:0]                  AWBURST;   
   input [AXI4_IDWIDTH-1:0]     ARID_slvif;   
   input                        ARVALID_slvif;
   input [1:0]                  ARBURST_slvif;
   input [AXI4_AWIDTH - 1:0]    ARADDR_slvif;
   input [2:0]                  ARSIZE;
   input [2:0]                  ARSIZE_slvif;
   input [7:0]                  ARLEN_slvif;   
   input                        RREADY_slvif;
   input                        ARVALID;
   input [AXI4_AWIDTH - 1:0]    ARADDR;
   input [7:0]                  ARLEN;   
   input [1:0]                  ARBURST;
   
   // To AXI4 Slave interface
   output                       awready_mc;
   output                       wready_mc;
   output                       arready_mc;
   output                       waddrchset_mc;   
   output                       raddrchset_mc;   
   output                       bvalid_mc;
   output [AXI4_IDWIDTH-1:0]    bid_mc;   
   output [1:0]                 bresp_mc;
   output                       rvalid_mc;
   output [1:0]                 rresp_mc;
   output [AXI4_IDWIDTH-1:0]    rid_mc;
   output                       rlast_mc;
   output [AXI4_DWIDTH - 1:0]   rdata_mc;

   // To SRAM Memory Interface   
   output [(AXI4_DWIDTH/8)-1:0] wbyteen_sc; 
   output [MEM_AWIDTH-1:0]      waddr_sc;
   output [AXI4_DWIDTH-1:0]     wdata_sc;
   output                       wen_sc;   
   output                       ren_sc;   
   output [MEM_AWIDTH-1:0]      raddr_sc;
   input [AXI4_DWIDTH-1:0]      rdata_sc;

   // --------------------------------------------------------------------------
   // Local parameters 
   // --------------------------------------------------------------------------

   // Request-Gnt state machine 
   localparam                  REQ_IDLE_ST = 2'b00;
   localparam                  REQ_WR_ST = 2'b01;
   localparam                  REQ_RD_ST = 2'b10;
     
   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   
   reg                         awready_mc;
   reg                         wready_mc;
   reg                         arready_mc;
   reg                         waddrchset_mc;
   reg                         raddrchset_mc;
   reg                         bvalid_mc;
   reg [AXI4_IDWIDTH-1:0]      bid_mc;   
   reg [1:0]                   bresp_mc;
   reg [MEM_AWIDTH - 1:0]      waddr_sc;
   reg [AXI4_AWIDTH - 1:0]     waddr_sc_dummy;
   reg [AXI4_DWIDTH-1:0]       wdata_sc; 
   reg [AXI4_DWIDTH-1:0]       wdata_sc_r; 
   reg [(AXI4_DWIDTH/8)-1:0]   axi4_wbyteen_sc; 
   reg                         wen_sc;
   reg [AXI4_AWIDTH - 1:0]     waddr_aligned;
   reg [AXI4_AWIDTH - 1:0]     wrap_waddr_incr;
   reg [AXI4_AWIDTH - 1:0]     wrap_waddr_incr_r;
   reg [AXI4_AWIDTH - 1:0]     wrap_waddr_next_r;
   reg [AXI4_AWIDTH - 1:0]     wrap_waddr_next;
   reg [AXI4_AWIDTH - 1:0]     wrap_waddr_plus;
   reg [AXI4_AWIDTH - 1:0]     wrap_waddr_calc;
   reg [AXI4_AWIDTH - 1:0]     raddr_sc_dummy;
   reg [AXI4_AWIDTH - 1:0]     wrap_raddr_incr;
   reg [AXI4_AWIDTH - 1:0]     wrap_raddr_next;
   reg [AXI4_AWIDTH - 1:0]     wrap_raddr_next_r;
   reg [AXI4_AWIDTH - 1:0]     wrap_raddr_plus;
   reg [AXI4_AWIDTH - 1:0]     wrap_raddr;
   reg [AXI4_AWIDTH - 1:0]     wrap_raddr_r;
   reg [7:0]                   number_bytes;  
   reg [7:0]                   number_bytes_r;
   reg [MEM_AWIDTH - 1:0]      raddr_sc;
   reg [MEM_AWIDTH - 1:0]      read_raddr_sc;
   reg [AXI4_AWIDTH - 1:0]     raddr_aligned;
   reg [7:0]                   rd_number_bytes;  
   reg [7:0]                   rd_number_bytes_r;
   reg [8:0]                   rdbeat_cnt;
   reg [AXI4_DWIDTH - 1:0]     rdata_mc;
   reg                         ren_sc;
   reg [AXI4_IDWIDTH-1:0]      rid_mc;
   reg                         rlast_mc;
   reg                         rvalid_mc;
   
   wire [AXI4_DWIDTH-1:0]      rdata_sc;
   reg                         ren_sc_d1;
   reg                         ren_sc_d2;
   reg                         ren_sc_d3;
   reg                         set_rdaligned_done;
   reg                         set_rdaligned_done_r;
   reg [AXI4_AWIDTH - 1:0]     raddr_aligned_load;
   reg [AXI4_AWIDTH - 1:0]     raddr_aligned_load_r;
   reg                         set_wraligned_done;
   reg [AXI4_AWIDTH - 1:0]     waddr_aligned_load;
   reg [AXI4_AWIDTH - 1:0]     waddr_aligned_load_r;
   wire                        set_aligned_done;
   reg                         wr_wrap_boundary;
   reg                         wr_req_inprog;
   reg                         wr_req_inprog_r;
   reg                         rd_req_inprog;
   reg                         rd_req_inprog_r;
   reg [1:0]                   req_curr_state;
   reg [1:0]                   req_next_state;
   reg                         wr_req_gnt;
   reg                         rd_req_gnt;   
   reg                         wr_wrap_boundary_int;
   wire                        rddata_start;
   reg                         rddata_start_d;

   reg                         axi_write_det;
   reg                         ren_sc_ctrl;
   reg                         axi_write_det_d1;
   reg                         axi_write_det_d2;
   reg                         axi_write_det_d3;
   wire                        axi_write;
   reg [8:0]                   ram_rdreq_cntr;   
   reg                         wready_en;

 
   // --------------------------------------------------------------------------
   // ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   // ||                                                                      ||
   // ||                     Start - of - Code                                ||
   // ||                                                                      ||
   // ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   // --------------------------------------------------------------------------
    
   always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) begin
         wr_req_inprog_r <= 1'b0;         
         rd_req_inprog_r <= 1'b0;         
      end
      else begin
         wr_req_inprog_r <= wr_req_inprog;
         rd_req_inprog_r <= rd_req_inprog;
      end
   end
   
   // State machine to arbitrate between AW-channel and 
   // AR-channel
   always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) begin
         req_curr_state <= REQ_IDLE_ST;         
      end
      else begin
         req_curr_state <= req_next_state;
      end
   end

   // ----------------------------- //
   // Next state and output decoder //
   // ----------------------------- //
   always @(*) begin
      req_next_state = req_curr_state;
      wr_req_inprog  = wr_req_inprog_r;
      rd_req_inprog  = rd_req_inprog_r;
      case (req_curr_state)
        REQ_IDLE_ST : begin
           // ---------------------------------------------------- //
           // ---------------------------------------------------- //
           if(AWVALID_slvif == 1'b1) begin
             req_next_state = REQ_WR_ST;
           end
           else if(ARVALID_slvif == 1'b1) begin
             req_next_state = REQ_RD_ST;
           end

           // ------- //
           // Outputs //
           // ------- //
           if(AWVALID_slvif == 1'b1) begin
              wr_req_inprog = 1'b1;
           end
           else begin
              wr_req_inprog = 1'b0;
           end
           if(ARVALID_slvif == 1'b1) begin
              rd_req_inprog = 1'b1;
           end
           else begin
              rd_req_inprog = 1'b0;
           end
           wr_req_gnt     = 1'b0;
           rd_req_gnt     = 1'b0;

        end
        REQ_WR_ST : begin
           // ---------------------------------------------------- //
           // ---------------------------------------------------- //
           if(bvalid_mc & BREADY_slvif) begin
             if(rd_req_inprog) begin
               req_next_state = REQ_RD_ST;
			   wr_req_inprog = 1'b0;
             end
             else begin
               req_next_state = REQ_IDLE_ST;
             end
           end
       
           // ------- //
           // Outputs //
           // ------- //
           wr_req_gnt     = 1'b1;
           rd_req_gnt     = 1'b0;

        end
        REQ_RD_ST : begin
           // ---------------------------------------------------- //
           // ---------------------------------------------------- //
           if(rvalid_mc & RREADY_slvif & rlast_mc) begin
             req_next_state = REQ_IDLE_ST;
           end
       
           // ------- //
           // Outputs //
           // ------- //
           rd_req_gnt     = 1'b1;
           wr_req_gnt     = 1'b0;

        end
        default:
        begin
            req_next_state = REQ_IDLE_ST;        
            wr_req_gnt     = 1'b0;
            rd_req_gnt     = 1'b0;	
        end
      endcase 
   end

   always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) 
         axi_write_det    <= 1'b0;
	  else if(FAMILY == 25)
	    begin 
          if(ECC == 1 & PIPE == 1)
            begin 
              if(~wready_mc & WVALID_slvif & ~axi_write_det & ~axi_write_det_d2 & wready_en)
	            axi_write_det    <= 1'b1;
	          else 
                axi_write_det    <= 1'b0;
            end 
          else if(ECC == 1 & PIPE == 2)
            begin 
              if(~wready_mc & WVALID_slvif & ~axi_write_det & ~axi_write_det_d1 & ~axi_write_det_d3 & wready_en)
	            axi_write_det    <= 1'b1;
	          else 
                axi_write_det    <= 1'b0;        
            end    
          else 
            begin       
              if(~wready_mc & WVALID_slvif & ~axi_write_det & wready_en)
	            axi_write_det    <= 1'b1;
	          else 
                axi_write_det    <= 1'b0;
            end
        end 
      else 
	    begin 
          if(ECC == 1 & PIPE == 2)
            begin 
              if(~wready_mc & WVALID_slvif & ~axi_write_det & ~axi_write_det_d1 & wready_en)
	            axi_write_det    <= 1'b1;
	          else 
                axi_write_det    <= 1'b0;        
            end    
          else 
            begin       
              if(~wready_mc & WVALID_slvif & ~axi_write_det & wready_en)
	            axi_write_det    <= 1'b1;
	          else 
                axi_write_det    <= 1'b0;
            end
		end 
   end

   always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) 
         axi_write_det_d1    <= 1'b0;
      else if(PIPE !=0)
	     axi_write_det_d1    <= axi_write_det;
   end

   always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) 
         axi_write_det_d2    <= 1'b0;
      else if(PIPE == 2 | ECC == 1)
	     axi_write_det_d2    <= axi_write_det_d1;
   end

   always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) 
         axi_write_det_d3    <= 1'b0;
      else if(PIPE == 2 & ECC == 1)
	     axi_write_det_d3    <= axi_write_det_d2;
   end   
 
 
   always@(posedge ACLK or negedge ARESETN)
     if(ARESETN == 1'b0)
	   ram_rdreq_cntr <= 0;
	 else if(rvalid_mc & rlast_mc & RREADY_slvif)
	   ram_rdreq_cntr <= 0;
     else if(ren_sc & ~wr_req_inprog)		
       ram_rdreq_cntr <= ram_rdreq_cntr + 1'b1;		
	   
generate
  if(PIPE != 0)
    begin   
      always@(*)
        if((ram_rdreq_cntr == (ARLEN_slvif + 1)))
	      ren_sc = 1'b0;
	    else if(((rddata_start_d & RREADY_slvif) | set_rdaligned_done_r) |
		       (WVALID_slvif & ~wready_mc & ~ren_sc_ctrl & wr_req_inprog & wready_en))
          ren_sc = 1'b1;
        else 
          ren_sc = 1'b0;	
    end 
  else 
    begin 
	  
	  reg      RREADY_slvif_r;
	
      always @(posedge ACLK or negedge ARESETN) 
        if(ARESETN == 1'b0) 
          RREADY_slvif_r <= 1'b0;	
        else 
          RREADY_slvif_r <= RREADY_slvif;			   
		 
      always @(*) begin
        if ((WVALID_slvif & ~wready_mc & ~ren_sc_ctrl & wr_req_inprog) & wready_en)
	      ren_sc = 1'b1;
        else if(ram_rdreq_cntr == (ARLEN_slvif + 1)) 
          ren_sc = 1'b0;        
		else if((rddata_start_d & RREADY_slvif_r) | set_rdaligned_done_r) 
          ren_sc = 1'b1;        
		else  
		  ren_sc = 1'b0;		 
      end // always @ (*) 	
	end 
endgenerate	


   always@(*)
     if(wr_req_inprog)
	   raddr_sc = waddr_sc;
	 else
	   raddr_sc = read_raddr_sc;

   // ------------------------------------------------------------------------- //
   //           Generate logic for AXI4 Write and SRAM Write                    //
   // -----------------------------------------------------------------------   //
   
generate 
  if(AXI4_IFTYPE_WR)   
    begin    
	  wire                        wrdone;
	  reg                         wrdone_d;
	  reg                         wready_ctrl;
	  reg [AXI4_DWIDTH-1:0]       rdata_sc_d;
	  reg                         wr_req_gnt_d;
	  
	  integer                     i;
	  
      assign wbyteen_sc = {(AXI4_DWIDTH/8){1'b1}};	  
		 
      assign set_aligned_done = AWVALID_slvif & awready_mc;
	  
      always@(*)
        wready_ctrl = (& WSTRB_slvif) ? 1'b1 : 
                      ((PIPE == 0 & ECC == 2) | (PIPE == 1 & ECC == 2)) ? axi_write_det :
                      (PIPE == ECC) ? ( axi_write_det_d1) :
	      		       axi_write_det_d2;
      
      always @(*) begin
         wready_mc      = wready_en & wready_ctrl;
      end	  
      
      always @(posedge ACLK or negedge ARESETN) begin
        if(ARESETN == 1'b0) begin
		  wready_en     <= 1'b0;
        end 
        else if(rd_req_gnt | wrdone) begin 
		  wready_en     <= 1'b0;
        end 
        else if(AWVALID_slvif & awready_mc) begin 
		  wready_en     <= 1'b1;
        end 		
      end 	

     always @(posedge ACLK or negedge ARESETN) 
       if(ARESETN == 1'b0) 
         wr_req_gnt_d <= 1'b0;
	   else 
	     wr_req_gnt_d <= wr_req_gnt;

	  
      always @(posedge ACLK or negedge ARESETN) begin
        if(ARESETN == 1'b0) begin
          awready_mc    <= 1'b0;
	      waddrchset_mc <= 1'b0;
        end
        else if(wr_req_gnt & ~wr_req_gnt_d)begin
          awready_mc    <= 1'b1;
	      waddrchset_mc <= 1'b1;
        end
        else begin
          awready_mc    <= 1'b0;
	      waddrchset_mc <= 1'b0;
        end
     end   
	 
     always @(posedge ACLK or negedge ARESETN) 
       if(ARESETN == 1'b0) 
         set_wraligned_done <= 1'b0;
	   else if(AWVALID_slvif & awready_mc)
	     set_wraligned_done <= 1'b1;
	   else 
	     set_wraligned_done <= 1'b0;
		 
   // ----------------------------------------------------------------------- //
   // Generate Write Response related outputs                                 //
   // Outputs:                                                                //
   //         BID/BRESP/BVALID                                                //
   // ----------------------------------------------------------------------- //
     always @(*) begin
       bresp_mc  = BRESP_OK;
       bid_mc    = AWID_slvif;
     end 
	 
	 assign wrdone = WVALID_slvif & wready_mc & WLAST_slvif;
	 
     always @(posedge ACLK or negedge ARESETN)
       if(ARESETN == 1'b0)
         wrdone_d <= 1'b0;
	   else 
	     wrdone_d <= wrdone;

     always @(posedge ACLK or negedge ARESETN)
       if(ARESETN == 1'b0)
         bvalid_mc <= 1'b0;
	   else if(wrdone & ~wrdone_d)
	     bvalid_mc <= 1'b1;
	   else if(BREADY_slvif)
	     bvalid_mc <= 1'b0;
	
     always @(posedge ACLK or negedge ARESETN) begin
        if(ARESETN == 1'b0) begin
           wdata_sc_r   <= 'h0;
        end
        else begin
           wdata_sc_r <= wdata_sc;
        end
     end 
	 
     always @(posedge ACLK or negedge ARESETN) begin
        if(ARESETN == 1'b0) begin
           wr_wrap_boundary_int   <= 'h0;
        end
        else begin
           if(WVALID_slvif && wready_mc) begin
              wr_wrap_boundary_int   <= 'h0;
           end
           else if(wr_wrap_boundary) begin
              wr_wrap_boundary_int   <= 'h1;
           end
        end
     end

   
   // Write signals to SRAM

   // ---------------------------------------------------------------------------------- //
   // waddr_sc::                                                                         //
   // Write Address generation logic to SRAM                                             //
   // For 64-bit datawidth and AWSIZE = 3, each 64-bit transaction on AXI4               //
   // interface is converted into 2, 32-bit transactions on the SRAM memory interface.   //
   // For 64-bit datawidth and AWSIZE < 3, each 64-bit transaction on AXI4 interface     //
   // is converted into corresponding 32-bit transaction on the SRAM memory interface    //
   // based on the address.                                                              //
   // For 32-bit datawidth and For AWSIZE < 3, each 32-bit transaction on AXI4 interface //
   // is converted into corresponding 32-bit transaction on the SRAM memory interface    //
   // based on the address.                                                              //
   // ---------------------------------------------------------------------------------- //
     always @(posedge ACLK or negedge ARESETN) begin
        if(ARESETN == 1'b0) begin
           waddr_sc   <= 'h0;
           waddr_sc_dummy   <= 'h0;
        end
        else begin
           // For burst type = WRAP
           // For AWSIZE = 3'b011
              if(set_aligned_done && AWBURST == 2'b10 && WRAP_SUPPORT) begin
                 if(AXI4_DWIDTH == 512) begin
                    waddr_sc <= waddr_aligned_load >> 6;                  
                 end
                 else if(AXI4_DWIDTH == 256) begin
                    waddr_sc <= waddr_aligned_load >> 5;                  
                 end
                 else if(AXI4_DWIDTH == 128) begin
                    waddr_sc <= waddr_aligned_load >> 4;                  
                 end
                 else if(AXI4_DWIDTH == 64) begin
                    waddr_sc <= waddr_aligned_load >> 3;                  
                 end
                 else if(AXI4_DWIDTH == 32) begin
                    waddr_sc <= waddr_aligned_load >> 2;                  
                 end
     
                 waddr_sc_dummy <= waddr_aligned_load;
              end
              else if(WVALID_slvif && wready_mc && AWBURST_slvif == 2'b10 && WRAP_SUPPORT) begin
                 if(AXI4_DWIDTH == 512) begin
                    waddr_sc <= wrap_waddr_next >> 6;
                 end
                 else if(AXI4_DWIDTH == 256) begin
                    waddr_sc <= wrap_waddr_next >> 5;                  
                 end
                 else if(AXI4_DWIDTH == 128) begin
                    waddr_sc <= wrap_waddr_next >> 4;                  
                 end
                 else if(AXI4_DWIDTH == 64) begin
                    waddr_sc <= wrap_waddr_next >> 3;                  
                 end
                 else if(AXI4_DWIDTH == 32) begin
                    waddr_sc <= wrap_waddr_next >> 2;                  
                 end
	            waddr_sc_dummy <= wrap_waddr_next;
              end
              // For burst type = INCR
              // 64-bit tansaction on AXI IF is converted into 2, 32-bit transactions on the 
              // SRAM IF to match with the SRAM Fabric memory configuration.
              else if(set_aligned_done && AWBURST != 2'b10) begin
                 if(AXI4_DWIDTH == 512) begin
                    waddr_sc <= waddr_aligned_load >> 6;
                 end
                 else if(AXI4_DWIDTH == 256) begin
                    waddr_sc <= waddr_aligned_load >> 5;                  
                 end
                 else if(AXI4_DWIDTH == 128) begin
                    waddr_sc <= waddr_aligned_load >> 4;                  
                 end
                 else if(AXI4_DWIDTH == 64) begin
                    waddr_sc <= waddr_aligned_load >> 3;                  
                 end
                 else if(AXI4_DWIDTH == 32) begin
                    waddr_sc <= waddr_aligned_load >> 2;                  
                 end
                 waddr_sc_dummy   <= 'h0;
     
              end             
              else if(wready_mc && WVALID_slvif && AWBURST_slvif != 2'b10) begin
                 if(AXI4_DWIDTH == 512) begin
                    waddr_sc <= (waddr_aligned + number_bytes) >> 6;
                 end
                 else if(AXI4_DWIDTH == 256) begin
                    waddr_sc <= (waddr_aligned + number_bytes) >> 5;                  
                 end
                 else if(AXI4_DWIDTH == 128) begin
                    waddr_sc <= (waddr_aligned + number_bytes) >> 4;                  
                 end
                 else if(AXI4_DWIDTH == 64) begin
                    waddr_sc <= (waddr_aligned + number_bytes) >> 3;                  
                 end
                 else if(AXI4_DWIDTH == 32) begin
                    waddr_sc <= (waddr_aligned + number_bytes) >> 2;                  
                 end
                 waddr_sc_dummy   <= 'h0;
              end
        end // else: !if(ARESETN == 1'b0)
     end // always @ (posedge ACLK or negedge ARESETN)
   
     always @(posedge ACLK or negedge ARESETN) begin
        if(ARESETN == 1'b0) begin
           wrap_waddr_plus   <= 'h0;
        end
        else begin
           if(set_aligned_done) begin
              wrap_waddr_plus <= wrap_waddr_next + number_bytes;
           end             
           else if(WVALID_slvif && wready_mc) begin
              wrap_waddr_plus <= wrap_waddr_next + number_bytes;            
           end
        end
     end

     if(PIPE == 0)
       begin 
         always @(posedge ACLK or negedge ARESETN) begin
           if(ARESETN == 1'b0) 
             rdata_sc_d   <= 'h0;
	       else 
		     rdata_sc_d   <= rdata_sc;
	     end 
		 
         always@(*) begin
           wdata_sc = rdata_sc_d ;                        
           for(i=0;i<(AXI4_DWIDTH/8);i=i+1)
		     begin 
	           if(axi4_wbyteen_sc[i])
                 wdata_sc[8*i +: 8] = WDATA_slvif [8*i +: 8];
             end
		 end
	  end 
    else 
      begin 
	
	    always @(*) 
	      rdata_sc_d   <= 'h0;
	
        always @(*) begin
           // 64-bit tansaction on AXI IF is converted into 1, 64-bit transactions on the 
           // SRAM IF to match with the SRAM Fabric memory configuration.
           wdata_sc = rdata_sc ;                        
           for(i=0;i<(AXI4_DWIDTH/8);i=i+1)
		     begin 
	           if(axi4_wbyteen_sc[i])
                 wdata_sc[8*i +: 8] =  WDATA_slvif[8*i +: 8];
             end
        end
	  end 
	  
     // ------------------------------------------------------------------- //
     // wena_sc::                                                           //
     // wenb_sc::                                                           //
     // Generate the write enable signals based on sampling the write data. //
     // The write strobe is used to determine the byte enabling of the data //
     // on the SRAM interface.                                              //
     // ------------------------------------------------------------------- //
     always @(*) begin
        // 64-bit tansaction on AXI IF is converted into 1, 64-bit transactions on the 
        // SRAM IF to match with the SRAM Fabric memory configuration.
        // 32-bit tansaction on AXI IF is converted into 1, 32-bit transactions on the 
        // SRAM IF to match with the SRAM Fabric memory configuration.
        if(WVALID_slvif & wready_mc) begin
           // Generate the byte enables according to the write strobe
           axi4_wbyteen_sc  <= WSTRB_slvif;  
        end
        else begin
           axi4_wbyteen_sc  <= 'h0;
        end
     end           	  
   // ------------------------------------------------------------------- //
   // wena_sc::                                                           //
   // wenb_sc::                                                           //
   // Generate the write enable signals based on sampling the write data. //
   // The write strobe is used to determine the byte enabling of the data //
   // on the SRAM interface.                                              //
   // ------------------------------------------------------------------- //
     always @(*) begin
        // 64-bit tansaction on AXI IF is converted into 1, 64-bit transactions on the 
        // SRAM IF to match with the SRAM Fabric memory configuration.
        // 32-bit tansaction on AXI IF is converted into 1, 32-bit transactions on the 
        // SRAM IF to match with the SRAM Fabric memory configuration.
        if(WVALID_slvif & wready_mc) begin
           wen_sc   = 1'b1;
           // Generate the byte enables according to the write strobe
        end
        else begin
           wen_sc   = 1'b0;
        end
     end                 
   // --------------------------------------------------------------------------
   // Generate the aligned address based on the write size (AWSIZE)
   // --------------------------------------------------------------------------
     always @(posedge ACLK or negedge ARESETN) begin
         if(ARESETN == 1'b0) begin
            waddr_aligned   <= 'h0;      
         end
         else begin
            if(set_aligned_done) begin
               waddr_aligned <= waddr_aligned_load;
            end 
            else begin
               waddr_aligned <= (WVALID_slvif && wready_mc)? (waddr_aligned + number_bytes) : waddr_aligned;              
            end
         end
     end // always @ (posedge ACLK or negedge ARESETN)
   
     always @(*) begin
        if(AWVALID & awready_mc) begin
               case(AWSIZE)
                3'b000 : begin
                   waddr_aligned_load = AWADDR;              
                   number_bytes   = 'h1;
                end
                3'b001 : begin
                   waddr_aligned_load = {AWADDR[AXI4_AWIDTH - 1: 1], 1'b0};
                   number_bytes   = 'h2;
                end
                3'b010 : begin
                   waddr_aligned_load = {AWADDR[AXI4_AWIDTH - 1: 2], 2'b00};
                   number_bytes   = 'h4;
                end
                3'b011 : begin
                   waddr_aligned_load = {AWADDR[AXI4_AWIDTH - 1: 3], 3'b000};
                   number_bytes   = 'h8;
                end
                3'b100 : begin
                   waddr_aligned_load = {AWADDR[AXI4_AWIDTH - 1: 4], 4'b0000};
                   number_bytes   = 'h10;
                end
                3'b101 : begin
                   waddr_aligned_load = {AWADDR[AXI4_AWIDTH - 1: 5], 5'b00000};
                   number_bytes   = 'h20;
                end
                3'b110 : begin
                   waddr_aligned_load = {AWADDR[AXI4_AWIDTH - 1: 6], 6'b000000};
                   number_bytes   = 'h40;
                end
                3'b111 : begin
                   waddr_aligned_load = {AWADDR[AXI4_AWIDTH - 1: 7], 7'b0000000};
                   number_bytes   = 'h80;
                end
                default : begin
                   waddr_aligned_load = 'h0;
                   number_bytes   = 'h0;
                end
              endcase // case (AWSIZE)
        end // if (AWVALID && awready_mc)
        else begin
           waddr_aligned_load = waddr_aligned_load_r;
           number_bytes   = number_bytes_r;
        end // else: !if(AWVALID)      
     end // always @ (*)
         

     always @(posedge ACLK or negedge ARESETN) begin
         if(ARESETN == 1'b0) begin
            waddr_aligned_load_r <= 'h0;         
            number_bytes_r       <= 'h0;         
         end
         else begin
           waddr_aligned_load_r <= waddr_aligned_load;
           number_bytes_r       <= number_bytes;
         end
     end

     // --------------------------------------------------------------------------
     // Generate the wrap address based on the write size (AWSIZE) and write 
     // length (AWLEN)
     // --------------------------------------------------------------------------
     // Increment the start address using the number bytes for calculation of
     // address.
     always @(*) begin
        wrap_waddr_incr = wrap_waddr_incr_r;
        if(WRAP_SUPPORT) begin
           wrap_waddr_incr = wrap_waddr_incr_r;
           if(set_aligned_done) begin
              wrap_waddr_incr = AWADDR;
           end
           else if(WVALID_slvif && wready_mc) begin  
              wrap_waddr_incr = wrap_waddr_calc + number_bytes;
           end
           else if(wr_wrap_boundary_int && (AWSIZE_slvif == 3'b011 || AWSIZE_slvif == 3'b100 || 
                                            AWSIZE_slvif == 3'b101 || AWSIZE_slvif == 3'b110)) begin  
              wrap_waddr_incr = wrap_waddr_calc;
           end
        end
     end // always @ (posedge ACLK or negedge ARESETN)
   
   
     // Calculate the next waddr for wrap transactions based 
     // on the write burst length and the write burst type.
     always @(*) begin
        wr_wrap_boundary = 1'b0;
        if(set_aligned_done) begin
           wrap_waddr_next = AWADDR;
        end
        else if(AWBURST_slvif == 2'b10 && AWSIZE_slvif == 3'b110 && WRAP_SUPPORT) begin // For Wrap burst - (512-bit)
           case (AWLEN_slvif)
             8'b0000_0000: begin
                // no wrap
                wrap_waddr_next = wrap_waddr_incr;
             end
             8'b0000_0001: begin
                // Wrap at every two locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[6:0] == 7'b1000000 && set_wraligned_done) begin  
                  wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:7],7'b0000000};
		          wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[6:0] == 7'b1000000 && WVALID_slvif && wready_mc) begin  
                  wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:7],7'b0000000};
		          wr_wrap_boundary = 1'b1;
                end
                else begin
                  wrap_waddr_next = wrap_waddr_plus;
                end
             end
             8'b0000_0011: begin
                // Wrap at every four locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[7:0] == 8'b11000000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:8],8'b00000000};
                end
                else if(waddr_sc_dummy [7:0] == 8'b11000000 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:8],8'b00000000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             8'b0000_0111: begin
                // Wrap at every eight locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[8:0] == 9'b111000000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:9],9'b000000000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[8:0] == 9'b111000000 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:9],9'b000000000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end
             end
             8'b0000_1111: begin
                // Wrap at every 16 locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[9:0] == 10'b1111000000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:10],10'b0000000000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[9:0] == 10'b1111000000  && WVALID_slvif && wready_mc) begin
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:10],10'b0000000000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             default: begin
                wrap_waddr_next = wrap_waddr_next_r;
             end   
           endcase
        end
      // ---- (AWSIZE = 6 i.e. 512-bit )
        else if(AWBURST_slvif == 2'b10 && AWSIZE_slvif == 3'b101 && WRAP_SUPPORT) begin // For Wrap burst - (256-bit)
           case (AWLEN_slvif)
             8'b0000_0000: begin
                // no wrap
                wrap_waddr_next = wrap_waddr_incr;
             end
             8'b0000_0001: begin
                // Wrap at every two locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[5:0] == 6'b100000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:6],6'b000000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[5:0] == 6'b100000 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:6],6'b000000};
		           wr_wrap_boundary = 1'b1;
                end
                else begin
                   wrap_waddr_next = wrap_waddr_plus;
                end
             end
             8'b0000_0011: begin
                // Wrap at every four locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[6:0] == 7'b1100000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:7],7'b0000000};
                end
                else if(waddr_sc_dummy [6:0] == 7'b1100000 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:7],7'b0000000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             8'b0000_0111: begin
                // Wrap at every eight locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[7:0] == 8'b11100000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:8],8'b00000000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[7:0] == 8'b11100000 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:8],8'b00000000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end
             end
             8'b0000_1111: begin
                // Wrap at every 16 locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[8:0] == 9'b111100000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:9],9'b000000000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[8:0] == 9'b111100000  && WVALID_slvif && wready_mc) begin
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:9],9'b000000000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             default: begin
                wrap_waddr_next = wrap_waddr_next_r;
             end   
           endcase
        end
      // ---- (AWSIZE = 5 i.e. 256-bit )
        else if(AWBURST_slvif == 2'b10 && AWSIZE_slvif == 3'b100 && WRAP_SUPPORT) begin // For Wrap burst - (128-bit)
           case (AWLEN_slvif)
             8'b0000_0000: begin
                // no wrap
                wrap_waddr_next = wrap_waddr_incr;
             end
             8'b0000_0001: begin
                // Wrap at every two locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[4:0] == 5'b10000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:5],5'b00000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[4:0] == 5'b10000 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:5],5'b00000};
		           wr_wrap_boundary = 1'b1;
                end
                else begin
                   wrap_waddr_next = wrap_waddr_plus;
                end
             end
             8'b0000_0011: begin
                // Wrap at every four locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[5:0] == 6'b110000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:6],6'b000000};
                end
                else if(waddr_sc_dummy [5:0] == 6'b110000 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:6],6'b000000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             8'b0000_0111: begin
                // Wrap at every eight locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[6:0] == 7'b1110000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:7],7'b0000000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[6:0] == 7'b1110000 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:7],7'b0000000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end
             end
             8'b0000_1111: begin
                // Wrap at every 16 locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[7:0] == 8'b11110000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:8],8'b00000000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[7:0] == 8'b11110000  && WVALID_slvif && wready_mc) begin
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:8],8'b00000000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             default: begin
                wrap_waddr_next = wrap_waddr_next_r;
             end   
           endcase
        end
      // ---- (AWSIZE = 4 i.e. 128-bit )
        else if(AWBURST_slvif == 2'b10 && AWSIZE_slvif == 3'b011 && WRAP_SUPPORT) begin // For Wrap burst
           case (AWLEN_slvif)
             8'b0000_0000: begin
                // no wrap
                wrap_waddr_next = wrap_waddr_incr;
             end
             8'b0000_0001: begin
                // Wrap at every two locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[3:0] == 4'b1000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:4],4'b0000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[3:0] == 4'b1000 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:4],4'b0000};
		           wr_wrap_boundary = 1'b1;
                end
                else begin
                   wrap_waddr_next = wrap_waddr_plus;
                end
             end
             8'b0000_0011: begin
                // Wrap at every four locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[4:0] == 5'b11000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:5],5'b00000};
                end
                else if(waddr_sc_dummy[4:0] == 5'b11000 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:5],5'b00000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             8'b0000_0111: begin
                // Wrap at every eight locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[5:0] == 6'b111000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:6],6'b000000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[5:0] == 6'b111000 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:6],6'b000000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end
             end
             8'b0000_1111: begin
                // Wrap at every 16 locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[6:0] == 7'b1111000 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:7],7'b0000000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[6:0] == 7'b1111000  && WVALID_slvif && wready_mc) begin
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:7],7'b0000000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             default: begin
                wrap_waddr_next = wrap_waddr_next_r;
             end   
           endcase
        end
      // The wrap boundary for Size - Word/Halfword and Byte is defined in the
      // if-else conditions
        else if(AWBURST_slvif == 2'b10 && (AWSIZE_slvif == 3'b010) && WRAP_SUPPORT) begin // For Wrap burst 
           case (AWLEN_slvif)
             8'b0000_0000: begin
                // no wrap
                wrap_waddr_next = wrap_waddr_incr;
             end
             8'b0000_0001: begin
                // Wrap at every two locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[2:0] == 3'b100 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:3],3'b000};
		           wr_wrap_boundary = 1'b1;
                end 
                else if(waddr_sc_dummy[2:0] == 3'b100 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:3],3'b000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             8'b0000_0011: begin
                // Wrap at every four locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[3:0] == 4'b1100  && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:4],4'b0000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[3:0] == 4'b1100  && WVALID_slvif && wready_mc) begin    
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:4],4'b0000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end
             end
             8'b0000_0111: begin
                // Wrap at every eight locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[4:0] == 5'b11100 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:5],5'b00000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[4:0] == 5'b11100 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:5],5'b00000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             8'b0000_1111: begin
                // Wrap at every 16 locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[5:0] == 6'b111100 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:6],6'b000000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[5:0] == 6'b111100 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:6],6'b000000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             default: begin
                wrap_waddr_next = wrap_waddr_next_r;
             end   
           endcase
        end
        else if(AWBURST_slvif == 2'b10 && (AWSIZE_slvif == 3'b001) && WRAP_SUPPORT) begin // For Wrap burst
           case (AWLEN_slvif)
             8'b0000_0000: begin
                // no wrap
                wrap_waddr_next = wrap_waddr_incr;
             end
             8'b0000_0001: begin
                // Wrap at every two locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[1:0] == 2'b10 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:2],2'b00};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[1:0] == 2'b10 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:2],2'b00};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             8'b0000_0011: begin
                // Wrap at every four locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[2:0] == 3'b110  && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:3],3'b000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[2:0] == 3'b110 && WVALID_slvif && wready_mc) begin   
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:3],3'b000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             8'b0000_0111: begin
                // Wrap at every eight locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[3:0] == 4'b1110 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:4],4'b0000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[3:0] == 4'b1110 && WVALID_slvif && wready_mc) begin 
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:4],4'b0000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             8'b0000_1111: begin
                // Wrap at every 16 locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[4:0] == 5'b11110 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:5],5'b00000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[4:0] == 5'b11110 && WVALID_slvif && wready_mc) begin   
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:5],5'b00000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             default: begin
                wrap_waddr_next = wrap_waddr_next_r;
             end   
           endcase
        end
        else if(AWBURST_slvif == 2'b10 && (AWSIZE_slvif == 3'b000) && WRAP_SUPPORT) begin // For Wrap burst
           case (AWLEN_slvif)
             8'b0000_0000: begin
                // no wrap
                wrap_waddr_next = wrap_waddr_incr;
             end
             8'b0000_0001: begin
                // Wrap at every two locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[0] == 1'b1 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:1],1'b0};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[0] == 1'b1 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:1],1'b0};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             8'b0000_0011: begin
                // Wrap at every four locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[1:0] == 2'b11 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:2],2'b00};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[1:0] == 2'b11 && WVALID_slvif && wready_mc) begin   
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:2],2'b00};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             8'b0000_0111: begin
                // Wrap at every eight locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[2:0] == 3'b111 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:3],3'b000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[2:0] == 3'b111 && WVALID_slvif && wready_mc) begin  
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:3],3'b000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             8'b0000_1111: begin
                // Wrap at every 16 locations
                // Roll-over when the wrap boundary is reached.
                if(AWADDR_slvif[3:0] == 4'b1111 && set_wraligned_done) begin  
                   wrap_waddr_next = {AWADDR_slvif[AXI4_AWIDTH-1:4],4'b0000};
		           wr_wrap_boundary = 1'b1;
                end
                else if(waddr_sc_dummy[3:0] == 4'b1111) begin   
                   wrap_waddr_next = {waddr_sc_dummy[AXI4_AWIDTH-1:4],4'b0000};
                end
	            else begin
                   wrap_waddr_next = wrap_waddr_plus;
	            end	
             end
             default: begin
                wrap_waddr_next = wrap_raddr_next_r;
             end   
           endcase
        end
        else begin
           wrap_waddr_next = 'h0;
        end
    end

   // Register the next wrap address on every sample of 
   // WVALID_slvif & wready_mc.
    always @(posedge ACLK or negedge ARESETN) begin
       if(ARESETN == 1'b0) begin
          wrap_waddr_calc   <= 'h0;
       end
       else begin
          if(WRAP_SUPPORT) begin  // For burst type = WRAP
             if(bvalid_mc & BREADY_slvif) begin
                wrap_waddr_calc   <= 'h0;
             end
	         else if(set_aligned_done) begin
                wrap_waddr_calc   <= wrap_waddr_incr; 
             end
	         else begin
                wrap_waddr_calc   <= wrap_waddr_next;
             end
          end
       end
    end		
    always @(posedge ACLK or negedge ARESETN) begin
       if(ARESETN == 1'b0) begin
          wrap_waddr_incr_r   <= 'h0;
          wrap_waddr_next_r   <= 'h0;
       end
       else begin
          wrap_waddr_incr_r  <= wrap_waddr_incr;         
          wrap_waddr_next_r  <= wrap_waddr_next;                         
       end
    end	
  end	
endgenerate  





   // ------------------------------------------------------------------------- //
   //           Generate logic for AXI4 Read and SRAM Read                    //
   // -----------------------------------------------------------------------   //

generate 
  if(AXI4_IFTYPE_RD)   
    begin   
	  reg      rd_req_gnt_d;
   // ----------------------------------------------------------------------- //
   // Generate the read address and data ready output to the slave interface  //
   // Outputs:                                                                //
   //         arready_mc                                                      //
   //         raddrchset_mc                                                   //
   // ----------------------------------------------------------------------- //

     always @(posedge ACLK or negedge ARESETN) 
       if(ARESETN == 1'b0) 
         rd_req_gnt_d <= 1'b0;
	   else 
	     rd_req_gnt_d <= rd_req_gnt;
   
     always @(posedge ACLK or negedge ARESETN) begin
       if(ARESETN == 1'b0) begin
         arready_mc    <= 1'b0;
         raddrchset_mc <= 1'b0;
       end
	   else if(rd_req_gnt & ~rd_req_gnt_d) begin 
         arready_mc    <= 1'b1;
         raddrchset_mc <= 1'b1;
	   end
       else begin
         arready_mc    <= 1'b0;
         raddrchset_mc <= 1'b0;
       end
     end
   
     always @(posedge ACLK or negedge ARESETN) 
       if(ARESETN == 1'b0) 
         set_rdaligned_done <= 1'b0;
	   else if(ARVALID_slvif & arready_mc)
	     set_rdaligned_done <= 1'b1;
	   else 
	     set_rdaligned_done <= 1'b0;
	   
	 assign rddata_start = set_rdaligned_done_r;

   // --------------------------------------------------------------------------
   // Generate Read channel related outputs
   // Outputs:
   //         RID/RRESP/RVALID/RLAST
   // --------------------------------------------------------------------------    
	  
      if(PIPE == 2 & ECC == 1) begin 
         
         reg [2:0]             read_cntr;	
         reg [2:0]             read_data_cntr;  
	     reg [1:0]             rdata_reg_en_ctrl;
	     reg                   rdata_mc_reg1_en;
	     reg                   rdata_mc_reg2_en;
	     reg                   rdata_mc_reg3_en;
	     reg [1:0]             rdata_mc_reg1_sel;
	     reg [AXI4_DWIDTH-1:0] rdata_mc_reg1;
	     reg [AXI4_DWIDTH-1:0] rdata_mc_reg2;
	     reg [AXI4_DWIDTH-1:0] rdata_mc_reg3;



	     //When PIPELINE is enabled, data comes from the memory after two clock cycles.To maintain this latency, data is stored in to two
		 //temparory registers. Whenever valid data is available in these two temp registers, RVALID should not be driven low to achieve 
		 //high throughput. Below logic is design to fullfil the above requirement. 
	
	     always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
              read_cntr <= 0;
			else if(rlast_mc & rvalid_mc & RREADY_slvif) 
              read_cntr <= 0;
            else if(ren_sc_d1 & ~(rvalid_mc & RREADY_slvif)) 
              read_cntr <= read_cntr + 1'b1;
			else if(~ren_sc_d1 & (rvalid_mc & RREADY_slvif)) 
			  read_cntr <= read_cntr - 1'b1;
			  
             
         //rvalid_mc - RVALID logic.It is asserted when delayed request (ren_sc_d1) of read request to the memory is high. It remains high
		 //until last data is read by the AXI4 bus or there is no data into the temp buffer register. To know wheather data is available in 
		 //temp register or not, difference of read_req_cntr and read_data_cntr is taken and compared with 1. When the difference of the counter
		 //is one and data is read by the AXI4 bus, RVALID is driven low as this condition indicates there is no data available in the temp 
		 //registers.
		 
         always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
               rvalid_mc <= 1'b0;
            else if(rlast_mc == 1'b1 && rvalid_mc == 1'b1 && RREADY_slvif) 
               rvalid_mc <= 1'b0;
            else if(ren_sc_d2 & ~wr_req_inprog) 
   	           rvalid_mc <= 1'b1;
			else if(rvalid_mc & RREADY_slvif & (read_cntr == 1))
			   rvalid_mc <= 1'b0;
         
         always @(posedge ACLK or negedge ARESETN) begin
            if(ARESETN == 1'b0) begin
               rlast_mc <= 1'b0;
            end
            else begin
               if((rvalid_mc && RREADY_slvif && rdbeat_cnt < 'h3 && ~rlast_mc) || (ARVALID & arready_mc & (ARLEN == 0))) begin
                  rlast_mc <= 1'b1;
               end
               else if((rvalid_mc == 1'b1 && RREADY_slvif == 1'b1) | (ARVALID & arready_mc)) begin
                  rlast_mc <= 1'b0;
               end
            end
         end
		 
		  //When Pipeline is enabled, data from memory is available after two clock cycles. So two clock cycle data are stored in 
		  //two temp registers. There are three options to assign data to the AXI4 bus read data. 
		  //1 - Directly assign the data from the memory to the AXI4 bus read data 
		  //2 - Assign temp 1 register's to the AXI4 bus read data 
		  //3 - Assign temp 2 register's to the AXI4 bus read data 
		  //Below logic fullfil the above requirement.	  
			  
			
          //rdata_reg_en_ctrl - Signal is used to load the data into the temp registers.It is toggled when delayed request(ren_sc_d2) 
		  //of actual read request to the memory (ren_sc) is high. It will be reset to 0 when new read request is received.
          //When low and ren_sc_d2 is high, temp 1 register will be enabled and when high and ren_sc_d2 is high, temp 2 register will 
		  //be enabled. This signal is used to enable temp register 1 and temp register 2 alternatively when valid data is available 
		  //from the memory i.e first it enables temp 1 register temp 2 regisetr and so on...
          
          always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
              rdata_reg_en_ctrl <= 1'b0;
	        else if(ARVALID & arready_mc)
	          rdata_reg_en_ctrl <= 1'b0;
            else if(ren_sc_d3)
			  begin 
			    if(rdata_reg_en_ctrl == 2)
			      rdata_reg_en_ctrl <= 0;
			    else 	            
				  rdata_reg_en_ctrl <= rdata_reg_en_ctrl + 1'b1;		  
			  end 
			  
          always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
              read_data_cntr <= 0;
	        else if(ARVALID & arready_mc)
	          read_data_cntr <= 0;
            else if(ren_sc_d3 ^ (rvalid_mc & RREADY_slvif))
			  begin 
			    if(ren_sc_d3)
			      read_data_cntr <= read_data_cntr + 1'b1;		  
			    else if(read_data_cntr != 0)  	            
				  read_data_cntr <= read_data_cntr - 1'b1;		  
			  end 
			  
			  
          //rdata_mc_reg1_en - Enable signal for rdata_mc_reg1 (temp register 1)			  
          
          always @(*) 
	        if((rdata_reg_en_ctrl == 0) & ren_sc_d3)
	          rdata_mc_reg1_en <= 1'b1;
            else
	          rdata_mc_reg1_en <= 1'b0;
			  
         //rdata_mc_reg2_en - Enable signal for rdata_mc_reg2 (temp register 2)			  			  
          
          always @(*) 
            if((rdata_reg_en_ctrl == 1) & ren_sc_d3)
	          rdata_mc_reg2_en <= 1'b1;
            else
	          rdata_mc_reg2_en <= 1'b0;

          always @(*) 
            if((rdata_reg_en_ctrl == 2) & ren_sc_d3)
	          rdata_mc_reg3_en <= 1'b1;
            else
	          rdata_mc_reg3_en <= 1'b0;
			  
         //rdata_mc_reg1 - Temp data register 1. Data from the memory will be stored when enable is high
	        
          always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
              rdata_mc_reg1 <= 0;
            else if(rdata_mc_reg1_en)
	          rdata_mc_reg1 <= rdata_sc;
          
		 //rdata_mc_reg2 - Temp data register 2. Data from the memory will be stored when enable is high
		  
          always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
              rdata_mc_reg2 <= 0;
            else if(rdata_mc_reg2_en)
	          rdata_mc_reg2 <= rdata_sc;

          always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
              rdata_mc_reg3 <= 0;
            else if(rdata_mc_reg3_en)
	          rdata_mc_reg3 <= rdata_sc;
          
		 //rdata_mc_reg1_sel - This signal is used to decide whether temp 1 register data should be assigned or temp 2 register data 
		 //should be assigned to AXI4 read data.This signal selects alterantively temp 1 register data and temp 2 register data.
		 //It is acheived by toggling this signal when there is data read from the AXI4 bus.Reset value of this signal is high and 
		 //it will be set high again when new read request is asserted. When 1, assigns temp 1 register data to AXI4 read data and 
		 //when 0, assignes temp 2 register data to AXI4 read data. 
		 
		  
          always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
              rdata_mc_reg1_sel <= 2;
	        else if(ARVALID & arready_mc)
	          rdata_mc_reg1_sel <= 2;
            else if(rvalid_mc & RREADY_slvif)
			  begin 
			    if(rdata_mc_reg1_sel == 2)
			      rdata_mc_reg1_sel <= 0;
			    else 
	              rdata_mc_reg1_sel <= rdata_mc_reg1_sel + 1'b1;	
			  end 

         //rdata_mc	- Actual read data (RDATA) of AXI4 bus.Initially, data from the memory directly assigns to RDATA. If RREADY goes 
         //low when RVALID is high and there is a valid data available in the temp registers then data from the temp registers will 
         //be assigned to RDATA based on the value of rdata_mc_reg1_sel. 		 
	  
          always @(*) 
		    if(ren_sc_d3 & (read_data_cntr == 0))
		      rdata_mc = rdata_sc;
		    else if(rdata_mc_reg1_sel == 2)
		      rdata_mc = rdata_mc_reg1;
		    else if(rdata_mc_reg1_sel == 0)
		      rdata_mc = rdata_mc_reg2;
		    else 
		      rdata_mc = rdata_mc_reg3;
			  
      end // if (PIPE == 2 & ECC = 1)      
   
    if((PIPE == 2 & ECC == 2) | (PIPE == 1 & ECC == 1))
	  begin
        reg [2:0]             read_cntr;
        reg [1:0]             read_data_cntr;  
	    reg                   rdata_reg_en_ctrl;
	    reg                   rdata_mc_reg1_en;
	    reg                   rdata_mc_reg2_en;
	    reg                   rdata_mc_reg1_sel;
	    reg [AXI4_DWIDTH-1:0] rdata_mc_reg1;
	    reg [AXI4_DWIDTH-1:0] rdata_mc_reg2;
		
	    //When PIPELINE is enabled, data comes from the memory after two clock cycles.To maintain this latency, data is stored in to two
		//temparory registers. Whenever valid data is available in these two temp registers, RVALID should not be driven low to achieve 
		//high throughput. Below logic is design to fullfil the above requirement. 
		
	    always @(posedge ACLK or negedge ARESETN) 
          if(ARESETN == 1'b0) 
            read_cntr <= 0;
		  else if(rlast_mc & rvalid_mc & RREADY_slvif) 
            read_cntr <= 0;
          else if(ren_sc_d1 & ~(rvalid_mc & RREADY_slvif)) 
            read_cntr <= read_cntr + 1'b1;
		  else if(~ren_sc_d1 & (rvalid_mc & RREADY_slvif) & (read_cntr != 0)) 
			read_cntr <= read_cntr - 1'b1;		
		
         //rvalid_mc - RVALID logic.It is asserted when delayed request (ren_sc_d1) of read request to the memory is high. It remains high
		 //until last data is read by the AXI4 bus or there is no data into the temp buffer register. To know wheather data is available in 
		 //temp register or not, difference of read_req_cntr and read_data_cntr is taken and compared with 1. When the difference of the counter
		 //is one and data is read by the AXI4 bus, RVALID is driven low as this condition indicates there is no data available in the temp 
		 //registers.
		 
         always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
               rvalid_mc <= 1'b0;
            else if(rlast_mc == 1'b1 && rvalid_mc == 1'b1 && RREADY_slvif) 
               rvalid_mc <= 1'b0;
            else if(ren_sc_d1 & ~wr_req_inprog) 
   	           rvalid_mc <= 1'b1;
			else if(rvalid_mc & RREADY_slvif & (read_cntr == 1))
			   rvalid_mc <= 1'b0;
         
         always @(posedge ACLK or negedge ARESETN) begin
            if(ARESETN == 1'b0) begin
               rlast_mc <= 1'b0;
            end
            else begin
               if((rvalid_mc && RREADY_slvif && rdbeat_cnt < 'h3 && ~rlast_mc) || (ARVALID & arready_mc & (ARLEN == 0))) begin
                  rlast_mc <= 1'b1;
               end
               else if((rvalid_mc == 1'b1 && RREADY_slvif == 1'b1) | (ARVALID & arready_mc)) begin
                  rlast_mc <= 1'b0;
               end
            end
         end
		 
		  //When Pipeline is enabled, data from memory is available after two clock cycles. So two clock cycle data are stored in 
		  //two temp registers. There are three options to assign data to the AXI4 bus read data. 
		  //1 - Directly assign the data from the memory to the AXI4 bus read data 
		  //2 - Assign temp 1 register's to the AXI4 bus read data 
		  //3 - Assign temp 2 register's to the AXI4 bus read data 
		  //Below logic fullfil the above requirement.			  
			
          //rdata_reg_en_ctrl - Signal is used to load the data into the temp registers.It is toggled when delayed request(ren_sc_d2) 
		  //of actual read request to the memory (ren_sc) is high. It will be reset to 0 when new read request is received.
          //When low and ren_sc_d2 is high, temp 1 register will be enabled and when high and ren_sc_d2 is high, temp 2 register will 
		  //be enabled. This signal is used to enable temp register 1 and temp register 2 alternatively when valid data is available 
		  //from the memory i.e first it enables temp 1 register temp 2 regisetr and so on...
          
          always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
              rdata_reg_en_ctrl <= 1'b0;
	        else if(ARVALID & arready_mc)
	          rdata_reg_en_ctrl <= 1'b0;
            else if(ren_sc_d2)
	          rdata_reg_en_ctrl <= ~rdata_reg_en_ctrl;		  
			  
          //rdata_mc_reg1_en - Enable signal for rdata_mc_reg1 (temp register 1)			  
          
          always @(*) 
	        if(~rdata_reg_en_ctrl & ren_sc_d2)
	          rdata_mc_reg1_en <= 1'b1;
            else
	          rdata_mc_reg1_en <= 1'b0;
			  
         //rdata_mc_reg2_en - Enable signal for rdata_mc_reg2 (temp register 2)			  			  
          
          always @(*) 
            if(rdata_reg_en_ctrl & ren_sc_d2)
	          rdata_mc_reg2_en <= 1'b1;
            else
	          rdata_mc_reg2_en <= 1'b0;
			  
         //rdata_mc_reg1 - Temp data register 1. Data from the memory will be stored when enable is high
	        
          always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
              rdata_mc_reg1 <= 0;
            else if(rdata_mc_reg1_en)
	          rdata_mc_reg1 <= rdata_sc;
          
		 //rdata_mc_reg2 - Temp data register 2. Data from the memory will be stored when enable is high
		  
          always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
              rdata_mc_reg2 <= 0;
            else if(rdata_mc_reg2_en)
	          rdata_mc_reg2 <= rdata_sc;
          
		 //rdata_mc_reg1_sel - This signal is used to decide whether temp 1 register data should be assigned or temp 2 register data 
		 //should be assigned to AXI4 read data.This signal selects alterantively temp 1 register data and temp 2 register data.
		 //It is acheived by toggling this signal when there is data read from the AXI4 bus.Reset value of this signal is high and 
		 //it will be set high again when new read request is asserted. When 1, assigns temp 1 register data to AXI4 read data and 
		 //when 0, assignes temp 2 register data to AXI4 read data. 
		 
		  
          always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
              rdata_mc_reg1_sel <= 1'b1;
	        else if(ARVALID & arready_mc)
	          rdata_mc_reg1_sel <= 1'b1;
            else if(rvalid_mc & RREADY_slvif)
	          rdata_mc_reg1_sel <= ~rdata_mc_reg1_sel;	
			  
			  
          //read_data_cntr - Counter is used to keep track of number of data read from the memory and number of data read by the AXI4.
          //Counter is incremented whenever ren_sc_d3 is high and decremented when RVALID and RREADY are high. When both condition for 
          //increment and decrement are true at the same time, counter value is not updated. Whenver value of this counter is zero, 
          //data read from the memory directly assigned to the AXI4 RDATA. When its value other than 0, data from the internal register
          //will be assigned to AXI4 RDATA.		  
			  
          always @(posedge ACLK or negedge ARESETN) 
            if(ARESETN == 1'b0) 
              read_data_cntr <= 0;
	        else if(ARVALID & arready_mc)
	          read_data_cntr <= 0;
            else if(ren_sc_d2 ^ (rvalid_mc & RREADY_slvif))
			  begin 
			    if(ren_sc_d2)
			      read_data_cntr <= read_data_cntr + 1'b1;		  
			    else if(read_data_cntr != 0)	            
				  read_data_cntr <= read_data_cntr - 1'b1;		  
			  end 
			  

         //rdata_mc	- Actual read data (RDATA) of AXI4 bus.Initially, data from the memory directly assigns to RDATA. If RREADY goes 
         //low when RVALID is high and there is a valid data available in the temp registers then data from the temp registers will 
         //be assigned to RDATA based on the value of rdata_mc_reg1_sel. 		 
	  
          always @(*) 
		    if(ren_sc_d2 & (read_data_cntr == 0))
		      rdata_mc = rdata_sc;
		    else if(rdata_mc_reg1_sel)
		      rdata_mc = rdata_mc_reg1;
		   else 
		      rdata_mc = rdata_mc_reg2;		 
		
      end //if (PIPE == 2 & ECC == 2) | (PIPE == 1 & ECC == 1)  
	  
      if(PIPE == 1 & ECC != 1) begin    
         
		 reg [AXI4_DWIDTH - 1:0] rdata_mc_r;	  
		 
         always @(posedge ACLK or negedge ARESETN) begin
            if(ARESETN == 1'b0) begin
               rvalid_mc <= 1'b0;
            end
            else begin
               if(rlast_mc & rvalid_mc & RREADY_slvif) begin
                  rvalid_mc <= 1'b0;
               end
               else if(ren_sc & ~wr_req_inprog) begin
                  rvalid_mc <= 1'b1;
			   end
			   else if(rvalid_mc & RREADY_slvif) begin
			      rvalid_mc <= 1'b0;
               end
            end
         end // always @ (posedge ACLK or negedge ARESETN)

         always @(posedge ACLK or negedge ARESETN) begin
            if(ARESETN == 1'b0) begin
               rlast_mc <= 1'b0;
            end
            else begin
               if(ren_sc & (rdbeat_cnt == 1) & ~rlast_mc) begin
                  rlast_mc <= 1'b1;
               end
               else if(rvalid_mc & RREADY_slvif) begin
                  rlast_mc <= 1'b0;
               end
            end
         end
		 
         always @(*) begin
            rdata_mc = (ren_sc_d1) ? rdata_sc : rdata_mc_r;
         end
		 
         always @(posedge ACLK or negedge ARESETN) begin
            if(ARESETN == 1'b0) begin
               rdata_mc_r <= 'h0;
            end
            else begin
               rdata_mc_r <= rdata_mc;         
            end
         end		 
		 
      end // if ((PIPE == 1 & ECC != 1))      

      if(PIPE == 0) begin    
         reg                         rvalid_mc_ctrl;
         reg                         rlast_mc_r;
         reg                         rlast_mc_ctrl;
         reg [AXI4_DWIDTH - 1:0]     rdata_mc_r;	
	 
         always @(posedge ACLK or negedge ARESETN) begin
           if(ARESETN == 1'b0) 
 		     rvalid_mc_ctrl <= 1'b0;
           else if(rvalid_mc & RREADY_slvif & rlast_mc)			 
		     rvalid_mc_ctrl <= 1'b0;
		   else if(ren_sc & ~wr_req_inprog)
		     rvalid_mc_ctrl <= 1'b1;
		   else if(rvalid_mc & RREADY_slvif)
		     rvalid_mc_ctrl <= 1'b0;
		 end
			
         always @(*) begin
		   if(ren_sc & ~wr_req_inprog)
             rvalid_mc = 1'b1;
		   else 
		     rvalid_mc = rvalid_mc_ctrl;
         end // always @ (*)

        always @(posedge ACLK or negedge ARESETN) begin
           if(ARESETN == 1'b0) 
 		     rlast_mc_r <= 1'b0;			
		   else 
		     rlast_mc_r <= rlast_mc;		   
		 end

        always @(posedge ACLK or negedge ARESETN) begin
           if(ARESETN == 1'b0) 
 		     rlast_mc_ctrl <= 1'b0;			
		   else if(rlast_mc & rvalid_mc & RREADY_slvif)
		     rlast_mc_ctrl <= 1'b1;
           else 
             rlast_mc_ctrl <= 1'b0;					   
		 end
		 
         always @(*) begin
            if(ren_sc & (rdbeat_cnt == 1) & ~rlast_mc_r) begin
               rlast_mc = 1'b1;
            end
            else if(rlast_mc_ctrl) begin 
               rlast_mc = 1'b0;
			end
			else begin 
			   rlast_mc = rlast_mc_r;
            end 				
         end
		 
		 always @(*) begin           
            rdata_mc = ren_sc ? rdata_sc : rdata_mc_r;
		 end 

         always @(posedge ACLK or negedge ARESETN) begin
            if(ARESETN == 1'b0) begin
               rdata_mc_r <= 'h0;
            end
            else begin
               rdata_mc_r <= rdata_mc;         
            end
         end		 
      end // if ((PIPE == 0))
	  
  // --------------------------------------------------------------------------
  // Register the read signals to align it with the read data from SRAM
  // --------------------------------------------------------------------------
    assign rresp_mc = RRESP_OK;
    always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) begin
        rid_mc <= 'h0;         
      end
      else if(set_rdaligned_done) begin
        rid_mc <= ARID_slvif;        
      end
    end
 
    always@(*)
      begin
        if(FAMILY == 25)
          begin 
	  	    ren_sc_ctrl =   (PIPE == 0 | (PIPE == 1 & ECC == 2) ) ? axi_write_det :
                            (PIPE == 2 & ECC == 2)  ? (axi_write_det | axi_write_det_d1) :
                            (PIPE == 1 & ECC == 1)  ? (axi_write_det | axi_write_det_d1 | axi_write_det_d2) :
                            (axi_write_det | axi_write_det_d1 | axi_write_det_d2 | axi_write_det_d3);
          end 
        else 
          begin 
	  	    ren_sc_ctrl =   (PIPE == 0 | (PIPE == 1 & ECC == 2) ) ? axi_write_det :
                            (PIPE == ECC)  ? (axi_write_det | axi_write_det_d1) :
                            (axi_write_det | axi_write_det_d1);
          end 		
      end 	 
	  
    always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) begin
         rddata_start_d <= 1'b0;
      end
	  else if(rvalid_mc & rlast_mc & RREADY_slvif) begin 
	     rddata_start_d <= 1'b0;
	  end 	  
      else if(rddata_start) begin
         rddata_start_d <= 1'b1;
      end
     end // always @ (posedge ACLK or negedge ARESETN)   
   
   // Registered ren_sc
    always @(posedge ACLK or negedge ARESETN) begin
       if(ARESETN == 1'b0) begin
          ren_sc_d1 <= 1'b0;
       end
       else if (~wr_req_inprog & ~(rvalid_mc & rlast_mc)) begin
          ren_sc_d1 <= ren_sc;
	   end
	   else begin 
	      ren_sc_d1 <= 1'b0;
	   end 
    end // always @ (posedge ACLK or negedge ARESETN)
   
    always @(posedge ACLK or negedge ARESETN) begin
       if(ARESETN == 1'b0) begin
          ren_sc_d2 <= 1'b0;
       end
       else if(rvalid_mc & rlast_mc) begin
          ren_sc_d2 <= 1'b0;
       end
	   else begin
          ren_sc_d2 <= ren_sc_d1;	    
	   end 
    end // always @ (posedge ACLK or negedge ARESETN)
   
   always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) begin
         ren_sc_d3 <= 1'b0;
      end
	  else if(rvalid_mc & rlast_mc) begin
	     ren_sc_d3 <= 1'b0;
	  end 
      else begin
         ren_sc_d3 <= ren_sc_d2;
      end
   end // always @ (posedge ACLK or negedge ARESETN)
   
   // ---------------------------------------------------------------------------------- //
   // raddr_sc::                                                                         //
   // Read Address generation logic to SRAM                                              //
   // For 64-bit datawidth and ARSIZE = 3, each 64-bit transaction on AXI4               //
   // interface is converted into 2, 32-bit transactions on the SRAM memory interface.   //
   // For 64-bit datawidth and ARSIZE < 3, each 64-bit transaction on AXI4 interface     //
   // is converted into corresponding 32-bit transaction on the SRAM memory interface    //
   // based on the address.                                                              //
   // For 32-bit datawidth and For ARSIZE < 3, each 32-bit transaction on AXI4 interface //
   // is converted into corresponding 32-bit transaction on the SRAM memory interface    //
   // based on the address.                                                              //
   // ---------------------------------------------------------------------------------- //
   // Register the next wrap address on every sample of 
   // WVALID_slvif & wready_mc.
         
    always @(posedge ACLK or negedge ARESETN) begin
       if(ARESETN == 1'b0) begin
          read_raddr_sc       <= 'h0;
          raddr_sc_dummy <= 'h0;
       end
       else begin         
          if(WRAP_SUPPORT && ARBURST_slvif == 2'b10) begin  // For burst type = WRAP 
             if(set_rdaligned_done) begin
                if (AXI4_DWIDTH == 512) begin
                   read_raddr_sc <= raddr_aligned_load >> 6;
                end
                else if (AXI4_DWIDTH == 256) begin
                   read_raddr_sc <= raddr_aligned_load >> 5;
                end
                else if (AXI4_DWIDTH == 128) begin
                   read_raddr_sc <= raddr_aligned_load >> 4;
                end
                else if (AXI4_DWIDTH == 64) begin
                   read_raddr_sc <= raddr_aligned_load >> 3;
                end
                else if (AXI4_DWIDTH == 32) begin
                   read_raddr_sc <= raddr_aligned_load >> 2;
                end
                // ----
                raddr_sc_dummy <= raddr_aligned_load;                     
             end
             else if(ren_sc) begin
                if (AXI4_DWIDTH == 512) begin
                   read_raddr_sc <= wrap_raddr_next >> 6;
                end
                else if (AXI4_DWIDTH == 256) begin
                   read_raddr_sc <= wrap_raddr_next >> 5;
                end
                else if (AXI4_DWIDTH == 128) begin
                   read_raddr_sc <= wrap_raddr_next >> 4;
                end
                else if (AXI4_DWIDTH == 64) begin
                   read_raddr_sc <= wrap_raddr_next >> 3;
                end
                else if (AXI4_DWIDTH == 32) begin
                   read_raddr_sc <= wrap_raddr_next >> 2;
                end
    
                raddr_sc_dummy <= wrap_raddr_next;                     
             end
          end
          else begin // For burst type = INCR
              if(set_rdaligned_done) begin 
                if (AXI4_DWIDTH == 512) begin
                   read_raddr_sc <= raddr_aligned_load >> 6;
                end
                else if (AXI4_DWIDTH == 256) begin
                   read_raddr_sc <= raddr_aligned_load >> 5;
                end
                else if (AXI4_DWIDTH == 128) begin
                   read_raddr_sc <= raddr_aligned_load >> 4;
                end
                else if (AXI4_DWIDTH == 64) begin
                   read_raddr_sc <= raddr_aligned_load >> 3;
                end
                else if (AXI4_DWIDTH == 32) begin
                   read_raddr_sc <= raddr_aligned_load >> 2;
                end
             end
             else if(ren_sc) begin 
                if (AXI4_DWIDTH == 512) begin
                   read_raddr_sc <= raddr_aligned >> 6;
                end
                else if (AXI4_DWIDTH == 256) begin
                   read_raddr_sc <= raddr_aligned >> 5;
                end
                else if (AXI4_DWIDTH == 128) begin
                   read_raddr_sc <= raddr_aligned >> 4;
                end
                else if (AXI4_DWIDTH == 64) begin
                   read_raddr_sc <= raddr_aligned >> 3;
                end
                else if (AXI4_DWIDTH == 32) begin
                   read_raddr_sc <= raddr_aligned >> 2;
                end
             end
          end
       end
    end

    always @(posedge ACLK or negedge ARESETN) begin
       if(ARESETN == 1'b0) begin
          wrap_raddr_plus   <= 'h0;
       end
       else begin
          if(set_rdaligned_done) begin
             wrap_raddr_plus <= raddr_aligned_load + rd_number_bytes;
          end             
          else if(ren_sc) begin
             wrap_raddr_plus <= wrap_raddr_next + rd_number_bytes;            
          end
       end
    end
   

   // --------------------------------------------- //
   // Count the number of beats based on rvalid     //
   // and rready.                                   //
   // --------------------------------------------- //
    always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) begin
        rdbeat_cnt <= 'h0;
      end
      else begin
        if(rvalid_mc & RREADY_slvif & rlast_mc) begin 
          rdbeat_cnt <= 'h0;
        end
        else if(set_rdaligned_done) begin  // Load
          rdbeat_cnt <= ARLEN_slvif+'h1; //
        end
		else if(PIPE == 2 | ECC == 1) begin 
		  if(rvalid_mc && RREADY_slvif && rdbeat_cnt != 'h0) begin 
            rdbeat_cnt <= rdbeat_cnt - 'h1;
		  end
        end 		  
		else begin 
          if(ren_sc && rdbeat_cnt != 'h0) begin 
            rdbeat_cnt <= rdbeat_cnt - 'h1;
          end 
        end
      end
    end

   // ----------------------------------------------------------------- //
   // Generate the read aligned address based on the read size (ARSIZE) //
   // ----------------------------------------------------------------- //
        
    always @(posedge ACLK or negedge ARESETN) begin
       if(ARESETN == 1'b0) begin
          raddr_aligned   <= 'h0;       
       end
       else begin
          if(ARVALID_slvif & arready_mc) begin
             raddr_aligned <= raddr_aligned_load;
          end
          else if(ren_sc || set_rdaligned_done) begin
             raddr_aligned <= raddr_aligned + rd_number_bytes;
          end
       end // else: !if(ARESETN == 1'b0)      
    end // always @ (posedge ACLK or negedge ARESETN)

    always @(*) begin
       if(ARVALID && arready_mc) begin
        case(ARSIZE)  
         3'b000 : begin
            raddr_aligned_load = ARADDR;              
            rd_number_bytes   = 'h1;
         end
         3'b001 : begin
            raddr_aligned_load = {ARADDR[AXI4_AWIDTH - 1: 1], 1'b0};
            rd_number_bytes   = 'h2;
         end
         3'b010 : begin
            raddr_aligned_load = {ARADDR[AXI4_AWIDTH - 1: 2], 2'b00};
            rd_number_bytes   = 'h4;
         end
         3'b011 : begin
            raddr_aligned_load = {ARADDR[AXI4_AWIDTH - 1: 3], 3'b000};
            rd_number_bytes   = 'h8;
         end
         3'b100 : begin
            raddr_aligned_load = {ARADDR[AXI4_AWIDTH - 1: 4], 4'b0000};
            rd_number_bytes   = 'h10;
         end
         3'b101 : begin
            raddr_aligned_load = {ARADDR[AXI4_AWIDTH - 1: 5], 5'b00000};
            rd_number_bytes   = 'h20;
         end
         3'b110 : begin
            raddr_aligned_load = {ARADDR[AXI4_AWIDTH - 1: 6], 6'b000000};
            rd_number_bytes   = 'h40;
         end
         3'b111 : begin
            raddr_aligned_load = {ARADDR[AXI4_AWIDTH - 1: 7], 7'b0000000};
            rd_number_bytes   = 'h80;
         end
         default : begin
            raddr_aligned_load = 'h0;
            rd_number_bytes   = 'h0;
         end
       endcase // case (ARSIZE)
       end // if (ARVALID && arready_mc)
       else begin
            raddr_aligned_load = raddr_aligned_load_r;
            rd_number_bytes   = rd_number_bytes_r;
       end // else: !if(ARVALID && arready_mc)            
    end // always @ (*)         

    always @(posedge ACLK or negedge ARESETN) begin
       if(ARESETN == 1'b0) begin
          raddr_aligned_load_r <= 1'b0;  
          rd_number_bytes_r    <= 'h0;       
          set_rdaligned_done_r <= 1'b0;               
       end
       else begin
          raddr_aligned_load_r <= raddr_aligned_load;  
          rd_number_bytes_r    <= rd_number_bytes;       
          set_rdaligned_done_r <= set_rdaligned_done;               
       end
    end

   // ------------------------------------------------------------------------ //
   // //////////////////////////////////////////////////////////////////////// //
   //                        SRAM Control block                             // //
   // //////////////////////////////////////////////////////////////////////// //
   // ------------------------------------------------------------------------ //
   
    always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) begin
         wrap_raddr_next_r  <= 'h0;   
	  end 
	  else begin 
	     wrap_raddr_next_r  <= wrap_raddr_next;  
	  end 
	end

   // --------------------------------------------------------------------------
   // Generate the wrap address based on the write size (AWSIZE) and write 
   // length (AWLEN)
   // --------------------------------------------------------------------------

   // Increment the start address using the number bytes for calculation of
   // address.

    always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) begin
         wrap_raddr_incr   <= 'h0;
      end
      else begin         
         if(WRAP_SUPPORT) begin
            if(ARVALID && arready_mc) begin
               wrap_raddr_incr <= ARADDR + rd_number_bytes;
            end
            else if(ren_sc) begin
               wrap_raddr_incr <= wrap_raddr_next + rd_number_bytes;
            end
         end
      end // else: !if(ARESETN == 1'b0)
    end // always @ (posedge ACLK or negedge ARESETN)         
   
   // Calculate the next waddr for wrap transactions based 
   // on the write burst length and the write burst type.
    always @(*) begin
      if(ARVALID_slvif & arready_mc) begin
         wrap_raddr_next = ARADDR;
      end
      else if(ARBURST_slvif == 2'b10  && ARSIZE_slvif == 3'b110 && WRAP_SUPPORT) begin // For Wrap burst  // 512-bit
         case (ARLEN_slvif)
           8'b0000_0000: begin
              // no wrap
              wrap_raddr_next = wrap_raddr_incr;
           end
           8'b0000_0001: begin
              // Wrap at every two locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[6:0] == 7'b1000000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:7],7'b0000000};
              end
              else if(raddr_sc_dummy[6:0] == 7'b1000000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:7],7'b0000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_0011: begin
              // Wrap at every four locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[7:0] == 8'b11000000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:8],8'b00000000};
              end
              else if(raddr_sc_dummy[7:0] == 8'b11000000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:8],8'b00000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;     
              end
           end
           8'b0000_0111: begin
              // Wrap at every eight locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[8:0] == 9'b111000000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:9],9'b000000000};
              end
              else if(raddr_sc_dummy[8:0] == 9'b111000000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:9],9'b000000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_1111: begin
              // Wrap at every 16 locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[9:0] == 10'b1111000000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:10],10'b0000000000};
              end
              else if(raddr_sc_dummy[9:0] == 10'b1111000000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:10],10'b0000000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           default: begin
              wrap_raddr_next = wrap_raddr_next_r;
           end   
         endcase
      end
      // ---- (ARSIZE = 6 i.e. 512-bit)
      else if(ARBURST_slvif == 2'b10  && ARSIZE_slvif == 3'b101 && WRAP_SUPPORT) begin // For Wrap burst  // 256-bit
         case (ARLEN_slvif)
           8'b0000_0000: begin
              // no wrap
              wrap_raddr_next = wrap_raddr_incr;
           end
           8'b0000_0001: begin
              // Wrap at every two locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[5:0] == 6'b100000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:6],6'b000000};
              end
              else if(raddr_sc_dummy[5:0] == 6'b100000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:6],6'b000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_0011: begin
              // Wrap at every four locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[6:0] == 7'b1100000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:7],7'b0000000};
              end
              else if(raddr_sc_dummy[6:0] == 7'b1100000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:7],7'b0000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;     
              end
           end
           8'b0000_0111: begin
              // Wrap at every eight locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[7:0] == 8'b11100000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:8],8'b00000000};
              end
              else if(raddr_sc_dummy[7:0] == 8'b11100000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:8],8'b00000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_1111: begin
              // Wrap at every 16 locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[8:0] == 9'b111100000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:9],9'b000000000};
              end
              else if(raddr_sc_dummy[8:0] == 9'b111100000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:9],9'b000000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           default: begin
              wrap_raddr_next = wrap_raddr_next_r;
           end   
         endcase
      end
      // ---- (ARSIZE = 5 i.e. 256-bit)
      else if(ARBURST_slvif == 2'b10  && ARSIZE_slvif == 3'b100 && WRAP_SUPPORT) begin // For Wrap burst
         case (ARLEN_slvif)
           8'b0000_0000: begin
              // no wrap
              wrap_raddr_next = wrap_raddr_incr;
           end
           8'b0000_0001: begin
              // Wrap at every two locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[4:0] == 5'b10000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:5],5'b00000};
              end
              else if(raddr_sc_dummy[4:0] == 5'b10000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:5],5'b00000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_0011: begin
              // Wrap at every four locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[5:0] == 6'b110000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:6],6'b000000};
              end
              else if(raddr_sc_dummy[5:0] == 6'b110000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:6],6'b000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;     
              end
           end
           8'b0000_0111: begin
              // Wrap at every eight locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[6:0] == 7'b1110000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:7],7'b0000000};
              end
              else if(raddr_sc_dummy[6:0] == 7'b1110000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:7],7'b0000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_1111: begin
              // Wrap at every 16 locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[7:0] == 8'b11110000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:8],8'b00000000};
              end
              else if(raddr_sc_dummy[7:0] == 8'b11110000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:8],8'b00000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           default: begin
              wrap_raddr_next = wrap_raddr_next_r;
           end   
         endcase
      end
      // ---- (ARSIZE = 4 i.e. 128-bit)
      else if(ARBURST_slvif == 2'b10  && ARSIZE_slvif == 3'b011 && WRAP_SUPPORT) begin // For Wrap burst
         case (ARLEN_slvif)
           8'b0000_0000: begin
              // no wrap
              wrap_raddr_next = wrap_raddr_incr;
           end
           8'b0000_0001: begin
              // Wrap at every two locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[3:0] == 4'b1000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:4],4'b0000};
              end
              else if(raddr_sc_dummy[3:0] == 4'b1000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:4],4'b0000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_0011: begin
              // Wrap at every four locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[4:0] == 5'b11000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:5],5'b00000};
              end
              else if(raddr_sc_dummy[4:0] == 5'b11000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:5],5'b00000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;     
              end
           end
           8'b0000_0111: begin
              // Wrap at every eight locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[5:0] == 6'b111000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:6],6'b000000};
              end
              else if(raddr_sc_dummy[5:0] == 6'b111000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:6],6'b000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_1111: begin
              // Wrap at every 16 locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[6:0] == 7'b1111000 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:7],7'b0000000};
              end
              else if(raddr_sc_dummy[6:0] == 7'b1111000 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:7],7'b0000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           default: begin
              wrap_raddr_next = wrap_raddr_next_r;
           end   
         endcase
      end
      // The wrap boundary for Size - Word/Halfword and Byte is defined in the
      // if-else conditions
      else if(ARBURST_slvif == 2'b10  && (ARSIZE_slvif == 3'b010) && WRAP_SUPPORT) begin // For Wrap burst
         case (ARLEN_slvif)
           8'b0000_0000: begin
              // no wrap
              wrap_raddr_next = wrap_raddr_incr;
           end
           8'b0000_0001: begin
              // Wrap at every two locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[2:0] == 3'b100 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:3],3'b000};
              end
              else if(raddr_sc_dummy[2:0] == 3'b100 && ren_sc) begin
                 wrap_raddr_next = {wrap_raddr[AXI4_AWIDTH-1:3],3'b000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_0011: begin
              // Wrap at every four locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[3:0] == 4'b1100 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:4],4'b0000};
              end
              else if(raddr_sc_dummy[3:0] == 4'b1100 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:4],4'b0000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;     
              end
           end
           8'b0000_0111: begin
              // Wrap at every eight locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[4:0] == 5'b11100 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:5],5'b00000};
              end
              else if(raddr_sc_dummy[4:0] == 5'b11100 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:5],5'b00000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_1111: begin
              // Wrap at every 16 locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[5:0] == 6'b111100 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:6],6'b000000};
              end
              else if(raddr_sc_dummy[5:0] == 6'b111100 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:6],6'b000000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           default: begin
              wrap_raddr_next = wrap_raddr_next_r;
           end   
         endcase
      end
      else if(ARBURST_slvif == 2'b10  && (ARSIZE_slvif == 3'b001) && WRAP_SUPPORT) begin // For Wrap burst
         case (ARLEN_slvif)
           8'b0000_0000: begin
              // no wrap
              wrap_raddr_next = wrap_raddr_incr;
           end
           8'b0000_0001: begin
              // Wrap at every two locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[1:0] == 2'b10 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:2],2'b00};
              end
              else if(raddr_sc_dummy[1:0] == 2'b10 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:2],2'b00};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_0011: begin
              // Wrap at every four locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[2:0] == 3'b110 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:3],3'b000};
              end
              else if(raddr_sc_dummy[2:0] == 3'b110 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:3],3'b000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;     
              end
           end
           8'b0000_0111: begin
              // Wrap at every eight locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[3:0] == 4'b1110 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:4],4'b0000};
              end
              else if(raddr_sc_dummy[3:0] == 4'b1110 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:4],4'b0000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_1111: begin
              // Wrap at every 16 locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[4:0] == 5'b11110 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:5],5'b00000};
              end
              else if(raddr_sc_dummy[4:0] == 5'b11110 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:5],5'b00000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           default: begin
              wrap_raddr_next = wrap_raddr_next_r;
           end   
         endcase
      end
      else if(ARBURST_slvif == 2'b10  && (ARSIZE_slvif == 3'b000) && WRAP_SUPPORT) begin // For Wrap burst
         case (ARLEN_slvif)
           8'b0000_0000: begin
              // no wrap
              wrap_raddr_next = wrap_raddr_incr;
           end
           8'b0000_0001: begin
              // Wrap at every two locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[0] == 1'b1 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:1],1'b0};
              end
              else if(raddr_sc_dummy[0] == 1'b1 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:1],1'b0};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_0011: begin
              // Wrap at every four locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[1:0] == 2'b11 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:2],2'b00};
              end
              else if(raddr_sc_dummy[1:0] == 2'b11 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:2],2'b00};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;     
              end
           end
           8'b0000_0111: begin
              // Wrap at every eight locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[2:0] == 3'b111 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:3],3'b000};
              end
              else if(raddr_sc_dummy[2:0] == 3'b111 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:3],3'b000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           8'b0000_1111: begin
              // Wrap at every 16 locations
              // Roll-over when the wrap boundary is reached.
              if(ARADDR_slvif[3:0] == 4'b1111 && set_rdaligned_done) begin
                 wrap_raddr_next = {ARADDR_slvif[AXI4_AWIDTH-1:4],4'b0000};
              end
              else if(raddr_sc_dummy[3:0] == 4'b1111 && ren_sc) begin
                 wrap_raddr_next = {raddr_sc_dummy[AXI4_AWIDTH-1:4],4'b0000};
              end
              else begin
                 wrap_raddr_next = wrap_raddr_plus;
              end
           end
           default: begin
              wrap_raddr_next = wrap_raddr_next_r;
           end   
         endcase
      end
      else begin
         wrap_raddr_next = 'h0;
      end
    end

    always @(posedge ACLK or negedge ARESETN) begin
      if(ARESETN == 1'b0) begin
         wrap_raddr_r   <= 'h0;
      end
      else begin
         wrap_raddr_r <= wrap_raddr;         
      end
    end


    always @(*) begin
      wrap_raddr      = wrap_raddr_r;
      if(WRAP_SUPPORT && ARBURST_slvif == 2'b10) begin  // For burst type = WRAP
         wrap_raddr   = ARADDR_slvif;
      end
    end   
  end 
endgenerate   
endmodule // CoreAXI4SRAM_MAINCTRL
