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
//  COPYRIGHT 2017 BY MICROSEMI 
//  THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
//  FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
//  MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
//  NO BACK-UP OF THE FILE SHOULD BE MADE. 
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

module caxi4interconnect_DWC_DownConv_readWidthConv( MASTER_ARADDR,
                      MASTER_ARBURST,
                      MASTER_ARCACHE,
                      MASTER_ARID,
                      MASTER_ARLEN,
                      MASTER_ARLOCK,
                      MASTER_ARPROT,
                      MASTER_ARQOS,
                      MASTER_ARREADY,
                      MASTER_ARREGION,
                      MASTER_ARSIZE,
                      MASTER_ARUSER,
                      MASTER_ARVALID,
                      MASTER_RDATA,
                      MASTER_RID,
                      MASTER_RLAST,
                      MASTER_RREADY,
                      MASTER_RRESP,
                      MASTER_RUSER,
                      MASTER_RVALID,
                      SLAVE_RDATA,
                      SLAVE_RID,
                      SLAVE_RLAST,
                      SLAVE_RREADY,
                      SLAVE_RRESP,
                      SLAVE_RUSER,
                      SLAVE_RVALID,
                      SLAVE_ARADDR,
                      SLAVE_ARBURST,
                      SLAVE_ARCACHE,
                      SLAVE_ARID,
                      SLAVE_ARLEN,
                      SLAVE_ARLOCK,
                      SLAVE_ARPROT,
                      SLAVE_ARQOS,
                      SLAVE_ARREADY,
                      SLAVE_ARREGION,
                      SLAVE_ARVALID,
                      SLAVE_ASIZE,
                      SLAVE_AUSER,
                      ACLK,
                      sysReset );

parameter DATA_WIDTH_IN = 32; 
parameter ADDR_FIFO_DEPTH = 3; 
parameter CMD_FIFO_DATA_WIDTH = 29; 
parameter DATA_WIDTH_OUT = 32; 
parameter ADDR_WIDTH = 20; 
parameter ID_WIDTH = 1; 
parameter USER_WIDTH = 1; 


// Port: MASTER_ARChan

input [ADDR_WIDTH-1:0] MASTER_ARADDR;
input [1:0]    MASTER_ARBURST;
input [3:0]    MASTER_ARCACHE;
input [ID_WIDTH-1:0] MASTER_ARID;
input [7:0]    MASTER_ARLEN;
input [1:0]    MASTER_ARLOCK;
input [2:0]    MASTER_ARPROT;
input [3:0]    MASTER_ARQOS;
output         MASTER_ARREADY;
input [3:0]    MASTER_ARREGION;
input [2:0]    MASTER_ARSIZE;
input [USER_WIDTH-1:0] MASTER_ARUSER;
input          MASTER_ARVALID;

// Port: MASTER_RChan

output [DATA_WIDTH_OUT-1:0] MASTER_RDATA;
output [ID_WIDTH-1:0] MASTER_RID;
output         MASTER_RLAST;
input          MASTER_RREADY;
output [1:0]   MASTER_RRESP;
output [USER_WIDTH-1:0] MASTER_RUSER;
output         MASTER_RVALID;

// Port: SLAVE_RChan

input [DATA_WIDTH_IN-1:0] SLAVE_RDATA;
input [ID_WIDTH-1:0] SLAVE_RID;
input          SLAVE_RLAST;
output         SLAVE_RREADY;
input [1:0]    SLAVE_RRESP;
input [USER_WIDTH-1:0] SLAVE_RUSER;
input          SLAVE_RVALID;

// Port: SLAVE_ARChan

output [ADDR_WIDTH-1:0] SLAVE_ARADDR;
output [1:0]   SLAVE_ARBURST;
output [3:0]   SLAVE_ARCACHE;
output [ID_WIDTH-1:0] SLAVE_ARID;
output [7:0]   SLAVE_ARLEN;
output [1:0]   SLAVE_ARLOCK;
output [2:0]   SLAVE_ARPROT;
output [3:0]   SLAVE_ARQOS;
input          SLAVE_ARREADY;
output [3:0]   SLAVE_ARREGION;
output         SLAVE_ARVALID;
output [2:0]   SLAVE_ASIZE;
output [USER_WIDTH-1:0] SLAVE_AUSER;

// Port: system

input          ACLK;
input          sysReset;

wire           CmdFifoNearlyFull;
wire [CMD_FIFO_DATA_WIDTH-1:0] CmdFifowrData;
wire [CMD_FIFO_DATA_WIDTH-1:0] rdCmdFifoReadData;
wire           rdCmdFifore;
wire           rdCmdFifoEmpty;
wire           wr_en;

wire [CMD_FIFO_DATA_WIDTH-1:0] preHold_rdCmdFifoReadData;
wire													 preHold_rdCmdFifoEmpty;
wire 													 postHold_rdCmdFifore;
/// I/O_End <<<---



// wire [8:0]	to_boundary_conv_pre;
wire [4:0]	to_boundary_master_pre;
wire [5:0]  mask_addr_pre;
wire [2:0]	ASIZE_pre;
wire [12:0]	tot_len_M_to_boundary_conv_pre;
wire [7:0]	to_boundary_conv_M1_pre;
wire [12:0]	tot_len_pre;
wire [8:0]	max_length_comb_pre;
wire [8:0]	length_comb_pre;
wire 				tot_len_GT_max_length_comb_pre;
wire [12:0]	tot_len_M_max_length_comb_pre;
wire [7:0]	tot_axi_len_pre;
wire [2:0]	wrap_log_len_comb_pre;
wire [5:0]	sizeMax_pre;
wire 				SameMstSlvSize_pre;
wire [5:0]	sizeCnt_comb_pre;

wire from_ctrl_SLAVE_ARREADY;



wire     [7:0]               int_MASTER_ARLEN;
wire                         int_MASTER_ARVALID;
wire     [ID_WIDTH - 1:0]    int_MASTER_ARID;
wire     [ADDR_WIDTH - 1:0]  int_MASTER_ARADDR;
wire     [1:0]               int_MASTER_ARBURST;
wire     [3:0]               int_MASTER_ARCACHE;
wire     [1:0]               int_MASTER_ARLOCK;
wire     [2:0]               int_MASTER_ARSIZE;
wire     [2:0]               int_MASTER_ARPROT;
wire     [3:0]               int_MASTER_ARQOS;
wire     [3:0]               int_MASTER_ARREGION;
wire     [USER_WIDTH - 1:0]  int_MASTER_ARUSER;

wire                         int_MASTER_ARREADY; // from wrCmdFifoWriteCtrl

wire [5:0]  mask_mstSize;
wire [5:0]  mask_slvSize;
wire        sizeCnt_comb_EQ_SizeMax;
wire [5:0]  master_ADDR_masked;
wire [5:0]  second_Beat_Addr;
wire [5:0]  sizeCnt_comb_P1;
wire [6:0]  slaveSize_one_hot;
wire [5:0]  sizeMax_extend;
wire [ADDR_WIDTH - 1:0]  MASTER_ARADDR_mux;

   wire      [DATA_WIDTH_OUT - 1:0] shifted_mst_mask_bit;
   wire      [DATA_WIDTH_IN - 1:0] shifted_slv_mask_bit;
   wire   [(DATA_WIDTH_OUT / 8) - 1:0] shifted_mst_mask_byte;
  wire    [(DATA_WIDTH_IN / 8) - 1:0] shifted_slv_mask_byte;



/// Components_Start --->>>


// File: caxi4interconnect_FIFO.v

defparam rdCmdFifo.DATA_WIDTH_IN = CMD_FIFO_DATA_WIDTH;
defparam rdCmdFifo.DATA_WIDTH_OUT = CMD_FIFO_DATA_WIDTH;
defparam rdCmdFifo.MEM_DEPTH = ADDR_FIFO_DEPTH;
defparam rdCmdFifo.NEARLY_FULL_THRESH = ADDR_FIFO_DEPTH-1;

caxi4interconnect_FIFO rdCmdFifo( .data_in(CmdFifowrData[CMD_FIFO_DATA_WIDTH-1:0]),
                .fifo_full(),
                .fifo_nearly_full(CmdFifoNearlyFull),
                .fifo_one_from_full(),
                .wr_en(wr_en),
                .zero_data(1'b0),
                .data_out(preHold_rdCmdFifoReadData[CMD_FIFO_DATA_WIDTH-1:0]),
                .fifo_empty(preHold_rdCmdFifoEmpty),
                .fifo_nearly_empty(),
                .rd_en(postHold_rdCmdFifore),
                .clk(ACLK),
                .rst(sysReset) );



// File: caxi4interconnect_DWC_DownConv_Hold_Reg_Rd.v

defparam caxi4interconnect_DWC_DownConv_Hold_Reg_Rd.CMD_FIFO_DATA_WIDTH = CMD_FIFO_DATA_WIDTH;
defparam caxi4interconnect_DWC_DownConv_Hold_Reg_Rd.ID_WIDTH = ID_WIDTH;

caxi4interconnect_DWC_DownConv_Hold_Reg_Rd caxi4interconnect_DWC_DownConv_Hold_Reg_Rd(
                    .ACLK           (ACLK), // INPUT
                    .sysReset       (sysReset), // INPUT

                    .DWC_DownConv_hold_data_in        (preHold_rdCmdFifoReadData[CMD_FIFO_DATA_WIDTH-1:0]), // INPUT
                    .DWC_DownConv_hold_fifo_empty     (preHold_rdCmdFifoEmpty), // INPUT

                    .DWC_DownConv_hold_get_next_data  (rdCmdFifore), // INPUT

                    .DWC_DownConv_hold_fifo_rd_en    (postHold_rdCmdFifore), // OUTPUT
                    .DWC_DownConv_hold_data_out      (rdCmdFifoReadData[CMD_FIFO_DATA_WIDTH-1:0]), // OUTPUT
                    .DWC_DownConv_hold_reg_empty     (rdCmdFifoEmpty), // OUTPUT

                    .mask_slvSize              ( mask_slvSize), // OUTPUT
                    .mask_mstSize              ( mask_mstSize), // OUTPUT
                    .sizeCnt_comb_EQ_SizeMax   ( sizeCnt_comb_EQ_SizeMax ), // OUTPUT
                    .master_ADDR_masked        ( master_ADDR_masked ), // OUTPUT
                    .second_Beat_Addr          ( second_Beat_Addr ), // OUTPUT
                    .sizeCnt_comb_P1           ( sizeCnt_comb_P1), // OUTPUT
                    .slaveSize_one_hot_hold    ( slaveSize_one_hot), // OUTPUT
                    .sizeMax_extend            ( sizeMax_extend) // OUTPUT
                     );

// File: widthConvrd.v

defparam widthConvrd.DATA_WIDTH_IN = DATA_WIDTH_IN;
defparam widthConvrd.DATA_WIDTH_OUT = DATA_WIDTH_OUT;
defparam widthConvrd.ID_WIDTH = ID_WIDTH;
defparam widthConvrd.USER_WIDTH = USER_WIDTH;
defparam widthConvrd.CMD_FIFO_DATA_WIDTH = CMD_FIFO_DATA_WIDTH;

caxi4interconnect_DWC_DownConv_widthConvrd widthConvrd( 
                         .MASTER_RDATA        ( MASTER_RDATA ),
                         .MASTER_RID          ( MASTER_RID ),
                         .MASTER_RLAST        ( MASTER_RLAST ),
                         .MASTER_RREADY       ( MASTER_RREADY ),
                         .MASTER_RRESP        ( MASTER_RRESP ),
                         .MASTER_RUSER        ( MASTER_RUSER ),
                         .MASTER_RVALID       ( MASTER_RVALID ),
                         .SLAVE_RDATA         ( SLAVE_RDATA ),
                         .SLAVE_RLAST         ( SLAVE_RLAST ),
                         .SLAVE_RREADY        ( SLAVE_RREADY ),
                         .SLAVE_RRESP         ( SLAVE_RRESP ),
                         .SLAVE_RUSER         ( SLAVE_RUSER ),
                         .SLAVE_RVALID        ( SLAVE_RVALID ),
                         .rdCmdFifoReadData   ( rdCmdFifoReadData ),
                         .rdCmdFifore         ( rdCmdFifore ),
                         .rdCmdFifoEmpty      ( rdCmdFifoEmpty ),
                         .ACLK                ( ACLK ),
                         .sysReset            ( sysReset ),
                         .shifted_slv_mask_bit( shifted_slv_mask_bit ),
                         .shifted_mst_mask_bit( shifted_mst_mask_bit ),
                         .shifted_slv_mask_byte( shifted_slv_mask_byte ),
                         .shifted_mst_mask_byte( shifted_mst_mask_byte ),

                         .mask_mstSize            ( mask_mstSize ),
                         .mask_slvSize            ( mask_slvSize ),
                         .sizeCnt_comb_EQ_SizeMax ( sizeCnt_comb_EQ_SizeMax ),
                         .master_ADDR_masked      ( master_ADDR_masked ),
                         .second_Beat_Addr        ( second_Beat_Addr ),
                         .sizeCnt_comb_P1         ( sizeCnt_comb_P1 ),
                         .slaveSize_one_hot       ( slaveSize_one_hot ),
                         .sizeMax_extend          ( sizeMax_extend )
                         );

defparam byte2bit_inst.DATA_WIDTH_IN = DATA_WIDTH_IN;
defparam byte2bit_inst.DATA_WIDTH_OUT = DATA_WIDTH_OUT;

caxi4interconnect_byte2bit byte2bit_inst( 
                         .shifted_slv_mask_bit( shifted_slv_mask_bit ),
                         .shifted_mst_mask_bit( shifted_mst_mask_bit ),
                         .shifted_slv_mask_byte( shifted_slv_mask_byte ),
                         .shifted_mst_mask_byte( shifted_mst_mask_byte )
);



// File: CmdFifoWriteCtrl.v

defparam rdCmdFifoWriteCtrl.ADDR_WIDTH = ADDR_WIDTH;
defparam rdCmdFifoWriteCtrl.CMD_FIFO_DATA_WIDTH = CMD_FIFO_DATA_WIDTH;
defparam rdCmdFifoWriteCtrl.ID_WIDTH = ID_WIDTH;
defparam rdCmdFifoWriteCtrl.USER_WIDTH = USER_WIDTH;
defparam rdCmdFifoWriteCtrl.DATA_WIDTH_IN = DATA_WIDTH_OUT;
defparam rdCmdFifoWriteCtrl.DATA_WIDTH_OUT = DATA_WIDTH_IN;

caxi4interconnect_DWC_DownConv_CmdFifoWriteCtrl rdCmdFifoWriteCtrl( 
                                     .MASTER_AADDR        ( int_MASTER_ARADDR ),
                                     .MASTER_ABURST       ( int_MASTER_ARBURST ),
                                     .MASTER_ACACHE       ( int_MASTER_ARCACHE ),
                                     .MASTER_AID          ( int_MASTER_ARID  ),
                                     .MASTER_ALOCK        ( int_MASTER_ARLOCK ),
                                     .MASTER_APROT        ( int_MASTER_ARPROT ),
                                     .MASTER_AQOS         ( int_MASTER_ARQOS ),
                                     .MASTER_AREADY       ( int_MASTER_ARREADY ),
                                     .MASTER_AREGION      ( int_MASTER_ARREGION ),
                                     .MASTER_ASIZE        ( int_MASTER_ARSIZE ),
                                     .MASTER_AUSER        ( int_MASTER_ARUSER ),
                                     .MASTER_AVALID       ( int_MASTER_ARVALID ),
                                     .CmdFifoNearlyFull   ( CmdFifoNearlyFull ),
                                     .FifoWe              ( wr_en ),
                                     .CmdFifoWrData       ( CmdFifowrData[CMD_FIFO_DATA_WIDTH-1:0] ),
                                     .brespFifoWrData     ( ),
                                     .brespFifoNearlyFull ( 1'b0 ),
                                     .ACLK                ( ACLK ),
                                     .sysReset            ( sysReset ),
                                     
                                     // .to_boundary_conv            ( to_boundary_conv_pre ),
                                     .to_boundary_master            ( to_boundary_master_pre ),
                                     .mask_addr                   ( mask_addr_pre ),
                                     .ASIZE                       ( ASIZE_pre ),
                                     // .tot_len_M_to_boundary_conv  ( tot_len_M_to_boundary_conv_pre ),
                                     // .to_boundary_conv_M1         ( to_boundary_conv_M1_pre ),
                                     .tot_len                     ( tot_len_pre ),
                                     .max_length_comb             ( max_length_comb_pre ),
                                     .length_comb                 ( length_comb_pre ),
                                     // .tot_len_GT_max_length_comb  ( tot_len_GT_max_length_comb_pre ),
                                     // .tot_len_M_max_length_comb   ( tot_len_M_max_length_comb_pre ),
                                     // .tot_axi_len                 ( tot_axi_len_pre ),
                                     .WrapLogLen_comb             ( wrap_log_len_comb_pre ),
                                     .SizeMax                     ( sizeMax_pre ),
                                     .SameMstSlvSize              ( SameMstSlvSize_pre ),
                                     .sizeCnt_comb                ( sizeCnt_comb_pre ),
                                     .MASTER_AADDR_mux            ( MASTER_ARADDR_mux ),
                                     
                                     .SLAVE_AADDR         ( SLAVE_ARADDR ),
                                     .SLAVE_ABURST        ( SLAVE_ARBURST ),
                                     .SLAVE_ACACHE        ( SLAVE_ARCACHE ),
                                     .SLAVE_AID           ( SLAVE_ARID ),
                                     .SLAVE_ALEN          ( SLAVE_ARLEN ),
                                     .SLAVE_ALOCK         ( SLAVE_ARLOCK ),
                                     .SLAVE_APROT         ( SLAVE_ARPROT ),
                                     .SLAVE_AQOS          ( SLAVE_ARQOS ),
                                     .SLAVE_AREADY        ( SLAVE_ARREADY ),
                                     .SLAVE_AREGION       ( SLAVE_ARREGION[3:0] ),
                                     .SLAVE_ASIZE         ( SLAVE_ASIZE ),
                                     .SLAVE_AUSER         ( SLAVE_AUSER ),
                                     .SLAVE_AVALID        ( SLAVE_ARVALID) 
                                     );


// File: caxi4interconnect_DWC_DownConv_preCalcCmdFifoWrCtrl.v

caxi4interconnect_DWC_DownConv_preCalcCmdFifoWrCtrl #
                                 (
                                .DATA_WIDTH_OUT ( DATA_WIDTH_IN ), // DATA_WIDTH_IN as it is in the read direction
                                .ADDR_WIDTH( ADDR_WIDTH ),
                                .USER_WIDTH( USER_WIDTH ),
                                .ID_WIDTH( ID_WIDTH )

                                )
    DWC_DownConv_preCalcCmdFifoWrCtrl_inst  (
                                .clk( ACLK ),
                                .rst( sysReset ),
                                
                                
                                 .MASTER_ALEN_in    (  MASTER_ARLEN ),
                                 .MASTER_AADDR_in   ( MASTER_ARADDR ),
                                 .MASTER_ABURST_in  ( MASTER_ARBURST ),
                                 .MASTER_ACACHE_in  ( MASTER_ARCACHE ),
                                 .MASTER_AID_in     ( MASTER_ARID ),
                                 .MASTER_ALOCK_in   ( MASTER_ARLOCK ),
                                 .MASTER_APROT_in   ( MASTER_ARPROT ),
                                 .MASTER_AQOS_in    ( MASTER_ARQOS ),
                                 .MASTER_AREGION_in ( MASTER_ARREGION ),
                                 .MASTER_ASIZE_in   ( MASTER_ARSIZE ),
                                 .MASTER_AUSER_in   ( MASTER_ARUSER ),
                                 .MASTER_AVALID_in  ( MASTER_ARVALID ),
                                 
                                 .MASTER_AREADY_in  (  int_MASTER_ARREADY ), // from ctrl

                                 .MASTER_ALEN_out   ( int_MASTER_ARLEN  ),
                                 .MASTER_AADDR_out  ( int_MASTER_ARADDR ),
                                 .MASTER_ABURST_out ( int_MASTER_ARBURST ),
                                 .MASTER_ACACHE_out ( int_MASTER_ARCACHE ),
                                 .MASTER_AID_out    ( int_MASTER_ARID ),
                                 .MASTER_ALOCK_out  ( int_MASTER_ARLOCK ),
                                 .MASTER_APROT_out  ( int_MASTER_ARPROT ),
                                 .MASTER_AQOS_out   ( int_MASTER_ARQOS ),
                                 .MASTER_AREGION_out( int_MASTER_ARREGION ),
                                 .MASTER_ASIZE_out  ( int_MASTER_ARSIZE ),
                                 .MASTER_AUSER_out  ( int_MASTER_ARUSER ),
                                 .MASTER_AVALID_out ( int_MASTER_ARVALID ),
                                 .MASTER_AADDR_mux_pre ( MASTER_ARADDR_mux ),

                                 .MASTER_AREADY_out ( MASTER_ARREADY ), // to source

                                 
                                // .to_boundary_conv_pre           ( to_boundary_conv_pre ),
                                .to_boundary_master_pre           ( to_boundary_master_pre ),
                                .mask_addr_pre                  ( mask_addr_pre ),
                                .ASIZE_pre                      ( ASIZE_pre ),
                                // .tot_len_M_to_boundary_conv_pre ( tot_len_M_to_boundary_conv_pre ),
                                // .to_boundary_conv_M1_pre        ( to_boundary_conv_M1_pre ),
                                .tot_len_pre                    ( tot_len_pre ),
                                .max_length_comb_pre            ( max_length_comb_pre ),
                                .length_comb_pre                ( length_comb_pre ),
                                // .tot_len_GT_max_length_comb_pre ( tot_len_GT_max_length_comb_pre ),
                                // .tot_len_M_max_length_comb_pre  ( tot_len_M_max_length_comb_pre ),
                                // .tot_axi_len_pre                ( tot_axi_len_pre ),
                                .WrapLogLen_comb_pre            ( wrap_log_len_comb_pre ),
                                .sizeMax_pre                    ( sizeMax_pre ),
                                .SameMstSlvSize_pre             ( SameMstSlvSize_pre ),
                                .sizeCnt_comb_pre               ( sizeCnt_comb_pre )                                
                                );

                                     
/// Components_End <<<---


endmodule
