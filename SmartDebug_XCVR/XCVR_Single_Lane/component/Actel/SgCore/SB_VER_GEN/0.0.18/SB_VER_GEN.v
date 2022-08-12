 ///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: SB_VER_GEN.v
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
`timescale 1ns/ 100ps

module SB_VER_GEN( LANE0_TX_CLK,
                   LANE1_TX_CLK,
                   LANE2_TX_CLK,
                   LANE3_TX_CLK,
                   LANE0_RX_CLK,
                   LANE1_RX_CLK,
                   LANE2_RX_CLK,
                   LANE3_RX_CLK,
                   SYS_RESET_N,
                   LANE0_TX_DATA_EN,
                   LANE1_TX_DATA_EN,
                   LANE2_TX_DATA_EN,
                   LANE3_TX_DATA_EN,
                   LANE0_TX_PRBS_SEL,
                   LANE1_TX_PRBS_SEL,
                   LANE2_TX_PRBS_SEL,
                   LANE3_TX_PRBS_SEL,
                   LANE0_PRBS_ERR_GEN,
                   LANE1_PRBS_ERR_GEN,
                   LANE2_PRBS_ERR_GEN,
                   LANE3_PRBS_ERR_GEN,
                   LANE0_RX_PRBS_SEL, 
                   LANE1_RX_PRBS_SEL, 
                   LANE2_RX_PRBS_SEL, 
                   LANE3_RX_PRBS_SEL, 
                   LANE0_RX_DATA_EN, 
                   LANE1_RX_DATA_EN, 
                   LANE2_RX_DATA_EN, 
                   LANE3_RX_DATA_EN, 
                   LANE0_PRBS_ERR_CNT_CLR,
                   LANE1_PRBS_ERR_CNT_CLR,
                   LANE2_PRBS_ERR_CNT_CLR,
                   LANE3_PRBS_ERR_CNT_CLR,
                   LANE0_PRBS_ERR_CNT,
                   LANE1_PRBS_ERR_CNT,
                   LANE2_PRBS_ERR_CNT,
                   LANE3_PRBS_ERR_CNT,
				   LANE0_RX_ALIGN,
				   LANE1_RX_ALIGN,
				   LANE2_RX_ALIGN,
				   LANE3_RX_ALIGN
);

parameter        FAMILY = 26;
parameter [1:0]  UI_NUMBER_OF_LANES = 1;
parameter [13:0] UI_DATA_RATE = 5000;
parameter [3:0]  UI_TX_CLK_DIV_FACTOR = 1;
parameter        UI_CDR_REFERENCE_CLK_SOURCE = 1; // 0=Dedicated, 1=Fabric
parameter        UI_PATTERN_PRBS7 = 0;            // 0=Disabled, 1=Enabled
parameter        UI_PATTERN_PRBS9 = 0;            // 0=Disabled, 1=Enabled
parameter        UI_PATTERN_PRBS23 = 0;           // 0=Disabled, 1=Enabled
parameter        UI_PATTERN_PRBS31 = 0;           // 0=Disabled, 1=Enabled
parameter [4:0]  UI_CDR_REFERENCE_CLK_FREQ = 6;   // 0=25.00, 1=31.25, 2=50.00, 3=62.50, 4=75.00, 5=100.00, 6=125.00, 7=150.00, 8=156.25, 9=312.50
parameter [7:0]  MAJOR = 8'd2;
parameter [7:0]  MINOR = 8'd0;

input        SYS_RESET_N;
input        LANE0_TX_CLK;
input        LANE1_TX_CLK;
input        LANE2_TX_CLK;
input        LANE3_TX_CLK;
input        LANE0_RX_CLK;
input        LANE1_RX_CLK;
input        LANE2_RX_CLK;
input        LANE3_RX_CLK;
input [31:0] LANE0_PRBS_ERR_CNT;
input [31:0] LANE1_PRBS_ERR_CNT;
input [31:0] LANE2_PRBS_ERR_CNT;
input [31:0] LANE3_PRBS_ERR_CNT;
input        LANE0_RX_ALIGN;
input        LANE1_RX_ALIGN;
input        LANE2_RX_ALIGN;
input        LANE3_RX_ALIGN;
//LANE OUT
output       LANE0_TX_DATA_EN;
output       LANE1_TX_DATA_EN;
output       LANE2_TX_DATA_EN;
output       LANE3_TX_DATA_EN;
output [1:0] LANE0_TX_PRBS_SEL;
output [1:0] LANE1_TX_PRBS_SEL;
output [1:0] LANE2_TX_PRBS_SEL;
output [1:0] LANE3_TX_PRBS_SEL;
output       LANE0_PRBS_ERR_GEN;
output       LANE1_PRBS_ERR_GEN;
output       LANE2_PRBS_ERR_GEN;
output       LANE3_PRBS_ERR_GEN;
output [1:0] LANE0_RX_PRBS_SEL; 
output [1:0] LANE1_RX_PRBS_SEL; 
output [1:0] LANE2_RX_PRBS_SEL; 
output [1:0] LANE3_RX_PRBS_SEL; 
output       LANE0_RX_DATA_EN; 
output       LANE1_RX_DATA_EN; 
output       LANE2_RX_DATA_EN; 
output       LANE3_RX_DATA_EN; 
output       LANE0_PRBS_ERR_CNT_CLR;
output       LANE1_PRBS_ERR_CNT_CLR;
output       LANE2_PRBS_ERR_CNT_CLR;
output       LANE3_PRBS_ERR_CNT_CLR;

//LANE OUT REG
reg       LANE0_TX_DATA_EN;
reg       LANE1_TX_DATA_EN;
reg       LANE2_TX_DATA_EN;
reg       LANE3_TX_DATA_EN;
reg [1:0] LANE0_TX_PRBS_SEL;
reg [1:0] LANE1_TX_PRBS_SEL;
reg [1:0] LANE2_TX_PRBS_SEL;
reg [1:0] LANE3_TX_PRBS_SEL;
//reg       LANE0_PRBS_ERR_GEN;
//reg       LANE1_PRBS_ERR_GEN;
//reg       LANE2_PRBS_ERR_GEN;
//reg       LANE3_PRBS_ERR_GEN;
wire       LANE0_PRBS_ERR_GEN;
wire       LANE1_PRBS_ERR_GEN;
wire       LANE2_PRBS_ERR_GEN;
wire       LANE3_PRBS_ERR_GEN;
reg [1:0] LANE0_RX_PRBS_SEL; 
reg [1:0] LANE1_RX_PRBS_SEL; 
reg [1:0] LANE2_RX_PRBS_SEL; 
reg [1:0] LANE3_RX_PRBS_SEL; 
reg       LANE0_RX_DATA_EN; 
reg       LANE1_RX_DATA_EN; 
reg       LANE2_RX_DATA_EN; 
reg       LANE3_RX_DATA_EN; 
reg       LANE0_PRBS_ERR_CNT_CLR;
reg       LANE1_PRBS_ERR_CNT_CLR;
reg       LANE2_PRBS_ERR_CNT_CLR;
reg       LANE3_PRBS_ERR_CNT_CLR;

//SLE_DEBUG
reg [15:0] SLE_CPZ_VERSION              /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_CPZ_VERSION" */;
reg [13:0] SLE_DATA_RATE                /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_DATA_RATE" */;
reg [3:0]  SLE_TX_CLK_DIV_FACTOR        /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_CLK_DIV_FACTOR" */;
reg        SLE_CDR_REFERENCE_CLK_SOURCE /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_CDR_REFERENCE_CLK_SOURCE" */;
reg [4:0]  SLE_CDR_REFERENCE_CLK_FREQ   /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_CDR_REFERENCE_CLK_FREQ" */;
reg        SLE_RX_LANE0_ALIGN           /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE0_ALIGN" */;
reg        SLE_RX_LANE1_ALIGN           /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE1_ALIGN" */;
reg        SLE_RX_LANE2_ALIGN           /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE2_ALIGN" */;
reg        SLE_RX_LANE3_ALIGN           /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE3_ALIGN" */;
reg [31:0] SLE_RX_LANE0_ERR_CNT         /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE0_ERR_CNT" */;
reg [31:0] SLE_RX_LANE1_ERR_CNT         /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE1_ERR_CNT" */;
reg [31:0] SLE_RX_LANE2_ERR_CNT         /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE2_ERR_CNT" */;
reg [31:0] SLE_RX_LANE3_ERR_CNT         /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE3_ERR_CNT" */;
reg        SLE_RX_LANE0_ERR_CNT_CLR     /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE0_ERR_CNT_CLR" */;
reg        SLE_RX_LANE1_ERR_CNT_CLR     /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE1_ERR_CNT_CLR" */;
reg        SLE_RX_LANE2_ERR_CNT_CLR     /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE2_ERR_CNT_CLR" */;
reg        SLE_RX_LANE3_ERR_CNT_CLR     /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE3_ERR_CNT_CLR" */;
reg        SLE_RX_LANE0_CHR_EN          /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE0_CHR_EN" */;
reg        SLE_RX_LANE1_CHR_EN          /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE1_CHR_EN" */;
reg        SLE_RX_LANE2_CHR_EN          /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE2_CHR_EN" */;
reg        SLE_RX_LANE3_CHR_EN          /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE3_CHR_EN" */;
reg [1:0]  SLE_RX_LANE0_PATTEN_CHK      /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE0_PATTEN_CHK" */;
reg [1:0]  SLE_RX_LANE1_PATTEN_CHK      /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE1_PATTEN_CHK" */;
reg [1:0]  SLE_RX_LANE2_PATTEN_CHK      /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE2_PATTEN_CHK" */;
reg [1:0]  SLE_RX_LANE3_PATTEN_CHK      /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_RX_LANE3_PATTEN_CHK" */;
//reg        SLE_TX_LANE0_ERR_INJ         /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_LANE0_ERR_INJ" */;
//reg        SLE_TX_LANE1_ERR_INJ         /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_LANE1_ERR_INJ" */;
//reg        SLE_TX_LANE2_ERR_INJ         /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_LANE2_ERR_INJ" */;
//reg        SLE_TX_LANE3_ERR_INJ         /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_LANE3_ERR_INJ" */;
reg [1:0]  SLE_TX_LANE0_PATTEN_GEN      /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_LANE0_PATTEN_GEN" */;
reg [1:0]  SLE_TX_LANE1_PATTEN_GEN      /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_LANE1_PATTEN_GEN" */;
reg [1:0]  SLE_TX_LANE2_PATTEN_GEN      /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_LANE2_PATTEN_GEN" */;
reg [1:0]  SLE_TX_LANE3_PATTEN_GEN      /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_LANE3_PATTEN_GEN" */;
reg        SLE_TX_LANE0_GEN_EN          /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_LANE0_GEN_EN" */;
reg        SLE_TX_LANE1_GEN_EN          /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_LANE1_GEN_EN" */;
reg        SLE_TX_LANE2_GEN_EN          /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_LANE2_GEN_EN" */;
reg        SLE_TX_LANE3_GEN_EN          /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_TX_LANE3_GEN_EN" */;
reg        SLE_PATTERN_PRBS7            /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_PATTERN_PRBS7" */;
reg        SLE_PATTERN_PRBS9            /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_PATTERN_PRBS9" */;
reg        SLE_PATTERN_PRBS23           /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_PATTERN_PRBS23" */;
reg        SLE_PATTERN_PRBS31           /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_PATTERN_PRBS31" */;
reg [1:0]  SLE_NUMBER_OF_LANES          /* synthesis syn_sle_debug = "CoreSmartBERT/SLE_NUMBER_OF_LANES" */;

//RX
reg RX_LANE0_DEN_ST;
reg RX_LANE1_DEN_ST;
reg RX_LANE2_DEN_ST;
reg RX_LANE3_DEN_ST;
reg RX_LANE0_PC_ST;
reg RX_LANE1_PC_ST;
reg RX_LANE2_PC_ST;
reg RX_LANE3_PC_ST;
reg SLE_RX_LANE0_CHR_EN_hold;
reg SLE_RX_LANE1_CHR_EN_hold;
reg SLE_RX_LANE2_CHR_EN_hold;
reg SLE_RX_LANE3_CHR_EN_hold;
reg [1:0] SLE_RX_LANE0_PATTEN_CHK_hold;
reg [1:0] SLE_RX_LANE1_PATTEN_CHK_hold;
reg [1:0] SLE_RX_LANE2_PATTEN_CHK_hold;
reg [1:0] SLE_RX_LANE3_PATTEN_CHK_hold;

//TX
reg TX_LANE0_GEN_ST;
reg TX_LANE1_GEN_ST;
reg TX_LANE2_GEN_ST;
reg TX_LANE3_GEN_ST;
reg TX_LANE0_PEN_ST;
reg TX_LANE1_PEN_ST;
reg TX_LANE2_PEN_ST;
reg TX_LANE3_PEN_ST;
//reg TX_LANE0_EI_ST;
//reg TX_LANE1_EI_ST;
//reg TX_LANE2_EI_ST;
//reg TX_LANE3_EI_ST;
reg RX_LANE0_CC_ST;
reg RX_LANE1_CC_ST;
reg RX_LANE2_CC_ST;
reg RX_LANE3_CC_ST;
reg SLE_TX_LANE0_GEN_EN_hold;   
reg SLE_TX_LANE1_GEN_EN_hold;    
reg SLE_TX_LANE2_GEN_EN_hold;     
reg SLE_TX_LANE3_GEN_EN_hold;   
reg [1:0] SLE_TX_LANE0_PATTEN_GEN_hold; 
reg [1:0] SLE_TX_LANE1_PATTEN_GEN_hold; 
reg [1:0] SLE_TX_LANE2_PATTEN_GEN_hold; 
reg [1:0] SLE_TX_LANE3_PATTEN_GEN_hold; 
reg SLE_RX_LANE0_ERR_CNT_CLR_hold; 
reg SLE_RX_LANE1_ERR_CNT_CLR_hold;
reg SLE_RX_LANE2_ERR_CNT_CLR_hold;
reg SLE_RX_LANE3_ERR_CNT_CLR_hold;
  
probeWrite probeWrite_LANE0_ERR_GEN( .RESET_N_IN   (SYS_RESET_N),
                                     .CLK_IN       (LANE0_TX_CLK),
                                     .PRBWR_IN     (1'b0),
                                     .GLX_EB       (1'b1),
                                     .Q_OUT		   (LANE0_PRBS_ERR_GEN)										                                              
  );     
probeWrite probeWrite_LANE1_ERR_GEN( .RESET_N_IN   (SYS_RESET_N),
                                     .CLK_IN       (LANE1_TX_CLK),
                                     .PRBWR_IN     (1'b0),
                                     .GLX_EB       (1'b1),
                                     .Q_OUT		   (LANE1_PRBS_ERR_GEN)										                                              
  );     
probeWrite probeWrite_LANE2_ERR_GEN( .RESET_N_IN   (SYS_RESET_N),
                                     .CLK_IN       (LANE2_TX_CLK),
                                     .PRBWR_IN     (1'b0),
                                     .GLX_EB       (1'b1),
                                     .Q_OUT		   (LANE2_PRBS_ERR_GEN)										                                              
  );     
probeWrite probeWrite_LANE3_ERR_GEN( .RESET_N_IN   (SYS_RESET_N),
                                     .CLK_IN       (LANE3_TX_CLK),
                                     .PRBWR_IN     (1'b0),
                                     .GLX_EB       (1'b1),
                                     .Q_OUT		   (LANE3_PRBS_ERR_GEN)										                                              
  );   
  
always @(negedge LANE0_RX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin
        LANE0_RX_DATA_EN             <= 1'b0;
        SLE_RX_LANE0_CHR_EN          <= 1'b0;
        SLE_RX_LANE0_CHR_EN_hold     <= 1'b0;
        SLE_RX_LANE0_PATTEN_CHK      <= 0;
        SLE_RX_LANE0_PATTEN_CHK_hold <= 0;
        LANE0_RX_PRBS_SEL            <= 0;
        RX_LANE0_DEN_ST                     <= 1'b0;
		RX_LANE0_PC_ST                    <= 1'b0;
    end else begin 
      case(RX_LANE0_DEN_ST)
        1'b0: begin
                if(SLE_RX_LANE0_CHR_EN != SLE_RX_LANE0_CHR_EN_hold) begin
                    LANE0_RX_DATA_EN <= SLE_RX_LANE0_CHR_EN;
                    SLE_RX_LANE0_CHR_EN_hold <= SLE_RX_LANE0_CHR_EN;
                    RX_LANE0_DEN_ST <= 1'b1;
                end else begin
                    SLE_RX_LANE0_CHR_EN      <= LANE0_RX_DATA_EN;
                    RX_LANE0_DEN_ST <= 1'b0;
                end 
              end
        1'b1: begin
                RX_LANE0_DEN_ST <= 1'b0;
              end
      endcase
	  
      case(RX_LANE0_PC_ST)
        1'b0: begin
                if(SLE_RX_LANE0_PATTEN_CHK != SLE_RX_LANE0_PATTEN_CHK_hold) begin
                    LANE0_RX_PRBS_SEL <= SLE_RX_LANE0_PATTEN_CHK;
                    SLE_RX_LANE0_PATTEN_CHK_hold <= SLE_RX_LANE0_PATTEN_CHK;
                    RX_LANE0_PC_ST <= 1'b1;
                end else begin
                    SLE_RX_LANE0_PATTEN_CHK      <= LANE0_RX_PRBS_SEL;
                    RX_LANE0_PC_ST <= 1'b0;
                end
              end
        1'b1: begin
                RX_LANE0_PC_ST <= 1'b0;
              end
      endcase
    end
end
always @(negedge LANE1_RX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin
        LANE1_RX_DATA_EN             <= 1'b0;
        SLE_RX_LANE1_CHR_EN          <= 1'b0;
        SLE_RX_LANE1_CHR_EN_hold     <= 1'b0;
        SLE_RX_LANE1_PATTEN_CHK      <= 0;
        SLE_RX_LANE1_PATTEN_CHK_hold <= 0;
        LANE1_RX_PRBS_SEL            <= 0;
        RX_LANE1_DEN_ST                     <= 1'b0;
		RX_LANE1_PC_ST                    <= 1'b0;
    end else begin 
      case(RX_LANE1_DEN_ST)
        1'b0: begin
                if(SLE_RX_LANE1_CHR_EN != SLE_RX_LANE1_CHR_EN_hold) begin
                    LANE1_RX_DATA_EN <= SLE_RX_LANE1_CHR_EN;
                    SLE_RX_LANE1_CHR_EN_hold <= SLE_RX_LANE1_CHR_EN;
                    RX_LANE1_DEN_ST <= 1'b1;
                end else begin
                    SLE_RX_LANE1_CHR_EN      <= LANE1_RX_DATA_EN;
                    RX_LANE1_DEN_ST <= 1'b0;
                end
              end
        1'b1: begin
                RX_LANE1_DEN_ST <= 1'b0;
              end
      endcase
	  
      case(RX_LANE1_PC_ST)
        1'b0: begin
                if(SLE_RX_LANE1_PATTEN_CHK != SLE_RX_LANE1_PATTEN_CHK_hold) begin
                    LANE1_RX_PRBS_SEL <= SLE_RX_LANE1_PATTEN_CHK;
                    SLE_RX_LANE1_PATTEN_CHK_hold <= SLE_RX_LANE1_PATTEN_CHK;
                    RX_LANE1_PC_ST <= 1'b1;
                end else begin
                    SLE_RX_LANE1_PATTEN_CHK      <= LANE1_RX_PRBS_SEL;
                    RX_LANE1_PC_ST <= 1'b0;
                end
              end
        1'b1: begin
                RX_LANE1_PC_ST <= 1'b0;
              end
      endcase
    end
end
always @(negedge LANE2_RX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin
        LANE2_RX_DATA_EN             <= 1'b0;
        SLE_RX_LANE2_CHR_EN          <= 1'b0;
        SLE_RX_LANE2_CHR_EN_hold     <= 1'b0;
        SLE_RX_LANE2_PATTEN_CHK      <= 0;
        SLE_RX_LANE2_PATTEN_CHK_hold <= 0;
        LANE2_RX_PRBS_SEL            <= 0;
        RX_LANE2_DEN_ST                     <= 1'b0;
		RX_LANE2_PC_ST                    <= 1'b0;
    end else begin 
      case(RX_LANE2_DEN_ST)
        1'b0: begin
                if(SLE_RX_LANE2_CHR_EN != SLE_RX_LANE2_CHR_EN_hold) begin
                    LANE2_RX_DATA_EN <= SLE_RX_LANE2_CHR_EN;
                    SLE_RX_LANE2_CHR_EN_hold <= SLE_RX_LANE2_CHR_EN;
                    RX_LANE2_DEN_ST <= 1'b1;
                end else begin
                    SLE_RX_LANE2_CHR_EN      <= LANE2_RX_DATA_EN;
                    RX_LANE2_DEN_ST <= 1'b0;
                end
              end
        1'b1: begin
                RX_LANE2_DEN_ST <= 1'b0;
              end
      endcase
	  
      case(RX_LANE2_PC_ST)
        1'b0: begin
                if(SLE_RX_LANE2_PATTEN_CHK != SLE_RX_LANE2_PATTEN_CHK_hold) begin
                    LANE2_RX_PRBS_SEL <= SLE_RX_LANE2_PATTEN_CHK;
                    SLE_RX_LANE2_PATTEN_CHK_hold <= SLE_RX_LANE2_PATTEN_CHK;
                    RX_LANE2_PC_ST <= 1'b1;
                end else begin
                    SLE_RX_LANE2_PATTEN_CHK      <= LANE2_RX_PRBS_SEL;
                    RX_LANE2_PC_ST <= 1'b0;
                end
              end
        1'b1: begin
                RX_LANE2_PC_ST <= 1'b0;
              end
      endcase
    end
end
always @(negedge LANE3_RX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin
        LANE3_RX_DATA_EN             <= 1'b0;
        SLE_RX_LANE3_CHR_EN          <= 1'b0;
        SLE_RX_LANE3_CHR_EN_hold     <= 1'b0;
        SLE_RX_LANE3_PATTEN_CHK      <= 0;
        SLE_RX_LANE3_PATTEN_CHK_hold <= 0;
        LANE3_RX_PRBS_SEL            <= 0;
        RX_LANE3_DEN_ST                     <= 1'b0;
		RX_LANE3_PC_ST                    <= 1'b0;
    end else begin 
      case(RX_LANE3_DEN_ST)
        1'b0: begin
                if(SLE_RX_LANE3_CHR_EN != SLE_RX_LANE3_CHR_EN_hold) begin
                    LANE3_RX_DATA_EN <= SLE_RX_LANE3_CHR_EN;
                    SLE_RX_LANE3_CHR_EN_hold <= SLE_RX_LANE3_CHR_EN;
                    RX_LANE3_DEN_ST <= 1'b1;
                end else begin
                    SLE_RX_LANE3_CHR_EN      <= LANE3_RX_DATA_EN;
                    RX_LANE3_DEN_ST <= 1'b0;
                end
              end
        1'b1: begin
                RX_LANE3_DEN_ST <= 1'b0;
              end
      endcase
	  
      case(RX_LANE3_PC_ST)
        1'b0: begin
                if(SLE_RX_LANE3_PATTEN_CHK != SLE_RX_LANE3_PATTEN_CHK_hold) begin
                    LANE3_RX_PRBS_SEL <= SLE_RX_LANE3_PATTEN_CHK;
                    SLE_RX_LANE3_PATTEN_CHK_hold <= SLE_RX_LANE3_PATTEN_CHK;
                    RX_LANE3_PC_ST <= 1'b1;
                end else begin
                    SLE_RX_LANE3_PATTEN_CHK      <= LANE3_RX_PRBS_SEL;
                    RX_LANE3_PC_ST <= 1'b0;
                end
              end
        1'b1: begin
                RX_LANE3_PC_ST <= 1'b0;
              end
      endcase
    end
end

always @(negedge LANE0_RX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin
        SLE_RX_LANE0_ALIGN       <= 1'b0;
        SLE_RX_LANE0_ERR_CNT     <= 32'b0;
        SLE_RX_LANE0_ERR_CNT_CLR <= 1'b0;
        SLE_RX_LANE0_ERR_CNT_CLR_hold <= 1'b0;
        RX_LANE0_CC_ST <= 1'b0;
        LANE0_PRBS_ERR_CNT_CLR <= 1'b0;
    end else begin 
        SLE_RX_LANE0_ALIGN           <= LANE0_RX_ALIGN;
        SLE_RX_LANE0_ERR_CNT         <= LANE0_PRBS_ERR_CNT;
		
	   case(RX_LANE0_CC_ST)
		  1'b0: begin
		          if(SLE_RX_LANE0_ERR_CNT_CLR != SLE_RX_LANE0_ERR_CNT_CLR_hold) begin
				      SLE_RX_LANE0_ERR_CNT_CLR_hold <= SLE_RX_LANE0_ERR_CNT_CLR;
					  LANE0_PRBS_ERR_CNT_CLR <= SLE_RX_LANE0_ERR_CNT_CLR;
					  RX_LANE0_CC_ST <= 1'b1;
				  end else begin
					  SLE_RX_LANE0_ERR_CNT_CLR <= LANE0_PRBS_ERR_CNT_CLR;   
					  RX_LANE0_CC_ST <= 1'b0;
				  end
		        end
		  1'b1: begin
				  RX_LANE0_CC_ST <= 1'b0;
		        end
		endcase
    end
  end
  
always @(negedge LANE1_RX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin
        SLE_RX_LANE1_ALIGN       <= 1'b0;
        SLE_RX_LANE1_ERR_CNT     <= 32'b0;
        SLE_RX_LANE1_ERR_CNT_CLR <= 1'b0;
        RX_LANE1_CC_ST <= 1'b0;
        SLE_RX_LANE1_ERR_CNT_CLR_hold <= 1'b0;

        LANE1_PRBS_ERR_CNT_CLR <= 1'b0;
    end else begin 
        SLE_RX_LANE1_ALIGN           <= LANE1_RX_ALIGN;
        SLE_RX_LANE1_ERR_CNT         <= LANE1_PRBS_ERR_CNT;
		
	   case(RX_LANE1_CC_ST)
		  1'b0: begin
		          if(SLE_RX_LANE1_ERR_CNT_CLR != SLE_RX_LANE1_ERR_CNT_CLR_hold) begin
				      SLE_RX_LANE1_ERR_CNT_CLR_hold <= SLE_RX_LANE1_ERR_CNT_CLR;
					  LANE1_PRBS_ERR_CNT_CLR <= SLE_RX_LANE1_ERR_CNT_CLR;
					  RX_LANE1_CC_ST <= 1'b1;
				  end else begin
					  SLE_RX_LANE1_ERR_CNT_CLR <= LANE1_PRBS_ERR_CNT_CLR;   
					  RX_LANE1_CC_ST <= 1'b0;
				  end
		        end
		  1'b1: begin
				  RX_LANE1_CC_ST <= 1'b0;
		        end
		endcase
    end
  end

always @(negedge LANE2_RX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin
        SLE_RX_LANE2_ALIGN       <= 1'b0;
        SLE_RX_LANE2_ERR_CNT     <= 32'b0;
        SLE_RX_LANE2_ERR_CNT_CLR <= 1'b0;
        RX_LANE2_CC_ST <= 1'b0;
        SLE_RX_LANE2_ERR_CNT_CLR_hold <= 1'b0;
        
        LANE2_PRBS_ERR_CNT_CLR <= 1'b0;
    end else begin 
        SLE_RX_LANE2_ALIGN           <= LANE2_RX_ALIGN;
        SLE_RX_LANE2_ERR_CNT         <= LANE2_PRBS_ERR_CNT;
		
	   case(RX_LANE2_CC_ST)
		  1'b0: begin
		          if(SLE_RX_LANE2_ERR_CNT_CLR != SLE_RX_LANE2_ERR_CNT_CLR_hold) begin
				      SLE_RX_LANE2_ERR_CNT_CLR_hold <= SLE_RX_LANE2_ERR_CNT_CLR;
					  LANE2_PRBS_ERR_CNT_CLR <= SLE_RX_LANE2_ERR_CNT_CLR;
					  RX_LANE2_CC_ST <= 1'b1;
				  end else begin
					  SLE_RX_LANE2_ERR_CNT_CLR <= LANE2_PRBS_ERR_CNT_CLR;   
					  RX_LANE2_CC_ST <= 1'b0;
				  end
		        end
		  1'b1: begin
				  RX_LANE2_CC_ST <= 1'b0;
		        end
		endcase
    end
  end

always @(negedge LANE3_RX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin    
        SLE_RX_LANE3_ALIGN       <= 1'b0;
        SLE_RX_LANE3_ERR_CNT     <= 32'b0;
        SLE_RX_LANE3_ERR_CNT_CLR <= 1'b0;
        RX_LANE3_CC_ST <= 1'b0;
        SLE_RX_LANE3_ERR_CNT_CLR_hold <= 1'b0;
        
        LANE3_PRBS_ERR_CNT_CLR <= 1'b0;
    end else begin 
        SLE_RX_LANE3_ALIGN           <= LANE3_RX_ALIGN;
        SLE_RX_LANE3_ERR_CNT         <= LANE3_PRBS_ERR_CNT;
		
	   case(RX_LANE3_CC_ST)
		  1'b0: begin
		          if(SLE_RX_LANE3_ERR_CNT_CLR != SLE_RX_LANE3_ERR_CNT_CLR_hold) begin
				      SLE_RX_LANE3_ERR_CNT_CLR_hold <= SLE_RX_LANE3_ERR_CNT_CLR;
					  LANE3_PRBS_ERR_CNT_CLR <= SLE_RX_LANE3_ERR_CNT_CLR;
					  RX_LANE3_CC_ST <= 1'b1;
				  end else begin
					  SLE_RX_LANE3_ERR_CNT_CLR <= LANE3_PRBS_ERR_CNT_CLR;   
					  RX_LANE3_CC_ST <= 1'b0;
				  end
		        end
		  1'b1: begin
				  RX_LANE3_CC_ST <= 1'b0;
		        end
		endcase
    end
  end

  
always @(negedge LANE0_TX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin
        TX_LANE0_GEN_ST <= 1'b0;
        TX_LANE0_PEN_ST <= 1'b0;
        //TX_LANE0_EI_ST <= 1'b0;
        SLE_TX_LANE0_GEN_EN_hold <= 1'b0;   
        SLE_TX_LANE0_PATTEN_GEN_hold <= 1'b0;
	
        //SLE_TX_LANE0_ERR_INJ     <= 1'b0;
        SLE_TX_LANE0_PATTEN_GEN  <= 0;
        SLE_TX_LANE0_GEN_EN      <= 1'b0; 

        //LANE0_PRBS_ERR_GEN     <= 1'b0;
        LANE0_TX_PRBS_SEL      <= 0;
        LANE0_TX_DATA_EN       <= 1'b0;
    end else begin 
	    case(TX_LANE0_GEN_ST)
		  1'b0: begin
		          if(SLE_TX_LANE0_GEN_EN != SLE_TX_LANE0_GEN_EN_hold) begin
				      SLE_TX_LANE0_GEN_EN_hold <= SLE_TX_LANE0_GEN_EN;
					  LANE0_TX_DATA_EN <= SLE_TX_LANE0_GEN_EN;
					  TX_LANE0_GEN_ST <= 1'b1;
				  end else begin
					  SLE_TX_LANE0_GEN_EN <= LANE0_TX_DATA_EN;   
					  TX_LANE0_GEN_ST <= 1'b0;
				  end
		        end
		  1'b1: begin
				  TX_LANE0_GEN_ST <= 1'b0;
		        end
		endcase
	    case(TX_LANE0_PEN_ST)
		  1'b0: begin
		          if(SLE_TX_LANE0_PATTEN_GEN != SLE_TX_LANE0_PATTEN_GEN_hold) begin
				      SLE_TX_LANE0_PATTEN_GEN_hold <= SLE_TX_LANE0_PATTEN_GEN;
					  LANE0_TX_PRBS_SEL <= SLE_TX_LANE0_PATTEN_GEN;
					  TX_LANE0_PEN_ST <= 1'b1;
				  end else begin
					  SLE_TX_LANE0_PATTEN_GEN <= LANE0_TX_PRBS_SEL;   
					  TX_LANE0_PEN_ST <= 1'b0;
				  end
		        end
		  1'b1: begin
				  TX_LANE0_PEN_ST <= 1'b0;
		        end
		endcase
	    //case(TX_LANE0_EI_ST)
		//  1'b0: begin
		//          if(SLE_TX_LANE0_ERR_INJ != 1'b0) begin
		//		      LANE0_PRBS_ERR_GEN <= SLE_TX_LANE0_ERR_INJ;
		//			  TX_LANE0_EI_ST <= 1'b1;
		//		  end else begin
		//			  SLE_TX_LANE0_ERR_INJ <= LANE0_PRBS_ERR_GEN;   
		//			  TX_LANE0_EI_ST <= 1'b0;
		//		  end
		//        end
		//  1'b1: begin
		//		  TX_LANE0_EI_ST <= 1'b0;
        //          SLE_TX_LANE0_ERR_INJ <= 1'b0;
        //          LANE0_PRBS_ERR_GEN <= 1'b0;
		//        end
		//endcase
    end
  end

always @(negedge LANE1_TX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin
        TX_LANE1_GEN_ST <= 1'b0;
        TX_LANE1_PEN_ST <= 1'b0;
        //TX_LANE1_EI_ST <= 2'b0;
        SLE_TX_LANE1_GEN_EN_hold <= 1'b0;   
        SLE_TX_LANE1_PATTEN_GEN_hold <= 0;
	
        //SLE_TX_LANE1_ERR_INJ     <= 1'b0;
        SLE_TX_LANE1_PATTEN_GEN  <= 0;
        SLE_TX_LANE1_GEN_EN      <= 1'b0; 

        //LANE1_PRBS_ERR_GEN     <= 1'b0;
        LANE1_TX_PRBS_SEL      <= 0;
        LANE1_TX_DATA_EN       <= 1'b0;
    end else begin 
	    case(TX_LANE1_GEN_ST)
		  1'b0: begin
		          if(SLE_TX_LANE1_GEN_EN != SLE_TX_LANE1_GEN_EN_hold) begin
				      SLE_TX_LANE1_GEN_EN_hold <= SLE_TX_LANE1_GEN_EN;
					  LANE1_TX_DATA_EN <= SLE_TX_LANE1_GEN_EN;
					  TX_LANE1_GEN_ST <= 1'b1;
				  end else begin
					  SLE_TX_LANE1_GEN_EN <= LANE1_TX_DATA_EN;   
					  TX_LANE1_GEN_ST <= 1'b0;
				  end
		        end
		  1'b1: begin
				  TX_LANE1_GEN_ST <= 1'b0;
		        end
		endcase
	    case(TX_LANE1_PEN_ST)
		  1'b0: begin
		          if(SLE_TX_LANE1_PATTEN_GEN != SLE_TX_LANE1_PATTEN_GEN_hold) begin
				      SLE_TX_LANE1_PATTEN_GEN_hold <= SLE_TX_LANE1_PATTEN_GEN;
					  LANE1_TX_PRBS_SEL <= SLE_TX_LANE1_PATTEN_GEN;
					  TX_LANE1_PEN_ST <= 1'b1;
				  end else begin
					  SLE_TX_LANE1_PATTEN_GEN <= LANE1_TX_PRBS_SEL;   
					  TX_LANE1_PEN_ST <= 1'b0;
				  end
		        end
		  1'b1: begin
				  TX_LANE1_PEN_ST <= 1'b0;
		        end
		endcase
	    //case(TX_LANE1_EI_ST)
		//  1'b0: begin
		//          if(SLE_TX_LANE1_ERR_INJ != 1'b0) begin
		//		      LANE1_PRBS_ERR_GEN <= SLE_TX_LANE1_ERR_INJ;
		//			  TX_LANE1_EI_ST <= 1'b1;
		//		  end else begin
		//			  SLE_TX_LANE1_ERR_INJ <= LANE1_PRBS_ERR_GEN;   
		//			  TX_LANE1_EI_ST <= 1'b0;
		//		  end
		//        end
		//  1'b1: begin
		//		  TX_LANE1_EI_ST <= 1'b0;
        //          SLE_TX_LANE1_ERR_INJ <= 1'b0;
        //          LANE1_PRBS_ERR_GEN <= 1'b0;
		//        end
		//endcase
    end
  end
  
always @(negedge LANE2_TX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin
        TX_LANE2_GEN_ST <= 1'b0;
        TX_LANE2_PEN_ST <= 1'b0;
        //TX_LANE2_EI_ST <= 2'b0;
        SLE_TX_LANE2_GEN_EN_hold <= 1'b0;   
        SLE_TX_LANE2_PATTEN_GEN_hold <= 0;
	
        //SLE_TX_LANE2_ERR_INJ     <= 1'b0;
        SLE_TX_LANE2_PATTEN_GEN  <= 0;
        SLE_TX_LANE2_GEN_EN      <= 1'b0; 

        //LANE2_PRBS_ERR_GEN     <= 1'b0;
        LANE2_TX_PRBS_SEL      <= 0;
        LANE2_TX_DATA_EN       <= 1'b0;
    end else begin 
	    case(TX_LANE2_GEN_ST)
		  1'b0: begin
		          if(SLE_TX_LANE2_GEN_EN != SLE_TX_LANE2_GEN_EN_hold) begin
				      SLE_TX_LANE2_GEN_EN_hold <= SLE_TX_LANE2_GEN_EN;
					  LANE2_TX_DATA_EN <= SLE_TX_LANE2_GEN_EN;
					  TX_LANE2_GEN_ST <= 1'b1;
				  end else begin
					  SLE_TX_LANE2_GEN_EN <= LANE2_TX_DATA_EN;   
					  TX_LANE2_GEN_ST <= 1'b0;
				  end
		        end
		  1'b1: begin
				  TX_LANE2_GEN_ST <= 1'b0;
		        end
		endcase
	    case(TX_LANE2_PEN_ST)
		  1'b0: begin
		          if(SLE_TX_LANE2_PATTEN_GEN != SLE_TX_LANE2_PATTEN_GEN_hold) begin
				      SLE_TX_LANE2_PATTEN_GEN_hold <= SLE_TX_LANE2_PATTEN_GEN;
					  LANE2_TX_PRBS_SEL <= SLE_TX_LANE2_PATTEN_GEN;
					  TX_LANE2_PEN_ST <= 1'b1;
				  end else begin
					  SLE_TX_LANE2_PATTEN_GEN <= LANE2_TX_PRBS_SEL;   
					  TX_LANE2_PEN_ST <= 1'b0;
				  end
		        end
		  1'b1: begin
				  TX_LANE2_PEN_ST <= 1'b0;
		        end
		endcase
	    //case(TX_LANE2_EI_ST)
		//  1'b0: begin
		//          if(SLE_TX_LANE2_ERR_INJ != 1'b0) begin
		//		      LANE2_PRBS_ERR_GEN <= SLE_TX_LANE2_ERR_INJ;
		//			  TX_LANE2_EI_ST <= 1'b1;
		//		  end else begin
		//			  SLE_TX_LANE2_ERR_INJ <= LANE2_PRBS_ERR_GEN;   
		//			  TX_LANE2_EI_ST <= 1'b0;
		//		  end
		//        end
		//  1'b1: begin
		//		  TX_LANE2_EI_ST <= 1'b0;
        //          SLE_TX_LANE2_ERR_INJ <= 1'b0;
        //          LANE2_PRBS_ERR_GEN <= 1'b0;
		//        end
		//endcase
    end
  end
  
always @(negedge LANE3_TX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin
        TX_LANE3_GEN_ST <= 1'b0;
        TX_LANE3_PEN_ST <= 1'b0;
        //TX_LANE3_EI_ST <= 2'b0;
        SLE_TX_LANE3_GEN_EN_hold <= 1'b0;   
        SLE_TX_LANE3_PATTEN_GEN_hold <= 0;
	
        //SLE_TX_LANE3_ERR_INJ     <= 1'b0;
        SLE_TX_LANE3_PATTEN_GEN  <= 0;
        SLE_TX_LANE3_GEN_EN      <= 1'b0; 

        //LANE3_PRBS_ERR_GEN     <= 1'b0;
        LANE3_TX_PRBS_SEL      <= 0;
        LANE3_TX_DATA_EN       <= 1'b0;
    end else begin 
	    case(TX_LANE3_GEN_ST)
		  1'b0: begin
		          if(SLE_TX_LANE3_GEN_EN != SLE_TX_LANE3_GEN_EN_hold) begin
				      SLE_TX_LANE3_GEN_EN_hold <= SLE_TX_LANE3_GEN_EN;
					  LANE3_TX_DATA_EN <= SLE_TX_LANE3_GEN_EN;
					  TX_LANE3_GEN_ST <= 1'b1;
				  end else begin
					  SLE_TX_LANE3_GEN_EN <= LANE3_TX_DATA_EN;   
					  TX_LANE3_GEN_ST <= 1'b0;
				  end
		        end
		  1'b1: begin
				  TX_LANE3_GEN_ST <= 1'b0;
		        end
		endcase
	    case(TX_LANE3_PEN_ST)
		  1'b0: begin
		          if(SLE_TX_LANE3_PATTEN_GEN != SLE_TX_LANE3_PATTEN_GEN_hold) begin
				      SLE_TX_LANE3_PATTEN_GEN_hold <= SLE_TX_LANE3_PATTEN_GEN;
					  LANE3_TX_PRBS_SEL <= SLE_TX_LANE3_PATTEN_GEN;
					  TX_LANE3_PEN_ST <= 1'b1;
				  end else begin
					  SLE_TX_LANE3_PATTEN_GEN <= LANE3_TX_PRBS_SEL;   
					  TX_LANE3_PEN_ST <= 1'b0;
				  end
		        end
		  1'b1: begin
				  TX_LANE3_PEN_ST <= 1'b0;
		        end
		endcase
	    //case(TX_LANE3_EI_ST)
		//  1'b0: begin
		//          if(SLE_TX_LANE3_ERR_INJ != 1'b0) begin
		//		      LANE3_PRBS_ERR_GEN <= SLE_TX_LANE3_ERR_INJ;
		//			  TX_LANE3_EI_ST <= 1'b1;
		//		  end else begin
		//			  SLE_TX_LANE3_ERR_INJ <= LANE3_PRBS_ERR_GEN;   
		//			  TX_LANE3_EI_ST <= 1'b0;
		//		  end
		//        end
		//  1'b1: begin
		//		  TX_LANE3_EI_ST <= 1'b0;
        //          SLE_TX_LANE3_ERR_INJ <= 1'b0;
        //          LANE3_PRBS_ERR_GEN <= 1'b0;
		//        end
		//endcase
    end
  end
  
  
always @(negedge LANE0_TX_CLK or negedge SYS_RESET_N)
  begin
    if(!SYS_RESET_N) begin
	    SLE_PATTERN_PRBS7  <= 0  ;
	    SLE_PATTERN_PRBS9  <= 0  ;
	    SLE_PATTERN_PRBS23 <= 0 ;
	    SLE_PATTERN_PRBS31 <= 0 ;
		SLE_NUMBER_OF_LANES <= 0;
		
        SLE_CPZ_VERSION              <= 0;
        SLE_DATA_RATE                <= 0;   
        SLE_TX_CLK_DIV_FACTOR        <= 0;
        SLE_CDR_REFERENCE_CLK_SOURCE <= 0;
        SLE_CDR_REFERENCE_CLK_FREQ   <= 0;
    end else begin 
	    SLE_PATTERN_PRBS7  <= UI_PATTERN_PRBS7  ;
	    SLE_PATTERN_PRBS9  <= UI_PATTERN_PRBS9  ;
	    SLE_PATTERN_PRBS23 <= UI_PATTERN_PRBS23 ;
	    SLE_PATTERN_PRBS31 <= UI_PATTERN_PRBS31 ;
		SLE_NUMBER_OF_LANES <= UI_NUMBER_OF_LANES;
		
        SLE_CPZ_VERSION              <= {MAJOR, MINOR};
        SLE_DATA_RATE                <= UI_DATA_RATE;   
        SLE_TX_CLK_DIV_FACTOR        <= UI_TX_CLK_DIV_FACTOR;
        SLE_CDR_REFERENCE_CLK_SOURCE <= UI_CDR_REFERENCE_CLK_SOURCE;
        SLE_CDR_REFERENCE_CLK_FREQ   <= UI_CDR_REFERENCE_CLK_FREQ;
    end
  end
endmodule