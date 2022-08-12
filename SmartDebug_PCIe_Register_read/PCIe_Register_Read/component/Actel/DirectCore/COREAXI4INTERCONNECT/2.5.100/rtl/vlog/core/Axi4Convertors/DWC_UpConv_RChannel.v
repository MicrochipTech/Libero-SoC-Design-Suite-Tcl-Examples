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
//     Abstract  : This module handles the Read Data channel within the up converter.              
//                 It is made up by:
//                 - the command caxi4interconnect_FIFO stores the relevant field of the address channel
//                 - the data caxi4interconnect_FIFO stores the data coming from the slave
//                 - the read response caxi4interconnect_FIFO stores the response field coming from the slave
//                 - the read channel control module generates read channel control signals
//                   and select the appropriate part of the data on the output line of the data
//                   caxi4interconnect_FIFO
//
//  COPYRIGHT 2017 BY MICROSEMI 
//  THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
//  FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
//  MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
//  NO BACK-UP OF THE FILE SHOULD BE MADE. 
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 




module caxi4interconnect_DWC_UpConv_RChannel #

  (
    parameter integer       ID_WIDTH        = 1,
    parameter integer       USER_WIDTH      = 1,
    parameter integer       DATA_FIFO_DEPTH = 1024,
    parameter integer       ADDR_FIFO_DEPTH = 3,
    parameter integer       DATA_WIDTH_IN   = 32,
    parameter integer       DATA_WIDTH_OUT  = 32

  )
  (

    input wire sysReset,
    input wire ACLK,

    // Input Write channel
    // Address R channel
    input wire [ID_WIDTH-1:0]             arid_mstr,
    input wire [5:0]                      araddr_mstr,
    input wire [7:0]                      arlen_mstr,

    // R channel
    input wire  [ID_WIDTH-1:0]            SLAVE_RID,
    input wire  [DATA_WIDTH_IN-1:0]       SLAVE_RDATA,
    input wire  [USER_WIDTH-1:0]          SLAVE_RUSER,
    input wire                            SLAVE_RLAST,
    input wire                            SLAVE_RVALID,
    input wire  [1:0]                     SLAVE_RRESP,
    output wire                           SLAVE_RREADY,

    // R channel
    output wire [ID_WIDTH-1:0]            MASTER_RID,
    output wire [DATA_WIDTH_OUT-1:0]      MASTER_RDATA,
    output wire [USER_WIDTH-1:0]          MASTER_RUSER,
    output wire                           MASTER_RLAST,
    output wire                           MASTER_RVALID,
    output wire[1:0]                      MASTER_RRESP,
    input wire                            MASTER_RREADY,
    input wire [2:0]                      MASTER_RSIZE,

    output wire                           cmd_fifo_full,
    input wire                            wr_en_cmd,
    input wire                            extend_wrap,
    input wire                            wrap_flag,
    input wire [4:0]                      to_boundary_master,
    input wire				  fixed_flag
        );

  wire rd_en_cmd_mst;
  wire rd_en_cmd_mst_out;
  wire rd_cmd_mst_fifo_full;
  wire rd_cmd_mst_fifo_empty;
  wire rd_cmd_mst_fifo_empty_out;

  wire rd_en_data;

  wire data_hold;

  wire [($clog2(DATA_WIDTH_IN/DATA_WIDTH_OUT)-1):0] rd_src;

  wire [ID_WIDTH-1:0]             arid_mstr_out;
  wire [5:0]                      araddr_mstr_out;
  wire [7:0]                      arlen_mstr_out;
  wire [2:0]                      MASTER_RSIZE_out;

  wire                            extend_wrap_out;
  wire                            wrap_flag_out;
  wire [4:0]                      to_boundary_master_out;
  wire				              fixed_flag_out;
  wire      [5:0]                 rd_src_top;



  wire [DATA_WIDTH_OUT+USER_WIDTH-1:0]      fifo_data_out;
  wire [25+ID_WIDTH-1:0]       mstr_cmd_out;

  wire data_fifo_empty;
  wire data_fifo_full;
  wire data_fifo_one_from_full;
  wire data_fifo_nearly_full;

  wire rresp_fifo_empty;
  wire rresp_fifo_full;
  wire rresp_fifo_one_from_full;
  
  wire     [9:0]               addr_in;
  wire     [ID_WIDTH - 1:0]    arid_in;
  wire     [7:0]               MASTER_RLEN_in;
  wire     [2:0]               MASTER_RSIZE_in;
  wire                         fixed_flag_in;
  wire                         wrap_flag_in;
  wire     [4:0]               to_wrap_boundary_in;
  
  wire                         MASTER_RLEN_eq_0_out;
  
  
  wire     [9:0]               mask_pre;
  wire     [9:0]               rd_src_shift_pre;

	caxi4interconnect_FIFO #
		(
			.MEM_DEPTH            ( ADDR_FIFO_DEPTH ),
			.DATA_WIDTH_IN        ( 18 + ID_WIDTH + 1 + 1 + 5 ),
			.DATA_WIDTH_OUT       ( 18 + ID_WIDTH + 1 + 1 + 5 ), 
			.NEARLY_FULL_THRESH   ( ADDR_FIFO_DEPTH - 1 ), // Setting nearly full thresh to allow for 1 left in caxi4interconnect_FIFO
			.NEARLY_EMPTY_THRESH  ( 1 )
		)
	rd_cmd_mst (
			.rst                  (sysReset ),
			.clk                  ( ACLK ),
			.wr_en                ( wr_en_cmd ),
			.rd_en                ( rd_en_cmd_mst_out ),
			.data_in              ( {to_boundary_master, extend_wrap, wrap_flag, fixed_flag, MASTER_RSIZE, arid_mstr, araddr_mstr, arlen_mstr} ),
			.data_out             ( {to_boundary_master_out, extend_wrap_out, wrap_flag_out, fixed_flag_out, MASTER_RSIZE_out, arid_mstr_out, araddr_mstr_out, arlen_mstr_out} ),
			.zero_data            ( 1'b0 ),
			.fifo_full            ( rd_cmd_mst_fifo_full ),
			.fifo_empty           ( rd_cmd_mst_fifo_empty ),
			.fifo_nearly_full     ( cmd_fifo_full ),
			.fifo_nearly_empty    ( ),
			.fifo_one_from_full   ( )
	);

	caxi4interconnect_FIFO_downsizing #
		(
			.MEM_DEPTH( DATA_FIFO_DEPTH ),
 			.DATA_WIDTH_IN ( DATA_WIDTH_IN ),
			.DATA_WIDTH_OUT ( DATA_WIDTH_OUT ),
      .EXTRA_DATA_WIDTH ( USER_WIDTH ),	
			.NEARLY_FULL_THRESH ( DATA_FIFO_DEPTH - 1 ),
			.NEARLY_EMPTY_THRESH ( 1 )
		)
	data_fifo (
			.rst ( sysReset ),
			.clk ( ACLK ),
      .rd_src ( rd_src ),
			.wr_en ( SLAVE_RREADY & SLAVE_RVALID ),
			.rd_en ( rd_en_data ),
			.data_in ( {SLAVE_RUSER, SLAVE_RDATA} ),
			.data_out ( fifo_data_out ),
      .data_hold ( data_hold ),
			.fifo_full ( ),
			.fifo_empty ( data_fifo_empty ),
			.fifo_nearly_full ( data_fifo_full ),
			.fifo_nearly_empty ( ),
			.fifo_one_from_full ( data_fifo_one_from_full )
	);

  caxi4interconnect_DWC_UpConv_RChan_Ctrl #
  (
      .DATA_WIDTH_IN        ( DATA_WIDTH_IN ),
      .DATA_WIDTH_OUT       ( DATA_WIDTH_OUT ),
      .ID_WIDTH             ( ID_WIDTH )
  )
      RChan_Ctrl     
  (
      .ACLK                 ( ACLK ),
      .sysReset             ( sysReset ),
      .data_empty           ( data_fifo_empty | rresp_fifo_empty ),
      .rd_src               ( rd_src ),
      .data_hold            ( data_hold ),
      .rd_en_data           ( rd_en_data ),
      .rd_en_cmd            ( rd_en_cmd_mst ),
      .addr                 ( addr_in ),
      .arid                 ( arid_in ),
      .MASTER_RLEN_eq_0     ( MASTER_RLEN_eq_0_out),
	  .mask_pre             (mask_pre),
      .rd_src_shift_pre     (rd_src_shift_pre),
      .MASTER_RLEN          ( MASTER_RLEN_in),
      .MASTER_RREADY        ( MASTER_RREADY ),
      .MASTER_RLAST         ( MASTER_RLAST ),
      .MASTER_RVALID        ( MASTER_RVALID ),
      .MASTER_RID           ( MASTER_RID ),
      .MASTER_RSIZE         ( MASTER_RSIZE_in),
      .SLAVE_RREADY         ( SLAVE_RREADY ),
      .SLAVE_RLAST          ( SLAVE_RLAST ),
      .SLAVE_RVALID         ( SLAVE_RVALID ),
      .space_in_data_fifo   ( ~( data_fifo_full ) ),
      .space_in_rresp_fifo  ( ~( rresp_fifo_full ) ),
      .fixed_flag	          ( fixed_flag_in ),
      .wrap_flag	          ( wrap_flag_in),
	 .rd_src_top              (rd_src_top),
      .to_wrap_boundary	    ( to_wrap_boundary_in )
  );
  

  caxi4interconnect_DWC_UpConv_preCalcRChan_Ctrl #
(
   .DATA_WIDTH_IN        ( DATA_WIDTH_IN ),
   .DATA_WIDTH_OUT       ( DATA_WIDTH_OUT ),
   .USER_WIDTH           ( USER_WIDTH ),
   .ID_WIDTH             ( ID_WIDTH )

) preCalcRChan_Ctrl
  (
     .clk( ACLK ),
     .rst( sysReset ),
     .addr_in( araddr_mstr_out ),
     .arid_in( arid_mstr_out ),
     .MASTER_RLEN_in( arlen_mstr_out ),
     .MASTER_RSIZE_in( MASTER_RSIZE_out),
     .fixed_flag_in( fixed_flag_out ),
     .wrap_flag_in( wrap_flag_out ),
     .extend_wrap_in( extend_wrap_out ),
     .to_wrap_boundary_in( to_boundary_master_out ),
	 	 
     .rd_cmd_mst_fifo_empty_in(rd_cmd_mst_fifo_empty), 
     .rd_en_cmd_mst_in(rd_en_cmd_mst), 
	 
     .addr_out(addr_in),
     .arid_out(arid_in),
     .MASTER_RLEN_out(MASTER_RLEN_in),
     .MASTER_RSIZE_out(MASTER_RSIZE_in),
     .fixed_flag_out(fixed_flag_in),
     .wrap_flag_out(wrap_flag_in),
     .to_wrap_boundary_out(to_wrap_boundary_in),
     .rd_cmd_mst_fifo_empty_out(rd_cmd_mst_fifo_empty_out), 
     .rd_en_cmd_mst_out(rd_en_cmd_mst_out),
	 .mask_pre             (mask_pre),
     .rd_src_shift_pre     (rd_src_shift_pre),
	 .rd_src_top           (rd_src_top),
	 
     .MASTER_RLEN_eq_0_out(MASTER_RLEN_eq_0_out)
  );


  caxi4interconnect_FIFO_downsizing #
      (
          .MEM_DEPTH( DATA_FIFO_DEPTH ),
          .DATA_WIDTH_IN ( 2 ),
          .DATA_WIDTH_OUT ( 2 ),
          .NEARLY_FULL_THRESH ( DATA_FIFO_DEPTH -1 ),
          .NEARLY_EMPTY_THRESH ( 0 ),
  .EXTRA_DATA_WIDTH ( 0 )
      )
    rresp_fifo (
          .rst ( sysReset ),
          .clk ( ACLK ),
          .rd_src ( 2'b0 ),
          .wr_en ( SLAVE_RREADY & SLAVE_RVALID ),
          .rd_en ( rd_en_data ),
          .data_in ( SLAVE_RRESP ),
          .data_out ( MASTER_RRESP ),
          .data_hold ( data_hold ),
          .fifo_full ( ),
          .fifo_empty ( rresp_fifo_empty ),
          .fifo_nearly_full ( rresp_fifo_full ),
          .fifo_nearly_empty ( ),
          .fifo_one_from_full ( rresp_fifo_one_from_full )
        );

	assign MASTER_RDATA = fifo_data_out[DATA_WIDTH_OUT-1: 0];
	assign MASTER_RUSER = fifo_data_out[DATA_WIDTH_OUT+:USER_WIDTH];

endmodule	
