// *********************************************************************/ 
// Copyright (c) 2015 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File: register_bank.v
//     
// Description: optional register bank for timing optimization (XT only) 
//
// Notes:
// - add DFI_BG_P[N]
// - add DFI_ACT_N_P[N]
// *********************************************************************/ 

module register_bank # (
  parameter PIPELINE = 0,
  parameter IOG_DQS_LANES = 9
)(
  input                               SCLK                      ,
  input                               RESET_N                   ,
  input                               DFI_RESET_N_P0            ,
  input                               DFI_RESET_N_P1            ,
  input                               DFI_RESET_N_P2            ,
  input                               DFI_RESET_N_P3            ,
  input  [19:0]                       DFI_ADDRESS_P0            ,
  input  [19:0]                       DFI_ADDRESS_P1            ,
  input  [19:0]                       DFI_ADDRESS_P2            ,
  input  [19:0]                       DFI_ADDRESS_P3            ,
  input  [3:0]                        DFI_BANK_P0               ,
  input  [3:0]                        DFI_BANK_P1               ,
  input  [3:0]                        DFI_BANK_P2               ,
  input  [3:0]                        DFI_BANK_P3               ,
  input                               DFI_CS_N_P0               ,
  input                               DFI_CS_N_P1               ,
  input                               DFI_CS_N_P2               ,
  input                               DFI_CS_N_P3               ,
  input                               DFI_ODT_P0                ,
  input                               DFI_ODT_P1                ,
  input                               DFI_ODT_P2                ,
  input                               DFI_ODT_P3                ,
  input                               DFI_CKE_P0                ,
  input                               DFI_CKE_P1                ,
  input                               DFI_CKE_P2                ,
  input                               DFI_CKE_P3                ,
  input                               DFI_RAS_N_P0              ,
  input                               DFI_RAS_N_P1              ,
  input                               DFI_RAS_N_P2              ,
  input                               DFI_RAS_N_P3              ,
  input                               DFI_CAS_N_P0              ,
  input                               DFI_CAS_N_P1              ,
  input                               DFI_CAS_N_P2              ,
  input                               DFI_CAS_N_P3              ,
  input                               DFI_WE_N_P0               ,
  input                               DFI_WE_N_P1               ,
  input                               DFI_WE_N_P2               ,
  input                               DFI_WE_N_P3               ,
  input                               DFI_ACT_N_P0              ,
  input                               DFI_ACT_N_P1              ,
  input                               DFI_ACT_N_P2              ,
  input                               DFI_ACT_N_P3              ,
  input  [1:0]                        DFI_BG_P0                 ,
  input  [1:0]                        DFI_BG_P1                 ,
  input  [1:0]                        DFI_BG_P2                 ,
  input  [1:0]                        DFI_BG_P3                 ,
  input                               DFI_WRDATA_EN_P0          ,
  input                               DFI_WRDATA_EN_P1          ,
  input                               DFI_WRDATA_EN_P2          ,
  input                               DFI_WRDATA_EN_P3          ,
  input  [IOG_DQS_LANES*64-1:0]       IOG_DQ_TXDATA_IN          ,
  input  [IOG_DQS_LANES*8-1:0]        IOG_DM_TXDATA_IN          ,
  input                               DFI_WRDATA_CS_0_N_P0      ,
  input                               DFI_WRDATA_CS_0_N_P1      ,
  input                               DFI_WRDATA_CS_0_N_P2      ,
  input                               DFI_WRDATA_CS_0_N_P3      ,
  input                               DFI_WRDATA_CS_1_N_P0      ,
  input                               DFI_WRDATA_CS_1_N_P1      ,
  input                               DFI_WRDATA_CS_1_N_P2      ,
  input                               DFI_WRDATA_CS_1_N_P3      ,
  output reg                          DFI_RESET_N_P0_OUT        ,
  output reg                          DFI_RESET_N_P1_OUT        ,
  output reg                          DFI_RESET_N_P2_OUT        ,
  output reg                          DFI_RESET_N_P3_OUT        ,
  output reg [19:0]                   DFI_ADDRESS_P0_OUT        ,  
  output reg [19:0]                   DFI_ADDRESS_P1_OUT        ,  
  output reg [19:0]                   DFI_ADDRESS_P2_OUT        ,  
  output reg [19:0]                   DFI_ADDRESS_P3_OUT        ,  
  output reg [3:0]                    DFI_BANK_P0_OUT           ,  
  output reg [3:0]                    DFI_BANK_P1_OUT           ,  
  output reg [3:0]                    DFI_BANK_P2_OUT           ,  
  output reg [3:0]                    DFI_BANK_P3_OUT           ,  
  output reg                          DFI_CS_N_P0_OUT           ,  
  output reg                          DFI_CS_N_P1_OUT           ,  
  output reg                          DFI_CS_N_P2_OUT           ,  
  output reg                          DFI_CS_N_P3_OUT           ,  
  output reg                          DFI_ODT_P0_OUT            ,  
  output reg                          DFI_ODT_P1_OUT            ,  
  output reg                          DFI_ODT_P2_OUT            ,  
  output reg                          DFI_ODT_P3_OUT            ,  
  output reg                          DFI_CKE_P0_OUT            ,  
  output reg                          DFI_CKE_P1_OUT            ,  
  output reg                          DFI_CKE_P2_OUT            ,  
  output reg                          DFI_CKE_P3_OUT            ,  
  output reg                          DFI_RAS_N_P0_OUT          ,  
  output reg                          DFI_RAS_N_P1_OUT          ,  
  output reg                          DFI_RAS_N_P2_OUT          ,  
  output reg                          DFI_RAS_N_P3_OUT          ,  
  output reg                          DFI_CAS_N_P0_OUT          ,  
  output reg                          DFI_CAS_N_P1_OUT          ,  
  output reg                          DFI_CAS_N_P2_OUT          ,  
  output reg                          DFI_CAS_N_P3_OUT          ,  
  output reg                          DFI_WE_N_P0_OUT           ,  
  output reg                          DFI_WE_N_P1_OUT           ,  
  output reg                          DFI_WE_N_P2_OUT           ,  
  output reg                          DFI_WE_N_P3_OUT           ,
  output reg                          DFI_ACT_N_P0_OUT          ,  
  output reg                          DFI_ACT_N_P1_OUT          ,  
  output reg                          DFI_ACT_N_P2_OUT          ,  
  output reg                          DFI_ACT_N_P3_OUT          ,
  output reg [1:0]                    DFI_BG_P0_OUT             ,  
  output reg [1:0]                    DFI_BG_P1_OUT             ,  
  output reg [1:0]                    DFI_BG_P2_OUT             ,  
  output reg [1:0]                    DFI_BG_P3_OUT             ,  
  output reg                          DFI_WRDATA_EN_P0_OUT      ,  
  output reg                          DFI_WRDATA_EN_P1_OUT      ,  
  output reg                          DFI_WRDATA_EN_P2_OUT      ,  
  output reg                          DFI_WRDATA_EN_P3_OUT      ,
  output reg [IOG_DQS_LANES*64-1:0]   IOG_DQ_TXDATA_OUT         ,
  output reg [IOG_DQS_LANES*8-1:0]    IOG_DM_TXDATA_OUT         ,
  output reg                          DFI_WRDATA_CS_0_N_P0_OUT  ,  
  output reg                          DFI_WRDATA_CS_0_N_P1_OUT  ,  
  output reg                          DFI_WRDATA_CS_0_N_P2_OUT  ,  
  output reg                          DFI_WRDATA_CS_0_N_P3_OUT  ,   
  output reg                          DFI_WRDATA_CS_1_N_P0_OUT  ,  
  output reg                          DFI_WRDATA_CS_1_N_P1_OUT  ,  
  output reg                          DFI_WRDATA_CS_1_N_P2_OUT  ,  
  output reg                          DFI_WRDATA_CS_1_N_P3_OUT  ,   
  input                               DFI_RDDATA_EN_P0          ,
  input                               DFI_RDDATA_EN_P1          ,
  input                               DFI_RDDATA_EN_P2          ,
  input                               DFI_RDDATA_EN_P3          ,
  input  [IOG_DQS_LANES-1:0]          IOG_RDDATA_VALID          ,
  input  [IOG_DQS_LANES*64-1:0]       IOG_RDDATA                ,
  input                               DFI_RDDATA_CS_0_N_P0      ,
  input                               DFI_RDDATA_CS_0_N_P1      ,
  input                               DFI_RDDATA_CS_0_N_P2      ,
  input                               DFI_RDDATA_CS_0_N_P3      ,
  input                               DFI_RDDATA_CS_1_N_P0      ,
  input                               DFI_RDDATA_CS_1_N_P1      ,
  input                               DFI_RDDATA_CS_1_N_P2      ,
  input                               DFI_RDDATA_CS_1_N_P3      ,
  input  [IOG_DQS_LANES-1:0]          BURST_DETECT              ,
  output reg                          DFI_RDDATA_EN_P0_OUT      ,
  output reg                          DFI_RDDATA_EN_P1_OUT      ,
  output reg                          DFI_RDDATA_EN_P2_OUT      ,
  output reg                          DFI_RDDATA_EN_P3_OUT      ,
  output reg [IOG_DQS_LANES-1:0]      IOG_RDDATA_VALID_OUT      ,
  output reg [IOG_DQS_LANES*64-1:0]   IOG_RDDATA_OUT            ,
  output reg                          DFI_RDDATA_CS_0_N_P0_OUT  ,
  output reg                          DFI_RDDATA_CS_0_N_P1_OUT  ,
  output reg                          DFI_RDDATA_CS_0_N_P2_OUT  ,
  output reg                          DFI_RDDATA_CS_0_N_P3_OUT  ,
  output reg                          DFI_RDDATA_CS_1_N_P0_OUT  ,
  output reg                          DFI_RDDATA_CS_1_N_P1_OUT  ,
  output reg                          DFI_RDDATA_CS_1_N_P2_OUT  ,
  output reg                          DFI_RDDATA_CS_1_N_P3_OUT  ,
  output reg [IOG_DQS_LANES-1:0]      BURST_DETECT_OUT

);

  generate
  if (PIPELINE==1)
  begin : pipelined_generate_block
    always @ (posedge SCLK or negedge RESET_N)
    begin : register_bases
      if (RESET_N == 1'b0)
      begin
        DFI_RESET_N_P0_OUT            <= 0;
        DFI_RESET_N_P1_OUT            <= 0;
        DFI_RESET_N_P2_OUT            <= 0;
        DFI_RESET_N_P3_OUT            <= 0;
        DFI_ADDRESS_P0_OUT            <= 0;
        DFI_ADDRESS_P1_OUT            <= 0;
        DFI_ADDRESS_P2_OUT            <= 0;
        DFI_ADDRESS_P3_OUT            <= 0;
        DFI_BANK_P0_OUT               <= 0;
        DFI_BANK_P1_OUT               <= 0;
        DFI_BANK_P2_OUT               <= 0;
        DFI_BANK_P3_OUT               <= 0;
        DFI_CS_N_P0_OUT               <= 0;
        DFI_CS_N_P1_OUT               <= 0;
        DFI_CS_N_P2_OUT               <= 0;
        DFI_CS_N_P3_OUT               <= 0;
        DFI_ODT_P0_OUT                <= 0;
        DFI_ODT_P1_OUT                <= 0;
        DFI_ODT_P2_OUT                <= 0;
        DFI_ODT_P3_OUT                <= 0;
        DFI_CKE_P0_OUT                <= 0;
        DFI_CKE_P1_OUT                <= 0;
        DFI_CKE_P2_OUT                <= 0;
        DFI_CKE_P3_OUT                <= 0;
        DFI_RAS_N_P0_OUT              <= 0;
        DFI_RAS_N_P1_OUT              <= 0;
        DFI_RAS_N_P2_OUT              <= 0;
        DFI_RAS_N_P3_OUT              <= 0;
        DFI_CAS_N_P0_OUT              <= 0;
        DFI_CAS_N_P1_OUT              <= 0;
        DFI_CAS_N_P2_OUT              <= 0;
        DFI_CAS_N_P3_OUT              <= 0;
        DFI_WE_N_P0_OUT               <= 0;
        DFI_WE_N_P1_OUT               <= 0;
        DFI_WE_N_P2_OUT               <= 0;
        DFI_WE_N_P3_OUT               <= 0;
        DFI_ACT_N_P0_OUT              <= 0;
        DFI_ACT_N_P1_OUT              <= 0;
        DFI_ACT_N_P2_OUT              <= 0;
        DFI_ACT_N_P3_OUT              <= 0;
        DFI_WRDATA_EN_P0_OUT          <= 0;
        DFI_WRDATA_EN_P1_OUT          <= 0;
        DFI_WRDATA_EN_P2_OUT          <= 0;
        DFI_WRDATA_EN_P3_OUT          <= 0;
        IOG_DQ_TXDATA_OUT             <= 0;
        IOG_DM_TXDATA_OUT             <= 0;
        DFI_WRDATA_CS_0_N_P0_OUT      <= 0;
        DFI_WRDATA_CS_0_N_P1_OUT      <= 0;
        DFI_WRDATA_CS_0_N_P2_OUT      <= 0;
        DFI_WRDATA_CS_0_N_P3_OUT      <= 0;
        DFI_WRDATA_CS_1_N_P0_OUT      <= 0;
        DFI_WRDATA_CS_1_N_P1_OUT      <= 0;
        DFI_WRDATA_CS_1_N_P2_OUT      <= 0;
        DFI_WRDATA_CS_1_N_P3_OUT      <= 0;
        DFI_RDDATA_EN_P0_OUT          <= 0;
        DFI_RDDATA_EN_P1_OUT          <= 0;
        DFI_RDDATA_EN_P2_OUT          <= 0;
        DFI_RDDATA_EN_P3_OUT          <= 0;
        IOG_RDDATA_VALID_OUT          <= 0;
        IOG_RDDATA_OUT                <= 0;
        DFI_RDDATA_CS_0_N_P0_OUT      <= 0;
        DFI_RDDATA_CS_0_N_P1_OUT      <= 0;
        DFI_RDDATA_CS_0_N_P2_OUT      <= 0;
        DFI_RDDATA_CS_0_N_P3_OUT      <= 0;
        DFI_RDDATA_CS_1_N_P0_OUT      <= 0;
        DFI_RDDATA_CS_1_N_P1_OUT      <= 0;
        DFI_RDDATA_CS_1_N_P2_OUT      <= 0;
        DFI_RDDATA_CS_1_N_P3_OUT      <= 0;
        BURST_DETECT_OUT              <= 0;
        DFI_BG_P0_OUT                 <= 0;
        DFI_BG_P1_OUT                 <= 0;
        DFI_BG_P2_OUT                 <= 0;
        DFI_BG_P3_OUT                 <= 0;
        
      end
      else
      begin
        DFI_RESET_N_P0_OUT            <= DFI_RESET_N_P0          ;
        DFI_RESET_N_P1_OUT            <= DFI_RESET_N_P1          ;
        DFI_RESET_N_P2_OUT            <= DFI_RESET_N_P2          ;
        DFI_RESET_N_P3_OUT            <= DFI_RESET_N_P3          ;
        DFI_ADDRESS_P0_OUT            <= DFI_ADDRESS_P0          ;
        DFI_ADDRESS_P1_OUT            <= DFI_ADDRESS_P1          ;
        DFI_ADDRESS_P2_OUT            <= DFI_ADDRESS_P2          ;
        DFI_ADDRESS_P3_OUT            <= DFI_ADDRESS_P3          ;
        DFI_BANK_P0_OUT               <= DFI_BANK_P0             ;
        DFI_BANK_P1_OUT               <= DFI_BANK_P1             ;
        DFI_BANK_P2_OUT               <= DFI_BANK_P2             ;
        DFI_BANK_P3_OUT               <= DFI_BANK_P3             ;
        DFI_CS_N_P0_OUT               <= DFI_CS_N_P0             ;
        DFI_CS_N_P1_OUT               <= DFI_CS_N_P1             ;
        DFI_CS_N_P2_OUT               <= DFI_CS_N_P2             ;
        DFI_CS_N_P3_OUT               <= DFI_CS_N_P3             ;
        DFI_ODT_P0_OUT                <= DFI_ODT_P0              ;
        DFI_ODT_P1_OUT                <= DFI_ODT_P1              ;
        DFI_ODT_P2_OUT                <= DFI_ODT_P2              ;
        DFI_ODT_P3_OUT                <= DFI_ODT_P3              ;
        DFI_CKE_P0_OUT                <= DFI_CKE_P0              ;
        DFI_CKE_P1_OUT                <= DFI_CKE_P1              ;
        DFI_CKE_P2_OUT                <= DFI_CKE_P2              ;
        DFI_CKE_P3_OUT                <= DFI_CKE_P3              ;
        DFI_RAS_N_P0_OUT              <= DFI_RAS_N_P0            ;
        DFI_RAS_N_P1_OUT              <= DFI_RAS_N_P1            ;
        DFI_RAS_N_P2_OUT              <= DFI_RAS_N_P2            ;
        DFI_RAS_N_P3_OUT              <= DFI_RAS_N_P3            ;
        DFI_CAS_N_P0_OUT              <= DFI_CAS_N_P0            ;
        DFI_CAS_N_P1_OUT              <= DFI_CAS_N_P1            ;
        DFI_CAS_N_P2_OUT              <= DFI_CAS_N_P2            ;
        DFI_CAS_N_P3_OUT              <= DFI_CAS_N_P3            ;
        DFI_WE_N_P0_OUT               <= DFI_WE_N_P0             ;
        DFI_WE_N_P1_OUT               <= DFI_WE_N_P1             ;
        DFI_WE_N_P2_OUT               <= DFI_WE_N_P2             ;
        DFI_WE_N_P3_OUT               <= DFI_WE_N_P3             ;
        DFI_ACT_N_P0_OUT              <= DFI_ACT_N_P0            ;
        DFI_ACT_N_P1_OUT              <= DFI_ACT_N_P1            ;
        DFI_ACT_N_P2_OUT              <= DFI_ACT_N_P2            ;
        DFI_ACT_N_P3_OUT              <= DFI_ACT_N_P3            ;
        DFI_WRDATA_EN_P0_OUT          <= DFI_WRDATA_EN_P0        ;
        DFI_WRDATA_EN_P1_OUT          <= DFI_WRDATA_EN_P1        ;
        DFI_WRDATA_EN_P2_OUT          <= DFI_WRDATA_EN_P2        ;
        DFI_WRDATA_EN_P3_OUT          <= DFI_WRDATA_EN_P3        ;
        IOG_DQ_TXDATA_OUT             <= IOG_DQ_TXDATA_IN        ;
        IOG_DM_TXDATA_OUT             <= IOG_DM_TXDATA_IN        ;
        DFI_WRDATA_CS_0_N_P0_OUT      <= DFI_WRDATA_CS_0_N_P0    ;
        DFI_WRDATA_CS_0_N_P1_OUT      <= DFI_WRDATA_CS_0_N_P1    ;
        DFI_WRDATA_CS_0_N_P2_OUT      <= DFI_WRDATA_CS_0_N_P2    ;
        DFI_WRDATA_CS_0_N_P3_OUT      <= DFI_WRDATA_CS_0_N_P3    ;
        DFI_WRDATA_CS_1_N_P0_OUT      <= DFI_WRDATA_CS_1_N_P0    ;
        DFI_WRDATA_CS_1_N_P1_OUT      <= DFI_WRDATA_CS_1_N_P1    ;
        DFI_WRDATA_CS_1_N_P2_OUT      <= DFI_WRDATA_CS_1_N_P2    ;
        DFI_WRDATA_CS_1_N_P3_OUT      <= DFI_WRDATA_CS_1_N_P3    ;
        DFI_RDDATA_EN_P0_OUT          <= DFI_RDDATA_EN_P0        ;
        DFI_RDDATA_EN_P1_OUT          <= DFI_RDDATA_EN_P1        ;
        DFI_RDDATA_EN_P2_OUT          <= DFI_RDDATA_EN_P2        ;
        DFI_RDDATA_EN_P3_OUT          <= DFI_RDDATA_EN_P3        ;
        IOG_RDDATA_VALID_OUT          <= IOG_RDDATA_VALID        ;
        IOG_RDDATA_OUT                <= IOG_RDDATA              ;
        DFI_RDDATA_CS_0_N_P0_OUT      <= DFI_RDDATA_CS_0_N_P0    ;
        DFI_RDDATA_CS_0_N_P1_OUT      <= DFI_RDDATA_CS_0_N_P1    ;
        DFI_RDDATA_CS_0_N_P2_OUT      <= DFI_RDDATA_CS_0_N_P2    ;
        DFI_RDDATA_CS_0_N_P3_OUT      <= DFI_RDDATA_CS_0_N_P3    ;
        DFI_RDDATA_CS_1_N_P0_OUT      <= DFI_RDDATA_CS_1_N_P0    ;
        DFI_RDDATA_CS_1_N_P1_OUT      <= DFI_RDDATA_CS_1_N_P1    ;
        DFI_RDDATA_CS_1_N_P2_OUT      <= DFI_RDDATA_CS_1_N_P2    ;
        DFI_RDDATA_CS_1_N_P3_OUT      <= DFI_RDDATA_CS_1_N_P3    ;
        BURST_DETECT_OUT              <= BURST_DETECT            ;
        DFI_BG_P0_OUT                 <= DFI_BG_P0               ;
        DFI_BG_P1_OUT                 <= DFI_BG_P1               ;
        DFI_BG_P2_OUT                 <= DFI_BG_P2               ;
        DFI_BG_P3_OUT                 <= DFI_BG_P3               ;
        
      end
    end
  end
  else
  begin
    always @ (*)
    begin : passthrough_bus
      DFI_RESET_N_P0_OUT            = DFI_RESET_N_P0          ;
      DFI_RESET_N_P1_OUT            = DFI_RESET_N_P1          ;
      DFI_RESET_N_P2_OUT            = DFI_RESET_N_P2          ;
      DFI_RESET_N_P3_OUT            = DFI_RESET_N_P3          ;
      DFI_ADDRESS_P0_OUT            = DFI_ADDRESS_P0          ;
      DFI_ADDRESS_P1_OUT            = DFI_ADDRESS_P1          ;
      DFI_ADDRESS_P2_OUT            = DFI_ADDRESS_P2          ;
      DFI_ADDRESS_P3_OUT            = DFI_ADDRESS_P3          ;
      DFI_BANK_P0_OUT               = DFI_BANK_P0             ;
      DFI_BANK_P1_OUT               = DFI_BANK_P1             ;
      DFI_BANK_P2_OUT               = DFI_BANK_P2             ;
      DFI_BANK_P3_OUT               = DFI_BANK_P3             ;
      DFI_CS_N_P0_OUT               = DFI_CS_N_P0             ;
      DFI_CS_N_P1_OUT               = DFI_CS_N_P1             ;
      DFI_CS_N_P2_OUT               = DFI_CS_N_P2             ;
      DFI_CS_N_P3_OUT               = DFI_CS_N_P3             ;
      DFI_ODT_P0_OUT                = DFI_ODT_P0              ;
      DFI_ODT_P1_OUT                = DFI_ODT_P1              ;
      DFI_ODT_P2_OUT                = DFI_ODT_P2              ;
      DFI_ODT_P3_OUT                = DFI_ODT_P3              ;
      DFI_CKE_P0_OUT                = DFI_CKE_P0              ;
      DFI_CKE_P1_OUT                = DFI_CKE_P1              ;
      DFI_CKE_P2_OUT                = DFI_CKE_P2              ;
      DFI_CKE_P3_OUT                = DFI_CKE_P3              ;
      DFI_RAS_N_P0_OUT              = DFI_RAS_N_P0            ;
      DFI_RAS_N_P1_OUT              = DFI_RAS_N_P1            ;
      DFI_RAS_N_P2_OUT              = DFI_RAS_N_P2            ;
      DFI_RAS_N_P3_OUT              = DFI_RAS_N_P3            ;
      DFI_CAS_N_P0_OUT              = DFI_CAS_N_P0            ;
      DFI_CAS_N_P1_OUT              = DFI_CAS_N_P1            ;
      DFI_CAS_N_P2_OUT              = DFI_CAS_N_P2            ;
      DFI_CAS_N_P3_OUT              = DFI_CAS_N_P3            ;
      DFI_WE_N_P0_OUT               = DFI_WE_N_P0             ;
      DFI_WE_N_P1_OUT               = DFI_WE_N_P1             ;
      DFI_WE_N_P2_OUT               = DFI_WE_N_P2             ;
      DFI_WE_N_P3_OUT               = DFI_WE_N_P3             ;
      DFI_ACT_N_P0_OUT              = DFI_ACT_N_P0            ;
      DFI_ACT_N_P1_OUT              = DFI_ACT_N_P1            ;
      DFI_ACT_N_P2_OUT              = DFI_ACT_N_P2            ;
      DFI_ACT_N_P3_OUT              = DFI_ACT_N_P3            ;
      DFI_WRDATA_EN_P0_OUT          = DFI_WRDATA_EN_P0        ;
      DFI_WRDATA_EN_P1_OUT          = DFI_WRDATA_EN_P1        ;
      DFI_WRDATA_EN_P2_OUT          = DFI_WRDATA_EN_P2        ;
      DFI_WRDATA_EN_P3_OUT          = DFI_WRDATA_EN_P3        ;
      IOG_DQ_TXDATA_OUT             = IOG_DQ_TXDATA_IN        ;
      IOG_DM_TXDATA_OUT             = IOG_DM_TXDATA_IN        ;
      DFI_WRDATA_CS_0_N_P0_OUT      = DFI_WRDATA_CS_0_N_P0    ;
      DFI_WRDATA_CS_0_N_P1_OUT      = DFI_WRDATA_CS_0_N_P1    ;
      DFI_WRDATA_CS_0_N_P2_OUT      = DFI_WRDATA_CS_0_N_P2    ;
      DFI_WRDATA_CS_0_N_P3_OUT      = DFI_WRDATA_CS_0_N_P3    ;
      DFI_WRDATA_CS_1_N_P0_OUT      = DFI_WRDATA_CS_1_N_P0    ;
      DFI_WRDATA_CS_1_N_P1_OUT      = DFI_WRDATA_CS_1_N_P1    ;
      DFI_WRDATA_CS_1_N_P2_OUT      = DFI_WRDATA_CS_1_N_P2    ;
      DFI_WRDATA_CS_1_N_P3_OUT      = DFI_WRDATA_CS_1_N_P3    ;
      DFI_RDDATA_EN_P0_OUT          = DFI_RDDATA_EN_P0        ;
      DFI_RDDATA_EN_P1_OUT          = DFI_RDDATA_EN_P1        ;
      DFI_RDDATA_EN_P2_OUT          = DFI_RDDATA_EN_P2        ;
      DFI_RDDATA_EN_P3_OUT          = DFI_RDDATA_EN_P3        ;
      IOG_RDDATA_VALID_OUT          = IOG_RDDATA_VALID        ;
      IOG_RDDATA_OUT                = IOG_RDDATA              ;
      DFI_RDDATA_CS_0_N_P0_OUT      = DFI_RDDATA_CS_0_N_P0    ;
      DFI_RDDATA_CS_0_N_P1_OUT      = DFI_RDDATA_CS_0_N_P1    ;
      DFI_RDDATA_CS_0_N_P2_OUT      = DFI_RDDATA_CS_0_N_P2    ;
      DFI_RDDATA_CS_0_N_P3_OUT      = DFI_RDDATA_CS_0_N_P3    ;
      DFI_RDDATA_CS_1_N_P0_OUT      = DFI_RDDATA_CS_1_N_P0    ;
      DFI_RDDATA_CS_1_N_P1_OUT      = DFI_RDDATA_CS_1_N_P1    ;
      DFI_RDDATA_CS_1_N_P2_OUT      = DFI_RDDATA_CS_1_N_P2    ;
      DFI_RDDATA_CS_1_N_P3_OUT      = DFI_RDDATA_CS_1_N_P3    ;
      BURST_DETECT_OUT              = BURST_DETECT            ;
      DFI_BG_P0_OUT                 = DFI_BG_P0               ;
      DFI_BG_P1_OUT                 = DFI_BG_P1               ;
      DFI_BG_P2_OUT                 = DFI_BG_P2               ;
      DFI_BG_P3_OUT                 = DFI_BG_P3               ;
    end
  end
  endgenerate

endmodule