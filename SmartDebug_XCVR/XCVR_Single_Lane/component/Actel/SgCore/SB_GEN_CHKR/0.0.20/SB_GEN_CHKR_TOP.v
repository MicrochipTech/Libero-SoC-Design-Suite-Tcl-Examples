///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: SB_PRBS_GEN.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF200TS_ES> <Package::Fully Bonded Package>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 


module SB_GEN_CHKR(
    // Global
    SYS_RESET_N,
	//Lane 0
    LANE0_TX_CLK,
    LANE0_TX_CLK_STABLE,
    LANE0_PRBS_ERR_GEN,
    LANE0_TX_PRBS_SEL,
    LANE0_RX_PRBS_SEL,
    LANE0_RX_READY,
    LANE0_RX_VAL,
    LANE0_RX_DATA,
    LANE0_RX_DATA_EN,
    LANE0_RX_CLK,
    LANE0_TX_DATA,
    LANE0_TX_DATA_EN,
    LANE0_PRBS_ERR_CNT,
    LANE0_PRBS_ERR_CNT_CLR,
	LANE0_RX_SLIP,
	LANE0_RX_ALIGN,
	//Lane 1
    LANE1_TX_CLK,
    LANE1_TX_CLK_STABLE,
    LANE1_PRBS_ERR_GEN,
    LANE1_TX_PRBS_SEL,
    LANE1_RX_PRBS_SEL,
    LANE1_RX_READY,
    LANE1_RX_VAL,
    LANE1_RX_DATA,
    LANE1_RX_DATA_EN,
    LANE1_RX_CLK,
    LANE1_TX_DATA,
    LANE1_TX_DATA_EN,
    LANE1_PRBS_ERR_CNT,
    LANE1_PRBS_ERR_CNT_CLR,
	LANE1_RX_SLIP,
	LANE1_RX_ALIGN,
	//Lane 2
    LANE2_TX_CLK,
    LANE2_TX_CLK_STABLE,
    LANE2_PRBS_ERR_GEN,
    LANE2_TX_PRBS_SEL,
    LANE2_RX_PRBS_SEL,
    LANE2_RX_READY,
    LANE2_RX_VAL,
    LANE2_RX_DATA,
    LANE2_RX_DATA_EN,
    LANE2_RX_CLK,
    LANE2_TX_DATA,
    LANE2_TX_DATA_EN,
    LANE2_PRBS_ERR_CNT,
    LANE2_PRBS_ERR_CNT_CLR,
	LANE2_RX_SLIP,
	LANE2_RX_ALIGN,
	//Lane 3
    LANE3_TX_CLK,
    LANE3_TX_CLK_STABLE,
    LANE3_PRBS_ERR_GEN,
    LANE3_TX_PRBS_SEL,
    LANE3_RX_PRBS_SEL,
    LANE3_RX_READY,
    LANE3_RX_VAL,
    LANE3_RX_DATA,
    LANE3_RX_DATA_EN,
    LANE3_RX_CLK,
    LANE3_TX_DATA,
    LANE3_TX_DATA_EN,
    LANE3_PRBS_ERR_CNT,
    LANE3_PRBS_ERR_CNT_CLR,
	LANE3_RX_SLIP,
	LANE3_RX_ALIGN
);

//--------------------------------------------------------------------
// Parameter 
//--------------------------------------------------------------------
parameter FAMILY = 26;
parameter DATA_WIDTH = 80;
parameter NUM_OF_LANES = 1;
parameter PATTERN_PRBS7 = 1;
parameter PATTERN_PRBS9 = 1;
parameter PATTERN_PRBS23 = 1;
parameter PATTERN_PRBS31 = 1;
parameter ERR_CHK_DELAY = 32;
parameter PRBS_INIT_VAL = 97;         // Any value except for zero
//--------------------------------------------------------------------
// Local Parameter
//--------------------------------------------------------------------
localparam ERR_CNT_WIDTH = 32;

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        SYS_RESET_N;

//--------------------------------------------------------------------
// GEN Input
//--------------------------------------------------------------------
input        LANE0_TX_CLK;
input        LANE1_TX_CLK;
input        LANE2_TX_CLK;
input        LANE3_TX_CLK;
input        LANE0_TX_CLK_STABLE;
input        LANE1_TX_CLK_STABLE;
input        LANE2_TX_CLK_STABLE;
input        LANE3_TX_CLK_STABLE;
input        LANE0_PRBS_ERR_GEN;
input        LANE1_PRBS_ERR_GEN;
input        LANE2_PRBS_ERR_GEN;
input        LANE3_PRBS_ERR_GEN;
input        LANE0_TX_DATA_EN;
input        LANE1_TX_DATA_EN;
input        LANE2_TX_DATA_EN;
input        LANE3_TX_DATA_EN;
input [1:0]  LANE0_TX_PRBS_SEL;      // 0=PRBS7, 1=PRBS9, 2=PRBS23 & 3=PRBS31
input [1:0]  LANE1_TX_PRBS_SEL;
input [1:0]  LANE2_TX_PRBS_SEL;
input [1:0]  LANE3_TX_PRBS_SEL;

//--------------------------------------------------------------------
// CHKR Input
//--------------------------------------------------------------------
input                  LANE0_RX_CLK;
input                  LANE1_RX_CLK;
input                  LANE2_RX_CLK;
input                  LANE3_RX_CLK;
input                  LANE0_RX_READY;
input                  LANE1_RX_READY;
input                  LANE2_RX_READY;
input                  LANE3_RX_READY;
input                  LANE0_RX_VAL;
input                  LANE1_RX_VAL;
input                  LANE2_RX_VAL;
input                  LANE3_RX_VAL;
input                  LANE0_PRBS_ERR_CNT_CLR;
input                  LANE1_PRBS_ERR_CNT_CLR;
input                  LANE2_PRBS_ERR_CNT_CLR;
input                  LANE3_PRBS_ERR_CNT_CLR;
input                  LANE0_RX_DATA_EN;
input                  LANE1_RX_DATA_EN;
input                  LANE2_RX_DATA_EN;
input                  LANE3_RX_DATA_EN;
input [DATA_WIDTH-1:0] LANE0_RX_DATA;
input [DATA_WIDTH-1:0] LANE1_RX_DATA;
input [DATA_WIDTH-1:0] LANE2_RX_DATA;
input [DATA_WIDTH-1:0] LANE3_RX_DATA;
input [1:0]            LANE0_RX_PRBS_SEL;      // 0=PRBS7, 1=PRBS23 & 2=PRBS31
input [1:0]            LANE1_RX_PRBS_SEL;
input [1:0]            LANE2_RX_PRBS_SEL;
input [1:0]            LANE3_RX_PRBS_SEL;

//--------------------------------------------------------------------
// GEN Output 
//--------------------------------------------------------------------
output [DATA_WIDTH-1:0] LANE0_TX_DATA;
output [DATA_WIDTH-1:0] LANE1_TX_DATA;
output [DATA_WIDTH-1:0] LANE2_TX_DATA;
output [DATA_WIDTH-1:0] LANE3_TX_DATA;

//--------------------------------------------------------------------
// CHKR Output 
//--------------------------------------------------------------------
output [ERR_CNT_WIDTH-1:0] LANE0_PRBS_ERR_CNT;
output [ERR_CNT_WIDTH-1:0] LANE1_PRBS_ERR_CNT;
output [ERR_CNT_WIDTH-1:0] LANE2_PRBS_ERR_CNT;
output [ERR_CNT_WIDTH-1:0] LANE3_PRBS_ERR_CNT;
output LANE0_RX_SLIP;
output LANE1_RX_SLIP;
output LANE2_RX_SLIP;
output LANE3_RX_SLIP;
output LANE0_RX_ALIGN;
output LANE1_RX_ALIGN;
output LANE2_RX_ALIGN;
output LANE3_RX_ALIGN;
//--------------------------------------------------------------------
// Wire 
//--------------------------------------------------------------------
wire [DATA_WIDTH-1:0] LANE0_TX_DATA;
wire [DATA_WIDTH-1:0] LANE1_TX_DATA;
wire [DATA_WIDTH-1:0] LANE2_TX_DATA;
wire [DATA_WIDTH-1:0] LANE3_TX_DATA;
wire                  LANE0_PRBS_ERR_DET;
wire                  LANE1_PRBS_ERR_DET;
wire                  LANE2_PRBS_ERR_DET;
wire                  LANE3_PRBS_ERR_DET;
wire LANE0_RX_SLIP;
wire LANE1_RX_SLIP;
wire LANE2_RX_SLIP;
wire LANE3_RX_SLIP;

assign  LANE0_RX_SLIP = 1'b0;
assign  LANE1_RX_SLIP = 1'b0;
assign  LANE2_RX_SLIP = 1'b0;
assign  LANE3_RX_SLIP = 1'b0;
//--------------------------------------------------------------------
// GEN Logic
//--------------------------------------------------------------------
SB_PRBS_GEN #( .DATA_WIDTH(DATA_WIDTH),
               .PRBS_INIT_VAL(PRBS_INIT_VAL),
			   .PATTERN_PRBS7(PATTERN_PRBS7),
			   .PATTERN_PRBS9(PATTERN_PRBS9),
			   .PATTERN_PRBS23(PATTERN_PRBS23),
			   .PATTERN_PRBS31(PATTERN_PRBS31)
              ) SB_PRBS_GEN_0 ( .SYS_RESET_N   (SYS_RESET_N),
                                .TX_CLK        (LANE0_TX_CLK),
                                .TX_CLK_STABLE (LANE0_TX_CLK_STABLE),
                                .PRBS_ERR_GEN  (LANE0_PRBS_ERR_GEN),
                                .PRBS_SEL      (LANE0_TX_PRBS_SEL),
                                .TX_DATA       (LANE0_TX_DATA),
                                .TX_DATA_EN    (LANE0_TX_DATA_EN),
							    .RX_ALIGN      (LANE0_RX_ALIGN)
);
SB_PRBS_GEN #( .DATA_WIDTH(DATA_WIDTH),
               .PRBS_INIT_VAL(PRBS_INIT_VAL),
			   .PATTERN_PRBS7(PATTERN_PRBS7),
			   .PATTERN_PRBS9(PATTERN_PRBS9),
			   .PATTERN_PRBS23(PATTERN_PRBS23),
			   .PATTERN_PRBS31(PATTERN_PRBS31)
              ) SB_PRBS_GEN_1 ( .SYS_RESET_N   (SYS_RESET_N),
                                .TX_CLK        (LANE1_TX_CLK),
                                .TX_CLK_STABLE (LANE1_TX_CLK_STABLE),
                                .PRBS_ERR_GEN  (LANE1_PRBS_ERR_GEN),
                                .PRBS_SEL      (LANE1_TX_PRBS_SEL),
                                .TX_DATA       (LANE1_TX_DATA),
                                .TX_DATA_EN    (LANE1_TX_DATA_EN),
							    .RX_ALIGN      (LANE1_RX_ALIGN)
);
SB_PRBS_GEN #( .DATA_WIDTH(DATA_WIDTH),
               .PRBS_INIT_VAL(PRBS_INIT_VAL),
			   .PATTERN_PRBS7(PATTERN_PRBS7),
			   .PATTERN_PRBS9(PATTERN_PRBS9),
			   .PATTERN_PRBS23(PATTERN_PRBS23),
			   .PATTERN_PRBS31(PATTERN_PRBS31)
              ) SB_PRBS_GEN_2 ( .SYS_RESET_N   (SYS_RESET_N),
                                .TX_CLK        (LANE2_TX_CLK),
                                .TX_CLK_STABLE (LANE2_TX_CLK_STABLE),
                                .PRBS_ERR_GEN  (LANE2_PRBS_ERR_GEN),
                                .PRBS_SEL      (LANE2_TX_PRBS_SEL),
                                .TX_DATA       (LANE2_TX_DATA),
                                .TX_DATA_EN    (LANE2_TX_DATA_EN),
							    .RX_ALIGN      (LANE2_RX_ALIGN)
);
SB_PRBS_GEN #( .DATA_WIDTH(DATA_WIDTH),
               .PRBS_INIT_VAL(PRBS_INIT_VAL),
			   .PATTERN_PRBS7(PATTERN_PRBS7),
			   .PATTERN_PRBS9(PATTERN_PRBS9),
			   .PATTERN_PRBS23(PATTERN_PRBS23),
			   .PATTERN_PRBS31(PATTERN_PRBS31)
              ) SB_PRBS_GEN_3 ( .SYS_RESET_N   (SYS_RESET_N),
                                .TX_CLK        (LANE3_TX_CLK),
                                .TX_CLK_STABLE (LANE3_TX_CLK_STABLE),
                                .PRBS_ERR_GEN  (LANE3_PRBS_ERR_GEN),
                                .PRBS_SEL      (LANE3_TX_PRBS_SEL),
                                .TX_DATA       (LANE3_TX_DATA),
                                .TX_DATA_EN    (LANE3_TX_DATA_EN),
							    .RX_ALIGN      (LANE3_RX_ALIGN)
);

//--------------------------------------------------------------------
// CHKR Logic
//--------------------------------------------------------------------
SB_PRBS_CHKR #( .DATA_WIDTH(DATA_WIDTH),
                .ERR_CNT_WIDTH(ERR_CNT_WIDTH),
			    .PATTERN_PRBS7(PATTERN_PRBS7),
			    .PATTERN_PRBS9(PATTERN_PRBS9),
			    .PATTERN_PRBS23(PATTERN_PRBS23),
			    .PATTERN_PRBS31(PATTERN_PRBS31),
				.ERR_CHK_DELAY(ERR_CHK_DELAY)
               ) SB_PRBS_CHKR_0 ( .SYS_RESET_N      (SYS_RESET_N),
                                  .RX_READY         (LANE0_RX_READY),
                                  .RX_VAL           (LANE0_RX_VAL),
                                  .RX_DATA          (LANE0_RX_DATA),
                                  .RX_DATA_EN       (LANE0_RX_DATA_EN),
                                  .RX_CLK           (LANE0_RX_CLK),
                                  .PRBS_ERR_DET     (LANE0_PRBS_ERR_DET),
                                  .PRBS_SEL         (LANE0_RX_PRBS_SEL),
                                  .PRBS_CLR_ERR_CNT (LANE0_PRBS_ERR_CNT_CLR),
                                  .PRBS_ERR_CNT     (LANE0_PRBS_ERR_CNT),
								  //.RX_SLIP          (LANE0_RX_SLIP),
								  .RX_ALIGN         (LANE0_RX_ALIGN)
);
SB_PRBS_CHKR #( .DATA_WIDTH(DATA_WIDTH),
                .ERR_CNT_WIDTH(ERR_CNT_WIDTH),
			    .PATTERN_PRBS7(PATTERN_PRBS7),
			    .PATTERN_PRBS9(PATTERN_PRBS9),
			    .PATTERN_PRBS23(PATTERN_PRBS23),
			    .PATTERN_PRBS31(PATTERN_PRBS31),
				.ERR_CHK_DELAY(ERR_CHK_DELAY)
               ) SB_PRBS_CHKR_1 ( .SYS_RESET_N      (SYS_RESET_N),
                                  .RX_READY         (LANE1_RX_READY),
                                  .RX_VAL           (LANE1_RX_VAL),
                                  .RX_DATA          (LANE1_RX_DATA),
                                  .RX_DATA_EN       (LANE1_RX_DATA_EN),
                                  .RX_CLK           (LANE1_RX_CLK),
                                  .PRBS_ERR_DET     (LANE1_PRBS_ERR_DET),
                                  .PRBS_SEL         (LANE1_RX_PRBS_SEL),
                                  .PRBS_CLR_ERR_CNT (LANE1_PRBS_ERR_CNT_CLR),
                                  .PRBS_ERR_CNT     (LANE1_PRBS_ERR_CNT),
								  //.RX_SLIP          (LANE1_RX_SLIP),
								  .RX_ALIGN         (LANE1_RX_ALIGN)
);
SB_PRBS_CHKR #( .DATA_WIDTH(DATA_WIDTH),
                .ERR_CNT_WIDTH(ERR_CNT_WIDTH),
			    .PATTERN_PRBS7(PATTERN_PRBS7),
			    .PATTERN_PRBS9(PATTERN_PRBS9),
			    .PATTERN_PRBS23(PATTERN_PRBS23),
			    .PATTERN_PRBS31(PATTERN_PRBS31),
				.ERR_CHK_DELAY(ERR_CHK_DELAY)
               ) SB_PRBS_CHKR_2 ( .SYS_RESET_N      (SYS_RESET_N),
                                  .RX_READY         (LANE2_RX_READY),
                                  .RX_VAL           (LANE2_RX_VAL),
                                  .RX_DATA          (LANE2_RX_DATA),
                                  .RX_DATA_EN       (LANE2_RX_DATA_EN),
                                  .RX_CLK           (LANE2_RX_CLK),
                                  .PRBS_ERR_DET     (LANE2_PRBS_ERR_DET),
                                  .PRBS_SEL         (LANE2_RX_PRBS_SEL),
                                  .PRBS_CLR_ERR_CNT (LANE2_PRBS_ERR_CNT_CLR),
                                  .PRBS_ERR_CNT     (LANE2_PRBS_ERR_CNT),
								  //.RX_SLIP          (LANE2_RX_SLIP),
								  .RX_ALIGN         (LANE2_RX_ALIGN)
);
SB_PRBS_CHKR #( .DATA_WIDTH(DATA_WIDTH),
                .ERR_CNT_WIDTH(ERR_CNT_WIDTH),
			    .PATTERN_PRBS7(PATTERN_PRBS7),
			    .PATTERN_PRBS9(PATTERN_PRBS9),
			    .PATTERN_PRBS23(PATTERN_PRBS23),
			    .PATTERN_PRBS31(PATTERN_PRBS31),
				.ERR_CHK_DELAY(ERR_CHK_DELAY)
               ) SB_PRBS_CHKR_3 ( .SYS_RESET_N      (SYS_RESET_N),
                                  .RX_READY         (LANE3_RX_READY),
                                  .RX_VAL           (LANE3_RX_VAL),
                                  .RX_DATA          (LANE3_RX_DATA),
                                  .RX_DATA_EN       (LANE3_RX_DATA_EN),
                                  .RX_CLK           (LANE3_RX_CLK),
                                  .PRBS_ERR_DET     (LANE3_PRBS_ERR_DET),
                                  .PRBS_SEL         (LANE3_RX_PRBS_SEL),
                                  .PRBS_CLR_ERR_CNT (LANE3_PRBS_ERR_CNT_CLR),
                                  .PRBS_ERR_CNT     (LANE3_PRBS_ERR_CNT),
								  //.RX_SLIP          (LANE3_RX_SLIP),
								  .RX_ALIGN         (LANE3_RX_ALIGN)
);


endmodule



