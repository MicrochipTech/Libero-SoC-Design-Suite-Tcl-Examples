//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 17 09:01:13 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of PF_DDR3_SS to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component PF_DDR3_SS
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_DDR3:2.4.117} -component_name {PF_DDR3_SS} -params {\
"ADDRESS_MIRROR:false" \
"ADDRESS_ORDERING:CHIP_ROW_BANK_COL" \
"AUTO_SELF_REFRESH:1" \
"AXI_ID_WIDTH:6" \
"AXI_WIDTH:64" \
"BANKSTATMODULES:4" \
"BANK_ADDR_WIDTH:3" \
"BURST_LENGTH:0" \
"CAS_ADDITIVE_LATENCY:0" \
"CAS_LATENCY:9" \
"CAS_WRITE_LATENCY:7" \
"CCC_PLL_CLOCK_MULTIPLIER:6" \
"CLOCK_DDR:666.666" \
"CLOCK_PLL_REFERENCE:111.111" \
"CLOCK_RATE:4" \
"CLOCK_USER:166.6665" \
"COL_ADDR_WIDTH:11" \
"DLL_ENABLE:1" \
"DM_MODE:DM" \
"DQ_DQS_GROUP_SIZE:8" \
"ENABLE_ECC:0" \
"ENABLE_INIT_INTERFACE:false" \
"ENABLE_LOOKAHEAD_PRECHARGE_ACTIVATE:false" \
"ENABLE_PAR_ALERT:false" \
"ENABLE_REINIT:false" \
"ENABLE_TAG_IF:false" \
"ENABLE_USER_ZQCALIB:false" \
"EXPOSE_TRAINING_DEBUG_IF:false" \
"FABRIC_INTERFACE:AXI4" \
"MEMCTRLR_INST_NO:1" \
"MEMORY_FORMAT:COMPONENT" \
"MINIMUM_READ_IDLE:1" \
"ODT_ENABLE_RD_RNK0_ODT0:false" \
"ODT_ENABLE_RD_RNK0_ODT1:false" \
"ODT_ENABLE_RD_RNK1_ODT0:false" \
"ODT_ENABLE_RD_RNK1_ODT1:false" \
"ODT_ENABLE_WR_RNK0_ODT0:true" \
"ODT_ENABLE_WR_RNK0_ODT1:false" \
"ODT_ENABLE_WR_RNK1_ODT0:false" \
"ODT_ENABLE_WR_RNK1_ODT1:true" \
"ODT_RD_OFF_SHIFT:0" \
"ODT_RD_ON_SHIFT:0" \
"ODT_WR_OFF_SHIFT:0" \
"ODT_WR_ON_SHIFT:0" \
"OUTPUT_DRIVE_STRENGTH:RZQ6" \
"PARTIAL_ARRAY_SELF_REFRESH:FULL" \
"PHYONLY:false" \
"PIPELINE:false" \
"QOFF:0" \
"QUEUE_DEPTH:3" \
"RDIMM_LAT:0" \
"READ_BURST_TYPE:SEQUENTIAL" \
"ROW_ADDR_WIDTH:16" \
"RTT_NOM:DISABLED" \
"RTT_WR:OFF" \
"SDRAM_NB_RANKS:1" \
"SDRAM_NUM_CLK_OUTS:1" \
"SDRAM_TYPE:DDR3" \
"SELF_REFRESH_TEMPERATURE:NORMAL" \
"SHIELD_ENABLED:true" \
"SIMULATION_MODE:FAST" \
"TDQS_ENABLE:DISABLE" \
"TIMING_DH:150" \
"TIMING_DQSCK:400" \
"TIMING_DQSQ:200" \
"TIMING_DQSS:0.25" \
"TIMING_DS:75" \
"TIMING_DSH:0.2" \
"TIMING_DSS:0.2" \
"TIMING_FAW:30" \
"TIMING_IH:275" \
"TIMING_INIT:200" \
"TIMING_IS:200" \
"TIMING_MODE:0" \
"TIMING_MRD:4" \
"TIMING_QH:0.38" \
"TIMING_QSH:0.38" \
"TIMING_RAS:36" \
"TIMING_RC:49.5" \
"TIMING_RCD:13.5" \
"TIMING_REFI:7.8" \
"TIMING_RFC:350" \
"TIMING_RP:13.5" \
"TIMING_RRD:7.5" \
"TIMING_RTP:7.5" \
"TIMING_WR:15" \
"TIMING_WTR:5" \
"TURNAROUND_RTR_DIFFRANK:1" \
"TURNAROUND_RTW_DIFFRANK:1" \
"TURNAROUND_WTR_DIFFRANK:1" \
"TURNAROUND_WTW_DIFFRANK:0" \
"USER_POWER_DOWN:false" \
"USER_SELF_REFRESH:false" \
"WIDTH:16" \
"WRITE_LEVELING:ENABLE" \
"WRITE_RECOVERY:5" \
"ZQ_CALIB_PERIOD:200" \
"ZQ_CALIB_TYPE:0" \
"ZQ_CALIB_TYPE_TEMP:0" \
"ZQ_CAL_INIT_TIME:512" \
"ZQ_CAL_L_TIME:256" \
"ZQ_CAL_S_TIME:64" }
# Exporting Component Description of PF_DDR3_SS to TCL done
*/

// PF_DDR3_SS
module PF_DDR3_SS(
    // Inputs
    PLL_REF_CLK,
    SYS_RESET_N,
    axi0_araddr,
    axi0_arburst,
    axi0_arcache,
    axi0_arid,
    axi0_arlen,
    axi0_arlock,
    axi0_arprot,
    axi0_arsize,
    axi0_arvalid,
    axi0_awaddr,
    axi0_awburst,
    axi0_awcache,
    axi0_awid,
    axi0_awlen,
    axi0_awlock,
    axi0_awprot,
    axi0_awsize,
    axi0_awvalid,
    axi0_bready,
    axi0_rready,
    axi0_wdata,
    axi0_wlast,
    axi0_wstrb,
    axi0_wvalid,
    // Outputs
    A,
    BA,
    CAS_N,
    CK0,
    CK0_N,
    CKE,
    CS_N,
    CTRLR_READY,
    DM,
    ODT,
    PLL_LOCK,
    RAS_N,
    RESET_N,
    SHIELD0,
    SHIELD1,
    SYS_CLK,
    WE_N,
    axi0_arready,
    axi0_awready,
    axi0_bid,
    axi0_bresp,
    axi0_bvalid,
    axi0_rdata,
    axi0_rid,
    axi0_rlast,
    axi0_rresp,
    axi0_rvalid,
    axi0_wready,
    // Inouts
    DQ,
    DQS,
    DQS_N
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         PLL_REF_CLK;
input         SYS_RESET_N;
input  [31:0] axi0_araddr;
input  [1:0]  axi0_arburst;
input  [3:0]  axi0_arcache;
input  [5:0]  axi0_arid;
input  [7:0]  axi0_arlen;
input  [1:0]  axi0_arlock;
input  [2:0]  axi0_arprot;
input  [2:0]  axi0_arsize;
input         axi0_arvalid;
input  [31:0] axi0_awaddr;
input  [1:0]  axi0_awburst;
input  [3:0]  axi0_awcache;
input  [5:0]  axi0_awid;
input  [7:0]  axi0_awlen;
input  [1:0]  axi0_awlock;
input  [2:0]  axi0_awprot;
input  [2:0]  axi0_awsize;
input         axi0_awvalid;
input         axi0_bready;
input         axi0_rready;
input  [63:0] axi0_wdata;
input         axi0_wlast;
input  [7:0]  axi0_wstrb;
input         axi0_wvalid;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [15:0] A;
output [2:0]  BA;
output        CAS_N;
output        CK0;
output        CK0_N;
output        CKE;
output        CS_N;
output        CTRLR_READY;
output [1:0]  DM;
output        ODT;
output        PLL_LOCK;
output        RAS_N;
output        RESET_N;
output        SHIELD0;
output        SHIELD1;
output        SYS_CLK;
output        WE_N;
output        axi0_arready;
output        axi0_awready;
output [5:0]  axi0_bid;
output [1:0]  axi0_bresp;
output        axi0_bvalid;
output [63:0] axi0_rdata;
output [5:0]  axi0_rid;
output        axi0_rlast;
output [1:0]  axi0_rresp;
output        axi0_rvalid;
output        axi0_wready;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  [15:0] DQ;
inout  [1:0]  DQS;
inout  [1:0]  DQS_N;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [15:0]  A_net_0;
wire   [31:0]  axi0_araddr;
wire   [1:0]   axi0_arburst;
wire   [3:0]   axi0_arcache;
wire   [5:0]   axi0_arid;
wire   [7:0]   axi0_arlen;
wire   [1:0]   axi0_arlock;
wire   [2:0]   axi0_arprot;
wire           AXI4slave0_ARREADY;
wire   [2:0]   axi0_arsize;
wire           axi0_arvalid;
wire   [31:0]  axi0_awaddr;
wire   [1:0]   axi0_awburst;
wire   [3:0]   axi0_awcache;
wire   [5:0]   axi0_awid;
wire   [7:0]   axi0_awlen;
wire   [1:0]   axi0_awlock;
wire   [2:0]   axi0_awprot;
wire           AXI4slave0_AWREADY;
wire   [2:0]   axi0_awsize;
wire           axi0_awvalid;
wire   [5:0]   AXI4slave0_BID;
wire           axi0_bready;
wire   [1:0]   AXI4slave0_BRESP;
wire           AXI4slave0_BVALID;
wire   [63:0]  AXI4slave0_RDATA;
wire   [5:0]   AXI4slave0_RID;
wire           AXI4slave0_RLAST;
wire           axi0_rready;
wire   [1:0]   AXI4slave0_RRESP;
wire           AXI4slave0_RVALID;
wire   [63:0]  axi0_wdata;
wire           axi0_wlast;
wire           AXI4slave0_WREADY;
wire   [7:0]   axi0_wstrb;
wire           axi0_wvalid;
wire   [2:0]   BA_net_0;
wire           CAS_N_net_0;
wire           CCC_0_OUT0_0;
wire           CCC_0_OUT2_HS_IO_CLK_0;
wire           CCC_0_OUT3_HS_IO_CLK_0;
wire           CK0_net_0;
wire           CK0_N_net_0;
wire           CKE_net_0;
wire           CS_N_net_0;
wire           CTRLR_READY_net_0;
wire           DDRCTRL_0_ctrlr_ready;
wire   [15:0]  DDRCTRL_0_dfi_address_p0_ext15to0;
wire   [15:0]  DDRCTRL_0_dfi_address_p1_ext15to0;
wire   [15:0]  DDRCTRL_0_dfi_address_p2_ext15to0;
wire   [15:0]  DDRCTRL_0_dfi_address_p3_ext15to0;
wire   [2:0]   DDRCTRL_0_dfi_bank_p0_ext2to0;
wire   [2:0]   DDRCTRL_0_dfi_bank_p1_ext2to0;
wire   [2:0]   DDRCTRL_0_dfi_bank_p2_ext2to0;
wire   [2:0]   DDRCTRL_0_dfi_bank_p3_ext2to0;
wire   [19:0]  DDRCTRL_0_dfi_calvl_bg_pattern_ext;
wire           DDRCTRL_0_dfi_calvl_capture_ext;
wire           DDRCTRL_0_dfi_calvl_en_ext;
wire           DDRCTRL_0_dfi_calvl_start_ext;
wire   [19:0]  DDRCTRL_0_dfi_calvl_trn_command_ext;
wire   [0:0]   DDRCTRL_0_dfi_cas_n_p0_ext;
wire   [0:0]   DDRCTRL_0_dfi_cas_n_p1_ext;
wire   [0:0]   DDRCTRL_0_dfi_cas_n_p2_ext;
wire   [0:0]   DDRCTRL_0_dfi_cas_n_p3_ext;
wire   [0:0]   DDRCTRL_0_dfi_cke_p0_ext;
wire   [0:0]   DDRCTRL_0_dfi_cke_p1_ext;
wire   [0:0]   DDRCTRL_0_dfi_cke_p2_ext;
wire   [0:0]   DDRCTRL_0_dfi_cke_p3_ext;
wire   [0:0]   DDRCTRL_0_dfi_cs_n_p0_ext;
wire   [0:0]   DDRCTRL_0_dfi_cs_n_p1_ext;
wire   [0:0]   DDRCTRL_0_dfi_cs_n_p2_ext;
wire   [0:0]   DDRCTRL_0_dfi_cs_n_p3_ext;
wire           DDRCTRL_0_dfi_ctrlupd_req_ext;
wire           DDRCTRL_0_dfi_init_start_ext;
wire   [3:0]   DDRCTRL_0_dfi_lvl_pattern_ext;
wire           DDRCTRL_0_dfi_lvl_periodic_ext;
wire   [0:0]   DDRCTRL_0_dfi_odt_p0_ext;
wire   [0:0]   DDRCTRL_0_dfi_odt_p1_ext;
wire   [0:0]   DDRCTRL_0_dfi_odt_p2_ext;
wire   [0:0]   DDRCTRL_0_dfi_odt_p3_ext;
wire           DDRCTRL_0_dfi_phyupd_ack_ext;
wire   [0:0]   DDRCTRL_0_dfi_ras_n_p0_ext;
wire   [0:0]   DDRCTRL_0_dfi_ras_n_p1_ext;
wire   [0:0]   DDRCTRL_0_dfi_ras_n_p2_ext;
wire   [0:0]   DDRCTRL_0_dfi_ras_n_p3_ext;
wire   [0:0]   DDRCTRL_0_dfi_rddata_cs_n_p0_ext;
wire   [0:0]   DDRCTRL_0_dfi_rddata_cs_n_p1_ext;
wire   [0:0]   DDRCTRL_0_dfi_rddata_cs_n_p2_ext;
wire   [0:0]   DDRCTRL_0_dfi_rddata_cs_n_p3_ext;
wire   [1:0]   DDRCTRL_0_dfi_rddata_en_p0_ext;
wire   [1:0]   DDRCTRL_0_dfi_rddata_en_p1_ext;
wire   [1:0]   DDRCTRL_0_dfi_rddata_en_p2_ext;
wire   [1:0]   DDRCTRL_0_dfi_rddata_en_p3_ext;
wire   [0:0]   DDRCTRL_0_dfi_rdlvl_cs_n_ext;
wire           DDRCTRL_0_dfi_rdlvl_en_ext;
wire           DDRCTRL_0_dfi_rdlvl_gate_en_ext;
wire   [0:0]   DDRCTRL_0_dfi_reset_n_p0_ext;
wire   [0:0]   DDRCTRL_0_dfi_reset_n_p1_ext;
wire   [0:0]   DDRCTRL_0_dfi_reset_n_p2_ext;
wire   [0:0]   DDRCTRL_0_dfi_reset_n_p3_ext;
wire   [0:0]   DDRCTRL_0_dfi_we_n_p0_ext;
wire   [0:0]   DDRCTRL_0_dfi_we_n_p1_ext;
wire   [0:0]   DDRCTRL_0_dfi_we_n_p2_ext;
wire   [0:0]   DDRCTRL_0_dfi_we_n_p3_ext;
wire   [0:0]   DDRCTRL_0_dfi_wrdata_cs_n_p0_ext;
wire   [0:0]   DDRCTRL_0_dfi_wrdata_cs_n_p1_ext;
wire   [0:0]   DDRCTRL_0_dfi_wrdata_cs_n_p2_ext;
wire   [0:0]   DDRCTRL_0_dfi_wrdata_cs_n_p3_ext;
wire   [1:0]   DDRCTRL_0_dfi_wrdata_en_p0_ext;
wire   [1:0]   DDRCTRL_0_dfi_wrdata_en_p1_ext;
wire   [1:0]   DDRCTRL_0_dfi_wrdata_en_p2_ext;
wire   [1:0]   DDRCTRL_0_dfi_wrdata_en_p3_ext;
wire   [3:0]   DDRCTRL_0_dfi_wrdata_mask_p0_ext;
wire   [3:0]   DDRCTRL_0_dfi_wrdata_mask_p1_ext;
wire   [3:0]   DDRCTRL_0_dfi_wrdata_mask_p2_ext;
wire   [3:0]   DDRCTRL_0_dfi_wrdata_mask_p3_ext;
wire   [31:0]  DDRCTRL_0_dfi_wrdata_p0_ext;
wire   [31:0]  DDRCTRL_0_dfi_wrdata_p1_ext;
wire   [31:0]  DDRCTRL_0_dfi_wrdata_p2_ext;
wire   [31:0]  DDRCTRL_0_dfi_wrdata_p3_ext;
wire   [0:0]   DDRCTRL_0_dfi_wrlvl_cs_n_ext;
wire           DDRCTRL_0_dfi_wrlvl_en_ext;
wire           DDRCTRL_0_dfi_wrlvl_strobe_ext;
wire           DDRCTRL_0_ext_cal_l_busy;
wire           DDRCTRL_0_ext_cal_l_d_req;
wire   [127:0] DDRCTRL_0_ext_cal_l_dataout;
wire           DDRCTRL_0_ext_cal_l_r_valid;
wire   [127:0] DDRPHY_BLK_0_CAL_L_DATAIN;
wire   [15:0]  DDRPHY_BLK_0_CAL_L_DM_IN;
wire           DDRPHY_BLK_0_CAL_L_R_REQ;
wire           DDRPHY_BLK_0_CAL_L_W_REQ;
wire           DDRPHY_BLK_0_CAL_SELECT;
wire   [1:0]   DDRPHY_BLK_0_DFI_CALVL_RESP;
wire           DDRPHY_BLK_0_DFI_CALVL_TRAIN_DONE;
wire           DDRPHY_BLK_0_DFI_CTRLUPD_ACK;
wire           DDRPHY_BLK_0_DFI_INIT_COMPLETE;
wire           DDRPHY_BLK_0_DFI_PHYUPD_REQ;
wire   [1:0]   DDRPHY_BLK_0_DFI_PHYUPD_TYPE;
wire   [1:0]   DDRPHY_BLK_0_DFI_RDDATA_VALID_W0;
wire   [1:0]   DDRPHY_BLK_0_DFI_RDDATA_VALID_W1;
wire   [1:0]   DDRPHY_BLK_0_DFI_RDDATA_VALID_W2;
wire   [1:0]   DDRPHY_BLK_0_DFI_RDDATA_VALID_W3;
wire   [31:0]  DDRPHY_BLK_0_DFI_RDDATA_W0;
wire   [31:0]  DDRPHY_BLK_0_DFI_RDDATA_W1;
wire   [31:0]  DDRPHY_BLK_0_DFI_RDDATA_W2;
wire   [31:0]  DDRPHY_BLK_0_DFI_RDDATA_W3;
wire   [1:0]   DDRPHY_BLK_0_DFI_RDLVL_RESP;
wire           DDRPHY_BLK_0_DFI_TRAINING_COMPLETE;
wire   [1:0]   DDRPHY_BLK_0_DFI_WRLVL_RESP;
wire   [0:0]   DDRPHY_BLK_0_LOADPHS_B;
wire           DDRPHY_BLK_0_SYNC_SYS_RST_N;
wire   [0:0]   DDRPHY_BLK_0_VCO_PHSEL_BCLK90_SEL;
wire   [0:0]   DDRPHY_BLK_0_VCO_PHSEL_BCLK_SEL;
wire           DDRPHY_BLK_0_VCO_PHSEL_REFCLK_SEL;
wire   [0:0]   DDRPHY_BLK_0_VCO_PHSEL_ROTATE;
wire   [7:0]   DLL_0_DLL_CODE;
wire   [1:0]   DM_net_0;
wire   [15:0]  DQ;
wire   [1:0]   DQS;
wire   [1:0]   DQS_N;
wire           ODT_net_0;
wire   [9:0]   PF_DDR_CFG_INIT_0_ADDR_WAIT_COUNT;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_addr_mirror;
wire   [1:0]   PF_DDR_CFG_INIT_0_cfg_al_mode;
wire           PF_DDR_CFG_INIT_0_cfg_async_odt;
wire           PF_DDR_CFG_INIT_0_cfg_auto_ref_en;
wire           PF_DDR_CFG_INIT_0_cfg_auto_sr;
wire           PF_DDR_CFG_INIT_0_cfg_auto_zq_cal_en;
wire   [35:0]  PF_DDR_CFG_INIT_0_cfg_bankaddr_map;
wire           PF_DDR_CFG_INIT_0_cfg_bg_interleave;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs023to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs123to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs223to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs323to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs423to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs523to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs623to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs723to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs823to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs923to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1023to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1123to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1223to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1323to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1423to0;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1523to0;
wire   [1:0]   PF_DDR_CFG_INIT_0_cfg_bl;
wire   [1:0]   PF_DDR_CFG_INIT_0_cfg_bl_mode;
wire           PF_DDR_CFG_INIT_0_cfg_bt;
wire           PF_DDR_CFG_INIT_0_cfg_burst_rw_refresh_holdoff;
wire           PF_DDR_CFG_INIT_0_cfg_ca_parity_err_status;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_ca_parity_latency;
wire           PF_DDR_CFG_INIT_0_cfg_ca_parity_persist_err;
wire   [21:0]  PF_DDR_CFG_INIT_0_cfg_cal_read_period;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_ccd_l;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_ccd_s;
wire   [23:0]  PF_DDR_CFG_INIT_0_cfg_chipaddr_map;
wire   [17:0]  PF_DDR_CFG_INIT_0_cfg_cidaddr_map;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_cksre;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_cksrx;
wire   [5:0]   PF_DDR_CFG_INIT_0_cfg_cl;
wire   [95:0]  PF_DDR_CFG_INIT_0_cfg_coladdr_map;
wire           PF_DDR_CFG_INIT_0_cfg_crc_error_clear;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_cs_to_cmdaddr_latency;
wire           PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_enable;
wire   [6:0]   PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_restart_holdoff;
wire           PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_sel;
wire   [6:0]   PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_slow_restart_window;
wire   [8:0]   PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_turn_off_delay;
wire           PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_value;
wire           PF_DDR_CFG_INIT_0_cfg_ctrlr_init_disable;
wire   [9:0]   PF_DDR_CFG_INIT_0_cfg_ctrlupd_start_delay;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_ctrlupd_trig;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_cwl;
wire           PF_DDR_CFG_INIT_0_cfg_data_mask;
wire   [6:0]   PF_DDR_CFG_INIT_0_cfg_data_sel;
wire           PF_DDR_CFG_INIT_0_cfg_data_sel_first_error;
wire   [1:0]   PF_DDR_CFG_INIT_0_cfg_dfi_data_byte_disable1to0;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_dfi_lvl_pattern;
wire           PF_DDR_CFG_INIT_0_cfg_dfi_lvl_periodic;
wire           PF_DDR_CFG_INIT_0_cfg_dfi_lvl_sel;
wire           PF_DDR_CFG_INIT_0_cfg_dfi_phyupd_en;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_dfi_t_ctrl_delay;
wire   [9:0]   PF_DDR_CFG_INIT_0_cfg_dfi_t_ctrlupd_max;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_dfi_t_dram_clk_enable;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_dfi_t_phy_rdlat;
wire   [5:0]   PF_DDR_CFG_INIT_0_cfg_dfi_t_phy_wrlat;
wire   [5:0]   PF_DDR_CFG_INIT_0_cfg_dfi_t_rddata_en;
wire           PF_DDR_CFG_INIT_0_cfg_dll_disable;
wire           PF_DDR_CFG_INIT_0_cfg_dm_en;
wire           PF_DDR_CFG_INIT_0_cfg_dram_clk_disable_in_self_refresh;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_ds;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_early_rank_to_rd_start;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_early_rank_to_wr_start;
wire           PF_DDR_CFG_INIT_0_cfg_ecc_correction_en;
wire   [15:0]  PF_DDR_CFG_INIT_0_cfg_emr3;
wire   [1:0]   PF_DDR_CFG_INIT_0_cfg_en_mask;
wire           PF_DDR_CFG_INIT_0_cfg_error_group_sel;
wire   [8:0]   PF_DDR_CFG_INIT_0_cfg_faw;
wire   [6:0]   PF_DDR_CFG_INIT_0_cfg_faw_dlr;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_fine_gran_ref_mode;
wire           PF_DDR_CFG_INIT_0_cfg_geardown_mode;
wire   [31:0]  PF_DDR_CFG_INIT_0_cfg_idle_time_to_power_down;
wire   [31:0]  PF_DDR_CFG_INIT_0_cfg_idle_time_to_self_refresh;
wire   [15:0]  PF_DDR_CFG_INIT_0_cfg_init_duration;
wire           PF_DDR_CFG_INIT_0_cfg_int_vref_mon;
wire           PF_DDR_CFG_INIT_0_cfg_lookahead_act;
wire           PF_DDR_CFG_INIT_0_cfg_lookahead_pch;
wire   [1:0]   PF_DDR_CFG_INIT_0_cfg_lp_asr;
wire           PF_DDR_CFG_INIT_0_cfg_lrdimm;
wire           PF_DDR_CFG_INIT_0_cfg_manual_address_map;
wire           PF_DDR_CFG_INIT_0_cfg_max_pwr_down_mode;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_mb_autopch_col_bit_pos_high;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_mb_autopch_col_bit_pos_low;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_mem_bankbits;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_mem_colbits;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_mem_rowbits;
wire   [15:0]  PF_DDR_CFG_INIT_0_cfg_memory_type;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_min_read_idle;
wire           PF_DDR_CFG_INIT_0_cfg_mirror_x16_bg0_bg1;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_mod;
wire   [1:0]   PF_DDR_CFG_INIT_0_cfg_mpr_read_format;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_mrr;
wire   [5:0]   PF_DDR_CFG_INIT_0_cfg_mrri;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_mrw;
wire           PF_DDR_CFG_INIT_0_cfg_nibble_devices;
wire   [1:0]   PF_DDR_CFG_INIT_0_cfg_num_cal_reads;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_num_logical_ranks_per_3ds;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_num_ranks;
wire           PF_DDR_CFG_INIT_0_cfg_odt_inbuf_4_pd;
wire           PF_DDR_CFG_INIT_0_cfg_odt_powerdown;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs0;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs1;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs2;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs3;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs4;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs5;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs6;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs7;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_odt_rd_turn_off;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_odt_rd_turn_on;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs0;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs1;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs2;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs3;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs4;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs5;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs6;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs7;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_odt_wr_turn_off;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_odt_wr_turn_on;
wire           PF_DDR_CFG_INIT_0_cfg_only_srank_cmds;
wire           PF_DDR_CFG_INIT_0_cfg_parity_rdimm_delay;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_pasr;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_pasr_bank;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_pasr_seg;
wire           PF_DDR_CFG_INIT_0_cfg_per_dram_addr_en;
wire   [9:0]   PF_DDR_CFG_INIT_0_cfg_phyupd_ack_delay;
wire   [6:0]   PF_DDR_CFG_INIT_0_cfg_post_trig_cycs;
wire   [15:0]  PF_DDR_CFG_INIT_0_cfg_pre_trig_cycs;
wire           PF_DDR_CFG_INIT_0_cfg_qoff;
wire           PF_DDR_CFG_INIT_0_cfg_quad_rank;
wire   [6:0]   PF_DDR_CFG_INIT_0_cfg_ras;
wire   [7:0]   PF_DDR_CFG_INIT_0_cfg_rc;
wire   [6:0]   PF_DDR_CFG_INIT_0_cfg_rcd;
wire   [13:0]  PF_DDR_CFG_INIT_0_cfg_rcd_stab;
wire           PF_DDR_CFG_INIT_0_cfg_rd_preamb_trn_mode;
wire           PF_DDR_CFG_INIT_0_cfg_rd_preamble;
wire           PF_DDR_CFG_INIT_0_cfg_rdimm_bside_invert;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_rdimm_lat;
wire           PF_DDR_CFG_INIT_0_cfg_read_dbi;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_read_to_read;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_read_to_read_odt;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_read_to_write;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_read_to_write_odt;
wire   [15:0]  PF_DDR_CFG_INIT_0_cfg_ref_per;
wire           PF_DDR_CFG_INIT_0_cfg_regdimm;
wire   [9:0]   PF_DDR_CFG_INIT_0_cfg_rfc;
wire   [9:0]   PF_DDR_CFG_INIT_0_cfg_rfc1;
wire   [9:0]   PF_DDR_CFG_INIT_0_cfg_rfc2;
wire   [9:0]   PF_DDR_CFG_INIT_0_cfg_rfc4;
wire   [9:0]   PF_DDR_CFG_INIT_0_cfg_rfc_dlr1;
wire   [9:0]   PF_DDR_CFG_INIT_0_cfg_rfc_dlr2;
wire   [9:0]   PF_DDR_CFG_INIT_0_cfg_rfc_dlr4;
wire   [5:0]   PF_DDR_CFG_INIT_0_cfg_rl;
wire           PF_DDR_CFG_INIT_0_cfg_rmw_en;
wire   [107:0] PF_DDR_CFG_INIT_0_cfg_rowaddr_map;
wire   [5:0]   PF_DDR_CFG_INIT_0_cfg_rp;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_rrd;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_rrd_dlr;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_rrd_l;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_rrd_s;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_rtp;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_rtt;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_rtt_park;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_rtt_wr;
wire           PF_DDR_CFG_INIT_0_cfg_sr_abort;
wire           PF_DDR_CFG_INIT_0_cfg_srt;
wire   [18:0]  PF_DDR_CFG_INIT_0_cfg_startup_delay;
wire   [11:0]  PF_DDR_CFG_INIT_0_cfg_starve_timeout_p0;
wire   [11:0]  PF_DDR_CFG_INIT_0_cfg_starve_timeout_p1;
wire   [11:0]  PF_DDR_CFG_INIT_0_cfg_starve_timeout_p2;
wire   [11:0]  PF_DDR_CFG_INIT_0_cfg_starve_timeout_p3;
wire   [11:0]  PF_DDR_CFG_INIT_0_cfg_starve_timeout_p4;
wire   [11:0]  PF_DDR_CFG_INIT_0_cfg_starve_timeout_p5;
wire   [11:0]  PF_DDR_CFG_INIT_0_cfg_starve_timeout_p6;
wire   [11:0]  PF_DDR_CFG_INIT_0_cfg_starve_timeout_p7;
wire           PF_DDR_CFG_INIT_0_cfg_tdqs;
wire           PF_DDR_CFG_INIT_0_cfg_temp_ctrl_ref_mode;
wire           PF_DDR_CFG_INIT_0_cfg_temp_ctrl_ref_range;
wire           PF_DDR_CFG_INIT_0_cfg_temp_sensor_readout;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_trig_mask;
wire           PF_DDR_CFG_INIT_0_cfg_trig_mode;
wire           PF_DDR_CFG_INIT_0_cfg_two_t;
wire           PF_DDR_CFG_INIT_0_cfg_two_t_sel_cycle;
wire           PF_DDR_CFG_INIT_0_cfg_vrefdq_trn_enable;
wire           PF_DDR_CFG_INIT_0_cfg_vrefdq_trn_range;
wire   [5:0]   PF_DDR_CFG_INIT_0_cfg_vrefdq_trn_value;
wire   [5:0]   PF_DDR_CFG_INIT_0_cfg_wl;
wire   [5:0]   PF_DDR_CFG_INIT_0_cfg_wr;
wire   [1:0]   PF_DDR_CFG_INIT_0_cfg_wr_cmd_lat_crc_dm;
wire   [5:0]   PF_DDR_CFG_INIT_0_cfg_wr_crc_dm;
wire           PF_DDR_CFG_INIT_0_cfg_wr_preamble;
wire           PF_DDR_CFG_INIT_0_cfg_write_crc;
wire           PF_DDR_CFG_INIT_0_cfg_write_dbi;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_write_to_read;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_write_to_read_odt;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_write_to_write;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_write_to_write_odt;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_wtr;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_wtr_l;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_wtr_l_crc_dm;
wire   [2:0]   PF_DDR_CFG_INIT_0_cfg_wtr_s;
wire   [3:0]   PF_DDR_CFG_INIT_0_cfg_wtr_s_crc_dm;
wire   [4:0]   PF_DDR_CFG_INIT_0_cfg_xp;
wire   [9:0]   PF_DDR_CFG_INIT_0_cfg_xpr;
wire   [8:0]   PF_DDR_CFG_INIT_0_cfg_xs;
wire   [10:0]  PF_DDR_CFG_INIT_0_cfg_xsdll;
wire   [8:0]   PF_DDR_CFG_INIT_0_cfg_xsr;
wire   [10:0]  PF_DDR_CFG_INIT_0_cfg_zq_cal_l_duration;
wire   [31:0]  PF_DDR_CFG_INIT_0_cfg_zq_cal_per;
wire   [10:0]  PF_DDR_CFG_INIT_0_cfg_zq_cal_r_duration;
wire   [10:0]  PF_DDR_CFG_INIT_0_cfg_zq_cal_s_duration;
wire   [1:0]   PF_DDR_CFG_INIT_0_cfg_zq_cal_type;
wire   [11:0]  PF_DDR_CFG_INIT_0_cfg_zqinit_cal_duration;
wire   [5:0]   PF_DDR_CFG_INIT_0_phy_eye_train_delay;
wire   [5:0]   PF_DDR_CFG_INIT_0_phy_gate_train_delay;
wire   [5:0]   PF_DDR_CFG_INIT_0_phy_train_step_enable;
wire   [9:0]   PF_DDR_CFG_INIT_0_RDGATE_MIN_READS_THRESHOLD;
wire   [7:0]   PF_DDR_CFG_INIT_0_WRCAL_WRITE_COUNTER_VALUE;
wire           PLL_LOCK_net_0;
wire           PLL_REF_CLK;
wire           RAS_N_net_0;
wire           RESET_N_net_0;
wire           SHIELD0_net_0;
wire           SHIELD1_net_0;
wire           SYS_CLK_net_0;
wire           SYS_RESET_N;
wire           WE_N_net_0;
wire   [1:0]   DM_net_1;
wire           CKE_net_1;
wire           CS_N_net_1;
wire           ODT_net_1;
wire           RAS_N_net_1;
wire           CAS_N_net_1;
wire           WE_N_net_1;
wire   [2:0]   BA_net_1;
wire           RESET_N_net_1;
wire   [15:0]  A_net_1;
wire           CK0_net_1;
wire           CK0_N_net_1;
wire           SHIELD0_net_1;
wire           SHIELD1_net_1;
wire           SYS_CLK_net_1;
wire           PLL_LOCK_net_1;
wire           AXI4slave0_AWREADY_net_0;
wire           AXI4slave0_WREADY_net_0;
wire   [5:0]   AXI4slave0_BID_net_0;
wire   [1:0]   AXI4slave0_BRESP_net_0;
wire           AXI4slave0_BVALID_net_0;
wire           AXI4slave0_ARREADY_net_0;
wire   [5:0]   AXI4slave0_RID_net_0;
wire   [63:0]  AXI4slave0_RDATA_net_0;
wire   [1:0]   AXI4slave0_RRESP_net_0;
wire           AXI4slave0_RLAST_net_0;
wire           AXI4slave0_RVALID_net_0;
wire           CTRLR_READY_net_1;
wire   [19:16] dfi_address_p0_ext_slice_0;
wire   [19:16] dfi_address_p1_ext_slice_0;
wire   [19:16] dfi_address_p2_ext_slice_0;
wire   [19:16] dfi_address_p3_ext_slice_0;
wire   [3:3]   dfi_bank_p0_ext_slice_0;
wire   [3:3]   dfi_bank_p1_ext_slice_0;
wire   [3:3]   dfi_bank_p2_ext_slice_0;
wire   [3:3]   dfi_bank_p3_ext_slice_0;
wire   [19:0]  dfi_address_p0_ext_net_0;
wire   [19:0]  dfi_address_p1_ext_net_0;
wire   [19:0]  dfi_address_p2_ext_net_0;
wire   [19:0]  dfi_address_p3_ext_net_0;
wire   [3:0]   dfi_bank_p0_ext_net_0;
wire   [3:0]   dfi_bank_p1_ext_net_0;
wire   [3:0]   dfi_bank_p2_ext_net_0;
wire   [3:0]   dfi_bank_p3_ext_net_0;
wire   [15:0]  DFI_WRDATA_EN_P0_net_0;
wire   [15:0]  DFI_WRDATA_EN_P1_net_0;
wire   [15:0]  DFI_WRDATA_EN_P2_net_0;
wire   [15:0]  DFI_WRDATA_EN_P3_net_0;
wire   [15:0]  DFI_RDDATA_EN_P0_net_0;
wire   [15:0]  DFI_RDDATA_EN_P1_net_0;
wire   [15:0]  DFI_RDDATA_EN_P2_net_0;
wire   [15:0]  DFI_RDDATA_EN_P3_net_0;
wire   [8:0]   cfg_dfi_data_byte_disable_net_0;
wire   [107:0] cfg_bit_map_index_cs9_net_0;
wire   [107:0] cfg_bit_map_index_cs8_net_0;
wire   [107:0] cfg_bit_map_index_cs7_net_0;
wire   [107:0] cfg_bit_map_index_cs6_net_0;
wire   [107:0] cfg_bit_map_index_cs5_net_0;
wire   [107:0] cfg_bit_map_index_cs4_net_0;
wire   [107:0] cfg_bit_map_index_cs3_net_0;
wire   [107:0] cfg_bit_map_index_cs2_net_0;
wire   [107:0] cfg_bit_map_index_cs15_net_0;
wire   [107:0] cfg_bit_map_index_cs14_net_0;
wire   [107:0] cfg_bit_map_index_cs13_net_0;
wire   [107:0] cfg_bit_map_index_cs12_net_0;
wire   [107:0] cfg_bit_map_index_cs11_net_0;
wire   [107:0] cfg_bit_map_index_cs10_net_0;
wire   [107:0] cfg_bit_map_index_cs1_net_0;
wire   [107:0] cfg_bit_map_index_cs0_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           VCC_net;
wire   [7:0]   l_self_refresh_const_net_0;
wire   [7:0]   l_power_down_const_net_0;
wire           GND_net;
wire   [7:0]   l_zq_cal_req_const_net_0;
wire   [7:0]   init_cs_const_net_0;
wire   [7:0]   init_mr_addr_const_net_0;
wire   [17:0]  init_mr_wr_data_const_net_0;
wire   [17:0]  init_mr_wr_mask_const_net_0;
wire   [7:0]   init_self_refresh_const_net_0;
wire   [7:0]   init_power_down_const_net_0;
wire   [7:0]   init_force_write_cs_const_net_0;
wire   [3:0]   init_cal_l_b_size_const_net_0;
wire   [3:0]   init_read_capture_addr_const_net_0;
wire   [3:0]   init_force_write_data_const_net_0;
wire   [38:0]  init_cal_l_addr_const_net_0;
wire   [2:0]   init_odt_force_rank_const_net_0;
wire   [17:0]  init_pda_nibble_select_const_net_0;
wire   [15:0]  phy_reset_control_const_net_0;
wire   [3:0]   phy_pc_rank_const_net_0;
wire   [15:0]  phy_ranks_to_train_const_net_0;
wire   [5:0]   phy_write_level_delay_const_net_0;
wire   [7:0]   phy_eye_pat_const_net_0;
wire   [3:0]   dfi_rddata_dbi_w0_ext_const_net_0;
wire   [3:0]   dfi_rddata_dbi_w1_ext_const_net_0;
wire   [3:0]   dfi_rddata_dbi_w2_ext_const_net_0;
wire   [3:0]   dfi_rddata_dbi_w3_ext_const_net_0;
wire   [3:0]   dfi_error_info_ext_const_net_0;
wire   [1:0]   init_dfi_dram_clk_disable_const_net_0;
wire   [3:0]   init_dfi_lp_wakeup_const_net_0;
wire   [31:0]  cfg_mpfe_auto_pch_const_net_0;
wire   [7:0]   init_write_data_1b_ecc_error_gen_const_net_0;
wire   [7:0]   init_write_data_2b_ecc_error_gen_const_net_0;
wire   [33:0]  ext_cal_l_addr_const_net_0;
wire   [3:0]   ext_cal_l_b_size_const_net_0;
wire   [15:2]  DFI_WRDATA_EN_P0_const_net_0;
wire   [15:2]  DFI_WRDATA_EN_P1_const_net_0;
wire   [15:2]  DFI_WRDATA_EN_P2_const_net_0;
wire   [15:2]  DFI_WRDATA_EN_P3_const_net_0;
wire   [15:2]  DFI_RDDATA_EN_P0_const_net_0;
wire   [15:2]  DFI_RDDATA_EN_P1_const_net_0;
wire   [15:2]  DFI_RDDATA_EN_P2_const_net_0;
wire   [15:2]  DFI_RDDATA_EN_P3_const_net_0;
wire   [2:0]   ADDR_VCOPHS_OFFSET_const_net_0;
wire   [2:0]   BCLK_VCOPHS_OFFSET_const_net_0;
wire   [6:0]   WRLVL_TAP_OFFSET_const_net_0;
wire   [10:0]  DRI_CTRL_0_const_net_0;
wire   [32:0]  DRI_WDATA_0_const_net_0;
wire   [10:0]  DRI_CTRL_1_const_net_0;
wire   [32:0]  DRI_WDATA_1_const_net_0;
wire   [10:0]  DLL_DRI_CTRL_const_net_0;
wire   [32:0]  DLL_DRI_WDATA_const_net_0;
wire   [36:0]  l_addr_const_net_0;
wire   [10:0]  l_b_size_const_net_0;
wire   [127:0] l_datain_const_net_0;
wire   [15:0]  l_dm_in_const_net_0;
wire   [5:0]   axi0_wid_const_net_0;
wire   [3:0]   axi0_awusertag_const_net_0;
wire   [2:0]   l_req_pri_p0_const_net_0;
wire   [51:0]  l_req_tag_p0_const_net_0;
wire   [36:0]  l_addr_p0_const_net_0;
wire   [10:0]  l_b_size_p0_const_net_0;
wire   [127:0] l_datain_p0_const_net_0;
wire   [15:0]  l_dm_in_p0_const_net_0;
wire   [5:0]   axi1_awid_const_net_0;
wire   [31:0]  axi1_awaddr_const_net_0;
wire   [7:0]   axi1_awlen_const_net_0;
wire   [2:0]   axi1_awsize_const_net_0;
wire   [1:0]   axi1_awburst_const_net_0;
wire   [1:0]   axi1_awlock_const_net_0;
wire   [3:0]   axi1_awcache_const_net_0;
wire   [2:0]   axi1_awprot_const_net_0;
wire   [5:0]   axi1_wid_const_net_0;
wire   [63:0]  axi1_wdata_const_net_0;
wire   [7:0]   axi1_wstrb_const_net_0;
wire   [5:0]   axi1_arid_const_net_0;
wire   [31:0]  axi1_araddr_const_net_0;
wire   [7:0]   axi1_arlen_const_net_0;
wire   [2:0]   axi1_arsize_const_net_0;
wire   [1:0]   axi1_arburst_const_net_0;
wire   [1:0]   axi1_arlock_const_net_0;
wire   [3:0]   axi1_arcache_const_net_0;
wire   [2:0]   axi1_arprot_const_net_0;
wire   [3:0]   axi1_awusertag_const_net_0;
wire   [2:0]   l_req_pri_p1_const_net_0;
wire   [51:0]  l_req_tag_p1_const_net_0;
wire   [36:0]  l_addr_p1_const_net_0;
wire   [10:0]  l_b_size_p1_const_net_0;
wire   [127:0] l_datain_p1_const_net_0;
wire   [15:0]  l_dm_in_p1_const_net_0;
wire   [5:0]   axi2_awid_const_net_0;
wire   [31:0]  axi2_awaddr_const_net_0;
wire   [7:0]   axi2_awlen_const_net_0;
wire   [2:0]   axi2_awsize_const_net_0;
wire   [1:0]   axi2_awburst_const_net_0;
wire   [1:0]   axi2_awlock_const_net_0;
wire   [3:0]   axi2_awcache_const_net_0;
wire   [2:0]   axi2_awprot_const_net_0;
wire   [5:0]   axi2_wid_const_net_0;
wire   [63:0]  axi2_wdata_const_net_0;
wire   [7:0]   axi2_wstrb_const_net_0;
wire   [5:0]   axi2_arid_const_net_0;
wire   [31:0]  axi2_araddr_const_net_0;
wire   [7:0]   axi2_arlen_const_net_0;
wire   [2:0]   axi2_arsize_const_net_0;
wire   [1:0]   axi2_arburst_const_net_0;
wire   [1:0]   axi2_arlock_const_net_0;
wire   [3:0]   axi2_arcache_const_net_0;
wire   [2:0]   axi2_arprot_const_net_0;
wire   [3:0]   axi2_awusertag_const_net_0;
wire   [2:0]   l_req_pri_p2_const_net_0;
wire   [51:0]  l_req_tag_p2_const_net_0;
wire   [36:0]  l_addr_p2_const_net_0;
wire   [10:0]  l_b_size_p2_const_net_0;
wire   [127:0] l_datain_p2_const_net_0;
wire   [15:0]  l_dm_in_p2_const_net_0;
wire   [5:0]   axi3_awid_const_net_0;
wire   [31:0]  axi3_awaddr_const_net_0;
wire   [7:0]   axi3_awlen_const_net_0;
wire   [2:0]   axi3_awsize_const_net_0;
wire   [1:0]   axi3_awburst_const_net_0;
wire   [1:0]   axi3_awlock_const_net_0;
wire   [3:0]   axi3_awcache_const_net_0;
wire   [2:0]   axi3_awprot_const_net_0;
wire   [5:0]   axi3_wid_const_net_0;
wire   [63:0]  axi3_wdata_const_net_0;
wire   [7:0]   axi3_wstrb_const_net_0;
wire   [5:0]   axi3_arid_const_net_0;
wire   [31:0]  axi3_araddr_const_net_0;
wire   [7:0]   axi3_arlen_const_net_0;
wire   [2:0]   axi3_arsize_const_net_0;
wire   [1:0]   axi3_arburst_const_net_0;
wire   [1:0]   axi3_arlock_const_net_0;
wire   [3:0]   axi3_arcache_const_net_0;
wire   [2:0]   axi3_arprot_const_net_0;
wire   [3:0]   axi3_awusertag_const_net_0;
wire   [2:0]   l_req_pri_p3_const_net_0;
wire   [51:0]  l_req_tag_p3_const_net_0;
wire   [36:0]  l_addr_p3_const_net_0;
wire   [10:0]  l_b_size_p3_const_net_0;
wire   [127:0] l_datain_p3_const_net_0;
wire   [15:0]  l_dm_in_p3_const_net_0;
wire   [5:0]   axi4_awid_const_net_0;
wire   [31:0]  axi4_awaddr_const_net_0;
wire   [7:0]   axi4_awlen_const_net_0;
wire   [2:0]   axi4_awsize_const_net_0;
wire   [1:0]   axi4_awburst_const_net_0;
wire   [1:0]   axi4_awlock_const_net_0;
wire   [3:0]   axi4_awcache_const_net_0;
wire   [2:0]   axi4_awprot_const_net_0;
wire   [5:0]   axi4_wid_const_net_0;
wire   [63:0]  axi4_wdata_const_net_0;
wire   [7:0]   axi4_wstrb_const_net_0;
wire   [5:0]   axi4_arid_const_net_0;
wire   [31:0]  axi4_araddr_const_net_0;
wire   [7:0]   axi4_arlen_const_net_0;
wire   [2:0]   axi4_arsize_const_net_0;
wire   [1:0]   axi4_arburst_const_net_0;
wire   [1:0]   axi4_arlock_const_net_0;
wire   [3:0]   axi4_arcache_const_net_0;
wire   [2:0]   axi4_arprot_const_net_0;
wire   [3:0]   axi4_awusertag_const_net_0;
wire   [2:0]   l_req_pri_p4_const_net_0;
wire   [51:0]  l_req_tag_p4_const_net_0;
wire   [36:0]  l_addr_p4_const_net_0;
wire   [10:0]  l_b_size_p4_const_net_0;
wire   [127:0] l_datain_p4_const_net_0;
wire   [15:0]  l_dm_in_p4_const_net_0;
wire   [5:0]   axi5_awid_const_net_0;
wire   [31:0]  axi5_awaddr_const_net_0;
wire   [7:0]   axi5_awlen_const_net_0;
wire   [2:0]   axi5_awsize_const_net_0;
wire   [1:0]   axi5_awburst_const_net_0;
wire   [1:0]   axi5_awlock_const_net_0;
wire   [3:0]   axi5_awcache_const_net_0;
wire   [2:0]   axi5_awprot_const_net_0;
wire   [5:0]   axi5_wid_const_net_0;
wire   [63:0]  axi5_wdata_const_net_0;
wire   [7:0]   axi5_wstrb_const_net_0;
wire   [5:0]   axi5_arid_const_net_0;
wire   [31:0]  axi5_araddr_const_net_0;
wire   [7:0]   axi5_arlen_const_net_0;
wire   [2:0]   axi5_arsize_const_net_0;
wire   [1:0]   axi5_arburst_const_net_0;
wire   [1:0]   axi5_arlock_const_net_0;
wire   [3:0]   axi5_arcache_const_net_0;
wire   [2:0]   axi5_arprot_const_net_0;
wire   [3:0]   axi5_awusertag_const_net_0;
wire   [2:0]   l_req_pri_p5_const_net_0;
wire   [36:0]  l_addr_p5_const_net_0;
wire   [10:0]  l_b_size_p5_const_net_0;
wire   [51:0]  l_req_tag_p5_const_net_0;
wire   [127:0] l_datain_p5_const_net_0;
wire   [15:0]  l_dm_in_p5_const_net_0;
wire   [5:0]   axi6_awid_const_net_0;
wire   [31:0]  axi6_awaddr_const_net_0;
wire   [7:0]   axi6_awlen_const_net_0;
wire   [2:0]   axi6_awsize_const_net_0;
wire   [1:0]   axi6_awburst_const_net_0;
wire   [1:0]   axi6_awlock_const_net_0;
wire   [3:0]   axi6_awcache_const_net_0;
wire   [2:0]   axi6_awprot_const_net_0;
wire   [5:0]   axi6_wid_const_net_0;
wire   [63:0]  axi6_wdata_const_net_0;
wire   [7:0]   axi6_wstrb_const_net_0;
wire   [5:0]   axi6_arid_const_net_0;
wire   [31:0]  axi6_araddr_const_net_0;
wire   [7:0]   axi6_arlen_const_net_0;
wire   [2:0]   axi6_arsize_const_net_0;
wire   [1:0]   axi6_arburst_const_net_0;
wire   [1:0]   axi6_arlock_const_net_0;
wire   [3:0]   axi6_arcache_const_net_0;
wire   [2:0]   axi6_arprot_const_net_0;
wire   [3:0]   axi6_awusertag_const_net_0;
wire   [2:0]   l_req_pri_p6_const_net_0;
wire   [36:0]  l_addr_p6_const_net_0;
wire   [10:0]  l_b_size_p6_const_net_0;
wire   [51:0]  l_req_tag_p6_const_net_0;
wire   [127:0] l_datain_p6_const_net_0;
wire   [15:0]  l_dm_in_p6_const_net_0;
wire   [5:0]   axi7_awid_const_net_0;
wire   [31:0]  axi7_awaddr_const_net_0;
wire   [7:0]   axi7_awlen_const_net_0;
wire   [2:0]   axi7_awsize_const_net_0;
wire   [1:0]   axi7_awburst_const_net_0;
wire   [1:0]   axi7_awlock_const_net_0;
wire   [3:0]   axi7_awcache_const_net_0;
wire   [2:0]   axi7_awprot_const_net_0;
wire   [5:0]   axi7_wid_const_net_0;
wire   [63:0]  axi7_wdata_const_net_0;
wire   [7:0]   axi7_wstrb_const_net_0;
wire   [5:0]   axi7_arid_const_net_0;
wire   [31:0]  axi7_araddr_const_net_0;
wire   [7:0]   axi7_arlen_const_net_0;
wire   [2:0]   axi7_arsize_const_net_0;
wire   [1:0]   axi7_arburst_const_net_0;
wire   [1:0]   axi7_arlock_const_net_0;
wire   [3:0]   axi7_arcache_const_net_0;
wire   [2:0]   axi7_arprot_const_net_0;
wire   [3:0]   axi7_awusertag_const_net_0;
wire   [2:0]   l_req_pri_p7_const_net_0;
wire   [36:0]  l_addr_p7_const_net_0;
wire   [10:0]  l_b_size_p7_const_net_0;
wire   [51:0]  l_req_tag_p7_const_net_0;
wire   [127:0] l_datain_p7_const_net_0;
wire   [15:0]  l_dm_in_p7_const_net_0;
wire   [7:0]   l_ecc_err_gen_1_bit_const_net_0;
wire   [7:0]   l_ecc_err_gen_2_bit_const_net_0;
wire   [10:0]  DRI_CTRL_0_const_net_1;
wire   [32:0]  DRI_WDATA_0_const_net_1;
wire   [10:0]  DRI_CTRL_1_const_net_1;
wire   [32:0]  DRI_WDATA_1_const_net_1;
wire   [10:0]  DLL_DRI_CTRL_const_net_1;
wire   [32:0]  DLL_DRI_WDATA_const_net_1;
wire   [15:0]  PADDR_const_net_0;
wire   [7:0]   PWDATA_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net                                      = 1'b1;
assign l_self_refresh_const_net_0                   = 8'h00;
assign l_power_down_const_net_0                     = 8'h00;
assign GND_net                                      = 1'b0;
assign l_zq_cal_req_const_net_0                     = 8'h00;
assign init_cs_const_net_0                          = 8'h00;
assign init_mr_addr_const_net_0                     = 8'h00;
assign init_mr_wr_data_const_net_0                  = 18'h00000;
assign init_mr_wr_mask_const_net_0                  = 18'h00000;
assign init_self_refresh_const_net_0                = 8'h00;
assign init_power_down_const_net_0                  = 8'h00;
assign init_force_write_cs_const_net_0              = 8'h00;
assign init_cal_l_b_size_const_net_0                = 4'h0;
assign init_read_capture_addr_const_net_0           = 4'h0;
assign init_force_write_data_const_net_0            = 4'h0;
assign init_cal_l_addr_const_net_0                  = 39'h0000000000;
assign init_odt_force_rank_const_net_0              = 3'h0;
assign init_pda_nibble_select_const_net_0           = 18'h00000;
assign phy_reset_control_const_net_0                = 16'h0001;
assign phy_pc_rank_const_net_0                      = 4'h1;
assign phy_ranks_to_train_const_net_0               = 16'h0001;
assign phy_write_level_delay_const_net_0            = 6'h00;
assign phy_eye_pat_const_net_0                      = 8'h00;
assign dfi_rddata_dbi_w0_ext_const_net_0            = 4'h0;
assign dfi_rddata_dbi_w1_ext_const_net_0            = 4'h0;
assign dfi_rddata_dbi_w2_ext_const_net_0            = 4'h0;
assign dfi_rddata_dbi_w3_ext_const_net_0            = 4'h0;
assign dfi_error_info_ext_const_net_0               = 4'h0;
assign init_dfi_dram_clk_disable_const_net_0        = 2'h0;
assign init_dfi_lp_wakeup_const_net_0               = 4'h0;
assign cfg_mpfe_auto_pch_const_net_0                = 32'h00000000;
assign init_write_data_1b_ecc_error_gen_const_net_0 = 8'h00;
assign init_write_data_2b_ecc_error_gen_const_net_0 = 8'h00;
assign ext_cal_l_addr_const_net_0                   = 34'h00FFFFFF8;
assign ext_cal_l_b_size_const_net_0                 = 4'h1;
assign DFI_WRDATA_EN_P0_const_net_0                 = 14'h0000;
assign DFI_WRDATA_EN_P1_const_net_0                 = 14'h0000;
assign DFI_WRDATA_EN_P2_const_net_0                 = 14'h0000;
assign DFI_WRDATA_EN_P3_const_net_0                 = 14'h0000;
assign DFI_RDDATA_EN_P0_const_net_0                 = 14'h0000;
assign DFI_RDDATA_EN_P1_const_net_0                 = 14'h0000;
assign DFI_RDDATA_EN_P2_const_net_0                 = 14'h0000;
assign DFI_RDDATA_EN_P3_const_net_0                 = 14'h0000;
assign ADDR_VCOPHS_OFFSET_const_net_0               = 3'h4;
assign BCLK_VCOPHS_OFFSET_const_net_0               = 3'h4;
assign WRLVL_TAP_OFFSET_const_net_0                 = 7'h01;
assign DRI_CTRL_0_const_net_0                       = 11'h000;
assign DRI_WDATA_0_const_net_0                      = 33'h000000000;
assign DRI_CTRL_1_const_net_0                       = 11'h000;
assign DRI_WDATA_1_const_net_0                      = 33'h000000000;
assign DLL_DRI_CTRL_const_net_0                     = 11'h000;
assign DLL_DRI_WDATA_const_net_0                    = 33'h000000000;
assign l_addr_const_net_0                           = 37'h0000000000;
assign l_b_size_const_net_0                         = 11'h000;
assign l_datain_const_net_0                         = 128'h00000000000000000000000000000000;
assign l_dm_in_const_net_0                          = 16'h0000;
assign axi0_wid_const_net_0                         = 6'h00;
assign axi0_awusertag_const_net_0                   = 4'h0;
assign l_req_pri_p0_const_net_0                     = 3'h0;
assign l_req_tag_p0_const_net_0                     = 52'h0000000000000;
assign l_addr_p0_const_net_0                        = 37'h0000000000;
assign l_b_size_p0_const_net_0                      = 11'h000;
assign l_datain_p0_const_net_0                      = 128'h00000000000000000000000000000000;
assign l_dm_in_p0_const_net_0                       = 16'h0000;
assign axi1_awid_const_net_0                        = 6'h00;
assign axi1_awaddr_const_net_0                      = 32'h00000000;
assign axi1_awlen_const_net_0                       = 8'h00;
assign axi1_awsize_const_net_0                      = 3'h0;
assign axi1_awburst_const_net_0                     = 2'h0;
assign axi1_awlock_const_net_0                      = 2'h0;
assign axi1_awcache_const_net_0                     = 4'h0;
assign axi1_awprot_const_net_0                      = 3'h0;
assign axi1_wid_const_net_0                         = 6'h00;
assign axi1_wdata_const_net_0                       = 64'h0000000000000000;
assign axi1_wstrb_const_net_0                       = 8'h00;
assign axi1_arid_const_net_0                        = 6'h00;
assign axi1_araddr_const_net_0                      = 32'h00000000;
assign axi1_arlen_const_net_0                       = 8'h00;
assign axi1_arsize_const_net_0                      = 3'h0;
assign axi1_arburst_const_net_0                     = 2'h0;
assign axi1_arlock_const_net_0                      = 2'h0;
assign axi1_arcache_const_net_0                     = 4'h0;
assign axi1_arprot_const_net_0                      = 3'h0;
assign axi1_awusertag_const_net_0                   = 4'h0;
assign l_req_pri_p1_const_net_0                     = 3'h0;
assign l_req_tag_p1_const_net_0                     = 52'h0000000000000;
assign l_addr_p1_const_net_0                        = 37'h0000000000;
assign l_b_size_p1_const_net_0                      = 11'h000;
assign l_datain_p1_const_net_0                      = 128'h00000000000000000000000000000000;
assign l_dm_in_p1_const_net_0                       = 16'h0000;
assign axi2_awid_const_net_0                        = 6'h00;
assign axi2_awaddr_const_net_0                      = 32'h00000000;
assign axi2_awlen_const_net_0                       = 8'h00;
assign axi2_awsize_const_net_0                      = 3'h0;
assign axi2_awburst_const_net_0                     = 2'h0;
assign axi2_awlock_const_net_0                      = 2'h0;
assign axi2_awcache_const_net_0                     = 4'h0;
assign axi2_awprot_const_net_0                      = 3'h0;
assign axi2_wid_const_net_0                         = 6'h00;
assign axi2_wdata_const_net_0                       = 64'h0000000000000000;
assign axi2_wstrb_const_net_0                       = 8'h00;
assign axi2_arid_const_net_0                        = 6'h00;
assign axi2_araddr_const_net_0                      = 32'h00000000;
assign axi2_arlen_const_net_0                       = 8'h00;
assign axi2_arsize_const_net_0                      = 3'h0;
assign axi2_arburst_const_net_0                     = 2'h0;
assign axi2_arlock_const_net_0                      = 2'h0;
assign axi2_arcache_const_net_0                     = 4'h0;
assign axi2_arprot_const_net_0                      = 3'h0;
assign axi2_awusertag_const_net_0                   = 4'h0;
assign l_req_pri_p2_const_net_0                     = 3'h0;
assign l_req_tag_p2_const_net_0                     = 52'h0000000000000;
assign l_addr_p2_const_net_0                        = 37'h0000000000;
assign l_b_size_p2_const_net_0                      = 11'h000;
assign l_datain_p2_const_net_0                      = 128'h00000000000000000000000000000000;
assign l_dm_in_p2_const_net_0                       = 16'h0000;
assign axi3_awid_const_net_0                        = 6'h00;
assign axi3_awaddr_const_net_0                      = 32'h00000000;
assign axi3_awlen_const_net_0                       = 8'h00;
assign axi3_awsize_const_net_0                      = 3'h0;
assign axi3_awburst_const_net_0                     = 2'h0;
assign axi3_awlock_const_net_0                      = 2'h0;
assign axi3_awcache_const_net_0                     = 4'h0;
assign axi3_awprot_const_net_0                      = 3'h0;
assign axi3_wid_const_net_0                         = 6'h00;
assign axi3_wdata_const_net_0                       = 64'h0000000000000000;
assign axi3_wstrb_const_net_0                       = 8'h00;
assign axi3_arid_const_net_0                        = 6'h00;
assign axi3_araddr_const_net_0                      = 32'h00000000;
assign axi3_arlen_const_net_0                       = 8'h00;
assign axi3_arsize_const_net_0                      = 3'h0;
assign axi3_arburst_const_net_0                     = 2'h0;
assign axi3_arlock_const_net_0                      = 2'h0;
assign axi3_arcache_const_net_0                     = 4'h0;
assign axi3_arprot_const_net_0                      = 3'h0;
assign axi3_awusertag_const_net_0                   = 4'h0;
assign l_req_pri_p3_const_net_0                     = 3'h0;
assign l_req_tag_p3_const_net_0                     = 52'h0000000000000;
assign l_addr_p3_const_net_0                        = 37'h0000000000;
assign l_b_size_p3_const_net_0                      = 11'h000;
assign l_datain_p3_const_net_0                      = 128'h00000000000000000000000000000000;
assign l_dm_in_p3_const_net_0                       = 16'h0000;
assign axi4_awid_const_net_0                        = 6'h00;
assign axi4_awaddr_const_net_0                      = 32'h00000000;
assign axi4_awlen_const_net_0                       = 8'h00;
assign axi4_awsize_const_net_0                      = 3'h0;
assign axi4_awburst_const_net_0                     = 2'h0;
assign axi4_awlock_const_net_0                      = 2'h0;
assign axi4_awcache_const_net_0                     = 4'h0;
assign axi4_awprot_const_net_0                      = 3'h0;
assign axi4_wid_const_net_0                         = 6'h00;
assign axi4_wdata_const_net_0                       = 64'h0000000000000000;
assign axi4_wstrb_const_net_0                       = 8'h00;
assign axi4_arid_const_net_0                        = 6'h00;
assign axi4_araddr_const_net_0                      = 32'h00000000;
assign axi4_arlen_const_net_0                       = 8'h00;
assign axi4_arsize_const_net_0                      = 3'h0;
assign axi4_arburst_const_net_0                     = 2'h0;
assign axi4_arlock_const_net_0                      = 2'h0;
assign axi4_arcache_const_net_0                     = 4'h0;
assign axi4_arprot_const_net_0                      = 3'h0;
assign axi4_awusertag_const_net_0                   = 4'h0;
assign l_req_pri_p4_const_net_0                     = 3'h0;
assign l_req_tag_p4_const_net_0                     = 52'h0000000000000;
assign l_addr_p4_const_net_0                        = 37'h0000000000;
assign l_b_size_p4_const_net_0                      = 11'h000;
assign l_datain_p4_const_net_0                      = 128'h00000000000000000000000000000000;
assign l_dm_in_p4_const_net_0                       = 16'h0000;
assign axi5_awid_const_net_0                        = 6'h00;
assign axi5_awaddr_const_net_0                      = 32'h00000000;
assign axi5_awlen_const_net_0                       = 8'h00;
assign axi5_awsize_const_net_0                      = 3'h0;
assign axi5_awburst_const_net_0                     = 2'h0;
assign axi5_awlock_const_net_0                      = 2'h0;
assign axi5_awcache_const_net_0                     = 4'h0;
assign axi5_awprot_const_net_0                      = 3'h0;
assign axi5_wid_const_net_0                         = 6'h00;
assign axi5_wdata_const_net_0                       = 64'h0000000000000000;
assign axi5_wstrb_const_net_0                       = 8'h00;
assign axi5_arid_const_net_0                        = 6'h00;
assign axi5_araddr_const_net_0                      = 32'h00000000;
assign axi5_arlen_const_net_0                       = 8'h00;
assign axi5_arsize_const_net_0                      = 3'h0;
assign axi5_arburst_const_net_0                     = 2'h0;
assign axi5_arlock_const_net_0                      = 2'h0;
assign axi5_arcache_const_net_0                     = 4'h0;
assign axi5_arprot_const_net_0                      = 3'h0;
assign axi5_awusertag_const_net_0                   = 4'h0;
assign l_req_pri_p5_const_net_0                     = 3'h0;
assign l_addr_p5_const_net_0                        = 37'h0000000000;
assign l_b_size_p5_const_net_0                      = 11'h000;
assign l_req_tag_p5_const_net_0                     = 52'h0000000000000;
assign l_datain_p5_const_net_0                      = 128'h00000000000000000000000000000000;
assign l_dm_in_p5_const_net_0                       = 16'h0000;
assign axi6_awid_const_net_0                        = 6'h00;
assign axi6_awaddr_const_net_0                      = 32'h00000000;
assign axi6_awlen_const_net_0                       = 8'h00;
assign axi6_awsize_const_net_0                      = 3'h0;
assign axi6_awburst_const_net_0                     = 2'h0;
assign axi6_awlock_const_net_0                      = 2'h0;
assign axi6_awcache_const_net_0                     = 4'h0;
assign axi6_awprot_const_net_0                      = 3'h0;
assign axi6_wid_const_net_0                         = 6'h00;
assign axi6_wdata_const_net_0                       = 64'h0000000000000000;
assign axi6_wstrb_const_net_0                       = 8'h00;
assign axi6_arid_const_net_0                        = 6'h00;
assign axi6_araddr_const_net_0                      = 32'h00000000;
assign axi6_arlen_const_net_0                       = 8'h00;
assign axi6_arsize_const_net_0                      = 3'h0;
assign axi6_arburst_const_net_0                     = 2'h0;
assign axi6_arlock_const_net_0                      = 2'h0;
assign axi6_arcache_const_net_0                     = 4'h0;
assign axi6_arprot_const_net_0                      = 3'h0;
assign axi6_awusertag_const_net_0                   = 4'h0;
assign l_req_pri_p6_const_net_0                     = 3'h0;
assign l_addr_p6_const_net_0                        = 37'h0000000000;
assign l_b_size_p6_const_net_0                      = 11'h000;
assign l_req_tag_p6_const_net_0                     = 52'h0000000000000;
assign l_datain_p6_const_net_0                      = 128'h00000000000000000000000000000000;
assign l_dm_in_p6_const_net_0                       = 16'h0000;
assign axi7_awid_const_net_0                        = 6'h00;
assign axi7_awaddr_const_net_0                      = 32'h00000000;
assign axi7_awlen_const_net_0                       = 8'h00;
assign axi7_awsize_const_net_0                      = 3'h0;
assign axi7_awburst_const_net_0                     = 2'h0;
assign axi7_awlock_const_net_0                      = 2'h0;
assign axi7_awcache_const_net_0                     = 4'h0;
assign axi7_awprot_const_net_0                      = 3'h0;
assign axi7_wid_const_net_0                         = 6'h00;
assign axi7_wdata_const_net_0                       = 64'h0000000000000000;
assign axi7_wstrb_const_net_0                       = 8'h00;
assign axi7_arid_const_net_0                        = 6'h00;
assign axi7_araddr_const_net_0                      = 32'h00000000;
assign axi7_arlen_const_net_0                       = 8'h00;
assign axi7_arsize_const_net_0                      = 3'h0;
assign axi7_arburst_const_net_0                     = 2'h0;
assign axi7_arlock_const_net_0                      = 2'h0;
assign axi7_arcache_const_net_0                     = 4'h0;
assign axi7_arprot_const_net_0                      = 3'h0;
assign axi7_awusertag_const_net_0                   = 4'h0;
assign l_req_pri_p7_const_net_0                     = 3'h0;
assign l_addr_p7_const_net_0                        = 37'h0000000000;
assign l_b_size_p7_const_net_0                      = 11'h000;
assign l_req_tag_p7_const_net_0                     = 52'h0000000000000;
assign l_datain_p7_const_net_0                      = 128'h00000000000000000000000000000000;
assign l_dm_in_p7_const_net_0                       = 16'h0000;
assign l_ecc_err_gen_1_bit_const_net_0              = 8'h00;
assign l_ecc_err_gen_2_bit_const_net_0              = 8'h00;
assign DRI_CTRL_0_const_net_1                       = 11'h000;
assign DRI_WDATA_0_const_net_1                      = 33'h000000000;
assign DRI_CTRL_1_const_net_1                       = 11'h000;
assign DRI_WDATA_1_const_net_1                      = 33'h000000000;
assign DLL_DRI_CTRL_const_net_1                     = 11'h000;
assign DLL_DRI_WDATA_const_net_1                    = 33'h000000000;
assign PADDR_const_net_0                            = 16'h0000;
assign PWDATA_const_net_0                           = 8'h00;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign DM_net_1                 = DM_net_0;
assign DM[1:0]                  = DM_net_1;
assign CKE_net_1                = CKE_net_0;
assign CKE                      = CKE_net_1;
assign CS_N_net_1               = CS_N_net_0;
assign CS_N                     = CS_N_net_1;
assign ODT_net_1                = ODT_net_0;
assign ODT                      = ODT_net_1;
assign RAS_N_net_1              = RAS_N_net_0;
assign RAS_N                    = RAS_N_net_1;
assign CAS_N_net_1              = CAS_N_net_0;
assign CAS_N                    = CAS_N_net_1;
assign WE_N_net_1               = WE_N_net_0;
assign WE_N                     = WE_N_net_1;
assign BA_net_1                 = BA_net_0;
assign BA[2:0]                  = BA_net_1;
assign RESET_N_net_1            = RESET_N_net_0;
assign RESET_N                  = RESET_N_net_1;
assign A_net_1                  = A_net_0;
assign A[15:0]                  = A_net_1;
assign CK0_net_1                = CK0_net_0;
assign CK0                      = CK0_net_1;
assign CK0_N_net_1              = CK0_N_net_0;
assign CK0_N                    = CK0_N_net_1;
assign SHIELD0_net_1            = SHIELD0_net_0;
assign SHIELD0                  = SHIELD0_net_1;
assign SHIELD1_net_1            = SHIELD1_net_0;
assign SHIELD1                  = SHIELD1_net_1;
assign SYS_CLK_net_1            = SYS_CLK_net_0;
assign SYS_CLK                  = SYS_CLK_net_1;
assign PLL_LOCK_net_1           = PLL_LOCK_net_0;
assign PLL_LOCK                 = PLL_LOCK_net_1;
assign AXI4slave0_AWREADY_net_0 = AXI4slave0_AWREADY;
assign axi0_awready             = AXI4slave0_AWREADY_net_0;
assign AXI4slave0_WREADY_net_0  = AXI4slave0_WREADY;
assign axi0_wready              = AXI4slave0_WREADY_net_0;
assign AXI4slave0_BID_net_0     = AXI4slave0_BID;
assign axi0_bid[5:0]            = AXI4slave0_BID_net_0;
assign AXI4slave0_BRESP_net_0   = AXI4slave0_BRESP;
assign axi0_bresp[1:0]          = AXI4slave0_BRESP_net_0;
assign AXI4slave0_BVALID_net_0  = AXI4slave0_BVALID;
assign axi0_bvalid              = AXI4slave0_BVALID_net_0;
assign AXI4slave0_ARREADY_net_0 = AXI4slave0_ARREADY;
assign axi0_arready             = AXI4slave0_ARREADY_net_0;
assign AXI4slave0_RID_net_0     = AXI4slave0_RID;
assign axi0_rid[5:0]            = AXI4slave0_RID_net_0;
assign AXI4slave0_RDATA_net_0   = AXI4slave0_RDATA;
assign axi0_rdata[63:0]         = AXI4slave0_RDATA_net_0;
assign AXI4slave0_RRESP_net_0   = AXI4slave0_RRESP;
assign axi0_rresp[1:0]          = AXI4slave0_RRESP_net_0;
assign AXI4slave0_RLAST_net_0   = AXI4slave0_RLAST;
assign axi0_rlast               = AXI4slave0_RLAST_net_0;
assign AXI4slave0_RVALID_net_0  = AXI4slave0_RVALID;
assign axi0_rvalid              = AXI4slave0_RVALID_net_0;
assign CTRLR_READY_net_1        = CTRLR_READY_net_0;
assign CTRLR_READY              = CTRLR_READY_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign DDRCTRL_0_dfi_address_p0_ext15to0               = dfi_address_p0_ext_net_0[15:0];
assign DDRCTRL_0_dfi_address_p1_ext15to0               = dfi_address_p1_ext_net_0[15:0];
assign DDRCTRL_0_dfi_address_p2_ext15to0               = dfi_address_p2_ext_net_0[15:0];
assign DDRCTRL_0_dfi_address_p3_ext15to0               = dfi_address_p3_ext_net_0[15:0];
assign DDRCTRL_0_dfi_bank_p0_ext2to0                   = dfi_bank_p0_ext_net_0[2:0];
assign DDRCTRL_0_dfi_bank_p1_ext2to0                   = dfi_bank_p1_ext_net_0[2:0];
assign DDRCTRL_0_dfi_bank_p2_ext2to0                   = dfi_bank_p2_ext_net_0[2:0];
assign DDRCTRL_0_dfi_bank_p3_ext2to0                   = dfi_bank_p3_ext_net_0[2:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs023to0    = cfg_bit_map_index_cs0_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs123to0    = cfg_bit_map_index_cs1_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs223to0    = cfg_bit_map_index_cs2_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs323to0    = cfg_bit_map_index_cs3_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs423to0    = cfg_bit_map_index_cs4_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs523to0    = cfg_bit_map_index_cs5_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs623to0    = cfg_bit_map_index_cs6_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs723to0    = cfg_bit_map_index_cs7_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs823to0    = cfg_bit_map_index_cs8_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs923to0    = cfg_bit_map_index_cs9_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1023to0   = cfg_bit_map_index_cs10_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1123to0   = cfg_bit_map_index_cs11_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1223to0   = cfg_bit_map_index_cs12_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1323to0   = cfg_bit_map_index_cs13_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1423to0   = cfg_bit_map_index_cs14_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1523to0   = cfg_bit_map_index_cs15_net_0[23:0];
assign PF_DDR_CFG_INIT_0_cfg_dfi_data_byte_disable1to0 = cfg_dfi_data_byte_disable_net_0[1:0];
assign dfi_address_p0_ext_slice_0                      = dfi_address_p0_ext_net_0[19:16];
assign dfi_address_p1_ext_slice_0                      = dfi_address_p1_ext_net_0[19:16];
assign dfi_address_p2_ext_slice_0                      = dfi_address_p2_ext_net_0[19:16];
assign dfi_address_p3_ext_slice_0                      = dfi_address_p3_ext_net_0[19:16];
assign dfi_bank_p0_ext_slice_0[3]                      = dfi_bank_p0_ext_net_0[3:3];
assign dfi_bank_p1_ext_slice_0[3]                      = dfi_bank_p1_ext_net_0[3:3];
assign dfi_bank_p2_ext_slice_0[3]                      = dfi_bank_p2_ext_net_0[3:3];
assign dfi_bank_p3_ext_slice_0[3]                      = dfi_bank_p3_ext_net_0[3:3];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign DFI_WRDATA_EN_P0_net_0 = { 14'h0000 , DDRCTRL_0_dfi_wrdata_en_p0_ext };
assign DFI_WRDATA_EN_P1_net_0 = { 14'h0000 , DDRCTRL_0_dfi_wrdata_en_p1_ext };
assign DFI_WRDATA_EN_P2_net_0 = { 14'h0000 , DDRCTRL_0_dfi_wrdata_en_p2_ext };
assign DFI_WRDATA_EN_P3_net_0 = { 14'h0000 , DDRCTRL_0_dfi_wrdata_en_p3_ext };
assign DFI_RDDATA_EN_P0_net_0 = { 14'h0000 , DDRCTRL_0_dfi_rddata_en_p0_ext };
assign DFI_RDDATA_EN_P1_net_0 = { 14'h0000 , DDRCTRL_0_dfi_rddata_en_p1_ext };
assign DFI_RDDATA_EN_P2_net_0 = { 14'h0000 , DDRCTRL_0_dfi_rddata_en_p2_ext };
assign DFI_RDDATA_EN_P3_net_0 = { 14'h0000 , DDRCTRL_0_dfi_rddata_en_p3_ext };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PF_DDR3_SS_CCC_0_PF_CCC   -   Actel:SgCore:PF_CCC:2.2.100
PF_DDR3_SS_CCC_0_PF_CCC CCC_0(
        // Inputs
        .REF_CLK_0         ( PLL_REF_CLK ),
        .PHASE_OUT0_SEL_0  ( DDRPHY_BLK_0_VCO_PHSEL_REFCLK_SEL ),
        .PHASE_OUT2_SEL_0  ( DDRPHY_BLK_0_VCO_PHSEL_BCLK_SEL ),
        .PHASE_OUT3_SEL_0  ( DDRPHY_BLK_0_VCO_PHSEL_BCLK90_SEL ),
        .PHASE_ROTATE_0    ( DDRPHY_BLK_0_VCO_PHSEL_ROTATE ),
        .PHASE_DIRECTION_0 ( VCC_net ),
        .LOAD_PHASE_N_0    ( DDRPHY_BLK_0_LOADPHS_B ),
        .PLL_POWERDOWN_N_0 ( SYS_RESET_N ),
        // Outputs
        .OUT0_0            ( CCC_0_OUT0_0 ),
        .OUT1_FABCLK_0     ( SYS_CLK_net_0 ),
        .OUT2_HS_IO_CLK_0  ( CCC_0_OUT2_HS_IO_CLK_0 ),
        .OUT3_HS_IO_CLK_0  ( CCC_0_OUT3_HS_IO_CLK_0 ),
        .PLL_LOCK_0        ( PLL_LOCK_net_0 ) 
        );

//--------PF_DDR3_SS_DDRCTRL_0_CoreDDRMemCtrlr   -   Actel:DirectCore:CoreDDRMemCtrlr:2.3.101
PF_DDR3_SS_DDRCTRL_0_CoreDDRMemCtrlr #( 
        .ADDR_MAP_SIG_BITS            ( 10 ),
        .ADDR_WIDTH                   ( 34 ),
        .ADDR_WIDTH_TS                ( 37 ),
        .ALLOW_PARTIAL_BURSTS         ( 0 ),
        .AXI0_ENABLE_PAR              ( 1 ),
        .AXI1_ENABLE_PAR              ( 0 ),
        .AXI2_ENABLE_PAR              ( 0 ),
        .AXI3_ENABLE_PAR              ( 0 ),
        .AXI4_ENABLE_PAR              ( 0 ),
        .AXI5_ENABLE_PAR              ( 0 ),
        .AXI6_ENABLE_PAR              ( 0 ),
        .AXI7_ENABLE_PAR              ( 0 ),
        .AXI_ADDR_WIDTH               ( 32 ),
        .AXI_AWUSERTAG_EN             ( 0 ),
        .AXI_AWUSERTAG_WIDTH          ( 4 ),
        .AXI_DATA_WIDTH               ( 64 ),
        .AXI_ECC_SUPPORT              ( 0 ),
        .AXI_ENABLE_INTRAPORT_REORDER ( 0 ),
        .AXI_LEN_WIDTH                ( 8 ),
        .AXI_SINGLE_CLOCK_MODE        ( 0 ),
        .AXI_SLAVE_ID_WIDTH           ( 6 ),
        .AXI_SLAVE_TYPE               ( 1 ),
        .BANK_GROUP_ADDR_WIDTH        ( 3 ),
        .BURST_SIZE_WIDTH             ( 13 ),
        .BYTE_ADDR_WIDTH              ( 37 ),
        .BYTE_SUBADDRESS_BITS         ( 4 ),
        .BYTES_PER_WORD               ( 16 ),
        .CAC_PIPE_STAGES              ( 3 ),
        .CORE_ADV_D_REQ               ( 3 ),
        .CORE_ADV_R_VALID             ( 3 ),
        .CORE_ADV_RD_START            ( 3 ),
        .CORE_ADV_WR_START            ( 1 ),
        .COREDDRMEMCTRLR_INST_NO      ( 1 ),
        .CTRLR_RANKS                  ( 1 ),
        .DESELECT_WHEN_IDLE           ( 1 ),
        .DFI_ADDRESS_WIDTH            ( 20 ),
        .DFI_ADDRESS_WIDTH_C          ( 20 ),
        .DFI_BANK_WIDTH               ( 4 ),
        .DFI_BANKGROUP_WIDTH          ( 2 ),
        .DFI_CHIP_SELECT_WIDTH        ( 1 ),
        .DFI_CID_WIDTH                ( 3 ),
        .DFI_CONTROL_WIDTH            ( 1 ),
        .DFI_DATA_ENABLE_WIDTH        ( 2 ),
        .DFI_DATA_PHASE_WIDTH         ( 32 ),
        .DFI_DATA_WIDTH               ( 128 ),
        .DFI_DM_PHASE_WIDTH           ( 4 ),
        .DFI_T_PHY_WRDATA             ( 1 ),
        .DFI_WRLVL_SLICE_WIDTH        ( 2 ),
        .DISABLE_BURST_TERMINATE      ( 0 ),
        .DSIZE                        ( 128 ),
        .ECC_ACTIVE_DWIDTH            ( 16 ),
        .ECC_RDDATA_PIPELINE          ( 0 ),
        .EF_AXI_PAR                   ( 1 ),
        .EF_ECC_PAR                   ( 0 ),
        .EF_LB_PAR                    ( 0 ),
        .EF_MPFE_PAR                  ( 1 ),
        .EF_RMW_PAR                   ( 1 ),
        .ENABLE_3DS                   ( 0 ),
        .ENABLE_REG_D_REQ_OUTPUT      ( 0 ),
        .FAMILY                       ( 26 ),
        .FAST_ACTIVATE                ( 0 ),
        .FASTSDRAM_PIPE_LEVEL         ( 0 ),
        .FREQ_RATIO                   ( 4 ),
        .LB0_DISABLE_PAR              ( 1 ),
        .LB1_DISABLE_PAR              ( 1 ),
        .LB2_DISABLE_PAR              ( 1 ),
        .LB3_DISABLE_PAR              ( 1 ),
        .LB4_DISABLE_PAR              ( 1 ),
        .LB5_DISABLE_PAR              ( 1 ),
        .LB6_DISABLE_PAR              ( 1 ),
        .LB7_DISABLE_PAR              ( 1 ),
        .LOOKAHEAD_AUTOPRECHARGE      ( 0 ),
        .LOOKAHEAD_PRECHARGE          ( 0 ),
        .MASK_R_VALID_START_EN        ( 0 ),
        .MAX_SN_WIDTH                 ( 2 ),
        .MPFE_PIPELINE_VERSION        ( 1 ),
        .MULTIBURST_LATENCY_MASK      ( 1 ),
        .NIBBLE_DEVICES               ( 0 ),
        .NUM_ALERT_OR_QERR            ( 1 ),
        .NUM_CAC_BUSES                ( 1 ),
        .NUM_CLK_OUTS                 ( 1 ),
        .NUM_ECC                      ( 8 ),
        .NUMBER_OF_RANKS              ( 8 ),
        .OVERRIDE_EARLY_D_REQ         ( 0 ),
        .OVERRIDE_EARLY_R_VALID       ( 0 ),
        .PD_SR_SUPPORTED              ( 0 ),
        .PIPELINE_CFG_REGS            ( 1 ),
        .QM_COMMAND_PIPE_STAGES       ( 2 ),
        .QUEUE_DEPTH                  ( 3 ),
        .SDRAM_BANKSTATMODULES        ( 4 ),
        .SYNDROME_REG_PIPELINE        ( 0 ),
        .TAG_WIDTH                    ( 52 ),
        .USE_PHY_RDDATA_VALID         ( 0 ),
        .USE_READ_CAPTURE_MODULE      ( 1 ) )
DDRCTRL_0(
        // Inputs
        .reset_n                              ( DDRPHY_BLK_0_SYNC_SYS_RST_N ),
        .l_r_req                              ( GND_net ), // tied to 1'b0 from definition
        .l_w_req                              ( GND_net ), // tied to 1'b0 from definition
        .l_addr                               ( l_addr_const_net_0 ), // tied to 37'h0000000000 from definition
        .l_b_size                             ( l_b_size_const_net_0 ), // tied to 11'h000 from definition
        .l_rd_wrap                            ( GND_net ), // tied to 1'b0 from definition
        .l_auto_pch                           ( GND_net ), // tied to 1'b0 from definition
        .l_datain                             ( l_datain_const_net_0 ), // tied to 128'h00000000000000000000000000000000 from definition
        .l_dm_in                              ( l_dm_in_const_net_0 ), // tied to 16'h0000 from definition
        .axi0_aclk                            ( SYS_CLK_net_0 ),
        .axi0_aresetn                         ( DDRPHY_BLK_0_SYNC_SYS_RST_N ),
        .axi0_awid                            ( axi0_awid ),
        .axi0_awaddr                          ( axi0_awaddr ),
        .axi0_awlen                           ( axi0_awlen ),
        .axi0_awsize                          ( axi0_awsize ),
        .axi0_awburst                         ( axi0_awburst ),
        .axi0_awlock                          ( axi0_awlock ),
        .axi0_awcache                         ( axi0_awcache ),
        .axi0_awprot                          ( axi0_awprot ),
        .axi0_awvalid                         ( axi0_awvalid ),
        .axi0_wid                             ( axi0_wid_const_net_0 ), // tied to 6'h00 from definition
        .axi0_wdata                           ( axi0_wdata ),
        .axi0_wstrb                           ( axi0_wstrb ),
        .axi0_wlast                           ( axi0_wlast ),
        .axi0_wvalid                          ( axi0_wvalid ),
        .axi0_bready                          ( axi0_bready ),
        .axi0_arid                            ( axi0_arid ),
        .axi0_araddr                          ( axi0_araddr ),
        .axi0_arlen                           ( axi0_arlen ),
        .axi0_arsize                          ( axi0_arsize ),
        .axi0_arburst                         ( axi0_arburst ),
        .axi0_arlock                          ( axi0_arlock ),
        .axi0_arcache                         ( axi0_arcache ),
        .axi0_arprot                          ( axi0_arprot ),
        .axi0_arvalid                         ( axi0_arvalid ),
        .axi0_rready                          ( axi0_rready ),
        .axi0_awusertag                       ( axi0_awusertag_const_net_0 ), // tied to 4'h0 from definition
        .l_auto_pch_p0                        ( GND_net ), // tied to 1'b0 from definition
        .l_r_req_p0                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_req_p0                           ( GND_net ), // tied to 1'b0 from definition
        .l_req_pri_p0                         ( l_req_pri_p0_const_net_0 ), // tied to 3'h0 from definition
        .l_vport_id_p0                        ( GND_net ), // tied to 1'b0 from definition
        .l_req_tag_p0                         ( l_req_tag_p0_const_net_0 ), // tied to 52'h0000000000000 from definition
        .l_addr_p0                            ( l_addr_p0_const_net_0 ), // tied to 37'h0000000000 from definition
        .l_b_size_p0                          ( l_b_size_p0_const_net_0 ), // tied to 11'h000 from definition
        .l_rd_wrap_p0                         ( GND_net ), // tied to 1'b0 from definition
        .l_datain_p0                          ( l_datain_p0_const_net_0 ), // tied to 128'h00000000000000000000000000000000 from definition
        .l_dm_in_p0                           ( l_dm_in_p0_const_net_0 ), // tied to 16'h0000 from definition
        .axi1_aclk                            ( GND_net ), // tied to 1'b0 from definition
        .axi1_aresetn                         ( GND_net ), // tied to 1'b0 from definition
        .axi1_awid                            ( axi1_awid_const_net_0 ), // tied to 6'h00 from definition
        .axi1_awaddr                          ( axi1_awaddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi1_awlen                           ( axi1_awlen_const_net_0 ), // tied to 8'h00 from definition
        .axi1_awsize                          ( axi1_awsize_const_net_0 ), // tied to 3'h0 from definition
        .axi1_awburst                         ( axi1_awburst_const_net_0 ), // tied to 2'h0 from definition
        .axi1_awlock                          ( axi1_awlock_const_net_0 ), // tied to 2'h0 from definition
        .axi1_awcache                         ( axi1_awcache_const_net_0 ), // tied to 4'h0 from definition
        .axi1_awprot                          ( axi1_awprot_const_net_0 ), // tied to 3'h0 from definition
        .axi1_awvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi1_wid                             ( axi1_wid_const_net_0 ), // tied to 6'h00 from definition
        .axi1_wdata                           ( axi1_wdata_const_net_0 ), // tied to 64'h0000000000000000 from definition
        .axi1_wstrb                           ( axi1_wstrb_const_net_0 ), // tied to 8'h00 from definition
        .axi1_wlast                           ( GND_net ), // tied to 1'b0 from definition
        .axi1_wvalid                          ( GND_net ), // tied to 1'b0 from definition
        .axi1_bready                          ( GND_net ), // tied to 1'b0 from definition
        .axi1_arid                            ( axi1_arid_const_net_0 ), // tied to 6'h00 from definition
        .axi1_araddr                          ( axi1_araddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi1_arlen                           ( axi1_arlen_const_net_0 ), // tied to 8'h00 from definition
        .axi1_arsize                          ( axi1_arsize_const_net_0 ), // tied to 3'h0 from definition
        .axi1_arburst                         ( axi1_arburst_const_net_0 ), // tied to 2'h0 from definition
        .axi1_arlock                          ( axi1_arlock_const_net_0 ), // tied to 2'h0 from definition
        .axi1_arcache                         ( axi1_arcache_const_net_0 ), // tied to 4'h0 from definition
        .axi1_arprot                          ( axi1_arprot_const_net_0 ), // tied to 3'h0 from definition
        .axi1_arvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi1_rready                          ( GND_net ), // tied to 1'b0 from definition
        .axi1_awusertag                       ( axi1_awusertag_const_net_0 ), // tied to 4'h0 from definition
        .l_req_pri_p1                         ( l_req_pri_p1_const_net_0 ), // tied to 3'h0 from definition
        .l_r_req_p1                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_req_p1                           ( GND_net ), // tied to 1'b0 from definition
        .l_vport_id_p1                        ( GND_net ), // tied to 1'b0 from definition
        .l_req_tag_p1                         ( l_req_tag_p1_const_net_0 ), // tied to 52'h0000000000000 from definition
        .l_addr_p1                            ( l_addr_p1_const_net_0 ), // tied to 37'h0000000000 from definition
        .l_b_size_p1                          ( l_b_size_p1_const_net_0 ), // tied to 11'h000 from definition
        .l_auto_pch_p1                        ( GND_net ), // tied to 1'b0 from definition
        .l_rd_wrap_p1                         ( GND_net ), // tied to 1'b0 from definition
        .l_datain_p1                          ( l_datain_p1_const_net_0 ), // tied to 128'h00000000000000000000000000000000 from definition
        .l_dm_in_p1                           ( l_dm_in_p1_const_net_0 ), // tied to 16'h0000 from definition
        .axi2_aclk                            ( GND_net ), // tied to 1'b0 from definition
        .axi2_aresetn                         ( GND_net ), // tied to 1'b0 from definition
        .axi2_awid                            ( axi2_awid_const_net_0 ), // tied to 6'h00 from definition
        .axi2_awaddr                          ( axi2_awaddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi2_awlen                           ( axi2_awlen_const_net_0 ), // tied to 8'h00 from definition
        .axi2_awsize                          ( axi2_awsize_const_net_0 ), // tied to 3'h0 from definition
        .axi2_awburst                         ( axi2_awburst_const_net_0 ), // tied to 2'h0 from definition
        .axi2_awlock                          ( axi2_awlock_const_net_0 ), // tied to 2'h0 from definition
        .axi2_awcache                         ( axi2_awcache_const_net_0 ), // tied to 4'h0 from definition
        .axi2_awprot                          ( axi2_awprot_const_net_0 ), // tied to 3'h0 from definition
        .axi2_awvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi2_wid                             ( axi2_wid_const_net_0 ), // tied to 6'h00 from definition
        .axi2_wdata                           ( axi2_wdata_const_net_0 ), // tied to 64'h0000000000000000 from definition
        .axi2_wstrb                           ( axi2_wstrb_const_net_0 ), // tied to 8'h00 from definition
        .axi2_wlast                           ( GND_net ), // tied to 1'b0 from definition
        .axi2_wvalid                          ( GND_net ), // tied to 1'b0 from definition
        .axi2_bready                          ( GND_net ), // tied to 1'b0 from definition
        .axi2_arid                            ( axi2_arid_const_net_0 ), // tied to 6'h00 from definition
        .axi2_araddr                          ( axi2_araddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi2_arlen                           ( axi2_arlen_const_net_0 ), // tied to 8'h00 from definition
        .axi2_arsize                          ( axi2_arsize_const_net_0 ), // tied to 3'h0 from definition
        .axi2_arburst                         ( axi2_arburst_const_net_0 ), // tied to 2'h0 from definition
        .axi2_arlock                          ( axi2_arlock_const_net_0 ), // tied to 2'h0 from definition
        .axi2_arcache                         ( axi2_arcache_const_net_0 ), // tied to 4'h0 from definition
        .axi2_arprot                          ( axi2_arprot_const_net_0 ), // tied to 3'h0 from definition
        .axi2_arvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi2_rready                          ( GND_net ), // tied to 1'b0 from definition
        .axi2_awusertag                       ( axi2_awusertag_const_net_0 ), // tied to 4'h0 from definition
        .l_r_req_p2                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_req_p2                           ( GND_net ), // tied to 1'b0 from definition
        .l_req_pri_p2                         ( l_req_pri_p2_const_net_0 ), // tied to 3'h0 from definition
        .l_vport_id_p2                        ( GND_net ), // tied to 1'b0 from definition
        .l_req_tag_p2                         ( l_req_tag_p2_const_net_0 ), // tied to 52'h0000000000000 from definition
        .l_addr_p2                            ( l_addr_p2_const_net_0 ), // tied to 37'h0000000000 from definition
        .l_b_size_p2                          ( l_b_size_p2_const_net_0 ), // tied to 11'h000 from definition
        .l_auto_pch_p2                        ( GND_net ), // tied to 1'b0 from definition
        .l_rd_wrap_p2                         ( GND_net ), // tied to 1'b0 from definition
        .l_datain_p2                          ( l_datain_p2_const_net_0 ), // tied to 128'h00000000000000000000000000000000 from definition
        .l_dm_in_p2                           ( l_dm_in_p2_const_net_0 ), // tied to 16'h0000 from definition
        .axi3_aclk                            ( GND_net ), // tied to 1'b0 from definition
        .axi3_aresetn                         ( GND_net ), // tied to 1'b0 from definition
        .axi3_awid                            ( axi3_awid_const_net_0 ), // tied to 6'h00 from definition
        .axi3_awaddr                          ( axi3_awaddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi3_awlen                           ( axi3_awlen_const_net_0 ), // tied to 8'h00 from definition
        .axi3_awsize                          ( axi3_awsize_const_net_0 ), // tied to 3'h0 from definition
        .axi3_awburst                         ( axi3_awburst_const_net_0 ), // tied to 2'h0 from definition
        .axi3_awlock                          ( axi3_awlock_const_net_0 ), // tied to 2'h0 from definition
        .axi3_awcache                         ( axi3_awcache_const_net_0 ), // tied to 4'h0 from definition
        .axi3_awprot                          ( axi3_awprot_const_net_0 ), // tied to 3'h0 from definition
        .axi3_awvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi3_wid                             ( axi3_wid_const_net_0 ), // tied to 6'h00 from definition
        .axi3_wdata                           ( axi3_wdata_const_net_0 ), // tied to 64'h0000000000000000 from definition
        .axi3_wstrb                           ( axi3_wstrb_const_net_0 ), // tied to 8'h00 from definition
        .axi3_wlast                           ( GND_net ), // tied to 1'b0 from definition
        .axi3_wvalid                          ( GND_net ), // tied to 1'b0 from definition
        .axi3_bready                          ( GND_net ), // tied to 1'b0 from definition
        .axi3_arid                            ( axi3_arid_const_net_0 ), // tied to 6'h00 from definition
        .axi3_araddr                          ( axi3_araddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi3_arlen                           ( axi3_arlen_const_net_0 ), // tied to 8'h00 from definition
        .axi3_arsize                          ( axi3_arsize_const_net_0 ), // tied to 3'h0 from definition
        .axi3_arburst                         ( axi3_arburst_const_net_0 ), // tied to 2'h0 from definition
        .axi3_arlock                          ( axi3_arlock_const_net_0 ), // tied to 2'h0 from definition
        .axi3_arcache                         ( axi3_arcache_const_net_0 ), // tied to 4'h0 from definition
        .axi3_arprot                          ( axi3_arprot_const_net_0 ), // tied to 3'h0 from definition
        .axi3_arvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi3_rready                          ( GND_net ), // tied to 1'b0 from definition
        .axi3_awusertag                       ( axi3_awusertag_const_net_0 ), // tied to 4'h0 from definition
        .l_r_req_p3                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_req_p3                           ( GND_net ), // tied to 1'b0 from definition
        .l_req_pri_p3                         ( l_req_pri_p3_const_net_0 ), // tied to 3'h0 from definition
        .l_vport_id_p3                        ( GND_net ), // tied to 1'b0 from definition
        .l_req_tag_p3                         ( l_req_tag_p3_const_net_0 ), // tied to 52'h0000000000000 from definition
        .l_addr_p3                            ( l_addr_p3_const_net_0 ), // tied to 37'h0000000000 from definition
        .l_b_size_p3                          ( l_b_size_p3_const_net_0 ), // tied to 11'h000 from definition
        .l_auto_pch_p3                        ( GND_net ), // tied to 1'b0 from definition
        .l_rd_wrap_p3                         ( GND_net ), // tied to 1'b0 from definition
        .l_datain_p3                          ( l_datain_p3_const_net_0 ), // tied to 128'h00000000000000000000000000000000 from definition
        .l_dm_in_p3                           ( l_dm_in_p3_const_net_0 ), // tied to 16'h0000 from definition
        .axi4_aclk                            ( GND_net ), // tied to 1'b0 from definition
        .axi4_aresetn                         ( GND_net ), // tied to 1'b0 from definition
        .axi4_awid                            ( axi4_awid_const_net_0 ), // tied to 6'h00 from definition
        .axi4_awaddr                          ( axi4_awaddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi4_awlen                           ( axi4_awlen_const_net_0 ), // tied to 8'h00 from definition
        .axi4_awsize                          ( axi4_awsize_const_net_0 ), // tied to 3'h0 from definition
        .axi4_awburst                         ( axi4_awburst_const_net_0 ), // tied to 2'h0 from definition
        .axi4_awlock                          ( axi4_awlock_const_net_0 ), // tied to 2'h0 from definition
        .axi4_awcache                         ( axi4_awcache_const_net_0 ), // tied to 4'h0 from definition
        .axi4_awprot                          ( axi4_awprot_const_net_0 ), // tied to 3'h0 from definition
        .axi4_awvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi4_wid                             ( axi4_wid_const_net_0 ), // tied to 6'h00 from definition
        .axi4_wdata                           ( axi4_wdata_const_net_0 ), // tied to 64'h0000000000000000 from definition
        .axi4_wstrb                           ( axi4_wstrb_const_net_0 ), // tied to 8'h00 from definition
        .axi4_wlast                           ( GND_net ), // tied to 1'b0 from definition
        .axi4_wvalid                          ( GND_net ), // tied to 1'b0 from definition
        .axi4_bready                          ( GND_net ), // tied to 1'b0 from definition
        .axi4_arid                            ( axi4_arid_const_net_0 ), // tied to 6'h00 from definition
        .axi4_araddr                          ( axi4_araddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi4_arlen                           ( axi4_arlen_const_net_0 ), // tied to 8'h00 from definition
        .axi4_arsize                          ( axi4_arsize_const_net_0 ), // tied to 3'h0 from definition
        .axi4_arburst                         ( axi4_arburst_const_net_0 ), // tied to 2'h0 from definition
        .axi4_arlock                          ( axi4_arlock_const_net_0 ), // tied to 2'h0 from definition
        .axi4_arcache                         ( axi4_arcache_const_net_0 ), // tied to 4'h0 from definition
        .axi4_arprot                          ( axi4_arprot_const_net_0 ), // tied to 3'h0 from definition
        .axi4_arvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi4_rready                          ( GND_net ), // tied to 1'b0 from definition
        .axi4_awusertag                       ( axi4_awusertag_const_net_0 ), // tied to 4'h0 from definition
        .l_r_req_p4                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_req_p4                           ( GND_net ), // tied to 1'b0 from definition
        .l_req_pri_p4                         ( l_req_pri_p4_const_net_0 ), // tied to 3'h0 from definition
        .l_vport_id_p4                        ( GND_net ), // tied to 1'b0 from definition
        .l_req_tag_p4                         ( l_req_tag_p4_const_net_0 ), // tied to 52'h0000000000000 from definition
        .l_addr_p4                            ( l_addr_p4_const_net_0 ), // tied to 37'h0000000000 from definition
        .l_b_size_p4                          ( l_b_size_p4_const_net_0 ), // tied to 11'h000 from definition
        .l_auto_pch_p4                        ( GND_net ), // tied to 1'b0 from definition
        .l_rd_wrap_p4                         ( GND_net ), // tied to 1'b0 from definition
        .l_datain_p4                          ( l_datain_p4_const_net_0 ), // tied to 128'h00000000000000000000000000000000 from definition
        .l_dm_in_p4                           ( l_dm_in_p4_const_net_0 ), // tied to 16'h0000 from definition
        .axi5_aclk                            ( GND_net ), // tied to 1'b0 from definition
        .axi5_aresetn                         ( GND_net ), // tied to 1'b0 from definition
        .axi5_awid                            ( axi5_awid_const_net_0 ), // tied to 6'h00 from definition
        .axi5_awaddr                          ( axi5_awaddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi5_awlen                           ( axi5_awlen_const_net_0 ), // tied to 8'h00 from definition
        .axi5_awsize                          ( axi5_awsize_const_net_0 ), // tied to 3'h0 from definition
        .axi5_awburst                         ( axi5_awburst_const_net_0 ), // tied to 2'h0 from definition
        .axi5_awlock                          ( axi5_awlock_const_net_0 ), // tied to 2'h0 from definition
        .axi5_awcache                         ( axi5_awcache_const_net_0 ), // tied to 4'h0 from definition
        .axi5_awprot                          ( axi5_awprot_const_net_0 ), // tied to 3'h0 from definition
        .axi5_awvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi5_wid                             ( axi5_wid_const_net_0 ), // tied to 6'h00 from definition
        .axi5_wdata                           ( axi5_wdata_const_net_0 ), // tied to 64'h0000000000000000 from definition
        .axi5_wstrb                           ( axi5_wstrb_const_net_0 ), // tied to 8'h00 from definition
        .axi5_wlast                           ( GND_net ), // tied to 1'b0 from definition
        .axi5_wvalid                          ( GND_net ), // tied to 1'b0 from definition
        .axi5_bready                          ( GND_net ), // tied to 1'b0 from definition
        .axi5_arid                            ( axi5_arid_const_net_0 ), // tied to 6'h00 from definition
        .axi5_araddr                          ( axi5_araddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi5_arlen                           ( axi5_arlen_const_net_0 ), // tied to 8'h00 from definition
        .axi5_arsize                          ( axi5_arsize_const_net_0 ), // tied to 3'h0 from definition
        .axi5_arburst                         ( axi5_arburst_const_net_0 ), // tied to 2'h0 from definition
        .axi5_arlock                          ( axi5_arlock_const_net_0 ), // tied to 2'h0 from definition
        .axi5_arcache                         ( axi5_arcache_const_net_0 ), // tied to 4'h0 from definition
        .axi5_arprot                          ( axi5_arprot_const_net_0 ), // tied to 3'h0 from definition
        .axi5_arvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi5_rready                          ( GND_net ), // tied to 1'b0 from definition
        .axi5_awusertag                       ( axi5_awusertag_const_net_0 ), // tied to 4'h0 from definition
        .l_r_req_p5                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_req_p5                           ( GND_net ), // tied to 1'b0 from definition
        .l_req_pri_p5                         ( l_req_pri_p5_const_net_0 ), // tied to 3'h0 from definition
        .l_addr_p5                            ( l_addr_p5_const_net_0 ), // tied to 37'h0000000000 from definition
        .l_b_size_p5                          ( l_b_size_p5_const_net_0 ), // tied to 11'h000 from definition
        .l_auto_pch_p5                        ( GND_net ), // tied to 1'b0 from definition
        .l_vport_id_p5                        ( GND_net ), // tied to 1'b0 from definition
        .l_req_tag_p5                         ( l_req_tag_p5_const_net_0 ), // tied to 52'h0000000000000 from definition
        .l_rd_wrap_p5                         ( GND_net ), // tied to 1'b0 from definition
        .l_datain_p5                          ( l_datain_p5_const_net_0 ), // tied to 128'h00000000000000000000000000000000 from definition
        .l_dm_in_p5                           ( l_dm_in_p5_const_net_0 ), // tied to 16'h0000 from definition
        .axi6_aclk                            ( GND_net ), // tied to 1'b0 from definition
        .axi6_aresetn                         ( GND_net ), // tied to 1'b0 from definition
        .axi6_awid                            ( axi6_awid_const_net_0 ), // tied to 6'h00 from definition
        .axi6_awaddr                          ( axi6_awaddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi6_awlen                           ( axi6_awlen_const_net_0 ), // tied to 8'h00 from definition
        .axi6_awsize                          ( axi6_awsize_const_net_0 ), // tied to 3'h0 from definition
        .axi6_awburst                         ( axi6_awburst_const_net_0 ), // tied to 2'h0 from definition
        .axi6_awlock                          ( axi6_awlock_const_net_0 ), // tied to 2'h0 from definition
        .axi6_awcache                         ( axi6_awcache_const_net_0 ), // tied to 4'h0 from definition
        .axi6_awprot                          ( axi6_awprot_const_net_0 ), // tied to 3'h0 from definition
        .axi6_awvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi6_wid                             ( axi6_wid_const_net_0 ), // tied to 6'h00 from definition
        .axi6_wdata                           ( axi6_wdata_const_net_0 ), // tied to 64'h0000000000000000 from definition
        .axi6_wstrb                           ( axi6_wstrb_const_net_0 ), // tied to 8'h00 from definition
        .axi6_wlast                           ( GND_net ), // tied to 1'b0 from definition
        .axi6_wvalid                          ( GND_net ), // tied to 1'b0 from definition
        .axi6_bready                          ( GND_net ), // tied to 1'b0 from definition
        .axi6_arid                            ( axi6_arid_const_net_0 ), // tied to 6'h00 from definition
        .axi6_araddr                          ( axi6_araddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi6_arlen                           ( axi6_arlen_const_net_0 ), // tied to 8'h00 from definition
        .axi6_arsize                          ( axi6_arsize_const_net_0 ), // tied to 3'h0 from definition
        .axi6_arburst                         ( axi6_arburst_const_net_0 ), // tied to 2'h0 from definition
        .axi6_arlock                          ( axi6_arlock_const_net_0 ), // tied to 2'h0 from definition
        .axi6_arcache                         ( axi6_arcache_const_net_0 ), // tied to 4'h0 from definition
        .axi6_arprot                          ( axi6_arprot_const_net_0 ), // tied to 3'h0 from definition
        .axi6_arvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi6_rready                          ( GND_net ), // tied to 1'b0 from definition
        .axi6_awusertag                       ( axi6_awusertag_const_net_0 ), // tied to 4'h0 from definition
        .l_r_req_p6                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_req_p6                           ( GND_net ), // tied to 1'b0 from definition
        .l_req_pri_p6                         ( l_req_pri_p6_const_net_0 ), // tied to 3'h0 from definition
        .l_addr_p6                            ( l_addr_p6_const_net_0 ), // tied to 37'h0000000000 from definition
        .l_b_size_p6                          ( l_b_size_p6_const_net_0 ), // tied to 11'h000 from definition
        .l_auto_pch_p6                        ( GND_net ), // tied to 1'b0 from definition
        .l_vport_id_p6                        ( GND_net ), // tied to 1'b0 from definition
        .l_req_tag_p6                         ( l_req_tag_p6_const_net_0 ), // tied to 52'h0000000000000 from definition
        .l_rd_wrap_p6                         ( GND_net ), // tied to 1'b0 from definition
        .l_datain_p6                          ( l_datain_p6_const_net_0 ), // tied to 128'h00000000000000000000000000000000 from definition
        .l_dm_in_p6                           ( l_dm_in_p6_const_net_0 ), // tied to 16'h0000 from definition
        .axi7_aclk                            ( GND_net ), // tied to 1'b0 from definition
        .axi7_aresetn                         ( GND_net ), // tied to 1'b0 from definition
        .axi7_awid                            ( axi7_awid_const_net_0 ), // tied to 6'h00 from definition
        .axi7_awaddr                          ( axi7_awaddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi7_awlen                           ( axi7_awlen_const_net_0 ), // tied to 8'h00 from definition
        .axi7_awsize                          ( axi7_awsize_const_net_0 ), // tied to 3'h0 from definition
        .axi7_awburst                         ( axi7_awburst_const_net_0 ), // tied to 2'h0 from definition
        .axi7_awlock                          ( axi7_awlock_const_net_0 ), // tied to 2'h0 from definition
        .axi7_awcache                         ( axi7_awcache_const_net_0 ), // tied to 4'h0 from definition
        .axi7_awprot                          ( axi7_awprot_const_net_0 ), // tied to 3'h0 from definition
        .axi7_awvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi7_wid                             ( axi7_wid_const_net_0 ), // tied to 6'h00 from definition
        .axi7_wdata                           ( axi7_wdata_const_net_0 ), // tied to 64'h0000000000000000 from definition
        .axi7_wstrb                           ( axi7_wstrb_const_net_0 ), // tied to 8'h00 from definition
        .axi7_wlast                           ( GND_net ), // tied to 1'b0 from definition
        .axi7_wvalid                          ( GND_net ), // tied to 1'b0 from definition
        .axi7_bready                          ( GND_net ), // tied to 1'b0 from definition
        .axi7_arid                            ( axi7_arid_const_net_0 ), // tied to 6'h00 from definition
        .axi7_araddr                          ( axi7_araddr_const_net_0 ), // tied to 32'h00000000 from definition
        .axi7_arlen                           ( axi7_arlen_const_net_0 ), // tied to 8'h00 from definition
        .axi7_arsize                          ( axi7_arsize_const_net_0 ), // tied to 3'h0 from definition
        .axi7_arburst                         ( axi7_arburst_const_net_0 ), // tied to 2'h0 from definition
        .axi7_arlock                          ( axi7_arlock_const_net_0 ), // tied to 2'h0 from definition
        .axi7_arcache                         ( axi7_arcache_const_net_0 ), // tied to 4'h0 from definition
        .axi7_arprot                          ( axi7_arprot_const_net_0 ), // tied to 3'h0 from definition
        .axi7_arvalid                         ( GND_net ), // tied to 1'b0 from definition
        .axi7_rready                          ( GND_net ), // tied to 1'b0 from definition
        .axi7_awusertag                       ( axi7_awusertag_const_net_0 ), // tied to 4'h0 from definition
        .l_r_req_p7                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_req_p7                           ( GND_net ), // tied to 1'b0 from definition
        .l_req_pri_p7                         ( l_req_pri_p7_const_net_0 ), // tied to 3'h0 from definition
        .l_addr_p7                            ( l_addr_p7_const_net_0 ), // tied to 37'h0000000000 from definition
        .l_b_size_p7                          ( l_b_size_p7_const_net_0 ), // tied to 11'h000 from definition
        .l_auto_pch_p7                        ( GND_net ), // tied to 1'b0 from definition
        .l_vport_id_p7                        ( GND_net ), // tied to 1'b0 from definition
        .l_req_tag_p7                         ( l_req_tag_p7_const_net_0 ), // tied to 52'h0000000000000 from definition
        .l_rd_wrap_p7                         ( GND_net ), // tied to 1'b0 from definition
        .l_datain_p7                          ( l_datain_p7_const_net_0 ), // tied to 128'h00000000000000000000000000000000 from definition
        .l_dm_in_p7                           ( l_dm_in_p7_const_net_0 ), // tied to 16'h0000 from definition
        .l_self_refresh                       ( l_self_refresh_const_net_0 ),
        .l_power_down                         ( l_power_down_const_net_0 ),
        .l_d_power_down                       ( GND_net ),
        .l_ref_req                            ( GND_net ),
        .l_zq_cal_req                         ( l_zq_cal_req_const_net_0 ),
        .l_ecc_err_gen_1_bit                  ( l_ecc_err_gen_1_bit_const_net_0 ), // tied to 8'h00 from definition
        .l_ecc_err_gen_2_bit                  ( l_ecc_err_gen_2_bit_const_net_0 ), // tied to 8'h00 from definition
        .cfg_manual_address_map               ( PF_DDR_CFG_INIT_0_cfg_manual_address_map ),
        .cfg_chipaddr_map                     ( PF_DDR_CFG_INIT_0_cfg_chipaddr_map ),
        .cfg_cidaddr_map                      ( PF_DDR_CFG_INIT_0_cfg_cidaddr_map ),
        .cfg_bankaddr_map                     ( PF_DDR_CFG_INIT_0_cfg_bankaddr_map ),
        .cfg_rowaddr_map                      ( PF_DDR_CFG_INIT_0_cfg_rowaddr_map ),
        .cfg_coladdr_map                      ( PF_DDR_CFG_INIT_0_cfg_coladdr_map ),
        .cfg_write_crc                        ( PF_DDR_CFG_INIT_0_cfg_write_crc ),
        .cfg_mpr_read_format                  ( PF_DDR_CFG_INIT_0_cfg_mpr_read_format ),
        .cfg_wr_cmd_lat_crc_dm                ( PF_DDR_CFG_INIT_0_cfg_wr_cmd_lat_crc_dm ),
        .cfg_fine_gran_ref_mode               ( PF_DDR_CFG_INIT_0_cfg_fine_gran_ref_mode ),
        .cfg_temp_sensor_readout              ( PF_DDR_CFG_INIT_0_cfg_temp_sensor_readout ),
        .cfg_per_dram_addr_en                 ( PF_DDR_CFG_INIT_0_cfg_per_dram_addr_en ),
        .cfg_geardown_mode                    ( PF_DDR_CFG_INIT_0_cfg_geardown_mode ),
        .cfg_wr_preamble                      ( PF_DDR_CFG_INIT_0_cfg_wr_preamble ),
        .cfg_rd_preamble                      ( PF_DDR_CFG_INIT_0_cfg_rd_preamble ),
        .cfg_rd_preamb_trn_mode               ( PF_DDR_CFG_INIT_0_cfg_rd_preamb_trn_mode ),
        .cfg_sr_abort                         ( PF_DDR_CFG_INIT_0_cfg_sr_abort ),
        .cfg_cs_to_cmdaddr_latency            ( PF_DDR_CFG_INIT_0_cfg_cs_to_cmdaddr_latency ),
        .cfg_int_vref_mon                     ( PF_DDR_CFG_INIT_0_cfg_int_vref_mon ),
        .cfg_temp_ctrl_ref_mode               ( PF_DDR_CFG_INIT_0_cfg_temp_ctrl_ref_mode ),
        .cfg_temp_ctrl_ref_range              ( PF_DDR_CFG_INIT_0_cfg_temp_ctrl_ref_range ),
        .cfg_max_pwr_down_mode                ( PF_DDR_CFG_INIT_0_cfg_max_pwr_down_mode ),
        .cfg_read_dbi                         ( PF_DDR_CFG_INIT_0_cfg_read_dbi ),
        .cfg_write_dbi                        ( PF_DDR_CFG_INIT_0_cfg_write_dbi ),
        .cfg_data_mask                        ( PF_DDR_CFG_INIT_0_cfg_data_mask ),
        .cfg_ca_parity_persist_err            ( PF_DDR_CFG_INIT_0_cfg_ca_parity_persist_err ),
        .cfg_rtt_park                         ( PF_DDR_CFG_INIT_0_cfg_rtt_park ),
        .cfg_odt_inbuf_4_pd                   ( PF_DDR_CFG_INIT_0_cfg_odt_inbuf_4_pd ),
        .cfg_ca_parity_err_status             ( PF_DDR_CFG_INIT_0_cfg_ca_parity_err_status ),
        .cfg_crc_error_clear                  ( PF_DDR_CFG_INIT_0_cfg_crc_error_clear ),
        .cfg_ca_parity_latency                ( PF_DDR_CFG_INIT_0_cfg_ca_parity_latency ),
        .cfg_ccd_s                            ( PF_DDR_CFG_INIT_0_cfg_ccd_s ),
        .cfg_ccd_l                            ( PF_DDR_CFG_INIT_0_cfg_ccd_l ),
        .cfg_vrefdq_trn_enable                ( PF_DDR_CFG_INIT_0_cfg_vrefdq_trn_enable ),
        .cfg_vrefdq_trn_range                 ( PF_DDR_CFG_INIT_0_cfg_vrefdq_trn_range ),
        .cfg_vrefdq_trn_value                 ( PF_DDR_CFG_INIT_0_cfg_vrefdq_trn_value ),
        .cfg_rrd_s                            ( PF_DDR_CFG_INIT_0_cfg_rrd_s ),
        .cfg_rrd_l                            ( PF_DDR_CFG_INIT_0_cfg_rrd_l ),
        .cfg_wtr_s                            ( PF_DDR_CFG_INIT_0_cfg_wtr_s ),
        .cfg_wtr_l                            ( PF_DDR_CFG_INIT_0_cfg_wtr_l ),
        .cfg_wtr_s_crc_dm                     ( PF_DDR_CFG_INIT_0_cfg_wtr_s_crc_dm ),
        .cfg_wtr_l_crc_dm                     ( PF_DDR_CFG_INIT_0_cfg_wtr_l_crc_dm ),
        .cfg_wr_crc_dm                        ( PF_DDR_CFG_INIT_0_cfg_wr_crc_dm ),
        .cfg_rfc1                             ( PF_DDR_CFG_INIT_0_cfg_rfc1 ),
        .cfg_rfc2                             ( PF_DDR_CFG_INIT_0_cfg_rfc2 ),
        .cfg_rfc4                             ( PF_DDR_CFG_INIT_0_cfg_rfc4 ),
        .cfg_nibble_devices                   ( PF_DDR_CFG_INIT_0_cfg_nibble_devices ),
        .cfg_bit_map_index_cs0                ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs023to0 ),
        .cfg_bit_map_index_cs1                ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs123to0 ),
        .cfg_bit_map_index_cs2                ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs223to0 ),
        .cfg_bit_map_index_cs3                ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs323to0 ),
        .cfg_bit_map_index_cs4                ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs423to0 ),
        .cfg_bit_map_index_cs5                ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs523to0 ),
        .cfg_bit_map_index_cs6                ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs623to0 ),
        .cfg_bit_map_index_cs7                ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs723to0 ),
        .cfg_bit_map_index_cs8                ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs823to0 ),
        .cfg_bit_map_index_cs9                ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs923to0 ),
        .cfg_bit_map_index_cs10               ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1023to0 ),
        .cfg_bit_map_index_cs11               ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1123to0 ),
        .cfg_bit_map_index_cs12               ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1223to0 ),
        .cfg_bit_map_index_cs13               ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1323to0 ),
        .cfg_bit_map_index_cs14               ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1423to0 ),
        .cfg_bit_map_index_cs15               ( PF_DDR_CFG_INIT_0_cfg_bit_map_index_cs1523to0 ),
        .cfg_num_logical_ranks_per_3ds        ( PF_DDR_CFG_INIT_0_cfg_num_logical_ranks_per_3ds ),
        .cfg_rfc_dlr1                         ( PF_DDR_CFG_INIT_0_cfg_rfc_dlr1 ),
        .cfg_rfc_dlr2                         ( PF_DDR_CFG_INIT_0_cfg_rfc_dlr2 ),
        .cfg_rfc_dlr4                         ( PF_DDR_CFG_INIT_0_cfg_rfc_dlr4 ),
        .cfg_rrd_dlr                          ( PF_DDR_CFG_INIT_0_cfg_rrd_dlr ),
        .cfg_faw_dlr                          ( PF_DDR_CFG_INIT_0_cfg_faw_dlr ),
        .cfg_lookahead_pch                    ( PF_DDR_CFG_INIT_0_cfg_lookahead_pch ),
        .cfg_lookahead_act                    ( PF_DDR_CFG_INIT_0_cfg_lookahead_act ),
        .init_autoinit_disable                ( GND_net ),
        .init_force_reset                     ( GND_net ),
        .init_geardown_en                     ( GND_net ),
        .init_disable_cke                     ( GND_net ),
        .init_cs                              ( init_cs_const_net_0 ),
        .init_precharge_all                   ( GND_net ),
        .init_refresh                         ( GND_net ),
        .init_zq_cal_req                      ( GND_net ),
        .cfg_bl                               ( PF_DDR_CFG_INIT_0_cfg_bl ),
        .ctrlr_soft_reset_n                   ( VCC_net ),
        .ctrlr_init                           ( GND_net ),
        .cfg_auto_ref_en                      ( PF_DDR_CFG_INIT_0_cfg_auto_ref_en ),
        .cfg_ras                              ( PF_DDR_CFG_INIT_0_cfg_ras ),
        .cfg_rcd                              ( PF_DDR_CFG_INIT_0_cfg_rcd ),
        .cfg_rrd                              ( PF_DDR_CFG_INIT_0_cfg_rrd ),
        .cfg_rp                               ( PF_DDR_CFG_INIT_0_cfg_rp ),
        .cfg_rc                               ( PF_DDR_CFG_INIT_0_cfg_rc ),
        .cfg_faw                              ( PF_DDR_CFG_INIT_0_cfg_faw ),
        .cfg_rfc                              ( PF_DDR_CFG_INIT_0_cfg_rfc ),
        .cfg_rtp                              ( PF_DDR_CFG_INIT_0_cfg_rtp ),
        .cfg_wr                               ( PF_DDR_CFG_INIT_0_cfg_wr ),
        .cfg_wtr                              ( PF_DDR_CFG_INIT_0_cfg_wtr ),
        .cfg_pasr                             ( PF_DDR_CFG_INIT_0_cfg_pasr ),
        .cfg_xp                               ( PF_DDR_CFG_INIT_0_cfg_xp ),
        .cfg_xsr                              ( PF_DDR_CFG_INIT_0_cfg_xsr ),
        .cfg_cl                               ( PF_DDR_CFG_INIT_0_cfg_cl ),
        .cfg_read_to_write                    ( PF_DDR_CFG_INIT_0_cfg_read_to_write ),
        .cfg_write_to_write                   ( PF_DDR_CFG_INIT_0_cfg_write_to_write ),
        .cfg_read_to_read                     ( PF_DDR_CFG_INIT_0_cfg_read_to_read ),
        .cfg_write_to_read                    ( PF_DDR_CFG_INIT_0_cfg_write_to_read ),
        .cfg_read_to_write_odt                ( PF_DDR_CFG_INIT_0_cfg_read_to_write_odt ),
        .cfg_write_to_write_odt               ( PF_DDR_CFG_INIT_0_cfg_write_to_write_odt ),
        .cfg_read_to_read_odt                 ( PF_DDR_CFG_INIT_0_cfg_read_to_read_odt ),
        .cfg_write_to_read_odt                ( PF_DDR_CFG_INIT_0_cfg_write_to_read_odt ),
        .cfg_min_read_idle                    ( PF_DDR_CFG_INIT_0_cfg_min_read_idle ),
        .cfg_bt                               ( PF_DDR_CFG_INIT_0_cfg_bt ),
        .cfg_ds                               ( PF_DDR_CFG_INIT_0_cfg_ds ),
        .cfg_qoff                             ( PF_DDR_CFG_INIT_0_cfg_qoff ),
        .cfg_rtt                              ( PF_DDR_CFG_INIT_0_cfg_rtt ),
        .cfg_dll_disable                      ( PF_DDR_CFG_INIT_0_cfg_dll_disable ),
        .cfg_ref_per                          ( PF_DDR_CFG_INIT_0_cfg_ref_per ),
        .cfg_startup_delay                    ( PF_DDR_CFG_INIT_0_cfg_startup_delay ),
        .cfg_mem_colbits                      ( PF_DDR_CFG_INIT_0_cfg_mem_colbits ),
        .cfg_mem_rowbits                      ( PF_DDR_CFG_INIT_0_cfg_mem_rowbits ),
        .cfg_mem_bankbits                     ( PF_DDR_CFG_INIT_0_cfg_mem_bankbits ),
        .cfg_odt_rd_map_cs0                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs0 ),
        .cfg_odt_rd_map_cs1                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs1 ),
        .cfg_odt_rd_map_cs2                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs2 ),
        .cfg_odt_rd_map_cs3                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs3 ),
        .cfg_odt_rd_map_cs4                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs4 ),
        .cfg_odt_rd_map_cs5                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs5 ),
        .cfg_odt_rd_map_cs6                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs6 ),
        .cfg_odt_rd_map_cs7                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs7 ),
        .cfg_odt_wr_map_cs0                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs0 ),
        .cfg_odt_wr_map_cs1                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs1 ),
        .cfg_odt_wr_map_cs2                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs2 ),
        .cfg_odt_wr_map_cs3                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs3 ),
        .cfg_odt_wr_map_cs4                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs4 ),
        .cfg_odt_wr_map_cs5                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs5 ),
        .cfg_odt_wr_map_cs6                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs6 ),
        .cfg_odt_wr_map_cs7                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs7 ),
        .cfg_odt_rd_turn_on                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_turn_on ),
        .cfg_odt_wr_turn_on                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_turn_on ),
        .cfg_odt_rd_turn_off                  ( PF_DDR_CFG_INIT_0_cfg_odt_rd_turn_off ),
        .cfg_odt_wr_turn_off                  ( PF_DDR_CFG_INIT_0_cfg_odt_wr_turn_off ),
        .cfg_emr3                             ( PF_DDR_CFG_INIT_0_cfg_emr3 ),
        .cfg_two_t                            ( PF_DDR_CFG_INIT_0_cfg_two_t ),
        .cfg_two_t_sel_cycle                  ( PF_DDR_CFG_INIT_0_cfg_two_t_sel_cycle ),
        .cfg_regdimm                          ( PF_DDR_CFG_INIT_0_cfg_regdimm ),
        .cfg_mod                              ( PF_DDR_CFG_INIT_0_cfg_mod ),
        .cfg_xs                               ( PF_DDR_CFG_INIT_0_cfg_xs ),
        .cfg_xsdll                            ( PF_DDR_CFG_INIT_0_cfg_xsdll ),
        .cfg_xpr                              ( PF_DDR_CFG_INIT_0_cfg_xpr ),
        .cfg_al_mode                          ( PF_DDR_CFG_INIT_0_cfg_al_mode ),
        .cfg_cwl                              ( PF_DDR_CFG_INIT_0_cfg_cwl ),
        .cfg_bl_mode                          ( PF_DDR_CFG_INIT_0_cfg_bl_mode ),
        .cfg_tdqs                             ( PF_DDR_CFG_INIT_0_cfg_tdqs ),
        .cfg_rtt_wr                           ( PF_DDR_CFG_INIT_0_cfg_rtt_wr ),
        .cfg_lp_asr                           ( PF_DDR_CFG_INIT_0_cfg_lp_asr ),
        .cfg_auto_sr                          ( PF_DDR_CFG_INIT_0_cfg_auto_sr ),
        .cfg_srt                              ( PF_DDR_CFG_INIT_0_cfg_srt ),
        .cfg_addr_mirror                      ( PF_DDR_CFG_INIT_0_cfg_addr_mirror ),
        .cfg_zq_cal_type                      ( PF_DDR_CFG_INIT_0_cfg_zq_cal_type ),
        .cfg_zq_cal_per                       ( PF_DDR_CFG_INIT_0_cfg_zq_cal_per ),
        .cfg_auto_zq_cal_en                   ( PF_DDR_CFG_INIT_0_cfg_auto_zq_cal_en ),
        .cfg_memory_type                      ( PF_DDR_CFG_INIT_0_cfg_memory_type ),
        .cfg_only_srank_cmds                  ( PF_DDR_CFG_INIT_0_cfg_only_srank_cmds ),
        .cfg_num_ranks                        ( PF_DDR_CFG_INIT_0_cfg_num_ranks ),
        .cfg_quad_rank                        ( PF_DDR_CFG_INIT_0_cfg_quad_rank ),
        .cfg_early_rank_to_wr_start           ( PF_DDR_CFG_INIT_0_cfg_early_rank_to_wr_start ),
        .cfg_early_rank_to_rd_start           ( PF_DDR_CFG_INIT_0_cfg_early_rank_to_rd_start ),
        .cfg_pasr_bank                        ( PF_DDR_CFG_INIT_0_cfg_pasr_bank ),
        .cfg_pasr_seg                         ( PF_DDR_CFG_INIT_0_cfg_pasr_seg ),
        .init_mrr_mode                        ( GND_net ),
        .init_mr_w_req                        ( GND_net ),
        .init_mr_addr                         ( init_mr_addr_const_net_0 ),
        .init_mr_wr_data                      ( init_mr_wr_data_const_net_0 ),
        .init_mr_wr_mask                      ( init_mr_wr_mask_const_net_0 ),
        .init_nop                             ( GND_net ),
        .cfg_init_duration                    ( PF_DDR_CFG_INIT_0_cfg_init_duration ),
        .cfg_zqinit_cal_duration              ( PF_DDR_CFG_INIT_0_cfg_zqinit_cal_duration ),
        .cfg_zq_cal_l_duration                ( PF_DDR_CFG_INIT_0_cfg_zq_cal_l_duration ),
        .cfg_zq_cal_s_duration                ( PF_DDR_CFG_INIT_0_cfg_zq_cal_s_duration ),
        .cfg_zq_cal_r_duration                ( PF_DDR_CFG_INIT_0_cfg_zq_cal_r_duration ),
        .cfg_mrr                              ( PF_DDR_CFG_INIT_0_cfg_mrr ),
        .cfg_mrw                              ( PF_DDR_CFG_INIT_0_cfg_mrw ),
        .cfg_odt_powerdown                    ( PF_DDR_CFG_INIT_0_cfg_odt_powerdown ),
        .cfg_wl                               ( PF_DDR_CFG_INIT_0_cfg_wl ),
        .cfg_rl                               ( PF_DDR_CFG_INIT_0_cfg_rl ),
        .cfg_cal_read_period                  ( PF_DDR_CFG_INIT_0_cfg_cal_read_period ),
        .cfg_num_cal_reads                    ( PF_DDR_CFG_INIT_0_cfg_num_cal_reads ),
        .init_self_refresh                    ( init_self_refresh_const_net_0 ),
        .init_power_down                      ( init_power_down_const_net_0 ),
        .init_force_write                     ( GND_net ),
        .init_force_write_cs                  ( init_force_write_cs_const_net_0 ),
        .cfg_ctrlr_init_disable               ( PF_DDR_CFG_INIT_0_cfg_ctrlr_init_disable ),
        .init_rdimm_complete                  ( GND_net ),
        .cfg_rdimm_lat                        ( PF_DDR_CFG_INIT_0_cfg_rdimm_lat ),
        .cfg_rdimm_bside_invert               ( PF_DDR_CFG_INIT_0_cfg_rdimm_bside_invert ),
        .cfg_lrdimm                           ( PF_DDR_CFG_INIT_0_cfg_lrdimm ),
        .init_memory_reset_mask               ( GND_net ),
        .init_cal_select                      ( GND_net ),
        .init_cal_l_r_req                     ( GND_net ),
        .init_cal_l_b_size                    ( init_cal_l_b_size_const_net_0 ),
        .init_read_capture_addr               ( init_read_capture_addr_const_net_0 ),
        .init_read_capture_addr_wr_en         ( GND_net ),
        .init_force_write_data                ( init_force_write_data_const_net_0 ),
        .init_read_capture_data_rd_en         ( GND_net ),
        .init_cal_l_addr                      ( init_cal_l_addr_const_net_0 ),
        .cfg_ctrlupd_trig                     ( PF_DDR_CFG_INIT_0_cfg_ctrlupd_trig ),
        .cfg_ctrlupd_start_delay              ( PF_DDR_CFG_INIT_0_cfg_ctrlupd_start_delay ),
        .cfg_dfi_t_ctrlupd_max                ( PF_DDR_CFG_INIT_0_cfg_dfi_t_ctrlupd_max ),
        .cfg_ctrlr_busy_sel                   ( PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_sel ),
        .cfg_ctrlr_busy_value                 ( PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_value ),
        .cfg_ctrlr_busy_turn_off_delay        ( PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_turn_off_delay ),
        .cfg_ctrlr_busy_slow_restart_window   ( PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_slow_restart_window ),
        .cfg_ctrlr_busy_restart_holdoff       ( PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_restart_holdoff ),
        .cfg_parity_rdimm_delay               ( PF_DDR_CFG_INIT_0_cfg_parity_rdimm_delay ),
        .cfg_ctrlr_busy_enable                ( PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_enable ),
        .cfg_async_odt                        ( PF_DDR_CFG_INIT_0_cfg_async_odt ),
        .cfg_mrri                             ( PF_DDR_CFG_INIT_0_cfg_mrri ),
        .init_odt_force_en                    ( GND_net ),
        .init_odt_force_rank                  ( init_odt_force_rank_const_net_0 ),
        .cfg_phyupd_ack_delay                 ( PF_DDR_CFG_INIT_0_cfg_phyupd_ack_delay ),
        .cfg_mirror_x16_bg0_bg1               ( PF_DDR_CFG_INIT_0_cfg_mirror_x16_bg0_bg1 ),
        .init_pda_mr_w_req                    ( GND_net ),
        .init_pda_nibble_select               ( init_pda_nibble_select_const_net_0 ),
        .cfg_dram_clk_disable_in_self_refresh ( PF_DDR_CFG_INIT_0_cfg_dram_clk_disable_in_self_refresh ),
        .cfg_cksre                            ( PF_DDR_CFG_INIT_0_cfg_cksre ),
        .cfg_cksrx                            ( PF_DDR_CFG_INIT_0_cfg_cksrx ),
        .cfg_rcd_stab                         ( PF_DDR_CFG_INIT_0_cfg_rcd_stab ),
        .cfg_dfi_t_ctrl_delay                 ( PF_DDR_CFG_INIT_0_cfg_dfi_t_ctrl_delay ),
        .cfg_dfi_t_dram_clk_enable            ( PF_DDR_CFG_INIT_0_cfg_dfi_t_dram_clk_enable ),
        .cfg_idle_time_to_self_refresh        ( PF_DDR_CFG_INIT_0_cfg_idle_time_to_self_refresh ),
        .cfg_idle_time_to_power_down          ( PF_DDR_CFG_INIT_0_cfg_idle_time_to_power_down ),
        .cfg_pre_trig_cycs                    ( PF_DDR_CFG_INIT_0_cfg_pre_trig_cycs ),
        .cfg_data_sel_first_error             ( PF_DDR_CFG_INIT_0_cfg_data_sel_first_error ),
        .cfg_starve_timeout_p0                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p0 ),
        .cfg_starve_timeout_p1                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p1 ),
        .cfg_starve_timeout_p2                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p2 ),
        .cfg_starve_timeout_p3                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p3 ),
        .cfg_starve_timeout_p4                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p4 ),
        .cfg_starve_timeout_p5                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p5 ),
        .cfg_starve_timeout_p6                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p6 ),
        .cfg_starve_timeout_p7                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p7 ),
        .cfg_dm_en                            ( PF_DDR_CFG_INIT_0_cfg_dm_en ),
        .cfg_rmw_en                           ( PF_DDR_CFG_INIT_0_cfg_rmw_en ),
        .cfg_ecc_correction_en                ( PF_DDR_CFG_INIT_0_cfg_ecc_correction_en ),
        .cfg_dfi_t_rddata_en                  ( PF_DDR_CFG_INIT_0_cfg_dfi_t_rddata_en ),
        .cfg_dfi_t_phy_rdlat                  ( PF_DDR_CFG_INIT_0_cfg_dfi_t_phy_rdlat ),
        .cfg_dfi_t_phy_wrlat                  ( PF_DDR_CFG_INIT_0_cfg_dfi_t_phy_wrlat ),
        .cfg_dfi_phyupd_en                    ( PF_DDR_CFG_INIT_0_cfg_dfi_phyupd_en ),
        .unused_port                          ( GND_net ),
        .phy_reset_control                    ( phy_reset_control_const_net_0 ),
        .phy_pc_rank                          ( phy_pc_rank_const_net_0 ),
        .phy_ranks_to_train                   ( phy_ranks_to_train_const_net_0 ),
        .phy_write_request                    ( GND_net ),
        .phy_read_request                     ( GND_net ),
        .phy_write_level_delay                ( phy_write_level_delay_const_net_0 ),
        .phy_gate_train_delay                 ( PF_DDR_CFG_INIT_0_phy_gate_train_delay ),
        .phy_eye_train_delay                  ( PF_DDR_CFG_INIT_0_phy_eye_train_delay ),
        .phy_eye_pat                          ( phy_eye_pat_const_net_0 ),
        .phy_start_recal                      ( GND_net ),
        .phy_clr_dfi_lvl_periodic             ( GND_net ),
        .phy_train_step_enable                ( PF_DDR_CFG_INIT_0_phy_train_step_enable ),
        .phy_lpddr_dq_cal_pat                 ( GND_net ),
        .phy_dfi_init_start                   ( VCC_net ),
        .phy_indpndt_training                 ( GND_net ),
        .phy_encoded_quad_cs                  ( GND_net ),
        .phy_half_clk_dly_enable              ( GND_net ),
        .dfi_clk_ext                          ( SYS_CLK_net_0 ),
        .dfi_alert_n_a0_ext                   ( GND_net ),
        .dfi_alert_n_a1_ext                   ( GND_net ),
        .dfi_alert_n_a2_ext                   ( GND_net ),
        .dfi_alert_n_a3_ext                   ( GND_net ),
        .dfi_rddata_valid_w0_ext              ( DDRPHY_BLK_0_DFI_RDDATA_VALID_W0 ),
        .dfi_rddata_valid_w1_ext              ( DDRPHY_BLK_0_DFI_RDDATA_VALID_W1 ),
        .dfi_rddata_valid_w2_ext              ( DDRPHY_BLK_0_DFI_RDDATA_VALID_W2 ),
        .dfi_rddata_valid_w3_ext              ( DDRPHY_BLK_0_DFI_RDDATA_VALID_W3 ),
        .dfi_rddata_w0_ext                    ( DDRPHY_BLK_0_DFI_RDDATA_W0 ),
        .dfi_rddata_w1_ext                    ( DDRPHY_BLK_0_DFI_RDDATA_W1 ),
        .dfi_rddata_w2_ext                    ( DDRPHY_BLK_0_DFI_RDDATA_W2 ),
        .dfi_rddata_w3_ext                    ( DDRPHY_BLK_0_DFI_RDDATA_W3 ),
        .dfi_phyupd_req_ext                   ( DDRPHY_BLK_0_DFI_PHYUPD_REQ ),
        .dfi_phyupd_type_ext                  ( DDRPHY_BLK_0_DFI_PHYUPD_TYPE ),
        .dfi_ctrlupd_ack_ext                  ( DDRPHY_BLK_0_DFI_CTRLUPD_ACK ),
        .dfi_rddata_dbi_w0_ext                ( dfi_rddata_dbi_w0_ext_const_net_0 ),
        .dfi_rddata_dbi_w1_ext                ( dfi_rddata_dbi_w1_ext_const_net_0 ),
        .dfi_rddata_dbi_w2_ext                ( dfi_rddata_dbi_w2_ext_const_net_0 ),
        .dfi_rddata_dbi_w3_ext                ( dfi_rddata_dbi_w3_ext_const_net_0 ),
        .dfi_init_complete_ext                ( DDRPHY_BLK_0_DFI_INIT_COMPLETE ),
        .dfi_wrlvl_resp_ext                   ( DDRPHY_BLK_0_DFI_WRLVL_RESP ),
        .dfi_rdlvl_resp_ext                   ( DDRPHY_BLK_0_DFI_RDLVL_RESP ),
        .dfi_calvl_resp_ext                   ( DDRPHY_BLK_0_DFI_CALVL_RESP ),
        .dfi_calvl_train_done_ext             ( DDRPHY_BLK_0_DFI_CALVL_TRAIN_DONE ),
        .dfi_lp_ack_ext                       ( GND_net ),
        .dfi_error_ext                        ( GND_net ),
        .dfi_error_info_ext                   ( dfi_error_info_ext_const_net_0 ),
        .dfi_training_complete_ext            ( DDRPHY_BLK_0_DFI_TRAINING_COMPLETE ),
        .cfg_mb_autopch_col_bit_pos_low       ( PF_DDR_CFG_INIT_0_cfg_mb_autopch_col_bit_pos_low ),
        .cfg_mb_autopch_col_bit_pos_high      ( PF_DDR_CFG_INIT_0_cfg_mb_autopch_col_bit_pos_high ),
        .cfg_bg_interleave                    ( PF_DDR_CFG_INIT_0_cfg_bg_interleave ),
        .cfg_dfi_lvl_sel                      ( PF_DDR_CFG_INIT_0_cfg_dfi_lvl_sel ),
        .cfg_dfi_lvl_periodic                 ( PF_DDR_CFG_INIT_0_cfg_dfi_lvl_periodic ),
        .cfg_dfi_lvl_pattern                  ( PF_DDR_CFG_INIT_0_cfg_dfi_lvl_pattern ),
        .cfg_burst_rw_refresh_holdoff         ( PF_DDR_CFG_INIT_0_cfg_burst_rw_refresh_holdoff ),
        .cfg_error_group_sel                  ( PF_DDR_CFG_INIT_0_cfg_error_group_sel ),
        .cfg_data_sel                         ( PF_DDR_CFG_INIT_0_cfg_data_sel ),
        .cfg_trig_mode                        ( PF_DDR_CFG_INIT_0_cfg_trig_mode ),
        .cfg_post_trig_cycs                   ( PF_DDR_CFG_INIT_0_cfg_post_trig_cycs ),
        .cfg_trig_mask                        ( PF_DDR_CFG_INIT_0_cfg_trig_mask ),
        .cfg_en_mask                          ( PF_DDR_CFG_INIT_0_cfg_en_mask ),
        .cfg_dfi_data_byte_disable            ( PF_DDR_CFG_INIT_0_cfg_dfi_data_byte_disable1to0 ),
        .init_dfi_dram_clk_disable            ( init_dfi_dram_clk_disable_const_net_0 ),
        .init_dfi_lp_data_req                 ( GND_net ),
        .init_dfi_lp_ctrl_req                 ( GND_net ),
        .init_dfi_lp_wakeup                   ( init_dfi_lp_wakeup_const_net_0 ),
        .cfg_mpfe_auto_pch                    ( cfg_mpfe_auto_pch_const_net_0 ),
        .cfg_ecc_bypass                       ( GND_net ),
        .init_write_data_1b_ecc_error_gen     ( init_write_data_1b_ecc_error_gen_const_net_0 ),
        .init_write_data_2b_ecc_error_gen     ( init_write_data_2b_ecc_error_gen_const_net_0 ),
        .l_w_rmw                              ( GND_net ), // tied to 1'b0 from definition
        .l_w_rmw_p0                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_rmw_p1                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_rmw_p2                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_rmw_p3                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_rmw_p4                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_rmw_p5                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_rmw_p6                           ( GND_net ), // tied to 1'b0 from definition
        .l_w_rmw_p7                           ( GND_net ), // tied to 1'b0 from definition
        .ext_cal_select                       ( DDRPHY_BLK_0_CAL_SELECT ),
        .ext_cal_l_r_req                      ( DDRPHY_BLK_0_CAL_L_R_REQ ),
        .ext_cal_l_w_req                      ( DDRPHY_BLK_0_CAL_L_W_REQ ),
        .ext_cal_l_addr                       ( ext_cal_l_addr_const_net_0 ),
        .ext_cal_l_b_size                     ( ext_cal_l_b_size_const_net_0 ),
        .ext_cal_l_auto_pch                   ( GND_net ),
        .ext_cal_cfg_auto_zq_cal_en           ( GND_net ),
        .ext_cal_cfg_auto_ref_en              ( VCC_net ),
        .ext_cal_l_datain                     ( DDRPHY_BLK_0_CAL_L_DATAIN ),
        .ext_cal_l_dm_in                      ( DDRPHY_BLK_0_CAL_L_DM_IN ),
        // Outputs
        .l_busy                               (  ),
        .l_r_valid                            (  ),
        .l_d_req                              (  ),
        .axi0_awready                         ( AXI4slave0_AWREADY ),
        .axi0_wready                          ( AXI4slave0_WREADY ),
        .axi0_bid                             ( AXI4slave0_BID ),
        .axi0_bresp                           ( AXI4slave0_BRESP ),
        .axi0_bvalid                          ( AXI4slave0_BVALID ),
        .axi0_arready                         ( AXI4slave0_ARREADY ),
        .axi0_rid                             ( AXI4slave0_RID ),
        .axi0_rdata                           ( AXI4slave0_RDATA ),
        .axi0_rresp                           ( AXI4slave0_RRESP ),
        .axi0_rlast                           ( AXI4slave0_RLAST ),
        .axi0_rvalid                          ( AXI4slave0_RVALID ),
        .axi0_busertag                        (  ),
        .l_busy_p0                            (  ),
        .l_r_valid_p0                         (  ),
        .l_r_valid_last_p0                    (  ),
        .l_d_req_p0                           (  ),
        .l_d_req_last_p0                      (  ),
        .axi1_awready                         (  ),
        .axi1_wready                          (  ),
        .axi1_bid                             (  ),
        .axi1_bresp                           (  ),
        .axi1_bvalid                          (  ),
        .axi1_arready                         (  ),
        .axi1_rid                             (  ),
        .axi1_rdata                           (  ),
        .axi1_rresp                           (  ),
        .axi1_rlast                           (  ),
        .axi1_rvalid                          (  ),
        .axi1_busertag                        (  ),
        .l_busy_p1                            (  ),
        .l_r_valid_p1                         (  ),
        .l_r_valid_last_p1                    (  ),
        .l_d_req_p1                           (  ),
        .l_d_req_last_p1                      (  ),
        .axi2_awready                         (  ),
        .axi2_wready                          (  ),
        .axi2_bid                             (  ),
        .axi2_bresp                           (  ),
        .axi2_bvalid                          (  ),
        .axi2_arready                         (  ),
        .axi2_rid                             (  ),
        .axi2_rdata                           (  ),
        .axi2_rresp                           (  ),
        .axi2_rlast                           (  ),
        .axi2_rvalid                          (  ),
        .axi2_busertag                        (  ),
        .l_busy_p2                            (  ),
        .l_r_valid_p2                         (  ),
        .l_r_valid_last_p2                    (  ),
        .l_d_req_p2                           (  ),
        .l_d_req_last_p2                      (  ),
        .axi3_awready                         (  ),
        .axi3_wready                          (  ),
        .axi3_bid                             (  ),
        .axi3_bresp                           (  ),
        .axi3_bvalid                          (  ),
        .axi3_arready                         (  ),
        .axi3_rid                             (  ),
        .axi3_rdata                           (  ),
        .axi3_rresp                           (  ),
        .axi3_rlast                           (  ),
        .axi3_rvalid                          (  ),
        .axi3_busertag                        (  ),
        .l_busy_p3                            (  ),
        .l_r_valid_p3                         (  ),
        .l_r_valid_last_p3                    (  ),
        .l_d_req_p3                           (  ),
        .l_d_req_last_p3                      (  ),
        .axi4_awready                         (  ),
        .axi4_wready                          (  ),
        .axi4_bid                             (  ),
        .axi4_bresp                           (  ),
        .axi4_bvalid                          (  ),
        .axi4_arready                         (  ),
        .axi4_rid                             (  ),
        .axi4_rdata                           (  ),
        .axi4_rresp                           (  ),
        .axi4_rlast                           (  ),
        .axi4_rvalid                          (  ),
        .axi4_busertag                        (  ),
        .l_busy_p4                            (  ),
        .l_r_valid_p4                         (  ),
        .l_r_valid_last_p4                    (  ),
        .l_d_req_p4                           (  ),
        .l_d_req_last_p4                      (  ),
        .axi5_awready                         (  ),
        .axi5_wready                          (  ),
        .axi5_bid                             (  ),
        .axi5_bresp                           (  ),
        .axi5_bvalid                          (  ),
        .axi5_arready                         (  ),
        .axi5_rid                             (  ),
        .axi5_rdata                           (  ),
        .axi5_rresp                           (  ),
        .axi5_rlast                           (  ),
        .axi5_rvalid                          (  ),
        .axi5_busertag                        (  ),
        .l_busy_p5                            (  ),
        .l_r_valid_p5                         (  ),
        .l_r_valid_last_p5                    (  ),
        .l_d_req_p5                           (  ),
        .l_d_req_last_p5                      (  ),
        .axi6_awready                         (  ),
        .axi6_wready                          (  ),
        .axi6_bid                             (  ),
        .axi6_bresp                           (  ),
        .axi6_bvalid                          (  ),
        .axi6_arready                         (  ),
        .axi6_rid                             (  ),
        .axi6_rdata                           (  ),
        .axi6_rresp                           (  ),
        .axi6_rlast                           (  ),
        .axi6_rvalid                          (  ),
        .axi6_busertag                        (  ),
        .l_busy_p6                            (  ),
        .l_r_valid_p6                         (  ),
        .l_r_valid_last_p6                    (  ),
        .l_d_req_p6                           (  ),
        .l_d_req_last_p6                      (  ),
        .axi7_awready                         (  ),
        .axi7_wready                          (  ),
        .axi7_bid                             (  ),
        .axi7_bresp                           (  ),
        .axi7_bvalid                          (  ),
        .axi7_arready                         (  ),
        .axi7_rid                             (  ),
        .axi7_rdata                           (  ),
        .axi7_rresp                           (  ),
        .axi7_rlast                           (  ),
        .axi7_rvalid                          (  ),
        .axi7_busertag                        (  ),
        .l_busy_p7                            (  ),
        .l_r_valid_p7                         (  ),
        .l_r_valid_last_p7                    (  ),
        .l_d_req_p7                           (  ),
        .l_d_req_last_p7                      (  ),
        .l_d_req_tag                          (  ),
        .l_r_valid_tag                        (  ),
        .l_ref_ack                            (  ),
        .l_activate_ready                     (  ),
        .l_queue_level                        (  ),
        .l_zq_cal_ack                         (  ),
        .l_dataout                            (  ),
        .l_ecc_check_dataout                  (  ),
        .mpfe_status                          (  ),
        .ecc_error_1bit                       (  ),
        .ecc_error_2bit                       (  ),
        .ecc_error_pos                        (  ),
        .ecc_rmw_error                        (  ),
        .ecc_error_addr                       (  ),
        .init_ack                             (  ),
        .ctrlr_init_done                      (  ),
        .init_self_refresh_status             (  ),
        .init_power_down_status               (  ),
        .ctrlr_ready                          ( DDRCTRL_0_ctrlr_ready ),
        .init_rdimm_ready                     (  ),
        .init_cal_l_r_ack                     (  ),
        .init_cal_l_read_complete             (  ),
        .init_read_capture_data               (  ),
        .init_refresh_count                   (  ),
        .stat_ca_parity_error                 (  ),
        .phy_write_request_done               (  ),
        .phy_read_request_done                (  ),
        .reset_n_ext                          (  ),
        .phy_half_clk_dly_enable_ext          (  ),
        .dfi_ctrlr_busy_ext                   (  ),
        .dfi_reset_n_p0_ext                   ( DDRCTRL_0_dfi_reset_n_p0_ext ),
        .dfi_reset_n_p1_ext                   ( DDRCTRL_0_dfi_reset_n_p1_ext ),
        .dfi_reset_n_p2_ext                   ( DDRCTRL_0_dfi_reset_n_p2_ext ),
        .dfi_reset_n_p3_ext                   ( DDRCTRL_0_dfi_reset_n_p3_ext ),
        .dfi_address_p0_ext                   ( dfi_address_p0_ext_net_0 ),
        .dfi_address_p1_ext                   ( dfi_address_p1_ext_net_0 ),
        .dfi_address_p2_ext                   ( dfi_address_p2_ext_net_0 ),
        .dfi_address_p3_ext                   ( dfi_address_p3_ext_net_0 ),
        .dfi_bank_p0_ext                      ( dfi_bank_p0_ext_net_0 ),
        .dfi_bank_p1_ext                      ( dfi_bank_p1_ext_net_0 ),
        .dfi_bank_p2_ext                      ( dfi_bank_p2_ext_net_0 ),
        .dfi_bank_p3_ext                      ( dfi_bank_p3_ext_net_0 ),
        .dfi_cs_n_p0_ext                      ( DDRCTRL_0_dfi_cs_n_p0_ext ),
        .dfi_cs_n_p1_ext                      ( DDRCTRL_0_dfi_cs_n_p1_ext ),
        .dfi_cs_n_p2_ext                      ( DDRCTRL_0_dfi_cs_n_p2_ext ),
        .dfi_cs_n_p3_ext                      ( DDRCTRL_0_dfi_cs_n_p3_ext ),
        .dfi_cke_p0_ext                       ( DDRCTRL_0_dfi_cke_p0_ext ),
        .dfi_cke_p1_ext                       ( DDRCTRL_0_dfi_cke_p1_ext ),
        .dfi_cke_p2_ext                       ( DDRCTRL_0_dfi_cke_p2_ext ),
        .dfi_cke_p3_ext                       ( DDRCTRL_0_dfi_cke_p3_ext ),
        .dfi_odt_p0_ext                       ( DDRCTRL_0_dfi_odt_p0_ext ),
        .dfi_odt_p1_ext                       ( DDRCTRL_0_dfi_odt_p1_ext ),
        .dfi_odt_p2_ext                       ( DDRCTRL_0_dfi_odt_p2_ext ),
        .dfi_odt_p3_ext                       ( DDRCTRL_0_dfi_odt_p3_ext ),
        .dfi_ras_n_p0_ext                     ( DDRCTRL_0_dfi_ras_n_p0_ext ),
        .dfi_ras_n_p1_ext                     ( DDRCTRL_0_dfi_ras_n_p1_ext ),
        .dfi_ras_n_p2_ext                     ( DDRCTRL_0_dfi_ras_n_p2_ext ),
        .dfi_ras_n_p3_ext                     ( DDRCTRL_0_dfi_ras_n_p3_ext ),
        .dfi_cas_n_p0_ext                     ( DDRCTRL_0_dfi_cas_n_p0_ext ),
        .dfi_cas_n_p1_ext                     ( DDRCTRL_0_dfi_cas_n_p1_ext ),
        .dfi_cas_n_p2_ext                     ( DDRCTRL_0_dfi_cas_n_p2_ext ),
        .dfi_cas_n_p3_ext                     ( DDRCTRL_0_dfi_cas_n_p3_ext ),
        .dfi_we_n_p0_ext                      ( DDRCTRL_0_dfi_we_n_p0_ext ),
        .dfi_we_n_p1_ext                      ( DDRCTRL_0_dfi_we_n_p1_ext ),
        .dfi_we_n_p2_ext                      ( DDRCTRL_0_dfi_we_n_p2_ext ),
        .dfi_we_n_p3_ext                      ( DDRCTRL_0_dfi_we_n_p3_ext ),
        .dfi_bg_p0_ext                        (  ),
        .dfi_bg_p1_ext                        (  ),
        .dfi_bg_p2_ext                        (  ),
        .dfi_bg_p3_ext                        (  ),
        .dfi_cid_p0_ext                       (  ),
        .dfi_cid_p1_ext                       (  ),
        .dfi_cid_p2_ext                       (  ),
        .dfi_cid_p3_ext                       (  ),
        .dfi_act_n_p0_ext                     (  ),
        .dfi_act_n_p1_ext                     (  ),
        .dfi_act_n_p2_ext                     (  ),
        .dfi_act_n_p3_ext                     (  ),
        .dfi_parity_in_p0_ext                 (  ),
        .dfi_parity_in_p1_ext                 (  ),
        .dfi_parity_in_p2_ext                 (  ),
        .dfi_parity_in_p3_ext                 (  ),
        .dfi_wrdata_cs_n_p0_ext               ( DDRCTRL_0_dfi_wrdata_cs_n_p0_ext ),
        .dfi_wrdata_cs_n_p1_ext               ( DDRCTRL_0_dfi_wrdata_cs_n_p1_ext ),
        .dfi_wrdata_cs_n_p2_ext               ( DDRCTRL_0_dfi_wrdata_cs_n_p2_ext ),
        .dfi_wrdata_cs_n_p3_ext               ( DDRCTRL_0_dfi_wrdata_cs_n_p3_ext ),
        .dfi_wrdata_en_p0_ext                 ( DDRCTRL_0_dfi_wrdata_en_p0_ext ),
        .dfi_wrdata_en_p1_ext                 ( DDRCTRL_0_dfi_wrdata_en_p1_ext ),
        .dfi_wrdata_en_p2_ext                 ( DDRCTRL_0_dfi_wrdata_en_p2_ext ),
        .dfi_wrdata_en_p3_ext                 ( DDRCTRL_0_dfi_wrdata_en_p3_ext ),
        .dfi_wrdata_mask_p0_ext               ( DDRCTRL_0_dfi_wrdata_mask_p0_ext ),
        .dfi_wrdata_mask_p1_ext               ( DDRCTRL_0_dfi_wrdata_mask_p1_ext ),
        .dfi_wrdata_mask_p2_ext               ( DDRCTRL_0_dfi_wrdata_mask_p2_ext ),
        .dfi_wrdata_mask_p3_ext               ( DDRCTRL_0_dfi_wrdata_mask_p3_ext ),
        .dfi_wrdata_p0_ext                    ( DDRCTRL_0_dfi_wrdata_p0_ext ),
        .dfi_wrdata_p1_ext                    ( DDRCTRL_0_dfi_wrdata_p1_ext ),
        .dfi_wrdata_p2_ext                    ( DDRCTRL_0_dfi_wrdata_p2_ext ),
        .dfi_wrdata_p3_ext                    ( DDRCTRL_0_dfi_wrdata_p3_ext ),
        .dfi_rddata_cs_n_p0_ext               ( DDRCTRL_0_dfi_rddata_cs_n_p0_ext ),
        .dfi_rddata_cs_n_p1_ext               ( DDRCTRL_0_dfi_rddata_cs_n_p1_ext ),
        .dfi_rddata_cs_n_p2_ext               ( DDRCTRL_0_dfi_rddata_cs_n_p2_ext ),
        .dfi_rddata_cs_n_p3_ext               ( DDRCTRL_0_dfi_rddata_cs_n_p3_ext ),
        .dfi_rddata_en_p0_ext                 ( DDRCTRL_0_dfi_rddata_en_p0_ext ),
        .dfi_rddata_en_p1_ext                 ( DDRCTRL_0_dfi_rddata_en_p1_ext ),
        .dfi_rddata_en_p2_ext                 ( DDRCTRL_0_dfi_rddata_en_p2_ext ),
        .dfi_rddata_en_p3_ext                 ( DDRCTRL_0_dfi_rddata_en_p3_ext ),
        .dfi_phyupd_ack_ext                   ( DDRCTRL_0_dfi_phyupd_ack_ext ),
        .dfi_ctrlupd_req_ext                  ( DDRCTRL_0_dfi_ctrlupd_req_ext ),
        .dfi_geardown_en_ext                  (  ),
        .dfi_dram_clk_disable_ext             (  ),
        .dfi_data_byte_disable_ext            (  ),
        .dfi_init_start_ext                   ( DDRCTRL_0_dfi_init_start_ext ),
        .dfi_wrlvl_cs_n_ext                   ( DDRCTRL_0_dfi_wrlvl_cs_n_ext ),
        .dfi_wrlvl_en_ext                     ( DDRCTRL_0_dfi_wrlvl_en_ext ),
        .dfi_wrlvl_strobe_ext                 ( DDRCTRL_0_dfi_wrlvl_strobe_ext ),
        .dfi_rdlvl_cs_n_ext                   ( DDRCTRL_0_dfi_rdlvl_cs_n_ext ),
        .dfi_rdlvl_en_ext                     ( DDRCTRL_0_dfi_rdlvl_en_ext ),
        .dfi_rdlvl_gate_en_ext                ( DDRCTRL_0_dfi_rdlvl_gate_en_ext ),
        .dfi_calvl_en_ext                     ( DDRCTRL_0_dfi_calvl_en_ext ),
        .dfi_calvl_capture_ext                ( DDRCTRL_0_dfi_calvl_capture_ext ),
        .dfi_calvl_start_ext                  ( DDRCTRL_0_dfi_calvl_start_ext ),
        .dfi_calvl_bg_pattern_ext             ( DDRCTRL_0_dfi_calvl_bg_pattern_ext ),
        .dfi_calvl_trn_command_ext            ( DDRCTRL_0_dfi_calvl_trn_command_ext ),
        .dfi_calvl_disable_cke_ext            (  ),
        .dfi_lp_wakeup_ext                    (  ),
        .dfi_lp_data_req_ext                  (  ),
        .dfi_lp_ctrl_req_ext                  (  ),
        .dfi_lvl_periodic_ext                 ( DDRCTRL_0_dfi_lvl_periodic_ext ),
        .dfi_lvl_pattern_ext                  ( DDRCTRL_0_dfi_lvl_pattern_ext ),
        .ctrlr_init_done_ext                  (  ),
        .cfg_nibble_devices_ext               (  ),
        .cfg_memory_type_ext                  (  ),
        .cfg_regdimm_ext                      (  ),
        .cfg_bl_ext                           (  ),
        .cfg_dfi_t_phy_rdlat_ext              (  ),
        .cfg_dfi_phyupd_en_ext                (  ),
        .l_clk                                (  ),
        .stat_dfi_lp_ack                      (  ),
        .stat_dfi_training_error              (  ),
        .stat_dfi_error                       (  ),
        .stat_dfi_init_complete               (  ),
        .stat_dfi_training_complete           (  ),
        .stat_dfi_error_info                  (  ),
        .ext_cal_l_busy                       ( DDRCTRL_0_ext_cal_l_busy ),
        .ext_cal_l_d_req                      ( DDRCTRL_0_ext_cal_l_d_req ),
        .ext_cal_l_dataout                    ( DDRCTRL_0_ext_cal_l_dataout ),
        .ext_cal_l_r_valid                    ( DDRCTRL_0_ext_cal_l_r_valid ) 
        );

//--------PF_DDR3_SS_DDRPHY_BLK
PF_DDR3_SS_DDRPHY_BLK DDRPHY_BLK_0(
        // Inputs
        .SYS_CLK                    ( SYS_CLK_net_0 ),
        .SYS_RST_N                  ( SYS_RESET_N ),
        .HS_IO_CLK                  ( CCC_0_OUT2_HS_IO_CLK_0 ),
        .REF_CLK                    ( CCC_0_OUT0_0 ),
        .PLL_LOCK                   ( PLL_LOCK_net_0 ),
        .HS_IO_CLK_270              ( CCC_0_OUT3_HS_IO_CLK_0 ),
        .DLL_CODE                   ( DLL_0_DLL_CODE ),
        .DLL_DLY_DIFF               ( GND_net ),
        .DFI_RESET_N_P0             ( DDRCTRL_0_dfi_reset_n_p0_ext ),
        .DFI_ADDRESS_P0             ( DDRCTRL_0_dfi_address_p0_ext15to0 ),
        .DFI_BANK_P0                ( DDRCTRL_0_dfi_bank_p0_ext2to0 ),
        .DFI_CS_N_P0                ( DDRCTRL_0_dfi_cs_n_p0_ext ),
        .DFI_ODT_P0                 ( DDRCTRL_0_dfi_odt_p0_ext ),
        .DFI_CKE_P0                 ( DDRCTRL_0_dfi_cke_p0_ext ),
        .DFI_RAS_N_P0               ( DDRCTRL_0_dfi_ras_n_p0_ext ),
        .DFI_CAS_N_P0               ( DDRCTRL_0_dfi_cas_n_p0_ext ),
        .DFI_WE_N_P0                ( DDRCTRL_0_dfi_we_n_p0_ext ),
        .DFI_RESET_N_P1             ( DDRCTRL_0_dfi_reset_n_p1_ext ),
        .DFI_ADDRESS_P1             ( DDRCTRL_0_dfi_address_p1_ext15to0 ),
        .DFI_BANK_P1                ( DDRCTRL_0_dfi_bank_p1_ext2to0 ),
        .DFI_CS_N_P1                ( DDRCTRL_0_dfi_cs_n_p1_ext ),
        .DFI_ODT_P1                 ( DDRCTRL_0_dfi_odt_p1_ext ),
        .DFI_CKE_P1                 ( DDRCTRL_0_dfi_cke_p1_ext ),
        .DFI_RAS_N_P1               ( DDRCTRL_0_dfi_ras_n_p1_ext ),
        .DFI_CAS_N_P1               ( DDRCTRL_0_dfi_cas_n_p1_ext ),
        .DFI_WE_N_P1                ( DDRCTRL_0_dfi_we_n_p1_ext ),
        .DFI_RESET_N_P2             ( DDRCTRL_0_dfi_reset_n_p2_ext ),
        .DFI_ADDRESS_P2             ( DDRCTRL_0_dfi_address_p2_ext15to0 ),
        .DFI_BANK_P2                ( DDRCTRL_0_dfi_bank_p2_ext2to0 ),
        .DFI_CS_N_P2                ( DDRCTRL_0_dfi_cs_n_p2_ext ),
        .DFI_ODT_P2                 ( DDRCTRL_0_dfi_odt_p2_ext ),
        .DFI_CKE_P2                 ( DDRCTRL_0_dfi_cke_p2_ext ),
        .DFI_RAS_N_P2               ( DDRCTRL_0_dfi_ras_n_p2_ext ),
        .DFI_CAS_N_P2               ( DDRCTRL_0_dfi_cas_n_p2_ext ),
        .DFI_WE_N_P2                ( DDRCTRL_0_dfi_we_n_p2_ext ),
        .DFI_RESET_N_P3             ( DDRCTRL_0_dfi_reset_n_p3_ext ),
        .DFI_ADDRESS_P3             ( DDRCTRL_0_dfi_address_p3_ext15to0 ),
        .DFI_BANK_P3                ( DDRCTRL_0_dfi_bank_p3_ext2to0 ),
        .DFI_CS_N_P3                ( DDRCTRL_0_dfi_cs_n_p3_ext ),
        .DFI_ODT_P3                 ( DDRCTRL_0_dfi_odt_p3_ext ),
        .DFI_CKE_P3                 ( DDRCTRL_0_dfi_cke_p3_ext ),
        .DFI_RAS_N_P3               ( DDRCTRL_0_dfi_ras_n_p3_ext ),
        .DFI_CAS_N_P3               ( DDRCTRL_0_dfi_cas_n_p3_ext ),
        .DFI_WE_N_P3                ( DDRCTRL_0_dfi_we_n_p3_ext ),
        .DFI_WRDATA_EN_P0           ( DFI_WRDATA_EN_P0_net_0 ),
        .DFI_WRDATA_MASK_P0         ( DDRCTRL_0_dfi_wrdata_mask_p0_ext ),
        .DFI_WRDATA_P0              ( DDRCTRL_0_dfi_wrdata_p0_ext ),
        .DFI_WRDATA_CS_N_P0         ( DDRCTRL_0_dfi_wrdata_cs_n_p0_ext ),
        .DFI_WRDATA_EN_P1           ( DFI_WRDATA_EN_P1_net_0 ),
        .DFI_WRDATA_MASK_P1         ( DDRCTRL_0_dfi_wrdata_mask_p1_ext ),
        .DFI_WRDATA_P1              ( DDRCTRL_0_dfi_wrdata_p1_ext ),
        .DFI_WRDATA_CS_N_P1         ( DDRCTRL_0_dfi_wrdata_cs_n_p1_ext ),
        .DFI_WRDATA_EN_P2           ( DFI_WRDATA_EN_P2_net_0 ),
        .DFI_WRDATA_MASK_P2         ( DDRCTRL_0_dfi_wrdata_mask_p2_ext ),
        .DFI_WRDATA_P2              ( DDRCTRL_0_dfi_wrdata_p2_ext ),
        .DFI_WRDATA_CS_N_P2         ( DDRCTRL_0_dfi_wrdata_cs_n_p2_ext ),
        .DFI_WRDATA_EN_P3           ( DFI_WRDATA_EN_P3_net_0 ),
        .DFI_WRDATA_MASK_P3         ( DDRCTRL_0_dfi_wrdata_mask_p3_ext ),
        .DFI_WRDATA_P3              ( DDRCTRL_0_dfi_wrdata_p3_ext ),
        .DFI_WRDATA_CS_N_P3         ( DDRCTRL_0_dfi_wrdata_cs_n_p3_ext ),
        .DFI_RDDATA_EN_P0           ( DFI_RDDATA_EN_P0_net_0 ),
        .DFI_RDDATA_CS_N_P0         ( DDRCTRL_0_dfi_rddata_cs_n_p0_ext ),
        .DFI_RDDATA_EN_P1           ( DFI_RDDATA_EN_P1_net_0 ),
        .DFI_RDDATA_CS_N_P1         ( DDRCTRL_0_dfi_rddata_cs_n_p1_ext ),
        .DFI_RDDATA_EN_P2           ( DFI_RDDATA_EN_P2_net_0 ),
        .DFI_RDDATA_CS_N_P2         ( DDRCTRL_0_dfi_rddata_cs_n_p2_ext ),
        .DFI_RDDATA_EN_P3           ( DFI_RDDATA_EN_P3_net_0 ),
        .DFI_RDDATA_CS_N_P3         ( DDRCTRL_0_dfi_rddata_cs_n_p3_ext ),
        .DFI_RDLVL_EN               ( DDRCTRL_0_dfi_rdlvl_en_ext ),
        .DFI_RDLVL_GATE_EN          ( DDRCTRL_0_dfi_rdlvl_gate_en_ext ),
        .DFI_RDLVL_CS_N             ( DDRCTRL_0_dfi_rdlvl_cs_n_ext ),
        .DFI_CALVL_EN               ( DDRCTRL_0_dfi_calvl_en_ext ),
        .DFI_CALVL_START            ( DDRCTRL_0_dfi_calvl_start_ext ),
        .DFI_CALVL_CAPTURE          ( DDRCTRL_0_dfi_calvl_capture_ext ),
        .DFI_CALVL_BG_PATTERN       ( DDRCTRL_0_dfi_calvl_bg_pattern_ext ),
        .DFI_CALVL_TRN_COMMAND      ( DDRCTRL_0_dfi_calvl_trn_command_ext ),
        .DFI_WRLVL_EN               ( DDRCTRL_0_dfi_wrlvl_en_ext ),
        .DFI_WRLVL_CS_N             ( DDRCTRL_0_dfi_wrlvl_cs_n_ext ),
        .DFI_WRLVL_STROBE           ( DDRCTRL_0_dfi_wrlvl_strobe_ext ),
        .DFI_LVL_PERIODIC           ( DDRCTRL_0_dfi_lvl_periodic_ext ),
        .DFI_LVL_PATTERN            ( DDRCTRL_0_dfi_lvl_pattern_ext ),
        .DFI_INIT_START             ( DDRCTRL_0_dfi_init_start_ext ),
        .DFI_CTRLUPD_REQ            ( DDRCTRL_0_dfi_ctrlupd_req_ext ),
        .DFI_PHYUPD_ACK             ( DDRCTRL_0_dfi_phyupd_ack_ext ),
        .SKIP_DQSW_TRN              ( VCC_net ),
        .SKIP_BCLK_TRN              ( GND_net ),
        .SKIP_CA_TRN                ( GND_net ),
        .SKIP_WRLVL_TRN             ( GND_net ),
        .SKIP_RDLVL_TRN             ( GND_net ),
        .ADDR_VCOPHS_OFFSET         ( ADDR_VCOPHS_OFFSET_const_net_0 ),
        .BCLK_VCOPHS_OFFSET         ( BCLK_VCOPHS_OFFSET_const_net_0 ),
        .WRLVL_TAP_OFFSET           ( WRLVL_TAP_OFFSET_const_net_0 ),
        .PADDR                      ( PADDR_const_net_0 ), // tied to 16'h0000 from definition
        .PENABLE                    ( GND_net ), // tied to 1'b0 from definition
        .PWRITE                     ( GND_net ), // tied to 1'b0 from definition
        .PWDATA                     ( PWDATA_const_net_0 ), // tied to 8'h00 from definition
        .PSEL                       ( GND_net ), // tied to 1'b0 from definition
        .PCLK                       ( GND_net ),
        .CTRLR_READY_IN             ( DDRCTRL_0_ctrlr_ready ),
        .ADDR_WAIT_COUNT            ( PF_DDR_CFG_INIT_0_ADDR_WAIT_COUNT ),
        .WRCAL_WRITE_COUNTER_VALUE  ( PF_DDR_CFG_INIT_0_WRCAL_WRITE_COUNTER_VALUE ),
        .RDGATE_MIN_READS_THRESHOLD ( PF_DDR_CFG_INIT_0_RDGATE_MIN_READS_THRESHOLD ),
        .CAL_L_BUSY                 ( DDRCTRL_0_ext_cal_l_busy ),
        .CAL_L_D_REQ                ( DDRCTRL_0_ext_cal_l_d_req ),
        .CAL_L_DATAOUT              ( DDRCTRL_0_ext_cal_l_dataout ),
        .CAL_L_R_VALID              ( DDRCTRL_0_ext_cal_l_r_valid ),
        // Outputs
        .CODE_UPDATE                (  ),
        .LOADPHS_B                  ( DDRPHY_BLK_0_LOADPHS_B ),
        .VCO_PHSEL_BCLK_SEL         ( DDRPHY_BLK_0_VCO_PHSEL_BCLK_SEL ),
        .VCO_PHSEL_BCLK90_SEL       ( DDRPHY_BLK_0_VCO_PHSEL_BCLK90_SEL ),
        .VCO_PHSEL_REFCLK_SEL       ( DDRPHY_BLK_0_VCO_PHSEL_REFCLK_SEL ),
        .VCO_PHSEL_ROTATE           ( DDRPHY_BLK_0_VCO_PHSEL_ROTATE ),
        .DFI_RDDATA_W0              ( DDRPHY_BLK_0_DFI_RDDATA_W0 ),
        .DFI_RDDATA_VALID_W0        ( DDRPHY_BLK_0_DFI_RDDATA_VALID_W0 ),
        .DFI_RDDATA_W1              ( DDRPHY_BLK_0_DFI_RDDATA_W1 ),
        .DFI_RDDATA_VALID_W1        ( DDRPHY_BLK_0_DFI_RDDATA_VALID_W1 ),
        .DFI_RDDATA_W2              ( DDRPHY_BLK_0_DFI_RDDATA_W2 ),
        .DFI_RDDATA_VALID_W2        ( DDRPHY_BLK_0_DFI_RDDATA_VALID_W2 ),
        .DFI_RDDATA_W3              ( DDRPHY_BLK_0_DFI_RDDATA_W3 ),
        .DFI_RDDATA_VALID_W3        ( DDRPHY_BLK_0_DFI_RDDATA_VALID_W3 ),
        .DFI_RDLVL_RESP             ( DDRPHY_BLK_0_DFI_RDLVL_RESP ),
        .DFI_CALVL_RESP             ( DDRPHY_BLK_0_DFI_CALVL_RESP ),
        .DFI_CALVL_TRAIN_DONE       ( DDRPHY_BLK_0_DFI_CALVL_TRAIN_DONE ),
        .DFI_WRLVL_RESP             ( DDRPHY_BLK_0_DFI_WRLVL_RESP ),
        .DFI_INIT_COMPLETE          ( DDRPHY_BLK_0_DFI_INIT_COMPLETE ),
        .DFI_TRAINING_COMPLETE      ( DDRPHY_BLK_0_DFI_TRAINING_COMPLETE ),
        .DFI_CTRLUPD_ACK            ( DDRPHY_BLK_0_DFI_CTRLUPD_ACK ),
        .DFI_PHYUPD_REQ             ( DDRPHY_BLK_0_DFI_PHYUPD_REQ ),
        .DFI_PHYUPD_TYPE            ( DDRPHY_BLK_0_DFI_PHYUPD_TYPE ),
        .DM                         ( DM_net_0 ),
        .CKE                        ( CKE_net_0 ),
        .CS_N                       ( CS_N_net_0 ),
        .ODT                        ( ODT_net_0 ),
        .RAS_N                      ( RAS_N_net_0 ),
        .CAS_N                      ( CAS_N_net_0 ),
        .WE_N                       ( WE_N_net_0 ),
        .BA                         ( BA_net_0 ),
        .RESET_N                    ( RESET_N_net_0 ),
        .A                          ( A_net_0 ),
        .CK0                        ( CK0_net_0 ),
        .CK0_N                      ( CK0_N_net_0 ),
        .SHIELD0                    ( SHIELD0_net_0 ),
        .SHIELD1                    ( SHIELD1_net_0 ),
        .PRDATA                     (  ),
        .PREADY                     (  ),
        .CTRLR_READY_OUT            ( CTRLR_READY_net_0 ),
        .ITER_COUNT                 (  ),
        .CAL_L_R_REQ                ( DDRPHY_BLK_0_CAL_L_R_REQ ),
        .CAL_L_W_REQ                ( DDRPHY_BLK_0_CAL_L_W_REQ ),
        .CAL_L_DATAIN               ( DDRPHY_BLK_0_CAL_L_DATAIN ),
        .CAL_L_DM_IN                ( DDRPHY_BLK_0_CAL_L_DM_IN ),
        .CAL_SELECT                 ( DDRPHY_BLK_0_CAL_SELECT ),
        .SYNC_SYS_RST_N             ( DDRPHY_BLK_0_SYNC_SYS_RST_N ),
        // Inouts
        .DQ                         ( DQ ),
        .DQS                        ( DQS ),
        .DQS_N                      ( DQS_N ) 
        );

//--------PF_DDR3_SS_DLL_0_PF_CCC   -   Actel:SgCore:PF_CCC:2.2.100
PF_DDR3_SS_DLL_0_PF_CCC DLL_0(
        // Inputs
        .DLL_REF_CLK     ( GND_net ),
        .DLL_CODE_UPDATE ( GND_net ),
        .DLL_POWERDOWN_N ( GND_net ),
        // Outputs
        .DLL_CODE        ( DLL_0_DLL_CODE ),
        .DLL_LOCK        (  ),
        .DLL_DELAY_DIFF  (  ) 
        );

//--------PF_DDR_CFG_INIT   -   Actel:SgCore:PF_DDR_CFG_INIT:1.0.100
PF_DDR_CFG_INIT #( 
        .DEF_ADDR_VCOPHS_OFFSET                   ( 0 ),
        .DEF_ADDR_VCOPHS_OFFSET_SIM               ( 0 ),
        .DEF_ADDR_WAIT_COUNT                      ( 1023 ),
        .DEF_ADDR_WAIT_COUNT_SIM                  ( 2 ),
        .DEF_AXI0_CFG_AXI_END_ADDRESS             ( 4294967295 ),
        .DEF_AXI0_CFG_AXI_START_ADDRESS           ( 0 ),
        .DEF_AXI0_CFG_ENABLE_BUS_HOLD             ( 0 ),
        .DEF_AXI0_CFG_MEM_START_ADDRESS           ( 0 ),
        .DEF_CFG_ADDR_MIRROR                      ( 0 ),
        .DEF_CFG_AL_MODE                          ( 0 ),
        .DEF_CFG_ASYNC_ODT                        ( 0 ),
        .DEF_CFG_AUTO_REF_EN                      ( 1 ),
        .DEF_CFG_AUTO_SR                          ( 0 ),
        .DEF_CFG_AUTO_ZQ_CAL_EN                   ( 0 ),
        .DEF_CFG_BANKADDR_MAP                     ( 54027 ),
        .DEF_CFG_BG_INTERLEAVE                    ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS0                ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS1                ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS2                ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS3                ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS4                ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS5                ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS6                ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS7                ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS8                ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS9                ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS10               ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS11               ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS12               ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS13               ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS14               ( 0 ),
        .DEF_CFG_BIT_MAP_INDEX_CS15               ( 0 ),
        .DEF_CFG_BL                               ( 0 ),
        .DEF_CFG_BL_MODE                          ( 0 ),
        .DEF_CFG_BT                               ( 0 ),
        .DEF_CFG_BURST_RW_REFRESH_HOLDOFF         ( 0 ),
        .DEF_CFG_CA_PARITY_ERR_STATUS             ( 0 ),
        .DEF_CFG_CA_PARITY_LATENCY                ( 0 ),
        .DEF_CFG_CA_PARITY_PERSIST_ERR            ( 0 ),
        .DEF_CFG_CAL_READ_PERIOD                  ( 0 ),
        .DEF_CFG_CCD_L                            ( 0 ),
        .DEF_CFG_CCD_S                            ( 0 ),
        .DEF_CFG_CHIPADDR_MAP                     ( 30 ),
        .DEF_CFG_CIDADDR_MAP                      ( 0 ),
        .DEF_CFG_CKSRE                            ( 0 ),
        .DEF_CFG_CKSRX                            ( 0 ),
        .DEF_CFG_CL                               ( 9 ),
        .DEF_CFG_COLADDR_MAP_0                    ( 67903552 ),
        .DEF_CFG_COLADDR_MAP_1                    ( 75613716 ),
        .DEF_CFG_COLADDR_MAP_2                    ( 162 ),
        .DEF_CFG_COLADDR_MAP_3                    ( 0 ),
        .DEF_CFG_CRC_ERROR_CLEAR                  ( 0 ),
        .DEF_CFG_CS_TO_CMDADDR_LATENCY            ( 0 ),
        .DEF_CFG_CTRLR_BUSY_ENABLE                ( 0 ),
        .DEF_CFG_CTRLR_BUSY_RESTART_HOLDOFF       ( 0 ),
        .DEF_CFG_CTRLR_BUSY_SEL                   ( 0 ),
        .DEF_CFG_CTRLR_BUSY_SLOW_RESTART_WINDOW   ( 0 ),
        .DEF_CFG_CTRLR_BUSY_TURN_OFF_DELAY        ( 0 ),
        .DEF_CFG_CTRLR_BUSY_VALUE                 ( 0 ),
        .DEF_CFG_CTRLR_INIT_DISABLE               ( 0 ),
        .DEF_CFG_CTRLUPD_START_DELAY              ( 0 ),
        .DEF_CFG_CTRLUPD_TRIG                     ( 0 ),
        .DEF_CFG_CWL                              ( 7 ),
        .DEF_CFG_DATA_MASK                        ( 1 ),
        .DEF_CFG_DATA_SEL                         ( 0 ),
        .DEF_CFG_DATA_SEL_FIRST_ERROR             ( 0 ),
        .DEF_CFG_DFI_DATA_BYTE_DISABLE            ( 0 ),
        .DEF_CFG_DFI_LVL_PATTERN                  ( 0 ),
        .DEF_CFG_DFI_LVL_PERIODIC                 ( 0 ),
        .DEF_CFG_DFI_LVL_SEL                      ( 0 ),
        .DEF_CFG_DFI_PHYUPD_EN                    ( 0 ),
        .DEF_CFG_DFI_T_CTRL_DELAY                 ( 0 ),
        .DEF_CFG_DFI_T_CTRLUPD_MAX                ( 0 ),
        .DEF_CFG_DFI_T_DRAM_CLK_ENABLE            ( 0 ),
        .DEF_CFG_DFI_T_PHY_RDLAT                  ( 5 ),
        .DEF_CFG_DFI_T_PHY_WRLAT                  ( 4 ),
        .DEF_CFG_DFI_T_PHY_WRLAT_SIM              ( 4 ),
        .DEF_CFG_DFI_T_RDDATA_EN                  ( 28 ),
        .DEF_CFG_DFI_T_RDDATA_EN_SIM              ( 28 ),
        .DEF_CFG_DLL_DISABLE                      ( 0 ),
        .DEF_CFG_DM_EN                            ( 1 ),
        .DEF_CFG_DRAM_CLK_DISABLE_IN_SELF_REFRESH ( 0 ),
        .DEF_CFG_DS                               ( 0 ),
        .DEF_CFG_EARLY_RANK_TO_RD_START           ( 0 ),
        .DEF_CFG_EARLY_RANK_TO_WR_START           ( 0 ),
        .DEF_CFG_ECC_CORRECTION_EN                ( 0 ),
        .DEF_CFG_EMR3                             ( 0 ),
        .DEF_CFG_EN_MASK                          ( 0 ),
        .DEF_CFG_ERROR_GROUP_SEL                  ( 0 ),
        .DEF_CFG_FAW                              ( 20 ),
        .DEF_CFG_FAW_DLR                          ( 0 ),
        .DEF_CFG_FINE_GRAN_REF_MODE               ( 0 ),
        .DEF_CFG_GEARDOWN_MODE                    ( 0 ),
        .DEF_CFG_IDLE_TIME_TO_POWER_DOWN          ( 0 ),
        .DEF_CFG_IDLE_TIME_TO_SELF_REFRESH        ( 0 ),
        .DEF_CFG_INIT_DURATION                    ( 0 ),
        .DEF_CFG_INT_VREF_MON                     ( 0 ),
        .DEF_CFG_LOOKAHEAD_ACT                    ( 0 ),
        .DEF_CFG_LOOKAHEAD_PCH                    ( 0 ),
        .DEF_CFG_LP_ASR                           ( 0 ),
        .DEF_CFG_LRDIMM                           ( 0 ),
        .DEF_CFG_MANUAL_ADDRESS_MAP               ( 0 ),
        .DEF_CFG_MAX_PWR_DOWN_MODE                ( 0 ),
        .DEF_CFG_MB_AUTOPCH_COL_BIT_POS_HIGH      ( 0 ),
        .DEF_CFG_MB_AUTOPCH_COL_BIT_POS_LOW       ( 0 ),
        .DEF_CFG_MEM_BANKBITS                     ( 3 ),
        .DEF_CFG_MEM_COLBITS                      ( 11 ),
        .DEF_CFG_MEM_ROWBITS                      ( 16 ),
        .DEF_CFG_MEMORY_TYPE                      ( 8 ),
        .DEF_CFG_MIN_READ_IDLE                    ( 1 ),
        .DEF_CFG_MIRROR_X16_BG0_BG1               ( 0 ),
        .DEF_CFG_MOD                              ( 12 ),
        .DEF_CFG_MPR_READ_FORMAT                  ( 0 ),
        .DEF_CFG_MRR                              ( 0 ),
        .DEF_CFG_MRRI                             ( 0 ),
        .DEF_CFG_MRW                              ( 0 ),
        .DEF_CFG_NIBBLE_DEVICES                   ( 0 ),
        .DEF_CFG_NUM_CAL_READS                    ( 1 ),
        .DEF_CFG_NUM_LOGICAL_RANKS_PER_3DS        ( 0 ),
        .DEF_CFG_NUM_RANKS                        ( 1 ),
        .DEF_CFG_ODT_INBUF_4_PD                   ( 0 ),
        .DEF_CFG_ODT_POWERDOWN                    ( 0 ),
        .DEF_CFG_ODT_RD_MAP_CS0                   ( 0 ),
        .DEF_CFG_ODT_RD_MAP_CS1                   ( 0 ),
        .DEF_CFG_ODT_RD_MAP_CS2                   ( 0 ),
        .DEF_CFG_ODT_RD_MAP_CS3                   ( 0 ),
        .DEF_CFG_ODT_RD_MAP_CS4                   ( 0 ),
        .DEF_CFG_ODT_RD_MAP_CS5                   ( 0 ),
        .DEF_CFG_ODT_RD_MAP_CS6                   ( 0 ),
        .DEF_CFG_ODT_RD_MAP_CS7                   ( 0 ),
        .DEF_CFG_ODT_RD_TURN_OFF                  ( 0 ),
        .DEF_CFG_ODT_RD_TURN_ON                   ( 0 ),
        .DEF_CFG_ODT_WR_MAP_CS0                   ( 1 ),
        .DEF_CFG_ODT_WR_MAP_CS1                   ( 2 ),
        .DEF_CFG_ODT_WR_MAP_CS2                   ( 0 ),
        .DEF_CFG_ODT_WR_MAP_CS3                   ( 0 ),
        .DEF_CFG_ODT_WR_MAP_CS4                   ( 0 ),
        .DEF_CFG_ODT_WR_MAP_CS5                   ( 0 ),
        .DEF_CFG_ODT_WR_MAP_CS6                   ( 0 ),
        .DEF_CFG_ODT_WR_MAP_CS7                   ( 0 ),
        .DEF_CFG_ODT_WR_TURN_OFF                  ( 0 ),
        .DEF_CFG_ODT_WR_TURN_ON                   ( 0 ),
        .DEF_CFG_ONLY_SRANK_CMDS                  ( 0 ),
        .DEF_CFG_PARITY_RDIMM_DELAY               ( 0 ),
        .DEF_CFG_PASR                             ( 0 ),
        .DEF_CFG_PASR_BANK                        ( 0 ),
        .DEF_CFG_PASR_SEG                         ( 0 ),
        .DEF_CFG_PER_DRAM_ADDR_EN                 ( 0 ),
        .DEF_CFG_PHYUPD_ACK_DELAY                 ( 0 ),
        .DEF_CFG_POST_TRIG_CYCS                   ( 0 ),
        .DEF_CFG_PRE_TRIG_CYCS                    ( 0 ),
        .DEF_CFG_QOFF                             ( 0 ),
        .DEF_CFG_QUAD_RANK                        ( 0 ),
        .DEF_CFG_RAS                              ( 24 ),
        .DEF_CFG_RC                               ( 33 ),
        .DEF_CFG_RCD                              ( 9 ),
        .DEF_CFG_RCD_STAB                         ( 0 ),
        .DEF_CFG_RD_PREAMB_TRN_MODE               ( 0 ),
        .DEF_CFG_RD_PREAMBLE                      ( 0 ),
        .DEF_CFG_RDIMM_BSIDE_INVERT               ( 0 ),
        .DEF_CFG_RDIMM_LAT                        ( 0 ),
        .DEF_CFG_READ_DBI                         ( 0 ),
        .DEF_CFG_READ_TO_READ                     ( 1 ),
        .DEF_CFG_READ_TO_READ_ODT                 ( 1 ),
        .DEF_CFG_READ_TO_WRITE                    ( 1 ),
        .DEF_CFG_READ_TO_WRITE_ODT                ( 1 ),
        .DEF_CFG_REF_PER                          ( 5200 ),
        .DEF_CFG_REGDIMM                          ( 0 ),
        .DEF_CFG_RFC                              ( 234 ),
        .DEF_CFG_RFC1                             ( 0 ),
        .DEF_CFG_RFC2                             ( 0 ),
        .DEF_CFG_RFC4                             ( 0 ),
        .DEF_CFG_RFC_DLR1                         ( 0 ),
        .DEF_CFG_RFC_DLR2                         ( 0 ),
        .DEF_CFG_RFC_DLR4                         ( 0 ),
        .DEF_CFG_RL                               ( 0 ),
        .DEF_CFG_RMW_EN                           ( 0 ),
        .DEF_CFG_ROWADDR_MAP_0                    ( 38077390 ),
        .DEF_CFG_ROWADDR_MAP_1                    ( 224744525 ),
        .DEF_CFG_ROWADDR_MAP_2                    ( 114976133 ),
        .DEF_CFG_ROWADDR_MAP_3                    ( 1884 ),
        .DEF_CFG_RP                               ( 9 ),
        .DEF_CFG_RRD                              ( 5 ),
        .DEF_CFG_RRD_DLR                          ( 0 ),
        .DEF_CFG_RRD_L                            ( 0 ),
        .DEF_CFG_RRD_S                            ( 0 ),
        .DEF_CFG_RTP                              ( 5 ),
        .DEF_CFG_RTT                              ( 0 ),
        .DEF_CFG_RTT_PARK                         ( 0 ),
        .DEF_CFG_RTT_WR                           ( 0 ),
        .DEF_CFG_SR_ABORT                         ( 0 ),
        .DEF_CFG_SRT                              ( 0 ),
        .DEF_CFG_STARTUP_DELAY                    ( 133334 ),
        .DEF_CFG_STARVE_TIMEOUT_P0                ( 0 ),
        .DEF_CFG_STARVE_TIMEOUT_P1                ( 0 ),
        .DEF_CFG_STARVE_TIMEOUT_P2                ( 0 ),
        .DEF_CFG_STARVE_TIMEOUT_P3                ( 0 ),
        .DEF_CFG_STARVE_TIMEOUT_P4                ( 0 ),
        .DEF_CFG_STARVE_TIMEOUT_P5                ( 0 ),
        .DEF_CFG_STARVE_TIMEOUT_P6                ( 0 ),
        .DEF_CFG_STARVE_TIMEOUT_P7                ( 0 ),
        .DEF_CFG_TDQS                             ( 0 ),
        .DEF_CFG_TEMP_CTRL_REF_MODE               ( 0 ),
        .DEF_CFG_TEMP_CTRL_REF_RANGE              ( 0 ),
        .DEF_CFG_TEMP_SENSOR_READOUT              ( 0 ),
        .DEF_CFG_TRIG_MASK                        ( 0 ),
        .DEF_CFG_TRIG_MODE                        ( 0 ),
        .DEF_CFG_TWO_T                            ( 0 ),
        .DEF_CFG_TWO_T_SEL_CYCLE                  ( 1 ),
        .DEF_CFG_VREFDQ_TRN_ENABLE                ( 0 ),
        .DEF_CFG_VREFDQ_TRN_RANGE                 ( 0 ),
        .DEF_CFG_VREFDQ_TRN_VALUE                 ( 0 ),
        .DEF_CFG_WL                               ( 0 ),
        .DEF_CFG_WR                               ( 10 ),
        .DEF_CFG_WR_CMD_LAT_CRC_DM                ( 0 ),
        .DEF_CFG_WR_CRC_DM                        ( 0 ),
        .DEF_CFG_WR_PREAMBLE                      ( 0 ),
        .DEF_CFG_WRITE_CRC                        ( 0 ),
        .DEF_CFG_WRITE_DBI                        ( 0 ),
        .DEF_CFG_WRITE_TO_READ                    ( 1 ),
        .DEF_CFG_WRITE_TO_READ_ODT                ( 1 ),
        .DEF_CFG_WRITE_TO_WRITE                   ( 0 ),
        .DEF_CFG_WRITE_TO_WRITE_ODT               ( 0 ),
        .DEF_CFG_WTR                              ( 5 ),
        .DEF_CFG_WTR_L                            ( 0 ),
        .DEF_CFG_WTR_L_CRC_DM                     ( 0 ),
        .DEF_CFG_WTR_S                            ( 0 ),
        .DEF_CFG_WTR_S_CRC_DM                     ( 0 ),
        .DEF_CFG_XP                               ( 0 ),
        .DEF_CFG_XPR                              ( 240 ),
        .DEF_CFG_XS                               ( 240 ),
        .DEF_CFG_XSDLL                            ( 0 ),
        .DEF_CFG_XSR                              ( 0 ),
        .DEF_CFG_ZQ_CAL_L_DURATION                ( 256 ),
        .DEF_CFG_ZQ_CAL_PER                       ( 133334 ),
        .DEF_CFG_ZQ_CAL_R_DURATION                ( 0 ),
        .DEF_CFG_ZQ_CAL_S_DURATION                ( 64 ),
        .DEF_CFG_ZQ_CAL_TYPE                      ( 0 ),
        .DEF_CFG_ZQINIT_CAL_DURATION              ( 512 ),
        .DEF_PHY_EYE_TRAIN_DELAY                  ( 47 ),
        .DEF_PHY_EYE_TRAIN_DELAY_SIM              ( 31 ),
        .DEF_PHY_GATE_TRAIN_DELAY                 ( 47 ),
        .DEF_PHY_GATE_TRAIN_DELAY_SIM             ( 6 ),
        .DEF_PHY_TRAIN_STEP_ENABLE                ( 24 ),
        .DEF_PHY_TRAIN_STEP_ENABLE_SIM            ( 0 ),
        .DEF_RDGATE_MIN_READS_THRESHOLD           ( 64 ),
        .DEF_RDGATE_MIN_READS_THRESHOLD_SIM       ( 4 ),
        .DEF_WRCAL_WRITE_COUNTER_VALUE            ( 255 ),
        .DEF_WRCAL_WRITE_COUNTER_VALUE_SIM        ( 2 ),
        .FAST_TRAINING_SIMULTION                  ( 1 ),
        .SKIP_STARTUP_DELAY_SIMULATION            ( 1 ),
        .SKIP_TRAINING_SIMULATION                 ( 1 ) )
PF_DDR_CFG_INIT_0(
        // Outputs
        .cfg_zqinit_cal_duration              ( PF_DDR_CFG_INIT_0_cfg_zqinit_cal_duration ),
        .cfg_zq_cal_type                      ( PF_DDR_CFG_INIT_0_cfg_zq_cal_type ),
        .cfg_zq_cal_s_duration                ( PF_DDR_CFG_INIT_0_cfg_zq_cal_s_duration ),
        .cfg_zq_cal_r_duration                ( PF_DDR_CFG_INIT_0_cfg_zq_cal_r_duration ),
        .cfg_zq_cal_per                       ( PF_DDR_CFG_INIT_0_cfg_zq_cal_per ),
        .cfg_zq_cal_l_duration                ( PF_DDR_CFG_INIT_0_cfg_zq_cal_l_duration ),
        .cfg_xsr                              ( PF_DDR_CFG_INIT_0_cfg_xsr ),
        .cfg_xsdll                            ( PF_DDR_CFG_INIT_0_cfg_xsdll ),
        .cfg_xs                               ( PF_DDR_CFG_INIT_0_cfg_xs ),
        .cfg_xpr                              ( PF_DDR_CFG_INIT_0_cfg_xpr ),
        .cfg_xp                               ( PF_DDR_CFG_INIT_0_cfg_xp ),
        .cfg_wtr_s_crc_dm                     ( PF_DDR_CFG_INIT_0_cfg_wtr_s_crc_dm ),
        .cfg_wtr_s                            ( PF_DDR_CFG_INIT_0_cfg_wtr_s ),
        .cfg_wtr_l_crc_dm                     ( PF_DDR_CFG_INIT_0_cfg_wtr_l_crc_dm ),
        .cfg_wtr_l                            ( PF_DDR_CFG_INIT_0_cfg_wtr_l ),
        .cfg_wtr                              ( PF_DDR_CFG_INIT_0_cfg_wtr ),
        .cfg_write_to_write_odt               ( PF_DDR_CFG_INIT_0_cfg_write_to_write_odt ),
        .cfg_write_to_write                   ( PF_DDR_CFG_INIT_0_cfg_write_to_write ),
        .cfg_write_to_read_odt                ( PF_DDR_CFG_INIT_0_cfg_write_to_read_odt ),
        .cfg_write_to_read                    ( PF_DDR_CFG_INIT_0_cfg_write_to_read ),
        .cfg_write_dbi                        ( PF_DDR_CFG_INIT_0_cfg_write_dbi ),
        .cfg_write_crc                        ( PF_DDR_CFG_INIT_0_cfg_write_crc ),
        .cfg_wr_preamble                      ( PF_DDR_CFG_INIT_0_cfg_wr_preamble ),
        .cfg_wr_crc_dm                        ( PF_DDR_CFG_INIT_0_cfg_wr_crc_dm ),
        .cfg_wr_cmd_lat_crc_dm                ( PF_DDR_CFG_INIT_0_cfg_wr_cmd_lat_crc_dm ),
        .cfg_wr                               ( PF_DDR_CFG_INIT_0_cfg_wr ),
        .cfg_wl                               ( PF_DDR_CFG_INIT_0_cfg_wl ),
        .cfg_vrefdq_trn_value                 ( PF_DDR_CFG_INIT_0_cfg_vrefdq_trn_value ),
        .cfg_vrefdq_trn_range                 ( PF_DDR_CFG_INIT_0_cfg_vrefdq_trn_range ),
        .cfg_vrefdq_trn_enable                ( PF_DDR_CFG_INIT_0_cfg_vrefdq_trn_enable ),
        .cfg_two_t_sel_cycle                  ( PF_DDR_CFG_INIT_0_cfg_two_t_sel_cycle ),
        .cfg_two_t                            ( PF_DDR_CFG_INIT_0_cfg_two_t ),
        .cfg_trig_mode                        ( PF_DDR_CFG_INIT_0_cfg_trig_mode ),
        .cfg_trig_mask                        ( PF_DDR_CFG_INIT_0_cfg_trig_mask ),
        .cfg_temp_sensor_readout              ( PF_DDR_CFG_INIT_0_cfg_temp_sensor_readout ),
        .cfg_temp_ctrl_ref_range              ( PF_DDR_CFG_INIT_0_cfg_temp_ctrl_ref_range ),
        .cfg_temp_ctrl_ref_mode               ( PF_DDR_CFG_INIT_0_cfg_temp_ctrl_ref_mode ),
        .cfg_tdqs                             ( PF_DDR_CFG_INIT_0_cfg_tdqs ),
        .cfg_starve_timeout_p7                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p7 ),
        .cfg_starve_timeout_p6                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p6 ),
        .cfg_starve_timeout_p5                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p5 ),
        .cfg_starve_timeout_p4                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p4 ),
        .cfg_starve_timeout_p3                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p3 ),
        .cfg_starve_timeout_p2                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p2 ),
        .cfg_starve_timeout_p1                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p1 ),
        .cfg_starve_timeout_p0                ( PF_DDR_CFG_INIT_0_cfg_starve_timeout_p0 ),
        .cfg_pre_trig_cycs                    ( PF_DDR_CFG_INIT_0_cfg_pre_trig_cycs ),
        .cfg_startup_delay                    ( PF_DDR_CFG_INIT_0_cfg_startup_delay ),
        .cfg_srt                              ( PF_DDR_CFG_INIT_0_cfg_srt ),
        .cfg_sr_abort                         ( PF_DDR_CFG_INIT_0_cfg_sr_abort ),
        .cfg_rtt_wr                           ( PF_DDR_CFG_INIT_0_cfg_rtt_wr ),
        .cfg_rtt_park                         ( PF_DDR_CFG_INIT_0_cfg_rtt_park ),
        .cfg_rtt                              ( PF_DDR_CFG_INIT_0_cfg_rtt ),
        .cfg_rtp                              ( PF_DDR_CFG_INIT_0_cfg_rtp ),
        .cfg_rrd_s                            ( PF_DDR_CFG_INIT_0_cfg_rrd_s ),
        .cfg_rrd_l                            ( PF_DDR_CFG_INIT_0_cfg_rrd_l ),
        .cfg_rrd_dlr                          ( PF_DDR_CFG_INIT_0_cfg_rrd_dlr ),
        .cfg_rrd                              ( PF_DDR_CFG_INIT_0_cfg_rrd ),
        .cfg_rp                               ( PF_DDR_CFG_INIT_0_cfg_rp ),
        .cfg_rowaddr_map                      ( PF_DDR_CFG_INIT_0_cfg_rowaddr_map ),
        .cfg_rmw_en                           ( PF_DDR_CFG_INIT_0_cfg_rmw_en ),
        .cfg_rl                               ( PF_DDR_CFG_INIT_0_cfg_rl ),
        .cfg_rfc_dlr4                         ( PF_DDR_CFG_INIT_0_cfg_rfc_dlr4 ),
        .cfg_rfc_dlr2                         ( PF_DDR_CFG_INIT_0_cfg_rfc_dlr2 ),
        .cfg_rfc_dlr1                         ( PF_DDR_CFG_INIT_0_cfg_rfc_dlr1 ),
        .cfg_rfc4                             ( PF_DDR_CFG_INIT_0_cfg_rfc4 ),
        .cfg_rfc2                             ( PF_DDR_CFG_INIT_0_cfg_rfc2 ),
        .cfg_rfc1                             ( PF_DDR_CFG_INIT_0_cfg_rfc1 ),
        .cfg_rfc                              ( PF_DDR_CFG_INIT_0_cfg_rfc ),
        .cfg_regdimm                          ( PF_DDR_CFG_INIT_0_cfg_regdimm ),
        .cfg_ref_per                          ( PF_DDR_CFG_INIT_0_cfg_ref_per ),
        .cfg_read_to_write_odt                ( PF_DDR_CFG_INIT_0_cfg_read_to_write_odt ),
        .cfg_read_to_write                    ( PF_DDR_CFG_INIT_0_cfg_read_to_write ),
        .cfg_read_to_read_odt                 ( PF_DDR_CFG_INIT_0_cfg_read_to_read_odt ),
        .cfg_read_to_read                     ( PF_DDR_CFG_INIT_0_cfg_read_to_read ),
        .cfg_read_dbi                         ( PF_DDR_CFG_INIT_0_cfg_read_dbi ),
        .cfg_rdimm_lat                        ( PF_DDR_CFG_INIT_0_cfg_rdimm_lat ),
        .cfg_rdimm_bside_invert               ( PF_DDR_CFG_INIT_0_cfg_rdimm_bside_invert ),
        .cfg_rd_preamble                      ( PF_DDR_CFG_INIT_0_cfg_rd_preamble ),
        .cfg_rd_preamb_trn_mode               ( PF_DDR_CFG_INIT_0_cfg_rd_preamb_trn_mode ),
        .cfg_rcd_stab                         ( PF_DDR_CFG_INIT_0_cfg_rcd_stab ),
        .cfg_rcd                              ( PF_DDR_CFG_INIT_0_cfg_rcd ),
        .cfg_rc                               ( PF_DDR_CFG_INIT_0_cfg_rc ),
        .cfg_ras                              ( PF_DDR_CFG_INIT_0_cfg_ras ),
        .cfg_quad_rank                        ( PF_DDR_CFG_INIT_0_cfg_quad_rank ),
        .cfg_qoff                             ( PF_DDR_CFG_INIT_0_cfg_qoff ),
        .cfg_post_trig_cycs                   ( PF_DDR_CFG_INIT_0_cfg_post_trig_cycs ),
        .cfg_phyupd_ack_delay                 ( PF_DDR_CFG_INIT_0_cfg_phyupd_ack_delay ),
        .cfg_per_dram_addr_en                 ( PF_DDR_CFG_INIT_0_cfg_per_dram_addr_en ),
        .cfg_pasr_seg                         ( PF_DDR_CFG_INIT_0_cfg_pasr_seg ),
        .cfg_pasr_bank                        ( PF_DDR_CFG_INIT_0_cfg_pasr_bank ),
        .cfg_pasr                             ( PF_DDR_CFG_INIT_0_cfg_pasr ),
        .cfg_parity_rdimm_delay               ( PF_DDR_CFG_INIT_0_cfg_parity_rdimm_delay ),
        .cfg_only_srank_cmds                  ( PF_DDR_CFG_INIT_0_cfg_only_srank_cmds ),
        .cfg_odt_wr_turn_on                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_turn_on ),
        .cfg_odt_wr_turn_off                  ( PF_DDR_CFG_INIT_0_cfg_odt_wr_turn_off ),
        .cfg_odt_wr_map_cs7                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs7 ),
        .cfg_odt_wr_map_cs6                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs6 ),
        .cfg_odt_wr_map_cs5                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs5 ),
        .cfg_odt_wr_map_cs4                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs4 ),
        .cfg_odt_wr_map_cs3                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs3 ),
        .cfg_odt_wr_map_cs2                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs2 ),
        .cfg_odt_wr_map_cs1                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs1 ),
        .cfg_odt_wr_map_cs0                   ( PF_DDR_CFG_INIT_0_cfg_odt_wr_map_cs0 ),
        .cfg_odt_rd_turn_on                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_turn_on ),
        .cfg_odt_rd_turn_off                  ( PF_DDR_CFG_INIT_0_cfg_odt_rd_turn_off ),
        .cfg_odt_rd_map_cs7                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs7 ),
        .cfg_odt_rd_map_cs6                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs6 ),
        .cfg_odt_rd_map_cs5                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs5 ),
        .cfg_odt_rd_map_cs4                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs4 ),
        .cfg_odt_rd_map_cs3                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs3 ),
        .cfg_odt_rd_map_cs2                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs2 ),
        .cfg_odt_rd_map_cs1                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs1 ),
        .cfg_odt_rd_map_cs0                   ( PF_DDR_CFG_INIT_0_cfg_odt_rd_map_cs0 ),
        .cfg_odt_powerdown                    ( PF_DDR_CFG_INIT_0_cfg_odt_powerdown ),
        .cfg_odt_inbuf_4_pd                   ( PF_DDR_CFG_INIT_0_cfg_odt_inbuf_4_pd ),
        .cfg_num_ranks                        ( PF_DDR_CFG_INIT_0_cfg_num_ranks ),
        .cfg_num_logical_ranks_per_3ds        ( PF_DDR_CFG_INIT_0_cfg_num_logical_ranks_per_3ds ),
        .cfg_num_cal_reads                    ( PF_DDR_CFG_INIT_0_cfg_num_cal_reads ),
        .cfg_nibble_devices                   ( PF_DDR_CFG_INIT_0_cfg_nibble_devices ),
        .cfg_mrw                              ( PF_DDR_CFG_INIT_0_cfg_mrw ),
        .cfg_mrri                             ( PF_DDR_CFG_INIT_0_cfg_mrri ),
        .cfg_mrr                              ( PF_DDR_CFG_INIT_0_cfg_mrr ),
        .cfg_mpr_read_format                  ( PF_DDR_CFG_INIT_0_cfg_mpr_read_format ),
        .cfg_mod                              ( PF_DDR_CFG_INIT_0_cfg_mod ),
        .cfg_mirror_x16_bg0_bg1               ( PF_DDR_CFG_INIT_0_cfg_mirror_x16_bg0_bg1 ),
        .cfg_min_read_idle                    ( PF_DDR_CFG_INIT_0_cfg_min_read_idle ),
        .cfg_memory_type                      ( PF_DDR_CFG_INIT_0_cfg_memory_type ),
        .cfg_mem_rowbits                      ( PF_DDR_CFG_INIT_0_cfg_mem_rowbits ),
        .cfg_mem_colbits                      ( PF_DDR_CFG_INIT_0_cfg_mem_colbits ),
        .cfg_mem_bankbits                     ( PF_DDR_CFG_INIT_0_cfg_mem_bankbits ),
        .cfg_mb_autopch_col_bit_pos_low       ( PF_DDR_CFG_INIT_0_cfg_mb_autopch_col_bit_pos_low ),
        .cfg_mb_autopch_col_bit_pos_high      ( PF_DDR_CFG_INIT_0_cfg_mb_autopch_col_bit_pos_high ),
        .cfg_max_pwr_down_mode                ( PF_DDR_CFG_INIT_0_cfg_max_pwr_down_mode ),
        .cfg_manual_address_map               ( PF_DDR_CFG_INIT_0_cfg_manual_address_map ),
        .cfg_lrdimm                           ( PF_DDR_CFG_INIT_0_cfg_lrdimm ),
        .cfg_lp_asr                           ( PF_DDR_CFG_INIT_0_cfg_lp_asr ),
        .cfg_lookahead_pch                    ( PF_DDR_CFG_INIT_0_cfg_lookahead_pch ),
        .cfg_lookahead_act                    ( PF_DDR_CFG_INIT_0_cfg_lookahead_act ),
        .cfg_int_vref_mon                     ( PF_DDR_CFG_INIT_0_cfg_int_vref_mon ),
        .cfg_init_duration                    ( PF_DDR_CFG_INIT_0_cfg_init_duration ),
        .cfg_idle_time_to_self_refresh        ( PF_DDR_CFG_INIT_0_cfg_idle_time_to_self_refresh ),
        .cfg_idle_time_to_power_down          ( PF_DDR_CFG_INIT_0_cfg_idle_time_to_power_down ),
        .cfg_geardown_mode                    ( PF_DDR_CFG_INIT_0_cfg_geardown_mode ),
        .cfg_fine_gran_ref_mode               ( PF_DDR_CFG_INIT_0_cfg_fine_gran_ref_mode ),
        .cfg_faw_dlr                          ( PF_DDR_CFG_INIT_0_cfg_faw_dlr ),
        .cfg_faw                              ( PF_DDR_CFG_INIT_0_cfg_faw ),
        .cfg_error_group_sel                  ( PF_DDR_CFG_INIT_0_cfg_error_group_sel ),
        .cfg_en_mask                          ( PF_DDR_CFG_INIT_0_cfg_en_mask ),
        .cfg_emr3                             ( PF_DDR_CFG_INIT_0_cfg_emr3 ),
        .cfg_ecc_correction_en                ( PF_DDR_CFG_INIT_0_cfg_ecc_correction_en ),
        .cfg_early_rank_to_wr_start           ( PF_DDR_CFG_INIT_0_cfg_early_rank_to_wr_start ),
        .cfg_early_rank_to_rd_start           ( PF_DDR_CFG_INIT_0_cfg_early_rank_to_rd_start ),
        .cfg_ds                               ( PF_DDR_CFG_INIT_0_cfg_ds ),
        .cfg_dram_clk_disable_in_self_refresh ( PF_DDR_CFG_INIT_0_cfg_dram_clk_disable_in_self_refresh ),
        .cfg_dm_en                            ( PF_DDR_CFG_INIT_0_cfg_dm_en ),
        .cfg_dll_disable                      ( PF_DDR_CFG_INIT_0_cfg_dll_disable ),
        .cfg_dfi_t_rddata_en                  ( PF_DDR_CFG_INIT_0_cfg_dfi_t_rddata_en ),
        .cfg_dfi_t_phy_wrlat                  ( PF_DDR_CFG_INIT_0_cfg_dfi_t_phy_wrlat ),
        .cfg_dfi_t_phy_rdlat                  ( PF_DDR_CFG_INIT_0_cfg_dfi_t_phy_rdlat ),
        .cfg_dfi_t_dram_clk_enable            ( PF_DDR_CFG_INIT_0_cfg_dfi_t_dram_clk_enable ),
        .cfg_dfi_t_ctrlupd_max                ( PF_DDR_CFG_INIT_0_cfg_dfi_t_ctrlupd_max ),
        .cfg_dfi_t_ctrl_delay                 ( PF_DDR_CFG_INIT_0_cfg_dfi_t_ctrl_delay ),
        .cfg_dfi_phyupd_en                    ( PF_DDR_CFG_INIT_0_cfg_dfi_phyupd_en ),
        .cfg_dfi_lvl_sel                      ( PF_DDR_CFG_INIT_0_cfg_dfi_lvl_sel ),
        .cfg_dfi_lvl_periodic                 ( PF_DDR_CFG_INIT_0_cfg_dfi_lvl_periodic ),
        .cfg_dfi_lvl_pattern                  ( PF_DDR_CFG_INIT_0_cfg_dfi_lvl_pattern ),
        .cfg_dfi_data_byte_disable            ( cfg_dfi_data_byte_disable_net_0 ),
        .cfg_data_sel                         ( PF_DDR_CFG_INIT_0_cfg_data_sel ),
        .cfg_data_sel_first_error             ( PF_DDR_CFG_INIT_0_cfg_data_sel_first_error ),
        .cfg_data_mask                        ( PF_DDR_CFG_INIT_0_cfg_data_mask ),
        .cfg_cwl                              ( PF_DDR_CFG_INIT_0_cfg_cwl ),
        .cfg_ctrlupd_trig                     ( PF_DDR_CFG_INIT_0_cfg_ctrlupd_trig ),
        .cfg_ctrlupd_start_delay              ( PF_DDR_CFG_INIT_0_cfg_ctrlupd_start_delay ),
        .cfg_ctrlr_init_disable               ( PF_DDR_CFG_INIT_0_cfg_ctrlr_init_disable ),
        .cfg_ctrlr_busy_value                 ( PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_value ),
        .cfg_ctrlr_busy_turn_off_delay        ( PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_turn_off_delay ),
        .cfg_ctrlr_busy_slow_restart_window   ( PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_slow_restart_window ),
        .cfg_ctrlr_busy_sel                   ( PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_sel ),
        .cfg_ctrlr_busy_restart_holdoff       ( PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_restart_holdoff ),
        .cfg_ctrlr_busy_enable                ( PF_DDR_CFG_INIT_0_cfg_ctrlr_busy_enable ),
        .cfg_cs_to_cmdaddr_latency            ( PF_DDR_CFG_INIT_0_cfg_cs_to_cmdaddr_latency ),
        .cfg_crc_error_clear                  ( PF_DDR_CFG_INIT_0_cfg_crc_error_clear ),
        .cfg_coladdr_map                      ( PF_DDR_CFG_INIT_0_cfg_coladdr_map ),
        .cfg_cl                               ( PF_DDR_CFG_INIT_0_cfg_cl ),
        .cfg_cksrx                            ( PF_DDR_CFG_INIT_0_cfg_cksrx ),
        .cfg_cksre                            ( PF_DDR_CFG_INIT_0_cfg_cksre ),
        .cfg_cidaddr_map                      ( PF_DDR_CFG_INIT_0_cfg_cidaddr_map ),
        .cfg_chipaddr_map                     ( PF_DDR_CFG_INIT_0_cfg_chipaddr_map ),
        .cfg_ccd_s                            ( PF_DDR_CFG_INIT_0_cfg_ccd_s ),
        .cfg_ccd_l                            ( PF_DDR_CFG_INIT_0_cfg_ccd_l ),
        .cfg_cal_read_period                  ( PF_DDR_CFG_INIT_0_cfg_cal_read_period ),
        .cfg_ca_parity_persist_err            ( PF_DDR_CFG_INIT_0_cfg_ca_parity_persist_err ),
        .cfg_ca_parity_latency                ( PF_DDR_CFG_INIT_0_cfg_ca_parity_latency ),
        .cfg_ca_parity_err_status             ( PF_DDR_CFG_INIT_0_cfg_ca_parity_err_status ),
        .cfg_burst_rw_refresh_holdoff         ( PF_DDR_CFG_INIT_0_cfg_burst_rw_refresh_holdoff ),
        .cfg_bt                               ( PF_DDR_CFG_INIT_0_cfg_bt ),
        .cfg_bl_mode                          ( PF_DDR_CFG_INIT_0_cfg_bl_mode ),
        .cfg_bl                               ( PF_DDR_CFG_INIT_0_cfg_bl ),
        .cfg_bit_map_index_cs9                ( cfg_bit_map_index_cs9_net_0 ),
        .cfg_bit_map_index_cs8                ( cfg_bit_map_index_cs8_net_0 ),
        .cfg_bit_map_index_cs7                ( cfg_bit_map_index_cs7_net_0 ),
        .cfg_bit_map_index_cs6                ( cfg_bit_map_index_cs6_net_0 ),
        .cfg_bit_map_index_cs5                ( cfg_bit_map_index_cs5_net_0 ),
        .cfg_bit_map_index_cs4                ( cfg_bit_map_index_cs4_net_0 ),
        .cfg_bit_map_index_cs3                ( cfg_bit_map_index_cs3_net_0 ),
        .cfg_bit_map_index_cs2                ( cfg_bit_map_index_cs2_net_0 ),
        .cfg_bit_map_index_cs15               ( cfg_bit_map_index_cs15_net_0 ),
        .cfg_bit_map_index_cs14               ( cfg_bit_map_index_cs14_net_0 ),
        .cfg_bit_map_index_cs13               ( cfg_bit_map_index_cs13_net_0 ),
        .cfg_bit_map_index_cs12               ( cfg_bit_map_index_cs12_net_0 ),
        .cfg_bit_map_index_cs11               ( cfg_bit_map_index_cs11_net_0 ),
        .cfg_bit_map_index_cs10               ( cfg_bit_map_index_cs10_net_0 ),
        .cfg_bit_map_index_cs1                ( cfg_bit_map_index_cs1_net_0 ),
        .cfg_bit_map_index_cs0                ( cfg_bit_map_index_cs0_net_0 ),
        .cfg_bg_interleave                    ( PF_DDR_CFG_INIT_0_cfg_bg_interleave ),
        .cfg_bankaddr_map                     ( PF_DDR_CFG_INIT_0_cfg_bankaddr_map ),
        .cfg_auto_zq_cal_en                   ( PF_DDR_CFG_INIT_0_cfg_auto_zq_cal_en ),
        .cfg_auto_sr                          ( PF_DDR_CFG_INIT_0_cfg_auto_sr ),
        .cfg_auto_ref_en                      ( PF_DDR_CFG_INIT_0_cfg_auto_ref_en ),
        .cfg_async_odt                        ( PF_DDR_CFG_INIT_0_cfg_async_odt ),
        .cfg_al_mode                          ( PF_DDR_CFG_INIT_0_cfg_al_mode ),
        .cfg_addr_mirror                      ( PF_DDR_CFG_INIT_0_cfg_addr_mirror ),
        .axi0_cfg_axi_start_address           (  ),
        .axi0_cfg_axi_end_address             (  ),
        .axi0_cfg_mem_start_address           (  ),
        .axi0_cfg_enable_bus_hold             (  ),
        .phy_train_step_enable                ( PF_DDR_CFG_INIT_0_phy_train_step_enable ),
        .ADDR_WAIT_COUNT                      ( PF_DDR_CFG_INIT_0_ADDR_WAIT_COUNT ),
        .WRCAL_WRITE_COUNTER_VALUE            ( PF_DDR_CFG_INIT_0_WRCAL_WRITE_COUNTER_VALUE ),
        .RDGATE_MIN_READS_THRESHOLD           ( PF_DDR_CFG_INIT_0_RDGATE_MIN_READS_THRESHOLD ),
        .phy_gate_train_delay                 ( PF_DDR_CFG_INIT_0_phy_gate_train_delay ),
        .phy_eye_train_delay                  ( PF_DDR_CFG_INIT_0_phy_eye_train_delay ),
        .ADDR_VCOPHS_OFFSET                   (  ) 
        );


endmodule
