//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 17 09:01:58 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of SRAM_AXI to TCL
# Family: PolarFire
# Part Number: MPF300T-1FCG1152E
# Create and Configure the core component SRAM_AXI
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_SRAM_AHBL_AXI:1.2.108} -component_name {SRAM_AXI} -params {\
"AXI4_AWIDTH:32" \
"AXI4_DWIDTH:64" \
"AXI4_IDWIDTH:6" \
"AXI4_IFTYPE_RD:T" \
"AXI4_IFTYPE_WR:T" \
"AXI4_WRAP_SUPPORT:F" \
"BYTEENABLES:1" \
"BYTE_ENABLE_WIDTH:8" \
"B_REN_POLARITY:2" \
"CASCADE:0" \
"ECC_OPTIONS:0" \
"FABRIC_INTERFACE_TYPE:1" \
"IMPORT_FILE:" \
"INIT_RAM:F" \
"LPM_HINT:0" \
"PIPELINE_OPTIONS:1" \
"RDEPTH:512" \
"RWIDTH:80" \
"USE_NATIVE_INTERFACE:F" \
"WDEPTH:512" \
"WWIDTH:80" }
# Exporting Component Description of SRAM_AXI to TCL done
*/

// SRAM_AXI
module SRAM_AXI(
    // Inputs
    ACLK,
    ARADDR,
    ARBURST,
    ARCACHE,
    ARESETN,
    ARID,
    ARLEN,
    ARLOCK,
    ARPROT,
    ARSIZE,
    ARVALID,
    AWADDR,
    AWBURST,
    AWCACHE,
    AWID,
    AWLEN,
    AWLOCK,
    AWPROT,
    AWSIZE,
    AWVALID,
    BREADY,
    RREADY,
    WDATA,
    WLAST,
    WSTRB,
    WVALID,
    // Outputs
    ARREADY,
    AWREADY,
    BID,
    BRESP,
    BVALID,
    RDATA,
    RID,
    RLAST,
    RRESP,
    RVALID,
    WREADY
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         ACLK;
input  [31:0] ARADDR;
input  [1:0]  ARBURST;
input  [3:0]  ARCACHE;
input         ARESETN;
input  [5:0]  ARID;
input  [7:0]  ARLEN;
input  [1:0]  ARLOCK;
input  [2:0]  ARPROT;
input  [2:0]  ARSIZE;
input         ARVALID;
input  [31:0] AWADDR;
input  [1:0]  AWBURST;
input  [3:0]  AWCACHE;
input  [5:0]  AWID;
input  [7:0]  AWLEN;
input  [1:0]  AWLOCK;
input  [2:0]  AWPROT;
input  [2:0]  AWSIZE;
input         AWVALID;
input         BREADY;
input         RREADY;
input  [63:0] WDATA;
input         WLAST;
input  [7:0]  WSTRB;
input         WVALID;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ARREADY;
output        AWREADY;
output [5:0]  BID;
output [1:0]  BRESP;
output        BVALID;
output [63:0] RDATA;
output [5:0]  RID;
output        RLAST;
output [1:0]  RRESP;
output        RVALID;
output        WREADY;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire           ACLK;
wire           ARESETN;
wire   [31:0]  ARADDR;
wire   [1:0]   ARBURST;
wire   [3:0]   ARCACHE;
wire   [5:0]   ARID;
wire   [7:0]   ARLEN;
wire   [1:0]   ARLOCK;
wire   [2:0]   ARPROT;
wire           AXI4_Slave_ARREADY;
wire   [2:0]   ARSIZE;
wire           ARVALID;
wire   [31:0]  AWADDR;
wire   [1:0]   AWBURST;
wire   [3:0]   AWCACHE;
wire   [5:0]   AWID;
wire   [7:0]   AWLEN;
wire   [1:0]   AWLOCK;
wire   [2:0]   AWPROT;
wire           AXI4_Slave_AWREADY;
wire   [2:0]   AWSIZE;
wire           AWVALID;
wire   [5:0]   AXI4_Slave_BID;
wire           BREADY;
wire   [1:0]   AXI4_Slave_BRESP;
wire           AXI4_Slave_BVALID;
wire   [63:0]  AXI4_Slave_RDATA;
wire   [5:0]   AXI4_Slave_RID;
wire           AXI4_Slave_RLAST;
wire           RREADY;
wire   [1:0]   AXI4_Slave_RRESP;
wire           AXI4_Slave_RVALID;
wire   [63:0]  WDATA;
wire           WLAST;
wire           AXI4_Slave_WREADY;
wire   [7:0]   WSTRB;
wire           WVALID;
wire   [8:0]   COREAXI4SRAM_0_MEM_RADDR;
wire           COREAXI4SRAM_0_MEM_REN;
wire   [8:0]   COREAXI4SRAM_0_MEM_WADDR;
wire   [0:0]   COREAXI4SRAM_0_MEM_WBYTE_EN0to0;
wire   [1:1]   COREAXI4SRAM_0_MEM_WBYTE_EN1to1;
wire   [2:2]   COREAXI4SRAM_0_MEM_WBYTE_EN2to2;
wire   [3:3]   COREAXI4SRAM_0_MEM_WBYTE_EN3to3;
wire   [4:4]   COREAXI4SRAM_0_MEM_WBYTE_EN4to4;
wire   [5:5]   COREAXI4SRAM_0_MEM_WBYTE_EN5to5;
wire   [6:6]   COREAXI4SRAM_0_MEM_WBYTE_EN6to6;
wire   [7:7]   COREAXI4SRAM_0_MEM_WBYTE_EN7to7;
wire   [0:0]   COREAXI4SRAM_0_MEM_WDATA0to0;
wire   [1:1]   COREAXI4SRAM_0_MEM_WDATA1to1;
wire   [2:2]   COREAXI4SRAM_0_MEM_WDATA2to2;
wire   [3:3]   COREAXI4SRAM_0_MEM_WDATA3to3;
wire   [4:4]   COREAXI4SRAM_0_MEM_WDATA4to4;
wire   [5:5]   COREAXI4SRAM_0_MEM_WDATA5to5;
wire   [6:6]   COREAXI4SRAM_0_MEM_WDATA6to6;
wire   [7:7]   COREAXI4SRAM_0_MEM_WDATA7to7;
wire   [8:8]   COREAXI4SRAM_0_MEM_WDATA8to8;
wire   [9:9]   COREAXI4SRAM_0_MEM_WDATA9to9;
wire   [10:10] COREAXI4SRAM_0_MEM_WDATA10to10;
wire   [11:11] COREAXI4SRAM_0_MEM_WDATA11to11;
wire   [12:12] COREAXI4SRAM_0_MEM_WDATA12to12;
wire   [13:13] COREAXI4SRAM_0_MEM_WDATA13to13;
wire   [14:14] COREAXI4SRAM_0_MEM_WDATA14to14;
wire   [15:15] COREAXI4SRAM_0_MEM_WDATA15to15;
wire   [16:16] COREAXI4SRAM_0_MEM_WDATA16to16;
wire   [17:17] COREAXI4SRAM_0_MEM_WDATA17to17;
wire   [18:18] COREAXI4SRAM_0_MEM_WDATA18to18;
wire   [19:19] COREAXI4SRAM_0_MEM_WDATA19to19;
wire   [20:20] COREAXI4SRAM_0_MEM_WDATA20to20;
wire   [21:21] COREAXI4SRAM_0_MEM_WDATA21to21;
wire   [22:22] COREAXI4SRAM_0_MEM_WDATA22to22;
wire   [23:23] COREAXI4SRAM_0_MEM_WDATA23to23;
wire   [24:24] COREAXI4SRAM_0_MEM_WDATA24to24;
wire   [25:25] COREAXI4SRAM_0_MEM_WDATA25to25;
wire   [26:26] COREAXI4SRAM_0_MEM_WDATA26to26;
wire   [27:27] COREAXI4SRAM_0_MEM_WDATA27to27;
wire   [28:28] COREAXI4SRAM_0_MEM_WDATA28to28;
wire   [29:29] COREAXI4SRAM_0_MEM_WDATA29to29;
wire   [30:30] COREAXI4SRAM_0_MEM_WDATA30to30;
wire   [31:31] COREAXI4SRAM_0_MEM_WDATA31to31;
wire   [32:32] COREAXI4SRAM_0_MEM_WDATA32to32;
wire   [33:33] COREAXI4SRAM_0_MEM_WDATA33to33;
wire   [34:34] COREAXI4SRAM_0_MEM_WDATA34to34;
wire   [35:35] COREAXI4SRAM_0_MEM_WDATA35to35;
wire   [36:36] COREAXI4SRAM_0_MEM_WDATA36to36;
wire   [37:37] COREAXI4SRAM_0_MEM_WDATA37to37;
wire   [38:38] COREAXI4SRAM_0_MEM_WDATA38to38;
wire   [39:39] COREAXI4SRAM_0_MEM_WDATA39to39;
wire   [40:40] COREAXI4SRAM_0_MEM_WDATA40to40;
wire   [41:41] COREAXI4SRAM_0_MEM_WDATA41to41;
wire   [42:42] COREAXI4SRAM_0_MEM_WDATA42to42;
wire   [43:43] COREAXI4SRAM_0_MEM_WDATA43to43;
wire   [44:44] COREAXI4SRAM_0_MEM_WDATA44to44;
wire   [45:45] COREAXI4SRAM_0_MEM_WDATA45to45;
wire   [46:46] COREAXI4SRAM_0_MEM_WDATA46to46;
wire   [47:47] COREAXI4SRAM_0_MEM_WDATA47to47;
wire   [48:48] COREAXI4SRAM_0_MEM_WDATA48to48;
wire   [49:49] COREAXI4SRAM_0_MEM_WDATA49to49;
wire   [50:50] COREAXI4SRAM_0_MEM_WDATA50to50;
wire   [51:51] COREAXI4SRAM_0_MEM_WDATA51to51;
wire   [52:52] COREAXI4SRAM_0_MEM_WDATA52to52;
wire   [53:53] COREAXI4SRAM_0_MEM_WDATA53to53;
wire   [54:54] COREAXI4SRAM_0_MEM_WDATA54to54;
wire   [55:55] COREAXI4SRAM_0_MEM_WDATA55to55;
wire   [56:56] COREAXI4SRAM_0_MEM_WDATA56to56;
wire   [57:57] COREAXI4SRAM_0_MEM_WDATA57to57;
wire   [58:58] COREAXI4SRAM_0_MEM_WDATA58to58;
wire   [59:59] COREAXI4SRAM_0_MEM_WDATA59to59;
wire   [60:60] COREAXI4SRAM_0_MEM_WDATA60to60;
wire   [61:61] COREAXI4SRAM_0_MEM_WDATA61to61;
wire   [62:62] COREAXI4SRAM_0_MEM_WDATA62to62;
wire   [63:63] COREAXI4SRAM_0_MEM_WDATA63to63;
wire           COREAXI4SRAM_0_MEM_WEN;
wire   [7:0]   MEM_WBYTE_EN;
wire   [63:0]  MEM_WDATA;
wire   [0:0]   PF_TPSRAM_AHB_AXI_0_R_DATA0to0;
wire   [1:1]   PF_TPSRAM_AHB_AXI_0_R_DATA1to1;
wire   [2:2]   PF_TPSRAM_AHB_AXI_0_R_DATA2to2;
wire   [3:3]   PF_TPSRAM_AHB_AXI_0_R_DATA3to3;
wire   [4:4]   PF_TPSRAM_AHB_AXI_0_R_DATA4to4;
wire   [5:5]   PF_TPSRAM_AHB_AXI_0_R_DATA5to5;
wire   [6:6]   PF_TPSRAM_AHB_AXI_0_R_DATA6to6;
wire   [7:7]   PF_TPSRAM_AHB_AXI_0_R_DATA7to7;
wire   [10:10] PF_TPSRAM_AHB_AXI_0_R_DATA10to10;
wire   [11:11] PF_TPSRAM_AHB_AXI_0_R_DATA11to11;
wire   [12:12] PF_TPSRAM_AHB_AXI_0_R_DATA12to12;
wire   [13:13] PF_TPSRAM_AHB_AXI_0_R_DATA13to13;
wire   [14:14] PF_TPSRAM_AHB_AXI_0_R_DATA14to14;
wire   [15:15] PF_TPSRAM_AHB_AXI_0_R_DATA15to15;
wire   [16:16] PF_TPSRAM_AHB_AXI_0_R_DATA16to16;
wire   [17:17] PF_TPSRAM_AHB_AXI_0_R_DATA17to17;
wire   [20:20] PF_TPSRAM_AHB_AXI_0_R_DATA20to20;
wire   [21:21] PF_TPSRAM_AHB_AXI_0_R_DATA21to21;
wire   [22:22] PF_TPSRAM_AHB_AXI_0_R_DATA22to22;
wire   [23:23] PF_TPSRAM_AHB_AXI_0_R_DATA23to23;
wire   [24:24] PF_TPSRAM_AHB_AXI_0_R_DATA24to24;
wire   [25:25] PF_TPSRAM_AHB_AXI_0_R_DATA25to25;
wire   [26:26] PF_TPSRAM_AHB_AXI_0_R_DATA26to26;
wire   [27:27] PF_TPSRAM_AHB_AXI_0_R_DATA27to27;
wire   [30:30] PF_TPSRAM_AHB_AXI_0_R_DATA30to30;
wire   [31:31] PF_TPSRAM_AHB_AXI_0_R_DATA31to31;
wire   [32:32] PF_TPSRAM_AHB_AXI_0_R_DATA32to32;
wire   [33:33] PF_TPSRAM_AHB_AXI_0_R_DATA33to33;
wire   [34:34] PF_TPSRAM_AHB_AXI_0_R_DATA34to34;
wire   [35:35] PF_TPSRAM_AHB_AXI_0_R_DATA35to35;
wire   [36:36] PF_TPSRAM_AHB_AXI_0_R_DATA36to36;
wire   [37:37] PF_TPSRAM_AHB_AXI_0_R_DATA37to37;
wire   [40:40] PF_TPSRAM_AHB_AXI_0_R_DATA40to40;
wire   [41:41] PF_TPSRAM_AHB_AXI_0_R_DATA41to41;
wire   [42:42] PF_TPSRAM_AHB_AXI_0_R_DATA42to42;
wire   [43:43] PF_TPSRAM_AHB_AXI_0_R_DATA43to43;
wire   [44:44] PF_TPSRAM_AHB_AXI_0_R_DATA44to44;
wire   [45:45] PF_TPSRAM_AHB_AXI_0_R_DATA45to45;
wire   [46:46] PF_TPSRAM_AHB_AXI_0_R_DATA46to46;
wire   [47:47] PF_TPSRAM_AHB_AXI_0_R_DATA47to47;
wire   [50:50] PF_TPSRAM_AHB_AXI_0_R_DATA50to50;
wire   [51:51] PF_TPSRAM_AHB_AXI_0_R_DATA51to51;
wire   [52:52] PF_TPSRAM_AHB_AXI_0_R_DATA52to52;
wire   [53:53] PF_TPSRAM_AHB_AXI_0_R_DATA53to53;
wire   [54:54] PF_TPSRAM_AHB_AXI_0_R_DATA54to54;
wire   [55:55] PF_TPSRAM_AHB_AXI_0_R_DATA55to55;
wire   [56:56] PF_TPSRAM_AHB_AXI_0_R_DATA56to56;
wire   [57:57] PF_TPSRAM_AHB_AXI_0_R_DATA57to57;
wire   [60:60] PF_TPSRAM_AHB_AXI_0_R_DATA60to60;
wire   [61:61] PF_TPSRAM_AHB_AXI_0_R_DATA61to61;
wire   [62:62] PF_TPSRAM_AHB_AXI_0_R_DATA62to62;
wire   [63:63] PF_TPSRAM_AHB_AXI_0_R_DATA63to63;
wire   [64:64] PF_TPSRAM_AHB_AXI_0_R_DATA64to64;
wire   [65:65] PF_TPSRAM_AHB_AXI_0_R_DATA65to65;
wire   [66:66] PF_TPSRAM_AHB_AXI_0_R_DATA66to66;
wire   [67:67] PF_TPSRAM_AHB_AXI_0_R_DATA67to67;
wire   [70:70] PF_TPSRAM_AHB_AXI_0_R_DATA70to70;
wire   [71:71] PF_TPSRAM_AHB_AXI_0_R_DATA71to71;
wire   [72:72] PF_TPSRAM_AHB_AXI_0_R_DATA72to72;
wire   [73:73] PF_TPSRAM_AHB_AXI_0_R_DATA73to73;
wire   [74:74] PF_TPSRAM_AHB_AXI_0_R_DATA74to74;
wire   [75:75] PF_TPSRAM_AHB_AXI_0_R_DATA75to75;
wire   [76:76] PF_TPSRAM_AHB_AXI_0_R_DATA76to76;
wire   [77:77] PF_TPSRAM_AHB_AXI_0_R_DATA77to77;
wire           AXI4_Slave_AWREADY_net_0;
wire           AXI4_Slave_WREADY_net_0;
wire           AXI4_Slave_BVALID_net_0;
wire           AXI4_Slave_ARREADY_net_0;
wire   [63:0]  AXI4_Slave_RDATA_net_0;
wire   [1:0]   AXI4_Slave_RRESP_net_0;
wire           AXI4_Slave_RLAST_net_0;
wire           AXI4_Slave_RVALID_net_0;
wire   [1:0]   AXI4_Slave_BRESP_net_0;
wire   [5:0]   AXI4_Slave_BID_net_0;
wire   [5:0]   AXI4_Slave_RID_net_0;
wire   [18:18] R_DATA_slice_0;
wire   [19:19] R_DATA_slice_1;
wire   [28:28] R_DATA_slice_2;
wire   [29:29] R_DATA_slice_3;
wire   [38:38] R_DATA_slice_4;
wire   [39:39] R_DATA_slice_5;
wire   [48:48] R_DATA_slice_6;
wire   [49:49] R_DATA_slice_7;
wire   [58:58] R_DATA_slice_8;
wire   [59:59] R_DATA_slice_9;
wire   [68:68] R_DATA_slice_10;
wire   [69:69] R_DATA_slice_11;
wire   [78:78] R_DATA_slice_12;
wire   [79:79] R_DATA_slice_13;
wire   [8:8]   R_DATA_slice_14;
wire   [9:9]   R_DATA_slice_15;
wire   [63:0]  MEM_RDATA_net_0;
wire   [79:0]  W_DATA_net_0;
wire   [79:0]  R_DATA_net_0;
wire   [7:0]   WBYTE_EN_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net     = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign AXI4_Slave_AWREADY_net_0 = AXI4_Slave_AWREADY;
assign AWREADY                  = AXI4_Slave_AWREADY_net_0;
assign AXI4_Slave_WREADY_net_0  = AXI4_Slave_WREADY;
assign WREADY                   = AXI4_Slave_WREADY_net_0;
assign AXI4_Slave_BVALID_net_0  = AXI4_Slave_BVALID;
assign BVALID                   = AXI4_Slave_BVALID_net_0;
assign AXI4_Slave_ARREADY_net_0 = AXI4_Slave_ARREADY;
assign ARREADY                  = AXI4_Slave_ARREADY_net_0;
assign AXI4_Slave_RDATA_net_0   = AXI4_Slave_RDATA;
assign RDATA[63:0]              = AXI4_Slave_RDATA_net_0;
assign AXI4_Slave_RRESP_net_0   = AXI4_Slave_RRESP;
assign RRESP[1:0]               = AXI4_Slave_RRESP_net_0;
assign AXI4_Slave_RLAST_net_0   = AXI4_Slave_RLAST;
assign RLAST                    = AXI4_Slave_RLAST_net_0;
assign AXI4_Slave_RVALID_net_0  = AXI4_Slave_RVALID;
assign RVALID                   = AXI4_Slave_RVALID_net_0;
assign AXI4_Slave_BRESP_net_0   = AXI4_Slave_BRESP;
assign BRESP[1:0]               = AXI4_Slave_BRESP_net_0;
assign AXI4_Slave_BID_net_0     = AXI4_Slave_BID;
assign BID[5:0]                 = AXI4_Slave_BID_net_0;
assign AXI4_Slave_RID_net_0     = AXI4_Slave_RID;
assign RID[5:0]                 = AXI4_Slave_RID_net_0;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign COREAXI4SRAM_0_MEM_WBYTE_EN0to0[0]   = MEM_WBYTE_EN[0:0];
assign COREAXI4SRAM_0_MEM_WBYTE_EN1to1[1]   = MEM_WBYTE_EN[1:1];
assign COREAXI4SRAM_0_MEM_WBYTE_EN2to2[2]   = MEM_WBYTE_EN[2:2];
assign COREAXI4SRAM_0_MEM_WBYTE_EN3to3[3]   = MEM_WBYTE_EN[3:3];
assign COREAXI4SRAM_0_MEM_WBYTE_EN4to4[4]   = MEM_WBYTE_EN[4:4];
assign COREAXI4SRAM_0_MEM_WBYTE_EN5to5[5]   = MEM_WBYTE_EN[5:5];
assign COREAXI4SRAM_0_MEM_WBYTE_EN6to6[6]   = MEM_WBYTE_EN[6:6];
assign COREAXI4SRAM_0_MEM_WBYTE_EN7to7[7]   = MEM_WBYTE_EN[7:7];
assign COREAXI4SRAM_0_MEM_WDATA0to0[0]      = MEM_WDATA[0:0];
assign COREAXI4SRAM_0_MEM_WDATA1to1[1]      = MEM_WDATA[1:1];
assign COREAXI4SRAM_0_MEM_WDATA2to2[2]      = MEM_WDATA[2:2];
assign COREAXI4SRAM_0_MEM_WDATA3to3[3]      = MEM_WDATA[3:3];
assign COREAXI4SRAM_0_MEM_WDATA4to4[4]      = MEM_WDATA[4:4];
assign COREAXI4SRAM_0_MEM_WDATA5to5[5]      = MEM_WDATA[5:5];
assign COREAXI4SRAM_0_MEM_WDATA6to6[6]      = MEM_WDATA[6:6];
assign COREAXI4SRAM_0_MEM_WDATA7to7[7]      = MEM_WDATA[7:7];
assign COREAXI4SRAM_0_MEM_WDATA8to8[8]      = MEM_WDATA[8:8];
assign COREAXI4SRAM_0_MEM_WDATA9to9[9]      = MEM_WDATA[9:9];
assign COREAXI4SRAM_0_MEM_WDATA10to10[10]   = MEM_WDATA[10:10];
assign COREAXI4SRAM_0_MEM_WDATA11to11[11]   = MEM_WDATA[11:11];
assign COREAXI4SRAM_0_MEM_WDATA12to12[12]   = MEM_WDATA[12:12];
assign COREAXI4SRAM_0_MEM_WDATA13to13[13]   = MEM_WDATA[13:13];
assign COREAXI4SRAM_0_MEM_WDATA14to14[14]   = MEM_WDATA[14:14];
assign COREAXI4SRAM_0_MEM_WDATA15to15[15]   = MEM_WDATA[15:15];
assign COREAXI4SRAM_0_MEM_WDATA16to16[16]   = MEM_WDATA[16:16];
assign COREAXI4SRAM_0_MEM_WDATA17to17[17]   = MEM_WDATA[17:17];
assign COREAXI4SRAM_0_MEM_WDATA18to18[18]   = MEM_WDATA[18:18];
assign COREAXI4SRAM_0_MEM_WDATA19to19[19]   = MEM_WDATA[19:19];
assign COREAXI4SRAM_0_MEM_WDATA20to20[20]   = MEM_WDATA[20:20];
assign COREAXI4SRAM_0_MEM_WDATA21to21[21]   = MEM_WDATA[21:21];
assign COREAXI4SRAM_0_MEM_WDATA22to22[22]   = MEM_WDATA[22:22];
assign COREAXI4SRAM_0_MEM_WDATA23to23[23]   = MEM_WDATA[23:23];
assign COREAXI4SRAM_0_MEM_WDATA24to24[24]   = MEM_WDATA[24:24];
assign COREAXI4SRAM_0_MEM_WDATA25to25[25]   = MEM_WDATA[25:25];
assign COREAXI4SRAM_0_MEM_WDATA26to26[26]   = MEM_WDATA[26:26];
assign COREAXI4SRAM_0_MEM_WDATA27to27[27]   = MEM_WDATA[27:27];
assign COREAXI4SRAM_0_MEM_WDATA28to28[28]   = MEM_WDATA[28:28];
assign COREAXI4SRAM_0_MEM_WDATA29to29[29]   = MEM_WDATA[29:29];
assign COREAXI4SRAM_0_MEM_WDATA30to30[30]   = MEM_WDATA[30:30];
assign COREAXI4SRAM_0_MEM_WDATA31to31[31]   = MEM_WDATA[31:31];
assign COREAXI4SRAM_0_MEM_WDATA32to32[32]   = MEM_WDATA[32:32];
assign COREAXI4SRAM_0_MEM_WDATA33to33[33]   = MEM_WDATA[33:33];
assign COREAXI4SRAM_0_MEM_WDATA34to34[34]   = MEM_WDATA[34:34];
assign COREAXI4SRAM_0_MEM_WDATA35to35[35]   = MEM_WDATA[35:35];
assign COREAXI4SRAM_0_MEM_WDATA36to36[36]   = MEM_WDATA[36:36];
assign COREAXI4SRAM_0_MEM_WDATA37to37[37]   = MEM_WDATA[37:37];
assign COREAXI4SRAM_0_MEM_WDATA38to38[38]   = MEM_WDATA[38:38];
assign COREAXI4SRAM_0_MEM_WDATA39to39[39]   = MEM_WDATA[39:39];
assign COREAXI4SRAM_0_MEM_WDATA40to40[40]   = MEM_WDATA[40:40];
assign COREAXI4SRAM_0_MEM_WDATA41to41[41]   = MEM_WDATA[41:41];
assign COREAXI4SRAM_0_MEM_WDATA42to42[42]   = MEM_WDATA[42:42];
assign COREAXI4SRAM_0_MEM_WDATA43to43[43]   = MEM_WDATA[43:43];
assign COREAXI4SRAM_0_MEM_WDATA44to44[44]   = MEM_WDATA[44:44];
assign COREAXI4SRAM_0_MEM_WDATA45to45[45]   = MEM_WDATA[45:45];
assign COREAXI4SRAM_0_MEM_WDATA46to46[46]   = MEM_WDATA[46:46];
assign COREAXI4SRAM_0_MEM_WDATA47to47[47]   = MEM_WDATA[47:47];
assign COREAXI4SRAM_0_MEM_WDATA48to48[48]   = MEM_WDATA[48:48];
assign COREAXI4SRAM_0_MEM_WDATA49to49[49]   = MEM_WDATA[49:49];
assign COREAXI4SRAM_0_MEM_WDATA50to50[50]   = MEM_WDATA[50:50];
assign COREAXI4SRAM_0_MEM_WDATA51to51[51]   = MEM_WDATA[51:51];
assign COREAXI4SRAM_0_MEM_WDATA52to52[52]   = MEM_WDATA[52:52];
assign COREAXI4SRAM_0_MEM_WDATA53to53[53]   = MEM_WDATA[53:53];
assign COREAXI4SRAM_0_MEM_WDATA54to54[54]   = MEM_WDATA[54:54];
assign COREAXI4SRAM_0_MEM_WDATA55to55[55]   = MEM_WDATA[55:55];
assign COREAXI4SRAM_0_MEM_WDATA56to56[56]   = MEM_WDATA[56:56];
assign COREAXI4SRAM_0_MEM_WDATA57to57[57]   = MEM_WDATA[57:57];
assign COREAXI4SRAM_0_MEM_WDATA58to58[58]   = MEM_WDATA[58:58];
assign COREAXI4SRAM_0_MEM_WDATA59to59[59]   = MEM_WDATA[59:59];
assign COREAXI4SRAM_0_MEM_WDATA60to60[60]   = MEM_WDATA[60:60];
assign COREAXI4SRAM_0_MEM_WDATA61to61[61]   = MEM_WDATA[61:61];
assign COREAXI4SRAM_0_MEM_WDATA62to62[62]   = MEM_WDATA[62:62];
assign COREAXI4SRAM_0_MEM_WDATA63to63[63]   = MEM_WDATA[63:63];
assign PF_TPSRAM_AHB_AXI_0_R_DATA0to0[0]    = R_DATA_net_0[0:0];
assign PF_TPSRAM_AHB_AXI_0_R_DATA1to1[1]    = R_DATA_net_0[1:1];
assign PF_TPSRAM_AHB_AXI_0_R_DATA2to2[2]    = R_DATA_net_0[2:2];
assign PF_TPSRAM_AHB_AXI_0_R_DATA3to3[3]    = R_DATA_net_0[3:3];
assign PF_TPSRAM_AHB_AXI_0_R_DATA4to4[4]    = R_DATA_net_0[4:4];
assign PF_TPSRAM_AHB_AXI_0_R_DATA5to5[5]    = R_DATA_net_0[5:5];
assign PF_TPSRAM_AHB_AXI_0_R_DATA6to6[6]    = R_DATA_net_0[6:6];
assign PF_TPSRAM_AHB_AXI_0_R_DATA7to7[7]    = R_DATA_net_0[7:7];
assign PF_TPSRAM_AHB_AXI_0_R_DATA10to10[10] = R_DATA_net_0[10:10];
assign PF_TPSRAM_AHB_AXI_0_R_DATA11to11[11] = R_DATA_net_0[11:11];
assign PF_TPSRAM_AHB_AXI_0_R_DATA12to12[12] = R_DATA_net_0[12:12];
assign PF_TPSRAM_AHB_AXI_0_R_DATA13to13[13] = R_DATA_net_0[13:13];
assign PF_TPSRAM_AHB_AXI_0_R_DATA14to14[14] = R_DATA_net_0[14:14];
assign PF_TPSRAM_AHB_AXI_0_R_DATA15to15[15] = R_DATA_net_0[15:15];
assign PF_TPSRAM_AHB_AXI_0_R_DATA16to16[16] = R_DATA_net_0[16:16];
assign PF_TPSRAM_AHB_AXI_0_R_DATA17to17[17] = R_DATA_net_0[17:17];
assign PF_TPSRAM_AHB_AXI_0_R_DATA20to20[20] = R_DATA_net_0[20:20];
assign PF_TPSRAM_AHB_AXI_0_R_DATA21to21[21] = R_DATA_net_0[21:21];
assign PF_TPSRAM_AHB_AXI_0_R_DATA22to22[22] = R_DATA_net_0[22:22];
assign PF_TPSRAM_AHB_AXI_0_R_DATA23to23[23] = R_DATA_net_0[23:23];
assign PF_TPSRAM_AHB_AXI_0_R_DATA24to24[24] = R_DATA_net_0[24:24];
assign PF_TPSRAM_AHB_AXI_0_R_DATA25to25[25] = R_DATA_net_0[25:25];
assign PF_TPSRAM_AHB_AXI_0_R_DATA26to26[26] = R_DATA_net_0[26:26];
assign PF_TPSRAM_AHB_AXI_0_R_DATA27to27[27] = R_DATA_net_0[27:27];
assign PF_TPSRAM_AHB_AXI_0_R_DATA30to30[30] = R_DATA_net_0[30:30];
assign PF_TPSRAM_AHB_AXI_0_R_DATA31to31[31] = R_DATA_net_0[31:31];
assign PF_TPSRAM_AHB_AXI_0_R_DATA32to32[32] = R_DATA_net_0[32:32];
assign PF_TPSRAM_AHB_AXI_0_R_DATA33to33[33] = R_DATA_net_0[33:33];
assign PF_TPSRAM_AHB_AXI_0_R_DATA34to34[34] = R_DATA_net_0[34:34];
assign PF_TPSRAM_AHB_AXI_0_R_DATA35to35[35] = R_DATA_net_0[35:35];
assign PF_TPSRAM_AHB_AXI_0_R_DATA36to36[36] = R_DATA_net_0[36:36];
assign PF_TPSRAM_AHB_AXI_0_R_DATA37to37[37] = R_DATA_net_0[37:37];
assign PF_TPSRAM_AHB_AXI_0_R_DATA40to40[40] = R_DATA_net_0[40:40];
assign PF_TPSRAM_AHB_AXI_0_R_DATA41to41[41] = R_DATA_net_0[41:41];
assign PF_TPSRAM_AHB_AXI_0_R_DATA42to42[42] = R_DATA_net_0[42:42];
assign PF_TPSRAM_AHB_AXI_0_R_DATA43to43[43] = R_DATA_net_0[43:43];
assign PF_TPSRAM_AHB_AXI_0_R_DATA44to44[44] = R_DATA_net_0[44:44];
assign PF_TPSRAM_AHB_AXI_0_R_DATA45to45[45] = R_DATA_net_0[45:45];
assign PF_TPSRAM_AHB_AXI_0_R_DATA46to46[46] = R_DATA_net_0[46:46];
assign PF_TPSRAM_AHB_AXI_0_R_DATA47to47[47] = R_DATA_net_0[47:47];
assign PF_TPSRAM_AHB_AXI_0_R_DATA50to50[50] = R_DATA_net_0[50:50];
assign PF_TPSRAM_AHB_AXI_0_R_DATA51to51[51] = R_DATA_net_0[51:51];
assign PF_TPSRAM_AHB_AXI_0_R_DATA52to52[52] = R_DATA_net_0[52:52];
assign PF_TPSRAM_AHB_AXI_0_R_DATA53to53[53] = R_DATA_net_0[53:53];
assign PF_TPSRAM_AHB_AXI_0_R_DATA54to54[54] = R_DATA_net_0[54:54];
assign PF_TPSRAM_AHB_AXI_0_R_DATA55to55[55] = R_DATA_net_0[55:55];
assign PF_TPSRAM_AHB_AXI_0_R_DATA56to56[56] = R_DATA_net_0[56:56];
assign PF_TPSRAM_AHB_AXI_0_R_DATA57to57[57] = R_DATA_net_0[57:57];
assign PF_TPSRAM_AHB_AXI_0_R_DATA60to60[60] = R_DATA_net_0[60:60];
assign PF_TPSRAM_AHB_AXI_0_R_DATA61to61[61] = R_DATA_net_0[61:61];
assign PF_TPSRAM_AHB_AXI_0_R_DATA62to62[62] = R_DATA_net_0[62:62];
assign PF_TPSRAM_AHB_AXI_0_R_DATA63to63[63] = R_DATA_net_0[63:63];
assign PF_TPSRAM_AHB_AXI_0_R_DATA64to64[64] = R_DATA_net_0[64:64];
assign PF_TPSRAM_AHB_AXI_0_R_DATA65to65[65] = R_DATA_net_0[65:65];
assign PF_TPSRAM_AHB_AXI_0_R_DATA66to66[66] = R_DATA_net_0[66:66];
assign PF_TPSRAM_AHB_AXI_0_R_DATA67to67[67] = R_DATA_net_0[67:67];
assign PF_TPSRAM_AHB_AXI_0_R_DATA70to70[70] = R_DATA_net_0[70:70];
assign PF_TPSRAM_AHB_AXI_0_R_DATA71to71[71] = R_DATA_net_0[71:71];
assign PF_TPSRAM_AHB_AXI_0_R_DATA72to72[72] = R_DATA_net_0[72:72];
assign PF_TPSRAM_AHB_AXI_0_R_DATA73to73[73] = R_DATA_net_0[73:73];
assign PF_TPSRAM_AHB_AXI_0_R_DATA74to74[74] = R_DATA_net_0[74:74];
assign PF_TPSRAM_AHB_AXI_0_R_DATA75to75[75] = R_DATA_net_0[75:75];
assign PF_TPSRAM_AHB_AXI_0_R_DATA76to76[76] = R_DATA_net_0[76:76];
assign PF_TPSRAM_AHB_AXI_0_R_DATA77to77[77] = R_DATA_net_0[77:77];
assign R_DATA_slice_0[18]                   = R_DATA_net_0[18:18];
assign R_DATA_slice_1[19]                   = R_DATA_net_0[19:19];
assign R_DATA_slice_2[28]                   = R_DATA_net_0[28:28];
assign R_DATA_slice_3[29]                   = R_DATA_net_0[29:29];
assign R_DATA_slice_4[38]                   = R_DATA_net_0[38:38];
assign R_DATA_slice_5[39]                   = R_DATA_net_0[39:39];
assign R_DATA_slice_6[48]                   = R_DATA_net_0[48:48];
assign R_DATA_slice_7[49]                   = R_DATA_net_0[49:49];
assign R_DATA_slice_8[58]                   = R_DATA_net_0[58:58];
assign R_DATA_slice_9[59]                   = R_DATA_net_0[59:59];
assign R_DATA_slice_10[68]                  = R_DATA_net_0[68:68];
assign R_DATA_slice_11[69]                  = R_DATA_net_0[69:69];
assign R_DATA_slice_12[78]                  = R_DATA_net_0[78:78];
assign R_DATA_slice_13[79]                  = R_DATA_net_0[79:79];
assign R_DATA_slice_14[8]                   = R_DATA_net_0[8:8];
assign R_DATA_slice_15[9]                   = R_DATA_net_0[9:9];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign MEM_RDATA_net_0 = { PF_TPSRAM_AHB_AXI_0_R_DATA77to77[77] , PF_TPSRAM_AHB_AXI_0_R_DATA76to76[76] , PF_TPSRAM_AHB_AXI_0_R_DATA75to75[75] , PF_TPSRAM_AHB_AXI_0_R_DATA74to74[74] , PF_TPSRAM_AHB_AXI_0_R_DATA73to73[73] , PF_TPSRAM_AHB_AXI_0_R_DATA72to72[72] , PF_TPSRAM_AHB_AXI_0_R_DATA71to71[71] , PF_TPSRAM_AHB_AXI_0_R_DATA70to70[70] , PF_TPSRAM_AHB_AXI_0_R_DATA67to67[67] , PF_TPSRAM_AHB_AXI_0_R_DATA66to66[66] , PF_TPSRAM_AHB_AXI_0_R_DATA65to65[65] , PF_TPSRAM_AHB_AXI_0_R_DATA64to64[64] , PF_TPSRAM_AHB_AXI_0_R_DATA63to63[63] , PF_TPSRAM_AHB_AXI_0_R_DATA62to62[62] , PF_TPSRAM_AHB_AXI_0_R_DATA61to61[61] , PF_TPSRAM_AHB_AXI_0_R_DATA60to60[60] , PF_TPSRAM_AHB_AXI_0_R_DATA57to57[57] , PF_TPSRAM_AHB_AXI_0_R_DATA56to56[56] , PF_TPSRAM_AHB_AXI_0_R_DATA55to55[55] , PF_TPSRAM_AHB_AXI_0_R_DATA54to54[54] , PF_TPSRAM_AHB_AXI_0_R_DATA53to53[53] , PF_TPSRAM_AHB_AXI_0_R_DATA52to52[52] , PF_TPSRAM_AHB_AXI_0_R_DATA51to51[51] , PF_TPSRAM_AHB_AXI_0_R_DATA50to50[50] , PF_TPSRAM_AHB_AXI_0_R_DATA47to47[47] , PF_TPSRAM_AHB_AXI_0_R_DATA46to46[46] , PF_TPSRAM_AHB_AXI_0_R_DATA45to45[45] , PF_TPSRAM_AHB_AXI_0_R_DATA44to44[44] , PF_TPSRAM_AHB_AXI_0_R_DATA43to43[43] , PF_TPSRAM_AHB_AXI_0_R_DATA42to42[42] , PF_TPSRAM_AHB_AXI_0_R_DATA41to41[41] , PF_TPSRAM_AHB_AXI_0_R_DATA40to40[40] , PF_TPSRAM_AHB_AXI_0_R_DATA37to37[37] , PF_TPSRAM_AHB_AXI_0_R_DATA36to36[36] , PF_TPSRAM_AHB_AXI_0_R_DATA35to35[35] , PF_TPSRAM_AHB_AXI_0_R_DATA34to34[34] , PF_TPSRAM_AHB_AXI_0_R_DATA33to33[33] , PF_TPSRAM_AHB_AXI_0_R_DATA32to32[32] , PF_TPSRAM_AHB_AXI_0_R_DATA31to31[31] , PF_TPSRAM_AHB_AXI_0_R_DATA30to30[30] , PF_TPSRAM_AHB_AXI_0_R_DATA27to27[27] , PF_TPSRAM_AHB_AXI_0_R_DATA26to26[26] , PF_TPSRAM_AHB_AXI_0_R_DATA25to25[25] , PF_TPSRAM_AHB_AXI_0_R_DATA24to24[24] , PF_TPSRAM_AHB_AXI_0_R_DATA23to23[23] , PF_TPSRAM_AHB_AXI_0_R_DATA22to22[22] , PF_TPSRAM_AHB_AXI_0_R_DATA21to21[21] , PF_TPSRAM_AHB_AXI_0_R_DATA20to20[20] , PF_TPSRAM_AHB_AXI_0_R_DATA17to17[17] , PF_TPSRAM_AHB_AXI_0_R_DATA16to16[16] , PF_TPSRAM_AHB_AXI_0_R_DATA15to15[15] , PF_TPSRAM_AHB_AXI_0_R_DATA14to14[14] , PF_TPSRAM_AHB_AXI_0_R_DATA13to13[13] , PF_TPSRAM_AHB_AXI_0_R_DATA12to12[12] , PF_TPSRAM_AHB_AXI_0_R_DATA11to11[11] , PF_TPSRAM_AHB_AXI_0_R_DATA10to10[10] , PF_TPSRAM_AHB_AXI_0_R_DATA7to7[7] , PF_TPSRAM_AHB_AXI_0_R_DATA6to6[6] , PF_TPSRAM_AHB_AXI_0_R_DATA5to5[5] , PF_TPSRAM_AHB_AXI_0_R_DATA4to4[4] , PF_TPSRAM_AHB_AXI_0_R_DATA3to3[3] , PF_TPSRAM_AHB_AXI_0_R_DATA2to2[2] , PF_TPSRAM_AHB_AXI_0_R_DATA1to1[1] , PF_TPSRAM_AHB_AXI_0_R_DATA0to0[0] };
assign W_DATA_net_0    = { 1'b0 , 1'b0 , COREAXI4SRAM_0_MEM_WDATA63to63[63] , COREAXI4SRAM_0_MEM_WDATA62to62[62] , COREAXI4SRAM_0_MEM_WDATA61to61[61] , COREAXI4SRAM_0_MEM_WDATA60to60[60] , COREAXI4SRAM_0_MEM_WDATA59to59[59] , COREAXI4SRAM_0_MEM_WDATA58to58[58] , COREAXI4SRAM_0_MEM_WDATA57to57[57] , COREAXI4SRAM_0_MEM_WDATA56to56[56] , 1'b0 , 1'b0 , COREAXI4SRAM_0_MEM_WDATA55to55[55] , COREAXI4SRAM_0_MEM_WDATA54to54[54] , COREAXI4SRAM_0_MEM_WDATA53to53[53] , COREAXI4SRAM_0_MEM_WDATA52to52[52] , COREAXI4SRAM_0_MEM_WDATA51to51[51] , COREAXI4SRAM_0_MEM_WDATA50to50[50] , COREAXI4SRAM_0_MEM_WDATA49to49[49] , COREAXI4SRAM_0_MEM_WDATA48to48[48] , 1'b0 , 1'b0 , COREAXI4SRAM_0_MEM_WDATA47to47[47] , COREAXI4SRAM_0_MEM_WDATA46to46[46] , COREAXI4SRAM_0_MEM_WDATA45to45[45] , COREAXI4SRAM_0_MEM_WDATA44to44[44] , COREAXI4SRAM_0_MEM_WDATA43to43[43] , COREAXI4SRAM_0_MEM_WDATA42to42[42] , COREAXI4SRAM_0_MEM_WDATA41to41[41] , COREAXI4SRAM_0_MEM_WDATA40to40[40] , 1'b0 , 1'b0 , COREAXI4SRAM_0_MEM_WDATA39to39[39] , COREAXI4SRAM_0_MEM_WDATA38to38[38] , COREAXI4SRAM_0_MEM_WDATA37to37[37] , COREAXI4SRAM_0_MEM_WDATA36to36[36] , COREAXI4SRAM_0_MEM_WDATA35to35[35] , COREAXI4SRAM_0_MEM_WDATA34to34[34] , COREAXI4SRAM_0_MEM_WDATA33to33[33] , COREAXI4SRAM_0_MEM_WDATA32to32[32] , 1'b0 , 1'b0 , COREAXI4SRAM_0_MEM_WDATA31to31[31] , COREAXI4SRAM_0_MEM_WDATA30to30[30] , COREAXI4SRAM_0_MEM_WDATA29to29[29] , COREAXI4SRAM_0_MEM_WDATA28to28[28] , COREAXI4SRAM_0_MEM_WDATA27to27[27] , COREAXI4SRAM_0_MEM_WDATA26to26[26] , COREAXI4SRAM_0_MEM_WDATA25to25[25] , COREAXI4SRAM_0_MEM_WDATA24to24[24] , 1'b0 , 1'b0 , COREAXI4SRAM_0_MEM_WDATA23to23[23] , COREAXI4SRAM_0_MEM_WDATA22to22[22] , COREAXI4SRAM_0_MEM_WDATA21to21[21] , COREAXI4SRAM_0_MEM_WDATA20to20[20] , COREAXI4SRAM_0_MEM_WDATA19to19[19] , COREAXI4SRAM_0_MEM_WDATA18to18[18] , COREAXI4SRAM_0_MEM_WDATA17to17[17] , COREAXI4SRAM_0_MEM_WDATA16to16[16] , 1'b0 , 1'b0 , COREAXI4SRAM_0_MEM_WDATA15to15[15] , COREAXI4SRAM_0_MEM_WDATA14to14[14] , COREAXI4SRAM_0_MEM_WDATA13to13[13] , COREAXI4SRAM_0_MEM_WDATA12to12[12] , COREAXI4SRAM_0_MEM_WDATA11to11[11] , COREAXI4SRAM_0_MEM_WDATA10to10[10] , COREAXI4SRAM_0_MEM_WDATA9to9[9] , COREAXI4SRAM_0_MEM_WDATA8to8[8] , 1'b0 , 1'b0 , COREAXI4SRAM_0_MEM_WDATA7to7[7] , COREAXI4SRAM_0_MEM_WDATA6to6[6] , COREAXI4SRAM_0_MEM_WDATA5to5[5] , COREAXI4SRAM_0_MEM_WDATA4to4[4] , COREAXI4SRAM_0_MEM_WDATA3to3[3] , COREAXI4SRAM_0_MEM_WDATA2to2[2] , COREAXI4SRAM_0_MEM_WDATA1to1[1] , COREAXI4SRAM_0_MEM_WDATA0to0[0] };
assign WBYTE_EN_net_0  = { COREAXI4SRAM_0_MEM_WBYTE_EN7to7[7] , COREAXI4SRAM_0_MEM_WBYTE_EN6to6[6] , COREAXI4SRAM_0_MEM_WBYTE_EN5to5[5] , COREAXI4SRAM_0_MEM_WBYTE_EN4to4[4] , COREAXI4SRAM_0_MEM_WBYTE_EN3to3[3] , COREAXI4SRAM_0_MEM_WBYTE_EN2to2[2] , COREAXI4SRAM_0_MEM_WBYTE_EN1to1[1] , COREAXI4SRAM_0_MEM_WBYTE_EN0to0[0] };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------SRAM_AXI_COREAXI4SRAM_0_COREAXI4SRAM   -   Actel:DirectCore:COREAXI4SRAM:2.7.102
SRAM_AXI_COREAXI4SRAM_0_COREAXI4SRAM #( 
        .AXI4_AWIDTH    ( 32 ),
        .AXI4_DWIDTH    ( 64 ),
        .AXI4_IDWIDTH   ( 6 ),
        .AXI4_IFTYPE_RD ( 1 ),
        .AXI4_IFTYPE_WR ( 1 ),
        .ECC            ( 0 ),
        .FAMILY         ( 26 ),
        .MEM_DEPTH      ( 512 ),
        .PIPE           ( 1 ),
        .SEL_SRAM_TYPE  ( 1 ),
        .WRAP_SUPPORT   ( 0 ) )
COREAXI4SRAM_0(
        // Inputs
        .ACLK         ( ACLK ),
        .ARESETN      ( ARESETN ),
        .AWADDR       ( AWADDR ),
        .AWLEN        ( AWLEN ),
        .AWSIZE       ( AWSIZE ),
        .AWBURST      ( AWBURST ),
        .AWCACHE      ( AWCACHE ),
        .AWPROT       ( AWPROT ),
        .AWLOCK       ( AWLOCK ),
        .AWVALID      ( AWVALID ),
        .WDATA        ( WDATA ),
        .WSTRB        ( WSTRB ),
        .WLAST        ( WLAST ),
        .WVALID       ( WVALID ),
        .BREADY       ( BREADY ),
        .ARADDR       ( ARADDR ),
        .ARLEN        ( ARLEN ),
        .ARSIZE       ( ARSIZE ),
        .ARBURST      ( ARBURST ),
        .ARCACHE      ( ARCACHE ),
        .ARPROT       ( ARPROT ),
        .ARLOCK       ( ARLOCK ),
        .ARVALID      ( ARVALID ),
        .RREADY       ( RREADY ),
        .AWID         ( AWID ),
        .ARID         ( ARID ),
        .MEM_RDATA    ( MEM_RDATA_net_0 ),
        // Outputs
        .AWREADY      ( AXI4_Slave_AWREADY ),
        .WREADY       ( AXI4_Slave_WREADY ),
        .BRESP        ( AXI4_Slave_BRESP ),
        .BVALID       ( AXI4_Slave_BVALID ),
        .ARREADY      ( AXI4_Slave_ARREADY ),
        .RDATA        ( AXI4_Slave_RDATA ),
        .RRESP        ( AXI4_Slave_RRESP ),
        .RLAST        ( AXI4_Slave_RLAST ),
        .RVALID       ( AXI4_Slave_RVALID ),
        .RID          ( AXI4_Slave_RID ),
        .BID          ( AXI4_Slave_BID ),
        .MEM_WADDR    ( COREAXI4SRAM_0_MEM_WADDR ),
        .MEM_WDATA    ( MEM_WDATA ),
        .MEM_REN      ( COREAXI4SRAM_0_MEM_REN ),
        .MEM_WEN      ( COREAXI4SRAM_0_MEM_WEN ),
        .MEM_RADDR    ( COREAXI4SRAM_0_MEM_RADDR ),
        .MEM_WBYTE_EN ( MEM_WBYTE_EN ) 
        );

//--------SRAM_AXI_PF_TPSRAM_AHB_AXI_0_PF_TPSRAM   -   Actel:SgCore:PF_TPSRAM:1.1.108
SRAM_AXI_PF_TPSRAM_AHB_AXI_0_PF_TPSRAM PF_TPSRAM_AHB_AXI_0(
        // Inputs
        .W_DATA   ( W_DATA_net_0 ),
        .W_ADDR   ( COREAXI4SRAM_0_MEM_WADDR ),
        .R_ADDR   ( COREAXI4SRAM_0_MEM_RADDR ),
        .WBYTE_EN ( WBYTE_EN_net_0 ),
        .W_EN     ( COREAXI4SRAM_0_MEM_WEN ),
        .R_EN     ( COREAXI4SRAM_0_MEM_REN ),
        .CLK      ( ACLK ),
        // Outputs
        .R_DATA   ( R_DATA_net_0 ) 
        );


endmodule
