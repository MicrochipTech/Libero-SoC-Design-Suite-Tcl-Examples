`timescale 1 ns/100 ps
// Version: 


module APBM(
       PRDATA,
       PREADY,
       PSLVERR,
       PINTERRUPT,
       PRESETN,
       PSEL,
       PENABLE,
       PWRITE,
       PSTRB,
       PADDR,
       PWDATA,
       PSELFAST,
       PSTRBCLK,
       PCLK
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  [31:0] PRDATA;
input  PREADY;
input  PSLVERR;
input  PINTERRUPT;
output PRESETN;
output PSEL;
output PENABLE;
output PWRITE;
output [3:0] PSTRB;
output [28:0] PADDR;
output [31:0] PWDATA;
output PSELFAST;
output PSTRBCLK;
output PCLK;

endmodule
`timescale 1 ns/100 ps
// Version: 


module APBS(
       PCLK,
       PSEL,
       PENABLE,
       PWRITE,
       PADDR,
       PSTRB,
       PWDATA,
       PRESETN,
       PRDATA,
       PREADY,
       PSLVERR,
       PINTERRUPT,
       PTIMEOUT,
       BUSERROR
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  PCLK;
input  PSEL;
input  PENABLE;
input  PWRITE;
input  [28:0] PADDR;
input  [3:0] PSTRB;
input  [31:0] PWDATA;
input  PRESETN;
output [31:0] PRDATA;
output PREADY;
output PSLVERR;
output PINTERRUPT;
output PTIMEOUT;
output BUSERROR;

endmodule
`timescale 1 ns/100 ps
// Version: 


module BANKCTRLM(
       A
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  A;
parameter PC_IMIR_CALIB_DIRECTION = 1'h0;
parameter PC_IMIR_CALIB_LOAD = 1'h0;
parameter PC_IMIR_CALIB_LOCK = 1'h0;
parameter PC_IMIR_CALIB_MOVE_PCODE = 1'h0;
parameter PC_IMIR_CALIB_START = 1'h0;
parameter PC_IMIR_CALIB_TRIM = 1'h0;
parameter PC_IMIR_CALIB_PCODE = 8'h0;
parameter PC_IMIR_POFFSET = 6'h0;
parameter PC_IMIR_POFFSET_DIR = 1'h0;
parameter PC_IMIR_EN_V1P2BUF = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module BANKCTRL_GPIO(
       CALIB_DIRECTION,
       CALIB_LOAD,
       CALIB_LOCK,
       CALIB_MOVE_NCODE,
       CALIB_MOVE_PCODE,
       CALIB_START,
       CALIB_MOVE_DIFFR_PVT,
       CALIB_STATUS,
       CALIB_INTERRUPT
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  CALIB_DIRECTION;
input  CALIB_LOAD;
input  CALIB_LOCK;
input  CALIB_MOVE_NCODE;
input  CALIB_MOVE_PCODE;
input  CALIB_START;
input  CALIB_MOVE_DIFFR_PVT;
output CALIB_STATUS;
output CALIB_INTERRUPT;
parameter CALIB_STATUS_SIMULATION_DELAY = 0.0;
parameter BANK_NUMBER = "";
parameter PC_REG_CALIB_SOFTRESET = 1'h0;
parameter PC_REG_CALIB_PCODE = 6'h0;
parameter PC_REG_CALIB_NCODE = 6'h0;
parameter PC_REG_CALIB_TRIM = 1'h0;
parameter PC_REG_CALIB_START = 1'h0;
parameter PC_REG_CALIB_LOCK = 1'h0;
parameter PC_REG_CALIB_LOAD = 1'h0;
parameter PC_REG_CALIB_DIR = 1'h0;
parameter PC_REG_CALIB_MOVE_PCODE = 1'h0;
parameter PC_REG_CALIB_MOVE_NCODE = 1'h0;
parameter PC_REG_CALIB_DIFFR = 4'h0;
parameter PC_CALIB_MOVE_DIFF = 1'h0;
parameter PC_CALIB_D_OFFSET = 4'h0;
parameter PC_CALIB_D_OFFSET_DIRECTION = 1'h0;
parameter PC_CALIB_N_OFFSET = 6'h0;
parameter PC_CALIB_N_OFFSET_DIRECTION = 1'h0;
parameter PC_CALIB_P_OFFSET = 6'h0;
parameter PC_CALIB_P_OFFSET_DIRECTION = 1'h0;
parameter PC_REG_DIFFR_VSEL = 2'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module BANKCTRL_HSIO(
       CALIB_DIRECTION,
       CALIB_LOAD,
       CALIB_LOCK,
       CALIB_MOVE_NCODE,
       CALIB_MOVE_PCODE,
       CALIB_START,
       CALIB_MOVE_SLEWR,
       CALIB_MOVE_SLEWF,
       CALIB_STATUS,
       CALIB_INTERRUPT
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  CALIB_DIRECTION;
input  CALIB_LOAD;
input  CALIB_LOCK;
input  CALIB_MOVE_NCODE;
input  CALIB_MOVE_PCODE;
input  CALIB_START;
input  CALIB_MOVE_SLEWR;
input  CALIB_MOVE_SLEWF;
output CALIB_STATUS;
output CALIB_INTERRUPT;
parameter CALIB_STATUS_SIMULATION_DELAY = 0.0;
parameter BANK_NUMBER = "";
parameter PC_REG_CALIB_SOFTRESET = 1'h0;
parameter PC_REG_CALIB_PCODE = 6'h0;
parameter PC_REG_CALIB_NCODE = 6'h0;
parameter PC_REG_CALIB_TRIM = 1'h0;
parameter PC_REG_CALIB_START = 1'h0;
parameter PC_REG_CALIB_LOCK = 1'h0;
parameter PC_REG_CALIB_LOAD = 1'h0;
parameter PC_REG_CALIB_DIR = 1'h0;
parameter PC_REG_CALIB_MOVE_PCODE = 1'h0;
parameter PC_REG_CALIB_MOVE_NCODE = 1'h0;
parameter PC_CALIB_N_OFFSET = 6'h0;
parameter PC_CALIB_N_OFFSET_DIRECTION = 1'h0;
parameter PC_CALIB_P_OFFSET = 6'h0;
parameter PC_CALIB_P_OFFSET_DIRECTION = 1'h0;
parameter PC_SLEWR = 6'h0;
parameter PC_SLEWF = 6'h0;
parameter PC_CALIB_ROFFSET = 6'h0;
parameter PC_CALIB_FOFFSET = 6'h0;
parameter PC_CALIB_ROFFSET_DIR = 1'h0;
parameter PC_CALIB_FOFFSET_DIR = 1'h0;
parameter PC_CALIB_MOVE_SLEWR = 1'h0;
parameter PC_CALIB_MOVE_SLEWF = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module BANKEN(
       BANK_EN
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
output BANK_EN;
parameter BANK_EN_SIMULATION_DELAY = 0.0;
parameter BANK_NUMBER = "";

endmodule
`timescale 1 ns/100 ps
// Version: 


module CRN_COMMON(
       REFCLK_SYNC_EN,
       CFM_CLKOUT,
       PLL0_REFCLK_SYNC_EN,
       PLL1_REFCLK_SYNC_EN
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  REFCLK_SYNC_EN;
output CFM_CLKOUT;
output PLL0_REFCLK_SYNC_EN;
output PLL1_REFCLK_SYNC_EN;
parameter PC_CIMUX_GEN0_SEL = 4'h0;
parameter PC_CIMUX_GEN1_SEL = 4'h0;
parameter PC_CIMUX_GEN2_SEL = 4'h0;
parameter PC_CIMUX_GEN3_SEL = 4'h0;
parameter PC_CIMUX_GEN4_SEL = 2'h0;
parameter PC_CIMUX_GEN5_SEL = 2'h0;
parameter PC_CIMUX_REF0_SEL = 4'h0;
parameter PC_CIMUX_REF1_SEL = 4'h0;
parameter PC_CIMUX_REF2_SEL = 4'h0;
parameter PC_CIMUX_REF3_SEL = 4'h0;
parameter PC_CIMUX_REF4_SEL = 4'h0;
parameter PC_CIMUX_REF5_SEL = 4'h0;
parameter PC_CIMUX_REF6_SEL = 4'h0;
parameter PC_CIMUX_REF7_SEL = 4'h0;
parameter PC_CIMUX_REF8_SEL = 4'h0;
parameter PC_CIMUX_REF9_SEL = 4'h0;
parameter PC_CDMUX6_SEL = 1'h0;
parameter PC_COMUX0_SEL = 4'h0;
parameter PC_COMUX1_SEL = 4'h0;
parameter PC_COMUX2_SEL = 4'h0;
parameter PC_COMUX3_SEL = 4'h0;
parameter PC_COMUX4_SEL = 4'h0;
parameter PC_COMUX5_SEL = 4'h0;
parameter PC_COMUX6_SEL = 4'h0;
parameter PC_COMUX7_SEL = 4'h0;
parameter PC_SRMUX0_SEL = 3'h0;
parameter PC_SRMUX1_SEL = 3'h0;
parameter PC_CRNFDR_HORZ_EN = 8'h0;
parameter PC_CRNFR_VERT_EN = 8'h0;
parameter PC_SOFTRESET = 1'h0;
parameter PC_DYN_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module CRN_INT(
       A,
       Y
    ) ;
/* synthesis syn_black_box

syn_trr0 = " A->Y = 1.438"
syn_tff0 = " A->Y = 1.438"
*/
/* synthesis black_box_pad_pin ="" */
input  A;
output Y;

endmodule
`timescale 1 ns/100 ps
// Version: 


module CRYPTO(
       HCLK,
       HRESETN,
       M_HREADY,
       M_HRESP,
       M_HRDATA,
       S_HSEL,
       S_HADDR,
       S_HWDATA,
       S_HSIZE,
       S_HTRANS,
       S_HWRITE,
       S_HREADY,
       PURGE,
       START,
       TEST_CALIB_IN,
       TEST_CALIB_RESET_B,
       STALL,
       M_HADDR,
       M_HWDATA,
       M_HSIZE,
       M_HTRANS,
       M_HWRITE,
       M_HMASTLOCK,
       S_HREADYOUT,
       S_HRESP,
       S_HRDATA,
       BUSY,
       COMPLETE,
       ALARM,
       TEST_CALIB_OUT,
       TEST_DLL_LOCKED,
       BUS_ERROR,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " M_HRDATA[0]->HCLK = 0.967"
syn_tsu1 = " M_HRDATA[10]->HCLK = 0.934"
syn_tsu2 = " M_HRDATA[11]->HCLK = 0.88"
syn_tsu3 = " M_HRDATA[12]->HCLK = 0.917"
syn_tsu4 = " M_HRDATA[13]->HCLK = 0.914"
syn_tsu5 = " M_HRDATA[14]->HCLK = 0.885"
syn_tsu6 = " M_HRDATA[15]->HCLK = 0.884"
syn_tsu7 = " M_HRDATA[16]->HCLK = 0.964"
syn_tsu8 = " M_HRDATA[17]->HCLK = 0.931"
syn_tsu9 = " M_HRDATA[18]->HCLK = 0.911"
syn_tsu10 = " M_HRDATA[19]->HCLK = 0.888"
syn_tsu11 = " M_HRDATA[1]->HCLK = 1.022"
syn_tsu12 = " M_HRDATA[20]->HCLK = 0.906"
syn_tsu13 = " M_HRDATA[21]->HCLK = 0.861"
syn_tsu14 = " M_HRDATA[22]->HCLK = 0.861"
syn_tsu15 = " M_HRDATA[23]->HCLK = 0.872"
syn_tsu16 = " M_HRDATA[24]->HCLK = 0.841"
syn_tsu17 = " M_HRDATA[25]->HCLK = 0.915"
syn_tsu18 = " M_HRDATA[26]->HCLK = 0.899"
syn_tsu19 = " M_HRDATA[27]->HCLK = 0.898"
syn_tsu20 = " M_HRDATA[28]->HCLK = 0.879"
syn_tsu21 = " M_HRDATA[29]->HCLK = 0.894"
syn_tsu22 = " M_HRDATA[2]->HCLK = 0.91"
syn_tsu23 = " M_HRDATA[30]->HCLK = 0.849"
syn_tsu24 = " M_HRDATA[31]->HCLK = 0.878"
syn_tsu25 = " M_HRDATA[3]->HCLK = 0.928"
syn_tsu26 = " M_HRDATA[4]->HCLK = 0.884"
syn_tsu27 = " M_HRDATA[5]->HCLK = 0.862"
syn_tsu28 = " M_HRDATA[6]->HCLK = 0.9"
syn_tsu29 = " M_HRDATA[7]->HCLK = 0.893"
syn_tsu30 = " M_HRDATA[8]->HCLK = 0.912"
syn_tsu31 = " M_HRDATA[9]->HCLK = 0.934"
syn_tsu32 = " M_HREADY->HCLK = 1.651"
syn_tsu33 = " M_HRESP->HCLK = 0.965"
syn_tsu34 = " PURGE->HCLK = 1.597"
syn_tsu35 = " STALL->HCLK = 0.998"
syn_tsu36 = " START->HCLK = 1.562"
syn_tsu37 = " S_HADDR[10]->HCLK = 1.03"
syn_tsu38 = " S_HADDR[11]->HCLK = 0.997"
syn_tsu39 = " S_HADDR[12]->HCLK = 0.976"
syn_tsu40 = " S_HADDR[13]->HCLK = 1.007"
syn_tsu41 = " S_HADDR[14]->HCLK = 1.339"
syn_tsu42 = " S_HADDR[15]->HCLK = 1.29"
syn_tsu43 = " S_HADDR[16]->HCLK = 1.369"
syn_tsu44 = " S_HADDR[2]->HCLK = 1.022"
syn_tsu45 = " S_HADDR[3]->HCLK = 0.932"
syn_tsu46 = " S_HADDR[4]->HCLK = 1.204"
syn_tsu47 = " S_HADDR[5]->HCLK = 1.207"
syn_tsu48 = " S_HADDR[6]->HCLK = 1.135"
syn_tsu49 = " S_HADDR[7]->HCLK = 0.983"
syn_tsu50 = " S_HADDR[8]->HCLK = 1.013"
syn_tsu51 = " S_HADDR[9]->HCLK = 1.034"
syn_tsu52 = " S_HREADY->HCLK = 1.728"
syn_tsu53 = " S_HSEL->HCLK = 1.73"
syn_tsu54 = " S_HTRANS[1]->HCLK = 1.712"
syn_tsu55 = " S_HWDATA[0]->HCLK = 1.222"
syn_tsu56 = " S_HWDATA[10]->HCLK = 0.974"
syn_tsu57 = " S_HWDATA[11]->HCLK = 0.995"
syn_tsu58 = " S_HWDATA[12]->HCLK = 1.171"
syn_tsu59 = " S_HWDATA[13]->HCLK = 1.013"
syn_tsu60 = " S_HWDATA[14]->HCLK = 0.982"
syn_tsu61 = " S_HWDATA[15]->HCLK = 0.974"
syn_tsu62 = " S_HWDATA[16]->HCLK = 0.971"
syn_tsu63 = " S_HWDATA[17]->HCLK = 0.966"
syn_tsu64 = " S_HWDATA[18]->HCLK = 0.971"
syn_tsu65 = " S_HWDATA[19]->HCLK = 1.026"
syn_tsu66 = " S_HWDATA[1]->HCLK = 1.09"
syn_tsu67 = " S_HWDATA[20]->HCLK = 1.005"
syn_tsu68 = " S_HWDATA[21]->HCLK = 1.031"
syn_tsu69 = " S_HWDATA[22]->HCLK = 0.989"
syn_tsu70 = " S_HWDATA[23]->HCLK = 1.012"
syn_tsu71 = " S_HWDATA[24]->HCLK = 0.998"
syn_tsu72 = " S_HWDATA[25]->HCLK = 0.991"
syn_tsu73 = " S_HWDATA[26]->HCLK = 1.027"
syn_tsu74 = " S_HWDATA[27]->HCLK = 0.979"
syn_tsu75 = " S_HWDATA[28]->HCLK = 0.984"
syn_tsu76 = " S_HWDATA[29]->HCLK = 0.994"
syn_tsu77 = " S_HWDATA[2]->HCLK = 1.019"
syn_tsu78 = " S_HWDATA[30]->HCLK = 0.978"
syn_tsu79 = " S_HWDATA[31]->HCLK = 0.978"
syn_tsu80 = " S_HWDATA[3]->HCLK = 1.161"
syn_tsu81 = " S_HWDATA[4]->HCLK = 0.949"
syn_tsu82 = " S_HWDATA[5]->HCLK = 1.201"
syn_tsu83 = " S_HWDATA[6]->HCLK = 1.112"
syn_tsu84 = " S_HWDATA[7]->HCLK = 1.077"
syn_tsu85 = " S_HWDATA[8]->HCLK = 0.966"
syn_tsu86 = " S_HWDATA[9]->HCLK = 0.994"
syn_tsu87 = " S_HWRITE->HCLK = 1.358"
syn_tco0 = " HCLK->ALARM = 2.259"
syn_tco1 = " HCLK->BUSY = 2.307"
syn_tco2 = " HCLK->BUS_ERROR = 2.235"
syn_tco3 = " HCLK->COMPLETE = 2.297"
syn_tco4 = " HCLK->M_HADDR[0] = 2.225"
syn_tco5 = " HCLK->M_HADDR[10] = 2.185"
syn_tco6 = " HCLK->M_HADDR[11] = 2.171"
syn_tco7 = " HCLK->M_HADDR[12] = 2.193"
syn_tco8 = " HCLK->M_HADDR[13] = 2.207"
syn_tco9 = " HCLK->M_HADDR[14] = 2.200"
syn_tco10 = " HCLK->M_HADDR[15] = 2.181"
syn_tco11 = " HCLK->M_HADDR[16] = 2.175"
syn_tco12 = " HCLK->M_HADDR[17] = 2.204"
syn_tco13 = " HCLK->M_HADDR[18] = 2.193"
syn_tco14 = " HCLK->M_HADDR[19] = 2.210"
syn_tco15 = " HCLK->M_HADDR[1] = 2.199"
syn_tco16 = " HCLK->M_HADDR[20] = 2.180"
syn_tco17 = " HCLK->M_HADDR[21] = 2.177"
syn_tco18 = " HCLK->M_HADDR[22] = 2.170"
syn_tco19 = " HCLK->M_HADDR[23] = 2.204"
syn_tco20 = " HCLK->M_HADDR[24] = 2.184"
syn_tco21 = " HCLK->M_HADDR[25] = 2.166"
syn_tco22 = " HCLK->M_HADDR[26] = 2.191"
syn_tco23 = " HCLK->M_HADDR[27] = 2.170"
syn_tco24 = " HCLK->M_HADDR[28] = 2.181"
syn_tco25 = " HCLK->M_HADDR[29] = 2.196"
syn_tco26 = " HCLK->M_HADDR[2] = 2.203"
syn_tco27 = " HCLK->M_HADDR[30] = 2.226"
syn_tco28 = " HCLK->M_HADDR[31] = 2.190"
syn_tco29 = " HCLK->M_HADDR[3] = 2.187"
syn_tco30 = " HCLK->M_HADDR[4] = 2.204"
syn_tco31 = " HCLK->M_HADDR[5] = 2.167"
syn_tco32 = " HCLK->M_HADDR[6] = 2.199"
syn_tco33 = " HCLK->M_HADDR[7] = 2.211"
syn_tco34 = " HCLK->M_HADDR[8] = 2.213"
syn_tco35 = " HCLK->M_HADDR[9] = 2.203"
syn_tco36 = " HCLK->M_HSIZE[0] = 2.171"
syn_tco37 = " HCLK->M_HSIZE[1] = 2.184"
syn_tco38 = " HCLK->M_HTRANS[0] = 2.409"
syn_tco39 = " HCLK->M_HTRANS[1] = 2.381"
syn_tco40 = " HCLK->M_HWDATA[0] = 2.178"
syn_tco41 = " HCLK->M_HWDATA[10] = 2.244"
syn_tco42 = " HCLK->M_HWDATA[11] = 2.292"
syn_tco43 = " HCLK->M_HWDATA[12] = 2.279"
syn_tco44 = " HCLK->M_HWDATA[13] = 2.271"
syn_tco45 = " HCLK->M_HWDATA[14] = 2.270"
syn_tco46 = " HCLK->M_HWDATA[15] = 2.254"
syn_tco47 = " HCLK->M_HWDATA[16] = 2.183"
syn_tco48 = " HCLK->M_HWDATA[17] = 2.165"
syn_tco49 = " HCLK->M_HWDATA[18] = 2.178"
syn_tco50 = " HCLK->M_HWDATA[19] = 2.181"
syn_tco51 = " HCLK->M_HWDATA[1] = 2.246"
syn_tco52 = " HCLK->M_HWDATA[20] = 2.167"
syn_tco53 = " HCLK->M_HWDATA[21] = 2.177"
syn_tco54 = " HCLK->M_HWDATA[22] = 2.177"
syn_tco55 = " HCLK->M_HWDATA[23] = 2.140"
syn_tco56 = " HCLK->M_HWDATA[24] = 2.170"
syn_tco57 = " HCLK->M_HWDATA[25] = 2.160"
syn_tco58 = " HCLK->M_HWDATA[26] = 2.165"
syn_tco59 = " HCLK->M_HWDATA[27] = 2.145"
syn_tco60 = " HCLK->M_HWDATA[28] = 2.148"
syn_tco61 = " HCLK->M_HWDATA[29] = 2.157"
syn_tco62 = " HCLK->M_HWDATA[2] = 2.148"
syn_tco63 = " HCLK->M_HWDATA[30] = 2.165"
syn_tco64 = " HCLK->M_HWDATA[31] = 2.158"
syn_tco65 = " HCLK->M_HWDATA[3] = 2.138"
syn_tco66 = " HCLK->M_HWDATA[4] = 2.145"
syn_tco67 = " HCLK->M_HWDATA[5] = 2.237"
syn_tco68 = " HCLK->M_HWDATA[6] = 2.256"
syn_tco69 = " HCLK->M_HWDATA[7] = 2.231"
syn_tco70 = " HCLK->M_HWDATA[8] = 2.219"
syn_tco71 = " HCLK->M_HWDATA[9] = 2.240"
syn_tco72 = " HCLK->M_HWRITE = 2.277"
syn_tco73 = " HCLK->S_HRDATA[0] = 2.136"
syn_tco74 = " HCLK->S_HRDATA[10] = 2.197"
syn_tco75 = " HCLK->S_HRDATA[11] = 2.190"
syn_tco76 = " HCLK->S_HRDATA[12] = 2.179"
syn_tco77 = " HCLK->S_HRDATA[13] = 2.193"
syn_tco78 = " HCLK->S_HRDATA[14] = 2.182"
syn_tco79 = " HCLK->S_HRDATA[15] = 2.123"
syn_tco80 = " HCLK->S_HRDATA[16] = 2.144"
syn_tco81 = " HCLK->S_HRDATA[17] = 2.144"
syn_tco82 = " HCLK->S_HRDATA[18] = 2.009"
syn_tco83 = " HCLK->S_HRDATA[19] = 2.157"
syn_tco84 = " HCLK->S_HRDATA[1] = 2.107"
syn_tco85 = " HCLK->S_HRDATA[20] = 2.148"
syn_tco86 = " HCLK->S_HRDATA[21] = 2.161"
syn_tco87 = " HCLK->S_HRDATA[22] = 2.141"
syn_tco88 = " HCLK->S_HRDATA[23] = 2.155"
syn_tco89 = " HCLK->S_HRDATA[24] = 2.165"
syn_tco90 = " HCLK->S_HRDATA[25] = 2.144"
syn_tco91 = " HCLK->S_HRDATA[26] = 2.174"
syn_tco92 = " HCLK->S_HRDATA[27] = 2.140"
syn_tco93 = " HCLK->S_HRDATA[28] = 2.157"
syn_tco94 = " HCLK->S_HRDATA[29] = 2.121"
syn_tco95 = " HCLK->S_HRDATA[2] = 2.104"
syn_tco96 = " HCLK->S_HRDATA[30] = 2.131"
syn_tco97 = " HCLK->S_HRDATA[31] = 2.155"
syn_tco98 = " HCLK->S_HRDATA[3] = 2.132"
syn_tco99 = " HCLK->S_HRDATA[4] = 2.114"
syn_tco100 = " HCLK->S_HRDATA[5] = 2.106"
syn_tco101 = " HCLK->S_HRDATA[6] = 2.115"
syn_tco102 = " HCLK->S_HRDATA[7] = 2.115"
syn_tco103 = " HCLK->S_HRDATA[8] = 2.177"
syn_tco104 = " HCLK->S_HRDATA[9] = 2.155"
syn_tco105 = " HCLK->S_HREADYOUT = 2.415"
*/
/* synthesis black_box_pad_pin ="" */
input  HCLK;
input  HRESETN;
input  M_HREADY;
input  M_HRESP;
input  [31:0] M_HRDATA;
input  S_HSEL;
input  [16:0] S_HADDR;
input  [31:0] S_HWDATA;
input  [1:0] S_HSIZE;
input  [1:0] S_HTRANS;
input  S_HWRITE;
input  S_HREADY;
input  PURGE;
input  START;
input  TEST_CALIB_IN;
input  TEST_CALIB_RESET_B;
input  STALL;
output [31:0] M_HADDR;
output [31:0] M_HWDATA;
output [1:0] M_HSIZE;
output [1:0] M_HTRANS;
output M_HWRITE;
output M_HMASTLOCK;
output S_HREADYOUT;
output S_HRESP;
output [31:0] S_HRDATA;
output BUSY;
output COMPLETE;
output ALARM;
output TEST_CALIB_OUT;
output TEST_DLL_LOCKED;
output BUS_ERROR;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
parameter SOFT_RESET_PERIPH = 1'h0;
parameter DLL_CTRL0_PHASE_P = 2'h0;
parameter DLL_CTRL0_PHASE_S = 2'h0;
parameter DLL_CTRL0_SEL_P = 2'h0;
parameter DLL_CTRL0_SEL_S = 2'h0;
parameter DLL_CTRL0_REF_SEL = 1'h0;
parameter DLL_CTRL0_FB_SEL = 1'h0;
parameter DLL_CTRL0_DIV_SEL = 1'h0;
parameter DLL_CTRL0_ALU_UPD = 2'h0;
parameter DLL_CTRL0_LOCK_FRC = 1'h0;
parameter DLL_CTRL0_LOCK_FLT = 2'h0;
parameter DLL_CTRL0_LOCK_HIGH = 4'h0;
parameter DLL_CTRL0_LOCK_LOW = 4'h0;
parameter DLL_CTRL1_SET_ALU = 8'h0;
parameter DLL_CTRL1_ADJ_DEL4 = 7'h0;
parameter DLL_CTRL1_TEST_S = 1'h0;
parameter DLL_CTRL1_TEST_RING = 1'h0;
parameter DLL_CTRL1_INIT_CODE = 6'h0;
parameter DLL_CTRL1_RELOCK_FAST = 1'h0;
parameter DLL_STAT0_RESET = 1'h0;
parameter DLL_STAT0_PHASE_MOVE_CLK = 1'h0;
parameter CONTROL_USER_SCB_CONTROL = 1'h0;
parameter CONTROL_USER_RESET = 1'h0;
parameter CONTROL_USER_CLOCK_ENABLE = 1'h0;
parameter CONTROL_USER_CLOCK_SELECT = 2'h0;
parameter CONTROL_USER_RAMS_ON = 1'h0;
parameter CONTROL_USER_DLL_ON = 1'h0;
parameter CONTROL_USER_RING_OSC_ON = 1'h0;
parameter CONTROL_USER_PURGE = 1'h0;
parameter CONTROL_USER_GO = 1'h0;
parameter INTERRUPT_ENABLE_COMPLETE = 1'h0;
parameter INTERRUPT_ENABLE_ALARM = 1'h0;
parameter INTERRUPT_ENABLE_BUSERROR = 1'h0;
parameter MARGIN_RAM = 3'h0;
parameter MARGIN_ROM = 3'h0;

endmodule
//==================================================
// CRYPTO_SOC
//==================================================
module CRYPTO_SOC ( 
  FIC4_DLL_LOCK_H2F,
  M_HADDR,
  M_HWDATA,
  M_HSIZE,
  M_HTRANS,
  M_HWRITE,
  M_HMASTLOCK,
  S_HREADYOUT,
  S_HRESP,
  S_HRDATA,
  BUSY,
  COMPLETE,
  ALARM,
  BUSERROR,
  MSS_REQUEST,
  MSS_RELEASE,
  OWNER,
  MSS_OWNER,
  XWADDR,
  XINACCEPT,
  XRDATA,
  XRADDR,
  XVALIDOUT,
  MESH_ERROR,
  HCLK,
  HRESETN,
  M_HREADY,
  M_HRESP,
  M_HRDATA,
  S_HSEL,
  S_HADDR,
  S_HWDATA,
  S_HSIZE,
  S_HTRANS,
  S_HWRITE,
  S_HREADY,
  STALL,
  PURGE,
  GO,
  REQUEST,
  RELEASE,
  XENABLE,
  XWDATA,
  XOUTACK,
  MESH_CLEAR );
/* synthesis syn_black_box */
/* synthesis syn_noprune=1 */

/* Output Ports */
output FIC4_DLL_LOCK_H2F;
output [31:0] M_HADDR;
output [31:0] M_HWDATA;
output [1:0] M_HSIZE;
output [1:0] M_HTRANS;
output M_HWRITE;
output M_HMASTLOCK;
output S_HREADYOUT;
output S_HRESP;
output [31:0] S_HRDATA;
output BUSY;
output COMPLETE;
output ALARM;
output BUSERROR;
output MSS_REQUEST;
output MSS_RELEASE;
output OWNER;
output MSS_OWNER;
output [9:0] XWADDR;
output XINACCEPT;
output [31:0] XRDATA;
output [9:0] XRADDR;
output XVALIDOUT;
output MESH_ERROR;

/* Input Ports */
input  HCLK;
input  HRESETN;
input  M_HREADY;
input  M_HRESP;
input  [31:0] M_HRDATA;
input  S_HSEL;
input  [16:0] S_HADDR;
input  [31:0] S_HWDATA;
input  [1:0] S_HSIZE;
input  [1:0] S_HTRANS;
input  S_HWRITE;
input  S_HREADY;
input  STALL;
input  PURGE;
input  GO;
input  REQUEST;
input  RELEASE;
input  XENABLE;
input  [31:0] XWDATA;
input  XOUTACK;
input  MESH_CLEAR;

/* Static Input Ports */

/* Hardwired Ports */

  parameter SOFT_RESET_PERIPH        = 1'h0;
  parameter DLL_CTRL0_PHASE_P        = 2'h0;
  parameter DLL_CTRL0_PHASE_S        = 2'h0;
  parameter DLL_CTRL0_SEL_P          = 2'h0;
  parameter DLL_CTRL0_SEL_S          = 2'h0;
  parameter DLL_CTRL0_REF_SEL        = 1'h0;
  parameter DLL_CTRL0_FB_SEL         = 1'h0;
  parameter DLL_CTRL0_DIV_SEL        = 1'h0;
  parameter DLL_CTRL0_ALU_UPD        = 2'h0;
  parameter DLL_CTRL0_LOCK_FRC       = 1'h0;
  parameter DLL_CTRL0_LOCK_FLT       = 2'h0;
  parameter DLL_CTRL0_LOCK_HIGH      = 4'h0;
  parameter DLL_CTRL0_LOCK_LOW       = 4'h0;
  parameter DLL_CTRL1_SET_ALU        = 8'h0;
  parameter DLL_CTRL1_ADJ_DEL4       = 7'h0;
  parameter DLL_CTRL1_TEST_S         = 1'h0;
  parameter DLL_CTRL1_TEST_RING      = 1'h0;
  parameter DLL_CTRL1_INIT_CODE      = 6'h0;
  parameter DLL_CTRL1_RELOCK_FAST    = 1'h0;
  parameter DLL_STAT0_RESET          = 1'h0;
  parameter DLL_STAT0_BYPASS         = 1'h0;
  parameter DLL_STAT0_PHASE_MOVE_CLK = 1'h0;
  parameter CONTROL_USER_SCB_CONTROL = 1'h0;
  parameter CONTROL_USER_RESET       = 1'h0;
  parameter CONTROL_USER_CLOCK_ENABLE = 1'h0;
  parameter CONTROL_USER_CLOCK_SELECT = 2'h0;
  parameter CONTROL_USER_RAMS_ON     = 1'h0;
  parameter CONTROL_USER_DLL_ON      = 1'h0;
  parameter CONTROL_USER_RING_OSC_ON = 1'h0;
  parameter CONTROL_USER_PURGE       = 1'h0;
  parameter CONTROL_USER_GO          = 1'h0;
  parameter INTERRUPT_ENABLE_COMPLETE = 1'h0;
  parameter INTERRUPT_ENABLE_ALARM   = 1'h0;
  parameter INTERRUPT_ENABLE_BUSERROR = 1'h0;
  parameter MARGIN_RAM               = 3'h0;
  parameter MARGIN_ROM               = 3'h0;

endmodule


`timescale 1 ns/100 ps
// Version: 


module DEBUG(
       DEBUG_STATUS,
       DATA_IN
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  [1:0] DEBUG_STATUS;
input  [15:0] DATA_IN;

endmodule
`timescale 1 ns/100 ps
// Version: 


module DLL(
       POWERDOWN_N,
       DIR,
       CLK_MOVE,
       CODE_MOVE,
       ALU_HOLD,
       CODE_UPDATE,
       PHASE_LOAD,
       CLK_MOVE_DONE,
       CODE_MOVE_DONE,
       LOCK,
       DELAY_DIFF,
       CODE,
       REF_CLK,
       FB_CLK,
       CLK_0,
       CLK_1,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT
    ) ;
/* synthesis syn_black_box

syn_tpd0 = " REF_CLK->CLK_0 = 1.438"
syn_tpd1 = " REF_CLK->CLK_1 = 1.438"
*/
/* synthesis black_box_pad_pin ="" */
input  POWERDOWN_N;
input  DIR;
input  CLK_MOVE;
input  CODE_MOVE;
input  ALU_HOLD;
input  CODE_UPDATE;
input  PHASE_LOAD;
output CLK_MOVE_DONE;
output CODE_MOVE_DONE;
output LOCK;
output DELAY_DIFF;
output [7:0] CODE;
input  REF_CLK;
input  FB_CLK;
output CLK_0;
output CLK_1;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
parameter DATA_RATE = 0.0;
parameter FORMAL_NAME = "";
parameter INTERFACE_NAME = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter SOFTRESET = 1'h0;
parameter PRIMARY_PHASE = 2'h0;
parameter SECONDARY_PHASE = 2'h0;
parameter PRIMARY_CLK_SEL = 2'h0;
parameter SECONDARY_CLK_SEL = 2'h0;
parameter REF_SEL = 1'h0;
parameter FB_SEL = 1'h0;
parameter DIV_SEL = 1'h0;
parameter SECONDARY_FINE_PHASE = 3'h0;
parameter ALU_UPDATE = 2'h0;
parameter PHASE_CODE_SEL = 3'h0;
parameter LOCK_TOLERANCE = 2'h0;
parameter LOCK_HIGH = 4'h0;
parameter LOCK_LOW = 4'h0;
parameter SET_ALU = 8'h0;
parameter ADJ_DEL4 = 7'h0;
parameter RESERVED_0 = 1'h0;
parameter ADJ_CODE = 7'h0;
parameter INIT_CODE = 6'h0;
parameter FAST_RELOCK = 1'h0;
parameter POWERDOWN_EN = 1'h0;
parameter RESET = 1'h0;
parameter SOFT_ALU_HOLD = 1'h0;
parameter SOFT_CODE_UPDATE = 1'h0;
parameter SOFT_LOCK_DBG = 2'h0;
parameter SOFT_LOCK_FRC = 1'h0;
parameter SOFT_PHASE_DIRECTION = 1'h0;
parameter SOFT_PHASE_LOAD = 1'h0;
parameter SOFT_PHASE_MOVE_CLK = 1'h0;
parameter SOFT_MOVE_CODE = 1'h0;
parameter TEST_RING = 1'h0;
parameter DELAY_DIFF_RANGE = 3'h0;
parameter DRI_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module DRI(
       PCLK,
       PSEL,
       PENABLE,
       PWRITE,
       PADDR,
       PSTRB,
       PWDATA,
       PRESETN,
       PRDATA,
       PREADY,
       PSLVERR,
       PINTERRUPT,
       PTIMEOUT,
       BUSERROR,
       DRI_CLK,
       DRI_WDATA,
       DRI_ARST_N,
       Q4_LANE0_DRI_CTRL,
       Q4_LANE0_DRI_RDATA,
       Q4_LANE0_DRI_INTERRUPT,
       Q4_LANE1_DRI_CTRL,
       Q4_LANE1_DRI_RDATA,
       Q4_LANE1_DRI_INTERRUPT,
       Q4_LANE2_DRI_CTRL,
       Q4_LANE2_DRI_RDATA,
       Q4_LANE2_DRI_INTERRUPT,
       Q4_LANE3_DRI_CTRL,
       Q4_LANE3_DRI_RDATA,
       Q4_LANE3_DRI_INTERRUPT,
       Q2_LANE0_DRI_CTRL,
       Q2_LANE0_DRI_RDATA,
       Q2_LANE0_DRI_INTERRUPT,
       Q2_LANE1_DRI_CTRL,
       Q2_LANE1_DRI_RDATA,
       Q2_LANE1_DRI_INTERRUPT,
       Q2_LANE2_DRI_CTRL,
       Q2_LANE2_DRI_RDATA,
       Q2_LANE2_DRI_INTERRUPT,
       Q2_LANE3_DRI_CTRL,
       Q2_LANE3_DRI_RDATA,
       Q2_LANE3_DRI_INTERRUPT,
       Q0_LANE0_DRI_CTRL,
       Q0_LANE0_DRI_RDATA,
       Q0_LANE0_DRI_INTERRUPT,
       Q0_LANE1_DRI_CTRL,
       Q0_LANE1_DRI_RDATA,
       Q0_LANE1_DRI_INTERRUPT,
       Q0_LANE2_DRI_CTRL,
       Q0_LANE2_DRI_RDATA,
       Q0_LANE2_DRI_INTERRUPT,
       Q0_LANE3_DRI_CTRL,
       Q0_LANE3_DRI_RDATA,
       Q0_LANE3_DRI_INTERRUPT,
       Q1_LANE0_DRI_CTRL,
       Q1_LANE0_DRI_RDATA,
       Q1_LANE0_DRI_INTERRUPT,
       Q1_LANE1_DRI_CTRL,
       Q1_LANE1_DRI_RDATA,
       Q1_LANE1_DRI_INTERRUPT,
       Q1_LANE2_DRI_CTRL,
       Q1_LANE2_DRI_RDATA,
       Q1_LANE2_DRI_INTERRUPT,
       Q1_LANE3_DRI_CTRL,
       Q1_LANE3_DRI_RDATA,
       Q1_LANE3_DRI_INTERRUPT,
       Q3_LANE0_DRI_CTRL,
       Q3_LANE0_DRI_RDATA,
       Q3_LANE0_DRI_INTERRUPT,
       Q3_LANE1_DRI_CTRL,
       Q3_LANE1_DRI_RDATA,
       Q3_LANE1_DRI_INTERRUPT,
       Q3_LANE2_DRI_CTRL,
       Q3_LANE2_DRI_RDATA,
       Q3_LANE2_DRI_INTERRUPT,
       Q3_LANE3_DRI_CTRL,
       Q3_LANE3_DRI_RDATA,
       Q3_LANE3_DRI_INTERRUPT,
       Q5_LANE0_DRI_CTRL,
       Q5_LANE0_DRI_RDATA,
       Q5_LANE0_DRI_INTERRUPT,
       Q5_LANE1_DRI_CTRL,
       Q5_LANE1_DRI_RDATA,
       Q5_LANE1_DRI_INTERRUPT,
       Q5_LANE2_DRI_CTRL,
       Q5_LANE2_DRI_RDATA,
       Q5_LANE2_DRI_INTERRUPT,
       Q5_LANE3_DRI_CTRL,
       Q5_LANE3_DRI_RDATA,
       Q5_LANE3_DRI_INTERRUPT,
       PCIE0_DRI_CTRL,
       PCIE0_DRI_RDATA,
       PCIE0_DRI_INTERRUPT,
       PCIE1_DRI_CTRL,
       PCIE1_DRI_RDATA,
       PCIE1_DRI_INTERRUPT,
       Q4_TXPLL_SSC_DRI_CTRL,
       Q4_TXPLL_SSC_DRI_RDATA,
       Q4_TXPLL_SSC_DRI_INTERRUPT,
       Q2_TXPLL_SSC_DRI_CTRL,
       Q2_TXPLL_SSC_DRI_RDATA,
       Q2_TXPLL_SSC_DRI_INTERRUPT,
       Q0_TXPLL_SSC_DRI_CTRL,
       Q0_TXPLL_SSC_DRI_RDATA,
       Q0_TXPLL_SSC_DRI_INTERRUPT,
       Q1_TXPLL_SSC_DRI_CTRL,
       Q1_TXPLL_SSC_DRI_RDATA,
       Q1_TXPLL_SSC_DRI_INTERRUPT,
       Q3_TXPLL_SSC_DRI_CTRL,
       Q3_TXPLL_SSC_DRI_RDATA,
       Q3_TXPLL_SSC_DRI_INTERRUPT,
       Q5_TXPLL_SSC_DRI_CTRL,
       Q5_TXPLL_SSC_DRI_RDATA,
       Q5_TXPLL_SSC_DRI_INTERRUPT,
       Q4_TXPLL_DRI_CTRL,
       Q4_TXPLL_DRI_RDATA,
       Q4_TXPLL_DRI_INTERRUPT,
       Q2_TXPLL0_DRI_CTRL,
       Q2_TXPLL0_DRI_RDATA,
       Q2_TXPLL0_DRI_INTERRUPT,
       Q2_TXPLL1_DRI_CTRL,
       Q2_TXPLL1_DRI_RDATA,
       Q2_TXPLL1_DRI_INTERRUPT,
       Q0_TXPLL0_DRI_CTRL,
       Q0_TXPLL0_DRI_RDATA,
       Q0_TXPLL0_DRI_INTERRUPT,
       Q0_TXPLL1_DRI_CTRL,
       Q0_TXPLL1_DRI_RDATA,
       Q0_TXPLL1_DRI_INTERRUPT,
       Q1_TXPLL0_DRI_CTRL,
       Q1_TXPLL0_DRI_RDATA,
       Q1_TXPLL0_DRI_INTERRUPT,
       Q1_TXPLL1_DRI_CTRL,
       Q1_TXPLL1_DRI_RDATA,
       Q1_TXPLL1_DRI_INTERRUPT,
       Q3_TXPLL_DRI_CTRL,
       Q3_TXPLL_DRI_RDATA,
       Q3_TXPLL_DRI_INTERRUPT,
       Q5_TXPLL_DRI_CTRL,
       Q5_TXPLL_DRI_RDATA,
       Q5_TXPLL_DRI_INTERRUPT,
       PLL0_NW_DRI_CTRL,
       PLL0_NW_DRI_RDATA,
       PLL0_NW_DRI_INTERRUPT,
       PLL1_NW_DRI_CTRL,
       PLL1_NW_DRI_RDATA,
       PLL1_NW_DRI_INTERRUPT,
       DLL0_NW_DRI_CTRL,
       DLL0_NW_DRI_RDATA,
       DLL0_NW_DRI_INTERRUPT,
       DLL1_NW_DRI_CTRL,
       DLL1_NW_DRI_RDATA,
       DLL1_NW_DRI_INTERRUPT,
       PLL0_NE_DRI_CTRL,
       PLL0_NE_DRI_RDATA,
       PLL0_NE_DRI_INTERRUPT,
       PLL1_NE_DRI_CTRL,
       PLL1_NE_DRI_RDATA,
       PLL1_NE_DRI_INTERRUPT,
       DLL0_NE_DRI_CTRL,
       DLL0_NE_DRI_RDATA,
       DLL0_NE_DRI_INTERRUPT,
       DLL1_NE_DRI_CTRL,
       DLL1_NE_DRI_RDATA,
       DLL1_NE_DRI_INTERRUPT,
       PLL0_SE_DRI_CTRL,
       PLL0_SE_DRI_RDATA,
       PLL0_SE_DRI_INTERRUPT,
       PLL1_SE_DRI_CTRL,
       PLL1_SE_DRI_RDATA,
       PLL1_SE_DRI_INTERRUPT,
       DLL0_SE_DRI_CTRL,
       DLL0_SE_DRI_RDATA,
       DLL0_SE_DRI_INTERRUPT,
       DLL1_SE_DRI_CTRL,
       DLL1_SE_DRI_RDATA,
       DLL1_SE_DRI_INTERRUPT,
       PLL0_SW_DRI_CTRL,
       PLL0_SW_DRI_RDATA,
       PLL0_SW_DRI_INTERRUPT,
       PLL1_SW_DRI_CTRL,
       PLL1_SW_DRI_RDATA,
       PLL1_SW_DRI_INTERRUPT,
       DLL0_SW_DRI_CTRL,
       DLL0_SW_DRI_RDATA,
       DLL0_SW_DRI_INTERRUPT,
       DLL1_SW_DRI_CTRL,
       DLL1_SW_DRI_RDATA,
       DLL1_SW_DRI_INTERRUPT,
       CRYPTO_DRI_CTRL,
       CRYPTO_DRI_RDATA,
       CRYPTO_DRI_INTERRUPT
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " PADDR[10]->PCLK = 1.271"
syn_tsu1 = " PADDR[11]->PCLK = 1.285"
syn_tsu2 = " PADDR[12]->PCLK = 1.178"
syn_tsu3 = " PADDR[13]->PCLK = 1.338"
syn_tsu4 = " PADDR[14]->PCLK = 1.188"
syn_tsu5 = " PADDR[15]->PCLK = 1.217"
syn_tsu6 = " PADDR[16]->PCLK = 1.238"
syn_tsu7 = " PADDR[17]->PCLK = 1.162"
syn_tsu8 = " PADDR[18]->PCLK = 1.2"
syn_tsu9 = " PADDR[19]->PCLK = 1.185"
syn_tsu10 = " PADDR[20]->PCLK = 1.188"
syn_tsu11 = " PADDR[21]->PCLK = 1.331"
syn_tsu12 = " PADDR[22]->PCLK = 1.39"
syn_tsu13 = " PADDR[23]->PCLK = 1.197"
syn_tsu14 = " PADDR[24]->PCLK = 1.198"
syn_tsu15 = " PADDR[25]->PCLK = 1.368"
syn_tsu16 = " PADDR[26]->PCLK = 1.272"
syn_tsu17 = " PADDR[27]->PCLK = 1.375"
syn_tsu18 = " PADDR[28]->PCLK = 1.266"
syn_tsu19 = " PADDR[2]->PCLK = 1.218"
syn_tsu20 = " PADDR[3]->PCLK = 1.272"
syn_tsu21 = " PADDR[4]->PCLK = 1.271"
syn_tsu22 = " PADDR[5]->PCLK = 1.217"
syn_tsu23 = " PADDR[6]->PCLK = 1.267"
syn_tsu24 = " PADDR[7]->PCLK = 1.263"
syn_tsu25 = " PADDR[8]->PCLK = 1.17"
syn_tsu26 = " PADDR[9]->PCLK = 1.266"
syn_tsu27 = " PENABLE->PCLK = 1.404"
syn_tsu28 = " PSEL->PCLK = 1.453"
syn_tsu29 = " PSTRB[0]->PCLK = 1.242"
syn_tsu30 = " PSTRB[1]->PCLK = 1.264"
syn_tsu31 = " PSTRB[2]->PCLK = 1.238"
syn_tsu32 = " PSTRB[3]->PCLK = 1.282"
syn_tsu33 = " PWDATA[0]->PCLK = 1.221"
syn_tsu34 = " PWDATA[10]->PCLK = 1.272"
syn_tsu35 = " PWDATA[11]->PCLK = 1.241"
syn_tsu36 = " PWDATA[12]->PCLK = 1.263"
syn_tsu37 = " PWDATA[13]->PCLK = 1.269"
syn_tsu38 = " PWDATA[14]->PCLK = 1.321"
syn_tsu39 = " PWDATA[15]->PCLK = 1.284"
syn_tsu40 = " PWDATA[16]->PCLK = 1.275"
syn_tsu41 = " PWDATA[17]->PCLK = 1.274"
syn_tsu42 = " PWDATA[18]->PCLK = 1.287"
syn_tsu43 = " PWDATA[19]->PCLK = 1.278"
syn_tsu44 = " PWDATA[1]->PCLK = 1.241"
syn_tsu45 = " PWDATA[20]->PCLK = 1.284"
syn_tsu46 = " PWDATA[21]->PCLK = 1.289"
syn_tsu47 = " PWDATA[22]->PCLK = 1.32"
syn_tsu48 = " PWDATA[23]->PCLK = 1.297"
syn_tsu49 = " PWDATA[24]->PCLK = 1.18"
syn_tsu50 = " PWDATA[25]->PCLK = 1.168"
syn_tsu51 = " PWDATA[26]->PCLK = 1.175"
syn_tsu52 = " PWDATA[27]->PCLK = 1.183"
syn_tsu53 = " PWDATA[28]->PCLK = 1.259"
syn_tsu54 = " PWDATA[29]->PCLK = 1.191"
syn_tsu55 = " PWDATA[2]->PCLK = 1.322"
syn_tsu56 = " PWDATA[30]->PCLK = 1.172"
syn_tsu57 = " PWDATA[31]->PCLK = 1.213"
syn_tsu58 = " PWDATA[3]->PCLK = 1.353"
syn_tsu59 = " PWDATA[4]->PCLK = 1.174"
syn_tsu60 = " PWDATA[5]->PCLK = 1.459"
syn_tsu61 = " PWDATA[6]->PCLK = 1.156"
syn_tsu62 = " PWDATA[7]->PCLK = 1.282"
syn_tsu63 = " PWDATA[8]->PCLK = 1.265"
syn_tsu64 = " PWDATA[9]->PCLK = 1.265"
syn_tsu65 = " PWRITE->PCLK = 1.445"
syn_tco0 = " PCLK->BUSERROR = 2.556"
syn_tco1 = " PCLK->PINTERRUPT = 2.581"
syn_tco2 = " PCLK->PRDATA[0] = 2.523"
syn_tco3 = " PCLK->PRDATA[10] = 2.522"
syn_tco4 = " PCLK->PRDATA[11] = 2.524"
syn_tco5 = " PCLK->PRDATA[12] = 2.528"
syn_tco6 = " PCLK->PRDATA[13] = 2.525"
syn_tco7 = " PCLK->PRDATA[14] = 2.522"
syn_tco8 = " PCLK->PRDATA[15] = 2.525"
syn_tco9 = " PCLK->PRDATA[16] = 2.524"
syn_tco10 = " PCLK->PRDATA[17] = 2.521"
syn_tco11 = " PCLK->PRDATA[18] = 2.523"
syn_tco12 = " PCLK->PRDATA[19] = 2.521"
syn_tco13 = " PCLK->PRDATA[1] = 2.527"
syn_tco14 = " PCLK->PRDATA[20] = 2.526"
syn_tco15 = " PCLK->PRDATA[21] = 2.529"
syn_tco16 = " PCLK->PRDATA[22] = 2.522"
syn_tco17 = " PCLK->PRDATA[23] = 2.531"
syn_tco18 = " PCLK->PRDATA[24] = 2.526"
syn_tco19 = " PCLK->PRDATA[25] = 2.524"
syn_tco20 = " PCLK->PRDATA[26] = 2.524"
syn_tco21 = " PCLK->PRDATA[27] = 2.526"
syn_tco22 = " PCLK->PRDATA[28] = 2.521"
syn_tco23 = " PCLK->PRDATA[29] = 2.514"
syn_tco24 = " PCLK->PRDATA[2] = 2.526"
syn_tco25 = " PCLK->PRDATA[30] = 2.526"
syn_tco26 = " PCLK->PRDATA[31] = 2.518"
syn_tco27 = " PCLK->PRDATA[3] = 2.522"
syn_tco28 = " PCLK->PRDATA[4] = 2.523"
syn_tco29 = " PCLK->PRDATA[5] = 2.521"
syn_tco30 = " PCLK->PRDATA[6] = 2.530"
syn_tco31 = " PCLK->PRDATA[7] = 2.526"
syn_tco32 = " PCLK->PRDATA[8] = 2.531"
syn_tco33 = " PCLK->PRDATA[9] = 2.521"
syn_tco34 = " PCLK->PREADY = 2.514"
syn_tco35 = " PCLK->PSLVERR = 2.483"
syn_tco36 = " PCLK->PTIMEOUT = 2.575"
*/
/* synthesis black_box_pad_pin ="" */
input  PCLK;
input  PSEL;
input  PENABLE;
input  PWRITE;
input  [28:0] PADDR;
input  [3:0] PSTRB;
input  [31:0] PWDATA;
input  PRESETN;
output [31:0] PRDATA;
output PREADY;
output PSLVERR;
output PINTERRUPT;
output PTIMEOUT;
output BUSERROR;
output DRI_CLK;
output [32:0] DRI_WDATA;
output DRI_ARST_N;
output [10:0] Q4_LANE0_DRI_CTRL;
input  [32:0] Q4_LANE0_DRI_RDATA;
input  Q4_LANE0_DRI_INTERRUPT;
output [10:0] Q4_LANE1_DRI_CTRL;
input  [32:0] Q4_LANE1_DRI_RDATA;
input  Q4_LANE1_DRI_INTERRUPT;
output [10:0] Q4_LANE2_DRI_CTRL;
input  [32:0] Q4_LANE2_DRI_RDATA;
input  Q4_LANE2_DRI_INTERRUPT;
output [10:0] Q4_LANE3_DRI_CTRL;
input  [32:0] Q4_LANE3_DRI_RDATA;
input  Q4_LANE3_DRI_INTERRUPT;
output [10:0] Q2_LANE0_DRI_CTRL;
input  [32:0] Q2_LANE0_DRI_RDATA;
input  Q2_LANE0_DRI_INTERRUPT;
output [10:0] Q2_LANE1_DRI_CTRL;
input  [32:0] Q2_LANE1_DRI_RDATA;
input  Q2_LANE1_DRI_INTERRUPT;
output [10:0] Q2_LANE2_DRI_CTRL;
input  [32:0] Q2_LANE2_DRI_RDATA;
input  Q2_LANE2_DRI_INTERRUPT;
output [10:0] Q2_LANE3_DRI_CTRL;
input  [32:0] Q2_LANE3_DRI_RDATA;
input  Q2_LANE3_DRI_INTERRUPT;
output [10:0] Q0_LANE0_DRI_CTRL;
input  [32:0] Q0_LANE0_DRI_RDATA;
input  Q0_LANE0_DRI_INTERRUPT;
output [10:0] Q0_LANE1_DRI_CTRL;
input  [32:0] Q0_LANE1_DRI_RDATA;
input  Q0_LANE1_DRI_INTERRUPT;
output [10:0] Q0_LANE2_DRI_CTRL;
input  [32:0] Q0_LANE2_DRI_RDATA;
input  Q0_LANE2_DRI_INTERRUPT;
output [10:0] Q0_LANE3_DRI_CTRL;
input  [32:0] Q0_LANE3_DRI_RDATA;
input  Q0_LANE3_DRI_INTERRUPT;
output [10:0] Q1_LANE0_DRI_CTRL;
input  [32:0] Q1_LANE0_DRI_RDATA;
input  Q1_LANE0_DRI_INTERRUPT;
output [10:0] Q1_LANE1_DRI_CTRL;
input  [32:0] Q1_LANE1_DRI_RDATA;
input  Q1_LANE1_DRI_INTERRUPT;
output [10:0] Q1_LANE2_DRI_CTRL;
input  [32:0] Q1_LANE2_DRI_RDATA;
input  Q1_LANE2_DRI_INTERRUPT;
output [10:0] Q1_LANE3_DRI_CTRL;
input  [32:0] Q1_LANE3_DRI_RDATA;
input  Q1_LANE3_DRI_INTERRUPT;
output [10:0] Q3_LANE0_DRI_CTRL;
input  [32:0] Q3_LANE0_DRI_RDATA;
input  Q3_LANE0_DRI_INTERRUPT;
output [10:0] Q3_LANE1_DRI_CTRL;
input  [32:0] Q3_LANE1_DRI_RDATA;
input  Q3_LANE1_DRI_INTERRUPT;
output [10:0] Q3_LANE2_DRI_CTRL;
input  [32:0] Q3_LANE2_DRI_RDATA;
input  Q3_LANE2_DRI_INTERRUPT;
output [10:0] Q3_LANE3_DRI_CTRL;
input  [32:0] Q3_LANE3_DRI_RDATA;
input  Q3_LANE3_DRI_INTERRUPT;
output [10:0] Q5_LANE0_DRI_CTRL;
input  [32:0] Q5_LANE0_DRI_RDATA;
input  Q5_LANE0_DRI_INTERRUPT;
output [10:0] Q5_LANE1_DRI_CTRL;
input  [32:0] Q5_LANE1_DRI_RDATA;
input  Q5_LANE1_DRI_INTERRUPT;
output [10:0] Q5_LANE2_DRI_CTRL;
input  [32:0] Q5_LANE2_DRI_RDATA;
input  Q5_LANE2_DRI_INTERRUPT;
output [10:0] Q5_LANE3_DRI_CTRL;
input  [32:0] Q5_LANE3_DRI_RDATA;
input  Q5_LANE3_DRI_INTERRUPT;
output [10:0] PCIE0_DRI_CTRL;
input  [32:0] PCIE0_DRI_RDATA;
input  PCIE0_DRI_INTERRUPT;
output [10:0] PCIE1_DRI_CTRL;
input  [32:0] PCIE1_DRI_RDATA;
input  PCIE1_DRI_INTERRUPT;
output [10:0] Q4_TXPLL_SSC_DRI_CTRL;
input  [32:0] Q4_TXPLL_SSC_DRI_RDATA;
input  Q4_TXPLL_SSC_DRI_INTERRUPT;
output [10:0] Q2_TXPLL_SSC_DRI_CTRL;
input  [32:0] Q2_TXPLL_SSC_DRI_RDATA;
input  Q2_TXPLL_SSC_DRI_INTERRUPT;
output [10:0] Q0_TXPLL_SSC_DRI_CTRL;
input  [32:0] Q0_TXPLL_SSC_DRI_RDATA;
input  Q0_TXPLL_SSC_DRI_INTERRUPT;
output [10:0] Q1_TXPLL_SSC_DRI_CTRL;
input  [32:0] Q1_TXPLL_SSC_DRI_RDATA;
input  Q1_TXPLL_SSC_DRI_INTERRUPT;
output [10:0] Q3_TXPLL_SSC_DRI_CTRL;
input  [32:0] Q3_TXPLL_SSC_DRI_RDATA;
input  Q3_TXPLL_SSC_DRI_INTERRUPT;
output [10:0] Q5_TXPLL_SSC_DRI_CTRL;
input  [32:0] Q5_TXPLL_SSC_DRI_RDATA;
input  Q5_TXPLL_SSC_DRI_INTERRUPT;
output [10:0] Q4_TXPLL_DRI_CTRL;
input  [32:0] Q4_TXPLL_DRI_RDATA;
input  Q4_TXPLL_DRI_INTERRUPT;
output [10:0] Q2_TXPLL0_DRI_CTRL;
input  [32:0] Q2_TXPLL0_DRI_RDATA;
input  Q2_TXPLL0_DRI_INTERRUPT;
output [10:0] Q2_TXPLL1_DRI_CTRL;
input  [32:0] Q2_TXPLL1_DRI_RDATA;
input  Q2_TXPLL1_DRI_INTERRUPT;
output [10:0] Q0_TXPLL0_DRI_CTRL;
input  [32:0] Q0_TXPLL0_DRI_RDATA;
input  Q0_TXPLL0_DRI_INTERRUPT;
output [10:0] Q0_TXPLL1_DRI_CTRL;
input  [32:0] Q0_TXPLL1_DRI_RDATA;
input  Q0_TXPLL1_DRI_INTERRUPT;
output [10:0] Q1_TXPLL0_DRI_CTRL;
input  [32:0] Q1_TXPLL0_DRI_RDATA;
input  Q1_TXPLL0_DRI_INTERRUPT;
output [10:0] Q1_TXPLL1_DRI_CTRL;
input  [32:0] Q1_TXPLL1_DRI_RDATA;
input  Q1_TXPLL1_DRI_INTERRUPT;
output [10:0] Q3_TXPLL_DRI_CTRL;
input  [32:0] Q3_TXPLL_DRI_RDATA;
input  Q3_TXPLL_DRI_INTERRUPT;
output [10:0] Q5_TXPLL_DRI_CTRL;
input  [32:0] Q5_TXPLL_DRI_RDATA;
input  Q5_TXPLL_DRI_INTERRUPT;
output [10:0] PLL0_NW_DRI_CTRL;
input  [32:0] PLL0_NW_DRI_RDATA;
input  PLL0_NW_DRI_INTERRUPT;
output [10:0] PLL1_NW_DRI_CTRL;
input  [32:0] PLL1_NW_DRI_RDATA;
input  PLL1_NW_DRI_INTERRUPT;
output [10:0] DLL0_NW_DRI_CTRL;
input  [32:0] DLL0_NW_DRI_RDATA;
input  DLL0_NW_DRI_INTERRUPT;
output [10:0] DLL1_NW_DRI_CTRL;
input  [32:0] DLL1_NW_DRI_RDATA;
input  DLL1_NW_DRI_INTERRUPT;
output [10:0] PLL0_NE_DRI_CTRL;
input  [32:0] PLL0_NE_DRI_RDATA;
input  PLL0_NE_DRI_INTERRUPT;
output [10:0] PLL1_NE_DRI_CTRL;
input  [32:0] PLL1_NE_DRI_RDATA;
input  PLL1_NE_DRI_INTERRUPT;
output [10:0] DLL0_NE_DRI_CTRL;
input  [32:0] DLL0_NE_DRI_RDATA;
input  DLL0_NE_DRI_INTERRUPT;
output [10:0] DLL1_NE_DRI_CTRL;
input  [32:0] DLL1_NE_DRI_RDATA;
input  DLL1_NE_DRI_INTERRUPT;
output [10:0] PLL0_SE_DRI_CTRL;
input  [32:0] PLL0_SE_DRI_RDATA;
input  PLL0_SE_DRI_INTERRUPT;
output [10:0] PLL1_SE_DRI_CTRL;
input  [32:0] PLL1_SE_DRI_RDATA;
input  PLL1_SE_DRI_INTERRUPT;
output [10:0] DLL0_SE_DRI_CTRL;
input  [32:0] DLL0_SE_DRI_RDATA;
input  DLL0_SE_DRI_INTERRUPT;
output [10:0] DLL1_SE_DRI_CTRL;
input  [32:0] DLL1_SE_DRI_RDATA;
input  DLL1_SE_DRI_INTERRUPT;
output [10:0] PLL0_SW_DRI_CTRL;
input  [32:0] PLL0_SW_DRI_RDATA;
input  PLL0_SW_DRI_INTERRUPT;
output [10:0] PLL1_SW_DRI_CTRL;
input  [32:0] PLL1_SW_DRI_RDATA;
input  PLL1_SW_DRI_INTERRUPT;
output [10:0] DLL0_SW_DRI_CTRL;
input  [32:0] DLL0_SW_DRI_RDATA;
input  DLL0_SW_DRI_INTERRUPT;
output [10:0] DLL1_SW_DRI_CTRL;
input  [32:0] DLL1_SW_DRI_RDATA;
input  DLL1_SW_DRI_INTERRUPT;
output [10:0] CRYPTO_DRI_CTRL;
input  [32:0] CRYPTO_DRI_RDATA;
input  CRYPTO_DRI_INTERRUPT;
parameter ENABLE_LATENCY_SIMULATION = "";
parameter DIE = "";

endmodule
`timescale 1 ns/100 ps
// Version: 


module ENFORCE(
       SECURITY_IN,
       SECURITY_OUT
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  [7:0] SECURITY_IN;
output [7:0] SECURITY_OUT;

endmodule
`timescale 1 ns/100 ps
// Version: 


module GLITCHDETECT(
       VDD_EN,
       VPP_1P8_EN,
       VPP_2P5_EN,
       VDD_CLEAR,
       VPP_1P8_CLEAR,
       VPP_2P5_CLEAR,
       VDD_OUT_HIGH,
       VDD_OUT_LOW,
       VDD_READY,
       VPP_1P8_OUT_HIGH,
       VPP_1P8_OUT_LOW,
       VPP_1P8_READY,
       VPP_2P5_OUT_HIGH,
       VPP_2P5_OUT_LOW,
       VPP_2P5_READY
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  VDD_EN;
input  VPP_1P8_EN;
input  VPP_2P5_EN;
input  VDD_CLEAR;
input  VPP_1P8_CLEAR;
input  VPP_2P5_CLEAR;
output VDD_OUT_HIGH;
output VDD_OUT_LOW;
output VDD_READY;
output VPP_1P8_OUT_HIGH;
output VPP_1P8_OUT_LOW;
output VPP_1P8_READY;
output VPP_2P5_OUT_HIGH;
output VPP_2P5_OUT_LOW;
output VPP_2P5_READY;
parameter SOFTRESET = 1'h0;
parameter RATE_1P05 = 2'h0;
parameter THRESHOLD_1P05 = 2'h0;
parameter WIDTH_1P05 = 2'h0;
parameter RATE_1P8 = 2'h0;
parameter THRESHOLD_1P8 = 2'h0;
parameter WIDTH_1P8 = 2'h0;
parameter RATE_2P5 = 2'h0;
parameter THRESHOLD_2P5 = 2'h0;
parameter WIDTH_2P5 = 2'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module GPSS_COMMON(
       PHY_DEBUG,
       PCS_DEBUG,
       PCS_DEBUG_0,
       PMA_DEBUG_0,
       PCS_DEBUG_1,
       PMA_DEBUG_1,
       PCS_DEBUG_2,
       PMA_DEBUG_2,
       PCS_DEBUG_3,
       PMA_DEBUG_3
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
output [3:0] PHY_DEBUG;
output [19:0] PCS_DEBUG;
input  [19:0] PCS_DEBUG_0;
input  PMA_DEBUG_0;
input  [19:0] PCS_DEBUG_1;
input  PMA_DEBUG_1;
input  [19:0] PCS_DEBUG_2;
input  PMA_DEBUG_2;
input  [19:0] PCS_DEBUG_3;
input  PMA_DEBUG_3;
parameter GPSSMAIN_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_CMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_0_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_1_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_2_SEL = 5'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_MODE = 3'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_X = 2'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_Y = 2'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module HS_IO_CLK(
       A,
       Y
    ) ;
/* synthesis syn_black_box

syn_trr0 = " A->Y = 1.438"
syn_tff0 = " A->Y = 1.438"
*/
/* synthesis black_box_pad_pin ="" */
input  A;
output Y;

endmodule
`timescale 1 ns/100 ps
// Version: 


module ICB_BANKCLK(
       A,
       Y
    ) ;
/* synthesis syn_black_box

syn_tpd0 = " A->Y = 1.741"
*/
/* synthesis black_box_pad_pin ="" */
input  A;
output Y;

endmodule
`timescale 1 ns/100 ps
// Version: 
/* Modified manually to add A->Y_FB/Y_ND delay for synthesis */

module ICB_CLKDIVDELAY(
       DELAY_LINE_DIR,
       DELAY_LINE_MOVE,
       DELAY_LINE_LOAD,
       RST_N,
       BIT_SLIP,
       DELAY_LINE_OUT_OF_RANGE,
       A,
       Y_DIV,
       Y,
       Y_FB,
       Y_ND
    ) ;
/* synthesis syn_black_box

syn_trr0 = " A->Y = 1.733"
syn_tff0 = " A->Y = 1.733"
syn_tco0 = " A->Y_DIV = 1.870"
syn_trr1 = " A->Y_FB = 1.733"
syn_tff1 = " A->Y_FB = 1.733"
syn_trr2 = " A->Y_ND = 1.733"
syn_tff2 = " A->Y_ND = 1.733"
*/
/* synthesis black_box_pad_pin ="" */
input  DELAY_LINE_DIR;
input  DELAY_LINE_MOVE;
input  DELAY_LINE_LOAD;
input  RST_N;
input  BIT_SLIP;
output DELAY_LINE_OUT_OF_RANGE;
input  A;
output Y_DIV;
output Y;
output Y_FB;
output Y_ND;
parameter DELAY_LINE_SIMULATION_MODE = "";
parameter DIVIDER = 3'h0;
parameter DELAY_LINE_EN = 1'h0;
parameter DELAY_LINE_VAL = 7'h0;
parameter DELAY_VAL_X2 = 1'h0;
parameter FB_SOURCE_SEL_0 = 2'h0;
parameter FB_SOURCE_SEL_1 = 2'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module ICB_CLKDIV(
       RST_N,
       BIT_SLIP,
       A,
       Y_DIV
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " BIT_SLIP->A = 0.503"
syn_tsu1 = " RST_N->A = 0.546"
syn_tco0 = " A->Y_DIV = 1.870"
*/
/* synthesis black_box_pad_pin ="" */
input  RST_N;
input  BIT_SLIP;
input  A;
output Y_DIV;
parameter DIVIDER = 3'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module ICB_CLKINT(
       A,
       Y
    ) ;
/* synthesis syn_black_box

syn_trr0 = " A->Y = 2.071"
syn_tff0 = " A->Y = 2.071"
*/
/* synthesis black_box_pad_pin ="" */
input  A;
output Y;

endmodule
`timescale 1 ns/100 ps
// Version: 


module ICB_CLKSTOP_EN(
       EN,
       EN_OUT
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  EN;
output EN_OUT;

endmodule
`timescale 1 ns/100 ps
// Version: 


module ICB_CLKSTOP(
       A,
       Y,
       EN
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " EN->A = 0.183"
syn_tco0 = " A->Y = 2.071"
*/
/* synthesis black_box_pad_pin ="" */
input  A;
output Y;
input  EN;

endmodule
`timescale 1 ns/100 ps
// Version: 


module ICB_INT(
       A,
       Y
    ) ;
/* synthesis syn_black_box

syn_trr0 = " A->Y = 1.438"
syn_tff0 = " A->Y = 1.438"
*/
/* synthesis black_box_pad_pin ="" */
input  A;
output Y;

endmodule
`timescale 1 ns/100 ps
// Version: 


module ICB_MUXING(
       A
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  A;
parameter BANK_OUT_CCW_SEL = 6'h0;
parameter BANK_OUT_CW_SEL = 6'h0;
parameter DYNEN = 1'h0;
parameter DYNEN_SOFT_RESET = 1'h0;
parameter NMUX_SEL = 72'h0;
parameter SOFT_RESET = 1'h0;
parameter SOFT_RESET_PERIPH = 1'h0;
parameter BANKCLK_CCW_SOURCE_SEL = 30'h0;
parameter BANKCLK_CW_SOURCE_SEL = 30'h0;
parameter CLKSTOP_SOURCE_SEL = 60'h0;
parameter STOP_SEL = 24'h0;
parameter BANKCLK_BRIDGING = 10'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module ICB_NGMUX(
       SEL,
       CLK0,
       CLK1,
       Y
    ) ;
/* synthesis syn_black_box

syn_trr0 = " CLK0->Y = 2.116"
syn_trr1 = " CLK1->Y = 2.112"
syn_tff2 = " CLK0->Y = 2.116"
syn_tff3 = " CLK1->Y = 2.112"
*/
/* synthesis black_box_pad_pin ="" */
input  SEL;
input  CLK0;
input  CLK1;
output Y;
parameter NGMUX_MODE = 1'h0;
parameter CLK0_SOURCE_SEL = 1'h0;
parameter CLK1_SOURCE_SEL = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module INIT(
       FABRIC_POR_N,
       GPIO_ACTIVE,
       HSIO_ACTIVE,
       PCIE_INIT_DONE,
       RFU,
       SRAM_INIT_DONE,
       UIC_INIT_DONE,
       USRAM_INIT_DONE
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
output FABRIC_POR_N;
output GPIO_ACTIVE;
output HSIO_ACTIVE;
output PCIE_INIT_DONE;
output [11:0] RFU;
output SRAM_INIT_DONE;
output UIC_INIT_DONE;
output USRAM_INIT_DONE;
parameter FABRIC_POR_N_SIMULATION_DELAY = 0.0;
parameter GPIO_ACTIVE_SIMULATION_DELAY = 0.0;
parameter HSIO_ACTIVE_SIMULATION_DELAY = 0.0;
parameter PCIE_INIT_DONE_SIMULATION_DELAY = 0.0;
parameter RFU_SIMULATION_DELAY = 0.0;
parameter SRAM_INIT_DONE_SIMULATION_DELAY = 0.0;
parameter UIC_INIT_DONE_SIMULATION_DELAY = 0.0;
parameter USRAM_INIT_DONE_SIMULATION_DELAY = 0.0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module IOD(
       TX_DATA,
       OE_DATA,
       RX_BIT_SLIP,
       EYE_MONITOR_CLEAR_FLAGS,
       DELAY_LINE_MOVE,
       DELAY_LINE_DIRECTION,
       DELAY_LINE_LOAD,
       RX_CLK,
       TX_CLK,
       ODT_EN,
       INFF_SL,
       INFF_EN,
       OUTFF_SL,
       OUTFF_EN,
       AL_N,
       OEFF_LAT_N,
       OEFF_SD_N,
       OEFF_AD_N,
       INFF_LAT_N,
       INFF_SD_N,
       INFF_AD_N,
       OUTFF_LAT_N,
       OUTFF_SD_N,
       OUTFF_AD_N,
       EYE_MONITOR_EARLY,
       EYE_MONITOR_LATE,
       RX_DATA,
       DELAY_LINE_OUT_OF_RANGE,
       RX_P,
       RX_N,
       TX_DATA_9,
       TX_DATA_8,
       ARST_N,
       RX_SYNC_RST,
       TX_SYNC_RST,
       HS_IO_CLK,
       RX_DQS_90,
       TX_DQS,
       TX_DQS_270,
       FIFO_WR_PTR,
       FIFO_RD_PTR,
       TX,
       OE,
       CDR_CLK,
       CDR_NEXT_CLK,
       EYE_MONITOR_LANE_WIDTH,
       DDR_DO_READ,
       CDR_CLK_A_SEL_8,
       CDR_CLK_A_SEL_9,
       CDR_CLK_A_SEL_10,
       CDR_CLK_B_SEL,
       SWITCH,
       CDR_CLR_NEXT_CLK_N,
       TX_DATA_OUT_9,
       TX_DATA_OUT_8,
       AL_N_OUT,
       OUTFF_SL_OUT,
       OUTFF_EN_OUT,
       INFF_SL_OUT,
       INFF_EN_OUT,
       RX_CLK_OUT,
       TX_CLK_OUT
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " OE_DATA[1]->TX_CLK = 0.652"
syn_tsu1 = " OE_DATA[2]->TX_CLK = 0.648"
syn_tsu2 = " OE_DATA[3]->TX_CLK = 0.648"
syn_tsu3 = " RX_BIT_SLIP->CDR_CLK = 0.27"
syn_tsu4 = " RX_BIT_SLIP->HS_IO_CLK[0] = 0.191"
syn_tsu5 = " RX_BIT_SLIP->HS_IO_CLK[1] = 0.191"
syn_tsu6 = " RX_BIT_SLIP->HS_IO_CLK[2] = 0.191"
syn_tsu7 = " RX_BIT_SLIP->HS_IO_CLK[3] = 0.191"
syn_tsu8 = " RX_BIT_SLIP->HS_IO_CLK[4] = 0.191"
syn_tsu9 = " RX_BIT_SLIP->HS_IO_CLK[5] = 0.191"
syn_tsu10 = " RX_N->HS_IO_CLK[0] = 1.36"
syn_tsu11 = " RX_N->HS_IO_CLK[1] = 1.36"
syn_tsu12 = " RX_N->HS_IO_CLK[2] = 1.36"
syn_tsu13 = " RX_N->HS_IO_CLK[3] = 1.36"
syn_tsu14 = " RX_N->HS_IO_CLK[4] = 1.36"
syn_tsu15 = " RX_N->HS_IO_CLK[5] = 1.36"
syn_tsu16 = " RX_P->CDR_CLK = 1.253"
syn_tsu17 = " RX_P->HS_IO_CLK[0] = 1.025"
syn_tsu18 = " RX_P->HS_IO_CLK[0] = 1.017"
syn_tsu19 = " RX_P->HS_IO_CLK[1] = 1.025"
syn_tsu20 = " RX_P->HS_IO_CLK[1] = 1.017"
syn_tsu21 = " RX_P->HS_IO_CLK[2] = 1.025"
syn_tsu22 = " RX_P->HS_IO_CLK[2] = 1.017"
syn_tsu23 = " RX_P->HS_IO_CLK[3] = 1.025"
syn_tsu24 = " RX_P->HS_IO_CLK[3] = 1.017"
syn_tsu25 = " RX_P->HS_IO_CLK[4] = 1.025"
syn_tsu26 = " RX_P->HS_IO_CLK[4] = 1.017"
syn_tsu27 = " RX_P->HS_IO_CLK[5] = 1.025"
syn_tsu28 = " RX_P->HS_IO_CLK[5] = 1.017"
syn_tsu29 = " RX_P->RX_DQS_90[0] = 1.284"
syn_tsu30 = " RX_P->RX_DQS_90[1] = 1.449"
syn_tsu31 = " TX_DATA[0]->TX_CLK = 0.752"
syn_tsu32 = " TX_DATA[1]->TX_CLK = 0.725"
syn_tsu33 = " TX_DATA[2]->TX_CLK = 0.74"
syn_tsu34 = " TX_DATA[3]->TX_CLK = 0.734"
syn_tsu35 = " TX_DATA[4]->TX_CLK = 0.718"
syn_tsu36 = " TX_DATA[5]->TX_CLK = 0.712"
syn_tsu37 = " TX_DATA[6]->TX_CLK = 0.7"
syn_tsu38 = " TX_DATA[7]->TX_CLK = 0.707"
syn_tsu39 = " TX_DATA_8->TX_CLK = 0.697"
syn_tsu40 = " TX_DATA_9->TX_CLK = 0.697"
syn_tsu41 = " RX_P->RX_CLK = 1.017 "
syn_tco1 = " HS_IO_CLK[0]->TX = 2.691"
syn_tco2 = " HS_IO_CLK[0]->TX = 2.682"
syn_tco3 = " HS_IO_CLK[1]->TX = 2.691"
syn_tco4 = " HS_IO_CLK[1]->TX = 2.682"
syn_tco5 = " HS_IO_CLK[2]->TX = 2.691"
syn_tco6 = " HS_IO_CLK[2]->TX = 2.682"
syn_tco7 = " HS_IO_CLK[3]->TX = 2.691"
syn_tco8 = " HS_IO_CLK[3]->TX = 2.682"
syn_tco9 = " HS_IO_CLK[4]->TX = 2.691"
syn_tco10 = " HS_IO_CLK[4]->TX = 2.682"
syn_tco11 = " HS_IO_CLK[5]->TX = 2.691"
syn_tco12 = " HS_IO_CLK[5]->TX = 2.682"
syn_tpd13 = " OE_DATA[0]->OE = 1.962"
syn_tco14 = " RX_CLK->RX_DATA[2] = 1.912"
syn_tco15 = " RX_CLK->RX_DATA[3] = 1.914"
syn_tco16 = " RX_CLK->RX_DATA[4] = 1.910"
syn_tco17 = " RX_CLK->RX_DATA[5] = 1.951"
syn_tco18 = " RX_CLK->RX_DATA[6] = 1.922"
syn_tco19 = " RX_CLK->RX_DATA[7] = 1.931"
syn_tco20 = " RX_CLK->RX_DATA[8] = 1.917"
syn_tco21 = " RX_CLK->RX_DATA[9] = 1.917"
syn_tpd22 = " RX_P->RX_DATA[0] = 2.302"
syn_tco23 = " TX_DQS->TX = 2.481"
syn_tco24 = " TX_DQS->TX = 2.475"
syn_tco25 = " TX_DQS_270->TX = 2.481"
syn_tco26 = " TX_DQS_270->TX = 2.475"
syn_tco27 = " TX_CLK->TX = 2.691 "
*/
/* synthesis black_box_pad_pin ="" */
/* synthesis syn_noprune = 1 */
input  [7:0] TX_DATA;
input  [3:0] OE_DATA;
input  RX_BIT_SLIP;
input  EYE_MONITOR_CLEAR_FLAGS;
input  DELAY_LINE_MOVE;
input  DELAY_LINE_DIRECTION;
input  DELAY_LINE_LOAD;
input  RX_CLK;
input  TX_CLK;
input  ODT_EN;
input  INFF_SL;
input  INFF_EN;
input  OUTFF_SL;
input  OUTFF_EN;
input  AL_N;
input  OEFF_LAT_N;
input  OEFF_SD_N;
input  OEFF_AD_N;
input  INFF_LAT_N;
input  INFF_SD_N;
input  INFF_AD_N;
input  OUTFF_LAT_N;
input  OUTFF_SD_N;
input  OUTFF_AD_N;
output EYE_MONITOR_EARLY;
output EYE_MONITOR_LATE;
output [9:0] RX_DATA;
output DELAY_LINE_OUT_OF_RANGE;
input  RX_P;
input  RX_N;
input  TX_DATA_9;
input  TX_DATA_8;
input  ARST_N;
input  RX_SYNC_RST;
input  TX_SYNC_RST;
input  [5:0] HS_IO_CLK;
input  [1:0] RX_DQS_90;
input  TX_DQS;
input  TX_DQS_270;
input  [2:0] FIFO_WR_PTR;
input  [2:0] FIFO_RD_PTR;
output TX;
output OE;
input  CDR_CLK;
input  CDR_NEXT_CLK;
input  [2:0] EYE_MONITOR_LANE_WIDTH;
output DDR_DO_READ;
output CDR_CLK_A_SEL_8;
output CDR_CLK_A_SEL_9;
output CDR_CLK_A_SEL_10;
output [10:0] CDR_CLK_B_SEL;
output SWITCH;
output CDR_CLR_NEXT_CLK_N;
output TX_DATA_OUT_9;
output TX_DATA_OUT_8;
output AL_N_OUT;
output OUTFF_SL_OUT;
output OUTFF_EN_OUT;
output INFF_SL_OUT;
output INFF_EN_OUT;
output RX_CLK_OUT;
output TX_CLK_OUT;
parameter DATA_RATE = 0.0;
parameter FORMAL_NAME = "";
parameter INTERFACE_NAME = "";
parameter DELAY_LINE_SIMULATION_MODE = "";
parameter MSC_UNIQUE = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter RESERVED_0 = 1'h0;
parameter RX_CLK_EN = 1'h0;
parameter RX_CLK_INV = 1'h0;
parameter TX_CLK_EN = 1'h0;
parameter TX_CLK_INV = 1'h0;
parameter HS_IO_CLK_SEL = 3'h0;
parameter QDR_EN = 1'h0;
parameter EDGE_DETECT_EN = 1'h0;
parameter DELAY_LINE_MODE = 2'h0;
parameter RX_MODE = 4'h0;
parameter EYE_MONITOR_MODE = 1'h0;
parameter DYN_DELAY_LINE_EN = 1'h0;
parameter FIFO_WR_EN = 1'h0;
parameter EYE_MONITOR_EN = 1'h0;
parameter TX_MODE = 7'h0;
parameter TX_CLK_SEL = 2'h0;
parameter TX_OE_MODE = 3'h0;
parameter TX_OE_CLK_INV = 1'h0;
parameter RX_DELAY_VAL = 7'h0;
parameter RX_DELAY_VAL_X2 = 1'h0;
parameter TX_DELAY_VAL = 7'h0;
parameter EYE_MONITOR_WIDTH = 3'h0;
parameter EYE_MONITOR_WIDTH_SRC = 1'h0;
parameter RESERVED_1 = 1'h0;
parameter DISABLE_LANECTRL_RESET = 1'h0;
parameter INPUT_DELAY_SEL = 2'h0;
parameter OEFF_EN_INV = 1'h0;
parameter INFF_EN_INV = 1'h0;
parameter OUTFF_EN_INV = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 
/* Modified manually to add HS_IO_CLK to RX_DQS_90[0] */

module LANECTRL(
       FAB_CLK,
       RESET,
       DDR_READ,
       READ_CLK_SEL,
       DELAY_LINE_SEL,
       DELAY_LINE_LOAD,
       DELAY_LINE_DIRECTION,
       DELAY_LINE_MOVE,
       HS_IO_CLK_PAUSE,
       DIV_CLK_EN_N,
       RX_BIT_SLIP,
       CDR_CLK_A_SEL,
       EYE_MONITOR_WIDTH_IN,
       ODT_EN,
       CODE_UPDATE,
       RX_DATA_VALID,
       RX_BURST_DETECT,
       RX_DELAY_LINE_OUT_OF_RANGE,
       TX_DELAY_LINE_OUT_OF_RANGE,
       CLK_OUT_R,
       A_OUT_RST_N,
       DQS,
       DQS_N,
       HS_IO_CLK,
       DLL_CODE,
       EYE_MONITOR_WIDTH_OUT,
       ODT_EN_SEL,
       RX_DQS_90,
       TX_DQS,
       TX_DQS_270,
       FIFO_WR_PTR,
       FIFO_RD_PTR,
       CDR_CLK,
       CDR_NEXT_CLK,
       ARST_N,
       RX_SYNC_RST,
       TX_SYNC_RST,
       ODT_EN_OUT,
       DDR_DO_READ,
       CDR_CLK_A_SEL_8,
       CDR_CLK_A_SEL_9,
       CDR_CLK_A_SEL_10,
       CDR_CLK_B_SEL,
       SWITCH,
       CDR_CLR_NEXT_CLK_N
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " CODE_UPDATE->FAB_CLK = 0.321"
syn_tsu1 = " DDR_READ->HS_IO_CLK[0] = 0.2"
syn_tsu2 = " DDR_READ->HS_IO_CLK[1] = 0.2"
syn_tsu3 = " DDR_READ->HS_IO_CLK[2] = 0.2"
syn_tsu4 = " DDR_READ->HS_IO_CLK[3] = 0.2"
syn_tsu5 = " DDR_READ->HS_IO_CLK[4] = 0.2"
syn_tsu6 = " DDR_READ->HS_IO_CLK[5] = 0.2"
syn_tsu14 = " RX_BIT_SLIP->HS_IO_CLK[0] = 0"
syn_tsu15 = " RX_BIT_SLIP->HS_IO_CLK[1] = 0"
syn_tsu16 = " RX_BIT_SLIP->HS_IO_CLK[2] = 0"
syn_tsu17 = " RX_BIT_SLIP->HS_IO_CLK[3] = 0"
syn_tsu18 = " RX_BIT_SLIP->HS_IO_CLK[4] = 0"
syn_tsu19 = " RX_BIT_SLIP->HS_IO_CLK[5] = 0"
syn_tsu20 = " SWITCH->HS_IO_CLK[0] = 0"
syn_tsu21 = " SWITCH->HS_IO_CLK[1] = 0"
syn_tsu22 = " SWITCH->HS_IO_CLK[2] = 0"
syn_tsu23 = " SWITCH->HS_IO_CLK[3] = 0"
syn_tsu24 = " SWITCH->HS_IO_CLK[4] = 0"
syn_tsu25 = " SWITCH->HS_IO_CLK[5] = 0"
syn_tpd3 = " EYE_MONITOR_WIDTH_IN[0]->EYE_MONITOR_WIDTH_OUT[0] = 1.458"
syn_tpd4 = " EYE_MONITOR_WIDTH_IN[1]->EYE_MONITOR_WIDTH_OUT[1] = 1.464"
syn_tpd5 = " EYE_MONITOR_WIDTH_IN[2]->EYE_MONITOR_WIDTH_OUT[2] = 1.461"
syn_tco6 = " FAB_CLK->RX_BURST_DETECT = 1.902"
syn_tco7 = " FAB_CLK->RX_DATA_VALID = 1.890"
syn_tco8 = " HS_IO_CLK[0]->FIFO_RD_PTR[0] = 1.945"
syn_tco9 = " HS_IO_CLK[0]->FIFO_RD_PTR[1] = 1.943"
syn_tco10 = " HS_IO_CLK[0]->FIFO_RD_PTR[2] = 1.932"
syn_tco11 = " HS_IO_CLK[0]->RX_DQS_90[1] = 8.072"
syn_tco12 = " HS_IO_CLK[0]->RX_SYNC_RST = 1.999"
syn_tco13 = " HS_IO_CLK[1]->FIFO_RD_PTR[0] = 1.945"
syn_tco14 = " HS_IO_CLK[1]->FIFO_RD_PTR[1] = 1.943"
syn_tco15 = " HS_IO_CLK[1]->FIFO_RD_PTR[2] = 1.932"
syn_tco16 = " HS_IO_CLK[1]->RX_DQS_90[1] = 8.072"
syn_tco17 = " HS_IO_CLK[1]->RX_SYNC_RST = 1.999"
syn_tco18 = " HS_IO_CLK[2]->FIFO_RD_PTR[0] = 1.945"
syn_tco19 = " HS_IO_CLK[2]->FIFO_RD_PTR[1] = 1.943"
syn_tco20 = " HS_IO_CLK[2]->FIFO_RD_PTR[2] = 1.932"
syn_tco21 = " HS_IO_CLK[2]->RX_DQS_90[1] = 8.072"
syn_tco22 = " HS_IO_CLK[2]->RX_SYNC_RST = 1.999"
syn_tco23 = " HS_IO_CLK[3]->FIFO_RD_PTR[0] = 1.945"
syn_tco24 = " HS_IO_CLK[3]->FIFO_RD_PTR[1] = 1.943"
syn_tco25 = " HS_IO_CLK[3]->FIFO_RD_PTR[2] = 1.932"
syn_tco26 = " HS_IO_CLK[3]->RX_DQS_90[1] = 8.072"
syn_tco27 = " HS_IO_CLK[3]->RX_SYNC_RST = 1.999"
syn_tco28 = " HS_IO_CLK[4]->FIFO_RD_PTR[0] = 1.945"
syn_tco29 = " HS_IO_CLK[4]->FIFO_RD_PTR[1] = 1.943"
syn_tco30 = " HS_IO_CLK[4]->FIFO_RD_PTR[2] = 1.932"
syn_tco31 = " HS_IO_CLK[4]->RX_DQS_90[1] = 8.072"
syn_tco32 = " HS_IO_CLK[4]->RX_SYNC_RST = 1.999"
syn_tco33 = " HS_IO_CLK[5]->FIFO_RD_PTR[0] = 1.945"
syn_tco34 = " HS_IO_CLK[5]->FIFO_RD_PTR[1] = 1.943"
syn_tco35 = " HS_IO_CLK[5]->FIFO_RD_PTR[2] = 1.932"
syn_tco36 = " HS_IO_CLK[5]->RX_DQS_90[1] = 8.072"
syn_tco37 = " HS_IO_CLK[5]->RX_SYNC_RST = 1.999"
syn_tpd38 = " ODT_EN->ODT_EN_OUT = 1.462"
syn_tpd39 = " RESET->ARST_N = 1.854"
syn_tpd40 = " RESET->A_OUT_RST_N = 1.981"
syn_trr41 = " HS_IO_CLK[0]->RX_DQS_90[0] = 8.072"
syn_trr42 = " HS_IO_CLK[1]->RX_DQS_90[0] = 8.072"
syn_trr43 = " HS_IO_CLK[2]->RX_DQS_90[0] = 8.072"
syn_trr44 = " HS_IO_CLK[3]->RX_DQS_90[0] = 8.072"
syn_trr45 = " HS_IO_CLK[4]->RX_DQS_90[0] = 8.072"
syn_trr46 = " HS_IO_CLK[5]->RX_DQS_90[0] = 8.072"
syn_tff47 = " HS_IO_CLK[0]->RX_DQS_90[0] = 8.072"
syn_tff48 = " HS_IO_CLK[1]->RX_DQS_90[0] = 8.072"
syn_tff49 = " HS_IO_CLK[2]->RX_DQS_90[0] = 8.072"
syn_tff50 = " HS_IO_CLK[3]->RX_DQS_90[0] = 8.072"
syn_tff51 = " HS_IO_CLK[4]->RX_DQS_90[0] = 8.072"
syn_tff52 = " HS_IO_CLK[5]->RX_DQS_90[0] = 8.072"
*/
/* synthesis black_box_pad_pin ="" */
input  FAB_CLK;
input  RESET;
input  DDR_READ;
input  [2:0] READ_CLK_SEL;
input  DELAY_LINE_SEL;
input  DELAY_LINE_LOAD;
input  DELAY_LINE_DIRECTION;
input  DELAY_LINE_MOVE;
input  HS_IO_CLK_PAUSE;
input  DIV_CLK_EN_N;
input  RX_BIT_SLIP;
input  [7:0] CDR_CLK_A_SEL;
input  [2:0] EYE_MONITOR_WIDTH_IN;
input  ODT_EN;
input  CODE_UPDATE;
output RX_DATA_VALID;
output RX_BURST_DETECT;
output RX_DELAY_LINE_OUT_OF_RANGE;
output TX_DELAY_LINE_OUT_OF_RANGE;
output CLK_OUT_R;
output A_OUT_RST_N;
input  DQS;
input  DQS_N;
input  [5:0] HS_IO_CLK;
input  [7:0] DLL_CODE;
output [2:0] EYE_MONITOR_WIDTH_OUT;
output ODT_EN_SEL;
output [1:0] RX_DQS_90;
output TX_DQS;
output TX_DQS_270;
output [2:0] FIFO_WR_PTR;
output [2:0] FIFO_RD_PTR;
output CDR_CLK;
output CDR_NEXT_CLK;
output ARST_N;
output RX_SYNC_RST;
output TX_SYNC_RST;
output ODT_EN_OUT;
input  DDR_DO_READ;
input  CDR_CLK_A_SEL_8;
input  CDR_CLK_A_SEL_9;
input  CDR_CLK_A_SEL_10;
input  [10:0] CDR_CLK_B_SEL;
input  SWITCH;
input  CDR_CLR_NEXT_CLK_N;
parameter DATA_RATE = 0.0;
parameter FORMAL_NAME = "";
parameter INTERFACE_NAME = "";
parameter DELAY_LINE_SIMULATION_MODE = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter RESERVED_0 = 1'h0;
parameter RESERVED_1 = 1'h0;
parameter RESERVED_2 = 1'h0;
parameter SOFTRESET_EN = 1'h0;
parameter SOFTRESET = 1'h0;
parameter RX_DQS_DELAY_LINE_EN = 1'h0;
parameter TX_DQS_DELAY_LINE_EN = 1'h0;
parameter RX_DQS_DELAY_LINE_DIRECTION = 1'h0;
parameter TX_DQS_DELAY_LINE_DIRECTION = 1'h0;
parameter RX_DQS_DELAY_VAL = 8'h0;
parameter TX_DQS_DELAY_VAL = 8'h0;
parameter FIFO_EN = 1'h0;
parameter FIFO_MODE = 1'h0;
parameter FIFO_RD_PTR_MODE = 3'h0;
parameter DQS_MODE = 3'h0;
parameter CDR_EN = 2'h0;
parameter HS_IO_CLK_SEL = 9'h0;
parameter DLL_CODE_SEL = 2'h0;
parameter CDR_CLK_SEL = 12'h0;
parameter READ_MARGIN_TEST_EN = 1'h0;
parameter WRITE_MARGIN_TEST_EN = 1'h0;
parameter CDR_CLK_DIV = 3'h0;
parameter DIV_CLK_SEL = 2'h0;
parameter HS_IO_CLK_PAUSE_EN = 1'h0;
parameter QDR_EN = 1'h0;
parameter DYN_ODT_MODE = 1'h0;
parameter DIV_CLK_EN_SRC = 2'h0;
parameter RANK_2_MODE = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module LANERST(
       RESET,
       ARST_N
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  RESET;
output ARST_N;

endmodule
`timescale 1 ns/100 ps
// Version: 


module MSS(
       FIC_0_ACLK,
       FIC_0_AXI4_M_AWREADY,
       FIC_0_AXI4_M_WREADY,
       FIC_0_AXI4_M_BID,
       FIC_0_AXI4_M_BRESP,
       FIC_0_AXI4_M_BVALID,
       FIC_0_AXI4_M_ARREADY,
       FIC_0_AXI4_M_RID,
       FIC_0_AXI4_M_RDATA,
       FIC_0_AXI4_M_RRESP,
       FIC_0_AXI4_M_RLAST,
       FIC_0_AXI4_M_RVALID,
       FIC_0_AXI4_S_AWID,
       FIC_0_AXI4_S_AWADDR,
       FIC_0_AXI4_S_AWLEN,
       FIC_0_AXI4_S_AWSIZE,
       FIC_0_AXI4_S_AWBURST,
       FIC_0_AXI4_S_AWQOS,
       FIC_0_AXI4_S_AWLOCK,
       FIC_0_AXI4_S_AWCACHE,
       FIC_0_AXI4_S_AWPROT,
       FIC_0_AXI4_S_AWVALID,
       FIC_0_AXI4_S_WDATA,
       FIC_0_AXI4_S_WSTRB,
       FIC_0_AXI4_S_WLAST,
       FIC_0_AXI4_S_WVALID,
       FIC_0_AXI4_S_BREADY,
       FIC_0_AXI4_S_ARID,
       FIC_0_AXI4_S_ARADDR,
       FIC_0_AXI4_S_ARLEN,
       FIC_0_AXI4_S_ARSIZE,
       FIC_0_AXI4_S_ARBURST,
       FIC_0_AXI4_S_ARQOS,
       FIC_0_AXI4_S_ARLOCK,
       FIC_0_AXI4_S_ARCACHE,
       FIC_0_AXI4_S_ARPROT,
       FIC_0_AXI4_S_ARVALID,
       FIC_0_AXI4_S_RREADY,
       FIC_1_ACLK,
       FIC_1_AXI4_M_AWREADY,
       FIC_1_AXI4_M_WREADY,
       FIC_1_AXI4_M_BID,
       FIC_1_AXI4_M_BRESP,
       FIC_1_AXI4_M_BVALID,
       FIC_1_AXI4_M_ARREADY,
       FIC_1_AXI4_M_RID,
       FIC_1_AXI4_M_RDATA,
       FIC_1_AXI4_M_RRESP,
       FIC_1_AXI4_M_RLAST,
       FIC_1_AXI4_M_RVALID,
       FIC_1_AXI4_S_AWID,
       FIC_1_AXI4_S_AWADDR,
       FIC_1_AXI4_S_AWLEN,
       FIC_1_AXI4_S_AWSIZE,
       FIC_1_AXI4_S_AWBURST,
       FIC_1_AXI4_S_AWLOCK,
       FIC_1_AXI4_S_AWCACHE,
       FIC_1_AXI4_S_AWQOS,
       FIC_1_AXI4_S_AWPROT,
       FIC_1_AXI4_S_AWVALID,
       FIC_1_AXI4_S_WDATA,
       FIC_1_AXI4_S_WSTRB,
       FIC_1_AXI4_S_WLAST,
       FIC_1_AXI4_S_WVALID,
       FIC_1_AXI4_S_BREADY,
       FIC_1_AXI4_S_ARID,
       FIC_1_AXI4_S_ARADDR,
       FIC_1_AXI4_S_ARLEN,
       FIC_1_AXI4_S_ARSIZE,
       FIC_1_AXI4_S_ARBURST,
       FIC_1_AXI4_S_ARQOS,
       FIC_1_AXI4_S_ARLOCK,
       FIC_1_AXI4_S_ARCACHE,
       FIC_1_AXI4_S_ARPROT,
       FIC_1_AXI4_S_ARVALID,
       FIC_1_AXI4_S_RREADY,
       FIC_2_ACLK,
       SPARE_3_F2M,
       FIC_2_AXI4_S_AWID,
       FIC_2_AXI4_S_AWADDR,
       FIC_2_AXI4_S_AWLEN,
       FIC_2_AXI4_S_AWSIZE,
       FIC_2_AXI4_S_AWBURST,
       FIC_2_AXI4_S_AWLOCK,
       FIC_2_AXI4_S_AWCACHE,
       FIC_2_AXI4_S_AWQOS,
       FIC_2_AXI4_S_AWPROT,
       FIC_2_AXI4_S_AWVALID,
       FIC_2_AXI4_S_WDATA,
       FIC_2_AXI4_S_WSTRB,
       FIC_2_AXI4_S_WLAST,
       FIC_2_AXI4_S_WVALID,
       FIC_2_AXI4_S_BREADY,
       FIC_2_AXI4_S_ARID,
       FIC_2_AXI4_S_ARADDR,
       FIC_2_AXI4_S_ARLEN,
       FIC_2_AXI4_S_ARSIZE,
       FIC_2_AXI4_S_ARBURST,
       FIC_2_AXI4_S_ARLOCK,
       FIC_2_AXI4_S_ARCACHE,
       FIC_2_AXI4_S_ARQOS,
       FIC_2_AXI4_S_ARPROT,
       FIC_2_AXI4_S_ARVALID,
       FIC_2_AXI4_S_RREADY,
       FIC_3_PCLK,
       SPARE_4_F2M,
       FIC_3_APB_M_PRDATA,
       FIC_3_APB_M_PREADY,
       FIC_3_APB_M_PSLVERR,
       MMUART_0_DCD_F2M,
       MMUART_0_RI_F2M,
       MMUART_0_DSR_F2M,
       MMUART_0_CTS_F2M,
       MMUART_0_RXD_F2M,
       MMUART_0_CLK_F2M,
       MMUART_1_DCD_F2M,
       MMUART_1_RI_F2M,
       MMUART_1_DSR_F2M,
       MMUART_1_CTS_F2M,
       MMUART_1_RXD_F2M,
       MMUART_1_CLK_F2M,
       MMUART_2_RXD_F2M,
       MMUART_3_RXD_F2M,
       MMUART_4_RXD_F2M,
       CAN_0_RXBUS_F2M,
       CAN_1_RXBUS_F2M,
       CAN_CLK_F2M,
       QSPI_DATA_F2M,
       SPI_0_SS_F2M,
       SPI_0_DI_F2M,
       SPI_0_CLK_F2M,
       SPI_1_SS_F2M,
       SPI_1_DI_F2M,
       SPI_1_CLK_F2M,
       I2C_0_SCL_F2M,
       I2C_1_SCL_F2M,
       I2C_0_SDA_F2M,
       I2C_1_SDA_F2M,
       I2C_0_BCLK_F2M,
       I2C_0_SMBALERT_NI_F2M,
       I2C_0_SMBSUS_NI_F2M,
       I2C_1_BCLK_F2M,
       I2C_1_SMBALERT_NI_F2M,
       I2C_1_SMBSUS_NI_F2M,
       GPIO_2_F2M,
       MAC_0_MDI_F2M,
       MAC_1_MDI_F2M,
       JTAG_TMS_F2M,
       JTAG_TCK_F2M,
       JTAG_TDI_F2M,
       JTAG_TRSTB_F2M,
       MSS_INT_F2M,
       SPARE_1_F2M,
       SPARE_2_F2M,
       BOOT_FAIL_CLEAR_F2M,
       MSS_RESET_N_F2M,
       GPIO_RESET_N_F2M,
       USOC_TRACE_CLOCK_F2M,
       USOC_TRACE_VALID_F2M,
       USOC_TRACE_DATA_F2M,
       SPARE_5_F2M,
       MAC_0_GMII_MII_RXD_F2M,
       MAC_0_GMII_MII_RX_DV_F2M,
       MAC_0_GMII_MII_RX_ER_F2M,
       MAC_0_GMII_MII_RX_CRS_F2M,
       MAC_0_GMII_MII_RX_COL_F2M,
       MAC_0_GMII_MII_RX_CLK_F2M,
       MAC_0_GMII_MII_TX_CLK_F2M,
       MAC_0_TSU_CLK_F2M,
       MAC_1_GMII_MII_RXD_F2M,
       MAC_1_GMII_MII_RX_DV_F2M,
       MAC_1_GMII_MII_RX_ER_F2M,
       MAC_1_GMII_MII_RX_CRS_F2M,
       MAC_1_GMII_MII_RX_COL_F2M,
       MAC_1_GMII_MII_RX_CLK_F2M,
       MAC_1_GMII_MII_TX_CLK_F2M,
       MAC_1_TSU_CLK_F2M,
       MAC_0_FILTER_MATCH1_F2M,
       MAC_0_FILTER_MATCH2_F2M,
       MAC_0_FILTER_MATCH3_F2M,
       MAC_0_FILTER_MATCH4_F2M,
       MAC_1_FILTER_MATCH1_F2M,
       MAC_1_FILTER_MATCH2_F2M,
       MAC_1_FILTER_MATCH3_F2M,
       MAC_1_FILTER_MATCH4_F2M,
       MAC_0_TSU_GEM_MS_F2M,
       MAC_0_TSU_GEM_INC_CTRL_F2M,
       MAC_1_TSU_GEM_MS_F2M,
       MAC_1_TSU_GEM_INC_CTRL_F2M,
       CRYPTO_HCLK,
       CRYPTO_HRESETN,
       CRYPTO_AHB_M_HREADY,
       CRYPTO_AHB_M_HRESP,
       CRYPTO_AHB_M_HRDATA,
       CRYPTO_AHB_S_HSEL,
       CRYPTO_AHB_S_HADDR,
       CRYPTO_AHB_S_HWDATA,
       CRYPTO_AHB_S_HSIZE,
       CRYPTO_AHB_S_HTRANS,
       CRYPTO_AHB_S_HWRITE,
       CRYPTO_AHB_S_HREADY,
       CRYPTO_STALL_F2M,
       CRYPTO_PURGE_F2M,
       CRYPTO_GO_F2M,
       CRYPTO_REQUEST_F2M,
       CRYPTO_RELEASE_F2M,
       CRYPTO_XENABLE_F2M,
       CRYPTO_XWDATA_F2M,
       CRYPTO_XOUTACK_F2M,
       CRYPTO_MESH_CLEAR_F2M,
       EMMC_SD_CLK_F2M,
       FIC_0_DLL_LOCK_M2F,
       FIC_1_DLL_LOCK_M2F,
       FIC_2_DLL_LOCK_M2F,
       FIC_3_DLL_LOCK_M2F,
       FIC_0_AXI4_M_AWID,
       FIC_0_AXI4_M_AWADDR,
       FIC_0_AXI4_M_AWLEN,
       FIC_0_AXI4_M_AWSIZE,
       FIC_0_AXI4_M_AWBURST,
       FIC_0_AXI4_M_AWLOCK,
       FIC_0_AXI4_M_AWQOS,
       FIC_0_AXI4_M_AWCACHE,
       FIC_0_AXI4_M_AWPROT,
       FIC_0_AXI4_M_AWVALID,
       FIC_0_AXI4_M_WDATA,
       FIC_0_AXI4_M_WSTRB,
       FIC_0_AXI4_M_WLAST,
       FIC_0_AXI4_M_WVALID,
       FIC_0_AXI4_M_BREADY,
       FIC_0_AXI4_M_ARID,
       FIC_0_AXI4_M_ARADDR,
       FIC_0_AXI4_M_ARLEN,
       FIC_0_AXI4_M_ARSIZE,
       FIC_0_AXI4_M_ARBURST,
       FIC_0_AXI4_M_ARLOCK,
       FIC_0_AXI4_M_ARQOS,
       FIC_0_AXI4_M_ARCACHE,
       FIC_0_AXI4_M_ARPROT,
       FIC_0_AXI4_M_ARVALID,
       FIC_0_AXI4_M_RREADY,
       FIC_0_AXI4_S_AWREADY,
       FIC_0_AXI4_S_WREADY,
       FIC_0_AXI4_S_BID,
       FIC_0_AXI4_S_BRESP,
       FIC_0_AXI4_S_BVALID,
       FIC_0_AXI4_S_ARREADY,
       FIC_0_AXI4_S_RID,
       FIC_0_AXI4_S_RDATA,
       FIC_0_AXI4_S_RRESP,
       FIC_0_AXI4_S_RLAST,
       FIC_0_AXI4_S_RVALID,
       FIC_1_AXI4_M_AWID,
       FIC_1_AXI4_M_AWADDR,
       FIC_1_AXI4_M_AWLEN,
       FIC_1_AXI4_M_AWSIZE,
       FIC_1_AXI4_M_AWBURST,
       FIC_1_AXI4_M_AWLOCK,
       FIC_1_AXI4_M_AWQOS,
       FIC_1_AXI4_M_AWCACHE,
       FIC_1_AXI4_M_AWPROT,
       FIC_1_AXI4_M_AWVALID,
       FIC_1_AXI4_M_WDATA,
       FIC_1_AXI4_M_WSTRB,
       FIC_1_AXI4_M_WLAST,
       FIC_1_AXI4_M_WVALID,
       FIC_1_AXI4_M_BREADY,
       FIC_1_AXI4_M_ARID,
       FIC_1_AXI4_M_ARADDR,
       FIC_1_AXI4_M_ARLEN,
       FIC_1_AXI4_M_ARSIZE,
       FIC_1_AXI4_M_ARBURST,
       FIC_1_AXI4_M_ARLOCK,
       FIC_1_AXI4_M_ARQOS,
       FIC_1_AXI4_M_ARCACHE,
       FIC_1_AXI4_M_ARPROT,
       FIC_1_AXI4_M_ARVALID,
       FIC_1_AXI4_M_RREADY,
       FIC_1_AXI4_S_AWREADY,
       FIC_1_AXI4_S_WREADY,
       FIC_1_AXI4_S_BID,
       FIC_1_AXI4_S_BRESP,
       FIC_1_AXI4_S_BVALID,
       FIC_1_AXI4_S_ARREADY,
       FIC_1_AXI4_S_RID,
       FIC_1_AXI4_S_RDATA,
       FIC_1_AXI4_S_RRESP,
       FIC_1_AXI4_S_RLAST,
       FIC_1_AXI4_S_RVALID,
       FIC_2_AXI4_S_AWREADY,
       FIC_2_AXI4_S_WREADY,
       FIC_2_AXI4_S_BID,
       FIC_2_AXI4_S_BRESP,
       FIC_2_AXI4_S_BVALID,
       FIC_2_AXI4_S_ARREADY,
       FIC_2_AXI4_S_RID,
       FIC_2_AXI4_S_RDATA,
       FIC_2_AXI4_S_RRESP,
       FIC_2_AXI4_S_RLAST,
       FIC_2_AXI4_S_RVALID,
       FIC_3_APB_M_PSEL,
       FIC_3_APB_M_PADDR,
       FIC_3_APB_M_PWRITE,
       FIC_3_APB_M_PENABLE,
       FIC_3_APB_M_PSTRB,
       FIC_3_APB_M_PWDATA,
       MMUART_0_DTR_M2F,
       MMUART_0_RTS_M2F,
       MMUART_0_TXD_M2F,
       MMUART_0_TXD_OE_M2F,
       MMUART_1_DTR_M2F,
       MMUART_1_RTS_M2F,
       MMUART_1_TXD_M2F,
       MMUART_1_TXD_OE_M2F,
       MMUART_0_OUT1N_M2F,
       MMUART_0_OUT2N_M2F,
       MMUART_0_TE_M2F,
       MMUART_0_ESWM_M2F,
       MMUART_0_CLK_M2F,
       MMUART_0_CLK_OE_M2F,
       MMUART_1_OUT1N_M2F,
       MMUART_1_OUT2N_M2F,
       MMUART_1_TE_M2F,
       MMUART_1_ESWM_M2F,
       MMUART_1_CLK_M2F,
       MMUART_1_CLK_OE_M2F,
       MMUART_2_TXD_M2F,
       MMUART_3_TXD_M2F,
       MMUART_4_TXD_M2F,
       CAN_0_TX_EBL_M2F,
       CAN_0_TXBUS_M2F,
       CAN_1_TX_EBL_M2F,
       CAN_1_TXBUS_M2F,
       QSPI_SEL_M2F,
       QSPI_SEL_OE_M2F,
       QSPI_CLK_M2F,
       QSPI_CLK_OE_M2F,
       QSPI_DATA_M2F,
       QSPI_DATA_OE_M2F,
       SPI_0_SS1_M2F,
       SPI_0_SS1_OE_M2F,
       SPI_1_SS1_M2F,
       SPI_1_SS1_OE_M2F,
       SPI_0_DO_M2F,
       SPI_0_DO_OE_M2F,
       SPI_0_CLK_M2F,
       SPI_0_CLK_OE_M2F,
       SPI_1_DO_M2F,
       SPI_1_DO_OE_M2F,
       SPI_1_CLK_M2F,
       SPI_1_CLK_OE_M2F,
       I2C_0_SCL_OE_M2F,
       I2C_0_SDA_OE_M2F,
       I2C_1_SCL_OE_M2F,
       I2C_1_SDA_OE_M2F,
       I2C_0_SMBALERT_NO_M2F,
       I2C_0_SMBSUS_NO_M2F,
       I2C_1_SMBALERT_NO_M2F,
       I2C_1_SMBSUS_NO_M2F,
       GPIO_2_M2F,
       GPIO_2_OE_M2F,
       MAC_0_MDO_M2F,
       MAC_0_MDO_OE_M2F,
       MAC_0_MDC_M2F,
       MAC_1_MDO_M2F,
       MAC_1_MDO_OE_M2F,
       MAC_1_MDC_M2F,
       JTAG_TDO_M2F,
       JTAG_TDO_OE_M2F,
       MSS_INT_M2F,
       SPARE_M2F,
       PLL_CPU_LOCK_M2F,
       PLL_DDR_LOCK_M2F,
       PLL_SGMII_LOCK_M2F,
       MSS_STATUS_M2F,
       BOOT_FAIL_ERROR_M2F,
       MSS_RESET_N_M2F,
       SPARE_2_M2F,
       SPARE_3_M2F,
       SPARE_4_M2F,
       SPARE_5_M2F,
       WDOG_0_INTERRUPT_M2F,
       WDOG_1_INTERRUPT_M2F,
       WDOG_2_INTERRUPT_M2F,
       WDOG_3_INTERRUPT_M2F,
       WDOG_4_INTERRUPT_M2F,
       MPU_VIOLATION_FROM_FIC_0_M2F,
       MPU_VIOLATION_FROM_FIC_1_M2F,
       MPU_VIOLATION_FROM_FIC_2_M2F,
       MPU_VIOLATION_FROM_CRYPTO_M2F,
       MPU_VIOLATION_FROM_MAC_0_M2F,
       MPU_VIOLATION_FROM_MAC_1_M2F,
       MPU_VIOLATION_FROM_USB_M2F,
       MPU_VIOLATION_FROM_EMMC_SD_M2F,
       MPU_VIOLATION_FROM_SCB_M2F,
       MPU_VIOLATION_FROM_TRACE_M2F,
       REBOOT_REQUESTED_M2F,
       CPU_IN_RESET_M2F,
       AXI_IN_RESET_M2F,
       SCB_PERIPH_RESET_OCCURRED_M2F,
       SCB_MSS_RESET_OCCURRED_M2F,
       SCB_CPU_RESET_OCCURRED_M2F,
       DEBUGGER_RESET_OCCURRED_M2F,
       FABRIC_RESET_OCCURRED_M2F,
       WDOG_RESET_OCCURRED_M2F,
       GPIO_RESET_OCCURRED_M2F,
       SCB_BUS_RESET_OCCURRED_M2F,
       CPU_SOFT_RESET_OCCURRED_M2F,
       CPU_CLK_DIVIDER_M2F,
       AXI_CLK_DIVIDER_M2F,
       AHB_APB_CLK_DIVIDER_M2F,
       USOC_CONTROL_DATA_M2F,
       MAC_0_GMII_MII_TXD_M2F,
       MAC_0_GMII_MII_TX_EN_M2F,
       MAC_0_GMII_MII_TX_ER_M2F,
       MAC_0_LOCAL_LOOPBACK_M2F,
       MAC_0_LOOPBACK_M2F,
       MAC_0_HALF_DUPLEX_M2F,
       MAC_0_SPEED_MODE_M2F,
       MAC_1_GMII_MII_TXD_M2F,
       MAC_1_GMII_MII_TX_EN_M2F,
       MAC_1_GMII_MII_TX_ER_M2F,
       MAC_1_LOCAL_LOOPBACK_M2F,
       MAC_1_LOOPBACK_M2F,
       MAC_1_HALF_DUPLEX_M2F,
       MAC_1_SPEED_MODE_M2F,
       MAC_0_FILTER_DATA_M2F,
       MAC_0_FILTER_SA_STB_M2F,
       MAC_0_FILTER_DA_STB_M2F,
       MAC_0_FILTER_TYPE_STB_M2F,
       MAC_0_FILTER_VLAN_TAG1_STB_M2F,
       MAC_0_FILTER_VLAN_TAG2_STB_M2F,
       MAC_0_FILTER_IP_SA_STB_M2F,
       MAC_0_FILTER_IP_DA_STB_M2F,
       MAC_0_FILTER_SP_STB_M2F,
       MAC_0_FILTER_DP_STB_M2F,
       MAC_0_FILTER_IPV6_M2F,
       MAC_0_WOL_M2F,
       MAC_1_FILTER_DATA_M2F,
       MAC_1_FILTER_SA_STB_M2F,
       MAC_1_FILTER_DA_STB_M2F,
       MAC_1_FILTER_TYPE_STB_M2F,
       MAC_1_FILTER_VLAN_TAG1_STB_M2F,
       MAC_1_FILTER_VLAN_TAG2_STB_M2F,
       MAC_1_FILTER_IP_SA_STB_M2F,
       MAC_1_FILTER_IP_DA_STB_M2F,
       MAC_1_FILTER_SP_STB_M2F,
       MAC_1_FILTER_DP_STB_M2F,
       MAC_1_FILTER_IPV6_M2F,
       MAC_1_WOL_M2F,
       MAC_0_TSU_SOF_TX_M2F,
       MAC_0_TSU_SYNC_FRAME_TX_M2F,
       MAC_0_TSU_DELAY_REQ_TX_M2F,
       MAC_0_TSU_PDELAY_REQ_TX_M2F,
       MAC_0_TSU_PDELAY_RESP_TX_M2F,
       MAC_0_TSU_SOF_RX_M2F,
       MAC_0_TSU_SYNC_FRAME_RX_M2F,
       MAC_0_TSU_DELAY_REQ_RX_M2F,
       MAC_0_TSU_PDELAY_REQ_RX_M2F,
       MAC_0_TSU_PDELAY_RESP_RX_M2F,
       MAC_0_TSU_TIMER_CNT_M2F,
       MAC_0_TSU_TIMER_CMP_VAL_M2F,
       MAC_1_TSU_SOF_TX_M2F,
       MAC_1_TSU_SYNC_FRAME_TX_M2F,
       MAC_1_TSU_DELAY_REQ_TX_M2F,
       MAC_1_TSU_PDELAY_REQ_TX_M2F,
       MAC_1_TSU_PDELAY_RESP_TX_M2F,
       MAC_1_TSU_SOF_RX_M2F,
       MAC_1_TSU_SYNC_FRAME_RX_M2F,
       MAC_1_TSU_DELAY_REQ_RX_M2F,
       MAC_1_TSU_PDELAY_REQ_RX_M2F,
       MAC_1_TSU_PDELAY_RESP_RX_M2F,
       MAC_1_TSU_TIMER_CNT_M2F,
       MAC_1_TSU_TIMER_CMP_VAL_M2F,
       CRYPTO_DLL_LOCK_M2F,
       CRYPTO_AHB_M_HADDR,
       CRYPTO_AHB_M_HWDATA,
       CRYPTO_AHB_M_HSIZE,
       CRYPTO_AHB_M_HTRANS,
       CRYPTO_AHB_M_HWRITE,
       CRYPTO_AHB_M_HMASTLOCK,
       CRYPTO_AHB_S_HREADYOUT,
       CRYPTO_AHB_S_HRESP,
       CRYPTO_AHB_S_HRDATA,
       CRYPTO_BUSY_M2F,
       CRYPTO_COMPLETE_M2F,
       CRYPTO_ALARM_M2F,
       CRYPTO_BUSERROR_M2F,
       CRYPTO_MSS_REQUEST_M2F,
       CRYPTO_MSS_RELEASE_M2F,
       CRYPTO_OWNER_M2F,
       CRYPTO_MSS_OWNER_M2F,
       CRYPTO_XWADDR_M2F,
       CRYPTO_XINACCEPT_M2F,
       CRYPTO_XRDATA_M2F,
       CRYPTO_XRADDR_M2F,
       CRYPTO_XVALIDOUT_M2F,
       CRYPTO_MESH_ERROR_M2F,
       MSSIO37_IN,
       MSSIO37_OUT,
       MSSIO37_OE,
       MSSIO36_IN,
       MSSIO36_OUT,
       MSSIO36_OE,
       MSSIO35_IN,
       MSSIO35_OUT,
       MSSIO35_OE,
       MSSIO34_IN,
       MSSIO34_OUT,
       MSSIO34_OE,
       MSSIO33_IN,
       MSSIO33_OUT,
       MSSIO33_OE,
       MSSIO32_IN,
       MSSIO32_OUT,
       MSSIO32_OE,
       MSSIO31_IN,
       MSSIO31_OUT,
       MSSIO31_OE,
       MSSIO30_IN,
       MSSIO30_OUT,
       MSSIO30_OE,
       MSSIO29_IN,
       MSSIO29_OUT,
       MSSIO29_OE,
       MSSIO28_IN,
       MSSIO28_OUT,
       MSSIO28_OE,
       MSSIO27_IN,
       MSSIO27_OUT,
       MSSIO27_OE,
       MSSIO26_IN,
       MSSIO26_OUT,
       MSSIO26_OE,
       MSSIO25_IN,
       MSSIO25_OUT,
       MSSIO25_OE,
       MSSIO24_IN,
       MSSIO24_OUT,
       MSSIO24_OE,
       MSSIO23_IN,
       MSSIO23_OUT,
       MSSIO23_OE,
       MSSIO22_IN,
       MSSIO22_OUT,
       MSSIO22_OE,
       MSSIO21_IN,
       MSSIO21_OUT,
       MSSIO21_OE,
       MSSIO20_IN,
       MSSIO20_OUT,
       MSSIO20_OE,
       MSSIO19_IN,
       MSSIO19_OUT,
       MSSIO19_OE,
       MSSIO18_IN,
       MSSIO18_OUT,
       MSSIO18_OE,
       MSSIO17_IN,
       MSSIO17_OUT,
       MSSIO17_OE,
       MSSIO16_IN,
       MSSIO16_OUT,
       MSSIO16_OE,
       MSSIO15_IN,
       MSSIO15_OUT,
       MSSIO15_OE,
       MSSIO14_IN,
       MSSIO14_OUT,
       MSSIO14_OE,
       MSSIO13_IN,
       MSSIO13_OUT,
       MSSIO13_OE,
       MSSIO12_IN,
       MSSIO12_OUT,
       MSSIO12_OE,
       MSSIO11_IN,
       MSSIO11_OUT,
       MSSIO11_OE,
       MSSIO10_IN,
       MSSIO10_OUT,
       MSSIO10_OE,
       MSSIO9_IN,
       MSSIO9_OUT,
       MSSIO9_OE,
       MSSIO8_IN,
       MSSIO8_OUT,
       MSSIO8_OE,
       MSSIO7_IN,
       MSSIO7_OUT,
       MSSIO7_OE,
       MSSIO6_IN,
       MSSIO6_OUT,
       MSSIO6_OE,
       MSSIO5_IN,
       MSSIO5_OUT,
       MSSIO5_OE,
       MSSIO4_IN,
       MSSIO4_OUT,
       MSSIO4_OE,
       MSSIO3_IN,
       MSSIO3_OUT,
       MSSIO3_OE,
       MSSIO2_IN,
       MSSIO2_OUT,
       MSSIO2_OE,
       MSSIO1_IN,
       MSSIO1_OUT,
       MSSIO1_OE,
       MSSIO0_IN,
       MSSIO0_OUT,
       MSSIO0_OE,
       REFCLK,
       SGMII_RX1,
       SGMII_RX0,
       SGMII_TX1,
       SGMII_TX0,
       DDR_DQS4_IN,
       DDR_DQS4_OUT,
       DDR_DQS4_OE,
       DDR_DQS3_IN,
       DDR_DQS3_OUT,
       DDR_DQS3_OE,
       DDR_DQS2_IN,
       DDR_DQS2_OUT,
       DDR_DQS2_OE,
       DDR_DQS1_IN,
       DDR_DQS1_OUT,
       DDR_DQS1_OE,
       DDR_DQS0_IN,
       DDR_DQS0_OUT,
       DDR_DQS0_OE,
       DDR_CK1,
       DDR_CK0,
       DDR3_WE_N,
       DDR_PARITY,
       DDR_RAM_RST_N,
       DDR_ALERT_N,
       DDR_ACT_N,
       DDR_A16,
       DDR_A15,
       DDR_A14,
       DDR_A13,
       DDR_A12,
       DDR_A11,
       DDR_A10,
       DDR_A9,
       DDR_A8,
       DDR_A7,
       DDR_A6,
       DDR_A5,
       DDR_A4,
       DDR_A3,
       DDR_A2,
       DDR_A1,
       DDR_A0,
       DDR_BA1,
       DDR_BA0,
       DDR_BG1,
       DDR_BG0,
       DDR_CKE1,
       DDR_CKE0,
       DDR_CS1,
       DDR_CS0,
       DDR_ODT1,
       DDR_ODT0,
       DDR_DQ35_IN,
       DDR_DQ35_OUT,
       DDR_DQ35_OE,
       DDR_DQ34_IN,
       DDR_DQ34_OUT,
       DDR_DQ34_OE,
       DDR_DQ33_IN,
       DDR_DQ33_OUT,
       DDR_DQ33_OE,
       DDR_DQ32_IN,
       DDR_DQ32_OUT,
       DDR_DQ32_OE,
       DDR_DQ31_IN,
       DDR_DQ31_OUT,
       DDR_DQ31_OE,
       DDR_DQ30_IN,
       DDR_DQ30_OUT,
       DDR_DQ30_OE,
       DDR_DQ29_IN,
       DDR_DQ29_OUT,
       DDR_DQ29_OE,
       DDR_DQ28_IN,
       DDR_DQ28_OUT,
       DDR_DQ28_OE,
       DDR_DQ27_IN,
       DDR_DQ27_OUT,
       DDR_DQ27_OE,
       DDR_DQ26_IN,
       DDR_DQ26_OUT,
       DDR_DQ26_OE,
       DDR_DQ25_IN,
       DDR_DQ25_OUT,
       DDR_DQ25_OE,
       DDR_DQ24_IN,
       DDR_DQ24_OUT,
       DDR_DQ24_OE,
       DDR_DQ23_IN,
       DDR_DQ23_OUT,
       DDR_DQ23_OE,
       DDR_DQ22_IN,
       DDR_DQ22_OUT,
       DDR_DQ22_OE,
       DDR_DQ21_IN,
       DDR_DQ21_OUT,
       DDR_DQ21_OE,
       DDR_DQ20_IN,
       DDR_DQ20_OUT,
       DDR_DQ20_OE,
       DDR_DQ19_IN,
       DDR_DQ19_OUT,
       DDR_DQ19_OE,
       DDR_DQ18_IN,
       DDR_DQ18_OUT,
       DDR_DQ18_OE,
       DDR_DQ17_IN,
       DDR_DQ17_OUT,
       DDR_DQ17_OE,
       DDR_DQ16_IN,
       DDR_DQ16_OUT,
       DDR_DQ16_OE,
       DDR_DQ15_IN,
       DDR_DQ15_OUT,
       DDR_DQ15_OE,
       DDR_DQ14_IN,
       DDR_DQ14_OUT,
       DDR_DQ14_OE,
       DDR_DQ13_IN,
       DDR_DQ13_OUT,
       DDR_DQ13_OE,
       DDR_DQ12_IN,
       DDR_DQ12_OUT,
       DDR_DQ12_OE,
       DDR_DQ11_IN,
       DDR_DQ11_OUT,
       DDR_DQ11_OE,
       DDR_DQ10_IN,
       DDR_DQ10_OUT,
       DDR_DQ10_OE,
       DDR_DQ9_IN,
       DDR_DQ9_OUT,
       DDR_DQ9_OE,
       DDR_DQ8_IN,
       DDR_DQ8_OUT,
       DDR_DQ8_OE,
       DDR_DQ7_IN,
       DDR_DQ7_OUT,
       DDR_DQ7_OE,
       DDR_DQ6_IN,
       DDR_DQ6_OUT,
       DDR_DQ6_OE,
       DDR_DQ5_IN,
       DDR_DQ5_OUT,
       DDR_DQ5_OE,
       DDR_DQ4_IN,
       DDR_DQ4_OUT,
       DDR_DQ4_OE,
       DDR_DQ3_IN,
       DDR_DQ3_OUT,
       DDR_DQ3_OE,
       DDR_DQ2_IN,
       DDR_DQ2_OUT,
       DDR_DQ2_OE,
       DDR_DQ1_IN,
       DDR_DQ1_OUT,
       DDR_DQ1_OE,
       DDR_DQ0_IN,
       DDR_DQ0_OUT,
       DDR_DQ0_OE,
       DDR_DM0_IN,
       DDR_DM0_OUT,
       DDR_DM0_OE,
       DDR_DM1_IN,
       DDR_DM1_OUT,
       DDR_DM1_OE,
       DDR_DM2_IN,
       DDR_DM2_OUT,
       DDR_DM2_OE,
       DDR_DM3_IN,
       DDR_DM3_OUT,
       DDR_DM3_OE,
       DDR_DM4_IN,
       DDR_DM4_OUT,
       DDR_DM4_OE,
       REFCLK_0_PLL_NW,
       REFCLK_1_PLL_NW
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " CRYPTO_AHB_M_HRDATA[0]->CRYPTO_HCLK = 1.155"
syn_tsu1 = " CRYPTO_AHB_M_HRDATA[10]->CRYPTO_HCLK = 1.129"
syn_tsu2 = " CRYPTO_AHB_M_HRDATA[11]->CRYPTO_HCLK = 1.221"
syn_tsu3 = " CRYPTO_AHB_M_HRDATA[12]->CRYPTO_HCLK = 1.163"
syn_tsu4 = " CRYPTO_AHB_M_HRDATA[13]->CRYPTO_HCLK = 1.125"
syn_tsu5 = " CRYPTO_AHB_M_HRDATA[14]->CRYPTO_HCLK = 1.222"
syn_tsu6 = " CRYPTO_AHB_M_HRDATA[15]->CRYPTO_HCLK = 1.226"
syn_tsu7 = " CRYPTO_AHB_M_HRDATA[16]->CRYPTO_HCLK = 1.243"
syn_tsu8 = " CRYPTO_AHB_M_HRDATA[17]->CRYPTO_HCLK = 1.207"
syn_tsu9 = " CRYPTO_AHB_M_HRDATA[18]->CRYPTO_HCLK = 1.11"
syn_tsu10 = " CRYPTO_AHB_M_HRDATA[19]->CRYPTO_HCLK = 1.147"
syn_tsu11 = " CRYPTO_AHB_M_HRDATA[1]->CRYPTO_HCLK = 1.088"
syn_tsu12 = " CRYPTO_AHB_M_HRDATA[20]->CRYPTO_HCLK = 1.135"
syn_tsu13 = " CRYPTO_AHB_M_HRDATA[21]->CRYPTO_HCLK = 1.121"
syn_tsu14 = " CRYPTO_AHB_M_HRDATA[22]->CRYPTO_HCLK = 1.107"
syn_tsu15 = " CRYPTO_AHB_M_HRDATA[23]->CRYPTO_HCLK = 1.124"
syn_tsu16 = " CRYPTO_AHB_M_HRDATA[24]->CRYPTO_HCLK = 1.138"
syn_tsu17 = " CRYPTO_AHB_M_HRDATA[25]->CRYPTO_HCLK = 1.086"
syn_tsu18 = " CRYPTO_AHB_M_HRDATA[26]->CRYPTO_HCLK = 1.035"
syn_tsu19 = " CRYPTO_AHB_M_HRDATA[27]->CRYPTO_HCLK = 1.119"
syn_tsu20 = " CRYPTO_AHB_M_HRDATA[28]->CRYPTO_HCLK = 1.176"
syn_tsu21 = " CRYPTO_AHB_M_HRDATA[29]->CRYPTO_HCLK = 1.089"
syn_tsu22 = " CRYPTO_AHB_M_HRDATA[2]->CRYPTO_HCLK = 1.122"
syn_tsu23 = " CRYPTO_AHB_M_HRDATA[30]->CRYPTO_HCLK = 1.142"
syn_tsu24 = " CRYPTO_AHB_M_HRDATA[31]->CRYPTO_HCLK = 1.135"
syn_tsu25 = " CRYPTO_AHB_M_HRDATA[3]->CRYPTO_HCLK = 1.147"
syn_tsu26 = " CRYPTO_AHB_M_HRDATA[4]->CRYPTO_HCLK = 1.105"
syn_tsu27 = " CRYPTO_AHB_M_HRDATA[5]->CRYPTO_HCLK = 1.125"
syn_tsu28 = " CRYPTO_AHB_M_HRDATA[6]->CRYPTO_HCLK = 1.214"
syn_tsu29 = " CRYPTO_AHB_M_HRDATA[7]->CRYPTO_HCLK = 1.171"
syn_tsu30 = " CRYPTO_AHB_M_HRDATA[8]->CRYPTO_HCLK = 1.189"
syn_tsu31 = " CRYPTO_AHB_M_HRDATA[9]->CRYPTO_HCLK = 1.12"
syn_tsu32 = " CRYPTO_AHB_M_HREADY->CRYPTO_HCLK = 1.392"
syn_tsu33 = " CRYPTO_AHB_M_HRESP->CRYPTO_HCLK = 1.191"
syn_tsu34 = " CRYPTO_AHB_S_HADDR[10]->CRYPTO_HCLK = 1.218"
syn_tsu35 = " CRYPTO_AHB_S_HADDR[11]->CRYPTO_HCLK = 1.15"
syn_tsu36 = " CRYPTO_AHB_S_HADDR[12]->CRYPTO_HCLK = 1.165"
syn_tsu37 = " CRYPTO_AHB_S_HADDR[13]->CRYPTO_HCLK = 1.147"
syn_tsu38 = " CRYPTO_AHB_S_HADDR[14]->CRYPTO_HCLK = 1.175"
syn_tsu39 = " CRYPTO_AHB_S_HADDR[15]->CRYPTO_HCLK = 1.171"
syn_tsu40 = " CRYPTO_AHB_S_HADDR[16]->CRYPTO_HCLK = 1.303"
syn_tsu41 = " CRYPTO_AHB_S_HADDR[2]->CRYPTO_HCLK = 1.152"
syn_tsu42 = " CRYPTO_AHB_S_HADDR[3]->CRYPTO_HCLK = 1.105"
syn_tsu43 = " CRYPTO_AHB_S_HADDR[4]->CRYPTO_HCLK = 1.204"
syn_tsu44 = " CRYPTO_AHB_S_HADDR[5]->CRYPTO_HCLK = 1.137"
syn_tsu45 = " CRYPTO_AHB_S_HADDR[6]->CRYPTO_HCLK = 1.214"
syn_tsu46 = " CRYPTO_AHB_S_HADDR[7]->CRYPTO_HCLK = 1.117"
syn_tsu47 = " CRYPTO_AHB_S_HADDR[8]->CRYPTO_HCLK = 1.123"
syn_tsu48 = " CRYPTO_AHB_S_HADDR[9]->CRYPTO_HCLK = 1.143"
syn_tsu49 = " CRYPTO_AHB_S_HREADY->CRYPTO_HCLK = 1.298"
syn_tsu50 = " CRYPTO_AHB_S_HSEL->CRYPTO_HCLK = 1.288"
syn_tsu51 = " CRYPTO_AHB_S_HTRANS[1]->CRYPTO_HCLK = 1.283"
syn_tsu52 = " CRYPTO_AHB_S_HWDATA[0]->CRYPTO_HCLK = 1.049"
syn_tsu53 = " CRYPTO_AHB_S_HWDATA[10]->CRYPTO_HCLK = 1"
syn_tsu54 = " CRYPTO_AHB_S_HWDATA[11]->CRYPTO_HCLK = 1.2"
syn_tsu55 = " CRYPTO_AHB_S_HWDATA[12]->CRYPTO_HCLK = 1.062"
syn_tsu56 = " CRYPTO_AHB_S_HWDATA[13]->CRYPTO_HCLK = 1.134"
syn_tsu57 = " CRYPTO_AHB_S_HWDATA[14]->CRYPTO_HCLK = 1.295"
syn_tsu58 = " CRYPTO_AHB_S_HWDATA[15]->CRYPTO_HCLK = 1.056"
syn_tsu59 = " CRYPTO_AHB_S_HWDATA[16]->CRYPTO_HCLK = 1.087"
syn_tsu60 = " CRYPTO_AHB_S_HWDATA[17]->CRYPTO_HCLK = 1.128"
syn_tsu61 = " CRYPTO_AHB_S_HWDATA[18]->CRYPTO_HCLK = 1.073"
syn_tsu62 = " CRYPTO_AHB_S_HWDATA[19]->CRYPTO_HCLK = 1.096"
syn_tsu63 = " CRYPTO_AHB_S_HWDATA[1]->CRYPTO_HCLK = 1.007"
syn_tsu64 = " CRYPTO_AHB_S_HWDATA[20]->CRYPTO_HCLK = 1.171"
syn_tsu65 = " CRYPTO_AHB_S_HWDATA[21]->CRYPTO_HCLK = 1.028"
syn_tsu66 = " CRYPTO_AHB_S_HWDATA[22]->CRYPTO_HCLK = 1.254"
syn_tsu67 = " CRYPTO_AHB_S_HWDATA[23]->CRYPTO_HCLK = 1.075"
syn_tsu68 = " CRYPTO_AHB_S_HWDATA[24]->CRYPTO_HCLK = 1.051"
syn_tsu69 = " CRYPTO_AHB_S_HWDATA[25]->CRYPTO_HCLK = 1.063"
syn_tsu70 = " CRYPTO_AHB_S_HWDATA[26]->CRYPTO_HCLK = 1.056"
syn_tsu71 = " CRYPTO_AHB_S_HWDATA[27]->CRYPTO_HCLK = 1.095"
syn_tsu72 = " CRYPTO_AHB_S_HWDATA[28]->CRYPTO_HCLK = 1.12"
syn_tsu73 = " CRYPTO_AHB_S_HWDATA[29]->CRYPTO_HCLK = 1.302"
syn_tsu74 = " CRYPTO_AHB_S_HWDATA[2]->CRYPTO_HCLK = 1.076"
syn_tsu75 = " CRYPTO_AHB_S_HWDATA[30]->CRYPTO_HCLK = 1.132"
syn_tsu76 = " CRYPTO_AHB_S_HWDATA[31]->CRYPTO_HCLK = 1.089"
syn_tsu77 = " CRYPTO_AHB_S_HWDATA[3]->CRYPTO_HCLK = 1.035"
syn_tsu78 = " CRYPTO_AHB_S_HWDATA[4]->CRYPTO_HCLK = 1.09"
syn_tsu79 = " CRYPTO_AHB_S_HWDATA[5]->CRYPTO_HCLK = 1.273"
syn_tsu80 = " CRYPTO_AHB_S_HWDATA[6]->CRYPTO_HCLK = 1.069"
syn_tsu81 = " CRYPTO_AHB_S_HWDATA[7]->CRYPTO_HCLK = 1.055"
syn_tsu82 = " CRYPTO_AHB_S_HWDATA[8]->CRYPTO_HCLK = 1.077"
syn_tsu83 = " CRYPTO_AHB_S_HWDATA[9]->CRYPTO_HCLK = 1.06"
syn_tsu84 = " CRYPTO_AHB_S_HWRITE->CRYPTO_HCLK = 1.357"
syn_tsu85 = " CRYPTO_STALL_F2M->CRYPTO_HCLK = 1.238"
syn_tsu86 = " CRYPTO_XENABLE_F2M->CRYPTO_HCLK = 1.01"
syn_tsu87 = " CRYPTO_XOUTACK_F2M->CRYPTO_HCLK = 1.152"
syn_tsu88 = " CRYPTO_XWDATA_F2M[0]->CRYPTO_HCLK = 1.172"
syn_tsu89 = " CRYPTO_XWDATA_F2M[10]->CRYPTO_HCLK = 1.249"
syn_tsu90 = " CRYPTO_XWDATA_F2M[11]->CRYPTO_HCLK = 1.167"
syn_tsu91 = " CRYPTO_XWDATA_F2M[12]->CRYPTO_HCLK = 1.193"
syn_tsu92 = " CRYPTO_XWDATA_F2M[13]->CRYPTO_HCLK = 1.202"
syn_tsu93 = " CRYPTO_XWDATA_F2M[14]->CRYPTO_HCLK = 1.195"
syn_tsu94 = " CRYPTO_XWDATA_F2M[15]->CRYPTO_HCLK = 1.186"
syn_tsu95 = " CRYPTO_XWDATA_F2M[16]->CRYPTO_HCLK = 1.255"
syn_tsu96 = " CRYPTO_XWDATA_F2M[17]->CRYPTO_HCLK = 1.192"
syn_tsu97 = " CRYPTO_XWDATA_F2M[18]->CRYPTO_HCLK = 1.193"
syn_tsu98 = " CRYPTO_XWDATA_F2M[19]->CRYPTO_HCLK = 1.125"
syn_tsu99 = " CRYPTO_XWDATA_F2M[1]->CRYPTO_HCLK = 1.195"
syn_tsu100 = " CRYPTO_XWDATA_F2M[20]->CRYPTO_HCLK = 1.175"
syn_tsu101 = " CRYPTO_XWDATA_F2M[21]->CRYPTO_HCLK = 1.131"
syn_tsu102 = " CRYPTO_XWDATA_F2M[22]->CRYPTO_HCLK = 1.199"
syn_tsu103 = " CRYPTO_XWDATA_F2M[23]->CRYPTO_HCLK = 1.16"
syn_tsu104 = " CRYPTO_XWDATA_F2M[24]->CRYPTO_HCLK = 1.196"
syn_tsu105 = " CRYPTO_XWDATA_F2M[25]->CRYPTO_HCLK = 1.148"
syn_tsu106 = " CRYPTO_XWDATA_F2M[26]->CRYPTO_HCLK = 1.114"
syn_tsu107 = " CRYPTO_XWDATA_F2M[27]->CRYPTO_HCLK = 1.093"
syn_tsu108 = " CRYPTO_XWDATA_F2M[28]->CRYPTO_HCLK = 1.064"
syn_tsu109 = " CRYPTO_XWDATA_F2M[29]->CRYPTO_HCLK = 1.263"
syn_tsu110 = " CRYPTO_XWDATA_F2M[2]->CRYPTO_HCLK = 1.214"
syn_tsu111 = " CRYPTO_XWDATA_F2M[30]->CRYPTO_HCLK = 1.284"
syn_tsu112 = " CRYPTO_XWDATA_F2M[31]->CRYPTO_HCLK = 1.073"
syn_tsu113 = " CRYPTO_XWDATA_F2M[3]->CRYPTO_HCLK = 1.182"
syn_tsu114 = " CRYPTO_XWDATA_F2M[4]->CRYPTO_HCLK = 1.221"
syn_tsu115 = " CRYPTO_XWDATA_F2M[5]->CRYPTO_HCLK = 1.186"
syn_tsu116 = " CRYPTO_XWDATA_F2M[6]->CRYPTO_HCLK = 1.128"
syn_tsu117 = " CRYPTO_XWDATA_F2M[7]->CRYPTO_HCLK = 1.119"
syn_tsu118 = " CRYPTO_XWDATA_F2M[8]->CRYPTO_HCLK = 1.147"
syn_tsu119 = " CRYPTO_XWDATA_F2M[9]->CRYPTO_HCLK = 1.137"
syn_tsu120 = " FIC_0_AXI4_M_ARREADY->FIC_0_ACLK = 1.012"
syn_tsu121 = " FIC_0_AXI4_M_AWREADY->FIC_0_ACLK = 0.937"
syn_tsu122 = " FIC_0_AXI4_M_BID[0]->FIC_0_ACLK = 0.839"
syn_tsu123 = " FIC_0_AXI4_M_BID[1]->FIC_0_ACLK = 0.851"
syn_tsu124 = " FIC_0_AXI4_M_BID[2]->FIC_0_ACLK = 0.832"
syn_tsu125 = " FIC_0_AXI4_M_BID[3]->FIC_0_ACLK = 0.87"
syn_tsu126 = " FIC_0_AXI4_M_BID[4]->FIC_0_ACLK = 0.827"
syn_tsu127 = " FIC_0_AXI4_M_BID[5]->FIC_0_ACLK = 0.832"
syn_tsu128 = " FIC_0_AXI4_M_BID[6]->FIC_0_ACLK = 0.817"
syn_tsu129 = " FIC_0_AXI4_M_BID[7]->FIC_0_ACLK = 0.855"
syn_tsu130 = " FIC_0_AXI4_M_BRESP[0]->FIC_0_ACLK = 0.823"
syn_tsu131 = " FIC_0_AXI4_M_BRESP[1]->FIC_0_ACLK = 0.831"
syn_tsu132 = " FIC_0_AXI4_M_BVALID->FIC_0_ACLK = 0.984"
syn_tsu133 = " FIC_0_AXI4_M_RDATA[0]->FIC_0_ACLK = 1.037"
syn_tsu134 = " FIC_0_AXI4_M_RDATA[10]->FIC_0_ACLK = 0.787"
syn_tsu135 = " FIC_0_AXI4_M_RDATA[11]->FIC_0_ACLK = 0.796"
syn_tsu136 = " FIC_0_AXI4_M_RDATA[12]->FIC_0_ACLK = 0.957"
syn_tsu137 = " FIC_0_AXI4_M_RDATA[13]->FIC_0_ACLK = 0.82"
syn_tsu138 = " FIC_0_AXI4_M_RDATA[14]->FIC_0_ACLK = 0.827"
syn_tsu139 = " FIC_0_AXI4_M_RDATA[15]->FIC_0_ACLK = 1.055"
syn_tsu140 = " FIC_0_AXI4_M_RDATA[16]->FIC_0_ACLK = 1.015"
syn_tsu141 = " FIC_0_AXI4_M_RDATA[17]->FIC_0_ACLK = 0.999"
syn_tsu142 = " FIC_0_AXI4_M_RDATA[18]->FIC_0_ACLK = 0.916"
syn_tsu143 = " FIC_0_AXI4_M_RDATA[19]->FIC_0_ACLK = 1.041"
syn_tsu144 = " FIC_0_AXI4_M_RDATA[1]->FIC_0_ACLK = 1.032"
syn_tsu145 = " FIC_0_AXI4_M_RDATA[20]->FIC_0_ACLK = 0.92"
syn_tsu146 = " FIC_0_AXI4_M_RDATA[21]->FIC_0_ACLK = 0.878"
syn_tsu147 = " FIC_0_AXI4_M_RDATA[22]->FIC_0_ACLK = 0.926"
syn_tsu148 = " FIC_0_AXI4_M_RDATA[23]->FIC_0_ACLK = 1.058"
syn_tsu149 = " FIC_0_AXI4_M_RDATA[24]->FIC_0_ACLK = 0.992"
syn_tsu150 = " FIC_0_AXI4_M_RDATA[25]->FIC_0_ACLK = 0.926"
syn_tsu151 = " FIC_0_AXI4_M_RDATA[26]->FIC_0_ACLK = 0.923"
syn_tsu152 = " FIC_0_AXI4_M_RDATA[27]->FIC_0_ACLK = 0.955"
syn_tsu153 = " FIC_0_AXI4_M_RDATA[28]->FIC_0_ACLK = 0.804"
syn_tsu154 = " FIC_0_AXI4_M_RDATA[29]->FIC_0_ACLK = 0.761"
syn_tsu155 = " FIC_0_AXI4_M_RDATA[2]->FIC_0_ACLK = 1.101"
syn_tsu156 = " FIC_0_AXI4_M_RDATA[30]->FIC_0_ACLK = 0.944"
syn_tsu157 = " FIC_0_AXI4_M_RDATA[31]->FIC_0_ACLK = 0.914"
syn_tsu158 = " FIC_0_AXI4_M_RDATA[32]->FIC_0_ACLK = 0.758"
syn_tsu159 = " FIC_0_AXI4_M_RDATA[33]->FIC_0_ACLK = 0.746"
syn_tsu160 = " FIC_0_AXI4_M_RDATA[34]->FIC_0_ACLK = 0.79"
syn_tsu161 = " FIC_0_AXI4_M_RDATA[35]->FIC_0_ACLK = 0.937"
syn_tsu162 = " FIC_0_AXI4_M_RDATA[36]->FIC_0_ACLK = 0.892"
syn_tsu163 = " FIC_0_AXI4_M_RDATA[37]->FIC_0_ACLK = 0.903"
syn_tsu164 = " FIC_0_AXI4_M_RDATA[38]->FIC_0_ACLK = 0.873"
syn_tsu165 = " FIC_0_AXI4_M_RDATA[39]->FIC_0_ACLK = 0.842"
syn_tsu166 = " FIC_0_AXI4_M_RDATA[3]->FIC_0_ACLK = 1.057"
syn_tsu167 = " FIC_0_AXI4_M_RDATA[40]->FIC_0_ACLK = 0.916"
syn_tsu168 = " FIC_0_AXI4_M_RDATA[41]->FIC_0_ACLK = 0.994"
syn_tsu169 = " FIC_0_AXI4_M_RDATA[42]->FIC_0_ACLK = 0.891"
syn_tsu170 = " FIC_0_AXI4_M_RDATA[43]->FIC_0_ACLK = 0.93"
syn_tsu171 = " FIC_0_AXI4_M_RDATA[44]->FIC_0_ACLK = 0.887"
syn_tsu172 = " FIC_0_AXI4_M_RDATA[45]->FIC_0_ACLK = 0.898"
syn_tsu173 = " FIC_0_AXI4_M_RDATA[46]->FIC_0_ACLK = 0.848"
syn_tsu174 = " FIC_0_AXI4_M_RDATA[47]->FIC_0_ACLK = 0.896"
syn_tsu175 = " FIC_0_AXI4_M_RDATA[48]->FIC_0_ACLK = 0.912"
syn_tsu176 = " FIC_0_AXI4_M_RDATA[49]->FIC_0_ACLK = 0.909"
syn_tsu177 = " FIC_0_AXI4_M_RDATA[4]->FIC_0_ACLK = 1.061"
syn_tsu178 = " FIC_0_AXI4_M_RDATA[50]->FIC_0_ACLK = 0.906"
syn_tsu179 = " FIC_0_AXI4_M_RDATA[51]->FIC_0_ACLK = 0.925"
syn_tsu180 = " FIC_0_AXI4_M_RDATA[52]->FIC_0_ACLK = 0.901"
syn_tsu181 = " FIC_0_AXI4_M_RDATA[53]->FIC_0_ACLK = 0.887"
syn_tsu182 = " FIC_0_AXI4_M_RDATA[54]->FIC_0_ACLK = 0.942"
syn_tsu183 = " FIC_0_AXI4_M_RDATA[55]->FIC_0_ACLK = 0.882"
syn_tsu184 = " FIC_0_AXI4_M_RDATA[56]->FIC_0_ACLK = 0.84"
syn_tsu185 = " FIC_0_AXI4_M_RDATA[57]->FIC_0_ACLK = 0.851"
syn_tsu186 = " FIC_0_AXI4_M_RDATA[58]->FIC_0_ACLK = 0.913"
syn_tsu187 = " FIC_0_AXI4_M_RDATA[59]->FIC_0_ACLK = 0.854"
syn_tsu188 = " FIC_0_AXI4_M_RDATA[5]->FIC_0_ACLK = 1.041"
syn_tsu189 = " FIC_0_AXI4_M_RDATA[60]->FIC_0_ACLK = 0.919"
syn_tsu190 = " FIC_0_AXI4_M_RDATA[61]->FIC_0_ACLK = 0.857"
syn_tsu191 = " FIC_0_AXI4_M_RDATA[62]->FIC_0_ACLK = 0.95"
syn_tsu192 = " FIC_0_AXI4_M_RDATA[63]->FIC_0_ACLK = 0.895"
syn_tsu193 = " FIC_0_AXI4_M_RDATA[6]->FIC_0_ACLK = 1.044"
syn_tsu194 = " FIC_0_AXI4_M_RDATA[7]->FIC_0_ACLK = 1.093"
syn_tsu195 = " FIC_0_AXI4_M_RDATA[8]->FIC_0_ACLK = 0.924"
syn_tsu196 = " FIC_0_AXI4_M_RDATA[9]->FIC_0_ACLK = 0.905"
syn_tsu197 = " FIC_0_AXI4_M_RID[0]->FIC_0_ACLK = 1.065"
syn_tsu198 = " FIC_0_AXI4_M_RID[1]->FIC_0_ACLK = 1.031"
syn_tsu199 = " FIC_0_AXI4_M_RID[2]->FIC_0_ACLK = 1.035"
syn_tsu200 = " FIC_0_AXI4_M_RID[3]->FIC_0_ACLK = 1.039"
syn_tsu201 = " FIC_0_AXI4_M_RID[4]->FIC_0_ACLK = 1.105"
syn_tsu202 = " FIC_0_AXI4_M_RID[5]->FIC_0_ACLK = 1.052"
syn_tsu203 = " FIC_0_AXI4_M_RID[6]->FIC_0_ACLK = 1.092"
syn_tsu204 = " FIC_0_AXI4_M_RID[7]->FIC_0_ACLK = 1.015"
syn_tsu205 = " FIC_0_AXI4_M_RLAST->FIC_0_ACLK = 1.022"
syn_tsu206 = " FIC_0_AXI4_M_RRESP[0]->FIC_0_ACLK = 1.057"
syn_tsu207 = " FIC_0_AXI4_M_RRESP[1]->FIC_0_ACLK = 1.064"
syn_tsu208 = " FIC_0_AXI4_M_RVALID->FIC_0_ACLK = 1.086"
syn_tsu209 = " FIC_0_AXI4_M_WREADY->FIC_0_ACLK = 1.069"
syn_tsu210 = " FIC_0_AXI4_S_ARADDR[0]->FIC_0_ACLK = 0.827"
syn_tsu211 = " FIC_0_AXI4_S_ARADDR[10]->FIC_0_ACLK = 0.758"
syn_tsu212 = " FIC_0_AXI4_S_ARADDR[11]->FIC_0_ACLK = 0.769"
syn_tsu213 = " FIC_0_AXI4_S_ARADDR[12]->FIC_0_ACLK = 0.81"
syn_tsu214 = " FIC_0_AXI4_S_ARADDR[13]->FIC_0_ACLK = 1.033"
syn_tsu215 = " FIC_0_AXI4_S_ARADDR[14]->FIC_0_ACLK = 1.037"
syn_tsu216 = " FIC_0_AXI4_S_ARADDR[15]->FIC_0_ACLK = 0.925"
syn_tsu217 = " FIC_0_AXI4_S_ARADDR[16]->FIC_0_ACLK = 0.929"
syn_tsu218 = " FIC_0_AXI4_S_ARADDR[17]->FIC_0_ACLK = 0.835"
syn_tsu219 = " FIC_0_AXI4_S_ARADDR[18]->FIC_0_ACLK = 0.88"
syn_tsu220 = " FIC_0_AXI4_S_ARADDR[19]->FIC_0_ACLK = 1.003"
syn_tsu221 = " FIC_0_AXI4_S_ARADDR[1]->FIC_0_ACLK = 0.736"
syn_tsu222 = " FIC_0_AXI4_S_ARADDR[20]->FIC_0_ACLK = 1.015"
syn_tsu223 = " FIC_0_AXI4_S_ARADDR[21]->FIC_0_ACLK = 0.83"
syn_tsu224 = " FIC_0_AXI4_S_ARADDR[22]->FIC_0_ACLK = 0.975"
syn_tsu225 = " FIC_0_AXI4_S_ARADDR[23]->FIC_0_ACLK = 1.019"
syn_tsu226 = " FIC_0_AXI4_S_ARADDR[24]->FIC_0_ACLK = 0.979"
syn_tsu227 = " FIC_0_AXI4_S_ARADDR[25]->FIC_0_ACLK = 1.025"
syn_tsu228 = " FIC_0_AXI4_S_ARADDR[26]->FIC_0_ACLK = 1.029"
syn_tsu229 = " FIC_0_AXI4_S_ARADDR[27]->FIC_0_ACLK = 0.91"
syn_tsu230 = " FIC_0_AXI4_S_ARADDR[28]->FIC_0_ACLK = 0.938"
syn_tsu231 = " FIC_0_AXI4_S_ARADDR[29]->FIC_0_ACLK = 0.906"
syn_tsu232 = " FIC_0_AXI4_S_ARADDR[2]->FIC_0_ACLK = 0.755"
syn_tsu233 = " FIC_0_AXI4_S_ARADDR[30]->FIC_0_ACLK = 1.042"
syn_tsu234 = " FIC_0_AXI4_S_ARADDR[31]->FIC_0_ACLK = 0.999"
syn_tsu235 = " FIC_0_AXI4_S_ARADDR[32]->FIC_0_ACLK = 1.005"
syn_tsu236 = " FIC_0_AXI4_S_ARADDR[33]->FIC_0_ACLK = 0.775"
syn_tsu237 = " FIC_0_AXI4_S_ARADDR[34]->FIC_0_ACLK = 0.91"
syn_tsu238 = " FIC_0_AXI4_S_ARADDR[35]->FIC_0_ACLK = 0.941"
syn_tsu239 = " FIC_0_AXI4_S_ARADDR[36]->FIC_0_ACLK = 0.802"
syn_tsu240 = " FIC_0_AXI4_S_ARADDR[37]->FIC_0_ACLK = 0.821"
syn_tsu241 = " FIC_0_AXI4_S_ARADDR[3]->FIC_0_ACLK = 0.781"
syn_tsu242 = " FIC_0_AXI4_S_ARADDR[4]->FIC_0_ACLK = 0.792"
syn_tsu243 = " FIC_0_AXI4_S_ARADDR[5]->FIC_0_ACLK = 0.776"
syn_tsu244 = " FIC_0_AXI4_S_ARADDR[6]->FIC_0_ACLK = 0.772"
syn_tsu245 = " FIC_0_AXI4_S_ARADDR[7]->FIC_0_ACLK = 0.777"
syn_tsu246 = " FIC_0_AXI4_S_ARADDR[8]->FIC_0_ACLK = 0.782"
syn_tsu247 = " FIC_0_AXI4_S_ARADDR[9]->FIC_0_ACLK = 0.938"
syn_tsu248 = " FIC_0_AXI4_S_ARBURST[0]->FIC_0_ACLK = 0.891"
syn_tsu249 = " FIC_0_AXI4_S_ARBURST[1]->FIC_0_ACLK = 0.795"
syn_tsu250 = " FIC_0_AXI4_S_ARCACHE[0]->FIC_0_ACLK = 0.797"
syn_tsu251 = " FIC_0_AXI4_S_ARCACHE[1]->FIC_0_ACLK = 0.801"
syn_tsu252 = " FIC_0_AXI4_S_ARCACHE[2]->FIC_0_ACLK = 0.92"
syn_tsu253 = " FIC_0_AXI4_S_ARCACHE[3]->FIC_0_ACLK = 0.876"
syn_tsu254 = " FIC_0_AXI4_S_ARID[0]->FIC_0_ACLK = 0.771"
syn_tsu255 = " FIC_0_AXI4_S_ARID[1]->FIC_0_ACLK = 0.776"
syn_tsu256 = " FIC_0_AXI4_S_ARID[2]->FIC_0_ACLK = 0.864"
syn_tsu257 = " FIC_0_AXI4_S_ARID[3]->FIC_0_ACLK = 0.9"
syn_tsu258 = " FIC_0_AXI4_S_ARLEN[0]->FIC_0_ACLK = 0.764"
syn_tsu259 = " FIC_0_AXI4_S_ARLEN[1]->FIC_0_ACLK = 0.782"
syn_tsu260 = " FIC_0_AXI4_S_ARLEN[2]->FIC_0_ACLK = 0.755"
syn_tsu261 = " FIC_0_AXI4_S_ARLEN[3]->FIC_0_ACLK = 0.746"
syn_tsu262 = " FIC_0_AXI4_S_ARLEN[4]->FIC_0_ACLK = 0.732"
syn_tsu263 = " FIC_0_AXI4_S_ARLEN[5]->FIC_0_ACLK = 0.817"
syn_tsu264 = " FIC_0_AXI4_S_ARLEN[6]->FIC_0_ACLK = 0.787"
syn_tsu265 = " FIC_0_AXI4_S_ARLEN[7]->FIC_0_ACLK = 0.734"
syn_tsu266 = " FIC_0_AXI4_S_ARLOCK->FIC_0_ACLK = 0.787"
syn_tsu267 = " FIC_0_AXI4_S_ARPROT[0]->FIC_0_ACLK = 0.728"
syn_tsu268 = " FIC_0_AXI4_S_ARPROT[1]->FIC_0_ACLK = 0.768"
syn_tsu269 = " FIC_0_AXI4_S_ARPROT[2]->FIC_0_ACLK = 0.716"
syn_tsu270 = " FIC_0_AXI4_S_ARQOS[0]->FIC_0_ACLK = 0.756"
syn_tsu271 = " FIC_0_AXI4_S_ARQOS[1]->FIC_0_ACLK = 0.773"
syn_tsu272 = " FIC_0_AXI4_S_ARQOS[2]->FIC_0_ACLK = 0.765"
syn_tsu273 = " FIC_0_AXI4_S_ARQOS[3]->FIC_0_ACLK = 0.788"
syn_tsu274 = " FIC_0_AXI4_S_ARSIZE[0]->FIC_0_ACLK = 0.761"
syn_tsu275 = " FIC_0_AXI4_S_ARSIZE[1]->FIC_0_ACLK = 0.823"
syn_tsu276 = " FIC_0_AXI4_S_ARSIZE[2]->FIC_0_ACLK = 0.806"
syn_tsu277 = " FIC_0_AXI4_S_ARVALID->FIC_0_ACLK = 1.014"
syn_tsu278 = " FIC_0_AXI4_S_AWADDR[0]->FIC_0_ACLK = 0.756"
syn_tsu279 = " FIC_0_AXI4_S_AWADDR[10]->FIC_0_ACLK = 0.767"
syn_tsu280 = " FIC_0_AXI4_S_AWADDR[11]->FIC_0_ACLK = 0.768"
syn_tsu281 = " FIC_0_AXI4_S_AWADDR[12]->FIC_0_ACLK = 0.752"
syn_tsu282 = " FIC_0_AXI4_S_AWADDR[13]->FIC_0_ACLK = 0.762"
syn_tsu283 = " FIC_0_AXI4_S_AWADDR[14]->FIC_0_ACLK = 0.741"
syn_tsu284 = " FIC_0_AXI4_S_AWADDR[15]->FIC_0_ACLK = 0.739"
syn_tsu285 = " FIC_0_AXI4_S_AWADDR[16]->FIC_0_ACLK = 0.782"
syn_tsu286 = " FIC_0_AXI4_S_AWADDR[17]->FIC_0_ACLK = 0.781"
syn_tsu287 = " FIC_0_AXI4_S_AWADDR[18]->FIC_0_ACLK = 0.776"
syn_tsu288 = " FIC_0_AXI4_S_AWADDR[19]->FIC_0_ACLK = 0.774"
syn_tsu289 = " FIC_0_AXI4_S_AWADDR[1]->FIC_0_ACLK = 0.764"
syn_tsu290 = " FIC_0_AXI4_S_AWADDR[20]->FIC_0_ACLK = 0.819"
syn_tsu291 = " FIC_0_AXI4_S_AWADDR[21]->FIC_0_ACLK = 0.8"
syn_tsu292 = " FIC_0_AXI4_S_AWADDR[22]->FIC_0_ACLK = 0.8"
syn_tsu293 = " FIC_0_AXI4_S_AWADDR[23]->FIC_0_ACLK = 0.778"
syn_tsu294 = " FIC_0_AXI4_S_AWADDR[24]->FIC_0_ACLK = 0.772"
syn_tsu295 = " FIC_0_AXI4_S_AWADDR[25]->FIC_0_ACLK = 0.779"
syn_tsu296 = " FIC_0_AXI4_S_AWADDR[26]->FIC_0_ACLK = 0.768"
syn_tsu297 = " FIC_0_AXI4_S_AWADDR[27]->FIC_0_ACLK = 0.783"
syn_tsu298 = " FIC_0_AXI4_S_AWADDR[28]->FIC_0_ACLK = 0.785"
syn_tsu299 = " FIC_0_AXI4_S_AWADDR[29]->FIC_0_ACLK = 0.815"
syn_tsu300 = " FIC_0_AXI4_S_AWADDR[2]->FIC_0_ACLK = 0.769"
syn_tsu301 = " FIC_0_AXI4_S_AWADDR[30]->FIC_0_ACLK = 0.801"
syn_tsu302 = " FIC_0_AXI4_S_AWADDR[31]->FIC_0_ACLK = 0.768"
syn_tsu303 = " FIC_0_AXI4_S_AWADDR[32]->FIC_0_ACLK = 0.757"
syn_tsu304 = " FIC_0_AXI4_S_AWADDR[33]->FIC_0_ACLK = 0.738"
syn_tsu305 = " FIC_0_AXI4_S_AWADDR[34]->FIC_0_ACLK = 0.798"
syn_tsu306 = " FIC_0_AXI4_S_AWADDR[35]->FIC_0_ACLK = 0.818"
syn_tsu307 = " FIC_0_AXI4_S_AWADDR[36]->FIC_0_ACLK = 0.84"
syn_tsu308 = " FIC_0_AXI4_S_AWADDR[37]->FIC_0_ACLK = 0.767"
syn_tsu309 = " FIC_0_AXI4_S_AWADDR[3]->FIC_0_ACLK = 0.773"
syn_tsu310 = " FIC_0_AXI4_S_AWADDR[4]->FIC_0_ACLK = 0.77"
syn_tsu311 = " FIC_0_AXI4_S_AWADDR[5]->FIC_0_ACLK = 0.763"
syn_tsu312 = " FIC_0_AXI4_S_AWADDR[6]->FIC_0_ACLK = 0.76"
syn_tsu313 = " FIC_0_AXI4_S_AWADDR[7]->FIC_0_ACLK = 0.747"
syn_tsu314 = " FIC_0_AXI4_S_AWADDR[8]->FIC_0_ACLK = 0.736"
syn_tsu315 = " FIC_0_AXI4_S_AWADDR[9]->FIC_0_ACLK = 0.782"
syn_tsu316 = " FIC_0_AXI4_S_AWBURST[0]->FIC_0_ACLK = 0.788"
syn_tsu317 = " FIC_0_AXI4_S_AWBURST[1]->FIC_0_ACLK = 0.795"
syn_tsu318 = " FIC_0_AXI4_S_AWCACHE[0]->FIC_0_ACLK = 0.816"
syn_tsu319 = " FIC_0_AXI4_S_AWCACHE[1]->FIC_0_ACLK = 0.836"
syn_tsu320 = " FIC_0_AXI4_S_AWCACHE[2]->FIC_0_ACLK = 0.737"
syn_tsu321 = " FIC_0_AXI4_S_AWCACHE[3]->FIC_0_ACLK = 0.741"
syn_tsu322 = " FIC_0_AXI4_S_AWID[0]->FIC_0_ACLK = 0.78"
syn_tsu323 = " FIC_0_AXI4_S_AWID[1]->FIC_0_ACLK = 0.778"
syn_tsu324 = " FIC_0_AXI4_S_AWID[2]->FIC_0_ACLK = 0.782"
syn_tsu325 = " FIC_0_AXI4_S_AWID[3]->FIC_0_ACLK = 0.789"
syn_tsu326 = " FIC_0_AXI4_S_AWLEN[0]->FIC_0_ACLK = 0.805"
syn_tsu327 = " FIC_0_AXI4_S_AWLEN[1]->FIC_0_ACLK = 0.811"
syn_tsu328 = " FIC_0_AXI4_S_AWLEN[2]->FIC_0_ACLK = 0.773"
syn_tsu329 = " FIC_0_AXI4_S_AWLEN[3]->FIC_0_ACLK = 0.797"
syn_tsu330 = " FIC_0_AXI4_S_AWLEN[4]->FIC_0_ACLK = 0.812"
syn_tsu331 = " FIC_0_AXI4_S_AWLEN[5]->FIC_0_ACLK = 0.781"
syn_tsu332 = " FIC_0_AXI4_S_AWLEN[6]->FIC_0_ACLK = 0.79"
syn_tsu333 = " FIC_0_AXI4_S_AWLEN[7]->FIC_0_ACLK = 0.805"
syn_tsu334 = " FIC_0_AXI4_S_AWLOCK->FIC_0_ACLK = 0.789"
syn_tsu335 = " FIC_0_AXI4_S_AWPROT[0]->FIC_0_ACLK = 0.787"
syn_tsu336 = " FIC_0_AXI4_S_AWPROT[1]->FIC_0_ACLK = 0.776"
syn_tsu337 = " FIC_0_AXI4_S_AWPROT[2]->FIC_0_ACLK = 0.805"
syn_tsu338 = " FIC_0_AXI4_S_AWQOS[0]->FIC_0_ACLK = 0.747"
syn_tsu339 = " FIC_0_AXI4_S_AWQOS[1]->FIC_0_ACLK = 0.765"
syn_tsu340 = " FIC_0_AXI4_S_AWQOS[2]->FIC_0_ACLK = 0.759"
syn_tsu341 = " FIC_0_AXI4_S_AWQOS[3]->FIC_0_ACLK = 0.752"
syn_tsu342 = " FIC_0_AXI4_S_AWSIZE[0]->FIC_0_ACLK = 0.768"
syn_tsu343 = " FIC_0_AXI4_S_AWSIZE[1]->FIC_0_ACLK = 0.77"
syn_tsu344 = " FIC_0_AXI4_S_AWSIZE[2]->FIC_0_ACLK = 0.772"
syn_tsu345 = " FIC_0_AXI4_S_AWVALID->FIC_0_ACLK = 1.008"
syn_tsu346 = " FIC_0_AXI4_S_BREADY->FIC_0_ACLK = 0.918"
syn_tsu347 = " FIC_0_AXI4_S_RREADY->FIC_0_ACLK = 0.96"
syn_tsu348 = " FIC_0_AXI4_S_WDATA[0]->FIC_0_ACLK = 0.765"
syn_tsu349 = " FIC_0_AXI4_S_WDATA[10]->FIC_0_ACLK = 0.816"
syn_tsu350 = " FIC_0_AXI4_S_WDATA[11]->FIC_0_ACLK = 0.775"
syn_tsu351 = " FIC_0_AXI4_S_WDATA[12]->FIC_0_ACLK = 0.749"
syn_tsu352 = " FIC_0_AXI4_S_WDATA[13]->FIC_0_ACLK = 0.828"
syn_tsu353 = " FIC_0_AXI4_S_WDATA[14]->FIC_0_ACLK = 0.741"
syn_tsu354 = " FIC_0_AXI4_S_WDATA[15]->FIC_0_ACLK = 0.79"
syn_tsu355 = " FIC_0_AXI4_S_WDATA[16]->FIC_0_ACLK = 0.812"
syn_tsu356 = " FIC_0_AXI4_S_WDATA[17]->FIC_0_ACLK = 0.806"
syn_tsu357 = " FIC_0_AXI4_S_WDATA[18]->FIC_0_ACLK = 0.792"
syn_tsu358 = " FIC_0_AXI4_S_WDATA[19]->FIC_0_ACLK = 0.823"
syn_tsu359 = " FIC_0_AXI4_S_WDATA[1]->FIC_0_ACLK = 0.818"
syn_tsu360 = " FIC_0_AXI4_S_WDATA[20]->FIC_0_ACLK = 0.802"
syn_tsu361 = " FIC_0_AXI4_S_WDATA[21]->FIC_0_ACLK = 0.814"
syn_tsu362 = " FIC_0_AXI4_S_WDATA[22]->FIC_0_ACLK = 0.805"
syn_tsu363 = " FIC_0_AXI4_S_WDATA[23]->FIC_0_ACLK = 0.795"
syn_tsu364 = " FIC_0_AXI4_S_WDATA[24]->FIC_0_ACLK = 0.792"
syn_tsu365 = " FIC_0_AXI4_S_WDATA[25]->FIC_0_ACLK = 0.809"
syn_tsu366 = " FIC_0_AXI4_S_WDATA[26]->FIC_0_ACLK = 0.783"
syn_tsu367 = " FIC_0_AXI4_S_WDATA[27]->FIC_0_ACLK = 0.84"
syn_tsu368 = " FIC_0_AXI4_S_WDATA[28]->FIC_0_ACLK = 0.884"
syn_tsu369 = " FIC_0_AXI4_S_WDATA[29]->FIC_0_ACLK = 0.851"
syn_tsu370 = " FIC_0_AXI4_S_WDATA[2]->FIC_0_ACLK = 0.801"
syn_tsu371 = " FIC_0_AXI4_S_WDATA[30]->FIC_0_ACLK = 0.842"
syn_tsu372 = " FIC_0_AXI4_S_WDATA[31]->FIC_0_ACLK = 0.845"
syn_tsu373 = " FIC_0_AXI4_S_WDATA[32]->FIC_0_ACLK = 0.846"
syn_tsu374 = " FIC_0_AXI4_S_WDATA[33]->FIC_0_ACLK = 0.897"
syn_tsu375 = " FIC_0_AXI4_S_WDATA[34]->FIC_0_ACLK = 0.826"
syn_tsu376 = " FIC_0_AXI4_S_WDATA[35]->FIC_0_ACLK = 0.83"
syn_tsu377 = " FIC_0_AXI4_S_WDATA[36]->FIC_0_ACLK = 0.855"
syn_tsu378 = " FIC_0_AXI4_S_WDATA[37]->FIC_0_ACLK = 0.81"
syn_tsu379 = " FIC_0_AXI4_S_WDATA[38]->FIC_0_ACLK = 0.819"
syn_tsu380 = " FIC_0_AXI4_S_WDATA[39]->FIC_0_ACLK = 0.837"
syn_tsu381 = " FIC_0_AXI4_S_WDATA[3]->FIC_0_ACLK = 0.808"
syn_tsu382 = " FIC_0_AXI4_S_WDATA[40]->FIC_0_ACLK = 0.817"
syn_tsu383 = " FIC_0_AXI4_S_WDATA[41]->FIC_0_ACLK = 0.816"
syn_tsu384 = " FIC_0_AXI4_S_WDATA[42]->FIC_0_ACLK = 0.78"
syn_tsu385 = " FIC_0_AXI4_S_WDATA[43]->FIC_0_ACLK = 0.818"
syn_tsu386 = " FIC_0_AXI4_S_WDATA[44]->FIC_0_ACLK = 0.842"
syn_tsu387 = " FIC_0_AXI4_S_WDATA[45]->FIC_0_ACLK = 0.865"
syn_tsu388 = " FIC_0_AXI4_S_WDATA[46]->FIC_0_ACLK = 0.814"
syn_tsu389 = " FIC_0_AXI4_S_WDATA[47]->FIC_0_ACLK = 0.819"
syn_tsu390 = " FIC_0_AXI4_S_WDATA[48]->FIC_0_ACLK = 0.801"
syn_tsu391 = " FIC_0_AXI4_S_WDATA[49]->FIC_0_ACLK = 0.796"
syn_tsu392 = " FIC_0_AXI4_S_WDATA[4]->FIC_0_ACLK = 0.788"
syn_tsu393 = " FIC_0_AXI4_S_WDATA[50]->FIC_0_ACLK = 0.761"
syn_tsu394 = " FIC_0_AXI4_S_WDATA[51]->FIC_0_ACLK = 0.811"
syn_tsu395 = " FIC_0_AXI4_S_WDATA[52]->FIC_0_ACLK = 0.802"
syn_tsu396 = " FIC_0_AXI4_S_WDATA[53]->FIC_0_ACLK = 0.847"
syn_tsu397 = " FIC_0_AXI4_S_WDATA[54]->FIC_0_ACLK = 0.802"
syn_tsu398 = " FIC_0_AXI4_S_WDATA[55]->FIC_0_ACLK = 0.779"
syn_tsu399 = " FIC_0_AXI4_S_WDATA[56]->FIC_0_ACLK = 0.86"
syn_tsu400 = " FIC_0_AXI4_S_WDATA[57]->FIC_0_ACLK = 0.766"
syn_tsu401 = " FIC_0_AXI4_S_WDATA[58]->FIC_0_ACLK = 0.818"
syn_tsu402 = " FIC_0_AXI4_S_WDATA[59]->FIC_0_ACLK = 0.807"
syn_tsu403 = " FIC_0_AXI4_S_WDATA[5]->FIC_0_ACLK = 0.78"
syn_tsu404 = " FIC_0_AXI4_S_WDATA[60]->FIC_0_ACLK = 0.778"
syn_tsu405 = " FIC_0_AXI4_S_WDATA[61]->FIC_0_ACLK = 0.811"
syn_tsu406 = " FIC_0_AXI4_S_WDATA[62]->FIC_0_ACLK = 0.749"
syn_tsu407 = " FIC_0_AXI4_S_WDATA[63]->FIC_0_ACLK = 0.729"
syn_tsu408 = " FIC_0_AXI4_S_WDATA[6]->FIC_0_ACLK = 0.879"
syn_tsu409 = " FIC_0_AXI4_S_WDATA[7]->FIC_0_ACLK = 0.854"
syn_tsu410 = " FIC_0_AXI4_S_WDATA[8]->FIC_0_ACLK = 0.8"
syn_tsu411 = " FIC_0_AXI4_S_WDATA[9]->FIC_0_ACLK = 0.75"
syn_tsu412 = " FIC_0_AXI4_S_WLAST->FIC_0_ACLK = 0.861"
syn_tsu413 = " FIC_0_AXI4_S_WSTRB[0]->FIC_0_ACLK = 0.835"
syn_tsu414 = " FIC_0_AXI4_S_WSTRB[1]->FIC_0_ACLK = 0.807"
syn_tsu415 = " FIC_0_AXI4_S_WSTRB[2]->FIC_0_ACLK = 0.827"
syn_tsu416 = " FIC_0_AXI4_S_WSTRB[3]->FIC_0_ACLK = 0.852"
syn_tsu417 = " FIC_0_AXI4_S_WSTRB[4]->FIC_0_ACLK = 0.774"
syn_tsu418 = " FIC_0_AXI4_S_WSTRB[5]->FIC_0_ACLK = 0.881"
syn_tsu419 = " FIC_0_AXI4_S_WSTRB[6]->FIC_0_ACLK = 0.819"
syn_tsu420 = " FIC_0_AXI4_S_WSTRB[7]->FIC_0_ACLK = 0.831"
syn_tsu421 = " FIC_0_AXI4_S_WVALID->FIC_0_ACLK = 0.953"
syn_tsu422 = " FIC_1_AXI4_M_ARREADY->FIC_1_ACLK = 1.058"
syn_tsu423 = " FIC_1_AXI4_M_AWREADY->FIC_1_ACLK = 1.082"
syn_tsu424 = " FIC_1_AXI4_M_BID[0]->FIC_1_ACLK = 0.856"
syn_tsu425 = " FIC_1_AXI4_M_BID[1]->FIC_1_ACLK = 0.862"
syn_tsu426 = " FIC_1_AXI4_M_BID[2]->FIC_1_ACLK = 0.844"
syn_tsu427 = " FIC_1_AXI4_M_BID[3]->FIC_1_ACLK = 0.867"
syn_tsu428 = " FIC_1_AXI4_M_BID[4]->FIC_1_ACLK = 0.825"
syn_tsu429 = " FIC_1_AXI4_M_BID[5]->FIC_1_ACLK = 0.823"
syn_tsu430 = " FIC_1_AXI4_M_BID[6]->FIC_1_ACLK = 0.848"
syn_tsu431 = " FIC_1_AXI4_M_BID[7]->FIC_1_ACLK = 0.844"
syn_tsu432 = " FIC_1_AXI4_M_BRESP[0]->FIC_1_ACLK = 0.883"
syn_tsu433 = " FIC_1_AXI4_M_BRESP[1]->FIC_1_ACLK = 0.874"
syn_tsu434 = " FIC_1_AXI4_M_BVALID->FIC_1_ACLK = 1.029"
syn_tsu435 = " FIC_1_AXI4_M_RDATA[0]->FIC_1_ACLK = 0.958"
syn_tsu436 = " FIC_1_AXI4_M_RDATA[10]->FIC_1_ACLK = 0.956"
syn_tsu437 = " FIC_1_AXI4_M_RDATA[11]->FIC_1_ACLK = 0.965"
syn_tsu438 = " FIC_1_AXI4_M_RDATA[12]->FIC_1_ACLK = 0.897"
syn_tsu439 = " FIC_1_AXI4_M_RDATA[13]->FIC_1_ACLK = 0.899"
syn_tsu440 = " FIC_1_AXI4_M_RDATA[14]->FIC_1_ACLK = 0.992"
syn_tsu441 = " FIC_1_AXI4_M_RDATA[15]->FIC_1_ACLK = 0.941"
syn_tsu442 = " FIC_1_AXI4_M_RDATA[16]->FIC_1_ACLK = 0.933"
syn_tsu443 = " FIC_1_AXI4_M_RDATA[17]->FIC_1_ACLK = 0.926"
syn_tsu444 = " FIC_1_AXI4_M_RDATA[18]->FIC_1_ACLK = 0.86"
syn_tsu445 = " FIC_1_AXI4_M_RDATA[19]->FIC_1_ACLK = 0.951"
syn_tsu446 = " FIC_1_AXI4_M_RDATA[1]->FIC_1_ACLK = 1.014"
syn_tsu447 = " FIC_1_AXI4_M_RDATA[20]->FIC_1_ACLK = 0.943"
syn_tsu448 = " FIC_1_AXI4_M_RDATA[21]->FIC_1_ACLK = 0.841"
syn_tsu449 = " FIC_1_AXI4_M_RDATA[22]->FIC_1_ACLK = 0.926"
syn_tsu450 = " FIC_1_AXI4_M_RDATA[23]->FIC_1_ACLK = 0.923"
syn_tsu451 = " FIC_1_AXI4_M_RDATA[24]->FIC_1_ACLK = 0.844"
syn_tsu452 = " FIC_1_AXI4_M_RDATA[25]->FIC_1_ACLK = 0.993"
syn_tsu453 = " FIC_1_AXI4_M_RDATA[26]->FIC_1_ACLK = 0.943"
syn_tsu454 = " FIC_1_AXI4_M_RDATA[27]->FIC_1_ACLK = 0.856"
syn_tsu455 = " FIC_1_AXI4_M_RDATA[28]->FIC_1_ACLK = 0.877"
syn_tsu456 = " FIC_1_AXI4_M_RDATA[29]->FIC_1_ACLK = 0.853"
syn_tsu457 = " FIC_1_AXI4_M_RDATA[2]->FIC_1_ACLK = 1.089"
syn_tsu458 = " FIC_1_AXI4_M_RDATA[30]->FIC_1_ACLK = 0.879"
syn_tsu459 = " FIC_1_AXI4_M_RDATA[31]->FIC_1_ACLK = 0.951"
syn_tsu460 = " FIC_1_AXI4_M_RDATA[32]->FIC_1_ACLK = 0.945"
syn_tsu461 = " FIC_1_AXI4_M_RDATA[33]->FIC_1_ACLK = 0.892"
syn_tsu462 = " FIC_1_AXI4_M_RDATA[34]->FIC_1_ACLK = 0.897"
syn_tsu463 = " FIC_1_AXI4_M_RDATA[35]->FIC_1_ACLK = 0.88"
syn_tsu464 = " FIC_1_AXI4_M_RDATA[36]->FIC_1_ACLK = 0.899"
syn_tsu465 = " FIC_1_AXI4_M_RDATA[37]->FIC_1_ACLK = 0.884"
syn_tsu466 = " FIC_1_AXI4_M_RDATA[38]->FIC_1_ACLK = 0.87"
syn_tsu467 = " FIC_1_AXI4_M_RDATA[39]->FIC_1_ACLK = 0.891"
syn_tsu468 = " FIC_1_AXI4_M_RDATA[3]->FIC_1_ACLK = 1.038"
syn_tsu469 = " FIC_1_AXI4_M_RDATA[40]->FIC_1_ACLK = 0.877"
syn_tsu470 = " FIC_1_AXI4_M_RDATA[41]->FIC_1_ACLK = 0.892"
syn_tsu471 = " FIC_1_AXI4_M_RDATA[42]->FIC_1_ACLK = 0.863"
syn_tsu472 = " FIC_1_AXI4_M_RDATA[43]->FIC_1_ACLK = 0.926"
syn_tsu473 = " FIC_1_AXI4_M_RDATA[44]->FIC_1_ACLK = 0.886"
syn_tsu474 = " FIC_1_AXI4_M_RDATA[45]->FIC_1_ACLK = 0.903"
syn_tsu475 = " FIC_1_AXI4_M_RDATA[46]->FIC_1_ACLK = 0.93"
syn_tsu476 = " FIC_1_AXI4_M_RDATA[47]->FIC_1_ACLK = 0.907"
syn_tsu477 = " FIC_1_AXI4_M_RDATA[48]->FIC_1_ACLK = 0.925"
syn_tsu478 = " FIC_1_AXI4_M_RDATA[49]->FIC_1_ACLK = 0.905"
syn_tsu479 = " FIC_1_AXI4_M_RDATA[4]->FIC_1_ACLK = 1.038"
syn_tsu480 = " FIC_1_AXI4_M_RDATA[50]->FIC_1_ACLK = 0.909"
syn_tsu481 = " FIC_1_AXI4_M_RDATA[51]->FIC_1_ACLK = 0.905"
syn_tsu482 = " FIC_1_AXI4_M_RDATA[52]->FIC_1_ACLK = 0.916"
syn_tsu483 = " FIC_1_AXI4_M_RDATA[53]->FIC_1_ACLK = 0.911"
syn_tsu484 = " FIC_1_AXI4_M_RDATA[54]->FIC_1_ACLK = 0.924"
syn_tsu485 = " FIC_1_AXI4_M_RDATA[55]->FIC_1_ACLK = 0.949"
syn_tsu486 = " FIC_1_AXI4_M_RDATA[56]->FIC_1_ACLK = 0.934"
syn_tsu487 = " FIC_1_AXI4_M_RDATA[57]->FIC_1_ACLK = 0.876"
syn_tsu488 = " FIC_1_AXI4_M_RDATA[58]->FIC_1_ACLK = 0.99"
syn_tsu489 = " FIC_1_AXI4_M_RDATA[59]->FIC_1_ACLK = 0.863"
syn_tsu490 = " FIC_1_AXI4_M_RDATA[5]->FIC_1_ACLK = 0.988"
syn_tsu491 = " FIC_1_AXI4_M_RDATA[60]->FIC_1_ACLK = 0.947"
syn_tsu492 = " FIC_1_AXI4_M_RDATA[61]->FIC_1_ACLK = 0.938"
syn_tsu493 = " FIC_1_AXI4_M_RDATA[62]->FIC_1_ACLK = 0.904"
syn_tsu494 = " FIC_1_AXI4_M_RDATA[63]->FIC_1_ACLK = 0.893"
syn_tsu495 = " FIC_1_AXI4_M_RDATA[6]->FIC_1_ACLK = 0.995"
syn_tsu496 = " FIC_1_AXI4_M_RDATA[7]->FIC_1_ACLK = 0.947"
syn_tsu497 = " FIC_1_AXI4_M_RDATA[8]->FIC_1_ACLK = 0.968"
syn_tsu498 = " FIC_1_AXI4_M_RDATA[9]->FIC_1_ACLK = 0.912"
syn_tsu499 = " FIC_1_AXI4_M_RID[0]->FIC_1_ACLK = 1.039"
syn_tsu500 = " FIC_1_AXI4_M_RID[1]->FIC_1_ACLK = 0.974"
syn_tsu501 = " FIC_1_AXI4_M_RID[2]->FIC_1_ACLK = 0.989"
syn_tsu502 = " FIC_1_AXI4_M_RID[3]->FIC_1_ACLK = 1.009"
syn_tsu503 = " FIC_1_AXI4_M_RID[4]->FIC_1_ACLK = 1.014"
syn_tsu504 = " FIC_1_AXI4_M_RID[5]->FIC_1_ACLK = 1.03"
syn_tsu505 = " FIC_1_AXI4_M_RID[6]->FIC_1_ACLK = 1.081"
syn_tsu506 = " FIC_1_AXI4_M_RID[7]->FIC_1_ACLK = 1.047"
syn_tsu507 = " FIC_1_AXI4_M_RLAST->FIC_1_ACLK = 0.955"
syn_tsu508 = " FIC_1_AXI4_M_RRESP[0]->FIC_1_ACLK = 0.972"
syn_tsu509 = " FIC_1_AXI4_M_RRESP[1]->FIC_1_ACLK = 0.987"
syn_tsu510 = " FIC_1_AXI4_M_RVALID->FIC_1_ACLK = 1.067"
syn_tsu511 = " FIC_1_AXI4_M_WREADY->FIC_1_ACLK = 1.13"
syn_tsu512 = " FIC_1_AXI4_S_ARADDR[0]->FIC_1_ACLK = 0.895"
syn_tsu513 = " FIC_1_AXI4_S_ARADDR[10]->FIC_1_ACLK = 0.826"
syn_tsu514 = " FIC_1_AXI4_S_ARADDR[11]->FIC_1_ACLK = 0.908"
syn_tsu515 = " FIC_1_AXI4_S_ARADDR[12]->FIC_1_ACLK = 0.812"
syn_tsu516 = " FIC_1_AXI4_S_ARADDR[13]->FIC_1_ACLK = 0.91"
syn_tsu517 = " FIC_1_AXI4_S_ARADDR[14]->FIC_1_ACLK = 0.897"
syn_tsu518 = " FIC_1_AXI4_S_ARADDR[15]->FIC_1_ACLK = 0.812"
syn_tsu519 = " FIC_1_AXI4_S_ARADDR[16]->FIC_1_ACLK = 0.909"
syn_tsu520 = " FIC_1_AXI4_S_ARADDR[17]->FIC_1_ACLK = 0.851"
syn_tsu521 = " FIC_1_AXI4_S_ARADDR[18]->FIC_1_ACLK = 0.841"
syn_tsu522 = " FIC_1_AXI4_S_ARADDR[19]->FIC_1_ACLK = 0.881"
syn_tsu523 = " FIC_1_AXI4_S_ARADDR[1]->FIC_1_ACLK = 0.815"
syn_tsu524 = " FIC_1_AXI4_S_ARADDR[20]->FIC_1_ACLK = 0.861"
syn_tsu525 = " FIC_1_AXI4_S_ARADDR[21]->FIC_1_ACLK = 0.897"
syn_tsu526 = " FIC_1_AXI4_S_ARADDR[22]->FIC_1_ACLK = 0.915"
syn_tsu527 = " FIC_1_AXI4_S_ARADDR[23]->FIC_1_ACLK = 0.819"
syn_tsu528 = " FIC_1_AXI4_S_ARADDR[24]->FIC_1_ACLK = 0.901"
syn_tsu529 = " FIC_1_AXI4_S_ARADDR[25]->FIC_1_ACLK = 0.827"
syn_tsu530 = " FIC_1_AXI4_S_ARADDR[26]->FIC_1_ACLK = 0.817"
syn_tsu531 = " FIC_1_AXI4_S_ARADDR[27]->FIC_1_ACLK = 0.876"
syn_tsu532 = " FIC_1_AXI4_S_ARADDR[28]->FIC_1_ACLK = 0.871"
syn_tsu533 = " FIC_1_AXI4_S_ARADDR[29]->FIC_1_ACLK = 0.942"
syn_tsu534 = " FIC_1_AXI4_S_ARADDR[2]->FIC_1_ACLK = 0.791"
syn_tsu535 = " FIC_1_AXI4_S_ARADDR[30]->FIC_1_ACLK = 0.937"
syn_tsu536 = " FIC_1_AXI4_S_ARADDR[31]->FIC_1_ACLK = 0.916"
syn_tsu537 = " FIC_1_AXI4_S_ARADDR[32]->FIC_1_ACLK = 0.832"
syn_tsu538 = " FIC_1_AXI4_S_ARADDR[33]->FIC_1_ACLK = 0.85"
syn_tsu539 = " FIC_1_AXI4_S_ARADDR[34]->FIC_1_ACLK = 0.894"
syn_tsu540 = " FIC_1_AXI4_S_ARADDR[35]->FIC_1_ACLK = 0.859"
syn_tsu541 = " FIC_1_AXI4_S_ARADDR[36]->FIC_1_ACLK = 0.913"
syn_tsu542 = " FIC_1_AXI4_S_ARADDR[37]->FIC_1_ACLK = 0.84"
syn_tsu543 = " FIC_1_AXI4_S_ARADDR[3]->FIC_1_ACLK = 0.851"
syn_tsu544 = " FIC_1_AXI4_S_ARADDR[4]->FIC_1_ACLK = 0.792"
syn_tsu545 = " FIC_1_AXI4_S_ARADDR[5]->FIC_1_ACLK = 0.799"
syn_tsu546 = " FIC_1_AXI4_S_ARADDR[6]->FIC_1_ACLK = 0.893"
syn_tsu547 = " FIC_1_AXI4_S_ARADDR[7]->FIC_1_ACLK = 0.901"
syn_tsu548 = " FIC_1_AXI4_S_ARADDR[8]->FIC_1_ACLK = 0.824"
syn_tsu549 = " FIC_1_AXI4_S_ARADDR[9]->FIC_1_ACLK = 0.83"
syn_tsu550 = " FIC_1_AXI4_S_ARBURST[0]->FIC_1_ACLK = 0.933"
syn_tsu551 = " FIC_1_AXI4_S_ARBURST[1]->FIC_1_ACLK = 0.851"
syn_tsu552 = " FIC_1_AXI4_S_ARCACHE[0]->FIC_1_ACLK = 0.788"
syn_tsu553 = " FIC_1_AXI4_S_ARCACHE[1]->FIC_1_ACLK = 0.868"
syn_tsu554 = " FIC_1_AXI4_S_ARCACHE[2]->FIC_1_ACLK = 0.789"
syn_tsu555 = " FIC_1_AXI4_S_ARCACHE[3]->FIC_1_ACLK = 0.853"
syn_tsu556 = " FIC_1_AXI4_S_ARID[0]->FIC_1_ACLK = 0.807"
syn_tsu557 = " FIC_1_AXI4_S_ARID[1]->FIC_1_ACLK = 0.8"
syn_tsu558 = " FIC_1_AXI4_S_ARID[2]->FIC_1_ACLK = 0.806"
syn_tsu559 = " FIC_1_AXI4_S_ARID[3]->FIC_1_ACLK = 0.808"
syn_tsu560 = " FIC_1_AXI4_S_ARLEN[0]->FIC_1_ACLK = 0.862"
syn_tsu561 = " FIC_1_AXI4_S_ARLEN[1]->FIC_1_ACLK = 0.847"
syn_tsu562 = " FIC_1_AXI4_S_ARLEN[2]->FIC_1_ACLK = 0.86"
syn_tsu563 = " FIC_1_AXI4_S_ARLEN[3]->FIC_1_ACLK = 0.864"
syn_tsu564 = " FIC_1_AXI4_S_ARLEN[4]->FIC_1_ACLK = 0.781"
syn_tsu565 = " FIC_1_AXI4_S_ARLEN[5]->FIC_1_ACLK = 0.925"
syn_tsu566 = " FIC_1_AXI4_S_ARLEN[6]->FIC_1_ACLK = 0.835"
syn_tsu567 = " FIC_1_AXI4_S_ARLEN[7]->FIC_1_ACLK = 0.886"
syn_tsu568 = " FIC_1_AXI4_S_ARLOCK->FIC_1_ACLK = 0.913"
syn_tsu569 = " FIC_1_AXI4_S_ARPROT[0]->FIC_1_ACLK = 0.852"
syn_tsu570 = " FIC_1_AXI4_S_ARPROT[1]->FIC_1_ACLK = 0.863"
syn_tsu571 = " FIC_1_AXI4_S_ARPROT[2]->FIC_1_ACLK = 0.859"
syn_tsu572 = " FIC_1_AXI4_S_ARQOS[0]->FIC_1_ACLK = 0.831"
syn_tsu573 = " FIC_1_AXI4_S_ARQOS[1]->FIC_1_ACLK = 0.839"
syn_tsu574 = " FIC_1_AXI4_S_ARQOS[2]->FIC_1_ACLK = 0.85"
syn_tsu575 = " FIC_1_AXI4_S_ARQOS[3]->FIC_1_ACLK = 0.923"
syn_tsu576 = " FIC_1_AXI4_S_ARSIZE[0]->FIC_1_ACLK = 0.81"
syn_tsu577 = " FIC_1_AXI4_S_ARSIZE[1]->FIC_1_ACLK = 0.817"
syn_tsu578 = " FIC_1_AXI4_S_ARSIZE[2]->FIC_1_ACLK = 0.824"
syn_tsu579 = " FIC_1_AXI4_S_ARVALID->FIC_1_ACLK = 1.067"
syn_tsu580 = " FIC_1_AXI4_S_AWADDR[0]->FIC_1_ACLK = 0.805"
syn_tsu581 = " FIC_1_AXI4_S_AWADDR[10]->FIC_1_ACLK = 0.811"
syn_tsu582 = " FIC_1_AXI4_S_AWADDR[11]->FIC_1_ACLK = 0.804"
syn_tsu583 = " FIC_1_AXI4_S_AWADDR[12]->FIC_1_ACLK = 0.921"
syn_tsu584 = " FIC_1_AXI4_S_AWADDR[13]->FIC_1_ACLK = 0.857"
syn_tsu585 = " FIC_1_AXI4_S_AWADDR[14]->FIC_1_ACLK = 0.849"
syn_tsu586 = " FIC_1_AXI4_S_AWADDR[15]->FIC_1_ACLK = 0.814"
syn_tsu587 = " FIC_1_AXI4_S_AWADDR[16]->FIC_1_ACLK = 0.851"
syn_tsu588 = " FIC_1_AXI4_S_AWADDR[17]->FIC_1_ACLK = 0.846"
syn_tsu589 = " FIC_1_AXI4_S_AWADDR[18]->FIC_1_ACLK = 0.864"
syn_tsu590 = " FIC_1_AXI4_S_AWADDR[19]->FIC_1_ACLK = 0.86"
syn_tsu591 = " FIC_1_AXI4_S_AWADDR[1]->FIC_1_ACLK = 0.819"
syn_tsu592 = " FIC_1_AXI4_S_AWADDR[20]->FIC_1_ACLK = 0.967"
syn_tsu593 = " FIC_1_AXI4_S_AWADDR[21]->FIC_1_ACLK = 0.901"
syn_tsu594 = " FIC_1_AXI4_S_AWADDR[22]->FIC_1_ACLK = 0.85"
syn_tsu595 = " FIC_1_AXI4_S_AWADDR[23]->FIC_1_ACLK = 0.87"
syn_tsu596 = " FIC_1_AXI4_S_AWADDR[24]->FIC_1_ACLK = 0.875"
syn_tsu597 = " FIC_1_AXI4_S_AWADDR[25]->FIC_1_ACLK = 0.839"
syn_tsu598 = " FIC_1_AXI4_S_AWADDR[26]->FIC_1_ACLK = 0.838"
syn_tsu599 = " FIC_1_AXI4_S_AWADDR[27]->FIC_1_ACLK = 0.827"
syn_tsu600 = " FIC_1_AXI4_S_AWADDR[28]->FIC_1_ACLK = 0.812"
syn_tsu601 = " FIC_1_AXI4_S_AWADDR[29]->FIC_1_ACLK = 1.011"
syn_tsu602 = " FIC_1_AXI4_S_AWADDR[2]->FIC_1_ACLK = 0.828"
syn_tsu603 = " FIC_1_AXI4_S_AWADDR[30]->FIC_1_ACLK = 0.87"
syn_tsu604 = " FIC_1_AXI4_S_AWADDR[31]->FIC_1_ACLK = 0.935"
syn_tsu605 = " FIC_1_AXI4_S_AWADDR[32]->FIC_1_ACLK = 0.833"
syn_tsu606 = " FIC_1_AXI4_S_AWADDR[33]->FIC_1_ACLK = 0.849"
syn_tsu607 = " FIC_1_AXI4_S_AWADDR[34]->FIC_1_ACLK = 0.924"
syn_tsu608 = " FIC_1_AXI4_S_AWADDR[35]->FIC_1_ACLK = 0.851"
syn_tsu609 = " FIC_1_AXI4_S_AWADDR[36]->FIC_1_ACLK = 0.868"
syn_tsu610 = " FIC_1_AXI4_S_AWADDR[37]->FIC_1_ACLK = 0.889"
syn_tsu611 = " FIC_1_AXI4_S_AWADDR[3]->FIC_1_ACLK = 0.889"
syn_tsu612 = " FIC_1_AXI4_S_AWADDR[4]->FIC_1_ACLK = 0.817"
syn_tsu613 = " FIC_1_AXI4_S_AWADDR[5]->FIC_1_ACLK = 0.824"
syn_tsu614 = " FIC_1_AXI4_S_AWADDR[6]->FIC_1_ACLK = 0.835"
syn_tsu615 = " FIC_1_AXI4_S_AWADDR[7]->FIC_1_ACLK = 0.812"
syn_tsu616 = " FIC_1_AXI4_S_AWADDR[8]->FIC_1_ACLK = 0.818"
syn_tsu617 = " FIC_1_AXI4_S_AWADDR[9]->FIC_1_ACLK = 0.826"
syn_tsu618 = " FIC_1_AXI4_S_AWBURST[0]->FIC_1_ACLK = 0.824"
syn_tsu619 = " FIC_1_AXI4_S_AWBURST[1]->FIC_1_ACLK = 0.792"
syn_tsu620 = " FIC_1_AXI4_S_AWCACHE[0]->FIC_1_ACLK = 0.829"
syn_tsu621 = " FIC_1_AXI4_S_AWCACHE[1]->FIC_1_ACLK = 0.837"
syn_tsu622 = " FIC_1_AXI4_S_AWCACHE[2]->FIC_1_ACLK = 0.839"
syn_tsu623 = " FIC_1_AXI4_S_AWCACHE[3]->FIC_1_ACLK = 0.801"
syn_tsu624 = " FIC_1_AXI4_S_AWID[0]->FIC_1_ACLK = 0.896"
syn_tsu625 = " FIC_1_AXI4_S_AWID[1]->FIC_1_ACLK = 0.892"
syn_tsu626 = " FIC_1_AXI4_S_AWID[2]->FIC_1_ACLK = 0.89"
syn_tsu627 = " FIC_1_AXI4_S_AWID[3]->FIC_1_ACLK = 0.862"
syn_tsu628 = " FIC_1_AXI4_S_AWLEN[0]->FIC_1_ACLK = 0.789"
syn_tsu629 = " FIC_1_AXI4_S_AWLEN[1]->FIC_1_ACLK = 0.777"
syn_tsu630 = " FIC_1_AXI4_S_AWLEN[2]->FIC_1_ACLK = 0.814"
syn_tsu631 = " FIC_1_AXI4_S_AWLEN[3]->FIC_1_ACLK = 0.806"
syn_tsu632 = " FIC_1_AXI4_S_AWLEN[4]->FIC_1_ACLK = 0.77"
syn_tsu633 = " FIC_1_AXI4_S_AWLEN[5]->FIC_1_ACLK = 0.766"
syn_tsu634 = " FIC_1_AXI4_S_AWLEN[6]->FIC_1_ACLK = 0.785"
syn_tsu635 = " FIC_1_AXI4_S_AWLEN[7]->FIC_1_ACLK = 0.799"
syn_tsu636 = " FIC_1_AXI4_S_AWLOCK->FIC_1_ACLK = 0.816"
syn_tsu637 = " FIC_1_AXI4_S_AWPROT[0]->FIC_1_ACLK = 0.822"
syn_tsu638 = " FIC_1_AXI4_S_AWPROT[1]->FIC_1_ACLK = 0.798"
syn_tsu639 = " FIC_1_AXI4_S_AWPROT[2]->FIC_1_ACLK = 0.901"
syn_tsu640 = " FIC_1_AXI4_S_AWQOS[0]->FIC_1_ACLK = 0.835"
syn_tsu641 = " FIC_1_AXI4_S_AWQOS[1]->FIC_1_ACLK = 0.861"
syn_tsu642 = " FIC_1_AXI4_S_AWQOS[2]->FIC_1_ACLK = 0.85"
syn_tsu643 = " FIC_1_AXI4_S_AWQOS[3]->FIC_1_ACLK = 0.853"
syn_tsu644 = " FIC_1_AXI4_S_AWSIZE[0]->FIC_1_ACLK = 0.789"
syn_tsu645 = " FIC_1_AXI4_S_AWSIZE[1]->FIC_1_ACLK = 0.801"
syn_tsu646 = " FIC_1_AXI4_S_AWSIZE[2]->FIC_1_ACLK = 0.785"
syn_tsu647 = " FIC_1_AXI4_S_AWVALID->FIC_1_ACLK = 1.044"
syn_tsu648 = " FIC_1_AXI4_S_BREADY->FIC_1_ACLK = 1.044"
syn_tsu649 = " FIC_1_AXI4_S_RREADY->FIC_1_ACLK = 1.045"
syn_tsu650 = " FIC_1_AXI4_S_WDATA[0]->FIC_1_ACLK = 0.861"
syn_tsu651 = " FIC_1_AXI4_S_WDATA[10]->FIC_1_ACLK = 0.814"
syn_tsu652 = " FIC_1_AXI4_S_WDATA[11]->FIC_1_ACLK = 0.838"
syn_tsu653 = " FIC_1_AXI4_S_WDATA[12]->FIC_1_ACLK = 0.817"
syn_tsu654 = " FIC_1_AXI4_S_WDATA[13]->FIC_1_ACLK = 0.835"
syn_tsu655 = " FIC_1_AXI4_S_WDATA[14]->FIC_1_ACLK = 0.837"
syn_tsu656 = " FIC_1_AXI4_S_WDATA[15]->FIC_1_ACLK = 0.845"
syn_tsu657 = " FIC_1_AXI4_S_WDATA[16]->FIC_1_ACLK = 0.918"
syn_tsu658 = " FIC_1_AXI4_S_WDATA[17]->FIC_1_ACLK = 0.904"
syn_tsu659 = " FIC_1_AXI4_S_WDATA[18]->FIC_1_ACLK = 0.927"
syn_tsu660 = " FIC_1_AXI4_S_WDATA[19]->FIC_1_ACLK = 0.828"
syn_tsu661 = " FIC_1_AXI4_S_WDATA[1]->FIC_1_ACLK = 0.873"
syn_tsu662 = " FIC_1_AXI4_S_WDATA[20]->FIC_1_ACLK = 0.795"
syn_tsu663 = " FIC_1_AXI4_S_WDATA[21]->FIC_1_ACLK = 0.814"
syn_tsu664 = " FIC_1_AXI4_S_WDATA[22]->FIC_1_ACLK = 0.849"
syn_tsu665 = " FIC_1_AXI4_S_WDATA[23]->FIC_1_ACLK = 0.845"
syn_tsu666 = " FIC_1_AXI4_S_WDATA[24]->FIC_1_ACLK = 0.814"
syn_tsu667 = " FIC_1_AXI4_S_WDATA[25]->FIC_1_ACLK = 0.831"
syn_tsu668 = " FIC_1_AXI4_S_WDATA[26]->FIC_1_ACLK = 0.84"
syn_tsu669 = " FIC_1_AXI4_S_WDATA[27]->FIC_1_ACLK = 0.804"
syn_tsu670 = " FIC_1_AXI4_S_WDATA[28]->FIC_1_ACLK = 0.84"
syn_tsu671 = " FIC_1_AXI4_S_WDATA[29]->FIC_1_ACLK = 0.841"
syn_tsu672 = " FIC_1_AXI4_S_WDATA[2]->FIC_1_ACLK = 0.835"
syn_tsu673 = " FIC_1_AXI4_S_WDATA[30]->FIC_1_ACLK = 0.849"
syn_tsu674 = " FIC_1_AXI4_S_WDATA[31]->FIC_1_ACLK = 0.864"
syn_tsu675 = " FIC_1_AXI4_S_WDATA[32]->FIC_1_ACLK = 0.836"
syn_tsu676 = " FIC_1_AXI4_S_WDATA[33]->FIC_1_ACLK = 0.893"
syn_tsu677 = " FIC_1_AXI4_S_WDATA[34]->FIC_1_ACLK = 0.861"
syn_tsu678 = " FIC_1_AXI4_S_WDATA[35]->FIC_1_ACLK = 0.891"
syn_tsu679 = " FIC_1_AXI4_S_WDATA[36]->FIC_1_ACLK = 0.832"
syn_tsu680 = " FIC_1_AXI4_S_WDATA[37]->FIC_1_ACLK = 0.829"
syn_tsu681 = " FIC_1_AXI4_S_WDATA[38]->FIC_1_ACLK = 0.84"
syn_tsu682 = " FIC_1_AXI4_S_WDATA[39]->FIC_1_ACLK = 0.829"
syn_tsu683 = " FIC_1_AXI4_S_WDATA[3]->FIC_1_ACLK = 0.811"
syn_tsu684 = " FIC_1_AXI4_S_WDATA[40]->FIC_1_ACLK = 0.855"
syn_tsu685 = " FIC_1_AXI4_S_WDATA[41]->FIC_1_ACLK = 0.892"
syn_tsu686 = " FIC_1_AXI4_S_WDATA[42]->FIC_1_ACLK = 0.864"
syn_tsu687 = " FIC_1_AXI4_S_WDATA[43]->FIC_1_ACLK = 0.826"
syn_tsu688 = " FIC_1_AXI4_S_WDATA[44]->FIC_1_ACLK = 0.846"
syn_tsu689 = " FIC_1_AXI4_S_WDATA[45]->FIC_1_ACLK = 0.845"
syn_tsu690 = " FIC_1_AXI4_S_WDATA[46]->FIC_1_ACLK = 0.853"
syn_tsu691 = " FIC_1_AXI4_S_WDATA[47]->FIC_1_ACLK = 0.837"
syn_tsu692 = " FIC_1_AXI4_S_WDATA[48]->FIC_1_ACLK = 0.831"
syn_tsu693 = " FIC_1_AXI4_S_WDATA[49]->FIC_1_ACLK = 0.833"
syn_tsu694 = " FIC_1_AXI4_S_WDATA[4]->FIC_1_ACLK = 0.91"
syn_tsu695 = " FIC_1_AXI4_S_WDATA[50]->FIC_1_ACLK = 0.822"
syn_tsu696 = " FIC_1_AXI4_S_WDATA[51]->FIC_1_ACLK = 0.826"
syn_tsu697 = " FIC_1_AXI4_S_WDATA[52]->FIC_1_ACLK = 0.81"
syn_tsu698 = " FIC_1_AXI4_S_WDATA[53]->FIC_1_ACLK = 0.808"
syn_tsu699 = " FIC_1_AXI4_S_WDATA[54]->FIC_1_ACLK = 0.8"
syn_tsu700 = " FIC_1_AXI4_S_WDATA[55]->FIC_1_ACLK = 0.799"
syn_tsu701 = " FIC_1_AXI4_S_WDATA[56]->FIC_1_ACLK = 0.792"
syn_tsu702 = " FIC_1_AXI4_S_WDATA[57]->FIC_1_ACLK = 0.794"
syn_tsu703 = " FIC_1_AXI4_S_WDATA[58]->FIC_1_ACLK = 0.785"
syn_tsu704 = " FIC_1_AXI4_S_WDATA[59]->FIC_1_ACLK = 0.804"
syn_tsu705 = " FIC_1_AXI4_S_WDATA[5]->FIC_1_ACLK = 0.882"
syn_tsu706 = " FIC_1_AXI4_S_WDATA[60]->FIC_1_ACLK = 0.802"
syn_tsu707 = " FIC_1_AXI4_S_WDATA[61]->FIC_1_ACLK = 0.802"
syn_tsu708 = " FIC_1_AXI4_S_WDATA[62]->FIC_1_ACLK = 0.802"
syn_tsu709 = " FIC_1_AXI4_S_WDATA[63]->FIC_1_ACLK = 0.826"
syn_tsu710 = " FIC_1_AXI4_S_WDATA[6]->FIC_1_ACLK = 0.819"
syn_tsu711 = " FIC_1_AXI4_S_WDATA[7]->FIC_1_ACLK = 0.783"
syn_tsu712 = " FIC_1_AXI4_S_WDATA[8]->FIC_1_ACLK = 0.797"
syn_tsu713 = " FIC_1_AXI4_S_WDATA[9]->FIC_1_ACLK = 0.819"
syn_tsu714 = " FIC_1_AXI4_S_WLAST->FIC_1_ACLK = 0.918"
syn_tsu715 = " FIC_1_AXI4_S_WSTRB[0]->FIC_1_ACLK = 0.896"
syn_tsu716 = " FIC_1_AXI4_S_WSTRB[1]->FIC_1_ACLK = 0.908"
syn_tsu717 = " FIC_1_AXI4_S_WSTRB[2]->FIC_1_ACLK = 0.833"
syn_tsu718 = " FIC_1_AXI4_S_WSTRB[3]->FIC_1_ACLK = 0.899"
syn_tsu719 = " FIC_1_AXI4_S_WSTRB[4]->FIC_1_ACLK = 0.875"
syn_tsu720 = " FIC_1_AXI4_S_WSTRB[5]->FIC_1_ACLK = 0.808"
syn_tsu721 = " FIC_1_AXI4_S_WSTRB[6]->FIC_1_ACLK = 0.889"
syn_tsu722 = " FIC_1_AXI4_S_WSTRB[7]->FIC_1_ACLK = 0.923"
syn_tsu723 = " FIC_1_AXI4_S_WVALID->FIC_1_ACLK = 0.956"
syn_tsu724 = " FIC_2_AXI4_S_ARADDR[0]->FIC_2_ACLK = 0.78"
syn_tsu725 = " FIC_2_AXI4_S_ARADDR[10]->FIC_2_ACLK = 0.846"
syn_tsu726 = " FIC_2_AXI4_S_ARADDR[11]->FIC_2_ACLK = 0.841"
syn_tsu727 = " FIC_2_AXI4_S_ARADDR[12]->FIC_2_ACLK = 0.851"
syn_tsu728 = " FIC_2_AXI4_S_ARADDR[13]->FIC_2_ACLK = 0.863"
syn_tsu729 = " FIC_2_AXI4_S_ARADDR[14]->FIC_2_ACLK = 0.882"
syn_tsu730 = " FIC_2_AXI4_S_ARADDR[15]->FIC_2_ACLK = 0.894"
syn_tsu731 = " FIC_2_AXI4_S_ARADDR[16]->FIC_2_ACLK = 0.88"
syn_tsu732 = " FIC_2_AXI4_S_ARADDR[17]->FIC_2_ACLK = 0.916"
syn_tsu733 = " FIC_2_AXI4_S_ARADDR[18]->FIC_2_ACLK = 0.893"
syn_tsu734 = " FIC_2_AXI4_S_ARADDR[19]->FIC_2_ACLK = 0.962"
syn_tsu735 = " FIC_2_AXI4_S_ARADDR[1]->FIC_2_ACLK = 0.804"
syn_tsu736 = " FIC_2_AXI4_S_ARADDR[20]->FIC_2_ACLK = 0.926"
syn_tsu737 = " FIC_2_AXI4_S_ARADDR[21]->FIC_2_ACLK = 0.865"
syn_tsu738 = " FIC_2_AXI4_S_ARADDR[22]->FIC_2_ACLK = 0.916"
syn_tsu739 = " FIC_2_AXI4_S_ARADDR[23]->FIC_2_ACLK = 0.927"
syn_tsu740 = " FIC_2_AXI4_S_ARADDR[24]->FIC_2_ACLK = 0.886"
syn_tsu741 = " FIC_2_AXI4_S_ARADDR[25]->FIC_2_ACLK = 0.908"
syn_tsu742 = " FIC_2_AXI4_S_ARADDR[26]->FIC_2_ACLK = 0.866"
syn_tsu743 = " FIC_2_AXI4_S_ARADDR[27]->FIC_2_ACLK = 0.92"
syn_tsu744 = " FIC_2_AXI4_S_ARADDR[28]->FIC_2_ACLK = 0.85"
syn_tsu745 = " FIC_2_AXI4_S_ARADDR[29]->FIC_2_ACLK = 0.826"
syn_tsu746 = " FIC_2_AXI4_S_ARADDR[2]->FIC_2_ACLK = 0.888"
syn_tsu747 = " FIC_2_AXI4_S_ARADDR[30]->FIC_2_ACLK = 0.866"
syn_tsu748 = " FIC_2_AXI4_S_ARADDR[31]->FIC_2_ACLK = 0.905"
syn_tsu749 = " FIC_2_AXI4_S_ARADDR[32]->FIC_2_ACLK = 0.861"
syn_tsu750 = " FIC_2_AXI4_S_ARADDR[33]->FIC_2_ACLK = 0.845"
syn_tsu751 = " FIC_2_AXI4_S_ARADDR[34]->FIC_2_ACLK = 0.878"
syn_tsu752 = " FIC_2_AXI4_S_ARADDR[35]->FIC_2_ACLK = 0.821"
syn_tsu753 = " FIC_2_AXI4_S_ARADDR[36]->FIC_2_ACLK = 0.941"
syn_tsu754 = " FIC_2_AXI4_S_ARADDR[37]->FIC_2_ACLK = 0.944"
syn_tsu755 = " FIC_2_AXI4_S_ARADDR[3]->FIC_2_ACLK = 0.865"
syn_tsu756 = " FIC_2_AXI4_S_ARADDR[4]->FIC_2_ACLK = 0.854"
syn_tsu757 = " FIC_2_AXI4_S_ARADDR[5]->FIC_2_ACLK = 0.864"
syn_tsu758 = " FIC_2_AXI4_S_ARADDR[6]->FIC_2_ACLK = 0.887"
syn_tsu759 = " FIC_2_AXI4_S_ARADDR[7]->FIC_2_ACLK = 0.901"
syn_tsu760 = " FIC_2_AXI4_S_ARADDR[8]->FIC_2_ACLK = 0.853"
syn_tsu761 = " FIC_2_AXI4_S_ARADDR[9]->FIC_2_ACLK = 0.83"
syn_tsu762 = " FIC_2_AXI4_S_ARBURST[0]->FIC_2_ACLK = 0.789"
syn_tsu763 = " FIC_2_AXI4_S_ARBURST[1]->FIC_2_ACLK = 0.817"
syn_tsu764 = " FIC_2_AXI4_S_ARID[0]->FIC_2_ACLK = 0.828"
syn_tsu765 = " FIC_2_AXI4_S_ARID[1]->FIC_2_ACLK = 0.797"
syn_tsu766 = " FIC_2_AXI4_S_ARID[2]->FIC_2_ACLK = 0.776"
syn_tsu767 = " FIC_2_AXI4_S_ARID[3]->FIC_2_ACLK = 0.794"
syn_tsu768 = " FIC_2_AXI4_S_ARLEN[0]->FIC_2_ACLK = 0.876"
syn_tsu769 = " FIC_2_AXI4_S_ARLEN[1]->FIC_2_ACLK = 0.836"
syn_tsu770 = " FIC_2_AXI4_S_ARLEN[2]->FIC_2_ACLK = 0.831"
syn_tsu771 = " FIC_2_AXI4_S_ARLEN[3]->FIC_2_ACLK = 0.842"
syn_tsu772 = " FIC_2_AXI4_S_ARLEN[4]->FIC_2_ACLK = 0.811"
syn_tsu773 = " FIC_2_AXI4_S_ARLEN[5]->FIC_2_ACLK = 0.807"
syn_tsu774 = " FIC_2_AXI4_S_ARLEN[6]->FIC_2_ACLK = 0.783"
syn_tsu775 = " FIC_2_AXI4_S_ARLEN[7]->FIC_2_ACLK = 0.812"
syn_tsu776 = " FIC_2_AXI4_S_ARLOCK->FIC_2_ACLK = 0.817"
syn_tsu777 = " FIC_2_AXI4_S_ARPROT[0]->FIC_2_ACLK = 0.808"
syn_tsu778 = " FIC_2_AXI4_S_ARPROT[1]->FIC_2_ACLK = 0.803"
syn_tsu779 = " FIC_2_AXI4_S_ARPROT[2]->FIC_2_ACLK = 0.811"
syn_tsu780 = " FIC_2_AXI4_S_ARQOS[0]->FIC_2_ACLK = 0.785"
syn_tsu781 = " FIC_2_AXI4_S_ARQOS[1]->FIC_2_ACLK = 0.791"
syn_tsu782 = " FIC_2_AXI4_S_ARQOS[2]->FIC_2_ACLK = 0.785"
syn_tsu783 = " FIC_2_AXI4_S_ARQOS[3]->FIC_2_ACLK = 0.796"
syn_tsu784 = " FIC_2_AXI4_S_ARSIZE[0]->FIC_2_ACLK = 0.829"
syn_tsu785 = " FIC_2_AXI4_S_ARSIZE[1]->FIC_2_ACLK = 0.845"
syn_tsu786 = " FIC_2_AXI4_S_ARSIZE[2]->FIC_2_ACLK = 0.848"
syn_tsu787 = " FIC_2_AXI4_S_ARVALID->FIC_2_ACLK = 1.085"
syn_tsu788 = " FIC_2_AXI4_S_AWADDR[0]->FIC_2_ACLK = 0.862"
syn_tsu789 = " FIC_2_AXI4_S_AWADDR[10]->FIC_2_ACLK = 0.809"
syn_tsu790 = " FIC_2_AXI4_S_AWADDR[11]->FIC_2_ACLK = 0.844"
syn_tsu791 = " FIC_2_AXI4_S_AWADDR[12]->FIC_2_ACLK = 0.806"
syn_tsu792 = " FIC_2_AXI4_S_AWADDR[13]->FIC_2_ACLK = 0.78"
syn_tsu793 = " FIC_2_AXI4_S_AWADDR[14]->FIC_2_ACLK = 0.764"
syn_tsu794 = " FIC_2_AXI4_S_AWADDR[15]->FIC_2_ACLK = 0.746"
syn_tsu795 = " FIC_2_AXI4_S_AWADDR[16]->FIC_2_ACLK = 0.747"
syn_tsu796 = " FIC_2_AXI4_S_AWADDR[17]->FIC_2_ACLK = 0.74"
syn_tsu797 = " FIC_2_AXI4_S_AWADDR[18]->FIC_2_ACLK = 0.776"
syn_tsu798 = " FIC_2_AXI4_S_AWADDR[19]->FIC_2_ACLK = 0.734"
syn_tsu799 = " FIC_2_AXI4_S_AWADDR[1]->FIC_2_ACLK = 0.891"
syn_tsu800 = " FIC_2_AXI4_S_AWADDR[20]->FIC_2_ACLK = 0.738"
syn_tsu801 = " FIC_2_AXI4_S_AWADDR[21]->FIC_2_ACLK = 0.793"
syn_tsu802 = " FIC_2_AXI4_S_AWADDR[22]->FIC_2_ACLK = 0.765"
syn_tsu803 = " FIC_2_AXI4_S_AWADDR[23]->FIC_2_ACLK = 0.758"
syn_tsu804 = " FIC_2_AXI4_S_AWADDR[24]->FIC_2_ACLK = 0.794"
syn_tsu805 = " FIC_2_AXI4_S_AWADDR[25]->FIC_2_ACLK = 0.814"
syn_tsu806 = " FIC_2_AXI4_S_AWADDR[26]->FIC_2_ACLK = 0.798"
syn_tsu807 = " FIC_2_AXI4_S_AWADDR[27]->FIC_2_ACLK = 0.793"
syn_tsu808 = " FIC_2_AXI4_S_AWADDR[28]->FIC_2_ACLK = 0.796"
syn_tsu809 = " FIC_2_AXI4_S_AWADDR[29]->FIC_2_ACLK = 0.793"
syn_tsu810 = " FIC_2_AXI4_S_AWADDR[2]->FIC_2_ACLK = 0.893"
syn_tsu811 = " FIC_2_AXI4_S_AWADDR[30]->FIC_2_ACLK = 0.811"
syn_tsu812 = " FIC_2_AXI4_S_AWADDR[31]->FIC_2_ACLK = 0.812"
syn_tsu813 = " FIC_2_AXI4_S_AWADDR[32]->FIC_2_ACLK = 0.808"
syn_tsu814 = " FIC_2_AXI4_S_AWADDR[33]->FIC_2_ACLK = 0.812"
syn_tsu815 = " FIC_2_AXI4_S_AWADDR[34]->FIC_2_ACLK = 0.788"
syn_tsu816 = " FIC_2_AXI4_S_AWADDR[35]->FIC_2_ACLK = 0.78"
syn_tsu817 = " FIC_2_AXI4_S_AWADDR[36]->FIC_2_ACLK = 0.829"
syn_tsu818 = " FIC_2_AXI4_S_AWADDR[37]->FIC_2_ACLK = 0.845"
syn_tsu819 = " FIC_2_AXI4_S_AWADDR[3]->FIC_2_ACLK = 0.893"
syn_tsu820 = " FIC_2_AXI4_S_AWADDR[4]->FIC_2_ACLK = 0.854"
syn_tsu821 = " FIC_2_AXI4_S_AWADDR[5]->FIC_2_ACLK = 0.879"
syn_tsu822 = " FIC_2_AXI4_S_AWADDR[6]->FIC_2_ACLK = 0.891"
syn_tsu823 = " FIC_2_AXI4_S_AWADDR[7]->FIC_2_ACLK = 0.869"
syn_tsu824 = " FIC_2_AXI4_S_AWADDR[8]->FIC_2_ACLK = 0.863"
syn_tsu825 = " FIC_2_AXI4_S_AWADDR[9]->FIC_2_ACLK = 0.829"
syn_tsu826 = " FIC_2_AXI4_S_AWBURST[0]->FIC_2_ACLK = 0.848"
syn_tsu827 = " FIC_2_AXI4_S_AWBURST[1]->FIC_2_ACLK = 0.814"
syn_tsu828 = " FIC_2_AXI4_S_AWID[0]->FIC_2_ACLK = 0.841"
syn_tsu829 = " FIC_2_AXI4_S_AWID[1]->FIC_2_ACLK = 0.85"
syn_tsu830 = " FIC_2_AXI4_S_AWID[2]->FIC_2_ACLK = 0.841"
syn_tsu831 = " FIC_2_AXI4_S_AWID[3]->FIC_2_ACLK = 0.884"
syn_tsu832 = " FIC_2_AXI4_S_AWLEN[0]->FIC_2_ACLK = 0.885"
syn_tsu833 = " FIC_2_AXI4_S_AWLEN[1]->FIC_2_ACLK = 0.921"
syn_tsu834 = " FIC_2_AXI4_S_AWLEN[2]->FIC_2_ACLK = 0.928"
syn_tsu835 = " FIC_2_AXI4_S_AWLEN[3]->FIC_2_ACLK = 0.93"
syn_tsu836 = " FIC_2_AXI4_S_AWLEN[4]->FIC_2_ACLK = 0.811"
syn_tsu837 = " FIC_2_AXI4_S_AWLEN[5]->FIC_2_ACLK = 0.844"
syn_tsu838 = " FIC_2_AXI4_S_AWLEN[6]->FIC_2_ACLK = 0.828"
syn_tsu839 = " FIC_2_AXI4_S_AWLEN[7]->FIC_2_ACLK = 0.846"
syn_tsu840 = " FIC_2_AXI4_S_AWLOCK->FIC_2_ACLK = 0.948"
syn_tsu841 = " FIC_2_AXI4_S_AWPROT[0]->FIC_2_ACLK = 1.025"
syn_tsu842 = " FIC_2_AXI4_S_AWPROT[1]->FIC_2_ACLK = 0.946"
syn_tsu843 = " FIC_2_AXI4_S_AWPROT[2]->FIC_2_ACLK = 0.968"
syn_tsu844 = " FIC_2_AXI4_S_AWQOS[0]->FIC_2_ACLK = 1.085"
syn_tsu845 = " FIC_2_AXI4_S_AWQOS[1]->FIC_2_ACLK = 1.056"
syn_tsu846 = " FIC_2_AXI4_S_AWQOS[2]->FIC_2_ACLK = 1.018"
syn_tsu847 = " FIC_2_AXI4_S_AWQOS[3]->FIC_2_ACLK = 1.002"
syn_tsu848 = " FIC_2_AXI4_S_AWSIZE[0]->FIC_2_ACLK = 1.045"
syn_tsu849 = " FIC_2_AXI4_S_AWSIZE[1]->FIC_2_ACLK = 0.957"
syn_tsu850 = " FIC_2_AXI4_S_AWSIZE[2]->FIC_2_ACLK = 1.043"
syn_tsu851 = " FIC_2_AXI4_S_AWVALID->FIC_2_ACLK = 1.124"
syn_tsu852 = " FIC_2_AXI4_S_BREADY->FIC_2_ACLK = 1.127"
syn_tsu853 = " FIC_2_AXI4_S_RREADY->FIC_2_ACLK = 1.172"
syn_tsu854 = " FIC_2_AXI4_S_WDATA[0]->FIC_2_ACLK = 1.142"
syn_tsu855 = " FIC_2_AXI4_S_WDATA[10]->FIC_2_ACLK = 1.124"
syn_tsu856 = " FIC_2_AXI4_S_WDATA[11]->FIC_2_ACLK = 1.101"
syn_tsu857 = " FIC_2_AXI4_S_WDATA[12]->FIC_2_ACLK = 1.049"
syn_tsu858 = " FIC_2_AXI4_S_WDATA[13]->FIC_2_ACLK = 1.065"
syn_tsu859 = " FIC_2_AXI4_S_WDATA[14]->FIC_2_ACLK = 1.118"
syn_tsu860 = " FIC_2_AXI4_S_WDATA[15]->FIC_2_ACLK = 1.087"
syn_tsu861 = " FIC_2_AXI4_S_WDATA[16]->FIC_2_ACLK = 1.098"
syn_tsu862 = " FIC_2_AXI4_S_WDATA[17]->FIC_2_ACLK = 1.104"
syn_tsu863 = " FIC_2_AXI4_S_WDATA[18]->FIC_2_ACLK = 1.092"
syn_tsu864 = " FIC_2_AXI4_S_WDATA[19]->FIC_2_ACLK = 1.081"
syn_tsu865 = " FIC_2_AXI4_S_WDATA[1]->FIC_2_ACLK = 1.058"
syn_tsu866 = " FIC_2_AXI4_S_WDATA[20]->FIC_2_ACLK = 1.088"
syn_tsu867 = " FIC_2_AXI4_S_WDATA[21]->FIC_2_ACLK = 1.11"
syn_tsu868 = " FIC_2_AXI4_S_WDATA[22]->FIC_2_ACLK = 1.059"
syn_tsu869 = " FIC_2_AXI4_S_WDATA[23]->FIC_2_ACLK = 1.113"
syn_tsu870 = " FIC_2_AXI4_S_WDATA[24]->FIC_2_ACLK = 1.065"
syn_tsu871 = " FIC_2_AXI4_S_WDATA[25]->FIC_2_ACLK = 1.027"
syn_tsu872 = " FIC_2_AXI4_S_WDATA[26]->FIC_2_ACLK = 1.133"
syn_tsu873 = " FIC_2_AXI4_S_WDATA[27]->FIC_2_ACLK = 1.122"
syn_tsu874 = " FIC_2_AXI4_S_WDATA[28]->FIC_2_ACLK = 1.1"
syn_tsu875 = " FIC_2_AXI4_S_WDATA[29]->FIC_2_ACLK = 1.12"
syn_tsu876 = " FIC_2_AXI4_S_WDATA[2]->FIC_2_ACLK = 1.087"
syn_tsu877 = " FIC_2_AXI4_S_WDATA[30]->FIC_2_ACLK = 1.091"
syn_tsu878 = " FIC_2_AXI4_S_WDATA[31]->FIC_2_ACLK = 1.069"
syn_tsu879 = " FIC_2_AXI4_S_WDATA[32]->FIC_2_ACLK = 1.144"
syn_tsu880 = " FIC_2_AXI4_S_WDATA[33]->FIC_2_ACLK = 1.081"
syn_tsu881 = " FIC_2_AXI4_S_WDATA[34]->FIC_2_ACLK = 1.108"
syn_tsu882 = " FIC_2_AXI4_S_WDATA[35]->FIC_2_ACLK = 1.11"
syn_tsu883 = " FIC_2_AXI4_S_WDATA[36]->FIC_2_ACLK = 1.12"
syn_tsu884 = " FIC_2_AXI4_S_WDATA[37]->FIC_2_ACLK = 1.118"
syn_tsu885 = " FIC_2_AXI4_S_WDATA[38]->FIC_2_ACLK = 1.089"
syn_tsu886 = " FIC_2_AXI4_S_WDATA[39]->FIC_2_ACLK = 0.984"
syn_tsu887 = " FIC_2_AXI4_S_WDATA[3]->FIC_2_ACLK = 1.061"
syn_tsu888 = " FIC_2_AXI4_S_WDATA[40]->FIC_2_ACLK = 1.086"
syn_tsu889 = " FIC_2_AXI4_S_WDATA[41]->FIC_2_ACLK = 1.074"
syn_tsu890 = " FIC_2_AXI4_S_WDATA[42]->FIC_2_ACLK = 1.089"
syn_tsu891 = " FIC_2_AXI4_S_WDATA[43]->FIC_2_ACLK = 1.137"
syn_tsu892 = " FIC_2_AXI4_S_WDATA[44]->FIC_2_ACLK = 1.114"
syn_tsu893 = " FIC_2_AXI4_S_WDATA[45]->FIC_2_ACLK = 1.092"
syn_tsu894 = " FIC_2_AXI4_S_WDATA[46]->FIC_2_ACLK = 1.085"
syn_tsu895 = " FIC_2_AXI4_S_WDATA[47]->FIC_2_ACLK = 1.089"
syn_tsu896 = " FIC_2_AXI4_S_WDATA[48]->FIC_2_ACLK = 1.081"
syn_tsu897 = " FIC_2_AXI4_S_WDATA[49]->FIC_2_ACLK = 1.134"
syn_tsu898 = " FIC_2_AXI4_S_WDATA[4]->FIC_2_ACLK = 1.068"
syn_tsu899 = " FIC_2_AXI4_S_WDATA[50]->FIC_2_ACLK = 1.071"
syn_tsu900 = " FIC_2_AXI4_S_WDATA[51]->FIC_2_ACLK = 1.064"
syn_tsu901 = " FIC_2_AXI4_S_WDATA[52]->FIC_2_ACLK = 1.141"
syn_tsu902 = " FIC_2_AXI4_S_WDATA[53]->FIC_2_ACLK = 0.978"
syn_tsu903 = " FIC_2_AXI4_S_WDATA[54]->FIC_2_ACLK = 1.036"
syn_tsu904 = " FIC_2_AXI4_S_WDATA[55]->FIC_2_ACLK = 0.997"
syn_tsu905 = " FIC_2_AXI4_S_WDATA[56]->FIC_2_ACLK = 1.062"
syn_tsu906 = " FIC_2_AXI4_S_WDATA[57]->FIC_2_ACLK = 1.061"
syn_tsu907 = " FIC_2_AXI4_S_WDATA[58]->FIC_2_ACLK = 1.041"
syn_tsu908 = " FIC_2_AXI4_S_WDATA[59]->FIC_2_ACLK = 1.061"
syn_tsu909 = " FIC_2_AXI4_S_WDATA[5]->FIC_2_ACLK = 1.123"
syn_tsu910 = " FIC_2_AXI4_S_WDATA[60]->FIC_2_ACLK = 1.07"
syn_tsu911 = " FIC_2_AXI4_S_WDATA[61]->FIC_2_ACLK = 1.125"
syn_tsu912 = " FIC_2_AXI4_S_WDATA[62]->FIC_2_ACLK = 1.081"
syn_tsu913 = " FIC_2_AXI4_S_WDATA[63]->FIC_2_ACLK = 0.989"
syn_tsu914 = " FIC_2_AXI4_S_WDATA[6]->FIC_2_ACLK = 1.059"
syn_tsu915 = " FIC_2_AXI4_S_WDATA[7]->FIC_2_ACLK = 1.057"
syn_tsu916 = " FIC_2_AXI4_S_WDATA[8]->FIC_2_ACLK = 0.979"
syn_tsu917 = " FIC_2_AXI4_S_WDATA[9]->FIC_2_ACLK = 1.057"
syn_tsu918 = " FIC_2_AXI4_S_WLAST->FIC_2_ACLK = 1.033"
syn_tsu919 = " FIC_2_AXI4_S_WSTRB[0]->FIC_2_ACLK = 1.104"
syn_tsu920 = " FIC_2_AXI4_S_WSTRB[1]->FIC_2_ACLK = 1.084"
syn_tsu921 = " FIC_2_AXI4_S_WSTRB[2]->FIC_2_ACLK = 1.061"
syn_tsu922 = " FIC_2_AXI4_S_WSTRB[3]->FIC_2_ACLK = 1.061"
syn_tsu923 = " FIC_2_AXI4_S_WSTRB[4]->FIC_2_ACLK = 1.058"
syn_tsu924 = " FIC_2_AXI4_S_WSTRB[5]->FIC_2_ACLK = 1.081"
syn_tsu925 = " FIC_2_AXI4_S_WSTRB[6]->FIC_2_ACLK = 1.088"
syn_tsu926 = " FIC_2_AXI4_S_WSTRB[7]->FIC_2_ACLK = 1.101"
syn_tsu927 = " FIC_2_AXI4_S_WVALID->FIC_2_ACLK = 1.112"
syn_tsu928 = " FIC_3_APB_M_PRDATA[0]->FIC_3_PCLK = 0.842"
syn_tsu929 = " FIC_3_APB_M_PRDATA[10]->FIC_3_PCLK = 0.658"
syn_tsu930 = " FIC_3_APB_M_PRDATA[11]->FIC_3_PCLK = 0.654"
syn_tsu931 = " FIC_3_APB_M_PRDATA[12]->FIC_3_PCLK = 0.647"
syn_tsu932 = " FIC_3_APB_M_PRDATA[13]->FIC_3_PCLK = 0.656"
syn_tsu933 = " FIC_3_APB_M_PRDATA[14]->FIC_3_PCLK = 0.649"
syn_tsu934 = " FIC_3_APB_M_PRDATA[15]->FIC_3_PCLK = 0.656"
syn_tsu935 = " FIC_3_APB_M_PRDATA[16]->FIC_3_PCLK = 0.654"
syn_tsu936 = " FIC_3_APB_M_PRDATA[17]->FIC_3_PCLK = 0.631"
syn_tsu937 = " FIC_3_APB_M_PRDATA[18]->FIC_3_PCLK = 0.626"
syn_tsu938 = " FIC_3_APB_M_PRDATA[19]->FIC_3_PCLK = 0.661"
syn_tsu939 = " FIC_3_APB_M_PRDATA[1]->FIC_3_PCLK = 0.751"
syn_tsu940 = " FIC_3_APB_M_PRDATA[20]->FIC_3_PCLK = 0.644"
syn_tsu941 = " FIC_3_APB_M_PRDATA[21]->FIC_3_PCLK = 0.634"
syn_tsu942 = " FIC_3_APB_M_PRDATA[22]->FIC_3_PCLK = 0.679"
syn_tsu943 = " FIC_3_APB_M_PRDATA[23]->FIC_3_PCLK = 0.686"
syn_tsu944 = " FIC_3_APB_M_PRDATA[24]->FIC_3_PCLK = 0.684"
syn_tsu945 = " FIC_3_APB_M_PRDATA[25]->FIC_3_PCLK = 0.692"
syn_tsu946 = " FIC_3_APB_M_PRDATA[26]->FIC_3_PCLK = 0.675"
syn_tsu947 = " FIC_3_APB_M_PRDATA[27]->FIC_3_PCLK = 0.707"
syn_tsu948 = " FIC_3_APB_M_PRDATA[28]->FIC_3_PCLK = 0.637"
syn_tsu949 = " FIC_3_APB_M_PRDATA[29]->FIC_3_PCLK = 0.715"
syn_tsu950 = " FIC_3_APB_M_PRDATA[2]->FIC_3_PCLK = 0.724"
syn_tsu951 = " FIC_3_APB_M_PRDATA[30]->FIC_3_PCLK = 0.651"
syn_tsu952 = " FIC_3_APB_M_PRDATA[31]->FIC_3_PCLK = 0.646"
syn_tsu953 = " FIC_3_APB_M_PRDATA[3]->FIC_3_PCLK = 0.662"
syn_tsu954 = " FIC_3_APB_M_PRDATA[4]->FIC_3_PCLK = 0.758"
syn_tsu955 = " FIC_3_APB_M_PRDATA[5]->FIC_3_PCLK = 0.749"
syn_tsu956 = " FIC_3_APB_M_PRDATA[6]->FIC_3_PCLK = 0.811"
syn_tsu957 = " FIC_3_APB_M_PRDATA[7]->FIC_3_PCLK = 0.763"
syn_tsu958 = " FIC_3_APB_M_PRDATA[8]->FIC_3_PCLK = 0.639"
syn_tsu959 = " FIC_3_APB_M_PRDATA[9]->FIC_3_PCLK = 0.675"
syn_tsu960 = " FIC_3_APB_M_PREADY->FIC_3_PCLK = 0.944"
syn_tsu961 = " FIC_3_APB_M_PSLVERR->FIC_3_PCLK = 0.831"
syn_tsu962 = " JTAG_TDI_F2M->JTAG_TCK_F2M = 0.498"
syn_tsu963 = " JTAG_TMS_F2M->JTAG_TCK_F2M = 1.505"
syn_tsu964 = " MAC_0_GMII_MII_RXD_F2M[0]->MAC_0_GMII_MII_RX_CLK_F2M = 2.349"
syn_tsu965 = " MAC_0_GMII_MII_RXD_F2M[1]->MAC_0_GMII_MII_RX_CLK_F2M = 2.42"
syn_tsu966 = " MAC_0_GMII_MII_RXD_F2M[2]->MAC_0_GMII_MII_RX_CLK_F2M = 2.551"
syn_tsu967 = " MAC_0_GMII_MII_RXD_F2M[3]->MAC_0_GMII_MII_RX_CLK_F2M = 2.484"
syn_tsu968 = " MAC_0_GMII_MII_RXD_F2M[4]->MAC_0_GMII_MII_RX_CLK_F2M = 2.368"
syn_tsu969 = " MAC_0_GMII_MII_RXD_F2M[5]->MAC_0_GMII_MII_RX_CLK_F2M = 2.509"
syn_tsu970 = " MAC_0_GMII_MII_RXD_F2M[6]->MAC_0_GMII_MII_RX_CLK_F2M = 2.392"
syn_tsu971 = " MAC_0_GMII_MII_RXD_F2M[7]->MAC_0_GMII_MII_RX_CLK_F2M = 2.396"
syn_tsu972 = " MAC_0_GMII_MII_RX_DV_F2M->MAC_0_GMII_MII_RX_CLK_F2M = 2.527"
syn_tsu973 = " MAC_0_GMII_MII_RX_ER_F2M->MAC_0_GMII_MII_RX_CLK_F2M = 2.443"
syn_tsu974 = " MAC_1_GMII_MII_RXD_F2M[0]->MAC_1_GMII_MII_RX_CLK_F2M = 2.318"
syn_tsu975 = " MAC_1_GMII_MII_RXD_F2M[1]->MAC_1_GMII_MII_RX_CLK_F2M = 2.424"
syn_tsu976 = " MAC_1_GMII_MII_RXD_F2M[2]->MAC_1_GMII_MII_RX_CLK_F2M = 2.4"
syn_tsu977 = " MAC_1_GMII_MII_RXD_F2M[3]->MAC_1_GMII_MII_RX_CLK_F2M = 2.398"
syn_tsu978 = " MAC_1_GMII_MII_RXD_F2M[4]->MAC_1_GMII_MII_RX_CLK_F2M = 2.478"
syn_tsu979 = " MAC_1_GMII_MII_RXD_F2M[5]->MAC_1_GMII_MII_RX_CLK_F2M = 2.363"
syn_tsu980 = " MAC_1_GMII_MII_RXD_F2M[6]->MAC_1_GMII_MII_RX_CLK_F2M = 2.362"
syn_tsu981 = " MAC_1_GMII_MII_RXD_F2M[7]->MAC_1_GMII_MII_RX_CLK_F2M = 2.387"
syn_tsu982 = " MAC_1_GMII_MII_RX_DV_F2M->MAC_1_GMII_MII_RX_CLK_F2M = 2.358"
syn_tsu983 = " MAC_1_GMII_MII_RX_ER_F2M->MAC_1_GMII_MII_RX_CLK_F2M = 2.362"
syn_tsu984 = " USOC_TRACE_DATA_F2M[0]->USOC_TRACE_CLOCK_F2M = 0.731"
syn_tsu985 = " USOC_TRACE_DATA_F2M[10]->USOC_TRACE_CLOCK_F2M = 0.753"
syn_tsu986 = " USOC_TRACE_DATA_F2M[11]->USOC_TRACE_CLOCK_F2M = 0.898"
syn_tsu987 = " USOC_TRACE_DATA_F2M[12]->USOC_TRACE_CLOCK_F2M = 0.777"
syn_tsu988 = " USOC_TRACE_DATA_F2M[13]->USOC_TRACE_CLOCK_F2M = 0.864"
syn_tsu989 = " USOC_TRACE_DATA_F2M[14]->USOC_TRACE_CLOCK_F2M = 0.737"
syn_tsu990 = " USOC_TRACE_DATA_F2M[15]->USOC_TRACE_CLOCK_F2M = 0.783"
syn_tsu991 = " USOC_TRACE_DATA_F2M[16]->USOC_TRACE_CLOCK_F2M = 0.773"
syn_tsu992 = " USOC_TRACE_DATA_F2M[17]->USOC_TRACE_CLOCK_F2M = 0.76"
syn_tsu993 = " USOC_TRACE_DATA_F2M[18]->USOC_TRACE_CLOCK_F2M = 0.838"
syn_tsu994 = " USOC_TRACE_DATA_F2M[19]->USOC_TRACE_CLOCK_F2M = 0.776"
syn_tsu995 = " USOC_TRACE_DATA_F2M[1]->USOC_TRACE_CLOCK_F2M = 0.71"
syn_tsu996 = " USOC_TRACE_DATA_F2M[20]->USOC_TRACE_CLOCK_F2M = 0.738"
syn_tsu997 = " USOC_TRACE_DATA_F2M[21]->USOC_TRACE_CLOCK_F2M = 0.699"
syn_tsu998 = " USOC_TRACE_DATA_F2M[22]->USOC_TRACE_CLOCK_F2M = 0.721"
syn_tsu999 = " USOC_TRACE_DATA_F2M[23]->USOC_TRACE_CLOCK_F2M = 0.72"
syn_tsu1000 = " USOC_TRACE_DATA_F2M[24]->USOC_TRACE_CLOCK_F2M = 0.734"
syn_tsu1001 = " USOC_TRACE_DATA_F2M[25]->USOC_TRACE_CLOCK_F2M = 0.733"
syn_tsu1002 = " USOC_TRACE_DATA_F2M[26]->USOC_TRACE_CLOCK_F2M = 0.689"
syn_tsu1003 = " USOC_TRACE_DATA_F2M[27]->USOC_TRACE_CLOCK_F2M = 0.779"
syn_tsu1004 = " USOC_TRACE_DATA_F2M[28]->USOC_TRACE_CLOCK_F2M = 0.74"
syn_tsu1005 = " USOC_TRACE_DATA_F2M[29]->USOC_TRACE_CLOCK_F2M = 0.765"
syn_tsu1006 = " USOC_TRACE_DATA_F2M[2]->USOC_TRACE_CLOCK_F2M = 0.765"
syn_tsu1007 = " USOC_TRACE_DATA_F2M[30]->USOC_TRACE_CLOCK_F2M = 0.691"
syn_tsu1008 = " USOC_TRACE_DATA_F2M[31]->USOC_TRACE_CLOCK_F2M = 0.69"
syn_tsu1009 = " USOC_TRACE_DATA_F2M[32]->USOC_TRACE_CLOCK_F2M = 0.742"
syn_tsu1010 = " USOC_TRACE_DATA_F2M[33]->USOC_TRACE_CLOCK_F2M = 0.765"
syn_tsu1011 = " USOC_TRACE_DATA_F2M[34]->USOC_TRACE_CLOCK_F2M = 0.666"
syn_tsu1012 = " USOC_TRACE_DATA_F2M[35]->USOC_TRACE_CLOCK_F2M = 0.773"
syn_tsu1013 = " USOC_TRACE_DATA_F2M[36]->USOC_TRACE_CLOCK_F2M = 0.749"
syn_tsu1014 = " USOC_TRACE_DATA_F2M[37]->USOC_TRACE_CLOCK_F2M = 0.662"
syn_tsu1015 = " USOC_TRACE_DATA_F2M[38]->USOC_TRACE_CLOCK_F2M = 0.663"
syn_tsu1016 = " USOC_TRACE_DATA_F2M[39]->USOC_TRACE_CLOCK_F2M = 0.718"
syn_tsu1017 = " USOC_TRACE_DATA_F2M[3]->USOC_TRACE_CLOCK_F2M = 0.712"
syn_tsu1018 = " USOC_TRACE_DATA_F2M[4]->USOC_TRACE_CLOCK_F2M = 0.694"
syn_tsu1019 = " USOC_TRACE_DATA_F2M[5]->USOC_TRACE_CLOCK_F2M = 0.709"
syn_tsu1020 = " USOC_TRACE_DATA_F2M[6]->USOC_TRACE_CLOCK_F2M = 0.707"
syn_tsu1021 = " USOC_TRACE_DATA_F2M[7]->USOC_TRACE_CLOCK_F2M = 0.691"
syn_tsu1022 = " USOC_TRACE_DATA_F2M[8]->USOC_TRACE_CLOCK_F2M = 0.768"
syn_tsu1023 = " USOC_TRACE_DATA_F2M[9]->USOC_TRACE_CLOCK_F2M = 0.777"
syn_tsu1024 = " USOC_TRACE_VALID_F2M->USOC_TRACE_CLOCK_F2M = 0.71"
syn_tco0 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[0] = 1.278"
syn_tco1 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[10] = 1.232"
syn_tco2 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[11] = 1.275"
syn_tco3 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[12] = 1.209"
syn_tco4 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[13] = 1.217"
syn_tco5 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[14] = 1.275"
syn_tco6 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[15] = 1.265"
syn_tco7 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[16] = 1.242"
syn_tco8 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[17] = 1.275"
syn_tco9 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[18] = 1.231"
syn_tco10 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[19] = 1.209"
syn_tco11 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[1] = 1.308"
syn_tco12 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[20] = 1.214"
syn_tco13 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[21] = 1.210"
syn_tco14 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[22] = 1.253"
syn_tco15 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[23] = 1.254"
syn_tco16 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[24] = 1.226"
syn_tco17 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[25] = 1.232"
syn_tco18 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[26] = 1.194"
syn_tco19 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[27] = 1.213"
syn_tco20 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[28] = 1.247"
syn_tco21 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[29] = 1.243"
syn_tco22 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[2] = 1.298"
syn_tco23 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[30] = 1.224"
syn_tco24 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[31] = 1.231"
syn_tco25 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[3] = 1.277"
syn_tco26 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[4] = 1.292"
syn_tco27 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[5] = 1.293"
syn_tco28 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[6] = 1.289"
syn_tco29 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[7] = 1.242"
syn_tco30 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[8] = 1.254"
syn_tco31 = " CRYPTO_HCLK->CRYPTO_AHB_M_HADDR[9] = 1.221"
syn_tco32 = " CRYPTO_HCLK->CRYPTO_AHB_M_HSIZE[0] = 1.258"
syn_tco33 = " CRYPTO_HCLK->CRYPTO_AHB_M_HSIZE[1] = 1.206"
syn_tco34 = " CRYPTO_HCLK->CRYPTO_AHB_M_HTRANS[0] = 1.425"
syn_tco35 = " CRYPTO_HCLK->CRYPTO_AHB_M_HTRANS[1] = 1.448"
syn_tco36 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[0] = 1.249"
syn_tco37 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[10] = 1.297"
syn_tco38 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[11] = 1.269"
syn_tco39 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[12] = 1.274"
syn_tco40 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[13] = 1.284"
syn_tco41 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[14] = 1.277"
syn_tco42 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[15] = 1.278"
syn_tco43 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[16] = 1.268"
syn_tco44 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[17] = 1.293"
syn_tco45 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[18] = 1.276"
syn_tco46 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[19] = 1.320"
syn_tco47 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[1] = 1.275"
syn_tco48 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[20] = 1.297"
syn_tco49 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[21] = 1.280"
syn_tco50 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[22] = 1.290"
syn_tco51 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[23] = 1.324"
syn_tco52 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[24] = 1.289"
syn_tco53 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[25] = 1.283"
syn_tco54 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[26] = 1.276"
syn_tco55 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[27] = 1.303"
syn_tco56 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[28] = 1.310"
syn_tco57 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[29] = 1.276"
syn_tco58 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[2] = 1.277"
syn_tco59 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[30] = 1.314"
syn_tco60 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[31] = 1.277"
syn_tco61 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[3] = 1.326"
syn_tco62 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[4] = 1.267"
syn_tco63 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[5] = 1.291"
syn_tco64 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[6] = 1.313"
syn_tco65 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[7] = 1.298"
syn_tco66 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[8] = 1.275"
syn_tco67 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWDATA[9] = 1.314"
syn_tco68 = " CRYPTO_HCLK->CRYPTO_AHB_M_HWRITE = 1.265"
syn_tco69 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[0] = 1.391"
syn_tco70 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[10] = 1.283"
syn_tco71 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[11] = 1.265"
syn_tco72 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[12] = 1.271"
syn_tco73 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[13] = 1.263"
syn_tco74 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[14] = 1.223"
syn_tco75 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[15] = 1.261"
syn_tco76 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[16] = 1.272"
syn_tco77 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[17] = 1.197"
syn_tco78 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[18] = 1.262"
syn_tco79 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[19] = 1.233"
syn_tco80 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[1] = 1.259"
syn_tco81 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[20] = 1.224"
syn_tco82 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[21] = 1.241"
syn_tco83 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[22] = 1.272"
syn_tco84 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[23] = 1.228"
syn_tco85 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[24] = 1.245"
syn_tco86 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[25] = 1.235"
syn_tco87 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[26] = 1.244"
syn_tco88 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[27] = 1.255"
syn_tco89 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[28] = 1.245"
syn_tco90 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[29] = 1.267"
syn_tco91 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[2] = 1.279"
syn_tco92 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[30] = 1.265"
syn_tco93 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[31] = 1.258"
syn_tco94 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[3] = 1.279"
syn_tco95 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[4] = 1.259"
syn_tco96 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[5] = 1.266"
syn_tco97 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[6] = 1.218"
syn_tco98 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[7] = 1.303"
syn_tco99 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[8] = 1.442"
syn_tco100 = " CRYPTO_HCLK->CRYPTO_AHB_S_HRDATA[9] = 1.264"
syn_tco101 = " CRYPTO_HCLK->CRYPTO_AHB_S_HREADYOUT = 1.384"
syn_tco102 = " CRYPTO_HCLK->CRYPTO_ALARM_M2F = 1.942"
syn_tco103 = " CRYPTO_HCLK->CRYPTO_BUSERROR_M2F = 1.467"
syn_tco104 = " CRYPTO_HCLK->CRYPTO_BUSY_M2F = 1.863"
syn_tco105 = " CRYPTO_HCLK->CRYPTO_COMPLETE_M2F = 1.883"
syn_tco106 = " CRYPTO_HCLK->CRYPTO_XINACCEPT_M2F = 1.280"
syn_tco107 = " CRYPTO_HCLK->CRYPTO_XRADDR_M2F[0] = 1.347"
syn_tco108 = " CRYPTO_HCLK->CRYPTO_XRADDR_M2F[1] = 1.319"
syn_tco109 = " CRYPTO_HCLK->CRYPTO_XRADDR_M2F[2] = 1.329"
syn_tco110 = " CRYPTO_HCLK->CRYPTO_XRADDR_M2F[3] = 1.320"
syn_tco111 = " CRYPTO_HCLK->CRYPTO_XRADDR_M2F[4] = 1.297"
syn_tco112 = " CRYPTO_HCLK->CRYPTO_XRADDR_M2F[5] = 1.342"
syn_tco113 = " CRYPTO_HCLK->CRYPTO_XRADDR_M2F[6] = 1.326"
syn_tco114 = " CRYPTO_HCLK->CRYPTO_XRADDR_M2F[7] = 1.349"
syn_tco115 = " CRYPTO_HCLK->CRYPTO_XRADDR_M2F[8] = 1.318"
syn_tco116 = " CRYPTO_HCLK->CRYPTO_XRADDR_M2F[9] = 1.307"
syn_tco117 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[0] = 1.285"
syn_tco118 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[10] = 1.234"
syn_tco119 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[11] = 1.245"
syn_tco120 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[12] = 1.243"
syn_tco121 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[13] = 1.235"
syn_tco122 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[14] = 1.240"
syn_tco123 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[15] = 1.238"
syn_tco124 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[16] = 1.274"
syn_tco125 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[17] = 1.225"
syn_tco126 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[18] = 1.246"
syn_tco127 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[19] = 1.258"
syn_tco128 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[1] = 1.298"
syn_tco129 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[20] = 1.208"
syn_tco130 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[21] = 1.231"
syn_tco131 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[22] = 1.235"
syn_tco132 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[23] = 1.255"
syn_tco133 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[24] = 1.273"
syn_tco134 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[25] = 1.266"
syn_tco135 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[26] = 1.202"
syn_tco136 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[27] = 1.268"
syn_tco137 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[28] = 1.273"
syn_tco138 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[29] = 1.279"
syn_tco139 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[2] = 1.283"
syn_tco140 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[30] = 1.233"
syn_tco141 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[31] = 1.242"
syn_tco142 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[3] = 1.263"
syn_tco143 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[4] = 1.223"
syn_tco144 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[5] = 1.240"
syn_tco145 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[6] = 1.230"
syn_tco146 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[7] = 1.217"
syn_tco147 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[8] = 1.229"
syn_tco148 = " CRYPTO_HCLK->CRYPTO_XRDATA_M2F[9] = 1.264"
syn_tco149 = " CRYPTO_HCLK->CRYPTO_XVALIDOUT_M2F = 1.310"
syn_tco150 = " CRYPTO_HCLK->CRYPTO_XWADDR_M2F[0] = 1.325"
syn_tco151 = " CRYPTO_HCLK->CRYPTO_XWADDR_M2F[1] = 1.336"
syn_tco152 = " CRYPTO_HCLK->CRYPTO_XWADDR_M2F[2] = 1.329"
syn_tco153 = " CRYPTO_HCLK->CRYPTO_XWADDR_M2F[3] = 1.310"
syn_tco154 = " CRYPTO_HCLK->CRYPTO_XWADDR_M2F[4] = 1.311"
syn_tco155 = " CRYPTO_HCLK->CRYPTO_XWADDR_M2F[5] = 1.302"
syn_tco156 = " CRYPTO_HCLK->CRYPTO_XWADDR_M2F[6] = 1.290"
syn_tco157 = " CRYPTO_HCLK->CRYPTO_XWADDR_M2F[7] = 1.304"
syn_tco158 = " CRYPTO_HCLK->CRYPTO_XWADDR_M2F[8] = 1.310"
syn_tco159 = " CRYPTO_HCLK->CRYPTO_XWADDR_M2F[9] = 1.318"
syn_tco160 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[0] = 0.923"
syn_tco161 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[10] = 1.077"
syn_tco162 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[11] = 1.006"
syn_tco163 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[12] = 1.057"
syn_tco164 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[13] = 1.087"
syn_tco165 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[14] = 1.013"
syn_tco166 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[15] = 1.022"
syn_tco167 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[16] = 1.039"
syn_tco168 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[17] = 1.021"
syn_tco169 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[18] = 0.973"
syn_tco170 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[19] = 1.054"
syn_tco171 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[1] = 0.937"
syn_tco172 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[20] = 1.040"
syn_tco173 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[21] = 1.025"
syn_tco174 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[22] = 1.087"
syn_tco175 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[23] = 1.015"
syn_tco176 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[24] = 1.038"
syn_tco177 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[25] = 1.015"
syn_tco178 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[26] = 1.015"
syn_tco179 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[27] = 1.013"
syn_tco180 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[28] = 0.999"
syn_tco181 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[29] = 1.029"
syn_tco182 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[2] = 0.998"
syn_tco183 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[30] = 1.031"
syn_tco184 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[31] = 1.025"
syn_tco185 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[32] = 1.041"
syn_tco186 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[33] = 1.025"
syn_tco187 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[34] = 0.995"
syn_tco188 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[35] = 0.984"
syn_tco189 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[36] = 0.985"
syn_tco190 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[37] = 0.996"
syn_tco191 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[3] = 1.034"
syn_tco192 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[4] = 0.935"
syn_tco193 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[5] = 0.934"
syn_tco194 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[6] = 1.025"
syn_tco195 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[7] = 1.025"
syn_tco196 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[8] = 0.933"
syn_tco197 = " FIC_0_ACLK->FIC_0_AXI4_M_ARADDR[9] = 1.033"
syn_tco198 = " FIC_0_ACLK->FIC_0_AXI4_M_ARBURST[0] = 1.062"
syn_tco199 = " FIC_0_ACLK->FIC_0_AXI4_M_ARBURST[1] = 1.011"
syn_tco200 = " FIC_0_ACLK->FIC_0_AXI4_M_ARCACHE[0] = 0.988"
syn_tco201 = " FIC_0_ACLK->FIC_0_AXI4_M_ARCACHE[1] = 1.010"
syn_tco202 = " FIC_0_ACLK->FIC_0_AXI4_M_ARCACHE[2] = 1.007"
syn_tco203 = " FIC_0_ACLK->FIC_0_AXI4_M_ARCACHE[3] = 1.024"
syn_tco204 = " FIC_0_ACLK->FIC_0_AXI4_M_ARID[0] = 0.827"
syn_tco205 = " FIC_0_ACLK->FIC_0_AXI4_M_ARID[1] = 0.985"
syn_tco206 = " FIC_0_ACLK->FIC_0_AXI4_M_ARID[2] = 0.942"
syn_tco207 = " FIC_0_ACLK->FIC_0_AXI4_M_ARID[3] = 0.984"
syn_tco208 = " FIC_0_ACLK->FIC_0_AXI4_M_ARID[4] = 1.001"
syn_tco209 = " FIC_0_ACLK->FIC_0_AXI4_M_ARID[5] = 1.005"
syn_tco210 = " FIC_0_ACLK->FIC_0_AXI4_M_ARID[6] = 0.983"
syn_tco211 = " FIC_0_ACLK->FIC_0_AXI4_M_ARID[7] = 0.988"
syn_tco212 = " FIC_0_ACLK->FIC_0_AXI4_M_ARLEN[0] = 0.968"
syn_tco213 = " FIC_0_ACLK->FIC_0_AXI4_M_ARLEN[1] = 0.997"
syn_tco214 = " FIC_0_ACLK->FIC_0_AXI4_M_ARLEN[2] = 0.989"
syn_tco215 = " FIC_0_ACLK->FIC_0_AXI4_M_ARLEN[3] = 1.011"
syn_tco216 = " FIC_0_ACLK->FIC_0_AXI4_M_ARLEN[4] = 1.012"
syn_tco217 = " FIC_0_ACLK->FIC_0_AXI4_M_ARLEN[5] = 1.011"
syn_tco218 = " FIC_0_ACLK->FIC_0_AXI4_M_ARLEN[6] = 1.004"
syn_tco219 = " FIC_0_ACLK->FIC_0_AXI4_M_ARLEN[7] = 0.968"
syn_tco220 = " FIC_0_ACLK->FIC_0_AXI4_M_ARLOCK = 0.989"
syn_tco221 = " FIC_0_ACLK->FIC_0_AXI4_M_ARPROT[0] = 0.983"
syn_tco222 = " FIC_0_ACLK->FIC_0_AXI4_M_ARPROT[1] = 0.958"
syn_tco223 = " FIC_0_ACLK->FIC_0_AXI4_M_ARPROT[2] = 0.984"
syn_tco224 = " FIC_0_ACLK->FIC_0_AXI4_M_ARQOS[0] = 0.925"
syn_tco225 = " FIC_0_ACLK->FIC_0_AXI4_M_ARQOS[1] = 0.937"
syn_tco226 = " FIC_0_ACLK->FIC_0_AXI4_M_ARQOS[2] = 0.993"
syn_tco227 = " FIC_0_ACLK->FIC_0_AXI4_M_ARQOS[3] = 0.988"
syn_tco228 = " FIC_0_ACLK->FIC_0_AXI4_M_ARSIZE[0] = 0.998"
syn_tco229 = " FIC_0_ACLK->FIC_0_AXI4_M_ARSIZE[1] = 0.995"
syn_tco230 = " FIC_0_ACLK->FIC_0_AXI4_M_ARSIZE[2] = 1.008"
syn_tco231 = " FIC_0_ACLK->FIC_0_AXI4_M_ARVALID = 0.551"
syn_tco232 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[0] = 1.014"
syn_tco233 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[10] = 0.998"
syn_tco234 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[11] = 0.992"
syn_tco235 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[12] = 0.998"
syn_tco236 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[13] = 1.011"
syn_tco237 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[14] = 0.979"
syn_tco238 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[15] = 0.996"
syn_tco239 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[16] = 0.963"
syn_tco240 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[17] = 1.021"
syn_tco241 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[18] = 0.983"
syn_tco242 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[19] = 1.008"
syn_tco243 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[1] = 0.990"
syn_tco244 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[20] = 1.028"
syn_tco245 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[21] = 1.003"
syn_tco246 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[22] = 1.014"
syn_tco247 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[23] = 0.989"
syn_tco248 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[24] = 1.014"
syn_tco249 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[25] = 0.992"
syn_tco250 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[26] = 0.967"
syn_tco251 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[27] = 1.002"
syn_tco252 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[28] = 0.992"
syn_tco253 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[29] = 1.000"
syn_tco254 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[2] = 1.012"
syn_tco255 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[30] = 1.004"
syn_tco256 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[31] = 1.006"
syn_tco257 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[32] = 1.019"
syn_tco258 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[33] = 0.985"
syn_tco259 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[34] = 1.004"
syn_tco260 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[35] = 1.024"
syn_tco261 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[36] = 0.963"
syn_tco262 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[37] = 1.015"
syn_tco263 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[3] = 1.001"
syn_tco264 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[4] = 1.013"
syn_tco265 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[5] = 1.022"
syn_tco266 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[6] = 1.006"
syn_tco267 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[7] = 1.035"
syn_tco268 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[8] = 1.024"
syn_tco269 = " FIC_0_ACLK->FIC_0_AXI4_M_AWADDR[9] = 1.049"
syn_tco270 = " FIC_0_ACLK->FIC_0_AXI4_M_AWBURST[0] = 1.030"
syn_tco271 = " FIC_0_ACLK->FIC_0_AXI4_M_AWBURST[1] = 0.983"
syn_tco272 = " FIC_0_ACLK->FIC_0_AXI4_M_AWCACHE[0] = 0.930"
syn_tco273 = " FIC_0_ACLK->FIC_0_AXI4_M_AWCACHE[1] = 0.992"
syn_tco274 = " FIC_0_ACLK->FIC_0_AXI4_M_AWCACHE[2] = 0.985"
syn_tco275 = " FIC_0_ACLK->FIC_0_AXI4_M_AWCACHE[3] = 0.981"
syn_tco276 = " FIC_0_ACLK->FIC_0_AXI4_M_AWID[0] = 1.041"
syn_tco277 = " FIC_0_ACLK->FIC_0_AXI4_M_AWID[1] = 1.007"
syn_tco278 = " FIC_0_ACLK->FIC_0_AXI4_M_AWID[2] = 1.008"
syn_tco279 = " FIC_0_ACLK->FIC_0_AXI4_M_AWID[3] = 0.995"
syn_tco280 = " FIC_0_ACLK->FIC_0_AXI4_M_AWID[4] = 0.994"
syn_tco281 = " FIC_0_ACLK->FIC_0_AXI4_M_AWID[5] = 1.027"
syn_tco282 = " FIC_0_ACLK->FIC_0_AXI4_M_AWID[6] = 0.974"
syn_tco283 = " FIC_0_ACLK->FIC_0_AXI4_M_AWID[7] = 0.967"
syn_tco284 = " FIC_0_ACLK->FIC_0_AXI4_M_AWLEN[0] = 1.014"
syn_tco285 = " FIC_0_ACLK->FIC_0_AXI4_M_AWLEN[1] = 1.023"
syn_tco286 = " FIC_0_ACLK->FIC_0_AXI4_M_AWLEN[2] = 1.028"
syn_tco287 = " FIC_0_ACLK->FIC_0_AXI4_M_AWLEN[3] = 1.086"
syn_tco288 = " FIC_0_ACLK->FIC_0_AXI4_M_AWLEN[4] = 1.036"
syn_tco289 = " FIC_0_ACLK->FIC_0_AXI4_M_AWLEN[5] = 1.033"
syn_tco290 = " FIC_0_ACLK->FIC_0_AXI4_M_AWLEN[6] = 0.989"
syn_tco291 = " FIC_0_ACLK->FIC_0_AXI4_M_AWLEN[7] = 1.032"
syn_tco292 = " FIC_0_ACLK->FIC_0_AXI4_M_AWLOCK = 0.953"
syn_tco293 = " FIC_0_ACLK->FIC_0_AXI4_M_AWPROT[0] = 0.994"
syn_tco294 = " FIC_0_ACLK->FIC_0_AXI4_M_AWPROT[1] = 0.993"
syn_tco295 = " FIC_0_ACLK->FIC_0_AXI4_M_AWPROT[2] = 0.998"
syn_tco296 = " FIC_0_ACLK->FIC_0_AXI4_M_AWQOS[0] = 0.999"
syn_tco297 = " FIC_0_ACLK->FIC_0_AXI4_M_AWQOS[1] = 0.966"
syn_tco298 = " FIC_0_ACLK->FIC_0_AXI4_M_AWQOS[2] = 1.005"
syn_tco299 = " FIC_0_ACLK->FIC_0_AXI4_M_AWQOS[3] = 0.990"
syn_tco300 = " FIC_0_ACLK->FIC_0_AXI4_M_AWSIZE[0] = 1.045"
syn_tco301 = " FIC_0_ACLK->FIC_0_AXI4_M_AWSIZE[1] = 1.074"
syn_tco302 = " FIC_0_ACLK->FIC_0_AXI4_M_AWSIZE[2] = 1.052"
syn_tco303 = " FIC_0_ACLK->FIC_0_AXI4_M_AWVALID = 0.579"
syn_tco304 = " FIC_0_ACLK->FIC_0_AXI4_M_BREADY = 0.734"
syn_tco305 = " FIC_0_ACLK->FIC_0_AXI4_M_RREADY = 0.599"
syn_tco306 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[0] = 1.008"
syn_tco307 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[10] = 1.004"
syn_tco308 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[11] = 1.000"
syn_tco309 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[12] = 0.953"
syn_tco310 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[13] = 0.962"
syn_tco311 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[14] = 1.006"
syn_tco312 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[15] = 0.990"
syn_tco313 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[16] = 0.975"
syn_tco314 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[17] = 0.999"
syn_tco315 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[18] = 0.990"
syn_tco316 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[19] = 0.988"
syn_tco317 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[1] = 0.999"
syn_tco318 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[20] = 0.998"
syn_tco319 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[21] = 0.982"
syn_tco320 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[22] = 0.999"
syn_tco321 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[23] = 0.989"
syn_tco322 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[24] = 0.971"
syn_tco323 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[25] = 0.993"
syn_tco324 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[26] = 0.981"
syn_tco325 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[27] = 0.997"
syn_tco326 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[28] = 0.989"
syn_tco327 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[29] = 0.996"
syn_tco328 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[2] = 0.976"
syn_tco329 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[30] = 0.990"
syn_tco330 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[31] = 1.000"
syn_tco331 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[32] = 0.998"
syn_tco332 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[33] = 0.973"
syn_tco333 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[34] = 0.995"
syn_tco334 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[35] = 0.990"
syn_tco335 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[36] = 1.016"
syn_tco336 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[37] = 0.999"
syn_tco337 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[38] = 1.006"
syn_tco338 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[39] = 0.968"
syn_tco339 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[3] = 0.993"
syn_tco340 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[40] = 1.014"
syn_tco341 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[41] = 0.994"
syn_tco342 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[42] = 1.040"
syn_tco343 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[43] = 1.011"
syn_tco344 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[44] = 1.044"
syn_tco345 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[45] = 1.026"
syn_tco346 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[46] = 0.975"
syn_tco347 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[47] = 0.992"
syn_tco348 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[48] = 0.999"
syn_tco349 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[49] = 1.012"
syn_tco350 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[4] = 0.987"
syn_tco351 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[50] = 1.011"
syn_tco352 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[51] = 1.006"
syn_tco353 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[52] = 1.019"
syn_tco354 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[53] = 1.009"
syn_tco355 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[54] = 0.976"
syn_tco356 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[55] = 1.001"
syn_tco357 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[56] = 1.052"
syn_tco358 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[57] = 1.014"
syn_tco359 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[58] = 0.997"
syn_tco360 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[59] = 0.988"
syn_tco361 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[5] = 0.982"
syn_tco362 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[60] = 0.997"
syn_tco363 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[61] = 0.976"
syn_tco364 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[62] = 0.955"
syn_tco365 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[63] = 0.941"
syn_tco366 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[6] = 0.978"
syn_tco367 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[7] = 0.975"
syn_tco368 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[8] = 0.990"
syn_tco369 = " FIC_0_ACLK->FIC_0_AXI4_M_WDATA[9] = 0.970"
syn_tco370 = " FIC_0_ACLK->FIC_0_AXI4_M_WLAST = 0.989"
syn_tco371 = " FIC_0_ACLK->FIC_0_AXI4_M_WSTRB[0] = 0.979"
syn_tco372 = " FIC_0_ACLK->FIC_0_AXI4_M_WSTRB[1] = 0.992"
syn_tco373 = " FIC_0_ACLK->FIC_0_AXI4_M_WSTRB[2] = 0.981"
syn_tco374 = " FIC_0_ACLK->FIC_0_AXI4_M_WSTRB[3] = 0.992"
syn_tco375 = " FIC_0_ACLK->FIC_0_AXI4_M_WSTRB[4] = 1.005"
syn_tco376 = " FIC_0_ACLK->FIC_0_AXI4_M_WSTRB[5] = 0.978"
syn_tco377 = " FIC_0_ACLK->FIC_0_AXI4_M_WSTRB[6] = 0.976"
syn_tco378 = " FIC_0_ACLK->FIC_0_AXI4_M_WSTRB[7] = 0.979"
syn_tco379 = " FIC_0_ACLK->FIC_0_AXI4_M_WVALID = 0.960"
syn_tco380 = " FIC_0_ACLK->FIC_0_AXI4_S_ARREADY = 0.920"
syn_tco381 = " FIC_0_ACLK->FIC_0_AXI4_S_AWREADY = 0.919"
syn_tco382 = " FIC_0_ACLK->FIC_0_AXI4_S_BID[0] = 0.986"
syn_tco383 = " FIC_0_ACLK->FIC_0_AXI4_S_BID[1] = 0.981"
syn_tco384 = " FIC_0_ACLK->FIC_0_AXI4_S_BID[2] = 0.988"
syn_tco385 = " FIC_0_ACLK->FIC_0_AXI4_S_BID[3] = 0.969"
syn_tco386 = " FIC_0_ACLK->FIC_0_AXI4_S_BRESP[0] = 1.035"
syn_tco387 = " FIC_0_ACLK->FIC_0_AXI4_S_BRESP[1] = 0.984"
syn_tco388 = " FIC_0_ACLK->FIC_0_AXI4_S_BVALID = 0.883"
syn_tco389 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[0] = 1.036"
syn_tco390 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[10] = 1.054"
syn_tco391 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[11] = 1.048"
syn_tco392 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[12] = 1.045"
syn_tco393 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[13] = 1.029"
syn_tco394 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[14] = 1.030"
syn_tco395 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[15] = 1.052"
syn_tco396 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[16] = 1.019"
syn_tco397 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[17] = 1.049"
syn_tco398 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[18] = 1.029"
syn_tco399 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[19] = 1.025"
syn_tco400 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[1] = 1.025"
syn_tco401 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[20] = 1.019"
syn_tco402 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[21] = 1.037"
syn_tco403 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[22] = 1.067"
syn_tco404 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[23] = 1.080"
syn_tco405 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[24] = 1.057"
syn_tco406 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[25] = 1.012"
syn_tco407 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[26] = 1.049"
syn_tco408 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[27] = 1.023"
syn_tco409 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[28] = 1.046"
syn_tco410 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[29] = 1.068"
syn_tco411 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[2] = 1.052"
syn_tco412 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[30] = 1.052"
syn_tco413 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[31] = 1.034"
syn_tco414 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[32] = 1.035"
syn_tco415 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[33] = 1.038"
syn_tco416 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[34] = 1.039"
syn_tco417 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[35] = 1.024"
syn_tco418 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[36] = 1.033"
syn_tco419 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[37] = 1.051"
syn_tco420 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[38] = 1.037"
syn_tco421 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[39] = 1.031"
syn_tco422 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[3] = 1.036"
syn_tco423 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[40] = 1.003"
syn_tco424 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[41] = 0.998"
syn_tco425 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[42] = 1.002"
syn_tco426 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[43] = 0.998"
syn_tco427 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[44] = 1.031"
syn_tco428 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[45] = 1.051"
syn_tco429 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[46] = 1.022"
syn_tco430 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[47] = 1.027"
syn_tco431 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[48] = 1.083"
syn_tco432 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[49] = 1.031"
syn_tco433 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[4] = 1.036"
syn_tco434 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[50] = 1.031"
syn_tco435 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[51] = 1.060"
syn_tco436 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[52] = 1.000"
syn_tco437 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[53] = 1.000"
syn_tco438 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[54] = 1.000"
syn_tco439 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[55] = 1.009"
syn_tco440 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[56] = 1.001"
syn_tco441 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[57] = 1.026"
syn_tco442 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[58] = 1.029"
syn_tco443 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[59] = 1.038"
syn_tco444 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[5] = 1.033"
syn_tco445 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[60] = 1.041"
syn_tco446 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[61] = 1.040"
syn_tco447 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[62] = 1.027"
syn_tco448 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[63] = 1.012"
syn_tco449 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[6] = 1.055"
syn_tco450 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[7] = 1.084"
syn_tco451 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[8] = 1.023"
syn_tco452 = " FIC_0_ACLK->FIC_0_AXI4_S_RDATA[9] = 1.049"
syn_tco453 = " FIC_0_ACLK->FIC_0_AXI4_S_RID[0] = 1.016"
syn_tco454 = " FIC_0_ACLK->FIC_0_AXI4_S_RID[1] = 1.010"
syn_tco455 = " FIC_0_ACLK->FIC_0_AXI4_S_RID[2] = 1.021"
syn_tco456 = " FIC_0_ACLK->FIC_0_AXI4_S_RID[3] = 1.066"
syn_tco457 = " FIC_0_ACLK->FIC_0_AXI4_S_RLAST = 1.023"
syn_tco458 = " FIC_0_ACLK->FIC_0_AXI4_S_RRESP[0] = 1.058"
syn_tco459 = " FIC_0_ACLK->FIC_0_AXI4_S_RRESP[1] = 1.049"
syn_tco460 = " FIC_0_ACLK->FIC_0_AXI4_S_RVALID = 0.935"
syn_tco461 = " FIC_0_ACLK->FIC_0_AXI4_S_WREADY = 0.927"
syn_tco462 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[0] = 1.007"
syn_tco463 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[10] = 0.988"
syn_tco464 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[11] = 1.006"
syn_tco465 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[12] = 0.992"
syn_tco466 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[13] = 1.004"
syn_tco467 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[14] = 0.993"
syn_tco468 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[15] = 1.003"
syn_tco469 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[16] = 1.010"
syn_tco470 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[17] = 1.010"
syn_tco471 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[18] = 0.962"
syn_tco472 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[19] = 0.953"
syn_tco473 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[1] = 1.061"
syn_tco474 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[20] = 0.947"
syn_tco475 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[21] = 1.027"
syn_tco476 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[22] = 0.963"
syn_tco477 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[23] = 1.013"
syn_tco478 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[24] = 1.036"
syn_tco479 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[25] = 0.982"
syn_tco480 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[26] = 1.003"
syn_tco481 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[27] = 1.060"
syn_tco482 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[28] = 0.938"
syn_tco483 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[29] = 0.972"
syn_tco484 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[2] = 0.930"
syn_tco485 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[30] = 1.016"
syn_tco486 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[31] = 0.975"
syn_tco487 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[32] = 1.000"
syn_tco488 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[33] = 1.040"
syn_tco489 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[34] = 0.998"
syn_tco490 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[35] = 1.027"
syn_tco491 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[36] = 1.033"
syn_tco492 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[37] = 0.938"
syn_tco493 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[3] = 1.053"
syn_tco494 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[4] = 1.028"
syn_tco495 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[5] = 0.956"
syn_tco496 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[6] = 0.973"
syn_tco497 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[7] = 0.956"
syn_tco498 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[8] = 0.962"
syn_tco499 = " FIC_1_ACLK->FIC_1_AXI4_M_ARADDR[9] = 0.958"
syn_tco500 = " FIC_1_ACLK->FIC_1_AXI4_M_ARBURST[0] = 0.914"
syn_tco501 = " FIC_1_ACLK->FIC_1_AXI4_M_ARBURST[1] = 0.923"
syn_tco502 = " FIC_1_ACLK->FIC_1_AXI4_M_ARCACHE[0] = 1.024"
syn_tco503 = " FIC_1_ACLK->FIC_1_AXI4_M_ARCACHE[1] = 0.914"
syn_tco504 = " FIC_1_ACLK->FIC_1_AXI4_M_ARCACHE[2] = 0.936"
syn_tco505 = " FIC_1_ACLK->FIC_1_AXI4_M_ARCACHE[3] = 0.898"
syn_tco506 = " FIC_1_ACLK->FIC_1_AXI4_M_ARID[0] = 0.957"
syn_tco507 = " FIC_1_ACLK->FIC_1_AXI4_M_ARID[1] = 1.024"
syn_tco508 = " FIC_1_ACLK->FIC_1_AXI4_M_ARID[2] = 1.022"
syn_tco509 = " FIC_1_ACLK->FIC_1_AXI4_M_ARID[3] = 0.958"
syn_tco510 = " FIC_1_ACLK->FIC_1_AXI4_M_ARID[4] = 0.915"
syn_tco511 = " FIC_1_ACLK->FIC_1_AXI4_M_ARID[5] = 0.927"
syn_tco512 = " FIC_1_ACLK->FIC_1_AXI4_M_ARID[6] = 0.921"
syn_tco513 = " FIC_1_ACLK->FIC_1_AXI4_M_ARID[7] = 0.925"
syn_tco514 = " FIC_1_ACLK->FIC_1_AXI4_M_ARLEN[0] = 0.978"
syn_tco515 = " FIC_1_ACLK->FIC_1_AXI4_M_ARLEN[1] = 0.970"
syn_tco516 = " FIC_1_ACLK->FIC_1_AXI4_M_ARLEN[2] = 0.976"
syn_tco517 = " FIC_1_ACLK->FIC_1_AXI4_M_ARLEN[3] = 0.934"
syn_tco518 = " FIC_1_ACLK->FIC_1_AXI4_M_ARLEN[4] = 0.903"
syn_tco519 = " FIC_1_ACLK->FIC_1_AXI4_M_ARLEN[5] = 1.009"
syn_tco520 = " FIC_1_ACLK->FIC_1_AXI4_M_ARLEN[6] = 0.999"
syn_tco521 = " FIC_1_ACLK->FIC_1_AXI4_M_ARLEN[7] = 1.057"
syn_tco522 = " FIC_1_ACLK->FIC_1_AXI4_M_ARLOCK = 0.944"
syn_tco523 = " FIC_1_ACLK->FIC_1_AXI4_M_ARPROT[0] = 0.938"
syn_tco524 = " FIC_1_ACLK->FIC_1_AXI4_M_ARPROT[1] = 0.983"
syn_tco525 = " FIC_1_ACLK->FIC_1_AXI4_M_ARPROT[2] = 0.936"
syn_tco526 = " FIC_1_ACLK->FIC_1_AXI4_M_ARQOS[0] = 0.922"
syn_tco527 = " FIC_1_ACLK->FIC_1_AXI4_M_ARQOS[1] = 0.922"
syn_tco528 = " FIC_1_ACLK->FIC_1_AXI4_M_ARQOS[2] = 0.917"
syn_tco529 = " FIC_1_ACLK->FIC_1_AXI4_M_ARQOS[3] = 0.956"
syn_tco530 = " FIC_1_ACLK->FIC_1_AXI4_M_ARSIZE[0] = 0.938"
syn_tco531 = " FIC_1_ACLK->FIC_1_AXI4_M_ARSIZE[1] = 0.939"
syn_tco532 = " FIC_1_ACLK->FIC_1_AXI4_M_ARSIZE[2] = 0.939"
syn_tco533 = " FIC_1_ACLK->FIC_1_AXI4_M_ARVALID = 0.661"
syn_tco534 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[0] = 0.956"
syn_tco535 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[10] = 0.909"
syn_tco536 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[11] = 0.943"
syn_tco537 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[12] = 0.949"
syn_tco538 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[13] = 0.883"
syn_tco539 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[14] = 0.945"
syn_tco540 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[15] = 0.768"
syn_tco541 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[16] = 0.933"
syn_tco542 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[17] = 0.970"
syn_tco543 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[18] = 0.954"
syn_tco544 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[19] = 0.958"
syn_tco545 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[1] = 0.967"
syn_tco546 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[20] = 0.933"
syn_tco547 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[21] = 0.938"
syn_tco548 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[22] = 0.931"
syn_tco549 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[23] = 0.970"
syn_tco550 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[24] = 0.955"
syn_tco551 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[25] = 0.948"
syn_tco552 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[26] = 1.057"
syn_tco553 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[27] = 0.899"
syn_tco554 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[28] = 1.085"
syn_tco555 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[29] = 0.993"
syn_tco556 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[2] = 1.003"
syn_tco557 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[30] = 0.955"
syn_tco558 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[31] = 0.930"
syn_tco559 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[32] = 0.920"
syn_tco560 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[33] = 0.890"
syn_tco561 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[34] = 0.920"
syn_tco562 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[35] = 0.936"
syn_tco563 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[36] = 0.950"
syn_tco564 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[37] = 0.909"
syn_tco565 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[3] = 0.906"
syn_tco566 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[4] = 0.944"
syn_tco567 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[5] = 0.946"
syn_tco568 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[6] = 0.904"
syn_tco569 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[7] = 0.901"
syn_tco570 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[8] = 0.994"
syn_tco571 = " FIC_1_ACLK->FIC_1_AXI4_M_AWADDR[9] = 0.989"
syn_tco572 = " FIC_1_ACLK->FIC_1_AXI4_M_AWBURST[0] = 0.912"
syn_tco573 = " FIC_1_ACLK->FIC_1_AXI4_M_AWBURST[1] = 0.916"
syn_tco574 = " FIC_1_ACLK->FIC_1_AXI4_M_AWCACHE[0] = 1.015"
syn_tco575 = " FIC_1_ACLK->FIC_1_AXI4_M_AWCACHE[1] = 1.014"
syn_tco576 = " FIC_1_ACLK->FIC_1_AXI4_M_AWCACHE[2] = 1.017"
syn_tco577 = " FIC_1_ACLK->FIC_1_AXI4_M_AWCACHE[3] = 1.019"
syn_tco578 = " FIC_1_ACLK->FIC_1_AXI4_M_AWID[0] = 0.969"
syn_tco579 = " FIC_1_ACLK->FIC_1_AXI4_M_AWID[1] = 1.011"
syn_tco580 = " FIC_1_ACLK->FIC_1_AXI4_M_AWID[2] = 1.030"
syn_tco581 = " FIC_1_ACLK->FIC_1_AXI4_M_AWID[3] = 1.025"
syn_tco582 = " FIC_1_ACLK->FIC_1_AXI4_M_AWID[4] = 0.999"
syn_tco583 = " FIC_1_ACLK->FIC_1_AXI4_M_AWID[5] = 1.001"
syn_tco584 = " FIC_1_ACLK->FIC_1_AXI4_M_AWID[6] = 1.015"
syn_tco585 = " FIC_1_ACLK->FIC_1_AXI4_M_AWID[7] = 0.972"
syn_tco586 = " FIC_1_ACLK->FIC_1_AXI4_M_AWLEN[0] = 1.004"
syn_tco587 = " FIC_1_ACLK->FIC_1_AXI4_M_AWLEN[1] = 0.994"
syn_tco588 = " FIC_1_ACLK->FIC_1_AXI4_M_AWLEN[2] = 1.010"
syn_tco589 = " FIC_1_ACLK->FIC_1_AXI4_M_AWLEN[3] = 1.000"
syn_tco590 = " FIC_1_ACLK->FIC_1_AXI4_M_AWLEN[4] = 1.010"
syn_tco591 = " FIC_1_ACLK->FIC_1_AXI4_M_AWLEN[5] = 0.996"
syn_tco592 = " FIC_1_ACLK->FIC_1_AXI4_M_AWLEN[6] = 1.024"
syn_tco593 = " FIC_1_ACLK->FIC_1_AXI4_M_AWLEN[7] = 1.013"
syn_tco594 = " FIC_1_ACLK->FIC_1_AXI4_M_AWLOCK = 1.009"
syn_tco595 = " FIC_1_ACLK->FIC_1_AXI4_M_AWPROT[0] = 0.999"
syn_tco596 = " FIC_1_ACLK->FIC_1_AXI4_M_AWPROT[1] = 0.998"
syn_tco597 = " FIC_1_ACLK->FIC_1_AXI4_M_AWPROT[2] = 1.003"
syn_tco598 = " FIC_1_ACLK->FIC_1_AXI4_M_AWQOS[0] = 0.973"
syn_tco599 = " FIC_1_ACLK->FIC_1_AXI4_M_AWQOS[1] = 1.010"
syn_tco600 = " FIC_1_ACLK->FIC_1_AXI4_M_AWQOS[2] = 1.027"
syn_tco601 = " FIC_1_ACLK->FIC_1_AXI4_M_AWQOS[3] = 0.960"
syn_tco602 = " FIC_1_ACLK->FIC_1_AXI4_M_AWSIZE[0] = 1.000"
syn_tco603 = " FIC_1_ACLK->FIC_1_AXI4_M_AWSIZE[1] = 0.988"
syn_tco604 = " FIC_1_ACLK->FIC_1_AXI4_M_AWSIZE[2] = 0.986"
syn_tco605 = " FIC_1_ACLK->FIC_1_AXI4_M_AWVALID = 0.502"
syn_tco606 = " FIC_1_ACLK->FIC_1_AXI4_M_BREADY = 0.672"
syn_tco607 = " FIC_1_ACLK->FIC_1_AXI4_M_RREADY = 0.659"
syn_tco608 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[0] = 0.953"
syn_tco609 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[10] = 0.896"
syn_tco610 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[11] = 0.935"
syn_tco611 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[12] = 0.926"
syn_tco612 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[13] = 0.925"
syn_tco613 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[14] = 0.931"
syn_tco614 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[15] = 0.935"
syn_tco615 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[16] = 0.930"
syn_tco616 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[17] = 0.939"
syn_tco617 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[18] = 0.944"
syn_tco618 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[19] = 0.954"
syn_tco619 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[1] = 0.950"
syn_tco620 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[20] = 0.946"
syn_tco621 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[21] = 0.921"
syn_tco622 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[22] = 0.925"
syn_tco623 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[23] = 0.943"
syn_tco624 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[24] = 0.930"
syn_tco625 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[25] = 0.918"
syn_tco626 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[26] = 0.947"
syn_tco627 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[27] = 0.940"
syn_tco628 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[28] = 0.942"
syn_tco629 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[29] = 0.947"
syn_tco630 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[2] = 0.939"
syn_tco631 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[30] = 0.939"
syn_tco632 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[31] = 0.953"
syn_tco633 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[32] = 0.941"
syn_tco634 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[33] = 0.925"
syn_tco635 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[34] = 0.949"
syn_tco636 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[35] = 0.939"
syn_tco637 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[36] = 0.945"
syn_tco638 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[37] = 0.919"
syn_tco639 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[38] = 0.942"
syn_tco640 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[39] = 0.950"
syn_tco641 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[3] = 0.933"
syn_tco642 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[40] = 0.966"
syn_tco643 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[41] = 0.946"
syn_tco644 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[42] = 0.933"
syn_tco645 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[43] = 0.945"
syn_tco646 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[44] = 0.926"
syn_tco647 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[45] = 0.931"
syn_tco648 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[46] = 0.930"
syn_tco649 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[47] = 0.940"
syn_tco650 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[48] = 0.928"
syn_tco651 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[49] = 0.919"
syn_tco652 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[4] = 0.965"
syn_tco653 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[50] = 0.926"
syn_tco654 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[51] = 0.937"
syn_tco655 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[52] = 0.941"
syn_tco656 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[53] = 0.937"
syn_tco657 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[54] = 0.957"
syn_tco658 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[55] = 0.943"
syn_tco659 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[56] = 0.945"
syn_tco660 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[57] = 0.944"
syn_tco661 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[58] = 0.945"
syn_tco662 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[59] = 0.941"
syn_tco663 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[5] = 0.941"
syn_tco664 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[60] = 0.948"
syn_tco665 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[61] = 0.922"
syn_tco666 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[62] = 0.926"
syn_tco667 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[63] = 0.934"
syn_tco668 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[6] = 0.966"
syn_tco669 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[7] = 0.947"
syn_tco670 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[8] = 0.918"
syn_tco671 = " FIC_1_ACLK->FIC_1_AXI4_M_WDATA[9] = 0.953"
syn_tco672 = " FIC_1_ACLK->FIC_1_AXI4_M_WLAST = 0.933"
syn_tco673 = " FIC_1_ACLK->FIC_1_AXI4_M_WSTRB[0] = 0.936"
syn_tco674 = " FIC_1_ACLK->FIC_1_AXI4_M_WSTRB[1] = 0.929"
syn_tco675 = " FIC_1_ACLK->FIC_1_AXI4_M_WSTRB[2] = 0.938"
syn_tco676 = " FIC_1_ACLK->FIC_1_AXI4_M_WSTRB[3] = 0.938"
syn_tco677 = " FIC_1_ACLK->FIC_1_AXI4_M_WSTRB[4] = 0.944"
syn_tco678 = " FIC_1_ACLK->FIC_1_AXI4_M_WSTRB[5] = 0.939"
syn_tco679 = " FIC_1_ACLK->FIC_1_AXI4_M_WSTRB[6] = 0.954"
syn_tco680 = " FIC_1_ACLK->FIC_1_AXI4_M_WSTRB[7] = 0.940"
syn_tco681 = " FIC_1_ACLK->FIC_1_AXI4_M_WVALID = 0.599"
syn_tco682 = " FIC_1_ACLK->FIC_1_AXI4_S_ARREADY = 0.903"
syn_tco683 = " FIC_1_ACLK->FIC_1_AXI4_S_AWREADY = 0.953"
syn_tco684 = " FIC_1_ACLK->FIC_1_AXI4_S_BID[0] = 1.022"
syn_tco685 = " FIC_1_ACLK->FIC_1_AXI4_S_BID[1] = 0.968"
syn_tco686 = " FIC_1_ACLK->FIC_1_AXI4_S_BID[2] = 1.011"
syn_tco687 = " FIC_1_ACLK->FIC_1_AXI4_S_BID[3] = 0.959"
syn_tco688 = " FIC_1_ACLK->FIC_1_AXI4_S_BRESP[0] = 1.022"
syn_tco689 = " FIC_1_ACLK->FIC_1_AXI4_S_BRESP[1] = 1.016"
syn_tco690 = " FIC_1_ACLK->FIC_1_AXI4_S_BVALID = 0.871"
syn_tco691 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[0] = 0.990"
syn_tco692 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[10] = 1.017"
syn_tco693 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[11] = 0.967"
syn_tco694 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[12] = 0.972"
syn_tco695 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[13] = 0.996"
syn_tco696 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[14] = 1.040"
syn_tco697 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[15] = 0.973"
syn_tco698 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[16] = 0.997"
syn_tco699 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[17] = 0.999"
syn_tco700 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[18] = 0.988"
syn_tco701 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[19] = 1.022"
syn_tco702 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[1] = 0.994"
syn_tco703 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[20] = 0.938"
syn_tco704 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[21] = 0.970"
syn_tco705 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[22] = 0.988"
syn_tco706 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[23] = 0.985"
syn_tco707 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[24] = 0.969"
syn_tco708 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[25] = 0.995"
syn_tco709 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[26] = 0.980"
syn_tco710 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[27] = 0.999"
syn_tco711 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[28] = 0.986"
syn_tco712 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[29] = 0.941"
syn_tco713 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[2] = 1.011"
syn_tco714 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[30] = 0.967"
syn_tco715 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[31] = 0.924"
syn_tco716 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[32] = 0.947"
syn_tco717 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[33] = 1.001"
syn_tco718 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[34] = 0.941"
syn_tco719 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[35] = 0.928"
syn_tco720 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[36] = 0.976"
syn_tco721 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[37] = 0.980"
syn_tco722 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[38] = 1.006"
syn_tco723 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[39] = 0.974"
syn_tco724 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[3] = 0.996"
syn_tco725 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[40] = 1.004"
syn_tco726 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[41] = 1.003"
syn_tco727 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[42] = 0.995"
syn_tco728 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[43] = 1.038"
syn_tco729 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[44] = 0.941"
syn_tco730 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[45] = 0.968"
syn_tco731 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[46] = 0.962"
syn_tco732 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[47] = 0.962"
syn_tco733 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[48] = 1.004"
syn_tco734 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[49] = 0.975"
syn_tco735 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[4] = 0.966"
syn_tco736 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[50] = 0.965"
syn_tco737 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[51] = 0.963"
syn_tco738 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[52] = 0.949"
syn_tco739 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[53] = 0.936"
syn_tco740 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[54] = 0.986"
syn_tco741 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[55] = 0.997"
syn_tco742 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[56] = 0.979"
syn_tco743 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[57] = 0.943"
syn_tco744 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[58] = 1.000"
syn_tco745 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[59] = 1.024"
syn_tco746 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[5] = 1.001"
syn_tco747 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[60] = 1.014"
syn_tco748 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[61] = 0.990"
syn_tco749 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[62] = 1.004"
syn_tco750 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[63] = 0.988"
syn_tco751 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[6] = 0.945"
syn_tco752 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[7] = 0.952"
syn_tco753 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[8] = 0.947"
syn_tco754 = " FIC_1_ACLK->FIC_1_AXI4_S_RDATA[9] = 1.011"
syn_tco755 = " FIC_1_ACLK->FIC_1_AXI4_S_RID[0] = 0.948"
syn_tco756 = " FIC_1_ACLK->FIC_1_AXI4_S_RID[1] = 0.966"
syn_tco757 = " FIC_1_ACLK->FIC_1_AXI4_S_RID[2] = 0.947"
syn_tco758 = " FIC_1_ACLK->FIC_1_AXI4_S_RID[3] = 0.959"
syn_tco759 = " FIC_1_ACLK->FIC_1_AXI4_S_RLAST = 0.941"
syn_tco760 = " FIC_1_ACLK->FIC_1_AXI4_S_RRESP[0] = 1.008"
syn_tco761 = " FIC_1_ACLK->FIC_1_AXI4_S_RRESP[1] = 0.964"
syn_tco762 = " FIC_1_ACLK->FIC_1_AXI4_S_RVALID = 0.807"
syn_tco763 = " FIC_1_ACLK->FIC_1_AXI4_S_WREADY = 0.973"
syn_tco764 = " FIC_2_ACLK->FIC_2_AXI4_S_ARREADY = 0.878"
syn_tco765 = " FIC_2_ACLK->FIC_2_AXI4_S_AWREADY = 0.838"
syn_tco766 = " FIC_2_ACLK->FIC_2_AXI4_S_BID[0] = 0.791"
syn_tco767 = " FIC_2_ACLK->FIC_2_AXI4_S_BID[1] = 0.764"
syn_tco768 = " FIC_2_ACLK->FIC_2_AXI4_S_BID[2] = 0.762"
syn_tco769 = " FIC_2_ACLK->FIC_2_AXI4_S_BID[3] = 0.778"
syn_tco770 = " FIC_2_ACLK->FIC_2_AXI4_S_BRESP[0] = 0.757"
syn_tco771 = " FIC_2_ACLK->FIC_2_AXI4_S_BRESP[1] = 0.786"
syn_tco772 = " FIC_2_ACLK->FIC_2_AXI4_S_BVALID = 0.709"
syn_tco773 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[0] = 0.875"
syn_tco774 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[10] = 0.892"
syn_tco775 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[11] = 0.868"
syn_tco776 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[12] = 0.920"
syn_tco777 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[13] = 0.894"
syn_tco778 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[14] = 0.884"
syn_tco779 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[15] = 0.968"
syn_tco780 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[16] = 0.960"
syn_tco781 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[17] = 0.919"
syn_tco782 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[18] = 0.909"
syn_tco783 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[19] = 0.907"
syn_tco784 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[1] = 0.915"
syn_tco785 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[20] = 0.912"
syn_tco786 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[21] = 0.912"
syn_tco787 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[22] = 0.886"
syn_tco788 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[23] = 0.928"
syn_tco789 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[24] = 0.922"
syn_tco790 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[25] = 0.936"
syn_tco791 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[26] = 0.948"
syn_tco792 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[27] = 0.918"
syn_tco793 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[28] = 0.906"
syn_tco794 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[29] = 0.878"
syn_tco795 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[2] = 0.887"
syn_tco796 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[30] = 0.878"
syn_tco797 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[31] = 0.982"
syn_tco798 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[32] = 0.968"
syn_tco799 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[33] = 0.891"
syn_tco800 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[34] = 0.900"
syn_tco801 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[35] = 0.886"
syn_tco802 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[36] = 0.903"
syn_tco803 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[37] = 0.972"
syn_tco804 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[38] = 0.858"
syn_tco805 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[39] = 0.879"
syn_tco806 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[3] = 0.912"
syn_tco807 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[40] = 0.882"
syn_tco808 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[41] = 0.909"
syn_tco809 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[42] = 0.930"
syn_tco810 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[43] = 0.903"
syn_tco811 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[44] = 0.980"
syn_tco812 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[45] = 0.899"
syn_tco813 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[46] = 0.882"
syn_tco814 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[47] = 0.881"
syn_tco815 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[48] = 0.871"
syn_tco816 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[49] = 0.957"
syn_tco817 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[4] = 0.892"
syn_tco818 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[50] = 0.980"
syn_tco819 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[51] = 0.839"
syn_tco820 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[52] = 0.845"
syn_tco821 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[53] = 0.869"
syn_tco822 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[54] = 0.934"
syn_tco823 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[55] = 0.923"
syn_tco824 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[56] = 0.888"
syn_tco825 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[57] = 0.868"
syn_tco826 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[58] = 0.892"
syn_tco827 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[59] = 0.871"
syn_tco828 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[5] = 0.893"
syn_tco829 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[60] = 0.857"
syn_tco830 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[61] = 0.842"
syn_tco831 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[62] = 0.837"
syn_tco832 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[63] = 0.828"
syn_tco833 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[6] = 0.890"
syn_tco834 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[7] = 0.891"
syn_tco835 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[8] = 0.919"
syn_tco836 = " FIC_2_ACLK->FIC_2_AXI4_S_RDATA[9] = 0.920"
syn_tco837 = " FIC_2_ACLK->FIC_2_AXI4_S_RID[0] = 0.866"
syn_tco838 = " FIC_2_ACLK->FIC_2_AXI4_S_RID[1] = 0.869"
syn_tco839 = " FIC_2_ACLK->FIC_2_AXI4_S_RID[2] = 0.870"
syn_tco840 = " FIC_2_ACLK->FIC_2_AXI4_S_RID[3] = 0.891"
syn_tco841 = " FIC_2_ACLK->FIC_2_AXI4_S_RLAST = 0.881"
syn_tco842 = " FIC_2_ACLK->FIC_2_AXI4_S_RRESP[0] = 0.935"
syn_tco843 = " FIC_2_ACLK->FIC_2_AXI4_S_RRESP[1] = 0.919"
syn_tco844 = " FIC_2_ACLK->FIC_2_AXI4_S_RVALID = 0.549"
syn_tco845 = " FIC_2_ACLK->FIC_2_AXI4_S_WREADY = 0.819"
syn_tco846 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[10] = 1.005"
syn_tco847 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[11] = 0.985"
syn_tco848 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[12] = 1.002"
syn_tco849 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[13] = 0.952"
syn_tco850 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[14] = 0.926"
syn_tco851 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[15] = 0.977"
syn_tco852 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[16] = 1.016"
syn_tco853 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[17] = 1.018"
syn_tco854 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[18] = 0.992"
syn_tco855 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[19] = 1.019"
syn_tco856 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[20] = 0.940"
syn_tco857 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[21] = 0.977"
syn_tco858 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[22] = 1.001"
syn_tco859 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[23] = 0.973"
syn_tco860 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[24] = 1.028"
syn_tco861 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[25] = 1.012"
syn_tco862 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[26] = 0.995"
syn_tco863 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[27] = 0.977"
syn_tco864 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[28] = 1.002"
syn_tco865 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[2] = 1.011"
syn_tco866 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[3] = 0.998"
syn_tco867 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[4] = 1.002"
syn_tco868 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[5] = 1.001"
syn_tco869 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[6] = 1.019"
syn_tco870 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[7] = 0.984"
syn_tco871 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[8] = 0.928"
syn_tco872 = " FIC_3_PCLK->FIC_3_APB_M_PADDR[9] = 0.940"
syn_tco873 = " FIC_3_PCLK->FIC_3_APB_M_PENABLE = 0.848"
syn_tco874 = " FIC_3_PCLK->FIC_3_APB_M_PSEL = 0.828"
syn_tco875 = " FIC_3_PCLK->FIC_3_APB_M_PSTRB[0] = 1.006"
syn_tco876 = " FIC_3_PCLK->FIC_3_APB_M_PSTRB[1] = 0.901"
syn_tco877 = " FIC_3_PCLK->FIC_3_APB_M_PSTRB[2] = 0.933"
syn_tco878 = " FIC_3_PCLK->FIC_3_APB_M_PSTRB[3] = 0.987"
syn_tco879 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[0] = 0.726"
syn_tco880 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[10] = 0.740"
syn_tco881 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[11] = 0.721"
syn_tco882 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[12] = 0.760"
syn_tco883 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[13] = 0.773"
syn_tco884 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[14] = 0.752"
syn_tco885 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[15] = 0.740"
syn_tco886 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[16] = 0.770"
syn_tco887 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[17] = 0.739"
syn_tco888 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[18] = 0.737"
syn_tco889 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[19] = 0.799"
syn_tco890 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[1] = 0.740"
syn_tco891 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[20] = 0.723"
syn_tco892 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[21] = 0.989"
syn_tco893 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[22] = 0.968"
syn_tco894 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[23] = 0.959"
syn_tco895 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[24] = 0.983"
syn_tco896 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[25] = 0.912"
syn_tco897 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[26] = 0.960"
syn_tco898 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[27] = 0.955"
syn_tco899 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[28] = 0.931"
syn_tco900 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[29] = 0.994"
syn_tco901 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[2] = 0.744"
syn_tco902 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[30] = 0.838"
syn_tco903 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[31] = 0.951"
syn_tco904 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[3] = 0.723"
syn_tco905 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[4] = 0.747"
syn_tco906 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[5] = 0.744"
syn_tco907 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[6] = 0.755"
syn_tco908 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[7] = 0.739"
syn_tco909 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[8] = 0.742"
syn_tco910 = " FIC_3_PCLK->FIC_3_APB_M_PWDATA[9] = 0.756"
syn_tco911 = " FIC_3_PCLK->FIC_3_APB_M_PWRITE = 0.686"
syn_tco912 = " JTAG_TCK_F2M->JTAG_TDO_M2F = 4.607"
syn_tco913 = " JTAG_TCK_F2M->JTAG_TDO_OE_M2F = 4.693"
syn_tco914 = " JTAG_TCK_F2M->JTAG_TDO_M2F = 3.951"
syn_tco915 = " JTAG_TCK_F2M->JTAG_TDO_OE_M2F = 4.069"
syn_tco916 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[0] = 4.622"
syn_tco917 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[100] = 3.806"
syn_tco918 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[101] = 3.791"
syn_tco919 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[102] = 3.827"
syn_tco920 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[103] = 3.921"
syn_tco921 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[104] = 3.726"
syn_tco922 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[105] = 3.688"
syn_tco923 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[106] = 3.821"
syn_tco924 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[107] = 3.980"
syn_tco925 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[108] = 3.886"
syn_tco926 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[109] = 3.864"
syn_tco927 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[10] = 4.551"
syn_tco928 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[110] = 3.891"
syn_tco929 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[111] = 3.851"
syn_tco930 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[112] = 3.992"
syn_tco931 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[113] = 3.872"
syn_tco932 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[114] = 3.877"
syn_tco933 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[115] = 3.703"
syn_tco934 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[116] = 3.973"
syn_tco935 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[117] = 3.857"
syn_tco936 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[118] = 3.842"
syn_tco937 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[119] = 4.101"
syn_tco938 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[11] = 4.525"
syn_tco939 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[120] = 3.868"
syn_tco940 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[121] = 3.922"
syn_tco941 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[122] = 3.847"
syn_tco942 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[123] = 4.019"
syn_tco943 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[124] = 4.156"
syn_tco944 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[125] = 4.111"
syn_tco945 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[126] = 4.272"
syn_tco946 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[127] = 4.054"
syn_tco947 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[12] = 4.741"
syn_tco948 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[13] = 4.596"
syn_tco949 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[14] = 4.630"
syn_tco950 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[15] = 4.412"
syn_tco951 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[16] = 4.360"
syn_tco952 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[17] = 4.370"
syn_tco953 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[18] = 4.484"
syn_tco954 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[19] = 4.410"
syn_tco955 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[1] = 4.530"
syn_tco956 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[20] = 4.395"
syn_tco957 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[21] = 4.378"
syn_tco958 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[22] = 4.536"
syn_tco959 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[23] = 4.519"
syn_tco960 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[24] = 4.410"
syn_tco961 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[25] = 4.300"
syn_tco962 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[26] = 4.377"
syn_tco963 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[27] = 4.411"
syn_tco964 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[28] = 4.523"
syn_tco965 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[29] = 4.574"
syn_tco966 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[2] = 4.420"
syn_tco967 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[30] = 4.500"
syn_tco968 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[31] = 4.519"
syn_tco969 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[32] = 4.217"
syn_tco970 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[33] = 4.226"
syn_tco971 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[34] = 4.324"
syn_tco972 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[35] = 4.145"
syn_tco973 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[36] = 4.191"
syn_tco974 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[37] = 4.206"
syn_tco975 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[38] = 4.449"
syn_tco976 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[39] = 4.395"
syn_tco977 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[3] = 4.423"
syn_tco978 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[40] = 4.129"
syn_tco979 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[41] = 4.213"
syn_tco980 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[42] = 4.188"
syn_tco981 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[43] = 4.181"
syn_tco982 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[44] = 4.282"
syn_tco983 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[45] = 4.314"
syn_tco984 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[46] = 4.267"
syn_tco985 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[47] = 4.305"
syn_tco986 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[48] = 3.805"
syn_tco987 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[49] = 3.750"
syn_tco988 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[4] = 4.538"
syn_tco989 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[50] = 3.698"
syn_tco990 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[51] = 3.724"
syn_tco991 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[52] = 3.717"
syn_tco992 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[53] = 3.767"
syn_tco993 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[54] = 3.886"
syn_tco994 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[55] = 3.684"
syn_tco995 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[56] = 3.715"
syn_tco996 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[57] = 3.749"
syn_tco997 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[58] = 3.581"
syn_tco998 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[59] = 3.933"
syn_tco999 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[5] = 4.507"
syn_tco1000 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[60] = 3.660"
syn_tco1001 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[61] = 3.744"
syn_tco1002 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[62] = 3.736"
syn_tco1003 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[63] = 3.778"
syn_tco1004 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[64] = 3.894"
syn_tco1005 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[65] = 3.953"
syn_tco1006 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[66] = 3.920"
syn_tco1007 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[67] = 3.846"
syn_tco1008 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[68] = 3.932"
syn_tco1009 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[69] = 3.842"
syn_tco1010 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[6] = 4.581"
syn_tco1011 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[70] = 3.952"
syn_tco1012 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[71] = 3.882"
syn_tco1013 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[72] = 3.941"
syn_tco1014 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[73] = 3.938"
syn_tco1015 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[74] = 3.760"
syn_tco1016 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[75] = 3.880"
syn_tco1017 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[76] = 4.209"
syn_tco1018 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[77] = 4.174"
syn_tco1019 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[78] = 4.026"
syn_tco1020 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[79] = 4.095"
syn_tco1021 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[7] = 4.618"
syn_tco1022 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[80] = 4.031"
syn_tco1023 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[81] = 3.974"
syn_tco1024 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[82] = 3.913"
syn_tco1025 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[83] = 4.057"
syn_tco1026 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[84] = 4.026"
syn_tco1027 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[85] = 3.965"
syn_tco1028 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[86] = 4.010"
syn_tco1029 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[87] = 3.944"
syn_tco1030 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[88] = 3.937"
syn_tco1031 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[89] = 4.077"
syn_tco1032 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[8] = 4.571"
syn_tco1033 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[90] = 3.976"
syn_tco1034 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[91] = 4.087"
syn_tco1035 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[92] = 4.002"
syn_tco1036 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[93] = 4.008"
syn_tco1037 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[94] = 3.843"
syn_tco1038 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[95] = 4.148"
syn_tco1039 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[96] = 3.971"
syn_tco1040 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[97] = 3.860"
syn_tco1041 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[98] = 3.895"
syn_tco1042 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[99] = 3.887"
syn_tco1043 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DATA_M2F[9] = 4.642"
syn_tco1044 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DA_STB_M2F = 3.064"
syn_tco1045 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_DP_STB_M2F = 3.068"
syn_tco1046 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_IPV6_M2F = 3.101"
syn_tco1047 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_IP_DA_STB_M2F = 3.204"
syn_tco1048 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_IP_SA_STB_M2F = 3.086"
syn_tco1049 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_SA_STB_M2F = 3.160"
syn_tco1050 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_SP_STB_M2F = 3.155"
syn_tco1051 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_TYPE_STB_M2F = 3.156"
syn_tco1052 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_VLAN_TAG1_STB_M2F = 3.111"
syn_tco1053 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_FILTER_VLAN_TAG2_STB_M2F = 3.124"
syn_tco1054 = " MAC_0_GMII_MII_RX_CLK_F2M->MAC_0_WOL_M2F = 3.131"
syn_tco1055 = " MAC_0_GMII_MII_TX_CLK_F2M->MAC_0_GMII_MII_TXD_M2F[0] = 2.400"
syn_tco1056 = " MAC_0_GMII_MII_TX_CLK_F2M->MAC_0_GMII_MII_TXD_M2F[1] = 2.415"
syn_tco1057 = " MAC_0_GMII_MII_TX_CLK_F2M->MAC_0_GMII_MII_TXD_M2F[2] = 2.418"
syn_tco1058 = " MAC_0_GMII_MII_TX_CLK_F2M->MAC_0_GMII_MII_TXD_M2F[3] = 2.433"
syn_tco1059 = " MAC_0_GMII_MII_TX_CLK_F2M->MAC_0_GMII_MII_TXD_M2F[4] = 2.463"
syn_tco1060 = " MAC_0_GMII_MII_TX_CLK_F2M->MAC_0_GMII_MII_TXD_M2F[5] = 2.510"
syn_tco1061 = " MAC_0_GMII_MII_TX_CLK_F2M->MAC_0_GMII_MII_TXD_M2F[6] = 2.429"
syn_tco1062 = " MAC_0_GMII_MII_TX_CLK_F2M->MAC_0_GMII_MII_TXD_M2F[7] = 2.458"
syn_tco1063 = " MAC_0_GMII_MII_TX_CLK_F2M->MAC_0_GMII_MII_TX_EN_M2F = 2.456"
syn_tco1064 = " MAC_0_GMII_MII_TX_CLK_F2M->MAC_0_GMII_MII_TX_ER_M2F = 2.406"
syn_tco1065 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CMP_VAL_M2F = 3.072"
syn_tco1066 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[0] = 2.731"
syn_tco1067 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[10] = 2.902"
syn_tco1068 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[11] = 2.940"
syn_tco1069 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[12] = 3.062"
syn_tco1070 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[13] = 2.814"
syn_tco1071 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[14] = 2.636"
syn_tco1072 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[15] = 2.977"
syn_tco1073 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[16] = 2.758"
syn_tco1074 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[17] = 2.674"
syn_tco1075 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[18] = 2.826"
syn_tco1076 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[19] = 2.695"
syn_tco1077 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[1] = 2.882"
syn_tco1078 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[20] = 2.834"
syn_tco1079 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[21] = 2.826"
syn_tco1080 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[22] = 2.905"
syn_tco1081 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[23] = 2.811"
syn_tco1082 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[24] = 2.760"
syn_tco1083 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[25] = 2.897"
syn_tco1084 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[26] = 2.872"
syn_tco1085 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[27] = 2.893"
syn_tco1086 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[28] = 2.708"
syn_tco1087 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[29] = 2.692"
syn_tco1088 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[2] = 2.958"
syn_tco1089 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[30] = 2.787"
syn_tco1090 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[31] = 2.664"
syn_tco1091 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[32] = 2.905"
syn_tco1092 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[33] = 2.651"
syn_tco1093 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[34] = 2.730"
syn_tco1094 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[35] = 2.810"
syn_tco1095 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[36] = 2.642"
syn_tco1096 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[37] = 2.715"
syn_tco1097 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[38] = 2.515"
syn_tco1098 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[39] = 2.696"
syn_tco1099 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[3] = 2.681"
syn_tco1100 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[40] = 2.799"
syn_tco1101 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[41] = 2.790"
syn_tco1102 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[42] = 2.758"
syn_tco1103 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[43] = 2.967"
syn_tco1104 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[44] = 3.073"
syn_tco1105 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[45] = 2.966"
syn_tco1106 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[46] = 2.683"
syn_tco1107 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[47] = 2.827"
syn_tco1108 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[48] = 2.839"
syn_tco1109 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[49] = 2.704"
syn_tco1110 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[4] = 2.866"
syn_tco1111 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[50] = 2.865"
syn_tco1112 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[51] = 2.594"
syn_tco1113 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[52] = 2.861"
syn_tco1114 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[53] = 2.909"
syn_tco1115 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[54] = 2.935"
syn_tco1116 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[55] = 2.990"
syn_tco1117 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[56] = 2.921"
syn_tco1118 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[57] = 2.949"
syn_tco1119 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[58] = 2.927"
syn_tco1120 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[59] = 2.881"
syn_tco1121 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[5] = 2.911"
syn_tco1122 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[60] = 3.043"
syn_tco1123 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[61] = 3.155"
syn_tco1124 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[62] = 2.868"
syn_tco1125 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[63] = 2.981"
syn_tco1126 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[64] = 3.010"
syn_tco1127 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[65] = 2.767"
syn_tco1128 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[66] = 2.849"
syn_tco1129 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[67] = 2.984"
syn_tco1130 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[68] = 3.084"
syn_tco1131 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[69] = 2.987"
syn_tco1132 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[6] = 2.832"
syn_tco1133 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[70] = 2.934"
syn_tco1134 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[71] = 3.038"
syn_tco1135 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[72] = 2.994"
syn_tco1136 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[73] = 3.011"
syn_tco1137 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[74] = 2.918"
syn_tco1138 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[75] = 3.020"
syn_tco1139 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[76] = 2.798"
syn_tco1140 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[77] = 2.864"
syn_tco1141 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[78] = 2.945"
syn_tco1142 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[79] = 3.015"
syn_tco1143 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[7] = 2.838"
syn_tco1144 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[80] = 2.963"
syn_tco1145 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[81] = 2.958"
syn_tco1146 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[82] = 2.757"
syn_tco1147 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[83] = 2.829"
syn_tco1148 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[84] = 2.801"
syn_tco1149 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[85] = 2.862"
syn_tco1150 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[86] = 3.044"
syn_tco1151 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[87] = 2.752"
syn_tco1152 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[88] = 2.996"
syn_tco1153 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[89] = 2.900"
syn_tco1154 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[8] = 2.767"
syn_tco1155 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[90] = 3.013"
syn_tco1156 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[91] = 2.963"
syn_tco1157 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[92] = 2.798"
syn_tco1158 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[93] = 2.858"
syn_tco1159 = " MAC_0_TSU_CLK_F2M->MAC_0_TSU_TIMER_CNT_M2F[9] = 2.800"
syn_tco1160 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[0] = 4.718"
syn_tco1161 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[100] = 4.607"
syn_tco1162 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[101] = 4.683"
syn_tco1163 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[102] = 4.551"
syn_tco1164 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[103] = 4.517"
syn_tco1165 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[104] = 4.722"
syn_tco1166 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[105] = 4.476"
syn_tco1167 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[106] = 4.638"
syn_tco1168 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[107] = 4.700"
syn_tco1169 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[108] = 4.611"
syn_tco1170 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[109] = 4.570"
syn_tco1171 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[10] = 4.635"
syn_tco1172 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[110] = 4.634"
syn_tco1173 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[111] = 4.712"
syn_tco1174 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[112] = 4.573"
syn_tco1175 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[113] = 4.577"
syn_tco1176 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[114] = 4.583"
syn_tco1177 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[115] = 4.621"
syn_tco1178 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[116] = 4.674"
syn_tco1179 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[117] = 4.639"
syn_tco1180 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[118] = 4.638"
syn_tco1181 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[119] = 4.678"
syn_tco1182 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[11] = 4.627"
syn_tco1183 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[120] = 4.643"
syn_tco1184 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[121] = 4.447"
syn_tco1185 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[122] = 4.635"
syn_tco1186 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[123] = 4.388"
syn_tco1187 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[124] = 4.537"
syn_tco1188 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[125] = 4.521"
syn_tco1189 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[126] = 4.649"
syn_tco1190 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[127] = 4.713"
syn_tco1191 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[12] = 4.718"
syn_tco1192 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[13] = 4.590"
syn_tco1193 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[14] = 4.639"
syn_tco1194 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[15] = 4.723"
syn_tco1195 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[16] = 4.611"
syn_tco1196 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[17] = 4.722"
syn_tco1197 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[18] = 4.764"
syn_tco1198 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[19] = 4.611"
syn_tco1199 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[1] = 4.632"
syn_tco1200 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[20] = 4.734"
syn_tco1201 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[21] = 4.586"
syn_tco1202 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[22] = 4.713"
syn_tco1203 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[23] = 4.742"
syn_tco1204 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[24] = 4.620"
syn_tco1205 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[25] = 4.590"
syn_tco1206 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[26] = 4.714"
syn_tco1207 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[27] = 4.769"
syn_tco1208 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[28] = 4.625"
syn_tco1209 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[29] = 4.618"
syn_tco1210 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[2] = 4.780"
syn_tco1211 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[30] = 4.664"
syn_tco1212 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[31] = 4.677"
syn_tco1213 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[32] = 4.664"
syn_tco1214 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[33] = 4.613"
syn_tco1215 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[34] = 4.684"
syn_tco1216 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[35] = 4.604"
syn_tco1217 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[36] = 4.601"
syn_tco1218 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[37] = 4.565"
syn_tco1219 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[38] = 4.621"
syn_tco1220 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[39] = 4.543"
syn_tco1221 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[3] = 4.682"
syn_tco1222 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[40] = 4.597"
syn_tco1223 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[41] = 4.646"
syn_tco1224 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[42] = 4.561"
syn_tco1225 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[43] = 4.625"
syn_tco1226 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[44] = 4.565"
syn_tco1227 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[45] = 4.538"
syn_tco1228 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[46] = 4.614"
syn_tco1229 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[47] = 4.505"
syn_tco1230 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[48] = 4.727"
syn_tco1231 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[49] = 4.730"
syn_tco1232 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[4] = 4.773"
syn_tco1233 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[50] = 4.714"
syn_tco1234 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[51] = 4.643"
syn_tco1235 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[52] = 4.666"
syn_tco1236 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[53] = 4.698"
syn_tco1237 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[54] = 4.644"
syn_tco1238 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[55] = 4.541"
syn_tco1239 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[56] = 4.614"
syn_tco1240 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[57] = 4.542"
syn_tco1241 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[58] = 4.568"
syn_tco1242 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[59] = 4.623"
syn_tco1243 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[5] = 4.837"
syn_tco1244 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[60] = 4.593"
syn_tco1245 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[61] = 4.623"
syn_tco1246 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[62] = 4.671"
syn_tco1247 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[63] = 4.525"
syn_tco1248 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[64] = 4.727"
syn_tco1249 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[65] = 4.663"
syn_tco1250 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[66] = 4.708"
syn_tco1251 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[67] = 4.702"
syn_tco1252 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[68] = 4.602"
syn_tco1253 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[69] = 4.621"
syn_tco1254 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[6] = 4.663"
syn_tco1255 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[70] = 4.641"
syn_tco1256 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[71] = 4.734"
syn_tco1257 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[72] = 4.693"
syn_tco1258 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[73] = 4.699"
syn_tco1259 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[74] = 4.599"
syn_tco1260 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[75] = 4.633"
syn_tco1261 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[76] = 4.542"
syn_tco1262 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[77] = 4.603"
syn_tco1263 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[78] = 4.526"
syn_tco1264 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[79] = 4.579"
syn_tco1265 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[7] = 4.637"
syn_tco1266 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[80] = 4.501"
syn_tco1267 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[81] = 4.675"
syn_tco1268 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[82] = 4.502"
syn_tco1269 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[83] = 4.445"
syn_tco1270 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[84] = 4.572"
syn_tco1271 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[85] = 4.519"
syn_tco1272 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[86] = 4.567"
syn_tco1273 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[87] = 4.545"
syn_tco1274 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[88] = 4.592"
syn_tco1275 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[89] = 4.609"
syn_tco1276 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[8] = 4.635"
syn_tco1277 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[90] = 4.689"
syn_tco1278 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[91] = 4.414"
syn_tco1279 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[92] = 4.524"
syn_tco1280 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[93] = 4.768"
syn_tco1281 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[94] = 4.578"
syn_tco1282 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[95] = 4.653"
syn_tco1283 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[96] = 4.631"
syn_tco1284 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[97] = 4.516"
syn_tco1285 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[98] = 4.508"
syn_tco1286 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[99] = 4.638"
syn_tco1287 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DATA_M2F[9] = 4.618"
syn_tco1288 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DA_STB_M2F = 3.301"
syn_tco1289 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_DP_STB_M2F = 3.377"
syn_tco1290 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_IPV6_M2F = 3.186"
syn_tco1291 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_IP_DA_STB_M2F = 3.269"
syn_tco1292 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_IP_SA_STB_M2F = 3.270"
syn_tco1293 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_SA_STB_M2F = 3.304"
syn_tco1294 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_SP_STB_M2F = 3.162"
syn_tco1295 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_TYPE_STB_M2F = 3.277"
syn_tco1296 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_VLAN_TAG1_STB_M2F = 3.319"
syn_tco1297 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_FILTER_VLAN_TAG2_STB_M2F = 3.202"
syn_tco1298 = " MAC_1_GMII_MII_RX_CLK_F2M->MAC_1_WOL_M2F = 3.295"
syn_tco1299 = " MAC_1_GMII_MII_TX_CLK_F2M->MAC_1_GMII_MII_TXD_M2F[0] = 2.579"
syn_tco1300 = " MAC_1_GMII_MII_TX_CLK_F2M->MAC_1_GMII_MII_TXD_M2F[1] = 2.544"
syn_tco1301 = " MAC_1_GMII_MII_TX_CLK_F2M->MAC_1_GMII_MII_TXD_M2F[2] = 2.585"
syn_tco1302 = " MAC_1_GMII_MII_TX_CLK_F2M->MAC_1_GMII_MII_TXD_M2F[3] = 2.580"
syn_tco1303 = " MAC_1_GMII_MII_TX_CLK_F2M->MAC_1_GMII_MII_TXD_M2F[4] = 2.542"
syn_tco1304 = " MAC_1_GMII_MII_TX_CLK_F2M->MAC_1_GMII_MII_TXD_M2F[5] = 2.565"
syn_tco1305 = " MAC_1_GMII_MII_TX_CLK_F2M->MAC_1_GMII_MII_TXD_M2F[6] = 2.549"
syn_tco1306 = " MAC_1_GMII_MII_TX_CLK_F2M->MAC_1_GMII_MII_TXD_M2F[7] = 2.537"
syn_tco1307 = " MAC_1_GMII_MII_TX_CLK_F2M->MAC_1_GMII_MII_TX_EN_M2F = 2.566"
syn_tco1308 = " MAC_1_GMII_MII_TX_CLK_F2M->MAC_1_GMII_MII_TX_ER_M2F = 2.508"
syn_tco1309 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CMP_VAL_M2F = 3.761"
syn_tco1310 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[0] = 3.706"
syn_tco1311 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[10] = 3.671"
syn_tco1312 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[11] = 3.599"
syn_tco1313 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[12] = 3.730"
syn_tco1314 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[13] = 3.721"
syn_tco1315 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[14] = 3.544"
syn_tco1316 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[15] = 3.550"
syn_tco1317 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[16] = 3.523"
syn_tco1318 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[17] = 3.719"
syn_tco1319 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[18] = 3.611"
syn_tco1320 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[19] = 3.616"
syn_tco1321 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[1] = 3.650"
syn_tco1322 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[20] = 3.603"
syn_tco1323 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[21] = 3.570"
syn_tco1324 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[22] = 3.601"
syn_tco1325 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[23] = 3.595"
syn_tco1326 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[24] = 3.668"
syn_tco1327 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[25] = 3.536"
syn_tco1328 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[26] = 3.723"
syn_tco1329 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[27] = 3.763"
syn_tco1330 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[28] = 3.733"
syn_tco1331 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[29] = 3.540"
syn_tco1332 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[2] = 3.753"
syn_tco1333 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[30] = 3.759"
syn_tco1334 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[31] = 3.715"
syn_tco1335 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[32] = 3.643"
syn_tco1336 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[33] = 3.585"
syn_tco1337 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[34] = 3.661"
syn_tco1338 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[35] = 3.681"
syn_tco1339 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[36] = 3.663"
syn_tco1340 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[37] = 3.717"
syn_tco1341 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[38] = 3.757"
syn_tco1342 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[39] = 3.804"
syn_tco1343 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[3] = 3.620"
syn_tco1344 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[40] = 3.727"
syn_tco1345 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[41] = 3.823"
syn_tco1346 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[42] = 3.783"
syn_tco1347 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[43] = 3.723"
syn_tco1348 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[44] = 3.600"
syn_tco1349 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[45] = 3.823"
syn_tco1350 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[46] = 3.658"
syn_tco1351 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[47] = 3.754"
syn_tco1352 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[48] = 3.558"
syn_tco1353 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[49] = 3.621"
syn_tco1354 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[4] = 3.546"
syn_tco1355 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[50] = 3.747"
syn_tco1356 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[51] = 3.709"
syn_tco1357 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[52] = 3.939"
syn_tco1358 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[53] = 3.815"
syn_tco1359 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[54] = 3.825"
syn_tco1360 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[55] = 3.849"
syn_tco1361 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[56] = 3.663"
syn_tco1362 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[57] = 3.801"
syn_tco1363 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[58] = 3.712"
syn_tco1364 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[59] = 3.725"
syn_tco1365 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[5] = 3.299"
syn_tco1366 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[60] = 3.834"
syn_tco1367 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[61] = 3.874"
syn_tco1368 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[62] = 3.719"
syn_tco1369 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[63] = 3.701"
syn_tco1370 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[64] = 3.740"
syn_tco1371 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[65] = 3.618"
syn_tco1372 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[66] = 3.714"
syn_tco1373 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[67] = 3.627"
syn_tco1374 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[68] = 3.712"
syn_tco1375 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[69] = 3.816"
syn_tco1376 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[6] = 3.584"
syn_tco1377 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[70] = 3.767"
syn_tco1378 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[71] = 3.622"
syn_tco1379 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[72] = 3.901"
syn_tco1380 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[73] = 3.726"
syn_tco1381 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[74] = 3.625"
syn_tco1382 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[75] = 3.707"
syn_tco1383 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[76] = 3.676"
syn_tco1384 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[77] = 3.603"
syn_tco1385 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[78] = 3.738"
syn_tco1386 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[79] = 3.647"
syn_tco1387 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[7] = 3.662"
syn_tco1388 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[80] = 3.653"
syn_tco1389 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[81] = 3.553"
syn_tco1390 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[82] = 3.745"
syn_tco1391 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[83] = 3.612"
syn_tco1392 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[84] = 3.559"
syn_tco1393 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[85] = 3.502"
syn_tco1394 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[86] = 3.570"
syn_tco1395 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[87] = 3.566"
syn_tco1396 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[88] = 3.686"
syn_tco1397 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[89] = 3.700"
syn_tco1398 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[8] = 3.610"
syn_tco1399 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[90] = 3.616"
syn_tco1400 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[91] = 3.575"
syn_tco1401 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[92] = 3.840"
syn_tco1402 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[93] = 3.843"
syn_tco1403 = " MAC_1_TSU_CLK_F2M->MAC_1_TSU_TIMER_CNT_M2F[9] = 3.470"
syn_tpd1404 = " SPARE_1_F2M[0]->MSSIO0_OUT = 4.262"
syn_tpd1405 = " SPARE_1_F2M[10]->MSSIO10_OUT = 3.908"
syn_tpd1406 = " SPARE_1_F2M[11]->MSSIO11_OUT = 3.817"
syn_tpd1407 = " SPARE_1_F2M[12]->MSSIO12_OUT = 3.960"
syn_tpd1408 = " SPARE_1_F2M[13]->MSSIO13_OUT = 3.846"
syn_tpd1409 = " SPARE_1_F2M[14]->MSSIO14_OUT = 3.451"
syn_tpd1410 = " SPARE_1_F2M[15]->MSSIO15_OUT = 3.640"
syn_tpd1411 = " SPARE_1_F2M[16]->MSSIO16_OUT = 3.519"
syn_tpd1412 = " SPARE_1_F2M[17]->MSSIO17_OUT = 3.488"
syn_tpd1413 = " SPARE_1_F2M[18]->MSSIO18_OUT = 3.496"
syn_tpd1414 = " SPARE_1_F2M[19]->MSSIO19_OUT = 3.388"
syn_tpd1415 = " SPARE_1_F2M[1]->MSSIO1_OUT = 3.886"
syn_tpd1416 = " SPARE_1_F2M[20]->MSSIO20_OUT = 3.657"
syn_tpd1417 = " SPARE_1_F2M[21]->MSSIO21_OUT = 3.780"
syn_tpd1418 = " SPARE_1_F2M[22]->MSSIO22_OUT = 3.726"
syn_tpd1419 = " SPARE_1_F2M[23]->MSSIO23_OUT = 3.306"
syn_tpd1420 = " SPARE_1_F2M[24]->MSSIO24_OUT = 3.847"
syn_tpd1421 = " SPARE_1_F2M[25]->MSSIO25_OUT = 3.375"
syn_tpd1422 = " SPARE_1_F2M[26]->MSSIO26_OUT = 3.903"
syn_tpd1423 = " SPARE_1_F2M[27]->MSSIO27_OUT = 3.481"
syn_tpd1424 = " SPARE_1_F2M[28]->MSSIO28_OUT = 3.575"
syn_tpd1425 = " SPARE_1_F2M[29]->MSSIO29_OUT = 3.672"
syn_tpd1426 = " SPARE_1_F2M[2]->MSSIO2_OUT = 3.821"
syn_tpd1427 = " SPARE_1_F2M[30]->MSSIO30_OUT = 3.806"
syn_tpd1428 = " SPARE_1_F2M[31]->MSSIO31_OUT = 3.979"
syn_tpd1429 = " SPARE_1_F2M[32]->MSSIO32_OUT = 3.687"
syn_tpd1430 = " SPARE_1_F2M[33]->MSSIO33_OUT = 4.020"
syn_tpd1431 = " SPARE_1_F2M[34]->MSSIO34_OUT = 3.675"
syn_tpd1432 = " SPARE_1_F2M[35]->MSSIO35_OUT = 3.794"
syn_tpd1433 = " SPARE_1_F2M[36]->MSSIO36_OUT = 3.675"
syn_tpd1434 = " SPARE_1_F2M[37]->MSSIO37_OUT = 3.840"
syn_tpd1435 = " SPARE_1_F2M[3]->MSSIO3_OUT = 3.502"
syn_tpd1436 = " SPARE_1_F2M[4]->MSSIO4_OUT = 3.926"
syn_tpd1437 = " SPARE_1_F2M[5]->MSSIO5_OUT = 3.751"
syn_tpd1438 = " SPARE_1_F2M[6]->MSSIO6_OUT = 3.937"
syn_tpd1439 = " SPARE_1_F2M[7]->MSSIO7_OUT = 3.704"
syn_tpd1440 = " SPARE_1_F2M[8]->MSSIO8_OUT = 3.922"
syn_tpd1441 = " SPARE_1_F2M[9]->MSSIO9_OUT = 4.040"
syn_tpd1442 = " SPARE_2_F2M[0]->MSSIO0_OE = 4.107"
syn_tpd1443 = " SPARE_2_F2M[10]->MSSIO10_OE = 3.789"
syn_tpd1444 = " SPARE_2_F2M[11]->MSSIO11_OE = 3.780"
syn_tpd1445 = " SPARE_2_F2M[12]->MSSIO12_OE = 3.604"
syn_tpd1446 = " SPARE_2_F2M[13]->MSSIO13_OE = 3.926"
syn_tpd1447 = " SPARE_2_F2M[14]->MSSIO14_OE = 3.598"
syn_tpd1448 = " SPARE_2_F2M[15]->MSSIO15_OE = 3.500"
syn_tpd1449 = " SPARE_2_F2M[16]->MSSIO16_OE = 3.728"
syn_tpd1450 = " SPARE_2_F2M[17]->MSSIO17_OE = 3.880"
syn_tpd1451 = " SPARE_2_F2M[18]->MSSIO18_OE = 3.729"
syn_tpd1452 = " SPARE_2_F2M[19]->MSSIO19_OE = 3.569"
syn_tpd1453 = " SPARE_2_F2M[1]->MSSIO1_OE = 3.817"
syn_tpd1454 = " SPARE_2_F2M[20]->MSSIO20_OE = 3.631"
syn_tpd1455 = " SPARE_2_F2M[21]->MSSIO21_OE = 3.706"
syn_tpd1456 = " SPARE_2_F2M[22]->MSSIO22_OE = 4.140"
syn_tpd1457 = " SPARE_2_F2M[23]->MSSIO23_OE = 3.837"
syn_tpd1458 = " SPARE_2_F2M[24]->MSSIO24_OE = 3.688"
syn_tpd1459 = " SPARE_2_F2M[25]->MSSIO25_OE = 3.725"
syn_tpd1460 = " SPARE_2_F2M[26]->MSSIO26_OE = 3.739"
syn_tpd1461 = " SPARE_2_F2M[27]->MSSIO27_OE = 3.506"
syn_tpd1462 = " SPARE_2_F2M[28]->MSSIO28_OE = 3.773"
syn_tpd1463 = " SPARE_2_F2M[29]->MSSIO29_OE = 3.903"
syn_tpd1464 = " SPARE_2_F2M[2]->MSSIO2_OE = 4.160"
syn_tpd1465 = " SPARE_2_F2M[30]->MSSIO30_OE = 4.018"
syn_tpd1466 = " SPARE_2_F2M[31]->MSSIO31_OE = 4.121"
syn_tpd1467 = " SPARE_2_F2M[32]->MSSIO32_OE = 3.604"
syn_tpd1468 = " SPARE_2_F2M[33]->MSSIO33_OE = 3.954"
syn_tpd1469 = " SPARE_2_F2M[34]->MSSIO34_OE = 4.412"
syn_tpd1470 = " SPARE_2_F2M[35]->MSSIO35_OE = 3.926"
syn_tpd1471 = " SPARE_2_F2M[36]->MSSIO36_OE = 3.883"
syn_tpd1472 = " SPARE_2_F2M[37]->MSSIO37_OE = 4.353"
syn_tpd1473 = " SPARE_2_F2M[3]->MSSIO3_OE = 3.760"
syn_tpd1474 = " SPARE_2_F2M[4]->MSSIO4_OE = 4.186"
syn_tpd1475 = " SPARE_2_F2M[5]->MSSIO5_OE = 3.912"
syn_tpd1476 = " SPARE_2_F2M[6]->MSSIO6_OE = 4.126"
syn_tpd1477 = " SPARE_2_F2M[7]->MSSIO7_OE = 3.717"
syn_tpd1478 = " SPARE_2_F2M[8]->MSSIO8_OE = 3.845"
syn_tpd1479 = " SPARE_2_F2M[9]->MSSIO9_OE = 3.842"
syn_tpd1480 = " SPI_0_SS_F2M->SPI_0_DO_OE_M2F = 2.903"
syn_tpd1481 = " SPI_1_SS_F2M->SPI_1_DO_OE_M2F = 2.875"
*/
/* synthesis black_box_pad_pin ="" */
input  FIC_0_ACLK;
input  FIC_0_AXI4_M_AWREADY;
input  FIC_0_AXI4_M_WREADY;
input  [7:0] FIC_0_AXI4_M_BID;
input  [1:0] FIC_0_AXI4_M_BRESP;
input  FIC_0_AXI4_M_BVALID;
input  FIC_0_AXI4_M_ARREADY;
input  [7:0] FIC_0_AXI4_M_RID;
input  [63:0] FIC_0_AXI4_M_RDATA;
input  [1:0] FIC_0_AXI4_M_RRESP;
input  FIC_0_AXI4_M_RLAST;
input  FIC_0_AXI4_M_RVALID;
input  [3:0] FIC_0_AXI4_S_AWID;
input  [37:0] FIC_0_AXI4_S_AWADDR;
input  [7:0] FIC_0_AXI4_S_AWLEN;
input  [2:0] FIC_0_AXI4_S_AWSIZE;
input  [1:0] FIC_0_AXI4_S_AWBURST;
input  [3:0] FIC_0_AXI4_S_AWQOS;
input  FIC_0_AXI4_S_AWLOCK;
input  [3:0] FIC_0_AXI4_S_AWCACHE;
input  [2:0] FIC_0_AXI4_S_AWPROT;
input  FIC_0_AXI4_S_AWVALID;
input  [63:0] FIC_0_AXI4_S_WDATA;
input  [7:0] FIC_0_AXI4_S_WSTRB;
input  FIC_0_AXI4_S_WLAST;
input  FIC_0_AXI4_S_WVALID;
input  FIC_0_AXI4_S_BREADY;
input  [3:0] FIC_0_AXI4_S_ARID;
input  [37:0] FIC_0_AXI4_S_ARADDR;
input  [7:0] FIC_0_AXI4_S_ARLEN;
input  [2:0] FIC_0_AXI4_S_ARSIZE;
input  [1:0] FIC_0_AXI4_S_ARBURST;
input  [3:0] FIC_0_AXI4_S_ARQOS;
input  FIC_0_AXI4_S_ARLOCK;
input  [3:0] FIC_0_AXI4_S_ARCACHE;
input  [2:0] FIC_0_AXI4_S_ARPROT;
input  FIC_0_AXI4_S_ARVALID;
input  FIC_0_AXI4_S_RREADY;
input  FIC_1_ACLK;
input  FIC_1_AXI4_M_AWREADY;
input  FIC_1_AXI4_M_WREADY;
input  [7:0] FIC_1_AXI4_M_BID;
input  [1:0] FIC_1_AXI4_M_BRESP;
input  FIC_1_AXI4_M_BVALID;
input  FIC_1_AXI4_M_ARREADY;
input  [7:0] FIC_1_AXI4_M_RID;
input  [63:0] FIC_1_AXI4_M_RDATA;
input  [1:0] FIC_1_AXI4_M_RRESP;
input  FIC_1_AXI4_M_RLAST;
input  FIC_1_AXI4_M_RVALID;
input  [3:0] FIC_1_AXI4_S_AWID;
input  [37:0] FIC_1_AXI4_S_AWADDR;
input  [7:0] FIC_1_AXI4_S_AWLEN;
input  [2:0] FIC_1_AXI4_S_AWSIZE;
input  [1:0] FIC_1_AXI4_S_AWBURST;
input  FIC_1_AXI4_S_AWLOCK;
input  [3:0] FIC_1_AXI4_S_AWCACHE;
input  [3:0] FIC_1_AXI4_S_AWQOS;
input  [2:0] FIC_1_AXI4_S_AWPROT;
input  FIC_1_AXI4_S_AWVALID;
input  [63:0] FIC_1_AXI4_S_WDATA;
input  [7:0] FIC_1_AXI4_S_WSTRB;
input  FIC_1_AXI4_S_WLAST;
input  FIC_1_AXI4_S_WVALID;
input  FIC_1_AXI4_S_BREADY;
input  [3:0] FIC_1_AXI4_S_ARID;
input  [37:0] FIC_1_AXI4_S_ARADDR;
input  [7:0] FIC_1_AXI4_S_ARLEN;
input  [2:0] FIC_1_AXI4_S_ARSIZE;
input  [1:0] FIC_1_AXI4_S_ARBURST;
input  [3:0] FIC_1_AXI4_S_ARQOS;
input  FIC_1_AXI4_S_ARLOCK;
input  [3:0] FIC_1_AXI4_S_ARCACHE;
input  [2:0] FIC_1_AXI4_S_ARPROT;
input  FIC_1_AXI4_S_ARVALID;
input  FIC_1_AXI4_S_RREADY;
input  FIC_2_ACLK;
input  SPARE_3_F2M;
input  [3:0] FIC_2_AXI4_S_AWID;
input  [37:0] FIC_2_AXI4_S_AWADDR;
input  [7:0] FIC_2_AXI4_S_AWLEN;
input  [2:0] FIC_2_AXI4_S_AWSIZE;
input  [1:0] FIC_2_AXI4_S_AWBURST;
input  FIC_2_AXI4_S_AWLOCK;
input  [3:0] FIC_2_AXI4_S_AWCACHE;
input  [3:0] FIC_2_AXI4_S_AWQOS;
input  [2:0] FIC_2_AXI4_S_AWPROT;
input  FIC_2_AXI4_S_AWVALID;
input  [63:0] FIC_2_AXI4_S_WDATA;
input  [7:0] FIC_2_AXI4_S_WSTRB;
input  FIC_2_AXI4_S_WLAST;
input  FIC_2_AXI4_S_WVALID;
input  FIC_2_AXI4_S_BREADY;
input  [3:0] FIC_2_AXI4_S_ARID;
input  [37:0] FIC_2_AXI4_S_ARADDR;
input  [7:0] FIC_2_AXI4_S_ARLEN;
input  [2:0] FIC_2_AXI4_S_ARSIZE;
input  [1:0] FIC_2_AXI4_S_ARBURST;
input  FIC_2_AXI4_S_ARLOCK;
input  [3:0] FIC_2_AXI4_S_ARCACHE;
input  [3:0] FIC_2_AXI4_S_ARQOS;
input  [2:0] FIC_2_AXI4_S_ARPROT;
input  FIC_2_AXI4_S_ARVALID;
input  FIC_2_AXI4_S_RREADY;
input  FIC_3_PCLK;
input  SPARE_4_F2M;
input  [31:0] FIC_3_APB_M_PRDATA;
input  FIC_3_APB_M_PREADY;
input  FIC_3_APB_M_PSLVERR;
input  MMUART_0_DCD_F2M;
input  MMUART_0_RI_F2M;
input  MMUART_0_DSR_F2M;
input  MMUART_0_CTS_F2M;
input  MMUART_0_RXD_F2M;
input  MMUART_0_CLK_F2M;
input  MMUART_1_DCD_F2M;
input  MMUART_1_RI_F2M;
input  MMUART_1_DSR_F2M;
input  MMUART_1_CTS_F2M;
input  MMUART_1_RXD_F2M;
input  MMUART_1_CLK_F2M;
input  MMUART_2_RXD_F2M;
input  MMUART_3_RXD_F2M;
input  MMUART_4_RXD_F2M;
input  CAN_0_RXBUS_F2M;
input  CAN_1_RXBUS_F2M;
input  CAN_CLK_F2M;
input  [3:0] QSPI_DATA_F2M;
input  SPI_0_SS_F2M;
input  SPI_0_DI_F2M;
input  SPI_0_CLK_F2M;
input  SPI_1_SS_F2M;
input  SPI_1_DI_F2M;
input  SPI_1_CLK_F2M;
input  I2C_0_SCL_F2M;
input  I2C_1_SCL_F2M;
input  I2C_0_SDA_F2M;
input  I2C_1_SDA_F2M;
input  I2C_0_BCLK_F2M;
input  I2C_0_SMBALERT_NI_F2M;
input  I2C_0_SMBSUS_NI_F2M;
input  I2C_1_BCLK_F2M;
input  I2C_1_SMBALERT_NI_F2M;
input  I2C_1_SMBSUS_NI_F2M;
input  [31:0] GPIO_2_F2M;
input  MAC_0_MDI_F2M;
input  MAC_1_MDI_F2M;
input  JTAG_TMS_F2M;
input  JTAG_TCK_F2M;
input  JTAG_TDI_F2M;
input  JTAG_TRSTB_F2M;
input  [63:0] MSS_INT_F2M;
input  [37:0] SPARE_1_F2M;
input  [37:0] SPARE_2_F2M;
input  BOOT_FAIL_CLEAR_F2M;
input  MSS_RESET_N_F2M;
input  GPIO_RESET_N_F2M;
input  USOC_TRACE_CLOCK_F2M;
input  USOC_TRACE_VALID_F2M;
input  [39:0] USOC_TRACE_DATA_F2M;
input  SPARE_5_F2M;
input  [7:0] MAC_0_GMII_MII_RXD_F2M;
input  MAC_0_GMII_MII_RX_DV_F2M;
input  MAC_0_GMII_MII_RX_ER_F2M;
input  MAC_0_GMII_MII_RX_CRS_F2M;
input  MAC_0_GMII_MII_RX_COL_F2M;
input  MAC_0_GMII_MII_RX_CLK_F2M;
input  MAC_0_GMII_MII_TX_CLK_F2M;
input  MAC_0_TSU_CLK_F2M;
input  [7:0] MAC_1_GMII_MII_RXD_F2M;
input  MAC_1_GMII_MII_RX_DV_F2M;
input  MAC_1_GMII_MII_RX_ER_F2M;
input  MAC_1_GMII_MII_RX_CRS_F2M;
input  MAC_1_GMII_MII_RX_COL_F2M;
input  MAC_1_GMII_MII_RX_CLK_F2M;
input  MAC_1_GMII_MII_TX_CLK_F2M;
input  MAC_1_TSU_CLK_F2M;
input  MAC_0_FILTER_MATCH1_F2M;
input  MAC_0_FILTER_MATCH2_F2M;
input  MAC_0_FILTER_MATCH3_F2M;
input  MAC_0_FILTER_MATCH4_F2M;
input  MAC_1_FILTER_MATCH1_F2M;
input  MAC_1_FILTER_MATCH2_F2M;
input  MAC_1_FILTER_MATCH3_F2M;
input  MAC_1_FILTER_MATCH4_F2M;
input  MAC_0_TSU_GEM_MS_F2M;
input  [1:0] MAC_0_TSU_GEM_INC_CTRL_F2M;
input  MAC_1_TSU_GEM_MS_F2M;
input  [1:0] MAC_1_TSU_GEM_INC_CTRL_F2M;
input  CRYPTO_HCLK;
input  CRYPTO_HRESETN;
input  CRYPTO_AHB_M_HREADY;
input  CRYPTO_AHB_M_HRESP;
input  [31:0] CRYPTO_AHB_M_HRDATA;
input  CRYPTO_AHB_S_HSEL;
input  [16:0] CRYPTO_AHB_S_HADDR;
input  [31:0] CRYPTO_AHB_S_HWDATA;
input  [1:0] CRYPTO_AHB_S_HSIZE;
input  [1:0] CRYPTO_AHB_S_HTRANS;
input  CRYPTO_AHB_S_HWRITE;
input  CRYPTO_AHB_S_HREADY;
input  CRYPTO_STALL_F2M;
input  CRYPTO_PURGE_F2M;
input  CRYPTO_GO_F2M;
input  CRYPTO_REQUEST_F2M;
input  CRYPTO_RELEASE_F2M;
input  CRYPTO_XENABLE_F2M;
input  [31:0] CRYPTO_XWDATA_F2M;
input  CRYPTO_XOUTACK_F2M;
input  CRYPTO_MESH_CLEAR_F2M;
input  EMMC_SD_CLK_F2M;
output FIC_0_DLL_LOCK_M2F;
output FIC_1_DLL_LOCK_M2F;
output FIC_2_DLL_LOCK_M2F;
output FIC_3_DLL_LOCK_M2F;
output [7:0] FIC_0_AXI4_M_AWID;
output [37:0] FIC_0_AXI4_M_AWADDR;
output [7:0] FIC_0_AXI4_M_AWLEN;
output [2:0] FIC_0_AXI4_M_AWSIZE;
output [1:0] FIC_0_AXI4_M_AWBURST;
output FIC_0_AXI4_M_AWLOCK;
output [3:0] FIC_0_AXI4_M_AWQOS;
output [3:0] FIC_0_AXI4_M_AWCACHE;
output [2:0] FIC_0_AXI4_M_AWPROT;
output FIC_0_AXI4_M_AWVALID;
output [63:0] FIC_0_AXI4_M_WDATA;
output [7:0] FIC_0_AXI4_M_WSTRB;
output FIC_0_AXI4_M_WLAST;
output FIC_0_AXI4_M_WVALID;
output FIC_0_AXI4_M_BREADY;
output [7:0] FIC_0_AXI4_M_ARID;
output [37:0] FIC_0_AXI4_M_ARADDR;
output [7:0] FIC_0_AXI4_M_ARLEN;
output [2:0] FIC_0_AXI4_M_ARSIZE;
output [1:0] FIC_0_AXI4_M_ARBURST;
output FIC_0_AXI4_M_ARLOCK;
output [3:0] FIC_0_AXI4_M_ARQOS;
output [3:0] FIC_0_AXI4_M_ARCACHE;
output [2:0] FIC_0_AXI4_M_ARPROT;
output FIC_0_AXI4_M_ARVALID;
output FIC_0_AXI4_M_RREADY;
output FIC_0_AXI4_S_AWREADY;
output FIC_0_AXI4_S_WREADY;
output [3:0] FIC_0_AXI4_S_BID;
output [1:0] FIC_0_AXI4_S_BRESP;
output FIC_0_AXI4_S_BVALID;
output FIC_0_AXI4_S_ARREADY;
output [3:0] FIC_0_AXI4_S_RID;
output [63:0] FIC_0_AXI4_S_RDATA;
output [1:0] FIC_0_AXI4_S_RRESP;
output FIC_0_AXI4_S_RLAST;
output FIC_0_AXI4_S_RVALID;
output [7:0] FIC_1_AXI4_M_AWID;
output [37:0] FIC_1_AXI4_M_AWADDR;
output [7:0] FIC_1_AXI4_M_AWLEN;
output [2:0] FIC_1_AXI4_M_AWSIZE;
output [1:0] FIC_1_AXI4_M_AWBURST;
output FIC_1_AXI4_M_AWLOCK;
output [3:0] FIC_1_AXI4_M_AWQOS;
output [3:0] FIC_1_AXI4_M_AWCACHE;
output [2:0] FIC_1_AXI4_M_AWPROT;
output FIC_1_AXI4_M_AWVALID;
output [63:0] FIC_1_AXI4_M_WDATA;
output [7:0] FIC_1_AXI4_M_WSTRB;
output FIC_1_AXI4_M_WLAST;
output FIC_1_AXI4_M_WVALID;
output FIC_1_AXI4_M_BREADY;
output [7:0] FIC_1_AXI4_M_ARID;
output [37:0] FIC_1_AXI4_M_ARADDR;
output [7:0] FIC_1_AXI4_M_ARLEN;
output [2:0] FIC_1_AXI4_M_ARSIZE;
output [1:0] FIC_1_AXI4_M_ARBURST;
output FIC_1_AXI4_M_ARLOCK;
output [3:0] FIC_1_AXI4_M_ARQOS;
output [3:0] FIC_1_AXI4_M_ARCACHE;
output [2:0] FIC_1_AXI4_M_ARPROT;
output FIC_1_AXI4_M_ARVALID;
output FIC_1_AXI4_M_RREADY;
output FIC_1_AXI4_S_AWREADY;
output FIC_1_AXI4_S_WREADY;
output [3:0] FIC_1_AXI4_S_BID;
output [1:0] FIC_1_AXI4_S_BRESP;
output FIC_1_AXI4_S_BVALID;
output FIC_1_AXI4_S_ARREADY;
output [3:0] FIC_1_AXI4_S_RID;
output [63:0] FIC_1_AXI4_S_RDATA;
output [1:0] FIC_1_AXI4_S_RRESP;
output FIC_1_AXI4_S_RLAST;
output FIC_1_AXI4_S_RVALID;
output FIC_2_AXI4_S_AWREADY;
output FIC_2_AXI4_S_WREADY;
output [3:0] FIC_2_AXI4_S_BID;
output [1:0] FIC_2_AXI4_S_BRESP;
output FIC_2_AXI4_S_BVALID;
output FIC_2_AXI4_S_ARREADY;
output [3:0] FIC_2_AXI4_S_RID;
output [63:0] FIC_2_AXI4_S_RDATA;
output [1:0] FIC_2_AXI4_S_RRESP;
output FIC_2_AXI4_S_RLAST;
output FIC_2_AXI4_S_RVALID;
output FIC_3_APB_M_PSEL;
output [28:0] FIC_3_APB_M_PADDR;
output FIC_3_APB_M_PWRITE;
output FIC_3_APB_M_PENABLE;
output [3:0] FIC_3_APB_M_PSTRB;
output [31:0] FIC_3_APB_M_PWDATA;
output MMUART_0_DTR_M2F;
output MMUART_0_RTS_M2F;
output MMUART_0_TXD_M2F;
output MMUART_0_TXD_OE_M2F;
output MMUART_1_DTR_M2F;
output MMUART_1_RTS_M2F;
output MMUART_1_TXD_M2F;
output MMUART_1_TXD_OE_M2F;
output MMUART_0_OUT1N_M2F;
output MMUART_0_OUT2N_M2F;
output MMUART_0_TE_M2F;
output MMUART_0_ESWM_M2F;
output MMUART_0_CLK_M2F;
output MMUART_0_CLK_OE_M2F;
output MMUART_1_OUT1N_M2F;
output MMUART_1_OUT2N_M2F;
output MMUART_1_TE_M2F;
output MMUART_1_ESWM_M2F;
output MMUART_1_CLK_M2F;
output MMUART_1_CLK_OE_M2F;
output MMUART_2_TXD_M2F;
output MMUART_3_TXD_M2F;
output MMUART_4_TXD_M2F;
output CAN_0_TX_EBL_M2F;
output CAN_0_TXBUS_M2F;
output CAN_1_TX_EBL_M2F;
output CAN_1_TXBUS_M2F;
output QSPI_SEL_M2F;
output QSPI_SEL_OE_M2F;
output QSPI_CLK_M2F;
output QSPI_CLK_OE_M2F;
output [3:0] QSPI_DATA_M2F;
output [3:0] QSPI_DATA_OE_M2F;
output SPI_0_SS1_M2F;
output SPI_0_SS1_OE_M2F;
output SPI_1_SS1_M2F;
output SPI_1_SS1_OE_M2F;
output SPI_0_DO_M2F;
output SPI_0_DO_OE_M2F;
output SPI_0_CLK_M2F;
output SPI_0_CLK_OE_M2F;
output SPI_1_DO_M2F;
output SPI_1_DO_OE_M2F;
output SPI_1_CLK_M2F;
output SPI_1_CLK_OE_M2F;
output I2C_0_SCL_OE_M2F;
output I2C_0_SDA_OE_M2F;
output I2C_1_SCL_OE_M2F;
output I2C_1_SDA_OE_M2F;
output I2C_0_SMBALERT_NO_M2F;
output I2C_0_SMBSUS_NO_M2F;
output I2C_1_SMBALERT_NO_M2F;
output I2C_1_SMBSUS_NO_M2F;
output [31:0] GPIO_2_M2F;
output [31:0] GPIO_2_OE_M2F;
output MAC_0_MDO_M2F;
output MAC_0_MDO_OE_M2F;
output MAC_0_MDC_M2F;
output MAC_1_MDO_M2F;
output MAC_1_MDO_OE_M2F;
output MAC_1_MDC_M2F;
output JTAG_TDO_M2F;
output JTAG_TDO_OE_M2F;
output [15:0] MSS_INT_M2F;
output [37:0] SPARE_M2F;
output PLL_CPU_LOCK_M2F;
output PLL_DDR_LOCK_M2F;
output PLL_SGMII_LOCK_M2F;
output [16:0] MSS_STATUS_M2F;
output BOOT_FAIL_ERROR_M2F;
output MSS_RESET_N_M2F;
output [4:0] SPARE_2_M2F;
output SPARE_3_M2F;
output [2:0] SPARE_4_M2F;
output [6:0] SPARE_5_M2F;
output WDOG_0_INTERRUPT_M2F;
output WDOG_1_INTERRUPT_M2F;
output WDOG_2_INTERRUPT_M2F;
output WDOG_3_INTERRUPT_M2F;
output WDOG_4_INTERRUPT_M2F;
output MPU_VIOLATION_FROM_FIC_0_M2F;
output MPU_VIOLATION_FROM_FIC_1_M2F;
output MPU_VIOLATION_FROM_FIC_2_M2F;
output MPU_VIOLATION_FROM_CRYPTO_M2F;
output MPU_VIOLATION_FROM_MAC_0_M2F;
output MPU_VIOLATION_FROM_MAC_1_M2F;
output MPU_VIOLATION_FROM_USB_M2F;
output MPU_VIOLATION_FROM_EMMC_SD_M2F;
output MPU_VIOLATION_FROM_SCB_M2F;
output MPU_VIOLATION_FROM_TRACE_M2F;
output REBOOT_REQUESTED_M2F;
output CPU_IN_RESET_M2F;
output AXI_IN_RESET_M2F;
output SCB_PERIPH_RESET_OCCURRED_M2F;
output SCB_MSS_RESET_OCCURRED_M2F;
output SCB_CPU_RESET_OCCURRED_M2F;
output DEBUGGER_RESET_OCCURRED_M2F;
output FABRIC_RESET_OCCURRED_M2F;
output WDOG_RESET_OCCURRED_M2F;
output GPIO_RESET_OCCURRED_M2F;
output SCB_BUS_RESET_OCCURRED_M2F;
output CPU_SOFT_RESET_OCCURRED_M2F;
output [1:0] CPU_CLK_DIVIDER_M2F;
output [1:0] AXI_CLK_DIVIDER_M2F;
output [1:0] AHB_APB_CLK_DIVIDER_M2F;
output [7:0] USOC_CONTROL_DATA_M2F;
output [7:0] MAC_0_GMII_MII_TXD_M2F;
output MAC_0_GMII_MII_TX_EN_M2F;
output MAC_0_GMII_MII_TX_ER_M2F;
output MAC_0_LOCAL_LOOPBACK_M2F;
output MAC_0_LOOPBACK_M2F;
output MAC_0_HALF_DUPLEX_M2F;
output [3:0] MAC_0_SPEED_MODE_M2F;
output [7:0] MAC_1_GMII_MII_TXD_M2F;
output MAC_1_GMII_MII_TX_EN_M2F;
output MAC_1_GMII_MII_TX_ER_M2F;
output MAC_1_LOCAL_LOOPBACK_M2F;
output MAC_1_LOOPBACK_M2F;
output MAC_1_HALF_DUPLEX_M2F;
output [3:0] MAC_1_SPEED_MODE_M2F;
output [127:0] MAC_0_FILTER_DATA_M2F;
output MAC_0_FILTER_SA_STB_M2F;
output MAC_0_FILTER_DA_STB_M2F;
output MAC_0_FILTER_TYPE_STB_M2F;
output MAC_0_FILTER_VLAN_TAG1_STB_M2F;
output MAC_0_FILTER_VLAN_TAG2_STB_M2F;
output MAC_0_FILTER_IP_SA_STB_M2F;
output MAC_0_FILTER_IP_DA_STB_M2F;
output MAC_0_FILTER_SP_STB_M2F;
output MAC_0_FILTER_DP_STB_M2F;
output MAC_0_FILTER_IPV6_M2F;
output MAC_0_WOL_M2F;
output [127:0] MAC_1_FILTER_DATA_M2F;
output MAC_1_FILTER_SA_STB_M2F;
output MAC_1_FILTER_DA_STB_M2F;
output MAC_1_FILTER_TYPE_STB_M2F;
output MAC_1_FILTER_VLAN_TAG1_STB_M2F;
output MAC_1_FILTER_VLAN_TAG2_STB_M2F;
output MAC_1_FILTER_IP_SA_STB_M2F;
output MAC_1_FILTER_IP_DA_STB_M2F;
output MAC_1_FILTER_SP_STB_M2F;
output MAC_1_FILTER_DP_STB_M2F;
output MAC_1_FILTER_IPV6_M2F;
output MAC_1_WOL_M2F;
output MAC_0_TSU_SOF_TX_M2F;
output MAC_0_TSU_SYNC_FRAME_TX_M2F;
output MAC_0_TSU_DELAY_REQ_TX_M2F;
output MAC_0_TSU_PDELAY_REQ_TX_M2F;
output MAC_0_TSU_PDELAY_RESP_TX_M2F;
output MAC_0_TSU_SOF_RX_M2F;
output MAC_0_TSU_SYNC_FRAME_RX_M2F;
output MAC_0_TSU_DELAY_REQ_RX_M2F;
output MAC_0_TSU_PDELAY_REQ_RX_M2F;
output MAC_0_TSU_PDELAY_RESP_RX_M2F;
output [93:0] MAC_0_TSU_TIMER_CNT_M2F;
output MAC_0_TSU_TIMER_CMP_VAL_M2F;
output MAC_1_TSU_SOF_TX_M2F;
output MAC_1_TSU_SYNC_FRAME_TX_M2F;
output MAC_1_TSU_DELAY_REQ_TX_M2F;
output MAC_1_TSU_PDELAY_REQ_TX_M2F;
output MAC_1_TSU_PDELAY_RESP_TX_M2F;
output MAC_1_TSU_SOF_RX_M2F;
output MAC_1_TSU_SYNC_FRAME_RX_M2F;
output MAC_1_TSU_DELAY_REQ_RX_M2F;
output MAC_1_TSU_PDELAY_REQ_RX_M2F;
output MAC_1_TSU_PDELAY_RESP_RX_M2F;
output [93:0] MAC_1_TSU_TIMER_CNT_M2F;
output MAC_1_TSU_TIMER_CMP_VAL_M2F;
output CRYPTO_DLL_LOCK_M2F;
output [31:0] CRYPTO_AHB_M_HADDR;
output [31:0] CRYPTO_AHB_M_HWDATA;
output [1:0] CRYPTO_AHB_M_HSIZE;
output [1:0] CRYPTO_AHB_M_HTRANS;
output CRYPTO_AHB_M_HWRITE;
output CRYPTO_AHB_M_HMASTLOCK;
output CRYPTO_AHB_S_HREADYOUT;
output CRYPTO_AHB_S_HRESP;
output [31:0] CRYPTO_AHB_S_HRDATA;
output CRYPTO_BUSY_M2F;
output CRYPTO_COMPLETE_M2F;
output CRYPTO_ALARM_M2F;
output CRYPTO_BUSERROR_M2F;
output CRYPTO_MSS_REQUEST_M2F;
output CRYPTO_MSS_RELEASE_M2F;
output CRYPTO_OWNER_M2F;
output CRYPTO_MSS_OWNER_M2F;
output [9:0] CRYPTO_XWADDR_M2F;
output CRYPTO_XINACCEPT_M2F;
output [31:0] CRYPTO_XRDATA_M2F;
output [9:0] CRYPTO_XRADDR_M2F;
output CRYPTO_XVALIDOUT_M2F;
output CRYPTO_MESH_ERROR_M2F;
input  MSSIO37_IN;
output MSSIO37_OUT;
output MSSIO37_OE;
input  MSSIO36_IN;
output MSSIO36_OUT;
output MSSIO36_OE;
input  MSSIO35_IN;
output MSSIO35_OUT;
output MSSIO35_OE;
input  MSSIO34_IN;
output MSSIO34_OUT;
output MSSIO34_OE;
input  MSSIO33_IN;
output MSSIO33_OUT;
output MSSIO33_OE;
input  MSSIO32_IN;
output MSSIO32_OUT;
output MSSIO32_OE;
input  MSSIO31_IN;
output MSSIO31_OUT;
output MSSIO31_OE;
input  MSSIO30_IN;
output MSSIO30_OUT;
output MSSIO30_OE;
input  MSSIO29_IN;
output MSSIO29_OUT;
output MSSIO29_OE;
input  MSSIO28_IN;
output MSSIO28_OUT;
output MSSIO28_OE;
input  MSSIO27_IN;
output MSSIO27_OUT;
output MSSIO27_OE;
input  MSSIO26_IN;
output MSSIO26_OUT;
output MSSIO26_OE;
input  MSSIO25_IN;
output MSSIO25_OUT;
output MSSIO25_OE;
input  MSSIO24_IN;
output MSSIO24_OUT;
output MSSIO24_OE;
input  MSSIO23_IN;
output MSSIO23_OUT;
output MSSIO23_OE;
input  MSSIO22_IN;
output MSSIO22_OUT;
output MSSIO22_OE;
input  MSSIO21_IN;
output MSSIO21_OUT;
output MSSIO21_OE;
input  MSSIO20_IN;
output MSSIO20_OUT;
output MSSIO20_OE;
input  MSSIO19_IN;
output MSSIO19_OUT;
output MSSIO19_OE;
input  MSSIO18_IN;
output MSSIO18_OUT;
output MSSIO18_OE;
input  MSSIO17_IN;
output MSSIO17_OUT;
output MSSIO17_OE;
input  MSSIO16_IN;
output MSSIO16_OUT;
output MSSIO16_OE;
input  MSSIO15_IN;
output MSSIO15_OUT;
output MSSIO15_OE;
input  MSSIO14_IN;
output MSSIO14_OUT;
output MSSIO14_OE;
input  MSSIO13_IN;
output MSSIO13_OUT;
output MSSIO13_OE;
input  MSSIO12_IN;
output MSSIO12_OUT;
output MSSIO12_OE;
input  MSSIO11_IN;
output MSSIO11_OUT;
output MSSIO11_OE;
input  MSSIO10_IN;
output MSSIO10_OUT;
output MSSIO10_OE;
input  MSSIO9_IN;
output MSSIO9_OUT;
output MSSIO9_OE;
input  MSSIO8_IN;
output MSSIO8_OUT;
output MSSIO8_OE;
input  MSSIO7_IN;
output MSSIO7_OUT;
output MSSIO7_OE;
input  MSSIO6_IN;
output MSSIO6_OUT;
output MSSIO6_OE;
input  MSSIO5_IN;
output MSSIO5_OUT;
output MSSIO5_OE;
input  MSSIO4_IN;
output MSSIO4_OUT;
output MSSIO4_OE;
input  MSSIO3_IN;
output MSSIO3_OUT;
output MSSIO3_OE;
input  MSSIO2_IN;
output MSSIO2_OUT;
output MSSIO2_OE;
input  MSSIO1_IN;
output MSSIO1_OUT;
output MSSIO1_OE;
input  MSSIO0_IN;
output MSSIO0_OUT;
output MSSIO0_OE;
input  REFCLK;
input  SGMII_RX1;
input  SGMII_RX0;
output SGMII_TX1;
output SGMII_TX0;
input  DDR_DQS4_IN;
output DDR_DQS4_OUT;
output DDR_DQS4_OE;
input  DDR_DQS3_IN;
output DDR_DQS3_OUT;
output DDR_DQS3_OE;
input  DDR_DQS2_IN;
output DDR_DQS2_OUT;
output DDR_DQS2_OE;
input  DDR_DQS1_IN;
output DDR_DQS1_OUT;
output DDR_DQS1_OE;
input  DDR_DQS0_IN;
output DDR_DQS0_OUT;
output DDR_DQS0_OE;
output DDR_CK1;
output DDR_CK0;
output DDR3_WE_N;
output DDR_PARITY;
output DDR_RAM_RST_N;
input  DDR_ALERT_N;
output DDR_ACT_N;
output DDR_A16;
output DDR_A15;
output DDR_A14;
output DDR_A13;
output DDR_A12;
output DDR_A11;
output DDR_A10;
output DDR_A9;
output DDR_A8;
output DDR_A7;
output DDR_A6;
output DDR_A5;
output DDR_A4;
output DDR_A3;
output DDR_A2;
output DDR_A1;
output DDR_A0;
output DDR_BA1;
output DDR_BA0;
output DDR_BG1;
output DDR_BG0;
output DDR_CKE1;
output DDR_CKE0;
output DDR_CS1;
output DDR_CS0;
output DDR_ODT1;
output DDR_ODT0;
input  DDR_DQ35_IN;
output DDR_DQ35_OUT;
output DDR_DQ35_OE;
input  DDR_DQ34_IN;
output DDR_DQ34_OUT;
output DDR_DQ34_OE;
input  DDR_DQ33_IN;
output DDR_DQ33_OUT;
output DDR_DQ33_OE;
input  DDR_DQ32_IN;
output DDR_DQ32_OUT;
output DDR_DQ32_OE;
input  DDR_DQ31_IN;
output DDR_DQ31_OUT;
output DDR_DQ31_OE;
input  DDR_DQ30_IN;
output DDR_DQ30_OUT;
output DDR_DQ30_OE;
input  DDR_DQ29_IN;
output DDR_DQ29_OUT;
output DDR_DQ29_OE;
input  DDR_DQ28_IN;
output DDR_DQ28_OUT;
output DDR_DQ28_OE;
input  DDR_DQ27_IN;
output DDR_DQ27_OUT;
output DDR_DQ27_OE;
input  DDR_DQ26_IN;
output DDR_DQ26_OUT;
output DDR_DQ26_OE;
input  DDR_DQ25_IN;
output DDR_DQ25_OUT;
output DDR_DQ25_OE;
input  DDR_DQ24_IN;
output DDR_DQ24_OUT;
output DDR_DQ24_OE;
input  DDR_DQ23_IN;
output DDR_DQ23_OUT;
output DDR_DQ23_OE;
input  DDR_DQ22_IN;
output DDR_DQ22_OUT;
output DDR_DQ22_OE;
input  DDR_DQ21_IN;
output DDR_DQ21_OUT;
output DDR_DQ21_OE;
input  DDR_DQ20_IN;
output DDR_DQ20_OUT;
output DDR_DQ20_OE;
input  DDR_DQ19_IN;
output DDR_DQ19_OUT;
output DDR_DQ19_OE;
input  DDR_DQ18_IN;
output DDR_DQ18_OUT;
output DDR_DQ18_OE;
input  DDR_DQ17_IN;
output DDR_DQ17_OUT;
output DDR_DQ17_OE;
input  DDR_DQ16_IN;
output DDR_DQ16_OUT;
output DDR_DQ16_OE;
input  DDR_DQ15_IN;
output DDR_DQ15_OUT;
output DDR_DQ15_OE;
input  DDR_DQ14_IN;
output DDR_DQ14_OUT;
output DDR_DQ14_OE;
input  DDR_DQ13_IN;
output DDR_DQ13_OUT;
output DDR_DQ13_OE;
input  DDR_DQ12_IN;
output DDR_DQ12_OUT;
output DDR_DQ12_OE;
input  DDR_DQ11_IN;
output DDR_DQ11_OUT;
output DDR_DQ11_OE;
input  DDR_DQ10_IN;
output DDR_DQ10_OUT;
output DDR_DQ10_OE;
input  DDR_DQ9_IN;
output DDR_DQ9_OUT;
output DDR_DQ9_OE;
input  DDR_DQ8_IN;
output DDR_DQ8_OUT;
output DDR_DQ8_OE;
input  DDR_DQ7_IN;
output DDR_DQ7_OUT;
output DDR_DQ7_OE;
input  DDR_DQ6_IN;
output DDR_DQ6_OUT;
output DDR_DQ6_OE;
input  DDR_DQ5_IN;
output DDR_DQ5_OUT;
output DDR_DQ5_OE;
input  DDR_DQ4_IN;
output DDR_DQ4_OUT;
output DDR_DQ4_OE;
input  DDR_DQ3_IN;
output DDR_DQ3_OUT;
output DDR_DQ3_OE;
input  DDR_DQ2_IN;
output DDR_DQ2_OUT;
output DDR_DQ2_OE;
input  DDR_DQ1_IN;
output DDR_DQ1_OUT;
output DDR_DQ1_OE;
input  DDR_DQ0_IN;
output DDR_DQ0_OUT;
output DDR_DQ0_OE;
input  DDR_DM0_IN;
output DDR_DM0_OUT;
output DDR_DM0_OE;
input  DDR_DM1_IN;
output DDR_DM1_OUT;
output DDR_DM1_OE;
input  DDR_DM2_IN;
output DDR_DM2_OUT;
output DDR_DM2_OE;
input  DDR_DM3_IN;
output DDR_DM3_OUT;
output DDR_DM3_OE;
input  DDR_DM4_IN;
output DDR_DM4_OUT;
output DDR_DM4_OE;
input  REFCLK_0_PLL_NW;
input  REFCLK_1_PLL_NW;
parameter CRYPTO_MODE = "";
parameter BOOT_MODE = "";
parameter BOOT_MODE1_E51_START_ADDRESS_ENVM = 32'h0;
parameter BOOT_MODE1_U54_1_START_ADDRESS_ENVM = 32'h0;
parameter BOOT_MODE1_U54_2_START_ADDRESS_ENVM = 32'h0;
parameter BOOT_MODE1_U54_3_START_ADDRESS_ENVM = 32'h0;
parameter BOOT_MODE1_U54_4_START_ADDRESS_ENVM = 32'h0;
parameter BOOT_MODE2_START_PAGE_SNVM = 0;
parameter BOOT_MODE3_START_ADDRESS_ENVM = 32'h0;
parameter MSS_CLK_DIV = 0;
parameter MSS_AHB_APB_CLK_DIV = 0;
parameter MSS_AXI_CLK_DIV = 0;
parameter MSS_CLK_FREQ = 0.0;
parameter CRYPTO_MSS_CLK_FREQ = 0.0;
parameter MSS_DDR_CLK_FREQ    = 0.0;
parameter PROGRAM_NAME = "";
parameter CORE_NAME = "";
parameter DIE = "";
parameter PKG = "";
parameter BANK2_VDDI = "";
parameter BANK4_VDDI = "";
parameter BANK5_VDDI = "";
parameter DDR_SDRAM_TYPE = "";
parameter REFCLK_IOSTD = "";
parameter SGMII_IOSTD = "";
parameter SGMII_RX0_IOSTD          = "";
parameter SGMII_RX1_IOSTD          = "";
parameter SGMII_TX0_IOSTD          = "";
parameter SGMII_TX1_IOSTD          = "";
parameter SPI0_CONTROL1_CFG_MODE = 2'h0;
parameter SPI1_CONTROL1_CFG_MODE = 2'h0;
  parameter DDR_SEGS_SEG0_0_ADDRESS_OFFSET = 15'h7F80;
  parameter DDR_SEGS_SEG0_1_ADDRESS_OFFSET = 15'h7000;
  parameter DDR_SEGS_SEG1_2_ADDRESS_OFFSET = 15'h7F40;
  parameter DDR_SEGS_SEG1_3_ADDRESS_OFFSET = 15'h6C00;
  parameter DDR_SEGS_SEG1_4_ADDRESS_OFFSET = 15'h7F30;
  parameter DDR_SEGS_SEG1_5_ADDRESS_OFFSET = 15'h6800;
  parameter DDR_SEGS_SEG1_6_ADDRESS_OFFSET = 15'h0;
  parameter DDR_DDRC_CFG_AXI_START_ADDRESS_AXI1_0 = 32'h0;
  parameter DDR_DDRC_CFG_AXI_START_ADDRESS_AXI1_1 = 32'h0;
  parameter DDR_DDRC_CFG_AXI_START_ADDRESS_AXI2_0 = 32'h0;
  parameter DDR_DDRC_CFG_AXI_START_ADDRESS_AXI2_1 = 32'h0;
  parameter DDR_DDRC_CFG_AXI_END_ADDRESS_AXI1_0 = 32'hFFFFFFFF;
  parameter DDR_DDRC_CFG_AXI_END_ADDRESS_AXI1_1 = 32'h3;
  parameter DDR_DDRC_CFG_AXI_END_ADDRESS_AXI2_0 = 32'hFFFFFFFF;
  parameter DDR_DDRC_CFG_AXI_END_ADDRESS_AXI2_1 = 32'h3;
  parameter DDR_DDRC_CFG_MEM_START_ADDRESS_AXI1_0 = 32'h0;
  parameter DDR_DDRC_CFG_MEM_START_ADDRESS_AXI1_1 = 32'h0;
  parameter DDR_DDRC_CFG_MEM_START_ADDRESS_AXI2_0 = 32'h0;
  parameter DDR_DDRC_CFG_MEM_START_ADDRESS_AXI2_1 = 32'h0;
parameter MSSIO_IOMUX0_CR_SPI0_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_SPI1_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_I2C0_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_I2C1_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_CAN0_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_CAN1_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_QSPI_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_MMUART0_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_MMUART1_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_MMUART2_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_MMUART3_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_MMUART4_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_MDIO0_FABRIC = 1'h0;
parameter MSSIO_IOMUX0_CR_MDIO1_FABRIC = 1'h0;
parameter MSSIO_IOMUX1_CR_PAD0 = 4'hF;
parameter MSSIO_IOMUX1_CR_PAD1 = 4'hF;
parameter MSSIO_IOMUX1_CR_PAD2 = 4'hF;
parameter MSSIO_IOMUX1_CR_PAD3 = 4'hF;
parameter MSSIO_IOMUX1_CR_PAD4 = 4'hF;
parameter MSSIO_IOMUX1_CR_PAD5 = 4'hF;
parameter MSSIO_IOMUX1_CR_PAD6 = 4'hF;
parameter MSSIO_IOMUX1_CR_PAD7 = 4'hF;
parameter MSSIO_IOMUX2_CR_PAD8 = 4'hF;
parameter MSSIO_IOMUX2_CR_PAD9 = 4'hF;
parameter MSSIO_IOMUX2_CR_PAD10 = 4'hF;
parameter MSSIO_IOMUX2_CR_PAD11 = 4'hF;
parameter MSSIO_IOMUX2_CR_PAD12 = 4'hF;
parameter MSSIO_IOMUX2_CR_PAD13 = 4'hF;
parameter MSSIO_IOMUX3_CR_PAD14 = 4'hF;
parameter MSSIO_IOMUX3_CR_PAD15 = 4'hF;
parameter MSSIO_IOMUX3_CR_PAD16 = 4'hF;
parameter MSSIO_IOMUX3_CR_PAD17 = 4'hF;
parameter MSSIO_IOMUX3_CR_PAD18 = 4'hF;
parameter MSSIO_IOMUX3_CR_PAD19 = 4'hF;
parameter MSSIO_IOMUX3_CR_PAD20 = 4'hF;
parameter MSSIO_IOMUX3_CR_PAD21 = 4'hF;
parameter MSSIO_IOMUX4_CR_PAD22 = 4'hF;
parameter MSSIO_IOMUX4_CR_PAD23 = 4'hF;
parameter MSSIO_IOMUX4_CR_PAD24 = 4'hF;
parameter MSSIO_IOMUX4_CR_PAD25 = 4'hF;
parameter MSSIO_IOMUX4_CR_PAD26 = 4'hF;
parameter MSSIO_IOMUX4_CR_PAD27 = 4'hF;
parameter MSSIO_IOMUX4_CR_PAD28 = 4'hF;
parameter MSSIO_IOMUX4_CR_PAD29 = 4'hF;
parameter MSSIO_IOMUX5_CR_PAD30 = 4'hF;
parameter MSSIO_IOMUX5_CR_PAD31 = 4'hF;
parameter MSSIO_IOMUX5_CR_PAD32 = 4'hF;
parameter MSSIO_IOMUX5_CR_PAD33 = 4'hF;
parameter MSSIO_IOMUX5_CR_PAD34 = 4'hF;
parameter MSSIO_IOMUX5_CR_PAD35 = 4'hF;
parameter MSSIO_IOMUX5_CR_PAD36 = 4'hF;
parameter MSSIO_IOMUX5_CR_PAD37 = 4'hF;
parameter MSSIO_IOMUX6_CR_VLT_SEL = 1'h0;
parameter MSSIO_IOMUX6_CR_VLT_EN = 1'h0;
parameter MSSIO_IOMUX6_CR_VLT_CMD_DIR = 1'h0;
parameter MSSIO_IOMUX6_CR_VLT_DIR_0 = 1'h0;
parameter MSSIO_IOMUX6_CR_VLT_DIR_1_3 = 1'h0;
parameter MSSIO_IOMUX6_CR_SD_LED = 1'h0;
parameter MSSIO_IOMUX6_CR_SD_VOLT_0 = 1'h0;
parameter MSSIO_IOMUX6_CR_SD_VOLT_1 = 1'h0;
parameter MSSIO_IOMUX6_CR_SD_VOLT_2 = 1'h0;
parameter MSSIO_MSSIO_BANK2_CFG_CR_BANK_PCODE = 6'h7;
parameter MSSIO_MSSIO_BANK2_CFG_CR_BANK_NCODE = 6'h9;
parameter MSSIO_MSSIO_BANK2_CFG_CR_VS = 4'h8;
parameter MSSIO_MSSIO_BANK4_CFG_CR_BANK_PCODE = 6'h7;
parameter MSSIO_MSSIO_BANK4_CFG_CR_BANK_NCODE = 6'h9;
parameter MSSIO_MSSIO_BANK4_CFG_CR_VS = 4'h8;
parameter SGMII_SGMII_MODE_REG_BC_VS = 4'h8;
parameter SGMII_SGMII_MODE_REG_PLL_EN = 1'h0;
parameter SGMII_SGMII_MODE_REG_DLL_EN = 1'h0;
parameter SGMII_DYN_CNTL_REG_PLL_SOFT_RESET_PERIPH = 1'h0;
parameter SGMII_DYN_CNTL_REG_DLL_SOFT_RESET_PERIPH = 1'h0;
parameter SGMII_DYN_CNTL_REG_PVT_SOFT_RESET_PERIPH = 1'h1;
parameter SGMII_DYN_CNTL_REG_BC_SOFT_RESET_PERIPH = 1'h0;
parameter SGMII_SGMII_MODE_REG_TX0_EN = 1'h0;
parameter SGMII_SGMII_MODE_REG_RX0_EN = 1'h0;
parameter SGMII_SGMII_MODE_REG_CH0_CDR_RESET_B = 1'h1;
parameter SGMII_DYN_CNTL_REG_LANE0_SOFT_RESET_PERIPH = 1'h0;
parameter SGMII_CH0_CNTL_REG_TX0_WPU_P = 1'h0;
parameter SGMII_CH0_CNTL_REG_TX0_WPD_P = 1'h0;
parameter SGMII_CH0_CNTL_REG_TX0_SLEW_P = 2'h0;
parameter SGMII_CH0_CNTL_REG_TX0_DRV_P = 4'h0;
parameter SGMII_CH0_CNTL_REG_TX0_ODT_P = 4'h0;
parameter SGMII_CH0_CNTL_REG_TX0_ODT_STATIC_P = 3'h0;
parameter SGMII_CH0_CNTL_REG_RX0_WPU_P = 1'h0;
parameter SGMII_CH0_CNTL_REG_RX0_WPD_P = 1'h0;
parameter SGMII_CH0_CNTL_REG_RX0_IBUFMD_P = 3'h7;
parameter SGMII_CH0_CNTL_REG_RX0_ODT_P = 4'h0;
parameter SGMII_CH0_CNTL_REG_RX0_ODT_STATIC_P = 3'h0;
parameter SGMII_SGMII_MODE_REG_TX1_EN = 1'h0;
parameter SGMII_SGMII_MODE_REG_RX1_EN = 1'h0;
parameter SGMII_SGMII_MODE_REG_CH1_CDR_RESET_B = 1'h1;
parameter SGMII_DYN_CNTL_REG_LANE1_SOFT_RESET_PERIPH = 1'h0;
parameter SGMII_CH1_CNTL_REG_TX1_WPU_P = 1'h0;
parameter SGMII_CH1_CNTL_REG_TX1_WPD_P = 1'h0;
parameter SGMII_CH1_CNTL_REG_TX1_SLEW_P = 2'h0;
parameter SGMII_CH1_CNTL_REG_TX1_DRV_P = 4'h0;
parameter SGMII_CH1_CNTL_REG_TX1_ODT_P = 4'h0;
parameter SGMII_CH1_CNTL_REG_TX1_ODT_STATIC_P = 3'h0;
parameter SGMII_CH1_CNTL_REG_RX1_WPU_P = 1'h0;
parameter SGMII_CH1_CNTL_REG_RX1_WPD_P = 1'h0;
parameter SGMII_CH1_CNTL_REG_RX1_IBUFMD_P = 3'h7;
parameter SGMII_CH1_CNTL_REG_RX1_ODT_P = 4'h0;
parameter SGMII_CH1_CNTL_REG_RX1_ODT_STATIC_P = 3'h0;
parameter SGMII_SGMII_MODE_REG_PVT_EN = 1'h1;
parameter SGMII_SGMII_MODE_REG_BC_VRGEN_EN = 1'h1;
parameter SGMII_RECAL_CNTL_REG_PVT_CALIB_START = 1'h1;
parameter SGMII_RECAL_CNTL_REG_PVT_CALIB_LOCK = 1'h1;
parameter SGMII_DYN_CNTL_REG_CLKMUX_SOFT_RESET_PERIPH = 1'h0;
parameter SGMII_CLK_CNTL_REG_REFCLK_EN_RXMODE_P = 2'h3;
parameter SGMII_CLK_CNTL_REG_REFCLK_EN_RXMODE_N = 2'h3;
parameter CLK_SGMII_CFM_CLK_XCVR_EN_RXMODE_P = 2'h3;
parameter CLK_SGMII_CFM_CLK_XCVR_EN_RXMODE_N = 2'h3;
parameter SGMII_SGMII_MODE_REG_REFCLK_EN_UDRIVE_P = 1'h0;
parameter SGMII_SGMII_MODE_REG_REFCLK_EN_UDRIVE_N = 1'h0;
parameter CLK_SGMII_CFM_CLK_XCVR_EN_UDRIVE_P = 1'h0;
parameter CLK_SGMII_CFM_CLK_XCVR_EN_UDRIVE_N = 1'h0;
parameter SGMII_SGMII_MODE_REG_REFCLK_EN_RDIFF = 1'h1;
parameter CLK_SGMII_CFM_CLK_XCVR_EN_RDIFF = 1'h1;
parameter SGMII_CLK_CNTL_REG_REFCLK_EN_TERM_P = 2'h0;
parameter SGMII_CLK_CNTL_REG_REFCLK_EN_TERM_N = 2'h0;
parameter CLK_SGMII_CFM_CLK_XCVR_EN_TERM_P = 2'h0;
parameter CLK_SGMII_CFM_CLK_XCVR_EN_TERM_N = 2'h0;
parameter SGMII_SGMII_MODE_REG_REFCLK_EN_INS_HYST_P = 1'h0;
parameter SGMII_SGMII_MODE_REG_REFCLK_EN_INS_HYST_N = 1'h0;
parameter CLK_SGMII_CFM_CLK_XCVR_EN_INS_HYST_P = 1'h0;
parameter CLK_SGMII_CFM_CLK_XCVR_EN_INS_HYST_N = 1'h0;
parameter SGMII_CLK_CNTL_REG_REFCLK_CLKBUF_EN_PULLUP = 1'h0;
parameter CLK_SGMII_CFM_CLK_XCVR_CLKBUF_EN_PULLUP = 1'h0;
parameter MSSIO_MSSIO_BANK4_IO_CFG_0_1_CR_IO_CFG_0 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_0_1_CR_IO_CFG_1 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_2_3_CR_IO_CFG_2 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_2_3_CR_IO_CFG_3 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_4_5_CR_IO_CFG_4 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_4_5_CR_IO_CFG_5 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_6_7_CR_IO_CFG_6 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_6_7_CR_IO_CFG_7 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_8_9_CR_IO_CFG_8 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_8_9_CR_IO_CFG_9 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_10_11_CR_IO_CFG_10 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_10_11_CR_IO_CFG_11 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_12_13_CR_IO_CFG_12 = 16'h829;
parameter MSSIO_MSSIO_BANK4_IO_CFG_12_13_CR_IO_CFG_13 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_0_1_CR_IO_CFG_0 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_0_1_CR_IO_CFG_1 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_2_3_CR_IO_CFG_2 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_2_3_CR_IO_CFG_3 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_4_5_CR_IO_CFG_4 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_4_5_CR_IO_CFG_5 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_6_7_CR_IO_CFG_6 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_6_7_CR_IO_CFG_7 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_8_9_CR_IO_CFG_8 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_8_9_CR_IO_CFG_9 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_10_11_CR_IO_CFG_10 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_10_11_CR_IO_CFG_11 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_12_13_CR_IO_CFG_12 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_12_13_CR_IO_CFG_13 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_14_15_CR_IO_CFG_14 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_14_15_CR_IO_CFG_15 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_16_17_CR_IO_CFG_16 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_16_17_CR_IO_CFG_17 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_18_19_CR_IO_CFG_18 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_18_19_CR_IO_CFG_19 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_20_21_CR_IO_CFG_20 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_20_21_CR_IO_CFG_21 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_22_23_CR_IO_CFG_22 = 16'h829;
parameter MSSIO_MSSIO_BANK2_IO_CFG_22_23_CR_IO_CFG_23 = 16'h829;
parameter GENERAL_GPIO_CR_GPIO0_SOFT_RESET_SELECT = 2'h3;
parameter GENERAL_GPIO_CR_GPIO1_SOFT_RESET_SELECT = 3'h7;
parameter GENERAL_GPIO_CR_GPIO2_SOFT_RESET_SELECT = 4'hF;
parameter GENERAL_CRYPTO_CR_INFO_MSS_MODE = 2'h0;
parameter DDR_DDRC_CFG_CHIPADDR_MAP_CFG_CHIPADDR_MAP = 32'h0;
parameter DDR_DDRC_CFG_BANKADDR_MAP_0_CFG_BANKADDR_MAP_0 = 32'h0;
parameter DDR_DDRC_CFG_ROWADDR_MAP_0_CFG_ROWADDR_MAP_0 = 32'h0;
parameter DDR_DDRC_CFG_ROWADDR_MAP_1_CFG_ROWADDR_MAP_1 = 32'h0;
parameter DDR_DDRC_CFG_ROWADDR_MAP_2_CFG_ROWADDR_MAP_2 = 32'h0;
parameter DDR_DDRC_CFG_ROWADDR_MAP_3_CFG_ROWADDR_MAP_3 = 32'h0;
parameter DDR_DDRC_CFG_COLADDR_MAP_0_CFG_COLADDR_MAP_0 = 32'h0;
parameter DDR_DDRC_CFG_COLADDR_MAP_1_CFG_COLADDR_MAP_1 = 32'h0;
parameter DDR_DDRC_CFG_COLADDR_MAP_2_CFG_COLADDR_MAP_2 = 32'h0;
parameter DDR_DDRC_CFG_MEM_COLBITS_CFG_MEM_COLBITS = 32'hA;
parameter DDR_DDRC_CFG_MEM_ROWBITS_CFG_MEM_ROWBITS = 32'hE;
parameter DDR_DDRC_CFG_MEM_BANKBITS_CFG_MEM_BANKBITS = 32'h3;
parameter DDR_DDRC_CFG_CL_CFG_CL = 32'hC;
parameter DDR_DDRC_CFG_CWL_CFG_CWL = 32'hA;
parameter DDR_DDRC_CFG_NUM_RANKS_CFG_NUM_RANKS = 32'h2;
parameter DDR_DDRC_CFG_ZQINIT_CAL_DURATION_CFG_ZQINIT_CAL_DURATION = 32'h2AB;
parameter DDR_DDRC_CFG_ZQ_CAL_L_DURATION_CFG_ZQ_CAL_L_DURATION = 32'h156;
parameter DDR_DDRC_CFG_ZQ_CAL_S_DURATION_CFG_ZQ_CAL_S_DURATION = 32'h56;
parameter DDR_DDRC_CFG_ODT_RD_MAP_CS0_CFG_ODT_RD_MAP_CS0 = 32'h2;
parameter DDR_DDRC_CFG_ODT_RD_MAP_CS1_CFG_ODT_RD_MAP_CS1 = 32'h1;
parameter DDR_DDRC_CFG_ODT_WR_MAP_CS0_CFG_ODT_WR_MAP_CS0 = 32'h1;
parameter DDR_DDRC_CFG_ODT_WR_MAP_CS1_CFG_ODT_WR_MAP_CS1 = 32'h2;
parameter DDR_DDRC_CFG_RAS_CFG_RAS = 32'h26;
parameter DDR_DDRC_CFG_RCD_CFG_RCD = 32'hC;
parameter DDR_DDRC_CFG_RRD_CFG_RRD = 32'h7;
parameter DDR_DDRC_CFG_RP_CFG_RP = 32'hC;
parameter DDR_DDRC_CFG_RC_CFG_RC = 32'h32;
parameter DDR_DDRC_CFG_FAW_CFG_FAW = 32'h1B;
parameter DDR_DDRC_CFG_RFC_CFG_RFC = 32'h76;
parameter DDR_DDRC_CFG_RTP_CFG_RTP = 32'h8;
parameter DDR_DDRC_CFG_WR_CFG_WR = 32'h10;
parameter DDR_DDRC_CFG_REF_PER_CFG_REF_PER = 32'h207C;
parameter DDR_DDRC_CFG_STARTUP_DELAY_CFG_STARTUP_DELAY = 32'hC8;
parameter DDR_DDRC_CFG_ZQ_CAL_PER_CFG_ZQ_CAL_PER = 32'h3F40;
parameter DDR_DDRC_CFG_WTR_CFG_WTR = 32'h8;
parameter DDR_DDRC_CFG_MOD_CFG_MOD = 32'h10;
parameter DDR_DDRC_CFG_XS_CFG_XS = 32'h80;
parameter DDR_DDRC_CFG_XPR_CFG_XPR = 32'h80;
parameter DDR_DDRC_CFG_MANUAL_ADDRESS_MAP_CFG_MANUAL_ADDRESS_MAP = 32'h0;
parameter DDR_DDRC_CFG_LOOKAHEAD_PCH_CFG_LOOKAHEAD_PCH = 32'h1;
parameter DDR_DDRC_CFG_LOOKAHEAD_ACT_CFG_LOOKAHEAD_ACT = 32'h1;
parameter DDR_DDRC_CFG_AUTO_REF_EN_CFG_AUTO_REF_EN = 32'h1;
parameter DDR_DDRC_PHY_PC_RANK_PHY_PC_RANK = 32'h0;
parameter DDR_DDRC_PHY_RANKS_TO_TRAIN_PHY_RANKS_TO_TRAIN = 32'h3;
parameter DDR_DDRC_CFG_RMW_EN_CFG_RMW_EN = 32'h1;
parameter DDR_DDRC_CFG_ECC_CORRECTION_EN_CFG_ECC_CORRECTION_EN = 32'h1;
parameter DDR_DDRC_CFG_ONLY_SRANK_CMDS_CFG_ONLY_SRANK_CMDS = 32'h0;
parameter DDR_DDRC_INIT_RDIMM_COMPLETE_INIT_RDIMM_COMPLETE = 32'h0;
parameter DDR_DDRC_CFG_DM_EN_CFG_DM_EN = 32'h1;
parameter DDR_DDRC_CFG_AL_MODE_CFG_AL_MODE = 32'h0;
parameter DDR_DDRC_CFG_BL_MODE_CFG_BL_MODE = 32'h0;
parameter DDR_DDRC_CFG_RTT_WR_CFG_RTT_WR = 32'h0;
parameter DDR_DDRC_CFG_SRT_CFG_SRT = 32'h0;
parameter DDR_DDRC_CFG_ADDR_MIRROR_CFG_ADDR_MIRROR = 32'h0;
parameter DDR_DDRC_CFG_ZQ_CAL_TYPE_CFG_ZQ_CAL_TYPE = 32'h0;
parameter DDR_DDRC_CFG_REGDIMM_CFG_REGDIMM = 32'h0;
parameter DDR_DDRC_CFG_PASR_CFG_PASR = 32'h0;
parameter DDR_DDRC_CFG_BT_CFG_BT = 32'h0;
parameter DDR_DDRC_CFG_DS_CFG_DS = 32'h0;
parameter DDR_DDRC_CFG_RTT_CFG_RTT = 32'h1;
parameter DDR_DDRC_CFG_BANKADDR_MAP_1_CFG_BANKADDR_MAP_1 = 32'h0;
parameter DDR_DDRC_CFG_NIBBLE_DEVICES_CFG_NIBBLE_DEVICES = 32'h0;
parameter DDR_DDRC_CTRLR_SOFT_RESET_N_CTRLR_SOFT_RESET_N = 32'h0;
parameter DDR_DDRC_CFG_READ_TO_WRITE_CFG_READ_TO_WRITE = 32'h2;
parameter DDR_DDRC_CFG_WRITE_TO_WRITE_CFG_WRITE_TO_WRITE = 32'h3;
parameter DDR_DDRC_CFG_READ_TO_READ_CFG_READ_TO_READ = 32'h3;
parameter DDR_DDRC_CFG_WRITE_TO_READ_CFG_WRITE_TO_READ = 32'h8;
parameter DDR_DDRC_CFG_READ_TO_WRITE_ODT_CFG_READ_TO_WRITE_ODT = 32'h2;
parameter DDR_DDRC_CFG_WRITE_TO_WRITE_ODT_CFG_WRITE_TO_WRITE_ODT = 32'h3;
parameter DDR_DDRC_CFG_READ_TO_READ_ODT_CFG_READ_TO_READ_ODT = 32'h3;
parameter DDR_DDRC_CFG_WRITE_TO_READ_ODT_CFG_WRITE_TO_READ_ODT = 32'h2;
parameter DDR_DDRC_CFG_MIN_READ_IDLE_CFG_MIN_READ_IDLE = 32'h0;
parameter DDR_DDRC_CFG_QOFF_CFG_QOFF = 32'h0;
parameter DDR_DDRC_CFG_DLL_DISABLE_CFG_DLL_DISABLE = 32'h0;
parameter DDR_DDRC_CFG_ODT_RD_MAP_CS2_CFG_ODT_RD_MAP_CS2 = 32'h8;
parameter DDR_DDRC_CFG_ODT_RD_MAP_CS3_CFG_ODT_RD_MAP_CS3 = 32'h4;
parameter DDR_DDRC_CFG_ODT_RD_MAP_CS4_CFG_ODT_RD_MAP_CS4 = 32'h20;
parameter DDR_DDRC_CFG_ODT_RD_MAP_CS5_CFG_ODT_RD_MAP_CS5 = 32'h10;
parameter DDR_DDRC_CFG_ODT_RD_MAP_CS6_CFG_ODT_RD_MAP_CS6 = 32'h80;
parameter DDR_DDRC_CFG_ODT_RD_MAP_CS7_CFG_ODT_RD_MAP_CS7 = 32'h40;
parameter DDR_DDRC_CFG_ODT_WR_MAP_CS2_CFG_ODT_WR_MAP_CS2 = 32'h4;
parameter DDR_DDRC_CFG_ODT_WR_MAP_CS3_CFG_ODT_WR_MAP_CS3 = 32'h8;
parameter DDR_DDRC_CFG_ODT_WR_MAP_CS4_CFG_ODT_WR_MAP_CS4 = 32'h10;
parameter DDR_DDRC_CFG_ODT_WR_MAP_CS5_CFG_ODT_WR_MAP_CS5 = 32'h20;
parameter DDR_DDRC_CFG_ODT_WR_MAP_CS6_CFG_ODT_WR_MAP_CS6 = 32'h40;
parameter DDR_DDRC_CFG_ODT_WR_MAP_CS7_CFG_ODT_WR_MAP_CS7 = 32'h80;
parameter DDR_DDRC_CFG_ODT_RD_TURN_ON_CFG_ODT_RD_TURN_ON = 32'h0;
parameter DDR_DDRC_CFG_ODT_WR_TURN_ON_CFG_ODT_WR_TURN_ON = 32'h0;
parameter DDR_DDRC_CFG_ODT_RD_TURN_OFF_CFG_ODT_RD_TURN_OFF = 32'h0;
parameter DDR_DDRC_CFG_ODT_WR_TURN_OFF_CFG_ODT_WR_TURN_OFF = 32'h0;
parameter DDR_DDRC_CFG_EMR3_CFG_EMR3 = 32'h0;
parameter DDR_DDRC_CFG_TWO_T_CFG_TWO_T = 32'h0;
parameter DDR_DDRC_CFG_TWO_T_SEL_CYCLE_CFG_TWO_T_SEL_CYCLE = 32'h0;
parameter DDR_DDRC_CFG_TDQS_CFG_TDQS = 32'h0;
parameter DDR_DDRC_CFG_AUTO_SR_CFG_AUTO_SR = 32'h0;
parameter DDR_DDRC_CFG_AUTO_ZQ_CAL_EN_CFG_AUTO_ZQ_CAL_EN = 32'h1;
parameter DDR_DDRC_CFG_MEMORY_TYPE_CFG_MEMORY_TYPE = 32'h8;
parameter DDR_DDRC_CFG_QUAD_RANK_CFG_QUAD_RANK = 32'h0;
parameter DDR_DDRC_CFG_EARLY_RANK_TO_WR_START_CFG_EARLY_RANK_TO_WR_START = 32'h0;
parameter DDR_DDRC_CFG_EARLY_RANK_TO_RD_START_CFG_EARLY_RANK_TO_RD_START = 32'h0;
parameter DDR_DDRC_CFG_CAL_READ_PERIOD_CFG_CAL_READ_PERIOD = 32'h0;
parameter DDR_DDRC_CFG_NUM_CAL_READS_CFG_NUM_CAL_READS = 32'h0;
parameter DDR_DDRC_CFG_CTRLR_INIT_DISABLE_CFG_CTRLR_INIT_DISABLE = 32'h0;
parameter DDR_DDRC_CFG_RDIMM_LAT_CFG_RDIMM_LAT = 32'h0;
parameter DDR_DDRC_CFG_CTRLUPD_TRIG_CFG_CTRLUPD_TRIG = 32'h1;
parameter DDR_DDRC_CFG_CTRLUPD_START_DELAY_CFG_CTRLUPD_START_DELAY = 32'h16;
parameter DDR_DDRC_CFG_DFI_T_CTRLUPD_MAX_CFG_DFI_T_CTRLUPD_MAX = 32'hC8;
parameter DDR_DDRC_CFG_DFI_T_RDDATA_EN_CFG_DFI_T_RDDATA_EN = 32'h11;
parameter DDR_DDRC_CFG_DFI_T_PHY_WRLAT_CFG_DFI_T_PHY_WRLAT = 32'h5;
parameter DDR_DDRC_PHY_DFI_INIT_START_PHY_DFI_INIT_START = 32'h0;
parameter DDR_DDRC_PHY_RESET_CONTROL_PHY_RESET_CONTROL = 32'h800D;
parameter DDR_DDRC_PHY_GATE_TRAIN_DELAY_PHY_GATE_TRAIN_DELAY = 32'h1E;
parameter DDR_DDRC_PHY_EYE_TRAIN_DELAY_PHY_EYE_TRAIN_DELAY = 32'h28;
parameter DDR_DDRC_PHY_TRAIN_STEP_ENABLE_PHY_TRAIN_STEP_ENABLE = 32'h18;
parameter DDR_DDRC_PHY_INDPNDT_TRAINING_PHY_INDPNDT_TRAINING = 32'h0;
parameter DDR_DDRC_CFG_DQ_WIDTH_CFG_DQ_WIDTH = 32'h0;
parameter DDR_DDRC_CFG_CA_PARITY_ERR_STATUS_CFG_CA_PARITY_ERR_STATUS = 32'h0;
parameter DDR_DDRC_CFG_PARITY_RDIMM_DELAY_CFG_PARITY_RDIMM_DELAY = 32'h1;
parameter DDR_DDRC_CFG_DFI_T_PHY_RDLAT_CFG_DFI_T_PHY_RDLAT = 32'h6;
parameter DDR_DDRC_CFG_DATA_MASK_CFG_DATA_MASK = 32'h4;
parameter DDR_MODEL_DATA_LANES_USED_DATA_LANES = 3'h4;
parameter DDR_DDRC_CFG_CCD_S_CFG_CCD_S = 32'h5;
parameter DDR_DDRC_CFG_CCD_L_CFG_CCD_L = 32'h6;
parameter DDR_DDRC_CFG_RRD_S_CFG_RRD_S = 32'h4;
parameter DDR_DDRC_CFG_RRD_L_CFG_RRD_L = 32'h3;
parameter DDR_DDRC_CFG_WTR_S_CFG_WTR_S = 32'h3;
parameter DDR_DDRC_CFG_WTR_L_CFG_WTR_L = 32'h3;
parameter DDR_DDRC_CFG_WTR_S_CRC_DM_CFG_WTR_S_CRC_DM = 32'h3;
parameter DDR_DDRC_CFG_WTR_L_CRC_DM_CFG_WTR_L_CRC_DM = 32'h3;
parameter DDR_DDRC_CFG_WR_CRC_DM_CFG_WR_CRC_DM = 32'h6;
parameter DDR_DDRC_CFG_VREFDQ_TRN_VALUE_CFG_VREFDQ_TRN_VALUE = 32'h0;
parameter DDR_DDRC_CFG_RFC1_CFG_RFC1 = 32'h36;
parameter DDR_DDRC_CFG_RFC2_CFG_RFC2 = 32'h36;
parameter DDR_DDRC_CFG_RFC4_CFG_RFC4 = 32'h36;
parameter DDR_DDRC_CFG_FINE_GRAN_REF_MODE_CFG_FINE_GRAN_REF_MODE = 32'h0;
parameter DDR_DDRC_CFG_RD_PREAMBLE_CFG_RD_PREAMBLE = 32'h0;
parameter DDR_DDRC_CFG_SR_ABORT_CFG_SR_ABORT = 32'h0;
parameter DDR_DDRC_CFG_INT_VREF_MON_CFG_INT_VREF_MON = 32'h0;
parameter DDR_DDRC_CFG_TEMP_CTRL_REF_MODE_CFG_TEMP_CTRL_REF_MODE = 32'h0;
parameter DDR_DDRC_CFG_TEMP_CTRL_REF_RANGE_CFG_TEMP_CTRL_REF_RANGE = 32'h0;
parameter DDR_DDRC_CFG_RTT_PARK_CFG_RTT_PARK = 32'h0;
parameter DDR_DDRC_CFG_ODT_INBUF_4_PD_CFG_ODT_INBUF_4_PD = 32'h0;
parameter DDR_DDRC_CFG_CA_PARITY_LATENCY_CFG_CA_PARITY_LATENCY = 32'h0;
parameter DDR_DDRC_CFG_VREFDQ_TRN_ENABLE_CFG_VREFDQ_TRN_ENABLE = 32'h0;
parameter DDR_DDRC_CFG_VREFDQ_TRN_RANGE_CFG_VREFDQ_TRN_RANGE = 32'h0;
parameter DDR_DDRC_CFG_LP_ASR_CFG_LP_ASR = 32'h0;
parameter DDR_DDRC_CFG_WR_PREAMBLE_CFG_WR_PREAMBLE = 32'h0;
parameter DDR_DDRC_CFG_RFC_DLR1_CFG_RFC_DLR1 = 32'h48;
parameter DDR_DDRC_CFG_RFC_DLR2_CFG_RFC_DLR2 = 32'h2C;
parameter DDR_DDRC_CFG_RFC_DLR4_CFG_RFC_DLR4 = 32'h20;
parameter DDR_DDRC_CFG_RRD_DLR_CFG_RRD_DLR = 32'h4;
parameter DDR_DDRC_CFG_FAW_DLR_CFG_FAW_DLR = 32'h10;
parameter DDR_DDRC_CFG_BG_INTERLEAVE_CFG_BG_INTERLEAVE = 32'h1;
parameter DDR_DDRC_CFG_MRR_CFG_MRR = 32'h2;
parameter DDR_DDRC_CFG_MRW_CFG_MRW = 32'h10;
parameter DDR_DDRC_CFG_XP_CFG_XP = 32'h3;
parameter DDR_DDRC_CFG_XSR_CFG_XSR = 32'h24;
parameter DDR_DDRC_CFG_INIT_DURATION_CFG_INIT_DURATION = 32'h29B0;
parameter DDR_DDRC_CFG_ZQ_CAL_R_DURATION_CFG_ZQ_CAL_R_DURATION = 32'hB;
parameter DDR_DDRC_CFG_ODT_POWERDOWN_CFG_ODT_POWERDOWN = 32'h0;
parameter DDR_DDRC_CFG_WL_CFG_WL = 32'h9;
parameter DDR_DDRC_CFG_RL_CFG_RL = 32'hC;
parameter DDR_DDRC_CFG_BL_CFG_BL = 32'h0;
parameter DDR_OPTIONS_TIP_CFG_PARAMS_ADDCMD_OFFSET = 3'h0;
parameter DDR_DDRC_CFG_ZQLATCH_DURATION_CFG_ZQLATCH_DURATION = 32'h30;
parameter DDR_DDRC_CFG_ZQ_CAL_DURATION_CFG_ZQ_CAL_DURATION = 32'h640;
parameter DDR_DDRC_CFG_MRRI_CFG_MRRI = 32'h0;
parameter DDR_DDRC_CFG_WR_POSTAMBLE_CFG_WR_POSTAMBLE = 32'h0;
parameter DDR_DDRC_CFG_SOC_ODT_CFG_SOC_ODT = 32'h0;
parameter DDR_DDRC_CFG_ODTE_CK_CFG_ODTE_CK = 32'h0;
parameter DDR_DDRC_CFG_ODTE_CS_CFG_ODTE_CS = 32'h0;
parameter DDR_DDRC_CFG_ODTD_CA_CFG_ODTD_CA = 32'h0;
parameter DDR_DDRC_CFG_RD_PREAMB_TOGGLE_CFG_RD_PREAMB_TOGGLE = 32'h0;
parameter DDR_DDRC_CFG_RD_POSTAMBLE_CFG_RD_POSTAMBLE = 32'h0;
parameter DDR_DDRC_CFG_PU_CAL_CFG_PU_CAL = 32'h0;
parameter DDR_DDRC_CFG_DQ_ODT_CFG_DQ_ODT = 32'h0;
parameter DDR_DDRC_CFG_CA_ODT_CFG_CA_ODT = 32'h0;
parameter DDR_DDRC_CFG_MRD_CFG_MRD = 32'h10;
parameter DDR_DDRC_CFG_LPDDR4_FSP_OP_CFG_LPDDR4_FSP_OP = 32'h0;
parameter CLK_MSS_SYS_CLOCK_CONFIG_CR_DIVIDER_CPU = 2'h0;
parameter CLK_MSS_SYS_CLOCK_CONFIG_CR_DIVIDER_AXI = 2'h1;
parameter CLK_MSS_SYS_CLOCK_CONFIG_CR_DIVIDER_APB_AHB = 2'h2;
parameter CLK_MSS_CFM_PLL_CKMUX_PLL1_RFCLK0_SEL = 2'h1;
parameter CLK_MSS_CFM_PLL_CKMUX_PLL1_RFCLK1_SEL = 2'h1;
parameter CLK_MSS_CFM_PLL_CKMUX_PLL0_RFCLK0_SEL = 2'h1;
parameter CLK_MSS_CFM_PLL_CKMUX_PLL0_RFCLK1_SEL = 2'h1;
parameter CLK_MSS_CFM_PLL_CKMUX_CLK_IN_MAC_TSU_SEL = 2'h1;
parameter SGMII_CLK_CNTL_REG_CLKMUX_PLL0_RFCLK0_SEL = 2'h1;
parameter SGMII_CLK_CNTL_REG_CLKMUX_PLL0_RFCLK1_SEL = 2'h1;
parameter CLK_MSS_CFM_MSSCLKMUX_MSSCLK_MUX_SEL = 2'h3;
parameter CLK_MSS_CFM_MSSCLKMUX_CLK_STANDBY_SEL = 1'h0;
parameter CLK_MSS_CFM_BCLKMUX_BCLK0_SEL = 5'h8;
parameter CLK_MSS_CFM_BCLKMUX_BCLK1_SEL = 5'h10;
parameter CLK_MSS_CFM_BCLKMUX_BCLK2_SEL = 5'h0;
parameter CLK_MSS_CFM_BCLKMUX_BCLK3_SEL = 5'h0;
parameter CLK_MSS_CFM_BCLKMUX_BCLK4_SEL = 5'h0;
parameter CLK_MSS_CFM_BCLKMUX_BCLK5_SEL = 5'h0;
parameter CLK_MSS_PLL_PLL_CTRL_REG_RFCLK_SEL = 1'h0;
parameter CLK_SGMII_PLL_PLL_CTRL_REG_RFCLK_SEL = 1'h0;
parameter CLK_DDR_PLL_PLL_CTRL_REG_RFCLK_SEL = 1'h0;
parameter DDR_MODEL_DDRPHY_MODE_DDRMODE = 3'h7;
parameter DDR_MODEL_DDRPHY_MODE_POWER_DOWN = 1'h1;
parameter DDR_MODEL_DDRPHY_MODE_CRC = 1'h0;
parameter DDR_MODEL_DDRPHY_MODE_ECC = 1'h1;
parameter DDR_MODEL_DDRPHY_MODE_BUS_WIDTH = 3'h1;
parameter DDR_MODEL_DDRPHY_MODE_DMI_DBI = 1'h1;
parameter DDR_MODEL_DDRPHY_MODE_RANK = 1'h1;
parameter DDR_MODEL_DDRPHY_MODE_DQ_DRIVE = 2'h0;
parameter DDR_MODEL_DDRPHY_MODE_DQS_DRIVE = 2'h0;
parameter DDR_MODEL_DDRPHY_MODE_ADD_CMD_DRIVE = 2'h0;
parameter DDR_MODEL_DDRPHY_MODE_CLOCK_OUT_DRIVE = 2'h0;
parameter DDR_IOBANK_RPC_ODT_DQ_RPC_ODT_DQ = 32'h4;
parameter DDR_IOBANK_RPC_ODT_DQS_RPC_ODT_DQS = 32'h4;
parameter DDR_IOBANK_DPC_BITS_DPC_VRGEN_V = 6'h1E;
parameter DDR_IOBANK_DPC_BITS_DPC_VRGEN_H = 6'h3C;
parameter DDR_IOBANK_DPC_BITS_DPC_VRGEN_EN_V = 1'h1;
parameter DDR_IOBANK_DPC_BITS_DPC_VRGEN_EN_H = 1'h1;
parameter DDR_IOBANK_DPC_BITS_DPC_MOVE_EN_V = 1'h0;
parameter DDR_IOBANK_DPC_BITS_DPC_MOVE_EN_H = 1'h0;
parameter DDR_IOBANK_DPC_BITS_DPC_VS = 4'h5;
parameter DDR_IOBANK_RPC_ODT_STATIC_DQ_RPC_ODT_STATIC_DQ = 32'h7;
parameter DDR_IOBANK_RPC_ODT_STATIC_DQS_RPC_ODT_STATIC_DQS = 32'h7;
parameter DDR_IOBANK_RPC_ODT_STATIC_ADDCMD_RPC_ODT_STATIC_ADDCMD = 32'h7;
parameter DDR_IOBANK_RPC_ODT_STATIC_CLKP_RPC_ODT_STATIC_CLKP = 32'h7;
parameter DDR_IOBANK_RPC_ODT_STATIC_CLKN_RPC_ODT_STATIC_CLKN = 32'h7;
parameter DDR_IOBANK_RPC_IBUFMD_ADDCMD_RPC_IBUFMD_ADDCMD = 32'h3;
parameter DDR_IOBANK_RPC_IBUFMD_CLK_RPC_IBUFMD_CLK = 32'h4;
parameter DDR_IOBANK_RPC_IBUFMD_DQ_RPC_IBUFMD_DQ = 32'h3;
parameter DDR_IOBANK_RPC_IBUFMD_DQS_RPC_IBUFMD_DQS = 32'h4;
parameter DDR_IOBANK_RPC_SPARE0_DQ_RPC_SPARE0_DQ = 32'h0;
parameter SGMII_SPARE_CNTL_REG_SPARE = 32'h0;
parameter TRACE_CR_ULTRASOC_FABRIC = 1'h0;
parameter MSS_IO_LOCKDOWN_CR_MSSIO_B2_LOCKDN_EN = 1'h0;
parameter MSS_IO_LOCKDOWN_CR_MSSIO_B4_LOCKDN_EN = 1'h0;
parameter MSS_IO_LOCKDOWN_CR_SGMII_IO_LOCKDN_EN = 1'h0;
parameter MSS_IO_LOCKDOWN_CR_DDR_IO_LOCKDN_EN = 1'h0;
parameter DLL0_CTRL0_PHASE_P = 2'h0;
parameter DLL0_CTRL0_PHASE_S = 2'h0;
parameter DLL0_CTRL0_SEL_P = 2'h0;
parameter DLL0_CTRL0_SEL_S = 2'h0;
parameter DLL0_CTRL0_REF_SEL = 1'h0;
parameter DLL0_CTRL0_FB_SEL = 1'h0;
parameter DLL0_CTRL0_DIV_SEL = 1'h0;
parameter DLL0_CTRL0_ALU_UPD = 2'h0;
parameter DLL0_CTRL0_LOCK_FRC = 1'h0;
parameter DLL0_CTRL0_LOCK_FLT = 2'h0;
parameter DLL0_CTRL0_LOCK_HIGH = 4'h0;
parameter DLL0_CTRL0_LOCK_LOW = 4'h0;
parameter DLL0_CTRL1_SET_ALU = 8'h0;
parameter DLL0_CTRL1_ADJ_DEL4 = 7'h0;
parameter DLL0_CTRL1_TEST_S = 1'h0;
parameter DLL0_CTRL1_TEST_RING = 1'h0;
parameter DLL0_CTRL1_INIT_CODE = 6'h0;
parameter DLL0_CTRL1_RELOCK_FAST = 1'h0;
parameter DLL0_STAT0_RESET = 1'h0;
parameter DLL0_STAT0_BYPASS = 1'h0;
parameter DLL0_STAT0_PHASE_MOVE_CLK = 1'h0;
parameter DLL1_CTRL0_PHASE_P = 2'h0;
parameter DLL1_CTRL0_PHASE_S = 2'h0;
parameter DLL1_CTRL0_SEL_P = 2'h0;
parameter DLL1_CTRL0_SEL_S = 2'h0;
parameter DLL1_CTRL0_REF_SEL = 1'h0;
parameter DLL1_CTRL0_FB_SEL = 1'h0;
parameter DLL1_CTRL0_DIV_SEL = 1'h0;
parameter DLL1_CTRL0_ALU_UPD = 2'h0;
parameter DLL1_CTRL0_LOCK_FRC = 1'h0;
parameter DLL1_CTRL0_LOCK_FLT = 2'h0;
parameter DLL1_CTRL0_LOCK_HIGH = 4'h0;
parameter DLL1_CTRL0_LOCK_LOW = 4'h0;
parameter DLL1_CTRL1_SET_ALU = 8'h0;
parameter DLL1_CTRL1_ADJ_DEL4 = 7'h0;
parameter DLL1_CTRL1_TEST_S = 1'h0;
parameter DLL1_CTRL1_TEST_RING = 1'h0;
parameter DLL1_CTRL1_INIT_CODE = 6'h0;
parameter DLL1_CTRL1_RELOCK_FAST = 1'h0;
parameter DLL1_STAT0_RESET = 1'h0;
parameter DLL1_STAT0_BYPASS = 1'h0;
parameter DLL1_STAT0_PHASE_MOVE_CLK = 1'h0;
parameter DLL2_CTRL0_PHASE_P = 2'h0;
parameter DLL2_CTRL0_PHASE_S = 2'h0;
parameter DLL2_CTRL0_SEL_P = 2'h0;
parameter DLL2_CTRL0_SEL_S = 2'h0;
parameter DLL2_CTRL0_REF_SEL = 1'h0;
parameter DLL2_CTRL0_FB_SEL = 1'h0;
parameter DLL2_CTRL0_DIV_SEL = 1'h0;
parameter DLL2_CTRL0_ALU_UPD = 2'h0;
parameter DLL2_CTRL0_LOCK_FRC = 1'h0;
parameter DLL2_CTRL0_LOCK_FLT = 2'h0;
parameter DLL2_CTRL0_LOCK_HIGH = 4'h0;
parameter DLL2_CTRL0_LOCK_LOW = 4'h0;
parameter DLL2_CTRL1_SET_ALU = 8'h0;
parameter DLL2_CTRL1_ADJ_DEL4 = 7'h0;
parameter DLL2_CTRL1_TEST_S = 1'h0;
parameter DLL2_CTRL1_TEST_RING = 1'h0;
parameter DLL2_CTRL1_INIT_CODE = 6'h0;
parameter DLL2_CTRL1_RELOCK_FAST = 1'h0;
parameter DLL2_STAT0_RESET = 1'h0;
parameter DLL2_STAT0_BYPASS = 1'h0;
parameter DLL2_STAT0_PHASE_MOVE_CLK = 1'h0;
parameter DLL3_CTRL0_PHASE_P = 2'h0;
parameter DLL3_CTRL0_PHASE_S = 2'h0;
parameter DLL3_CTRL0_SEL_P = 2'h0;
parameter DLL3_CTRL0_SEL_S = 2'h0;
parameter DLL3_CTRL0_REF_SEL = 1'h0;
parameter DLL3_CTRL0_FB_SEL = 1'h0;
parameter DLL3_CTRL0_DIV_SEL = 1'h0;
parameter DLL3_CTRL0_ALU_UPD = 2'h0;
parameter DLL3_CTRL0_LOCK_FRC = 1'h0;
parameter DLL3_CTRL0_LOCK_FLT = 2'h0;
parameter DLL3_CTRL0_LOCK_HIGH = 4'h0;
parameter DLL3_CTRL0_LOCK_LOW = 4'h0;
parameter DLL3_CTRL1_SET_ALU = 8'h0;
parameter DLL3_CTRL1_ADJ_DEL4 = 7'h0;
parameter DLL3_CTRL1_TEST_S = 1'h0;
parameter DLL3_CTRL1_TEST_RING = 1'h0;
parameter DLL3_CTRL1_INIT_CODE = 6'h0;
parameter DLL3_CTRL1_RELOCK_FAST = 1'h0;
parameter DLL3_STAT0_RESET = 1'h0;
parameter DLL3_STAT0_BYPASS = 1'h0;
parameter DLL3_STAT0_PHASE_MOVE_CLK = 1'h0;
parameter CRYPTO_SOFT_RESET_PERIPH = 1'h0;
parameter CRYPTO_DLL_CTRL0_PHASE_P = 2'h0;
parameter CRYPTO_DLL_CTRL0_PHASE_S = 2'h0;
parameter CRYPTO_DLL_CTRL0_SEL_P = 2'h0;
parameter CRYPTO_DLL_CTRL0_SEL_S = 2'h0;
parameter CRYPTO_DLL_CTRL0_REF_SEL = 1'h0;
parameter CRYPTO_DLL_CTRL0_FB_SEL = 1'h0;
parameter CRYPTO_DLL_CTRL0_DIV_SEL = 1'h0;
parameter CRYPTO_DLL_CTRL0_ALU_UPD = 2'h0;
parameter CRYPTO_DLL_CTRL0_LOCK_FRC = 1'h0;
parameter CRYPTO_DLL_CTRL0_LOCK_FLT = 2'h0;
parameter CRYPTO_DLL_CTRL0_LOCK_HIGH = 4'h0;
parameter CRYPTO_DLL_CTRL0_LOCK_LOW = 4'h0;
parameter CRYPTO_DLL_CTRL1_SET_ALU = 8'h0;
parameter CRYPTO_DLL_CTRL1_ADJ_DEL4 = 7'h0;
parameter CRYPTO_DLL_CTRL1_TEST_S = 1'h0;
parameter CRYPTO_DLL_CTRL1_TEST_RING = 1'h0;
parameter CRYPTO_DLL_CTRL1_INIT_CODE = 6'h0;
parameter CRYPTO_DLL_CTRL1_RELOCK_FAST = 1'h0;
parameter CRYPTO_DLL_STAT0_RESET = 1'h0;
parameter CRYPTO_DLL_STAT0_BYPASS = 1'h0;
parameter CRYPTO_DLL_STAT0_PHASE_MOVE_CLK = 1'h0;
parameter CRYPTO_CONTROL_USER_SCB_CONTROL = 1'h0;
parameter CRYPTO_CONTROL_USER_RESET = 1'h0;
parameter CRYPTO_CONTROL_USER_CLOCK_ENABLE = 1'h0;
parameter CRYPTO_CONTROL_USER_CLOCK_SELECT = 2'h0;
parameter CRYPTO_CONTROL_USER_RAMS_ON = 1'h0;
parameter CRYPTO_CONTROL_USER_DLL_ON = 1'h0;
parameter CRYPTO_CONTROL_USER_RING_OSC_ON = 1'h0;
parameter CRYPTO_CONTROL_USER_PURGE = 1'h0;
parameter CRYPTO_CONTROL_USER_GO = 1'h0;
parameter CRYPTO_INTERRUPT_ENABLE_COMPLETE = 1'h0;
parameter CRYPTO_INTERRUPT_ENABLE_ALARM = 1'h0;
parameter CRYPTO_INTERRUPT_ENABLE_BUSERROR = 1'h0;
parameter CRYPTO_MARGIN_RAM = 3'h0;
parameter CRYPTO_MARGIN_ROM = 3'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module OSC_RC160MHZ(
       OSC_160MHZ_ON,
       CLK
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  OSC_160MHZ_ON;
output CLK;

endmodule
`timescale 1 ns/100 ps
// Version: 


module OSC_RC200MHZ(
       OSC_200MHZ_ON,
       CLK
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  OSC_200MHZ_ON;
output CLK;

endmodule
`timescale 1 ns/100 ps
// Version: 


module OSC_RC2MHZ(
       OSC_2MHZ_ON,
       CLK
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  OSC_2MHZ_ON;
output CLK;

endmodule
`timescale 1 ns/100 ps
// Version: 


module PCIE_COMMON(
       AXI_CLK,
       AXI_CLK_STABLE,
       PHY_DEBUG,
       PCS_DEBUG,
       PCIE_DEBUG,
       AXI_CLK_OUT,
       PCS_DEBUG_0,
       PMA_DEBUG_0,
       PCS_DEBUG_1,
       PMA_DEBUG_1,
       PCS_DEBUG_2,
       PMA_DEBUG_2,
       PCS_DEBUG_3,
       PMA_DEBUG_3,
       PCIE_DEBUG_0,
       PCIE_DEBUG_1,
       DLL_OUT,
       AXI_CLK_STABLE_OUT
    ) ;
/* synthesis syn_black_box

syn_tpd0 = " AXI_CLK->AXI_CLK_OUT = 1.438"
*/
/* synthesis black_box_pad_pin ="" */
input  AXI_CLK;
input  AXI_CLK_STABLE;
output [3:0] PHY_DEBUG;
output [19:0] PCS_DEBUG;
output [31:0] PCIE_DEBUG;
output AXI_CLK_OUT;
input  [19:0] PCS_DEBUG_0;
input  PMA_DEBUG_0;
input  [19:0] PCS_DEBUG_1;
input  PMA_DEBUG_1;
input  [19:0] PCS_DEBUG_2;
input  PMA_DEBUG_2;
input  [19:0] PCS_DEBUG_3;
input  PMA_DEBUG_3;
input  [31:0] PCIE_DEBUG_0;
input  [31:0] PCIE_DEBUG_1;
output DLL_OUT;
output AXI_CLK_STABLE_OUT;
parameter MAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter MAIN_SOFT_RESET_V_MAP = 1'h0;
parameter MAIN_OVRLY_AXI0_IFC_MODE = 2'h0;
parameter MAIN_OVRLY_AXI1_IFC_MODE = 2'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCIE_0_PCLK_SEL = 3'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCIE_1_PCLK_SEL = 3'h0;
parameter MAIN_CLK_CTRL_AXI0_CLKENA = 1'h0;
parameter MAIN_CLK_CTRL_AXI1_CLKENA = 1'h0;
parameter MAIN_DLL_STAT0_LOCK_INT_EN = 1'h0;
parameter MAIN_DLL_STAT0_UNLOCK_INT_EN = 1'h0;
parameter MAIN_DLL_STAT0_LOCK_INT = 1'h0;
parameter MAIN_DLL_STAT0_UNLOCK_INT = 1'h0;
parameter MAIN_TEST_DLL_RING_OSC_ENABLE = 1'h0;
parameter MAIN_TEST_DLL_REF_ENABLE = 1'h0;
parameter MAIN_SPARE_SCRATCHPAD = 8'h0;
parameter MAIN_SPARE_SPARE_CTRL = 24'h0;
parameter MAIN_SOFT_RESET_PERIPH = 1'h0;
parameter MAIN_MAJOR_PCIE_USAGE_MODE = 4'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN0_SEL = 2'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN1_SEL = 2'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN2_SEL = 1'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN3_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN0_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN1_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN2_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN3_SEL = 1'h0;
parameter MAIN_QMUX_R0_PCIE_DBG_SEL = 3'h0;
parameter MAIN_DLL_CTRL0_PHASE_P = 2'h0;
parameter MAIN_DLL_CTRL0_PHASE_S = 2'h0;
parameter MAIN_DLL_CTRL0_SEL_P = 2'h0;
parameter MAIN_DLL_CTRL0_SEL_S = 2'h0;
parameter MAIN_DLL_CTRL0_REF_SEL = 1'h0;
parameter MAIN_DLL_CTRL0_FB_SEL = 1'h0;
parameter MAIN_DLL_CTRL0_DIV_SEL = 1'h0;
parameter MAIN_DLL_CTRL0_ALU_UPD = 2'h0;
parameter MAIN_DLL_CTRL0_LOCK_FRC = 1'h0;
parameter MAIN_DLL_CTRL0_LOCK_FLT = 2'h0;
parameter MAIN_DLL_CTRL0_LOCK_HIGH = 4'h0;
parameter MAIN_DLL_CTRL0_LOCK_LOW = 4'h0;
parameter MAIN_DLL_CTRL1_SET_ALU = 8'h0;
parameter MAIN_DLL_CTRL1_ADJ_DEL4 = 7'h0;
parameter MAIN_DLL_CTRL1_TEST_S = 1'h0;
parameter MAIN_DLL_CTRL1_TEST_RING = 1'h0;
parameter MAIN_DLL_CTRL1_INIT_CODE = 6'h0;
parameter MAIN_DLL_CTRL1_RELOCK_FAST = 1'h0;
parameter MAIN_DLL_STAT0_RESET = 1'h0;
parameter MAIN_DLL_STAT0_PHASE_MOVE_CLK = 1'h0;
parameter PMA_CMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_0_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_1_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_2_SEL = 5'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_MODE = 3'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_X = 2'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_Y = 2'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module PCIE(
       M_ARREADY,
       M_AWREADY,
       M_BID,
       M_BRESP,
       M_BVALID,
       M_RDERR,
       M_RID,
       M_RLAST,
       M_RRESP,
       M_RVALID,
       M_WREADY,
       S_ARADDR_24,
       S_ARADDR_25,
       S_ARADDR_26,
       S_ARADDR_27,
       S_ARADDR_29,
       S_ARBURST,
       S_ARID,
       S_ARLEN,
       S_ARSIZE,
       S_ARVALID,
       S_AWADDR_24,
       S_AWADDR_25,
       S_AWADDR_26,
       S_AWADDR_27,
       S_AWADDR_29,
       S_AWBURST,
       S_AWID,
       S_AWLEN,
       S_AWSIZE,
       S_AWVALID,
       S_BREADY,
       S_RREADY,
       S_WDERR,
       S_WLAST,
       S_WSTRB,
       S_WVALID,
       INTERRUPT,
       MPERST_N,
       TL_CLK,
       WAKEREQ,
       M_ARADDR_24,
       M_ARADDR_25,
       M_ARADDR_26,
       M_ARADDR_27,
       M_ARBURST,
       M_ARID,
       M_ARLEN,
       M_ARSIZE,
       M_ARVALID,
       M_AWADDR_24,
       M_AWADDR_25,
       M_AWADDR_26,
       M_AWADDR_27,
       M_AWBURST,
       M_AWID,
       M_AWLEN,
       M_AWSIZE,
       M_AWVALID,
       M_BREADY,
       M_RREADY,
       M_WDERR,
       M_WLAST,
       M_WSTRB,
       M_WVALID,
       S_ARREADY,
       S_AWREADY,
       S_BID,
       S_BRESP,
       S_BVALID,
       S_RDERR,
       S_RID,
       S_RLAST,
       S_RRESP,
       S_RVALID,
       S_WREADY,
       L2_EXIT,
       HOT_RST_EXIT,
       DLUP_EXIT,
       INTERRUPT_OUT,
       LTSSM,
       WAKEREQ_OEN,
       M_ARADDR_31,
       M_ARADDR_30,
       M_ARADDR_29,
       M_ARADDR_28,
       M_ARADDR_0,
       M_ARADDR_1,
       M_ARADDR_2,
       M_ARADDR_3,
       M_ARADDR_4,
       M_ARADDR_5,
       M_ARADDR_6,
       M_ARADDR_7,
       M_ARADDR_8,
       M_ARADDR_9,
       M_ARADDR_10,
       M_ARADDR_11,
       M_ARADDR_12,
       M_ARADDR_13,
       M_ARADDR_14,
       M_ARADDR_15,
       M_ARADDR_16,
       M_ARADDR_17,
       M_ARADDR_18,
       M_ARADDR_19,
       M_ARADDR_20,
       M_ARADDR_21,
       M_ARADDR_22,
       M_ARADDR_23,
       M_AWADDR_31,
       M_AWADDR_30,
       M_AWADDR_29,
       M_AWADDR_28,
       M_AWADDR_0,
       M_AWADDR_1,
       M_AWADDR_2,
       M_AWADDR_3,
       M_AWADDR_4,
       M_AWADDR_5,
       M_AWADDR_6,
       M_AWADDR_7,
       M_AWADDR_8,
       M_AWADDR_9,
       M_AWADDR_10,
       M_AWADDR_11,
       M_AWADDR_12,
       M_AWADDR_13,
       M_AWADDR_14,
       M_AWADDR_15,
       M_AWADDR_16,
       M_AWADDR_17,
       M_AWADDR_18,
       M_AWADDR_19,
       M_AWADDR_20,
       M_AWADDR_21,
       M_AWADDR_22,
       M_AWADDR_23,
       M_RDATA,
       M_WDATA,
       S_ARADDR_31,
       S_ARADDR_30,
       S_ARADDR_28,
       S_ARADDR_0,
       S_ARADDR_1,
       S_ARADDR_2,
       S_ARADDR_3,
       S_ARADDR_4,
       S_ARADDR_5,
       S_ARADDR_6,
       S_ARADDR_7,
       S_ARADDR_8,
       S_ARADDR_9,
       S_ARADDR_10,
       S_ARADDR_11,
       S_ARADDR_12,
       S_ARADDR_13,
       S_ARADDR_14,
       S_ARADDR_15,
       S_ARADDR_16,
       S_ARADDR_17,
       S_ARADDR_18,
       S_ARADDR_19,
       S_ARADDR_20,
       S_ARADDR_21,
       S_ARADDR_22,
       S_ARADDR_23,
       S_AWADDR_31,
       S_AWADDR_30,
       S_AWADDR_28,
       S_AWADDR_0,
       S_AWADDR_1,
       S_AWADDR_2,
       S_AWADDR_3,
       S_AWADDR_4,
       S_AWADDR_5,
       S_AWADDR_6,
       S_AWADDR_7,
       S_AWADDR_8,
       S_AWADDR_9,
       S_AWADDR_10,
       S_AWADDR_11,
       S_AWADDR_12,
       S_AWADDR_13,
       S_AWADDR_14,
       S_AWADDR_15,
       S_AWADDR_16,
       S_AWADDR_17,
       S_AWADDR_18,
       S_AWADDR_19,
       S_AWADDR_20,
       S_AWADDR_21,
       S_AWADDR_22,
       S_AWADDR_23,
       AXI_CLK_STABLE,
       S_RDATA,
       S_WDATA,
       PCIE_DEBUG,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT,
       DRI_BRIDGE_CLK,
       DRI_BRIDGE_CTRL,
       DRI_BRIDGE_WDATA,
       DRI_BRIDGE_ARST_N,
       DRI_BRIDGE_RDATA,
       DRI_BRIDGE_INTERRUPT,
       ARST_N,
       XCVR_ARST_N,
       PHYSTATUS_0,
       PHYSTATUS_1,
       PHYSTATUS_2,
       PHYSTATUS_3,
       POWERDOWN,
       RATE,
       RESET_N,
       RXDATA_0,
       RXDATA_1,
       RXDATA_2,
       RXDATA_3,
       RXDATAK_0,
       RXDATAK_1,
       RXDATAK_2,
       RXDATAK_3,
       RXELECIDLE_0,
       RXELECIDLE_1,
       RXELECIDLE_2,
       RXELECIDLE_3,
       RXPOLARITY_0,
       RXPOLARITY_1,
       RXPOLARITY_2,
       RXPOLARITY_3,
       RXSTANDBYSTATUS_0,
       RXSTANDBYSTATUS_1,
       RXSTANDBYSTATUS_2,
       RXSTANDBYSTATUS_3,
       RXSTATUS_0,
       RXSTATUS_1,
       RXSTATUS_2,
       RXSTATUS_3,
       RXVALID_0,
       RXVALID_1,
       RXVALID_2,
       RXVALID_3,
       TXCOMPLIANCE_0,
       TXCOMPLIANCE_1,
       TXCOMPLIANCE_2,
       TXCOMPLIANCE_3,
       TXDATA_0,
       TXDATA_1,
       TXDATA_2,
       TXDATA_3,
       TXDATAK_0,
       TXDATAK_1,
       TXDATAK_2,
       TXDATAK_3,
       TXDATAVALID_0,
       TXDATAVALID_1,
       TXDATAVALID_2,
       TXDATAVALID_3,
       TXDEEMPH,
       TXDETECTRX_LOOPBACK_0,
       TXDETECTRX_LOOPBACK_1,
       TXDETECTRX_LOOPBACK_2,
       TXDETECTRX_LOOPBACK_3,
       TXELECIDLE_0,
       TXELECIDLE_1,
       TXELECIDLE_2,
       TXELECIDLE_3,
       TXMARGIN,
       TXSWING,
       PIPE_CLK_0,
       PIPE_CLK_1,
       PIPE_CLK_2,
       PIPE_CLK_3,
       PCLK_OUT_0,
       PCLK_OUT_1,
       PCLK_OUT_2,
       PCLK_OUT_3,
       AXI_CLK,
       LINK_BRIDGE_CLK,
       LINK_BRIDGE_ADDR,
       LINK_BRIDGE_EN,
       LINK_BRIDGE_ARST_N,
       LINK_BRIDGE_WDATA,
       LINK_BRIDGE_RDATA,
       LINK_CTRL_CLK,
       LINK_CTRL_ADDR,
       LINK_CTRL_EN,
       LINK_CTRL_ARST_N,
       LINK_CTRL_WDATA,
       LINK_CTRL_RDATA
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " M_ARREADY->AXI_CLK = 1.875"
syn_tsu1 = " M_AWREADY->AXI_CLK = 1.977"
syn_tsu2 = " M_BID[0]->AXI_CLK = 1.99"
syn_tsu3 = " M_BID[1]->AXI_CLK = 2.005"
syn_tsu4 = " M_BID[2]->AXI_CLK = 2.12"
syn_tsu5 = " M_BID[3]->AXI_CLK = 2.1"
syn_tsu6 = " M_BRESP[0]->AXI_CLK = 1.829"
syn_tsu7 = " M_BRESP[1]->AXI_CLK = 1.894"
syn_tsu8 = " M_BVALID->AXI_CLK = 1.799"
syn_tsu9 = " M_RDERR->AXI_CLK = 2.139"
syn_tsu10 = " M_RID[0]->AXI_CLK = 2.092"
syn_tsu11 = " M_RID[1]->AXI_CLK = 2.031"
syn_tsu12 = " M_RID[2]->AXI_CLK = 1.798"
syn_tsu13 = " M_RID[3]->AXI_CLK = 2.087"
syn_tsu14 = " M_RLAST->AXI_CLK = 1.98"
syn_tsu15 = " M_RRESP[0]->AXI_CLK = 2.094"
syn_tsu16 = " M_RRESP[1]->AXI_CLK = 2.106"
syn_tsu17 = " M_RVALID->AXI_CLK = 1.981"
syn_tsu18 = " M_WREADY->AXI_CLK = 2.011"
syn_tsu19 = " S_ARADDR_25->AXI_CLK = 1.977"
syn_tsu20 = " S_ARADDR_29->AXI_CLK = 2.185"
syn_tsu21 = " S_ARBURST[0]->AXI_CLK = 2.097"
syn_tsu22 = " S_ARBURST[1]->AXI_CLK = 1.895"
syn_tsu23 = " S_ARID[0]->AXI_CLK = 1.827"
syn_tsu24 = " S_ARID[1]->AXI_CLK = 2.13"
syn_tsu25 = " S_ARID[2]->AXI_CLK = 1.897"
syn_tsu26 = " S_ARID[3]->AXI_CLK = 2.117"
syn_tsu27 = " S_ARLEN[0]->AXI_CLK = 1.918"
syn_tsu28 = " S_ARLEN[1]->AXI_CLK = 2.154"
syn_tsu29 = " S_ARLEN[2]->AXI_CLK = 2.033"
syn_tsu30 = " S_ARLEN[3]->AXI_CLK = 2.104"
syn_tsu31 = " S_ARLEN[4]->AXI_CLK = 2.134"
syn_tsu32 = " S_ARLEN[5]->AXI_CLK = 2.161"
syn_tsu33 = " S_ARLEN[6]->AXI_CLK = 2.125"
syn_tsu34 = " S_ARLEN[7]->AXI_CLK = 1.927"
syn_tsu35 = " S_ARSIZE[0]->AXI_CLK = 2.1"
syn_tsu36 = " S_ARSIZE[1]->AXI_CLK = 2.141"
syn_tsu37 = " S_ARVALID->AXI_CLK = 2.093"
syn_tsu38 = " S_AWADDR_25->AXI_CLK = 2.135"
syn_tsu39 = " S_AWADDR_29->AXI_CLK = 2.132"
syn_tsu40 = " S_AWBURST[0]->AXI_CLK = 1.944"
syn_tsu41 = " S_AWBURST[1]->AXI_CLK = 2.068"
syn_tsu42 = " S_AWID[0]->AXI_CLK = 1.843"
syn_tsu43 = " S_AWID[1]->AXI_CLK = 1.908"
syn_tsu44 = " S_AWID[2]->AXI_CLK = 1.861"
syn_tsu45 = " S_AWID[3]->AXI_CLK = 2.138"
syn_tsu46 = " S_AWLEN[0]->AXI_CLK = 2.104"
syn_tsu47 = " S_AWLEN[1]->AXI_CLK = 2.142"
syn_tsu48 = " S_AWLEN[2]->AXI_CLK = 2.173"
syn_tsu49 = " S_AWLEN[3]->AXI_CLK = 2.07"
syn_tsu50 = " S_AWSIZE[0]->AXI_CLK = 2.046"
syn_tsu51 = " S_AWSIZE[1]->AXI_CLK = 2.037"
syn_tsu52 = " S_AWVALID->AXI_CLK = 2.139"
syn_tsu53 = " S_BREADY->AXI_CLK = 1.984"
syn_tsu54 = " S_RREADY->AXI_CLK = 2.09"
syn_tsu55 = " S_WDERR->AXI_CLK = 1.852"
syn_tsu56 = " S_WLAST->AXI_CLK = 2.019"
syn_tsu57 = " S_WSTRB[0]->AXI_CLK = 2.173"
syn_tsu58 = " S_WSTRB[1]->AXI_CLK = 2.12"
syn_tsu59 = " S_WSTRB[2]->AXI_CLK = 2.138"
syn_tsu60 = " S_WSTRB[3]->AXI_CLK = 2.122"
syn_tsu61 = " S_WSTRB[4]->AXI_CLK = 1.841"
syn_tsu62 = " S_WSTRB[5]->AXI_CLK = 2.116"
syn_tsu63 = " S_WSTRB[6]->AXI_CLK = 2.166"
syn_tsu64 = " S_WSTRB[7]->AXI_CLK = 2.047"
syn_tsu65 = " S_WVALID->AXI_CLK = 1.945"
syn_tco0 = " AXI_CLK->M_ARADDR_24 = 2.811"
syn_tco1 = " AXI_CLK->M_ARADDR_25 = 2.807"
syn_tco2 = " AXI_CLK->M_ARADDR_26 = 2.775"
syn_tco3 = " AXI_CLK->M_ARADDR_27 = 2.699"
syn_tco4 = " AXI_CLK->M_ARBURST[0] = 2.169"
syn_tco5 = " AXI_CLK->M_ARLEN[0] = 2.167"
syn_tco6 = " AXI_CLK->M_ARLEN[1] = 2.218"
syn_tco7 = " AXI_CLK->M_ARLEN[2] = 2.226"
syn_tco8 = " AXI_CLK->M_ARLEN[3] = 2.216"
syn_tco9 = " AXI_CLK->M_ARLEN[4] = 2.218"
syn_tco10 = " AXI_CLK->M_ARLEN[5] = 2.217"
syn_tco11 = " AXI_CLK->M_ARLEN[6] = 2.216"
syn_tco12 = " AXI_CLK->M_ARLEN[7] = 2.172"
syn_tco13 = " AXI_CLK->M_ARSIZE[0] = 2.234"
syn_tco14 = " AXI_CLK->M_ARSIZE[1] = 2.173"
syn_tco15 = " AXI_CLK->M_ARVALID = 2.121"
syn_tco16 = " AXI_CLK->M_AWADDR_24 = 2.526"
syn_tco17 = " AXI_CLK->M_AWADDR_25 = 2.698"
syn_tco18 = " AXI_CLK->M_AWADDR_26 = 2.735"
syn_tco19 = " AXI_CLK->M_AWADDR_27 = 2.759"
syn_tco20 = " AXI_CLK->M_AWBURST[0] = 2.118"
syn_tco21 = " AXI_CLK->M_AWLEN[0] = 2.202"
syn_tco22 = " AXI_CLK->M_AWLEN[1] = 2.179"
syn_tco23 = " AXI_CLK->M_AWLEN[2] = 2.179"
syn_tco24 = " AXI_CLK->M_AWLEN[3] = 2.209"
syn_tco25 = " AXI_CLK->M_AWLEN[4] = 2.152"
syn_tco26 = " AXI_CLK->M_AWSIZE[0] = 2.171"
syn_tco27 = " AXI_CLK->M_AWSIZE[1] = 2.159"
syn_tco28 = " AXI_CLK->M_AWVALID = 2.203"
syn_tco29 = " AXI_CLK->M_BREADY = 2.226"
syn_tco30 = " AXI_CLK->M_RREADY = 2.134"
syn_tco31 = " AXI_CLK->M_WDERR = 2.273"
syn_tco32 = " AXI_CLK->M_WLAST = 2.280"
syn_tco33 = " AXI_CLK->M_WSTRB[0] = 2.166"
syn_tco34 = " AXI_CLK->M_WSTRB[1] = 2.779"
syn_tco35 = " AXI_CLK->M_WSTRB[2] = 2.119"
syn_tco36 = " AXI_CLK->M_WSTRB[3] = 2.782"
syn_tco37 = " AXI_CLK->M_WSTRB[4] = 2.785"
syn_tco38 = " AXI_CLK->M_WSTRB[5] = 2.119"
syn_tco39 = " AXI_CLK->M_WSTRB[6] = 2.082"
syn_tco40 = " AXI_CLK->M_WSTRB[7] = 2.141"
syn_tco41 = " AXI_CLK->M_WVALID = 2.122"
syn_tco42 = " AXI_CLK->S_ARREADY = 2.112"
syn_tco43 = " AXI_CLK->S_AWREADY = 2.174"
syn_tco44 = " AXI_CLK->S_BID[0] = 2.116"
syn_tco45 = " AXI_CLK->S_BID[1] = 2.756"
syn_tco46 = " AXI_CLK->S_BID[2] = 2.747"
syn_tco47 = " AXI_CLK->S_BID[3] = 2.749"
syn_tco48 = " AXI_CLK->S_BRESP[0] = 2.757"
syn_tco49 = " AXI_CLK->S_BRESP[1] = 2.749"
syn_tco50 = " AXI_CLK->S_BVALID = 2.129"
syn_tco51 = " AXI_CLK->S_RDERR = 2.210"
syn_tco52 = " AXI_CLK->S_RID[0] = 2.161"
syn_tco53 = " AXI_CLK->S_RID[1] = 2.160"
syn_tco54 = " AXI_CLK->S_RID[2] = 2.162"
syn_tco55 = " AXI_CLK->S_RID[3] = 2.164"
syn_tco56 = " AXI_CLK->S_RLAST = 2.211"
syn_tco57 = " AXI_CLK->S_RRESP[0] = 2.164"
syn_tco58 = " AXI_CLK->S_RRESP[1] = 2.162"
syn_tco59 = " AXI_CLK->S_RVALID = 2.225"
syn_tco60 = " AXI_CLK->S_WREADY = 2.130"
syn_tpd61 = " WAKEREQ->PCIE_DEBUG[0] = 10.343"
syn_tpd62 = " WAKEREQ->PCIE_DEBUG[10] = 10.779"
syn_tpd63 = " WAKEREQ->PCIE_DEBUG[11] = 10.128"
syn_tpd64 = " WAKEREQ->PCIE_DEBUG[12] = 12.546"
syn_tpd65 = " WAKEREQ->PCIE_DEBUG[13] = 12.154"
syn_tpd66 = " WAKEREQ->PCIE_DEBUG[14] = 12.192"
syn_tpd67 = " WAKEREQ->PCIE_DEBUG[16] = 9.170"
syn_tpd68 = " WAKEREQ->PCIE_DEBUG[17] = 12.286"
syn_tpd69 = " WAKEREQ->PCIE_DEBUG[19] = 10.183"
syn_tpd70 = " WAKEREQ->PCIE_DEBUG[1] = 12.431"
syn_tpd71 = " WAKEREQ->PCIE_DEBUG[20] = 10.584"
syn_tpd72 = " WAKEREQ->PCIE_DEBUG[21] = 11.922"
syn_tpd73 = " WAKEREQ->PCIE_DEBUG[22] = 9.958"
syn_tpd74 = " WAKEREQ->PCIE_DEBUG[23] = 10.360"
syn_tpd75 = " WAKEREQ->PCIE_DEBUG[25] = 11.040"
syn_tpd76 = " WAKEREQ->PCIE_DEBUG[26] = 10.690"
syn_tpd77 = " WAKEREQ->PCIE_DEBUG[27] = 9.941"
syn_tpd78 = " WAKEREQ->PCIE_DEBUG[28] = 11.172"
syn_tpd79 = " WAKEREQ->PCIE_DEBUG[29] = 12.015"
syn_tpd80 = " WAKEREQ->PCIE_DEBUG[30] = 12.325"
syn_tpd81 = " WAKEREQ->PCIE_DEBUG[3] = 10.425"
syn_tpd82 = " WAKEREQ->PCIE_DEBUG[4] = 10.812"
syn_tpd83 = " WAKEREQ->PCIE_DEBUG[5] = 12.183"
syn_tpd84 = " WAKEREQ->PCIE_DEBUG[6] = 10.374"
syn_tpd85 = " WAKEREQ->PCIE_DEBUG[7] = 10.774"
syn_tpd86 = " WAKEREQ->PCIE_DEBUG[9] = 11.070"
syn_tpd87 = " WAKEREQ->WAKEREQ_OEN = 4.800"
*/
/* synthesis black_box_pad_pin ="" */
input  M_ARREADY;
input  M_AWREADY;
input  [3:0] M_BID;
input  [1:0] M_BRESP;
input  M_BVALID;
input  M_RDERR;
input  [3:0] M_RID;
input  M_RLAST;
input  [1:0] M_RRESP;
input  M_RVALID;
input  M_WREADY;
input  S_ARADDR_24;
input  S_ARADDR_25;
input  S_ARADDR_26;
input  S_ARADDR_27;
input  S_ARADDR_29;
input  [1:0] S_ARBURST;
input  [3:0] S_ARID;
input  [7:0] S_ARLEN;
input  [1:0] S_ARSIZE;
input  S_ARVALID;
input  S_AWADDR_24;
input  S_AWADDR_25;
input  S_AWADDR_26;
input  S_AWADDR_27;
input  S_AWADDR_29;
input  [1:0] S_AWBURST;
input  [3:0] S_AWID;
input  [7:0] S_AWLEN;
input  [1:0] S_AWSIZE;
input  S_AWVALID;
input  S_BREADY;
input  S_RREADY;
input  S_WDERR;
input  S_WLAST;
input  [7:0] S_WSTRB;
input  S_WVALID;
input  [7:0] INTERRUPT;
input  MPERST_N;
input  TL_CLK;
input  WAKEREQ;
output M_ARADDR_24;
output M_ARADDR_25;
output M_ARADDR_26;
output M_ARADDR_27;
output [1:0] M_ARBURST;
output [3:0] M_ARID;
output [7:0] M_ARLEN;
output [1:0] M_ARSIZE;
output M_ARVALID;
output M_AWADDR_24;
output M_AWADDR_25;
output M_AWADDR_26;
output M_AWADDR_27;
output [1:0] M_AWBURST;
output [3:0] M_AWID;
output [7:0] M_AWLEN;
output [1:0] M_AWSIZE;
output M_AWVALID;
output M_BREADY;
output M_RREADY;
output M_WDERR;
output M_WLAST;
output [7:0] M_WSTRB;
output M_WVALID;
output S_ARREADY;
output S_AWREADY;
output [3:0] S_BID;
output [1:0] S_BRESP;
output S_BVALID;
output S_RDERR;
output [3:0] S_RID;
output S_RLAST;
output [1:0] S_RRESP;
output S_RVALID;
output S_WREADY;
output L2_EXIT;
output HOT_RST_EXIT;
output DLUP_EXIT;
output INTERRUPT_OUT;
output [4:0] LTSSM;
output WAKEREQ_OEN;
output M_ARADDR_31;
output M_ARADDR_30;
output M_ARADDR_29;
output M_ARADDR_28;
output M_ARADDR_0;
output M_ARADDR_1;
output M_ARADDR_2;
output M_ARADDR_3;
output M_ARADDR_4;
output M_ARADDR_5;
output M_ARADDR_6;
output M_ARADDR_7;
output M_ARADDR_8;
output M_ARADDR_9;
output M_ARADDR_10;
output M_ARADDR_11;
output M_ARADDR_12;
output M_ARADDR_13;
output M_ARADDR_14;
output M_ARADDR_15;
output M_ARADDR_16;
output M_ARADDR_17;
output M_ARADDR_18;
output M_ARADDR_19;
output M_ARADDR_20;
output M_ARADDR_21;
output M_ARADDR_22;
output M_ARADDR_23;
output M_AWADDR_31;
output M_AWADDR_30;
output M_AWADDR_29;
output M_AWADDR_28;
output M_AWADDR_0;
output M_AWADDR_1;
output M_AWADDR_2;
output M_AWADDR_3;
output M_AWADDR_4;
output M_AWADDR_5;
output M_AWADDR_6;
output M_AWADDR_7;
output M_AWADDR_8;
output M_AWADDR_9;
output M_AWADDR_10;
output M_AWADDR_11;
output M_AWADDR_12;
output M_AWADDR_13;
output M_AWADDR_14;
output M_AWADDR_15;
output M_AWADDR_16;
output M_AWADDR_17;
output M_AWADDR_18;
output M_AWADDR_19;
output M_AWADDR_20;
output M_AWADDR_21;
output M_AWADDR_22;
output M_AWADDR_23;
input  [63:0] M_RDATA;
output [63:0] M_WDATA;
input  S_ARADDR_31;
input  S_ARADDR_30;
input  S_ARADDR_28;
input  S_ARADDR_0;
input  S_ARADDR_1;
input  S_ARADDR_2;
input  S_ARADDR_3;
input  S_ARADDR_4;
input  S_ARADDR_5;
input  S_ARADDR_6;
input  S_ARADDR_7;
input  S_ARADDR_8;
input  S_ARADDR_9;
input  S_ARADDR_10;
input  S_ARADDR_11;
input  S_ARADDR_12;
input  S_ARADDR_13;
input  S_ARADDR_14;
input  S_ARADDR_15;
input  S_ARADDR_16;
input  S_ARADDR_17;
input  S_ARADDR_18;
input  S_ARADDR_19;
input  S_ARADDR_20;
input  S_ARADDR_21;
input  S_ARADDR_22;
input  S_ARADDR_23;
input  S_AWADDR_31;
input  S_AWADDR_30;
input  S_AWADDR_28;
input  S_AWADDR_0;
input  S_AWADDR_1;
input  S_AWADDR_2;
input  S_AWADDR_3;
input  S_AWADDR_4;
input  S_AWADDR_5;
input  S_AWADDR_6;
input  S_AWADDR_7;
input  S_AWADDR_8;
input  S_AWADDR_9;
input  S_AWADDR_10;
input  S_AWADDR_11;
input  S_AWADDR_12;
input  S_AWADDR_13;
input  S_AWADDR_14;
input  S_AWADDR_15;
input  S_AWADDR_16;
input  S_AWADDR_17;
input  S_AWADDR_18;
input  S_AWADDR_19;
input  S_AWADDR_20;
input  S_AWADDR_21;
input  S_AWADDR_22;
input  S_AWADDR_23;
input  AXI_CLK_STABLE;
output [63:0] S_RDATA;
input  [63:0] S_WDATA;
output [31:0] PCIE_DEBUG;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
input  DRI_BRIDGE_CLK;
input  [10:0] DRI_BRIDGE_CTRL;
input  [32:0] DRI_BRIDGE_WDATA;
input  DRI_BRIDGE_ARST_N;
output [32:0] DRI_BRIDGE_RDATA;
output DRI_BRIDGE_INTERRUPT;
output [3:0] ARST_N;
input  [1:0] XCVR_ARST_N;
input  PHYSTATUS_0;
input  PHYSTATUS_1;
input  PHYSTATUS_2;
input  PHYSTATUS_3;
output [1:0] POWERDOWN;
output [1:0] RATE;
output RESET_N;
input  [31:0] RXDATA_0;
input  [31:0] RXDATA_1;
input  [31:0] RXDATA_2;
input  [31:0] RXDATA_3;
input  [3:0] RXDATAK_0;
input  [3:0] RXDATAK_1;
input  [3:0] RXDATAK_2;
input  [3:0] RXDATAK_3;
input  RXELECIDLE_0;
input  RXELECIDLE_1;
input  RXELECIDLE_2;
input  RXELECIDLE_3;
output RXPOLARITY_0;
output RXPOLARITY_1;
output RXPOLARITY_2;
output RXPOLARITY_3;
output RXSTANDBYSTATUS_0;
output RXSTANDBYSTATUS_1;
output RXSTANDBYSTATUS_2;
output RXSTANDBYSTATUS_3;
input  [2:0] RXSTATUS_0;
input  [2:0] RXSTATUS_1;
input  [2:0] RXSTATUS_2;
input  [2:0] RXSTATUS_3;
input  RXVALID_0;
input  RXVALID_1;
input  RXVALID_2;
input  RXVALID_3;
output TXCOMPLIANCE_0;
output TXCOMPLIANCE_1;
output TXCOMPLIANCE_2;
output TXCOMPLIANCE_3;
output [31:0] TXDATA_0;
output [31:0] TXDATA_1;
output [31:0] TXDATA_2;
output [31:0] TXDATA_3;
output [3:0] TXDATAK_0;
output [3:0] TXDATAK_1;
output [3:0] TXDATAK_2;
output [3:0] TXDATAK_3;
output TXDATAVALID_0;
output TXDATAVALID_1;
output TXDATAVALID_2;
output TXDATAVALID_3;
output TXDEEMPH;
output TXDETECTRX_LOOPBACK_0;
output TXDETECTRX_LOOPBACK_1;
output TXDETECTRX_LOOPBACK_2;
output TXDETECTRX_LOOPBACK_3;
output TXELECIDLE_0;
output TXELECIDLE_1;
output TXELECIDLE_2;
output TXELECIDLE_3;
output [2:0] TXMARGIN;
output TXSWING;
output PIPE_CLK_0;
output PIPE_CLK_1;
output PIPE_CLK_2;
output PIPE_CLK_3;
input  PCLK_OUT_0;
input  PCLK_OUT_1;
input  PCLK_OUT_2;
input  PCLK_OUT_3;
input  AXI_CLK;
input  LINK_BRIDGE_CLK;
input  [2:0] LINK_BRIDGE_ADDR;
input  LINK_BRIDGE_EN;
input  LINK_BRIDGE_ARST_N;
input  [3:0] LINK_BRIDGE_WDATA;
output [3:0] LINK_BRIDGE_RDATA;
input  LINK_CTRL_CLK;
input  [2:0] LINK_CTRL_ADDR;
input  LINK_CTRL_EN;
input  LINK_CTRL_ARST_N;
input  [3:0] LINK_CTRL_WDATA;
output [3:0] LINK_CTRL_RDATA;
parameter MAIN_SOFT_RESET_PERIPH = 1'h0;
parameter MAIN_MAJOR_PCIE_USAGE_MODE = 4'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN0_SEL = 2'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN1_SEL = 2'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN2_SEL = 1'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN3_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN0_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN1_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN2_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN3_SEL = 1'h0;
parameter MAIN_QMUX_R0_PCIE_DBG_SEL = 3'h0;
parameter MAIN_DLL_CTRL0_PHASE_P = 2'h0;
parameter MAIN_DLL_CTRL0_PHASE_S = 2'h0;
parameter MAIN_DLL_CTRL0_SEL_P = 2'h0;
parameter MAIN_DLL_CTRL0_SEL_S = 2'h0;
parameter MAIN_DLL_CTRL0_REF_SEL = 1'h0;
parameter MAIN_DLL_CTRL0_FB_SEL = 1'h0;
parameter MAIN_DLL_CTRL0_DIV_SEL = 1'h0;
parameter MAIN_DLL_CTRL0_ALU_UPD = 2'h0;
parameter MAIN_DLL_CTRL0_LOCK_FRC = 1'h0;
parameter MAIN_DLL_CTRL0_LOCK_FLT = 2'h0;
parameter MAIN_DLL_CTRL0_LOCK_HIGH = 4'h0;
parameter MAIN_DLL_CTRL0_LOCK_LOW = 4'h0;
parameter MAIN_DLL_CTRL1_SET_ALU = 8'h0;
parameter MAIN_DLL_CTRL1_ADJ_DEL4 = 7'h0;
parameter MAIN_DLL_CTRL1_TEST_S = 1'h0;
parameter MAIN_DLL_CTRL1_TEST_RING = 1'h0;
parameter MAIN_DLL_CTRL1_INIT_CODE = 6'h0;
parameter MAIN_DLL_CTRL1_RELOCK_FAST = 1'h0;
parameter MAIN_DLL_STAT0_RESET = 1'h0;
parameter MAIN_DLL_STAT0_PHASE_MOVE_CLK = 1'h0;
parameter PMA_CMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_0_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_1_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_2_SEL = 5'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_MODE = 3'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_X = 2'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_Y = 2'h0;
parameter PCSCMN_QRST_R0_QRST0_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST0_RST_SEL = 4'h0;
parameter PCSCMN_QRST_R0_QRST1_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST1_RST_SEL = 4'h0;
parameter MAIN_QMUX_R0_QRST0_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST1_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST2_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST3_SRC = 3'h0;
parameter PCIE_SITE = "";
parameter SIMULATION_MODE = "";
parameter REG_FILE = "";
parameter MSC_UNIQUE = "";
parameter AXI_FREQUENCY = 0.0;
parameter SOFT_RESET_NV_MAP = 1'h0;
parameter SOFT_RESET_V_MAP = 1'h0;
parameter SOFT_RESET_CTLR_CFG_BRGAXI_SOFTRST = 1'h0;
parameter SOFT_RESET_CTLR_CFG_IGNORE_BRGAXI_SOFTRST_4_CTRL_RST = 1'h0;
parameter SOFT_RESET_CTLR_CFG_IGNORE_MPERST = 1'h0;
parameter SOFT_RESET_CTLR_CFG_IGNORE_INBAND_RST_EVENT_4_CTRL_RST = 1'h0;
parameter SOFT_RESET_CTLR_CFG_BRGMAP_SOFTRST = 1'h0;
parameter SOFT_RESET_CTLR_CFG_PCIE_CFGRESET_REL = 1'h0;
parameter SEC_ERROR_EVENT_CNT_TX_RAM_SEC_ERR_CNT = 8'h0;
parameter SEC_ERROR_EVENT_CNT_RX_RAM_SEC_ERR_CNT = 8'h0;
parameter SEC_ERROR_EVENT_CNT_PCIE2AXI_RAM_SEC_ERR_CNT = 8'h0;
parameter SEC_ERROR_EVENT_CNT_AXI2PCIE_RAM_SEC_ERR_CNT = 8'h0;
parameter DED_ERROR_EVENT_CNT_TX_RAM_DED_ERR_CNT = 4'h0;
parameter DED_ERROR_EVENT_CNT_RX_RAM_DED_ERR_CNT = 4'h0;
parameter DED_ERROR_EVENT_CNT_PCIE2AXI_RAM_DED_ERR_CNT = 4'h0;
parameter DED_ERROR_EVENT_CNT_AXI2PCIE_RAM_DED_ERR_CNT = 4'h0;
parameter SEC_ERROR_INT_TX_RAM_SEC_ERR_INT = 4'h0;
parameter SEC_ERROR_INT_RX_RAM_SEC_ERR_INT = 4'h0;
parameter SEC_ERROR_INT_PCIE2AXI_RAM_SEC_ERR_INT = 4'h0;
parameter SEC_ERROR_INT_AXI2PCIE_RAM_SEC_ERR_INT = 4'h0;
parameter SEC_ERROR_INT_MASK_TX_RAM_SEC_ERR_INT_MASK = 4'h0;
parameter SEC_ERROR_INT_MASK_RX_RAM_SEC_ERR_INT_MASK = 4'h0;
parameter SEC_ERROR_INT_MASK_PCIE2AXI_RAM_SEC_ERR_INT_MASK = 4'h0;
parameter SEC_ERROR_INT_MASK_AXI2PCIE_RAM_SEC_ERR_INT_MASK = 4'h0;
parameter DED_ERROR_INT_TX_RAM_DED_ERR_INT = 4'h0;
parameter DED_ERROR_INT_RX_RAM_DED_ERR_INT = 4'h0;
parameter DED_ERROR_INT_PCIE2AXI_RAM_DED_ERR_INT = 4'h0;
parameter DED_ERROR_INT_AXI2PCIE_RAM_DED_ERR_INT = 4'h0;
parameter DED_ERROR_INT_MASK_TX_RAM_DED_ERR_INT_MASK = 4'h0;
parameter DED_ERROR_INT_MASK_RX_RAM_DED_ERR_INT_MASK = 4'h0;
parameter DED_ERROR_INT_MASK_PCIE2AXI_RAM_DED_ERR_INT_MASK = 4'h0;
parameter DED_ERROR_INT_MASK_AXI2PCIE_RAM_DED_ERR_INT_MASK = 4'h0;
parameter ECC_CONTROL_TX_RAM_INJ_ERR = 4'h0;
parameter ECC_CONTROL_RX_RAM_INJ_ERR = 4'h0;
parameter ECC_CONTROL_PCIE2AXI_RAM_INJ_ERR = 4'h0;
parameter ECC_CONTROL_AXI2PCIE_RAM_INJ_ERR = 4'h0;
parameter ECC_CONTROL_TX_RAM_ECC_BYPASS = 1'h0;
parameter ECC_CONTROL_RX_RAM_ECC_BYPASS = 1'h0;
parameter ECC_CONTROL_PCIE2AXI_RAM_ECC_BYPASS = 1'h0;
parameter ECC_CONTROL_AXI2PCIE_RAM_ECC_BYPASS = 1'h0;
parameter ECC_ERR_LOC_INJECT_ECC_ERR_ADDR = 8'h0;
parameter ECC_ERR_LOC_ENABLE_ECC_ERR_BIT_LOC = 8'h0;
parameter ECC_ERR_LOC_ENABLE_ECC_ERR_BYTE_LOC = 10'h0;
parameter RAM_MARGIN_1_RX_BUF_MARGIN = 12'h0;
parameter RAM_MARGIN_1_TX_BUF_MARGIN = 12'h0;
parameter RAM_MARGIN_2_P2A_BUF_MARGIN = 12'h0;
parameter RAM_MARGIN_2_A2P_BUF_MARGIN = 12'h0;
parameter RAM_POWER_CONTROL_RX_BUF_PWR_CTRL = 3'h0;
parameter RAM_POWER_CONTROL_TX_BUF_PWR_CTRL = 3'h0;
parameter RAM_POWER_CONTROL_P2A_BUF_PWR_CTRL = 3'h0;
parameter RAM_POWER_CONTROL_A2P_BUF_PWR_CTRL = 3'h0;
parameter DEBUG_SEL_FAB_DEBUG_SEL = 8'h0;
parameter PL_WAKECLKREQ_PL_WAKE_OVERRIDE = 1'h0;
parameter PCIE_EVENT_INT_L2_EXIT_INT = 1'h0;
parameter PCIE_EVENT_INT_HOTRST_EXIT_INT = 1'h0;
parameter PCIE_EVENT_INT_DLUP_EXIT_INT = 1'h0;
parameter PCIE_EVENT_INT_L2_EXIT_INT_MASK = 1'h0;
parameter PCIE_EVENT_INT_HOTRST_EXIT_INT_MASK = 1'h0;
parameter PCIE_EVENT_INT_DLUP_EXIT_INT_MASK = 1'h0;
parameter SPARE_SCRATCHPAD = 8'h0;
parameter SPARE_SPARE_CTRL = 24'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT0_SIM_MODE = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT1_DIS_LPWR_STATE_NEG = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT2_LBACK_MST = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT3_EN_WARN_ASSERT = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT4_EN_INFO_ASSERT = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT6_DIS_SCRAMBLING = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT7_CMPL_RCV_BIT = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT8_TS2_DEEMPH_BIT_SEL = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT9_DIS_POLL_CMPL_ENTRY = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT10_FORCE_PLL_CMPL_ENTRY = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT14_DIS_PHY_STATUS_TO = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT18_NULLIFIED_WRTX = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT19_EXT_SIM_MODE = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT20_CHECK_DCBALANCE = 1'h0;
parameter TEST_BUS_IN_31_0_TEST_BUS_IN_BIT21_DISABLE_SKP_PARITY = 1'h0;
parameter TEST_BUS_IN_63_32_TEST_BUS_IN_BF_63_32 = 32'h0;
parameter BRIDGE_PCIE_BAR_01_DW0_BAR_SIZE_MASK = 28'h0;
parameter BRIDGE_PCIE_BAR_01_DW0_PREFETCH_OR_BAR_SIZE = 1'h0;
parameter BRIDGE_PCIE_BAR_01_DW0_ADDR_OR_BAR_SIZE = 1'h0;
parameter BRIDGE_PCIE_BAR_01_DW0_BAR_TYPE = 1'h0;
parameter BRIDGE_PCIE_BAR_01_DW1_RESERVED_OR_BAR_SIZE_MASK = 32'h0;
parameter BRIDGE_PCIE_BAR_23_DW0_BAR_SIZE_MASK = 28'h0;
parameter BRIDGE_PCIE_BAR_23_DW0_PREFETCH_OR_BAR_SIZE = 1'h0;
parameter BRIDGE_PCIE_BAR_23_DW0_ADDR_OR_BAR_SIZE = 1'h0;
parameter BRIDGE_PCIE_BAR_23_DW0_BAR_TYPE = 1'h0;
parameter BRIDGE_PCIE_BAR_23_DW1_RESERVED_OR_BAR_SIZE_MASK = 32'h0;
parameter BRIDGE_PCIE_BAR_45_DW0_BAR_SIZE_MASK = 28'h0;
parameter BRIDGE_PCIE_BAR_45_DW0_PREFETCH_OR_BAR_SIZE = 1'h0;
parameter BRIDGE_PCIE_BAR_45_DW0_ADDR_OR_BAR_SIZE = 1'h0;
parameter BRIDGE_PCIE_BAR_45_DW0_BAR_TYPE = 1'h0;
parameter BRIDGE_PCIE_BAR_45_DW1_RESERVED_OR_BAR_SIZE_MASK = 32'h0;
parameter BRIDGE_PCIE_BAR_WIN_PFETCH_MEMWIN_64BADDR = 1'h0;
parameter BRIDGE_PCIE_BAR_WIN_PFETCH_MEMWIN = 1'h0;
parameter BRIDGE_PCIE_BAR_WIN_IOWIN_32BADDR = 1'h0;
parameter BRIDGE_PCIE_BAR_WIN_IOWIN = 1'h0;
parameter BRIDGE_ATR0_PCIE_WIN0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR0_PCIE_WIN0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR0_PCIE_WIN0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR0_PCIE_WIN0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR0_PCIE_WIN0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR0_PCIE_WIN0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR0_PCIE_WIN0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR0_PCIE_WIN0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR1_PCIE_WIN0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR1_PCIE_WIN0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR1_PCIE_WIN0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR1_PCIE_WIN0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR1_PCIE_WIN0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR1_PCIE_WIN0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR1_PCIE_WIN0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR1_PCIE_WIN0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR2_PCIE_WIN0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR2_PCIE_WIN0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR2_PCIE_WIN0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR2_PCIE_WIN0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR2_PCIE_WIN0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR2_PCIE_WIN0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR2_PCIE_WIN0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR2_PCIE_WIN0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR3_PCIE_WIN0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR3_PCIE_WIN0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR3_PCIE_WIN0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR3_PCIE_WIN0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR3_PCIE_WIN0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR3_PCIE_WIN0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR3_PCIE_WIN0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR3_PCIE_WIN0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR4_PCIE_WIN0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR4_PCIE_WIN0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR4_PCIE_WIN0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR4_PCIE_WIN0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR4_PCIE_WIN0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR4_PCIE_WIN0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR4_PCIE_WIN0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR4_PCIE_WIN0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR5_PCIE_WIN0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR5_PCIE_WIN0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR5_PCIE_WIN0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR5_PCIE_WIN0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR5_PCIE_WIN0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR5_PCIE_WIN0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR5_PCIE_WIN0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR5_PCIE_WIN0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR6_PCIE_WIN0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR6_PCIE_WIN0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR6_PCIE_WIN0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR6_PCIE_WIN0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR6_PCIE_WIN0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR6_PCIE_WIN0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR6_PCIE_WIN0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR6_PCIE_WIN0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR7_PCIE_WIN0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR7_PCIE_WIN0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR7_PCIE_WIN0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR7_PCIE_WIN0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR7_PCIE_WIN0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR7_PCIE_WIN0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR7_PCIE_WIN0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR7_PCIE_WIN0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR0_PCIE_WIN1_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR0_PCIE_WIN1_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR0_PCIE_WIN1_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR0_PCIE_WIN1_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR0_PCIE_WIN1_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR0_PCIE_WIN1_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR0_PCIE_WIN1_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR0_PCIE_WIN1_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR1_PCIE_WIN1_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR1_PCIE_WIN1_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR1_PCIE_WIN1_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR1_PCIE_WIN1_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR1_PCIE_WIN1_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR1_PCIE_WIN1_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR1_PCIE_WIN1_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR1_PCIE_WIN1_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR2_PCIE_WIN1_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR2_PCIE_WIN1_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR2_PCIE_WIN1_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR2_PCIE_WIN1_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR2_PCIE_WIN1_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR2_PCIE_WIN1_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR2_PCIE_WIN1_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR2_PCIE_WIN1_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR3_PCIE_WIN1_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR3_PCIE_WIN1_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR3_PCIE_WIN1_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR3_PCIE_WIN1_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR3_PCIE_WIN1_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR3_PCIE_WIN1_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR3_PCIE_WIN1_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR3_PCIE_WIN1_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR4_PCIE_WIN1_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR4_PCIE_WIN1_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR4_PCIE_WIN1_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR4_PCIE_WIN1_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR4_PCIE_WIN1_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR4_PCIE_WIN1_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR4_PCIE_WIN1_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR4_PCIE_WIN1_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR5_PCIE_WIN1_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR5_PCIE_WIN1_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR5_PCIE_WIN1_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR5_PCIE_WIN1_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR5_PCIE_WIN1_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR5_PCIE_WIN1_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR5_PCIE_WIN1_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR5_PCIE_WIN1_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR6_PCIE_WIN1_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR6_PCIE_WIN1_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR6_PCIE_WIN1_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR6_PCIE_WIN1_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR6_PCIE_WIN1_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR6_PCIE_WIN1_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR6_PCIE_WIN1_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR6_PCIE_WIN1_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR7_PCIE_WIN1_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR7_PCIE_WIN1_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR7_PCIE_WIN1_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR7_PCIE_WIN1_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR7_PCIE_WIN1_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR7_PCIE_WIN1_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR7_PCIE_WIN1_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR7_PCIE_WIN1_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR0_AXI4_SLV0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR0_AXI4_SLV0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR0_AXI4_SLV0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR0_AXI4_SLV0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR0_AXI4_SLV0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR0_AXI4_SLV0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR0_AXI4_SLV0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR0_AXI4_SLV0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR1_AXI4_SLV0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR1_AXI4_SLV0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR1_AXI4_SLV0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR1_AXI4_SLV0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR1_AXI4_SLV0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR1_AXI4_SLV0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR1_AXI4_SLV0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR1_AXI4_SLV0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR2_AXI4_SLV0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR2_AXI4_SLV0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR2_AXI4_SLV0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR2_AXI4_SLV0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR2_AXI4_SLV0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR2_AXI4_SLV0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR2_AXI4_SLV0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR2_AXI4_SLV0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR3_AXI4_SLV0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR3_AXI4_SLV0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR3_AXI4_SLV0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR3_AXI4_SLV0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR3_AXI4_SLV0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR3_AXI4_SLV0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR3_AXI4_SLV0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR3_AXI4_SLV0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR4_AXI4_SLV0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR4_AXI4_SLV0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR4_AXI4_SLV0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR4_AXI4_SLV0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR4_AXI4_SLV0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR4_AXI4_SLV0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR4_AXI4_SLV0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR4_AXI4_SLV0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR5_AXI4_SLV0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR5_AXI4_SLV0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR5_AXI4_SLV0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR5_AXI4_SLV0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR5_AXI4_SLV0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR5_AXI4_SLV0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR5_AXI4_SLV0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR5_AXI4_SLV0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR6_AXI4_SLV0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR6_AXI4_SLV0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR6_AXI4_SLV0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR6_AXI4_SLV0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR6_AXI4_SLV0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR6_AXI4_SLV0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR6_AXI4_SLV0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR6_AXI4_SLV0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_ATR7_AXI4_SLV0_SRCADDR_PARAM_SRC_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR7_AXI4_SLV0_SRCADDR_PARAM_ATR_SIZE = 6'h0;
parameter BRIDGE_ATR7_AXI4_SLV0_SRCADDR_PARAM_ATR_IMPL = 1'h0;
parameter BRIDGE_ATR7_AXI4_SLV0_SRC_ADDR_SRC_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR7_AXI4_SLV0_TRSL_ADDR_LSB_TRSL_ADDR_LDW = 20'h0;
parameter BRIDGE_ATR7_AXI4_SLV0_TRSL_ADDR_UDW_TSLR_ADDR_UDW = 32'h0;
parameter BRIDGE_ATR7_AXI4_SLV0_TRSL_PARAM_TRSF_PARAM = 12'h0;
parameter BRIDGE_ATR7_AXI4_SLV0_TRSL_PARAM_TRSL_ID = 4'h0;
parameter BRIDGE_PCIE_VC_CRED_DW0_NP_DATA_CREDITS = 4'h0;
parameter BRIDGE_PCIE_VC_CRED_DW0_NP_HDR_CREDITS = 8'h0;
parameter BRIDGE_PCIE_VC_CRED_DW0_P_DATA_CREDITS = 12'h0;
parameter BRIDGE_PCIE_VC_CRED_DW0_P_HDR_CREDITS = 8'h0;
parameter BRIDGE_PCIE_VC_CRED_DW1_CPL_DATA_CREDITS = 12'h0;
parameter BRIDGE_PCIE_VC_CRED_DW1_CPL_HDR_CREDITS = 8'h0;
parameter BRIDGE_PCIE_VC_CRED_DW1_NP_DATA_CREDITS = 4'h0;
parameter BRIDGE_PCIE_PCI_IDS_DW0_DEVICE_ID = 16'h0;
parameter BRIDGE_PCIE_PCI_IDS_DW0_VENDOR_ID = 16'h0;
parameter BRIDGE_PCIE_PCI_IDS_DW1_CLASS_CODE = 24'h0;
parameter BRIDGE_PCIE_PCI_IDS_DW1_REVISION_ID = 8'h0;
parameter BRIDGE_PCIE_PCI_IDS_DW2_SS_DEVICE_ID = 16'h0;
parameter BRIDGE_PCIE_PCI_IDS_DW2_SS_VENDOR_ID = 16'h0;
parameter BRIDGE_PCIE_PCI_LPM_PME_SUPPORT = 5'h0;
parameter BRIDGE_PCIE_PCI_LPM_D2_SUPPORT = 1'h0;
parameter BRIDGE_PCIE_PCI_LPM_D1_SUPPORT = 1'h0;
parameter BRIDGE_PCIE_PCI_LPM_AUX_CURRENT = 3'h0;
parameter BRIDGE_PCIE_PCI_LPM_DSI = 1'h0;
parameter BRIDGE_PCIE_PCI_IRQ_DW0_MSIX_CAP = 1'h0;
parameter BRIDGE_PCIE_PCI_IRQ_DW0_TABLE_SIZE = 11'h0;
parameter BRIDGE_PCIE_PCI_IRQ_DW0_MSI_MASK_SUPPORT = 1'h0;
parameter BRIDGE_PCIE_PCI_IRQ_DW0_NUM_MSI_MSGS = 3'h0;
parameter BRIDGE_PCIE_PCI_IRQ_DW0_INT_PIN = 3'h0;
parameter BRIDGE_PCIE_PCI_IRQ_DW1_TABLE_OFFSET = 29'h0;
parameter BRIDGE_PCIE_PCI_IRQ_DW1_TABLE_BIR = 3'h0;
parameter BRIDGE_PCIE_PCI_IRQ_DW2_PBA_OFFSET = 29'h0;
parameter BRIDGE_PCIE_PCI_IRQ_DW2_PBA_BIR = 3'h0;
parameter BRIDGE_PCIE_PCI_IOV_DW0_ATS_PAGE_ALGN_REQ = 1'h0;
parameter BRIDGE_PCIE_PCI_IOV_DW0_ATS_INVLD_QUEUE_DEPTH = 5'h0;
parameter BRIDGE_PCIE_PCI_IOV_DW1_PRI_PAGE_REQ_CAP = 32'h0;
parameter BRIDGE_PCIE_PEX_DEV_EP_L1_LATENCY = 3'h0;
parameter BRIDGE_PCIE_PEX_DEV_EP_L0_LATENCY = 3'h0;
parameter BRIDGE_PCIE_PEX_DEV_MAXPAYLOAD = 3'h0;
parameter BRIDGE_PCIE_PEX_DEV2_LTR_SUPPORT = 1'h0;
parameter BRIDGE_PCIE_PEX_DEV2_CPL_TIMEOUT_DISABLE = 1'h0;
parameter BRIDGE_PCIE_PEX_DEV2_CPL_TIMEOUT_RANGE = 4'h0;
parameter BRIDGE_PCIE_PEX_LINK_PORT_NUM = 8'h0;
parameter BRIDGE_PCIE_PEX_LINK_L1_EXIT_LATENCY = 3'h0;
parameter BRIDGE_PCIE_PEX_LINK_L0S_EXIT_LATENCY = 3'h0;
parameter BRIDGE_PCIE_PEX_LINK_ASPM_L1 = 1'h0;
parameter BRIDGE_PCIE_PEX_LINK_ASPM_L0S = 1'h0;
parameter BRIDGE_PCIE_PEX_SPC_AER_IMPL = 1'h0;
parameter BRIDGE_PCIE_PEX_SPC_DEV_NUM_RP = 5'h0;
parameter BRIDGE_PCIE_PEX_SPC_RP_RCB = 1'h0;
parameter BRIDGE_PCIE_PEX_SPC_LINK_SEL_DEEMPHASIS = 1'h0;
parameter BRIDGE_PCIE_PEX_SPC_SLOT_CLK_CFG = 1'h0;
parameter BRIDGE_PCIE_PEX_SPC_SLOT_REG_IMPL = 1'h0;
parameter BRIDGE_PCIE_PEX_SPC2_ASPM_L1_DELAY = 5'h0;
parameter BRIDGE_PCIE_PEX_SPC2_ASPM_L0S_DELAY = 5'h0;
parameter BRIDGE_PCIE_PEX_SPC2_PCIE_MSI_MSG_NUM = 5'h0;
parameter BRIDGE_PCIE_PEX_SPC2_AER_MSI_MSG_NUM = 5'h0;
parameter BRIDGE_PCIE_PEX_SPC2_ECRC_CHK = 1'h0;
parameter BRIDGE_PCIE_PEX_SPC2_ECRC_GEN = 1'h0;
parameter BRIDGE_PCIE_PEX_NFTS_NUM_FTS_8G = 8'h0;
parameter BRIDGE_PCIE_PEX_NFTS_NUM_FTS_5G = 8'h0;
parameter BRIDGE_PCIE_PEX_NFTS_NUM_FTS_2P5G = 8'h0;
parameter BRIDGE_PM_CONF_DW0_DATA_SCALE_7 = 2'h0;
parameter BRIDGE_PM_CONF_DW0_DATA_SCALE_6 = 2'h0;
parameter BRIDGE_PM_CONF_DW0_DATA_SCALE_5 = 2'h0;
parameter BRIDGE_PM_CONF_DW0_DATA_SCALE_4 = 2'h0;
parameter BRIDGE_PM_CONF_DW0_DATA_SCALE_3 = 2'h0;
parameter BRIDGE_PM_CONF_DW0_DATA_SCALE_2 = 2'h0;
parameter BRIDGE_PM_CONF_DW0_DATA_SCALE_1 = 2'h0;
parameter BRIDGE_PM_CONF_DW0_DATA_SCALE_0 = 2'h0;
parameter BRIDGE_PM_CONF_DW1_DATA_REGISTER_3 = 8'h0;
parameter BRIDGE_PM_CONF_DW1_DATA_REGISTER_2 = 8'h0;
parameter BRIDGE_PM_CONF_DW1_DATA_REGISTER_1 = 8'h0;
parameter BRIDGE_PM_CONF_DW1_DATA_REGISTER_0 = 8'h0;
parameter BRIDGE_PM_CONF_DW2_DATA_REGISTER_7 = 8'h0;
parameter BRIDGE_PM_CONF_DW2_DATA_REGISTER_6 = 8'h0;
parameter BRIDGE_PM_CONF_DW2_DATA_REGISTER_5 = 8'h0;
parameter BRIDGE_PM_CONF_DW2_DATA_REGISTER_4 = 8'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW0_UP_RCVR_PRST_LN1 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW0_UP_XSMR_PRST_LN1 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW0_DP_RCVR_PRST_LN1 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW0_DP_XSMR_PRST_LN1 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW0_UP_RCVR_PRST_LN0 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW0_UP_XSMR_PRST_LN0 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW0_DP_RCVR_PRST_LN0 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW0_DP_XSMR_PRST_LN0 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW1_UP_RCVR_PRST_LN3 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW1_UP_XSMR_PRST_LN3 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW1_DP_RCVR_PRST_LN3 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW1_DP_XSMR_PRST_LN3 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW1_UP_RCVR_PRST_LN2 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW1_UP_XSMR_PRST_LN2 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW1_DP_RCVR_PRST_LN2 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW1_DP_XSMR_PRST_LN2 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW2_UP_RCVR_PRST_LN5 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW2_UP_XSMR_PRST_LN5 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW2_DP_RCVR_PRST_LN5 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW2_DP_XSMR_PRST_LN5 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW2_UP_RCVR_PRST_LN4 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW2_UP_XSMR_PRST_LN4 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW2_DP_RCVR_PRST_LN4 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW2_DP_XSMR_PRST_LN4 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW3_UP_RCVR_PRST_LN7 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW3_UP_XSMR_PRST_LN7 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW3_DP_RCVR_PRST_LN7 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW3_DP_XSMR_PRST_LN7 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW3_UP_RCVR_PRST_LN6 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW3_UP_XSMR_PRST_LN6 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW3_DP_RCVR_PRST_LN6 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW3_DP_XSMR_PRST_LN6 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW4_UP_RCVR_PRST_LN9 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW4_UP_XSMR_PRST_LN9 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW4_DP_RCVR_PRST_LN9 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW4_DP_XSMR_PRST_LN9 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW4_UP_RCVR_PRST_LN8 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW4_UP_XSMR_PRST_LN8 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW4_DP_RCVR_PRST_LN8 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW4_DP_XSMR_PRST_LN8 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW5_UP_RCVR_PRST_LN11 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW5_UP_XSMR_PRST_LN11 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW5_DP_RCVR_PRST_LN11 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW5_DP_XSMR_PRST_LN11 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW5_UP_RCVR_PRST_LN10 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW5_UP_XSMR_PRST_LN10 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW5_DP_RCVR_PRST_LN10 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW5_DP_XSMR_PRST_LN10 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW6_UP_RCVR_PRST_LN13 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW6_UP_XSMR_PRST_LN13 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW6_DP_RCVR_PRST_LN13 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW6_DP_XSMR_PRST_LN13 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW6_UP_RCVR_PRST_LN12 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW6_UP_XSMR_PRST_LN12 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW6_DP_RCVR_PRST_LN12 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW6_DP_XSMR_PRST_LN12 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW7_UP_RCVR_PRST_LN15 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW7_UP_XSMR_PRST_LN15 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW7_DP_RCVR_PRST_LN15 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW7_DP_XSMR_PRST_LN15 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW7_UP_RCVR_PRST_LN14 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW7_UP_XSMR_PRST_LN14 = 4'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW7_DP_RCVR_PRST_LN14 = 3'h0;
parameter BRIDGE_PCIE_EQ_PRESET_DW7_DP_XSMR_PRST_LN14 = 4'h0;
parameter MAIN_OVRLY_AXI_IFC_MODE = 2'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_SEL = 3'h0;
parameter MAIN_CLK_CTRL_AXI_CLKENA = 1'h0;
parameter SOFT_RESET_PERIPH = 1'h0;
parameter DEV_CONTROL_ROOT_PORT_NEP = 1'h0;
parameter DEV_CONTROL_LINK_WIDTH_X2_SUPPORT = 1'h0;
parameter DEV_CONTROL_LINK_WIDTH_X4_SUPPORT = 1'h0;
parameter DEV_CONTROL_LINK_SPEED_5GBPS_SUPPORT = 1'h0;
parameter DEV_CONTROL_LANE_REVERSAL_SUPPORT = 1'h0;
parameter DEV_CONTROL_USE_RXELECIDLE_TO_DETECT_ELECIDLE_ENTRY = 1'h0;
parameter DEV_CONTROL_ENABLE_NULLIFY_TLP_ON_TXBUF_ECC_ERR = 1'h0;
parameter CLOCK_CONTROL_TL_CLOCK_FREQ = 10'h0;
parameter PCICONF_PCI_IDS_OVERRIDE_PCICONF_OVERRIDE_EN = 1'h0;
parameter PCICONF_PCI_IDS_31_0_PCI_VENDOR_ID = 16'h0;
parameter PCICONF_PCI_IDS_31_0_PCI_DEVICE_ID = 16'h0;
parameter PCICONF_PCI_IDS_63_32_PCI_REVISION_ID = 8'h0;
parameter PCICONF_PCI_IDS_63_32_PCI_CLASS_CODE = 24'h0;
parameter PCICONF_PCI_IDS_95_64_PCI_SUBSYSTEM_VENDOR_ID = 16'h0;
parameter PCICONF_PCI_IDS_95_64_PCI_SUBSYSTEM_DEVICE_ID = 16'h0;
parameter PCIE_PEX_DEV_LINK_SPC2_PEX_DEV_LINK_SPC2_OVERRIDE_EN = 1'h0;
parameter PCIE_PEX_DEV_LINK_SPC2_L0S_ENTRY_DELAY = 5'h0;
parameter PCIE_PEX_DEV_LINK_SPC2_L0S_EXIT_DELAY = 3'h0;
parameter PCIE_PEX_DEV_LINK_SPC2_L0S_ACC_LATENCY = 3'h0;
parameter PCIE_PEX_DEV_LINK_SPC2_L1_ENTRY_DELAY = 5'h0;
parameter PCIE_PEX_DEV_LINK_SPC2_L1_EXIT_DELAY = 3'h0;
parameter PCIE_PEX_DEV_LINK_SPC2_L1_ACC_LATENCY = 3'h0;
parameter PCIE_PEX_SPC_PEX_SPC_OVERRIDE_EN = 1'h0;
parameter PCIE_PEX_SPC_PCIE_SLOT_CLK_CONF = 1'h0;
parameter PCIE_PEX_SPC_PCIE_DE_EMPH_LVL = 1'h0;
parameter PCIE_AXI_MASTER_ATR_CFG0_PCIE_AXI_MASTER_ATR_OVERRIDE_EN = 1'h0;
parameter PCIE_AXI_MASTER_ATR_CFG0_PCIE_AXI_MASTER_ATR_IMPL = 1'h0;
parameter PCIE_AXI_MASTER_ATR_CFG0_PCIE_AXI_MASTER_ATR_SIZE = 6'h0;
parameter PCIE_AXI_MASTER_ATR_CFG0_PCIE_AXI_MASTER_ATR_TRSL_ADDR_L = 20'h0;
parameter PCIE_AXI_MASTER_ATR_CFG1_PCIE_AXI_MASTER_ATR_TRSL_ADDR_U = 32'h0;
parameter PCIE_AXI_MASTER_ATR_CFG2_PCIE_AXI_MASTER_ATR_TRSL_ID = 4'h0;
parameter PCIE_AXI_MASTER_ATR_CFG2_PCIE_AXI_MASTER_ATR_TRSF_PARAM = 12'h0;
parameter AXI_SLAVE_PCIE_ATR_CFG0_AXI_SLAVE_PCIE_ATR_OVERRIDE_EN = 1'h0;
parameter AXI_SLAVE_PCIE_ATR_CFG0_AXI_SLAVE_PCIE_ATR_IMPL = 1'h0;
parameter AXI_SLAVE_PCIE_ATR_CFG0_AXI_SLAVE_PCIE_ATR_SIZE = 6'h0;
parameter AXI_SLAVE_PCIE_ATR_CFG0_AXI_SLAVE_PCIE_ATR_TRSL_ADDR_L = 20'h0;
parameter AXI_SLAVE_PCIE_ATR_CFG1_AXI_SLAVE_PCIE_ATR_TRSL_ADDR_U = 32'h0;
parameter AXI_SLAVE_PCIE_ATR_CFG2_AXI_SLAVE_PCIE_ATR_TRSL_ID = 4'h0;
parameter AXI_SLAVE_PCIE_ATR_CFG2_AXI_SLAVE_PCIE_ATR_TRSF_PARAM = 12'h0;
parameter PCIE_BAR_01_PEX_BAR01_OVERRIDE_EN = 1'h0;
parameter PCIE_BAR_01_PEX_BAR0_CTRL = 4'h0;
parameter PCIE_BAR_01_PEX_BAR0_SIZE = 5'h0;
parameter PCIE_BAR_01_PEX_BAR1_CTRL = 4'h0;
parameter PCIE_BAR_01_PEX_BAR1_SIZE = 5'h0;
parameter PCIE_BAR_23_PEX_BAR23_OVERRIDE_EN = 1'h0;
parameter PCIE_BAR_23_PEX_BAR2_CTRL = 4'h0;
parameter PCIE_BAR_23_PEX_BAR2_SIZE = 5'h0;
parameter PCIE_BAR_23_PEX_BAR3_CTRL = 4'h0;
parameter PCIE_BAR_23_PEX_BAR3_SIZE = 5'h0;
parameter PCIE_BAR_45_PEX_BAR45_OVERRIDE_EN = 1'h0;
parameter PCIE_BAR_45_PEX_BAR4_CTRL = 4'h0;
parameter PCIE_BAR_45_PEX_BAR4_SIZE = 5'h0;
parameter PCIE_BAR_45_PEX_BAR5_CTRL = 4'h0;
parameter PCIE_BAR_45_PEX_BAR5_SIZE = 5'h0;
parameter PCIE_BAR_WIN_PEX_BAR_WIN_OVERRIDE_EN = 1'h0;
parameter PCIE_BAR_WIN_PEX_BAR_WIN_CTRL = 4'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module PF_SPI(
       CLK_OE,
       CLK_O,
       D_OE,
       D_O,
       SS_OE,
       SS_O,
       CLK_I,
       D_I,
       SS_I,
       FAB_SPI_OWNER,
       CLK,
       DI,
       DO,
       SS,
       IFACE,
       FLASH
    ) ;
/* synthesis syn_black_box

syn_tpd0 = " CLK_O->CLK = 6.584"
syn_tpd1 = " CLK_OE->CLK = 7.550"
syn_tpd2 = " DI->D_I = 4.271"
syn_tpd3 = " D_O->DO = 7.090"
syn_tpd4 = " D_OE->DO = 6.956"
syn_tpd5 = " SS_O->SS = 7.381"
syn_tpd6 = " SS_OE->SS = 7.479"
*/
/* synthesis black_box_pad_pin ="CLK,DI,DO,SS,IFACE,FLASH" */
input  CLK_OE;
input  CLK_O;
input  D_OE;
input  D_O;
input  SS_OE;
input  SS_O;
output CLK_I;
output D_I;
output SS_I;
output FAB_SPI_OWNER;
output CLK;
input  DI;
output DO;
output SS;
input  IFACE;
input  FLASH;

endmodule
`timescale 1 ns/100 ps
// Version: 


module PLL(
       POWERDOWN_N,
       OUT0_EN,
       OUT1_EN,
       OUT2_EN,
       OUT3_EN,
       REF_CLK_SEL,
       BYPASS_EN_N,
       LOAD_PHASE_N,
       SSCG_WAVE_TABLE,
       PHASE_DIRECTION,
       PHASE_ROTATE,
       PHASE_OUT0_SEL,
       PHASE_OUT1_SEL,
       PHASE_OUT2_SEL,
       PHASE_OUT3_SEL,
       DELAY_LINE_MOVE,
       DELAY_LINE_DIRECTION,
       DELAY_LINE_WIDE,
       DELAY_LINE_LOAD,
       LOCK,
       SSCG_WAVE_TABLE_ADDR,
       DELAY_LINE_OUT_OF_RANGE,
       REFCLK_SYNC_EN,
       REF_CLK_0,
       REF_CLK_1,
       FB_CLK,
       OUT0,
       OUT1,
       OUT2,
       OUT3,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " DELAY_LINE_DIRECTION->DELAY_LINE_MOVE = 0.356"
syn_tsu1 = " DELAY_LINE_WIDE->DELAY_LINE_MOVE = 0.487"
syn_tsu2 = " PHASE_DIRECTION->PHASE_ROTATE = 0.891"
syn_tsu3 = " PHASE_OUT0_SEL->PHASE_ROTATE = 0.64"
syn_tsu4 = " PHASE_OUT1_SEL->PHASE_ROTATE = 0.515"
syn_tsu5 = " PHASE_OUT2_SEL->PHASE_ROTATE = 0.349"
syn_tsu6 = " PHASE_OUT3_SEL->PHASE_ROTATE = 0.354"
syn_tco0 = " DELAY_LINE_MOVE->DELAY_LINE_OUT_OF_RANGE = 0.834"
syn_tpd1 = " DELAY_LINE_WIDE->DELAY_LINE_OUT_OF_RANGE = 0.209"
syn_tco2 = " REF_CLK_0->OUT0 = 0.427"
syn_tco3 = " REF_CLK_0->OUT1 = 0.426"
syn_tco4 = " REF_CLK_0->OUT2 = 0.430"
syn_tco5 = " REF_CLK_0->OUT3 = 0.437"
*/
/* synthesis black_box_pad_pin ="" */
input  POWERDOWN_N;
input  OUT0_EN;
input  OUT1_EN;
input  OUT2_EN;
input  OUT3_EN;
input  REF_CLK_SEL;
input  BYPASS_EN_N;
input  LOAD_PHASE_N;
input  [7:0] SSCG_WAVE_TABLE;
input  PHASE_DIRECTION;
input  PHASE_ROTATE;
input  PHASE_OUT0_SEL;
input  PHASE_OUT1_SEL;
input  PHASE_OUT2_SEL;
input  PHASE_OUT3_SEL;
input  DELAY_LINE_MOVE;
input  DELAY_LINE_DIRECTION;
input  DELAY_LINE_WIDE;
input  DELAY_LINE_LOAD;
output LOCK;
output [7:0] SSCG_WAVE_TABLE_ADDR;
output DELAY_LINE_OUT_OF_RANGE;
input  REFCLK_SYNC_EN;
input  REF_CLK_0;
input  REF_CLK_1;
input  FB_CLK;
output OUT0;
output OUT1;
output OUT2;
output OUT3;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
parameter VCOFREQUENCY = 0.0;
parameter DELAY_LINE_SIMULATION_MODE = "";
parameter DATA_RATE = 0.0;
parameter FORMAL_NAME = "";
parameter INTERFACE_NAME = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter SOFTRESET = 1'h0;
parameter SOFT_POWERDOWN_N = 1'h0;
parameter RFDIV_EN = 1'h0;
parameter OUT0_DIV_EN = 1'h0;
parameter OUT1_DIV_EN = 1'h0;
parameter OUT2_DIV_EN = 1'h0;
parameter OUT3_DIV_EN = 1'h0;
parameter SOFT_REF_CLK_SEL = 1'h0;
parameter RESET_ON_LOCK = 1'h0;
parameter BYPASS_CLK_SEL = 4'h0;
parameter BYPASS_GO_EN_N = 1'h0;
parameter BYPASS_PLL = 4'h0;
parameter BYPASS_OUT_DIVIDER = 4'h0;
parameter FF_REQUIRES_LOCK = 1'h0;
parameter FSE_N = 1'h0;
parameter FB_CLK_SEL_0 = 2'h0;
parameter FB_CLK_SEL_1 = 1'h0;
parameter RFDIV = 6'h0;
parameter FRAC_EN = 1'h0;
parameter FRAC_DAC_EN = 1'h0;
parameter DIV0_RST_DELAY = 3'h0;
parameter DIV0_VAL = 7'h0;
parameter DIV1_RST_DELAY = 3'h0;
parameter DIV1_VAL = 7'h0;
parameter DIV2_RST_DELAY = 3'h0;
parameter DIV2_VAL = 7'h0;
parameter DIV3_RST_DELAY = 3'h0;
parameter DIV3_VAL = 7'h0;
parameter DIV3_CLK_SEL = 1'h0;
parameter BW_INT_CTRL = 2'h0;
parameter BW_PROP_CTRL = 2'h0;
parameter IREF_EN = 1'h0;
parameter IREF_TOGGLE = 1'h0;
parameter LOCK_CNT = 4'h0;
parameter DESKEW_CAL_CNT = 3'h0;
parameter DESKEW_CAL_EN = 1'h0;
parameter DESKEW_CAL_BYPASS = 1'h0;
parameter SYNC_REF_DIV_EN = 1'h0;
parameter SYNC_REF_DIV_EN_2 = 1'h0;
parameter OUT0_PHASE_SEL = 3'h0;
parameter OUT1_PHASE_SEL = 3'h0;
parameter OUT2_PHASE_SEL = 3'h0;
parameter OUT3_PHASE_SEL = 3'h0;
parameter SOFT_LOAD_PHASE_N = 1'h0;
parameter SSM_DIV_VAL = 6'h0;
parameter FB_FRAC_VAL = 24'h0;
parameter SSM_SPREAD_MODE = 1'h0;
parameter SSM_MODULATION = 5'h0;
parameter FB_INT_VAL = 12'h0;
parameter SSM_EN_N = 1'h0;
parameter SSM_EXT_WAVE_EN = 2'h0;
parameter SSM_EXT_WAVE_MAX_ADDR = 8'h0;
parameter SSM_RANDOM_EN = 1'h0;
parameter [1:0] SSM_RANDOM_PATTERN_SEL = 2'h0;
parameter CDMUX0_SEL = 2'h0;
parameter CDMUX1_SEL = 1'h0;
parameter CDMUX2_SEL = 1'h0;
parameter CDELAY0_SEL = 8'h0;
parameter CDELAY0_EN = 1'h0;
parameter DRI_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module QUADRST_PCIE(
       ARST_N,
       ARST_N_IN
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
output ARST_N;
input  ARST_N_IN;
parameter MAIN_QMUX_R0_QRST_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST2_SRC = 3'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module QUADRST(
       ARST_N,
       ARST_N_IN
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
output ARST_N;
input  ARST_N_IN;
parameter PCSCMN_QRST_R0_QRST_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST_RST_SEL = 4'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module SCB(
       SCB_CLK_EN
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  SCB_CLK_EN;

endmodule
`timescale 1 ns/100 ps
// Version: 


module SYSCTRL_RESET_STATUS(
       AVIONIC_EN,
       G5C_ACTIVE
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
output AVIONIC_EN;
output G5C_ACTIVE;

endmodule
`timescale 1 ns/100 ps
// Version: 


module SYSRESET(
       DEVRST_N
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="DEVRST_N" */
input  DEVRST_N;

endmodule
`timescale 1 ns/100 ps
// Version: 


module SYS_SERVICES(
       CMD,
       REQ,
       ABORT,
       MAILBOX_CLK,
       MAILBOX_WRITE,
       MAILBOX_READ,
       MAILBOX_ADDR,
       MAILBOX_WDATA,
       ACK,
       BUSY,
       STATUS,
       MAILBOX_RDATA,
       MAILBOX_ECC,
       US_RESTORE
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " MAILBOX_ADDR[0]->MAILBOX_CLK = 1.126"
syn_tsu1 = " MAILBOX_ADDR[1]->MAILBOX_CLK = 1.233"
syn_tsu2 = " MAILBOX_ADDR[2]->MAILBOX_CLK = 1.133"
syn_tsu3 = " MAILBOX_ADDR[3]->MAILBOX_CLK = 1.128"
syn_tsu4 = " MAILBOX_ADDR[4]->MAILBOX_CLK = 1.107"
syn_tsu5 = " MAILBOX_ADDR[5]->MAILBOX_CLK = 1.147"
syn_tsu6 = " MAILBOX_ADDR[6]->MAILBOX_CLK = 1.137"
syn_tsu7 = " MAILBOX_ADDR[7]->MAILBOX_CLK = 1.101"
syn_tsu8 = " MAILBOX_ADDR[8]->MAILBOX_CLK = 1.174"
syn_tsu9 = " MAILBOX_READ->MAILBOX_CLK = 1.197"
syn_tsu10 = " MAILBOX_WDATA[0]->MAILBOX_CLK = 1.215"
syn_tsu11 = " MAILBOX_WDATA[10]->MAILBOX_CLK = 1.136"
syn_tsu12 = " MAILBOX_WDATA[11]->MAILBOX_CLK = 1.209"
syn_tsu13 = " MAILBOX_WDATA[12]->MAILBOX_CLK = 1.118"
syn_tsu14 = " MAILBOX_WDATA[13]->MAILBOX_CLK = 1.09"
syn_tsu15 = " MAILBOX_WDATA[14]->MAILBOX_CLK = 1.091"
syn_tsu16 = " MAILBOX_WDATA[15]->MAILBOX_CLK = 1.131"
syn_tsu17 = " MAILBOX_WDATA[16]->MAILBOX_CLK = 1.1"
syn_tsu18 = " MAILBOX_WDATA[17]->MAILBOX_CLK = 1.206"
syn_tsu19 = " MAILBOX_WDATA[18]->MAILBOX_CLK = 1.116"
syn_tsu20 = " MAILBOX_WDATA[19]->MAILBOX_CLK = 1.099"
syn_tsu21 = " MAILBOX_WDATA[1]->MAILBOX_CLK = 1.118"
syn_tsu22 = " MAILBOX_WDATA[20]->MAILBOX_CLK = 1.082"
syn_tsu23 = " MAILBOX_WDATA[21]->MAILBOX_CLK = 1.096"
syn_tsu24 = " MAILBOX_WDATA[22]->MAILBOX_CLK = 1.111"
syn_tsu25 = " MAILBOX_WDATA[23]->MAILBOX_CLK = 1.126"
syn_tsu26 = " MAILBOX_WDATA[24]->MAILBOX_CLK = 1.226"
syn_tsu27 = " MAILBOX_WDATA[25]->MAILBOX_CLK = 1.098"
syn_tsu28 = " MAILBOX_WDATA[26]->MAILBOX_CLK = 1.115"
syn_tsu29 = " MAILBOX_WDATA[27]->MAILBOX_CLK = 1.12"
syn_tsu30 = " MAILBOX_WDATA[28]->MAILBOX_CLK = 1.154"
syn_tsu31 = " MAILBOX_WDATA[29]->MAILBOX_CLK = 1.105"
syn_tsu32 = " MAILBOX_WDATA[2]->MAILBOX_CLK = 1.138"
syn_tsu33 = " MAILBOX_WDATA[30]->MAILBOX_CLK = 1.244"
syn_tsu34 = " MAILBOX_WDATA[31]->MAILBOX_CLK = 1.246"
syn_tsu35 = " MAILBOX_WDATA[3]->MAILBOX_CLK = 1.089"
syn_tsu36 = " MAILBOX_WDATA[4]->MAILBOX_CLK = 1.213"
syn_tsu37 = " MAILBOX_WDATA[5]->MAILBOX_CLK = 1.207"
syn_tsu38 = " MAILBOX_WDATA[6]->MAILBOX_CLK = 1.227"
syn_tsu39 = " MAILBOX_WDATA[7]->MAILBOX_CLK = 1.202"
syn_tsu40 = " MAILBOX_WDATA[8]->MAILBOX_CLK = 1.111"
syn_tsu41 = " MAILBOX_WDATA[9]->MAILBOX_CLK = 1.114"
syn_tsu42 = " MAILBOX_WRITE->MAILBOX_CLK = 1.239"
syn_tco0 = " MAILBOX_CLK->MAILBOX_ECC[0] = 2.416"
syn_tco1 = " MAILBOX_CLK->MAILBOX_ECC[1] = 2.387"
syn_tco2 = " MAILBOX_CLK->MAILBOX_RDATA[0] = 2.422"
syn_tco3 = " MAILBOX_CLK->MAILBOX_RDATA[10] = 2.412"
syn_tco4 = " MAILBOX_CLK->MAILBOX_RDATA[11] = 2.415"
syn_tco5 = " MAILBOX_CLK->MAILBOX_RDATA[12] = 2.472"
syn_tco6 = " MAILBOX_CLK->MAILBOX_RDATA[13] = 2.462"
syn_tco7 = " MAILBOX_CLK->MAILBOX_RDATA[14] = 2.446"
syn_tco8 = " MAILBOX_CLK->MAILBOX_RDATA[15] = 2.439"
syn_tco9 = " MAILBOX_CLK->MAILBOX_RDATA[16] = 2.413"
syn_tco10 = " MAILBOX_CLK->MAILBOX_RDATA[17] = 2.416"
syn_tco11 = " MAILBOX_CLK->MAILBOX_RDATA[18] = 2.401"
syn_tco12 = " MAILBOX_CLK->MAILBOX_RDATA[19] = 2.394"
syn_tco13 = " MAILBOX_CLK->MAILBOX_RDATA[1] = 2.394"
syn_tco14 = " MAILBOX_CLK->MAILBOX_RDATA[20] = 2.447"
syn_tco15 = " MAILBOX_CLK->MAILBOX_RDATA[21] = 2.444"
syn_tco16 = " MAILBOX_CLK->MAILBOX_RDATA[22] = 2.421"
syn_tco17 = " MAILBOX_CLK->MAILBOX_RDATA[23] = 2.420"
syn_tco18 = " MAILBOX_CLK->MAILBOX_RDATA[24] = 2.401"
syn_tco19 = " MAILBOX_CLK->MAILBOX_RDATA[25] = 2.412"
syn_tco20 = " MAILBOX_CLK->MAILBOX_RDATA[26] = 2.426"
syn_tco21 = " MAILBOX_CLK->MAILBOX_RDATA[27] = 2.440"
syn_tco22 = " MAILBOX_CLK->MAILBOX_RDATA[28] = 2.409"
syn_tco23 = " MAILBOX_CLK->MAILBOX_RDATA[29] = 2.415"
syn_tco24 = " MAILBOX_CLK->MAILBOX_RDATA[2] = 2.442"
syn_tco25 = " MAILBOX_CLK->MAILBOX_RDATA[30] = 2.441"
syn_tco26 = " MAILBOX_CLK->MAILBOX_RDATA[31] = 2.437"
syn_tco27 = " MAILBOX_CLK->MAILBOX_RDATA[3] = 2.415"
syn_tco28 = " MAILBOX_CLK->MAILBOX_RDATA[4] = 2.408"
syn_tco29 = " MAILBOX_CLK->MAILBOX_RDATA[5] = 2.446"
syn_tco30 = " MAILBOX_CLK->MAILBOX_RDATA[6] = 2.438"
syn_tco31 = " MAILBOX_CLK->MAILBOX_RDATA[7] = 2.431"
syn_tco32 = " MAILBOX_CLK->MAILBOX_RDATA[8] = 2.424"
syn_tco33 = " MAILBOX_CLK->MAILBOX_RDATA[9] = 2.436"
*/
/* synthesis black_box_pad_pin ="" */
input  [15:0] CMD;
input  REQ;
input  ABORT;
input  MAILBOX_CLK;
input  MAILBOX_WRITE;
input  MAILBOX_READ;
input  [8:0] MAILBOX_ADDR;
input  [31:0] MAILBOX_WDATA;
output ACK;
output BUSY;
output [15:0] STATUS;
output [31:0] MAILBOX_RDATA;
output [1:0] MAILBOX_ECC;
output US_RESTORE;

endmodule
`timescale 1 ns/100 ps
// Version: 


module TAMPER(
       CLEAR,
       IO_DISABLE,
       LOCKDOWN,
       RESET_DEVICE,
       ZEROIZE,
       FLAGS,
       RESET_REASON,
       SLOW_CLOCK
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  [31:0] CLEAR;
input  IO_DISABLE;
input  LOCKDOWN;
input  RESET_DEVICE;
input  ZEROIZE;
output [31:0] FLAGS;
output [4:0] RESET_REASON;
output SLOW_CLOCK;
parameter ZMODE = 2'h0;
parameter PORDIGEST = 16'h0;
parameter CLKMON_FREQ = 3'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module TVS(
       EN,
       TEMP_HIGH_CLEAR,
       TEMP_LOW_CLEAR,
       ACTIVE,
       VALID,
       CHANNEL,
       VALUE,
       TEMP_HIGH,
       TEMP_LOW
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  [3:0] EN;
input  TEMP_HIGH_CLEAR;
input  TEMP_LOW_CLEAR;
output ACTIVE;
output VALID;
output [1:0] CHANNEL;
output [15:0] VALUE;
output TEMP_HIGH;
output TEMP_LOW;
parameter TVS_CONTROL_ENABLE = 4'h0;
parameter TVS_TRIGGER_LOW = 16'h0;
parameter TVS_TRIGGER_HIGH = 16'h0;
parameter TVS_CONTROL_POWEROFF = 1'h0;
parameter TVS_CONTROL_RATE = 8'h0;
parameter SOFTRESET = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module TX_PLL(
       FAB_REF_CLK,
       FAB_LOCK,
       DIV_CLK,
       REF_CLK_P,
       REF_CLK_N,
       BIT_CLK,
       JA_REF_CLK,
       LOCK,
       REF_CLK_TO_LANE,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT,
       LINK_CLK,
       LINK_ADDR,
       LINK_EN,
       LINK_ARST_N,
       LINK_WDATA,
       LINK_RDATA
    ) ;
/* synthesis syn_black_box

syn_tpd0 = " FAB_REF_CLK->BIT_CLK = 1.438"
*/
/* synthesis black_box_pad_pin ="" */
input  FAB_REF_CLK;
output FAB_LOCK;
output DIV_CLK;
input  REF_CLK_P;
input  REF_CLK_N;
output BIT_CLK;
input  JA_REF_CLK;
output LOCK;
output REF_CLK_TO_LANE;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
input  LINK_CLK;
input  [2:0] LINK_ADDR;
input  LINK_EN;
input  LINK_ARST_N;
input  [3:0] LINK_WDATA;
output [3:0] LINK_RDATA;
parameter DATA_RATE = 0.0;
parameter REG_FILE = "";
parameter JA_MODE = "";
parameter VCOFREQUENCY = 0.0;
parameter SOFT_RESET_NV_MAP = 1'h0;
parameter SOFT_RESET_V_MAP = 1'h0;
parameter SOFT_RESET_PERIPH = 1'h0;
parameter CTRL_PHASESTEPAMOUNT = 8'h0;
parameter CTRL_STEP_PHASE = 1'h0;
parameter CTRL_PD = 1'h0;
parameter CTRL_AUXDIVPD = 1'h0;
parameter CTRL_CLKRESETEN = 1'h0;
parameter CTRL_CLKRESET = 1'h0;
parameter CTRL_RESET_RTL_TXPLL = 1'h0;
parameter CTRL_RESET_RTL = 1'h0;
parameter CTRL_FOUTAUXDIV2_SEL = 1'h0;
parameter CLK_SEL_CDRCLK_LN01_INT_SEL = 3'h0;
parameter CLK_SEL_CDRCLK_LN23_INT_SEL = 3'h0;
parameter CLK_SEL_CDRCLK_OUT_UP_SEL = 3'h0;
parameter CLK_SEL_CDRCLK_OUT_DN_SEL = 3'h0;
parameter JA_1_JA_DIVFIN = 16'h0;
parameter JA_1_JA_DIVFFB = 16'h0;
parameter JA_2_JA_SYNCCNTMAX = 32'h0;
parameter JA_3_JA_CNTOFFSET = 16'h0;
parameter JA_3_JA_TARGETCNT = 16'h0;
parameter JA_4_JA_OTDLY = 16'h0;
parameter JA_4_JA_FMI = 8'h0;
parameter JA_4_JA_FKI = 5'h0;
parameter JA_5_JA_PMP1 = 8'h0;
parameter JA_5_JA_PMP2 = 8'h0;
parameter JA_5_JA_PMI1 = 8'h0;
parameter JA_5_JA_PMI2 = 8'h0;
parameter JA_6_JA_PKP1 = 5'h0;
parameter JA_6_JA_PKP2 = 5'h0;
parameter JA_6_JA_PKI1 = 5'h0;
parameter JA_6_JA_PKI2 = 5'h0;
parameter JA_7_JA_DELAYK = 24'h0;
parameter JA_7_JA_FDONLY = 1'h0;
parameter JA_7_JA_ONTARGETOV = 1'h0;
parameter JA_7_JA_PROGRAM = 1'h0;
parameter JA_8_JA_FRAC_PRESET = 24'h0;
parameter JA_8_JA_PRESET_EN = 1'h0;
parameter JA_8_JA_HOLD = 1'h0;
parameter JA_9_JA_INT_PRESET = 12'h0;
parameter JA_RST_JA_RESET = 1'h0;
parameter JA_RST_JA_RESET_FFB_OVERRIDE = 1'h0;
parameter JA_RST_JA_RESET_FFB_EXT = 1'h0;
parameter JA_RST_JA_RESET_FIN_OVERRIDE = 1'h0;
parameter JA_RST_JA_RESET_FIN_EXT = 1'h0;
parameter JA_RST_JA_RESET_CLKS_OVERRIDE = 1'h0;
parameter JA_RST_JA_RESET_CLKS_EXT = 1'h0;
parameter SERDES_SSMOD_SSMOD_DOWNSPREAD = 1'h0;
parameter SERDES_SSMOD_SSMOD_DISABLE_SSCG = 1'h0;
parameter SERDES_SSMOD_SSMOD_SPREAD = 5'h0;
parameter SERDES_SSMOD_SSMOD_DIVVAL = 6'h0;
parameter SERDES_SSMOD_SSMOD_EXT_MAXADDR = 8'h0;
parameter SERDES_SSMOD_SSMOD_SEL_EXTWAVE = 2'h0;
parameter SERDES_SSMOD_RN_SEL = 2'h0;
parameter SERDES_SSMOD_RN_FILTER = 1'h0;
parameter CTRL_BWSEL = 1'h0;
parameter CTRL_VBGREF_SEL = 1'h0;
parameter CTRL_FBDIV_SEL = 2'h0;
parameter CTRL_DSMPD = 1'h0;
parameter CLK_SEL_REFCLK_SEL_HM = 2'h0;
parameter CLK_SEL_REFCLK_SEL_SM = 3'h0;
parameter CLK_SEL_CASCADE_CLK_SEL_HM = 2'h0;
parameter CLK_SEL_CASCADE_CLK_SEL_SM = 3'h0;
parameter CLK_SEL_JA_FREF_SEL = 3'h0;
parameter DIV_1_AUXDIV = 12'h0;
parameter DIV_1_FBDIV = 12'h0;
parameter DIV_2_FRAC = 24'h0;
parameter DIV_2_REFDIV = 6'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module UPROM(
       ADDR,
       BLK,
       BUSY,
       DATAR
    ) ;
/* synthesis syn_black_box

syn_tpd0 = " ADDR[0]->DATAR[0] = 10.301"
syn_tpd1 = " ADDR[0]->DATAR[1] = 10.541"
syn_tpd2 = " ADDR[0]->DATAR[2] = 10.484"
syn_tpd3 = " ADDR[0]->DATAR[3] = 10.535"
syn_tpd4 = " ADDR[0]->DATAR[4] = 10.557"
syn_tpd5 = " ADDR[0]->DATAR[5] = 10.505"
syn_tpd6 = " ADDR[0]->DATAR[6] = 10.485"
syn_tpd7 = " ADDR[0]->DATAR[7] = 10.520"
syn_tpd8 = " ADDR[0]->DATAR[8] = 10.538"
syn_tpd9 = " ADDR[10]->DATAR[0] = 10.296"
syn_tpd10 = " ADDR[10]->DATAR[1] = 10.536"
syn_tpd11 = " ADDR[10]->DATAR[2] = 10.479"
syn_tpd12 = " ADDR[10]->DATAR[3] = 10.531"
syn_tpd13 = " ADDR[10]->DATAR[4] = 10.553"
syn_tpd14 = " ADDR[10]->DATAR[5] = 10.501"
syn_tpd15 = " ADDR[10]->DATAR[6] = 10.481"
syn_tpd16 = " ADDR[10]->DATAR[7] = 10.515"
syn_tpd17 = " ADDR[10]->DATAR[8] = 10.534"
syn_tpd18 = " ADDR[11]->DATAR[0] = 10.299"
syn_tpd19 = " ADDR[11]->DATAR[1] = 10.539"
syn_tpd20 = " ADDR[11]->DATAR[2] = 10.482"
syn_tpd21 = " ADDR[11]->DATAR[3] = 10.533"
syn_tpd22 = " ADDR[11]->DATAR[4] = 10.555"
syn_tpd23 = " ADDR[11]->DATAR[5] = 10.503"
syn_tpd24 = " ADDR[11]->DATAR[6] = 10.483"
syn_tpd25 = " ADDR[11]->DATAR[7] = 10.518"
syn_tpd26 = " ADDR[11]->DATAR[8] = 10.536"
syn_tpd27 = " ADDR[12]->DATAR[0] = 10.296"
syn_tpd28 = " ADDR[12]->DATAR[1] = 10.536"
syn_tpd29 = " ADDR[12]->DATAR[2] = 10.479"
syn_tpd30 = " ADDR[12]->DATAR[3] = 10.530"
syn_tpd31 = " ADDR[12]->DATAR[4] = 10.552"
syn_tpd32 = " ADDR[12]->DATAR[5] = 10.500"
syn_tpd33 = " ADDR[12]->DATAR[6] = 10.480"
syn_tpd34 = " ADDR[12]->DATAR[7] = 10.515"
syn_tpd35 = " ADDR[12]->DATAR[8] = 10.533"
syn_tpd36 = " ADDR[13]->DATAR[0] = 10.296"
syn_tpd37 = " ADDR[13]->DATAR[1] = 10.536"
syn_tpd38 = " ADDR[13]->DATAR[2] = 10.479"
syn_tpd39 = " ADDR[13]->DATAR[3] = 10.530"
syn_tpd40 = " ADDR[13]->DATAR[4] = 10.552"
syn_tpd41 = " ADDR[13]->DATAR[5] = 10.500"
syn_tpd42 = " ADDR[13]->DATAR[6] = 10.480"
syn_tpd43 = " ADDR[13]->DATAR[7] = 10.515"
syn_tpd44 = " ADDR[13]->DATAR[8] = 10.533"
syn_tpd45 = " ADDR[14]->DATAR[0] = 10.299"
syn_tpd46 = " ADDR[14]->DATAR[1] = 10.539"
syn_tpd47 = " ADDR[14]->DATAR[2] = 10.482"
syn_tpd48 = " ADDR[14]->DATAR[3] = 10.533"
syn_tpd49 = " ADDR[14]->DATAR[4] = 10.555"
syn_tpd50 = " ADDR[14]->DATAR[5] = 10.503"
syn_tpd51 = " ADDR[14]->DATAR[6] = 10.483"
syn_tpd52 = " ADDR[14]->DATAR[7] = 10.518"
syn_tpd53 = " ADDR[14]->DATAR[8] = 10.536"
syn_tpd54 = " ADDR[15]->DATAR[0] = 10.299"
syn_tpd55 = " ADDR[15]->DATAR[1] = 10.539"
syn_tpd56 = " ADDR[15]->DATAR[2] = 10.483"
syn_tpd57 = " ADDR[15]->DATAR[3] = 10.534"
syn_tpd58 = " ADDR[15]->DATAR[4] = 10.556"
syn_tpd59 = " ADDR[15]->DATAR[5] = 10.504"
syn_tpd60 = " ADDR[15]->DATAR[6] = 10.484"
syn_tpd61 = " ADDR[15]->DATAR[7] = 10.519"
syn_tpd62 = " ADDR[15]->DATAR[8] = 10.537"
syn_tpd63 = " ADDR[1]->DATAR[0] = 10.301"
syn_tpd64 = " ADDR[1]->DATAR[1] = 10.541"
syn_tpd65 = " ADDR[1]->DATAR[2] = 10.484"
syn_tpd66 = " ADDR[1]->DATAR[3] = 10.535"
syn_tpd67 = " ADDR[1]->DATAR[4] = 10.557"
syn_tpd68 = " ADDR[1]->DATAR[5] = 10.505"
syn_tpd69 = " ADDR[1]->DATAR[6] = 10.485"
syn_tpd70 = " ADDR[1]->DATAR[7] = 10.520"
syn_tpd71 = " ADDR[1]->DATAR[8] = 10.538"
syn_tpd72 = " ADDR[2]->DATAR[0] = 10.301"
syn_tpd73 = " ADDR[2]->DATAR[1] = 10.541"
syn_tpd74 = " ADDR[2]->DATAR[2] = 10.484"
syn_tpd75 = " ADDR[2]->DATAR[3] = 10.535"
syn_tpd76 = " ADDR[2]->DATAR[4] = 10.557"
syn_tpd77 = " ADDR[2]->DATAR[5] = 10.505"
syn_tpd78 = " ADDR[2]->DATAR[6] = 10.485"
syn_tpd79 = " ADDR[2]->DATAR[7] = 10.520"
syn_tpd80 = " ADDR[2]->DATAR[8] = 10.538"
syn_tpd81 = " ADDR[3]->DATAR[0] = 10.301"
syn_tpd82 = " ADDR[3]->DATAR[1] = 10.541"
syn_tpd83 = " ADDR[3]->DATAR[2] = 10.484"
syn_tpd84 = " ADDR[3]->DATAR[3] = 10.535"
syn_tpd85 = " ADDR[3]->DATAR[4] = 10.557"
syn_tpd86 = " ADDR[3]->DATAR[5] = 10.505"
syn_tpd87 = " ADDR[3]->DATAR[6] = 10.485"
syn_tpd88 = " ADDR[3]->DATAR[7] = 10.520"
syn_tpd89 = " ADDR[3]->DATAR[8] = 10.538"
syn_tpd90 = " ADDR[4]->DATAR[0] = 10.301"
syn_tpd91 = " ADDR[4]->DATAR[1] = 10.541"
syn_tpd92 = " ADDR[4]->DATAR[2] = 10.484"
syn_tpd93 = " ADDR[4]->DATAR[3] = 10.535"
syn_tpd94 = " ADDR[4]->DATAR[4] = 10.557"
syn_tpd95 = " ADDR[4]->DATAR[5] = 10.505"
syn_tpd96 = " ADDR[4]->DATAR[6] = 10.485"
syn_tpd97 = " ADDR[4]->DATAR[7] = 10.520"
syn_tpd98 = " ADDR[4]->DATAR[8] = 10.538"
syn_tpd99 = " ADDR[5]->DATAR[0] = 10.301"
syn_tpd100 = " ADDR[5]->DATAR[1] = 10.541"
syn_tpd101 = " ADDR[5]->DATAR[2] = 10.484"
syn_tpd102 = " ADDR[5]->DATAR[3] = 10.535"
syn_tpd103 = " ADDR[5]->DATAR[4] = 10.557"
syn_tpd104 = " ADDR[5]->DATAR[5] = 10.505"
syn_tpd105 = " ADDR[5]->DATAR[6] = 10.485"
syn_tpd106 = " ADDR[5]->DATAR[7] = 10.520"
syn_tpd107 = " ADDR[5]->DATAR[8] = 10.538"
syn_tpd108 = " ADDR[6]->DATAR[0] = 10.301"
syn_tpd109 = " ADDR[6]->DATAR[1] = 10.541"
syn_tpd110 = " ADDR[6]->DATAR[2] = 10.484"
syn_tpd111 = " ADDR[6]->DATAR[3] = 10.535"
syn_tpd112 = " ADDR[6]->DATAR[4] = 10.557"
syn_tpd113 = " ADDR[6]->DATAR[5] = 10.505"
syn_tpd114 = " ADDR[6]->DATAR[6] = 10.485"
syn_tpd115 = " ADDR[6]->DATAR[7] = 10.520"
syn_tpd116 = " ADDR[6]->DATAR[8] = 10.538"
syn_tpd117 = " ADDR[7]->DATAR[0] = 10.301"
syn_tpd118 = " ADDR[7]->DATAR[1] = 10.541"
syn_tpd119 = " ADDR[7]->DATAR[2] = 10.484"
syn_tpd120 = " ADDR[7]->DATAR[3] = 10.535"
syn_tpd121 = " ADDR[7]->DATAR[4] = 10.557"
syn_tpd122 = " ADDR[7]->DATAR[5] = 10.505"
syn_tpd123 = " ADDR[7]->DATAR[6] = 10.485"
syn_tpd124 = " ADDR[7]->DATAR[7] = 10.520"
syn_tpd125 = " ADDR[7]->DATAR[8] = 10.538"
syn_tpd126 = " ADDR[8]->DATAR[0] = 10.300"
syn_tpd127 = " ADDR[8]->DATAR[1] = 10.540"
syn_tpd128 = " ADDR[8]->DATAR[2] = 10.484"
syn_tpd129 = " ADDR[8]->DATAR[3] = 10.535"
syn_tpd130 = " ADDR[8]->DATAR[4] = 10.557"
syn_tpd131 = " ADDR[8]->DATAR[5] = 10.505"
syn_tpd132 = " ADDR[8]->DATAR[6] = 10.485"
syn_tpd133 = " ADDR[8]->DATAR[7] = 10.520"
syn_tpd134 = " ADDR[8]->DATAR[8] = 10.538"
syn_tpd135 = " ADDR[9]->DATAR[0] = 10.299"
syn_tpd136 = " ADDR[9]->DATAR[1] = 10.540"
syn_tpd137 = " ADDR[9]->DATAR[2] = 10.483"
syn_tpd138 = " ADDR[9]->DATAR[3] = 10.534"
syn_tpd139 = " ADDR[9]->DATAR[4] = 10.556"
syn_tpd140 = " ADDR[9]->DATAR[5] = 10.504"
syn_tpd141 = " ADDR[9]->DATAR[6] = 10.484"
syn_tpd142 = " ADDR[9]->DATAR[7] = 10.519"
syn_tpd143 = " ADDR[9]->DATAR[8] = 10.537"
syn_tpd144 = " BLK->DATAR[0] = 10.358"
syn_tpd145 = " BLK->DATAR[1] = 10.598"
syn_tpd146 = " BLK->DATAR[2] = 10.543"
syn_tpd147 = " BLK->DATAR[3] = 10.592"
syn_tpd148 = " BLK->DATAR[4] = 10.615"
syn_tpd149 = " BLK->DATAR[5] = 10.563"
syn_tpd150 = " BLK->DATAR[6] = 10.543"
syn_tpd151 = " BLK->DATAR[7] = 10.577"
syn_tpd152 = " BLK->DATAR[8] = 10.598"
*/
/* synthesis black_box_pad_pin ="" */
input  [15:0] ADDR;
input  BLK;
output BUSY;
output [8:0] DATAR;
parameter MEMORYFILE = "";

endmodule
`timescale 1 ns/100 ps
// Version: 


module USPI(
       CLK_OE,
       CLK_O,
       D_OE,
       D_O,
       SS_OE,
       SS_O,
       D_I,
       FAB_SPI_OWNER,
       CLK,
       DI,
       DO,
       SS,
       IFACE,
       FLASH
    ) ;
/* synthesis syn_black_box

syn_tpd0 = " CLK_O->CLK = 1.438"
syn_tpd1 = " SS_O->SS = 1.438"
syn_tpd2 = " SS_OE->SS = 1.438"
*/
/* synthesis black_box_pad_pin ="CLK,DI,DO,SS,IFACE,FLASH" */
input  CLK_OE;
input  CLK_O;
input  D_OE;
input  D_O;
input  SS_OE;
input  SS_O;
output D_I;
output FAB_SPI_OWNER;
output CLK;
input  DI;
output DO;
output SS;
input  IFACE;
input  FLASH;

endmodule
`timescale 1 ns/100 ps
// Version: 


module VOLTAGEDETECT(
       VOLT_DETECT_1P0_HIGH_CLEAR,
       VOLT_DETECT_1P0_LOW_CLEAR,
       VOLT_DETECT_1P8_HIGH_CLEAR,
       VOLT_DETECT_1P8_LOW_CLEAR,
       VOLT_DETECT_2P5_HIGH_CLEAR,
       VOLT_DETECT_2P5_LOW_CLEAR,
       VOLT_DETECT_1P0_HIGH,
       VOLT_DETECT_1P0_LOW,
       VOLT_DETECT_1P8_HIGH,
       VOLT_DETECT_1P8_LOW,
       VOLT_DETECT_2P5_HIGH,
       VOLT_DETECT_2P5_LOW
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  VOLT_DETECT_1P0_HIGH_CLEAR;
input  VOLT_DETECT_1P0_LOW_CLEAR;
input  VOLT_DETECT_1P8_HIGH_CLEAR;
input  VOLT_DETECT_1P8_LOW_CLEAR;
input  VOLT_DETECT_2P5_HIGH_CLEAR;
input  VOLT_DETECT_2P5_LOW_CLEAR;
output VOLT_DETECT_1P0_HIGH;
output VOLT_DETECT_1P0_LOW;
output VOLT_DETECT_1P8_HIGH;
output VOLT_DETECT_1P8_LOW;
output VOLT_DETECT_2P5_HIGH;
output VOLT_DETECT_2P5_LOW;
parameter VDETECTOR_ENABLE_1P0 = 1'h0;
parameter VDETECTOR_ENABLE_1P8 = 1'h0;
parameter VDETECTOR_ENABLE_2P5 = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module VREFBANKDYN(
       A
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  A;
parameter PC_DYNEN = 1'h0;
parameter PC_DYNEN_VREFCTRL = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module VREFCTRL(
       LOAD,
       MOVE,
       VREF_DIRECTION,
       OUT_OF_RANGE
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  LOAD;
input  MOVE;
input  VREF_DIRECTION;
output OUT_OF_RANGE;
parameter BANK_NUMBER = "";
parameter PC_SOFTRESET = 1'h0;
parameter PC_VS = 4'h0;
parameter PC_VRGEN = 6'h0;
parameter PC_VRGEN_EN = 1'h0;
parameter PC_MOVE_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_64B6XB(
       RX_REF_CLK,
       TX_DATA,
       RX_FWF_EN,
       TX_FWF_EN,
       RX_SLIP,
       TX_HDR,
       TX_SOS,
       TX_BYPASS_DATA,
       TX_ELEC_IDLE,
       PCS_ARST_N,
       PMA_ARST_N,
       RX_FWF_CLK,
       TX_FWF_CLK,
       TX_CLK_STABLE,
       RX_VAL,
       RX_READY,
       RX_IDLE,
       RX_HDR,
       RX_DATA_VAL,
       RX_SOS,
       STATUS_LOCK,
       STATUS_HI_BER,
       RX_HDR_VAL,
       RX_BYPASS_DATA,
       RX_DATA,
       RX_CLK_R,
       TX_CLK_R,
       PCS_DEBUG,
       REF_CLK_N,
       REF_CLK_P,
       RX_N,
       RX_P,
       TX_N,
       TX_P,
       JA_CLK,
       TX_BIT_CLK_0,
       TX_BIT_CLK_1,
       TX_PLL_LOCK_0,
       TX_PLL_LOCK_1,
       TX_PLL_REF_CLK_0,
       TX_PLL_REF_CLK_1,
       TX_CLK_G,
       RX_CLK_G,
       PMA_DEBUG,
       ARST_N,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT,
       LINK_CLK,
       LINK_ADDR,
       LINK_EN,
       LINK_ARST_N,
       LINK_WDATA,
       LINK_RDATA
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " RX_FWF_EN->RX_FWF_CLK = 0.916"
syn_tsu1 = " TX_BYPASS_DATA->TX_FWF_CLK = 1.247"
syn_tsu2 = " TX_DATA[0]->TX_FWF_CLK = 1.212"
syn_tsu3 = " TX_DATA[10]->TX_FWF_CLK = 1.181"
syn_tsu4 = " TX_DATA[11]->TX_FWF_CLK = 1.196"
syn_tsu5 = " TX_DATA[12]->TX_FWF_CLK = 1.16"
syn_tsu6 = " TX_DATA[13]->TX_FWF_CLK = 1.17"
syn_tsu7 = " TX_DATA[14]->TX_FWF_CLK = 1.177"
syn_tsu8 = " TX_DATA[15]->TX_FWF_CLK = 1.251"
syn_tsu9 = " TX_DATA[16]->TX_FWF_CLK = 1.156"
syn_tsu10 = " TX_DATA[17]->TX_FWF_CLK = 1.255"
syn_tsu11 = " TX_DATA[18]->TX_FWF_CLK = 1.239"
syn_tsu12 = " TX_DATA[19]->TX_FWF_CLK = 1.214"
syn_tsu13 = " TX_DATA[1]->TX_FWF_CLK = 1.201"
syn_tsu14 = " TX_DATA[20]->TX_FWF_CLK = 1.201"
syn_tsu15 = " TX_DATA[21]->TX_FWF_CLK = 1.273"
syn_tsu16 = " TX_DATA[22]->TX_FWF_CLK = 1.231"
syn_tsu17 = " TX_DATA[23]->TX_FWF_CLK = 1.205"
syn_tsu18 = " TX_DATA[24]->TX_FWF_CLK = 1.227"
syn_tsu19 = " TX_DATA[25]->TX_FWF_CLK = 1.276"
syn_tsu20 = " TX_DATA[26]->TX_FWF_CLK = 1.24"
syn_tsu21 = " TX_DATA[27]->TX_FWF_CLK = 1.176"
syn_tsu22 = " TX_DATA[28]->TX_FWF_CLK = 1.259"
syn_tsu23 = " TX_DATA[29]->TX_FWF_CLK = 1.178"
syn_tsu24 = " TX_DATA[2]->TX_FWF_CLK = 1.174"
syn_tsu25 = " TX_DATA[30]->TX_FWF_CLK = 1.226"
syn_tsu26 = " TX_DATA[31]->TX_FWF_CLK = 1.207"
syn_tsu27 = " TX_DATA[32]->TX_FWF_CLK = 1.189"
syn_tsu28 = " TX_DATA[33]->TX_FWF_CLK = 1.158"
syn_tsu29 = " TX_DATA[34]->TX_FWF_CLK = 1.19"
syn_tsu30 = " TX_DATA[35]->TX_FWF_CLK = 1.251"
syn_tsu31 = " TX_DATA[36]->TX_FWF_CLK = 1.208"
syn_tsu32 = " TX_DATA[37]->TX_FWF_CLK = 1.189"
syn_tsu33 = " TX_DATA[38]->TX_FWF_CLK = 1.182"
syn_tsu34 = " TX_DATA[39]->TX_FWF_CLK = 1.27"
syn_tsu35 = " TX_DATA[3]->TX_FWF_CLK = 1.229"
syn_tsu36 = " TX_DATA[40]->TX_FWF_CLK = 1.228"
syn_tsu37 = " TX_DATA[41]->TX_FWF_CLK = 1.255"
syn_tsu38 = " TX_DATA[42]->TX_FWF_CLK = 1.274"
syn_tsu39 = " TX_DATA[43]->TX_FWF_CLK = 1.158"
syn_tsu40 = " TX_DATA[44]->TX_FWF_CLK = 1.154"
syn_tsu41 = " TX_DATA[45]->TX_FWF_CLK = 1.262"
syn_tsu42 = " TX_DATA[46]->TX_FWF_CLK = 1.22"
syn_tsu43 = " TX_DATA[47]->TX_FWF_CLK = 1.253"
syn_tsu44 = " TX_DATA[48]->TX_FWF_CLK = 1.175"
syn_tsu45 = " TX_DATA[49]->TX_FWF_CLK = 1.236"
syn_tsu46 = " TX_DATA[4]->TX_FWF_CLK = 1.188"
syn_tsu47 = " TX_DATA[50]->TX_FWF_CLK = 1.178"
syn_tsu48 = " TX_DATA[51]->TX_FWF_CLK = 1.146"
syn_tsu49 = " TX_DATA[52]->TX_FWF_CLK = 1.213"
syn_tsu50 = " TX_DATA[53]->TX_FWF_CLK = 1.165"
syn_tsu51 = " TX_DATA[54]->TX_FWF_CLK = 1.226"
syn_tsu52 = " TX_DATA[55]->TX_FWF_CLK = 1.162"
syn_tsu53 = " TX_DATA[56]->TX_FWF_CLK = 1.214"
syn_tsu54 = " TX_DATA[57]->TX_FWF_CLK = 1.191"
syn_tsu55 = " TX_DATA[58]->TX_FWF_CLK = 1.268"
syn_tsu56 = " TX_DATA[59]->TX_FWF_CLK = 1.24"
syn_tsu57 = " TX_DATA[5]->TX_FWF_CLK = 1.189"
syn_tsu58 = " TX_DATA[60]->TX_FWF_CLK = 1.174"
syn_tsu59 = " TX_DATA[61]->TX_FWF_CLK = 1.224"
syn_tsu60 = " TX_DATA[62]->TX_FWF_CLK = 1.154"
syn_tsu61 = " TX_DATA[63]->TX_FWF_CLK = 1.156"
syn_tsu62 = " TX_DATA[6]->TX_FWF_CLK = 1.199"
syn_tsu63 = " TX_DATA[7]->TX_FWF_CLK = 1.17"
syn_tsu64 = " TX_DATA[8]->TX_FWF_CLK = 1.25"
syn_tsu65 = " TX_DATA[9]->TX_FWF_CLK = 1.177"
syn_tsu66 = " TX_ELEC_IDLE->TX_FWF_CLK = 1.17"
syn_tsu67 = " TX_FWF_EN->TX_FWF_CLK = 1.043"
syn_tsu68 = " TX_HDR[0]->TX_FWF_CLK = 1.18"
syn_tsu69 = " TX_HDR[1]->TX_FWF_CLK = 1.233"
syn_tsu70 = " TX_HDR[2]->TX_FWF_CLK = 1.182"
syn_tsu71 = " TX_HDR[3]->TX_FWF_CLK = 1.197"
syn_tsu72 = " TX_SOS->TX_FWF_CLK = 1.188"
syn_tco0 = " RX_FWF_CLK->RX_BYPASS_DATA = 2.911"
syn_tco1 = " RX_FWF_CLK->RX_DATA[0] = 2.954"
syn_tco2 = " RX_FWF_CLK->RX_DATA[10] = 2.830"
syn_tco3 = " RX_FWF_CLK->RX_DATA[11] = 2.832"
syn_tco4 = " RX_FWF_CLK->RX_DATA[12] = 2.867"
syn_tco5 = " RX_FWF_CLK->RX_DATA[13] = 2.858"
syn_tco6 = " RX_FWF_CLK->RX_DATA[14] = 2.835"
syn_tco7 = " RX_FWF_CLK->RX_DATA[15] = 2.826"
syn_tco8 = " RX_FWF_CLK->RX_DATA[16] = 2.858"
syn_tco9 = " RX_FWF_CLK->RX_DATA[17] = 2.841"
syn_tco10 = " RX_FWF_CLK->RX_DATA[18] = 2.856"
syn_tco11 = " RX_FWF_CLK->RX_DATA[19] = 2.862"
syn_tco12 = " RX_FWF_CLK->RX_DATA[1] = 2.937"
syn_tco13 = " RX_FWF_CLK->RX_DATA[20] = 2.845"
syn_tco14 = " RX_FWF_CLK->RX_DATA[21] = 2.879"
syn_tco15 = " RX_FWF_CLK->RX_DATA[22] = 2.877"
syn_tco16 = " RX_FWF_CLK->RX_DATA[23] = 2.852"
syn_tco17 = " RX_FWF_CLK->RX_DATA[24] = 2.830"
syn_tco18 = " RX_FWF_CLK->RX_DATA[25] = 2.865"
syn_tco19 = " RX_FWF_CLK->RX_DATA[26] = 2.857"
syn_tco20 = " RX_FWF_CLK->RX_DATA[27] = 2.875"
syn_tco21 = " RX_FWF_CLK->RX_DATA[28] = 2.852"
syn_tco22 = " RX_FWF_CLK->RX_DATA[29] = 2.875"
syn_tco23 = " RX_FWF_CLK->RX_DATA[2] = 2.928"
syn_tco24 = " RX_FWF_CLK->RX_DATA[30] = 2.844"
syn_tco25 = " RX_FWF_CLK->RX_DATA[31] = 2.860"
syn_tco26 = " RX_FWF_CLK->RX_DATA[32] = 2.866"
syn_tco27 = " RX_FWF_CLK->RX_DATA[33] = 2.886"
syn_tco28 = " RX_FWF_CLK->RX_DATA[34] = 2.877"
syn_tco29 = " RX_FWF_CLK->RX_DATA[35] = 2.879"
syn_tco30 = " RX_FWF_CLK->RX_DATA[36] = 2.883"
syn_tco31 = " RX_FWF_CLK->RX_DATA[37] = 2.854"
syn_tco32 = " RX_FWF_CLK->RX_DATA[38] = 2.855"
syn_tco33 = " RX_FWF_CLK->RX_DATA[39] = 2.883"
syn_tco34 = " RX_FWF_CLK->RX_DATA[3] = 2.964"
syn_tco35 = " RX_FWF_CLK->RX_DATA[40] = 2.875"
syn_tco36 = " RX_FWF_CLK->RX_DATA[41] = 2.848"
syn_tco37 = " RX_FWF_CLK->RX_DATA[42] = 2.862"
syn_tco38 = " RX_FWF_CLK->RX_DATA[43] = 2.827"
syn_tco39 = " RX_FWF_CLK->RX_DATA[44] = 2.845"
syn_tco40 = " RX_FWF_CLK->RX_DATA[45] = 2.850"
syn_tco41 = " RX_FWF_CLK->RX_DATA[46] = 2.886"
syn_tco42 = " RX_FWF_CLK->RX_DATA[47] = 2.873"
syn_tco43 = " RX_FWF_CLK->RX_DATA[48] = 2.859"
syn_tco44 = " RX_FWF_CLK->RX_DATA[49] = 2.856"
syn_tco45 = " RX_FWF_CLK->RX_DATA[4] = 2.851"
syn_tco46 = " RX_FWF_CLK->RX_DATA[50] = 2.840"
syn_tco47 = " RX_FWF_CLK->RX_DATA[51] = 2.839"
syn_tco48 = " RX_FWF_CLK->RX_DATA[52] = 2.865"
syn_tco49 = " RX_FWF_CLK->RX_DATA[53] = 2.854"
syn_tco50 = " RX_FWF_CLK->RX_DATA[54] = 2.831"
syn_tco51 = " RX_FWF_CLK->RX_DATA[55] = 2.862"
syn_tco52 = " RX_FWF_CLK->RX_DATA[56] = 2.845"
syn_tco53 = " RX_FWF_CLK->RX_DATA[57] = 2.815"
syn_tco54 = " RX_FWF_CLK->RX_DATA[58] = 2.795"
syn_tco55 = " RX_FWF_CLK->RX_DATA[59] = 2.827"
syn_tco56 = " RX_FWF_CLK->RX_DATA[5] = 2.846"
syn_tco57 = " RX_FWF_CLK->RX_DATA[60] = 2.777"
syn_tco58 = " RX_FWF_CLK->RX_DATA[61] = 2.802"
syn_tco59 = " RX_FWF_CLK->RX_DATA[62] = 2.767"
syn_tco60 = " RX_FWF_CLK->RX_DATA[63] = 2.809"
syn_tco61 = " RX_FWF_CLK->RX_DATA[6] = 2.818"
syn_tco62 = " RX_FWF_CLK->RX_DATA[7] = 2.868"
syn_tco63 = " RX_FWF_CLK->RX_DATA[8] = 2.841"
syn_tco64 = " RX_FWF_CLK->RX_DATA[9] = 2.840"
syn_tco65 = " RX_FWF_CLK->RX_DATA_VAL = 2.903"
syn_tco66 = " RX_FWF_CLK->RX_HDR[0] = 2.890"
syn_tco67 = " RX_FWF_CLK->RX_HDR[1] = 2.900"
syn_tco68 = " RX_FWF_CLK->RX_HDR[2] = 2.861"
syn_tco69 = " RX_FWF_CLK->RX_HDR[3] = 2.899"
syn_tco70 = " RX_FWF_CLK->RX_HDR_VAL = 2.938"
syn_tco71 = " RX_FWF_CLK->RX_SOS = 2.885"
syn_tco72 = " RX_FWF_CLK->RX_VAL = 2.295"
syn_tco73 = " RX_FWF_CLK->STATUS_HI_BER = 2.909"
syn_tco74 = " RX_FWF_CLK->STATUS_LOCK = 2.910"
syn_tpd75 = " TX_DATA[0]->PCS_DEBUG[14] = 6.324"
syn_tpd76 = " TX_DATA[0]->PCS_DEBUG[4] = 6.481"
syn_tpd77 = " TX_DATA[12]->PCS_DEBUG[12] = 5.969"
syn_tpd78 = " TX_DATA[12]->PCS_DEBUG[17] = 6.360"
syn_tpd79 = " TX_DATA[12]->PCS_DEBUG[2] = 6.261"
syn_tpd80 = " TX_DATA[12]->PCS_DEBUG[7] = 5.739"
syn_tpd81 = " TX_DATA[13]->PCS_DEBUG[13] = 5.676"
syn_tpd82 = " TX_DATA[13]->PCS_DEBUG[18] = 6.510"
syn_tpd83 = " TX_DATA[13]->PCS_DEBUG[3] = 6.658"
syn_tpd84 = " TX_DATA[13]->PCS_DEBUG[8] = 6.140"
*/
/* synthesis black_box_pad_pin ="RX_N,RX_P,TX_N,TX_P" */
input  RX_REF_CLK;
input  [63:0] TX_DATA;
input  RX_FWF_EN;
input  TX_FWF_EN;
input  RX_SLIP;
input  [3:0] TX_HDR;
input  TX_SOS;
input  TX_BYPASS_DATA;
input  TX_ELEC_IDLE;
input  PCS_ARST_N;
input  PMA_ARST_N;
input  RX_FWF_CLK;
input  TX_FWF_CLK;
output TX_CLK_STABLE;
output RX_VAL;
output RX_READY;
output RX_IDLE;
output [3:0] RX_HDR;
output RX_DATA_VAL;
output RX_SOS;
output STATUS_LOCK;
output STATUS_HI_BER;
output RX_HDR_VAL;
output RX_BYPASS_DATA;
output [63:0] RX_DATA;
output RX_CLK_R;
output TX_CLK_R;
output [19:0] PCS_DEBUG;
input  REF_CLK_N;
input  REF_CLK_P;
input  RX_N;
input  RX_P;
output TX_N;
output TX_P;
output JA_CLK;
input  TX_BIT_CLK_0;
input  TX_BIT_CLK_1;
input  TX_PLL_LOCK_0;
input  TX_PLL_LOCK_1;
input  TX_PLL_REF_CLK_0;
input  TX_PLL_REF_CLK_1;
output TX_CLK_G;
output RX_CLK_G;
output PMA_DEBUG;
output [1:0] ARST_N;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
input  LINK_CLK;
input  [2:0] LINK_ADDR;
input  LINK_EN;
input  LINK_ARST_N;
input  [3:0] LINK_WDATA;
output [3:0] LINK_RDATA;
parameter MAIN_QMUX_R0_QRST0_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST1_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST2_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST3_SRC = 3'h0;
parameter MSC_UNIQUE = "";
parameter JA_REF_CLK_SEL = "";
parameter DATA_RATE = 0.0;
parameter REG_FILE = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter GPSSMAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_V_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_PERIPH = 1'h0;
parameter GPSSMAIN_SPARE_SCRATCHPAD = 8'h0;
parameter GPSSMAIN_SPARE_SPARE_CTRL = 24'h0;
parameter PMA_CMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_RDIFF = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_P = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_N = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_PULLUP = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_APAD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_BWSEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_VBGREF_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FBDIV_SEL = 2'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_DSMPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PHASESTEPAMOUNT = 8'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_STEP_PHASE = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_AUXDIVPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESETEN = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESET = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL_TXPLL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FOUTAUXDIV2_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_JA_FREF_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN01_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN23_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_UP_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_DN_SEL = 3'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_AUXDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_FBDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_FRAC = 24'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_REFDIV = 6'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFIN = 16'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFFB = 16'h0;
parameter PMA_CMN_TXPLL_JA_2_TXPLL_JA_SYNCCNTMAX = 32'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_CNTOFFSET = 16'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_TARGETCNT = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_OTDLY = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FMI = 8'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FKI = 5'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_DELAYK = 24'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_FDONLY = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_ONTARGETOV = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_PROGRAM = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_FRAC_PRESET = 24'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_PRESET_EN = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_HOLD = 1'h0;
parameter PMA_CMN_TXPLL_JA_9_TXPLL_JA_INT_PRESET = 12'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_EXT = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DOWNSPREAD = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DISABLE_SSCG = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SPREAD = 5'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DIVVAL = 6'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_EXT_MAXADDR = 8'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SEL_EXTWAVE = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_SEL = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_FILTER = 1'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL85 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL100 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL150 = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CAL_TERM = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CURRENT_PROG = 2'h0;
parameter PMA_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_DES_CDR_CTRL_1_DCFBEN_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR0 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR1 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR2 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR3 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_CMRTRIM_CDR = 3'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT3_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_SEL = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_EN = 1'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT3_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CMRTRIM_DFEEM = 3'h0;
parameter PMA_DES_DFEEM_CTRL_2_H1 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H2 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H3 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H4 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_3_H5 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_DCFBEN_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE0 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE1 = 5'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_TH_DFE = 8'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_GRAY_DFE = 3'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_SEL = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_EN = 1'h0;
parameter PMA_DES_EM_CTRL_1_DCFBEN_EM = 1'h0;
parameter PMA_DES_EM_CTRL_1_H0EM0 = 5'h0;
parameter PMA_DES_EM_CTRL_1_H0EM1 = 5'h0;
parameter PMA_DES_EM_CTRL_1_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_TH_EM = 8'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_GRAY_EM = 3'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_SEL = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_EN = 1'h0;
parameter PMA_DES_RTL_EM_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_RTL_EM_EYEMONITOR_SAMPLE_COUNT = 12'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE_FROMFAB = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTSEL = 3'h0;
parameter PMA_DES_TEST_BUS_RXDTESTEN = 1'h0;
parameter PMA_DES_TEST_BUS_RXDTESTSEL = 3'h0;
parameter PMA_DES_CLK_CTRL_RXBYPASSEN = 1'h0;
parameter PMA_DES_RSTPD_RXPD = 1'h0;
parameter PMA_DES_RSTPD_RESETDES = 1'h0;
parameter PMA_DES_RSTPD_PDDFE = 1'h0;
parameter PMA_DES_RSTPD_PDEM = 1'h0;
parameter PMA_DES_RSTPD_RCVEN = 1'h0;
parameter PMA_DES_RSTPD_RESET_FIFO = 1'h0;
parameter PMA_DES_RTL_ERR_CHK_READ_ERROR = 1'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_RANGE = 2'h0;
parameter PMA_SER_CTRL_CMSTEP_VALUE = 1'h0;
parameter PMA_SER_CTRL_CMSTEP = 1'h0;
parameter PMA_SER_CTRL_NLPBK_EN = 1'h0;
parameter PMA_SER_CTRL_HSLPBKEN = 1'h0;
parameter PMA_SER_CTRL_HSLPBK_SEL = 3'h0;
parameter PMA_SER_RSTPD_RESETSEREN = 1'h0;
parameter PMA_SER_RSTPD_RESETSER = 1'h0;
parameter PMA_SER_RSTPD_TXPD = 1'h0;
parameter PMA_SER_DRV_BYP_BYPASSSER = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_COUNT_THRESHOLD = 14'h0;
parameter PMA_SER_RXDET_CTRL_RX_DETECT_EN = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_START = 1'h0;
parameter PMA_SER_STATIC_LSB_STATIC_PATTERN_LSB = 20'h0;
parameter PMA_SER_STATIC_MSB_STATIC_PATTERN_MSB = 20'h0;
parameter PMA_SER_TEST_BUS_TXATESTSEL = 3'h0;
parameter PMA_SER_TEST_BUS_DTESTEN_RTL = 1'h0;
parameter PMA_SER_TEST_BUS_DTESTSEL_RTL = 4'h0;
parameter PMA_SER_TEST_BUS_JTAG_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_TEST_BUS_PRBSERR_TO_DTEST_SEL = 2'h0;
parameter PMA_SER_TEST_BUS_RXPKDETOUT_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_3P5DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_6P0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_HS_0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_3P5DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_6P0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_HS_0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_3P5DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_6P0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_HS_0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_3P5DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_6P0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_HS_0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_3P5DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_6P0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_HS_0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_1 = 6'h0;
parameter PMA_SERDES_RTL_CTRL_RESET_RTL = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_PRBSMODE = 3'h0;
parameter PMA_SERDES_RTL_CTRL_TX_DATA_SELECT = 3'h0;
parameter PMA_SERDES_RTL_CTRL_RX_DATA_SELECT = 2'h0;
parameter PMA_SERDES_RTL_CTRL_RX_FIFO_INPUT_SELECT_NEIGHBOR = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_EYEMONITOR_COMPARISON_DATA_SEL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_CEN = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_RESET = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_FE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_DFE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_OFFSET_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_WAIT_PERIOD_GOOD_LOCK = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_CTLE_OFFSET_CAL = 6'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_GOOD_LOCK = 8'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_BYPASS_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_EM_ONLY = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCEH = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_PHASE_DIRECTION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_CLKDIV = 4'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FREQUENCY = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCE_CDR_COEFFS = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_NUM_COEFFS = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_DFE_CYCLES = 5'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_AREA_CYCLES = 2'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SET_DFE_COEFFS_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_ERROR_THR_CHANNEL_ALIGN = 12'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL0_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL1_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL2_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL3_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL4_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL5_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL6_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL7_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_AREA_COMPUTE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CHANNEL_ALIGN_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FE_CALIBRATION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FULL_CAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_GOOD_LOCK_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_DFE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0CDR = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H1 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H2 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H3 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H4 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H5 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CDRCTLE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RCVEN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_SLIP_DES_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_LOCK_OVERRIDE = 1'h0;
parameter PCSCMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_V_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_0_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_1_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_2_SEL = 5'h0;
parameter PCSCMN_QRST_R0_QRST0_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST0_RST_SEL = 4'h0;
parameter PCSCMN_QRST_R0_QRST1_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST1_RST_SEL = 4'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_MODE = 3'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_X = 2'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_Y = 2'h0;
parameter PCS_SOFT_RESET_NV_MAP = 1'h0;
parameter PCS_SOFT_RESET_V_MAP = 1'h0;
parameter PCS_LFWF_R0_RXFWF_WMARK = 1'h0;
parameter PCS_LFWF_R0_TXFWF_WMARK = 1'h0;
parameter PCS_LPIP_R0_PIPE_SHAREDPLL = 1'h0;
parameter PCS_LPIP_R0_PIPE_INITIALIZATION_DONE = 1'h0;
parameter PCS_LPIP_R0_PIPE_OOB_IDLEBURST_TIMING = 2'h0;
parameter PCS_L64_R0_L64_CFG_BER_1US_TIMER_VAL = 11'h0;
parameter PCS_L64_R1_L64_BYPASS_TEST = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATTERN_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_TYPE_SEL = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PRBS31_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_DATA_SEL = 1'h0;
parameter PCS_L64_R2_L64_SEED_A_VALUE_LO32 = 32'h0;
parameter PCS_L64_R3_L64_SEED_A_VALUE_HI26 = 26'h0;
parameter PCS_L64_R4_L64_SEED_B_VALUE_LO32 = 32'h0;
parameter PCS_L64_R5_L64_SEED_B_VALUE_HI26 = 26'h0;
parameter PCS_L64_R6_L64_TX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R6_L64_TX_ADD_UI = 16'h0;
parameter PCS_L64_R7_L64_RX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R7_L64_RX_ADD_UI = 16'h0;
parameter PCS_L8_R0_L8_TXENCSWAPSEL = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_CDR_RESETS_PCS_RX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_RXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_PLL_RESETS_PCS_TX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_TXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PIPE_RESET = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_RX = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_TX = 1'h0;
parameter PCS_OOB_R0_OOB_BURST_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_BURST_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R2_TXOOB_PROG_DATA_L32B = 32'h0;
parameter PCS_OOB_R3_TXOOB_PROG_DATA_H8B = 8'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_FLOCK_SEL = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R1_RXBEACON_MAX_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R1_TXBEACON_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R2_PD_PLL_CNT = 8'h0;
parameter PCS_PMA_CTRL_R2_PIPE_RATE_INIT = 2'h0;
parameter PCS_PMA_CTRL_R2_FAB_DRIVES_TXPADS = 1'h0;
parameter PCS_MSTR_CTRL_LANE_MSTR = 2'h0;
parameter MAIN_SOFT_RESET_PERIPH = 1'h0;
parameter MAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter MAIN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_DES_CDR_CTRL_3_CST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_CST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RXDRV_CDR = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST2_DFEEM = 2'h0;
parameter PMA_DES_DFE_CTRL_2_RXDRV_DFE = 2'h0;
parameter PMA_DES_DFE_CTRL_2_CTLEEN_DFE = 1'h0;
parameter PMA_DES_EM_CTRL_2_RXDRV_EM = 2'h0;
parameter PMA_DES_EM_CTRL_2_CTLEEN_EM = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM = 4'h0;
parameter PMA_DES_IN_TERM_RXTEN = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM_SEL = 2'h0;
parameter PMA_DES_IN_TERM_ACCOUPLE_RXVCM_EN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETEN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETRANGE = 1'h0;
parameter PMA_DES_PKDET_RXPKDET_LOW_THRESHOLD = 3'h0;
parameter PMA_DES_PKDET_RXPKDET_HIGH_THRESHOLD = 3'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_MODE = 1'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE = 2'h0;
parameter PMA_DES_RTL_LOCK_CTRL_FDET_SAMPLE_PERIODS = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_RANGE = 2'h0;
parameter PMA_DES_RXPLL_DIV_CDR_GAIN = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTEN = 1'h0;
parameter PMA_DES_CLK_CTRL_RXREFCLK_SEL = 3'h0;
parameter PMA_DES_CLK_CTRL_DESMODE = 3'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKEN = 1'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKDIVEN = 1'h0;
parameter PMA_SER_CTRL_TXVBGREF_SEL = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIVEN = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIV = 2'h0;
parameter PMA_SER_CLK_CTRL_TXBITCLKSEL = 1'h0;
parameter PMA_SER_CLK_CTRL_SERMODE = 3'h0;
parameter PMA_SER_DRV_BYP_BYPASS_VALUE = 8'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT_RTL = 2'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_STEP_WAIT_COUNT = 5'h0;
parameter PMA_SER_TERM_CTRL_TXCM_LEVEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXTEN = 1'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM_SEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM = 4'h0;
parameter PMA_SER_TEST_BUS_TXATESTEN = 1'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDEL = 16'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDATA_INV = 8'h0;
parameter PMA_SER_DRV_CTRL_TXDRVTRIM = 24'h0;
parameter PMA_SER_DRV_CTRL_TXDRV = 3'h0;
parameter PMA_SER_DRV_CTRL_TXITRIM = 2'h0;
parameter PMA_SER_DRV_CTRL_TXODRV = 2'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDRV_CTRL_SEL = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXODRV_BOOSTER = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXMARGIN = 3'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXSWING = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS_BEACON = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_HALF_RATE10BIT = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_HALF_RATE10BIT = 1'h0;
parameter PCS_SOFT_RESET_PERIPH = 1'h0;
parameter PCS_LFWF_R0_RXFWF_RATIO = 2'h0;
parameter PCS_LFWF_R0_TXFWF_RATIO = 2'h0;
parameter PCS_LOVR_R0_FAB_IFC_MODE = 4'h0;
parameter PCS_LOVR_R0_PCSPMA_IFC_MODE = 4'h0;
parameter PCS_LPIP_R0_PIPEENABLE = 1'h0;
parameter PCS_LPIP_R0_PIPEMODE = 1'h0;
parameter PCS_LPIP_R0_PIPE_PCIE_HC = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_SCRAMBLER = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_DISPARITY = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_GEARBOX = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_64B67B = 1'h0;
parameter PCS_L64_R0_L64_CFG_BER_MON_EN = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_8B_MODE = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C49 = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C82 = 1'h0;
parameter PCS_L8_R0_L8_GEARMODE = 2'h0;
parameter PCS_LNTV_R0_LNTV_RX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_RX_IN_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_RX_MODE = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_OUT_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_TX_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_TMG_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_PCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_PCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_RCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_PIPE = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_LCL = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_OUT = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FAB_EPCS_PMA_RESET_B_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_8B10B(
       RX_REF_CLK,
       TX_DATA,
       RX_FWF_EN,
       TX_FWF_EN,
       RX_SLIP,
       TX_K,
       TX_DISPFNC,
       PCS_ARST_N,
       PMA_ARST_N,
       RX_FWF_CLK,
       TX_FWF_CLK,
       TX_CLK_STABLE,
       RX_VAL,
       RX_READY,
       RX_IDLE,
       RX_CODE_VIOLATION_1,
       RX_DISPARITY_ERROR_1,
       RX_CODE_VIOLATION_0,
       RX_DISPARITY_ERROR_0,
       RX_DISPARITY_ERROR_2,
       RX_CODE_VIOLATION_2,
       RX_DISPARITY_ERROR_3,
       RX_CODE_VIOLATION_3,
       RX_DISPARITY_ERROR_4,
       RX_CODE_VIOLATION_7,
       RX_DISPARITY_ERROR_7,
       RX_CODE_VIOLATION_6,
       RX_DISPARITY_ERROR_6,
       RX_CODE_VIOLATION_5,
       RX_DISPARITY_ERROR_5,
       RX_CODE_VIOLATION_4,
       RX_K,
       RX_DATA,
       RX_CLK_R,
       TX_CLK_R,
       PCS_DEBUG,
       REF_CLK_N,
       REF_CLK_P,
       RX_N,
       RX_P,
       TX_N,
       TX_P,
       JA_CLK,
       TX_BIT_CLK_0,
       TX_BIT_CLK_1,
       TX_PLL_LOCK_0,
       TX_PLL_LOCK_1,
       TX_PLL_REF_CLK_0,
       TX_PLL_REF_CLK_1,
       TX_CLK_G,
       RX_CLK_G,
       PMA_DEBUG,
       ARST_N,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT,
       LINK_CLK,
       LINK_ADDR,
       LINK_EN,
       LINK_ARST_N,
       LINK_WDATA,
       LINK_RDATA
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " RX_FWF_EN->RX_FWF_CLK = 0.916"
syn_tsu1 = " TX_DATA[0]->TX_FWF_CLK = 1.212"
syn_tsu2 = " TX_DATA[10]->TX_FWF_CLK = 1.181"
syn_tsu3 = " TX_DATA[11]->TX_FWF_CLK = 1.196"
syn_tsu4 = " TX_DATA[12]->TX_FWF_CLK = 1.16"
syn_tsu5 = " TX_DATA[13]->TX_FWF_CLK = 1.17"
syn_tsu6 = " TX_DATA[14]->TX_FWF_CLK = 1.177"
syn_tsu7 = " TX_DATA[15]->TX_FWF_CLK = 1.251"
syn_tsu8 = " TX_DATA[16]->TX_FWF_CLK = 1.156"
syn_tsu9 = " TX_DATA[17]->TX_FWF_CLK = 1.255"
syn_tsu10 = " TX_DATA[18]->TX_FWF_CLK = 1.239"
syn_tsu11 = " TX_DATA[19]->TX_FWF_CLK = 1.214"
syn_tsu12 = " TX_DATA[1]->TX_FWF_CLK = 1.201"
syn_tsu13 = " TX_DATA[20]->TX_FWF_CLK = 1.201"
syn_tsu14 = " TX_DATA[21]->TX_FWF_CLK = 1.273"
syn_tsu15 = " TX_DATA[22]->TX_FWF_CLK = 1.231"
syn_tsu16 = " TX_DATA[23]->TX_FWF_CLK = 1.205"
syn_tsu17 = " TX_DATA[24]->TX_FWF_CLK = 1.227"
syn_tsu18 = " TX_DATA[25]->TX_FWF_CLK = 1.276"
syn_tsu19 = " TX_DATA[26]->TX_FWF_CLK = 1.24"
syn_tsu20 = " TX_DATA[27]->TX_FWF_CLK = 1.176"
syn_tsu21 = " TX_DATA[28]->TX_FWF_CLK = 1.259"
syn_tsu22 = " TX_DATA[29]->TX_FWF_CLK = 1.178"
syn_tsu23 = " TX_DATA[2]->TX_FWF_CLK = 1.174"
syn_tsu24 = " TX_DATA[30]->TX_FWF_CLK = 1.226"
syn_tsu25 = " TX_DATA[31]->TX_FWF_CLK = 1.207"
syn_tsu26 = " TX_DATA[32]->TX_FWF_CLK = 1.189"
syn_tsu27 = " TX_DATA[33]->TX_FWF_CLK = 1.158"
syn_tsu28 = " TX_DATA[34]->TX_FWF_CLK = 1.19"
syn_tsu29 = " TX_DATA[35]->TX_FWF_CLK = 1.251"
syn_tsu30 = " TX_DATA[36]->TX_FWF_CLK = 1.208"
syn_tsu31 = " TX_DATA[37]->TX_FWF_CLK = 1.189"
syn_tsu32 = " TX_DATA[38]->TX_FWF_CLK = 1.182"
syn_tsu33 = " TX_DATA[39]->TX_FWF_CLK = 1.27"
syn_tsu34 = " TX_DATA[3]->TX_FWF_CLK = 1.229"
syn_tsu35 = " TX_DATA[40]->TX_FWF_CLK = 1.228"
syn_tsu36 = " TX_DATA[41]->TX_FWF_CLK = 1.255"
syn_tsu37 = " TX_DATA[42]->TX_FWF_CLK = 1.274"
syn_tsu38 = " TX_DATA[43]->TX_FWF_CLK = 1.158"
syn_tsu39 = " TX_DATA[44]->TX_FWF_CLK = 1.154"
syn_tsu40 = " TX_DATA[45]->TX_FWF_CLK = 1.262"
syn_tsu41 = " TX_DATA[46]->TX_FWF_CLK = 1.22"
syn_tsu42 = " TX_DATA[47]->TX_FWF_CLK = 1.253"
syn_tsu43 = " TX_DATA[48]->TX_FWF_CLK = 1.175"
syn_tsu44 = " TX_DATA[49]->TX_FWF_CLK = 1.236"
syn_tsu45 = " TX_DATA[4]->TX_FWF_CLK = 1.188"
syn_tsu46 = " TX_DATA[50]->TX_FWF_CLK = 1.178"
syn_tsu47 = " TX_DATA[51]->TX_FWF_CLK = 1.146"
syn_tsu48 = " TX_DATA[52]->TX_FWF_CLK = 1.213"
syn_tsu49 = " TX_DATA[53]->TX_FWF_CLK = 1.165"
syn_tsu50 = " TX_DATA[54]->TX_FWF_CLK = 1.226"
syn_tsu51 = " TX_DATA[55]->TX_FWF_CLK = 1.162"
syn_tsu52 = " TX_DATA[56]->TX_FWF_CLK = 1.214"
syn_tsu53 = " TX_DATA[57]->TX_FWF_CLK = 1.191"
syn_tsu54 = " TX_DATA[58]->TX_FWF_CLK = 1.268"
syn_tsu55 = " TX_DATA[59]->TX_FWF_CLK = 1.24"
syn_tsu56 = " TX_DATA[5]->TX_FWF_CLK = 1.189"
syn_tsu57 = " TX_DATA[60]->TX_FWF_CLK = 1.174"
syn_tsu58 = " TX_DATA[61]->TX_FWF_CLK = 1.224"
syn_tsu59 = " TX_DATA[62]->TX_FWF_CLK = 1.154"
syn_tsu60 = " TX_DATA[63]->TX_FWF_CLK = 1.156"
syn_tsu61 = " TX_DATA[6]->TX_FWF_CLK = 1.199"
syn_tsu62 = " TX_DATA[7]->TX_FWF_CLK = 1.17"
syn_tsu63 = " TX_DATA[8]->TX_FWF_CLK = 1.25"
syn_tsu64 = " TX_DATA[9]->TX_FWF_CLK = 1.177"
syn_tsu65 = " TX_DISPFNC[0]->TX_FWF_CLK = 1.211"
syn_tsu66 = " TX_DISPFNC[10]->TX_FWF_CLK = 1.158"
syn_tsu67 = " TX_DISPFNC[11]->TX_FWF_CLK = 1.255"
syn_tsu68 = " TX_DISPFNC[12]->TX_FWF_CLK = 1.232"
syn_tsu69 = " TX_DISPFNC[13]->TX_FWF_CLK = 1.154"
syn_tsu70 = " TX_DISPFNC[14]->TX_FWF_CLK = 1.247"
syn_tsu71 = " TX_DISPFNC[15]->TX_FWF_CLK = 1.17"
syn_tsu72 = " TX_DISPFNC[1]->TX_FWF_CLK = 1.203"
syn_tsu73 = " TX_DISPFNC[2]->TX_FWF_CLK = 1.17"
syn_tsu74 = " TX_DISPFNC[3]->TX_FWF_CLK = 1.178"
syn_tsu75 = " TX_DISPFNC[4]->TX_FWF_CLK = 1.258"
syn_tsu76 = " TX_DISPFNC[5]->TX_FWF_CLK = 1.241"
syn_tsu77 = " TX_DISPFNC[6]->TX_FWF_CLK = 1.176"
syn_tsu78 = " TX_DISPFNC[7]->TX_FWF_CLK = 1.195"
syn_tsu79 = " TX_DISPFNC[8]->TX_FWF_CLK = 1.175"
syn_tsu80 = " TX_DISPFNC[9]->TX_FWF_CLK = 1.175"
syn_tsu81 = " TX_FWF_EN->TX_FWF_CLK = 1.043"
syn_tsu82 = " TX_K[0]->TX_FWF_CLK = 1.18"
syn_tsu83 = " TX_K[1]->TX_FWF_CLK = 1.233"
syn_tsu84 = " TX_K[2]->TX_FWF_CLK = 1.182"
syn_tsu85 = " TX_K[3]->TX_FWF_CLK = 1.197"
syn_tsu86 = " TX_K[4]->TX_FWF_CLK = 1.188"
syn_tsu87 = " TX_K[5]->TX_FWF_CLK = 1.211"
syn_tsu88 = " TX_K[6]->TX_FWF_CLK = 1.239"
syn_tsu89 = " TX_K[7]->TX_FWF_CLK = 1.173"
syn_tco0 = " RX_FWF_CLK->RX_CODE_VIOLATION_0 = 2.861"
syn_tco1 = " RX_FWF_CLK->RX_CODE_VIOLATION_1 = 2.890"
syn_tco2 = " RX_FWF_CLK->RX_CODE_VIOLATION_2 = 2.885"
syn_tco3 = " RX_FWF_CLK->RX_CODE_VIOLATION_3 = 2.909"
syn_tco4 = " RX_FWF_CLK->RX_CODE_VIOLATION_4 = 2.862"
syn_tco5 = " RX_FWF_CLK->RX_CODE_VIOLATION_5 = 2.892"
syn_tco6 = " RX_FWF_CLK->RX_CODE_VIOLATION_6 = 2.886"
syn_tco7 = " RX_FWF_CLK->RX_CODE_VIOLATION_7 = 2.877"
syn_tco8 = " RX_FWF_CLK->RX_DATA[0] = 2.954"
syn_tco9 = " RX_FWF_CLK->RX_DATA[10] = 2.830"
syn_tco10 = " RX_FWF_CLK->RX_DATA[11] = 2.832"
syn_tco11 = " RX_FWF_CLK->RX_DATA[12] = 2.867"
syn_tco12 = " RX_FWF_CLK->RX_DATA[13] = 2.858"
syn_tco13 = " RX_FWF_CLK->RX_DATA[14] = 2.835"
syn_tco14 = " RX_FWF_CLK->RX_DATA[15] = 2.826"
syn_tco15 = " RX_FWF_CLK->RX_DATA[16] = 2.858"
syn_tco16 = " RX_FWF_CLK->RX_DATA[17] = 2.841"
syn_tco17 = " RX_FWF_CLK->RX_DATA[18] = 2.856"
syn_tco18 = " RX_FWF_CLK->RX_DATA[19] = 2.862"
syn_tco19 = " RX_FWF_CLK->RX_DATA[1] = 2.937"
syn_tco20 = " RX_FWF_CLK->RX_DATA[20] = 2.845"
syn_tco21 = " RX_FWF_CLK->RX_DATA[21] = 2.879"
syn_tco22 = " RX_FWF_CLK->RX_DATA[22] = 2.877"
syn_tco23 = " RX_FWF_CLK->RX_DATA[23] = 2.852"
syn_tco24 = " RX_FWF_CLK->RX_DATA[24] = 2.830"
syn_tco25 = " RX_FWF_CLK->RX_DATA[25] = 2.865"
syn_tco26 = " RX_FWF_CLK->RX_DATA[26] = 2.857"
syn_tco27 = " RX_FWF_CLK->RX_DATA[27] = 2.875"
syn_tco28 = " RX_FWF_CLK->RX_DATA[28] = 2.852"
syn_tco29 = " RX_FWF_CLK->RX_DATA[29] = 2.875"
syn_tco30 = " RX_FWF_CLK->RX_DATA[2] = 2.928"
syn_tco31 = " RX_FWF_CLK->RX_DATA[30] = 2.844"
syn_tco32 = " RX_FWF_CLK->RX_DATA[31] = 2.860"
syn_tco33 = " RX_FWF_CLK->RX_DATA[32] = 2.866"
syn_tco34 = " RX_FWF_CLK->RX_DATA[33] = 2.886"
syn_tco35 = " RX_FWF_CLK->RX_DATA[34] = 2.877"
syn_tco36 = " RX_FWF_CLK->RX_DATA[35] = 2.879"
syn_tco37 = " RX_FWF_CLK->RX_DATA[36] = 2.883"
syn_tco38 = " RX_FWF_CLK->RX_DATA[37] = 2.854"
syn_tco39 = " RX_FWF_CLK->RX_DATA[38] = 2.855"
syn_tco40 = " RX_FWF_CLK->RX_DATA[39] = 2.883"
syn_tco41 = " RX_FWF_CLK->RX_DATA[3] = 2.964"
syn_tco42 = " RX_FWF_CLK->RX_DATA[40] = 2.875"
syn_tco43 = " RX_FWF_CLK->RX_DATA[41] = 2.848"
syn_tco44 = " RX_FWF_CLK->RX_DATA[42] = 2.862"
syn_tco45 = " RX_FWF_CLK->RX_DATA[43] = 2.827"
syn_tco46 = " RX_FWF_CLK->RX_DATA[44] = 2.845"
syn_tco47 = " RX_FWF_CLK->RX_DATA[45] = 2.850"
syn_tco48 = " RX_FWF_CLK->RX_DATA[46] = 2.886"
syn_tco49 = " RX_FWF_CLK->RX_DATA[47] = 2.873"
syn_tco50 = " RX_FWF_CLK->RX_DATA[48] = 2.859"
syn_tco51 = " RX_FWF_CLK->RX_DATA[49] = 2.856"
syn_tco52 = " RX_FWF_CLK->RX_DATA[4] = 2.851"
syn_tco53 = " RX_FWF_CLK->RX_DATA[50] = 2.840"
syn_tco54 = " RX_FWF_CLK->RX_DATA[51] = 2.839"
syn_tco55 = " RX_FWF_CLK->RX_DATA[52] = 2.865"
syn_tco56 = " RX_FWF_CLK->RX_DATA[53] = 2.854"
syn_tco57 = " RX_FWF_CLK->RX_DATA[54] = 2.831"
syn_tco58 = " RX_FWF_CLK->RX_DATA[55] = 2.862"
syn_tco59 = " RX_FWF_CLK->RX_DATA[56] = 2.845"
syn_tco60 = " RX_FWF_CLK->RX_DATA[57] = 2.815"
syn_tco61 = " RX_FWF_CLK->RX_DATA[58] = 2.795"
syn_tco62 = " RX_FWF_CLK->RX_DATA[59] = 2.827"
syn_tco63 = " RX_FWF_CLK->RX_DATA[5] = 2.846"
syn_tco64 = " RX_FWF_CLK->RX_DATA[60] = 2.777"
syn_tco65 = " RX_FWF_CLK->RX_DATA[61] = 2.802"
syn_tco66 = " RX_FWF_CLK->RX_DATA[62] = 2.767"
syn_tco67 = " RX_FWF_CLK->RX_DATA[63] = 2.809"
syn_tco68 = " RX_FWF_CLK->RX_DATA[6] = 2.818"
syn_tco69 = " RX_FWF_CLK->RX_DATA[7] = 2.868"
syn_tco70 = " RX_FWF_CLK->RX_DATA[8] = 2.841"
syn_tco71 = " RX_FWF_CLK->RX_DATA[9] = 2.840"
syn_tco72 = " RX_FWF_CLK->RX_DISPARITY_ERROR_0 = 2.899"
syn_tco73 = " RX_FWF_CLK->RX_DISPARITY_ERROR_1 = 2.900"
syn_tco74 = " RX_FWF_CLK->RX_DISPARITY_ERROR_2 = 2.903"
syn_tco75 = " RX_FWF_CLK->RX_DISPARITY_ERROR_3 = 2.910"
syn_tco76 = " RX_FWF_CLK->RX_DISPARITY_ERROR_4 = 2.938"
syn_tco77 = " RX_FWF_CLK->RX_DISPARITY_ERROR_5 = 2.871"
syn_tco78 = " RX_FWF_CLK->RX_DISPARITY_ERROR_6 = 2.896"
syn_tco79 = " RX_FWF_CLK->RX_DISPARITY_ERROR_7 = 2.897"
syn_tco80 = " RX_FWF_CLK->RX_K[0] = 2.898"
syn_tco81 = " RX_FWF_CLK->RX_K[1] = 2.904"
syn_tco82 = " RX_FWF_CLK->RX_K[2] = 2.890"
syn_tco83 = " RX_FWF_CLK->RX_K[3] = 2.903"
syn_tco84 = " RX_FWF_CLK->RX_K[4] = 2.873"
syn_tco85 = " RX_FWF_CLK->RX_K[5] = 2.884"
syn_tco86 = " RX_FWF_CLK->RX_K[6] = 2.880"
syn_tco87 = " RX_FWF_CLK->RX_K[7] = 2.911"
syn_tco88 = " RX_FWF_CLK->RX_VAL = 2.295"
syn_tpd89 = " TX_DATA[0]->PCS_DEBUG[14] = 6.324"
syn_tpd90 = " TX_DATA[0]->PCS_DEBUG[4] = 6.481"
syn_tpd91 = " TX_DATA[12]->PCS_DEBUG[12] = 5.969"
syn_tpd92 = " TX_DATA[12]->PCS_DEBUG[17] = 6.360"
syn_tpd93 = " TX_DATA[12]->PCS_DEBUG[2] = 6.261"
syn_tpd94 = " TX_DATA[12]->PCS_DEBUG[7] = 5.739"
syn_tpd95 = " TX_DATA[13]->PCS_DEBUG[13] = 5.676"
syn_tpd96 = " TX_DATA[13]->PCS_DEBUG[18] = 6.510"
syn_tpd97 = " TX_DATA[13]->PCS_DEBUG[3] = 6.658"
syn_tpd98 = " TX_DATA[13]->PCS_DEBUG[8] = 6.140"
*/
/* synthesis black_box_pad_pin ="RX_N,RX_P,TX_N,TX_P" */
input  RX_REF_CLK;
input  [63:0] TX_DATA;
input  RX_FWF_EN;
input  TX_FWF_EN;
input  RX_SLIP;
input  [7:0] TX_K;
input  [15:0] TX_DISPFNC;
input  PCS_ARST_N;
input  PMA_ARST_N;
input  RX_FWF_CLK;
input  TX_FWF_CLK;
output TX_CLK_STABLE;
output RX_VAL;
output RX_READY;
output RX_IDLE;
output RX_CODE_VIOLATION_1;
output RX_DISPARITY_ERROR_1;
output RX_CODE_VIOLATION_0;
output RX_DISPARITY_ERROR_0;
output RX_DISPARITY_ERROR_2;
output RX_CODE_VIOLATION_2;
output RX_DISPARITY_ERROR_3;
output RX_CODE_VIOLATION_3;
output RX_DISPARITY_ERROR_4;
output RX_CODE_VIOLATION_7;
output RX_DISPARITY_ERROR_7;
output RX_CODE_VIOLATION_6;
output RX_DISPARITY_ERROR_6;
output RX_CODE_VIOLATION_5;
output RX_DISPARITY_ERROR_5;
output RX_CODE_VIOLATION_4;
output [7:0] RX_K;
output [63:0] RX_DATA;
output RX_CLK_R;
output TX_CLK_R;
output [19:0] PCS_DEBUG;
input  REF_CLK_N;
input  REF_CLK_P;
input  RX_N;
input  RX_P;
output TX_N;
output TX_P;
output JA_CLK;
input  TX_BIT_CLK_0;
input  TX_BIT_CLK_1;
input  TX_PLL_LOCK_0;
input  TX_PLL_LOCK_1;
input  TX_PLL_REF_CLK_0;
input  TX_PLL_REF_CLK_1;
output TX_CLK_G;
output RX_CLK_G;
output PMA_DEBUG;
output [1:0] ARST_N;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
input  LINK_CLK;
input  [2:0] LINK_ADDR;
input  LINK_EN;
input  LINK_ARST_N;
input  [3:0] LINK_WDATA;
output [3:0] LINK_RDATA;
parameter MAIN_QMUX_R0_QRST0_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST1_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST2_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST3_SRC = 3'h0;
parameter MSC_UNIQUE = "";
parameter JA_REF_CLK_SEL = "";
parameter DATA_RATE = 0.0;
parameter REG_FILE = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter GPSSMAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_V_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_PERIPH = 1'h0;
parameter GPSSMAIN_SPARE_SCRATCHPAD = 8'h0;
parameter GPSSMAIN_SPARE_SPARE_CTRL = 24'h0;
parameter PMA_CMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_RDIFF = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_P = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_N = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_PULLUP = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_APAD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_BWSEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_VBGREF_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FBDIV_SEL = 2'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_DSMPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PHASESTEPAMOUNT = 8'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_STEP_PHASE = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_AUXDIVPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESETEN = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESET = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL_TXPLL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FOUTAUXDIV2_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_JA_FREF_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN01_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN23_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_UP_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_DN_SEL = 3'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_AUXDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_FBDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_FRAC = 24'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_REFDIV = 6'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFIN = 16'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFFB = 16'h0;
parameter PMA_CMN_TXPLL_JA_2_TXPLL_JA_SYNCCNTMAX = 32'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_CNTOFFSET = 16'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_TARGETCNT = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_OTDLY = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FMI = 8'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FKI = 5'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_DELAYK = 24'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_FDONLY = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_ONTARGETOV = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_PROGRAM = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_FRAC_PRESET = 24'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_PRESET_EN = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_HOLD = 1'h0;
parameter PMA_CMN_TXPLL_JA_9_TXPLL_JA_INT_PRESET = 12'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_EXT = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DOWNSPREAD = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DISABLE_SSCG = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SPREAD = 5'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DIVVAL = 6'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_EXT_MAXADDR = 8'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SEL_EXTWAVE = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_SEL = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_FILTER = 1'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL85 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL100 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL150 = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CAL_TERM = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CURRENT_PROG = 2'h0;
parameter PMA_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_DES_CDR_CTRL_1_DCFBEN_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR0 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR1 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR2 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR3 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_CMRTRIM_CDR = 3'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT3_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_SEL = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_EN = 1'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT3_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CMRTRIM_DFEEM = 3'h0;
parameter PMA_DES_DFEEM_CTRL_2_H1 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H2 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H3 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H4 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_3_H5 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_DCFBEN_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE0 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE1 = 5'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_TH_DFE = 8'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_GRAY_DFE = 3'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_SEL = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_EN = 1'h0;
parameter PMA_DES_EM_CTRL_1_DCFBEN_EM = 1'h0;
parameter PMA_DES_EM_CTRL_1_H0EM0 = 5'h0;
parameter PMA_DES_EM_CTRL_1_H0EM1 = 5'h0;
parameter PMA_DES_EM_CTRL_1_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_TH_EM = 8'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_GRAY_EM = 3'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_SEL = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_EN = 1'h0;
parameter PMA_DES_RTL_EM_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_RTL_EM_EYEMONITOR_SAMPLE_COUNT = 12'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE_FROMFAB = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTSEL = 3'h0;
parameter PMA_DES_TEST_BUS_RXDTESTEN = 1'h0;
parameter PMA_DES_TEST_BUS_RXDTESTSEL = 3'h0;
parameter PMA_DES_CLK_CTRL_RXBYPASSEN = 1'h0;
parameter PMA_DES_RSTPD_RXPD = 1'h0;
parameter PMA_DES_RSTPD_RESETDES = 1'h0;
parameter PMA_DES_RSTPD_PDDFE = 1'h0;
parameter PMA_DES_RSTPD_PDEM = 1'h0;
parameter PMA_DES_RSTPD_RCVEN = 1'h0;
parameter PMA_DES_RSTPD_RESET_FIFO = 1'h0;
parameter PMA_DES_RTL_ERR_CHK_READ_ERROR = 1'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_RANGE = 2'h0;
parameter PMA_SER_CTRL_CMSTEP_VALUE = 1'h0;
parameter PMA_SER_CTRL_CMSTEP = 1'h0;
parameter PMA_SER_CTRL_NLPBK_EN = 1'h0;
parameter PMA_SER_CTRL_HSLPBKEN = 1'h0;
parameter PMA_SER_CTRL_HSLPBK_SEL = 3'h0;
parameter PMA_SER_RSTPD_RESETSEREN = 1'h0;
parameter PMA_SER_RSTPD_RESETSER = 1'h0;
parameter PMA_SER_RSTPD_TXPD = 1'h0;
parameter PMA_SER_DRV_BYP_BYPASSSER = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_COUNT_THRESHOLD = 14'h0;
parameter PMA_SER_RXDET_CTRL_RX_DETECT_EN = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_START = 1'h0;
parameter PMA_SER_STATIC_LSB_STATIC_PATTERN_LSB = 20'h0;
parameter PMA_SER_STATIC_MSB_STATIC_PATTERN_MSB = 20'h0;
parameter PMA_SER_TEST_BUS_TXATESTSEL = 3'h0;
parameter PMA_SER_TEST_BUS_DTESTEN_RTL = 1'h0;
parameter PMA_SER_TEST_BUS_DTESTSEL_RTL = 4'h0;
parameter PMA_SER_TEST_BUS_JTAG_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_TEST_BUS_PRBSERR_TO_DTEST_SEL = 2'h0;
parameter PMA_SER_TEST_BUS_RXPKDETOUT_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_3P5DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_6P0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_HS_0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_3P5DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_6P0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_HS_0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_3P5DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_6P0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_HS_0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_3P5DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_6P0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_HS_0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_3P5DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_6P0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_HS_0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_1 = 6'h0;
parameter PMA_SERDES_RTL_CTRL_RESET_RTL = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_PRBSMODE = 3'h0;
parameter PMA_SERDES_RTL_CTRL_TX_DATA_SELECT = 3'h0;
parameter PMA_SERDES_RTL_CTRL_RX_DATA_SELECT = 2'h0;
parameter PMA_SERDES_RTL_CTRL_RX_FIFO_INPUT_SELECT_NEIGHBOR = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_EYEMONITOR_COMPARISON_DATA_SEL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_CEN = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_RESET = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_FE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_DFE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_OFFSET_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_WAIT_PERIOD_GOOD_LOCK = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_CTLE_OFFSET_CAL = 6'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_GOOD_LOCK = 8'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_BYPASS_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_EM_ONLY = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCEH = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_PHASE_DIRECTION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_CLKDIV = 4'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FREQUENCY = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCE_CDR_COEFFS = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_NUM_COEFFS = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_DFE_CYCLES = 5'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_AREA_CYCLES = 2'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SET_DFE_COEFFS_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_ERROR_THR_CHANNEL_ALIGN = 12'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL0_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL1_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL2_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL3_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL4_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL5_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL6_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL7_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_AREA_COMPUTE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CHANNEL_ALIGN_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FE_CALIBRATION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FULL_CAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_GOOD_LOCK_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_DFE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0CDR = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H1 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H2 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H3 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H4 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H5 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CDRCTLE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RCVEN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_SLIP_DES_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_LOCK_OVERRIDE = 1'h0;
parameter PCSCMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_V_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_0_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_1_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_2_SEL = 5'h0;
parameter PCSCMN_QRST_R0_QRST0_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST0_RST_SEL = 4'h0;
parameter PCSCMN_QRST_R0_QRST1_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST1_RST_SEL = 4'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_MODE = 3'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_X = 2'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_Y = 2'h0;
parameter PCS_SOFT_RESET_NV_MAP = 1'h0;
parameter PCS_SOFT_RESET_V_MAP = 1'h0;
parameter PCS_LFWF_R0_RXFWF_WMARK = 1'h0;
parameter PCS_LFWF_R0_TXFWF_WMARK = 1'h0;
parameter PCS_LPIP_R0_PIPE_SHAREDPLL = 1'h0;
parameter PCS_LPIP_R0_PIPE_INITIALIZATION_DONE = 1'h0;
parameter PCS_LPIP_R0_PIPE_OOB_IDLEBURST_TIMING = 2'h0;
parameter PCS_L64_R0_L64_CFG_BER_1US_TIMER_VAL = 11'h0;
parameter PCS_L64_R1_L64_BYPASS_TEST = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATTERN_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_TYPE_SEL = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PRBS31_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_DATA_SEL = 1'h0;
parameter PCS_L64_R2_L64_SEED_A_VALUE_LO32 = 32'h0;
parameter PCS_L64_R3_L64_SEED_A_VALUE_HI26 = 26'h0;
parameter PCS_L64_R4_L64_SEED_B_VALUE_LO32 = 32'h0;
parameter PCS_L64_R5_L64_SEED_B_VALUE_HI26 = 26'h0;
parameter PCS_L64_R6_L64_TX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R6_L64_TX_ADD_UI = 16'h0;
parameter PCS_L64_R7_L64_RX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R7_L64_RX_ADD_UI = 16'h0;
parameter PCS_L8_R0_L8_TXENCSWAPSEL = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_CDR_RESETS_PCS_RX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_RXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_PLL_RESETS_PCS_TX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_TXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PIPE_RESET = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_RX = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_TX = 1'h0;
parameter PCS_OOB_R0_OOB_BURST_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_BURST_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R2_TXOOB_PROG_DATA_L32B = 32'h0;
parameter PCS_OOB_R3_TXOOB_PROG_DATA_H8B = 8'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_FLOCK_SEL = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R1_RXBEACON_MAX_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R1_TXBEACON_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R2_PD_PLL_CNT = 8'h0;
parameter PCS_PMA_CTRL_R2_PIPE_RATE_INIT = 2'h0;
parameter PCS_PMA_CTRL_R2_FAB_DRIVES_TXPADS = 1'h0;
parameter PCS_MSTR_CTRL_LANE_MSTR = 2'h0;
parameter MAIN_SOFT_RESET_PERIPH = 1'h0;
parameter MAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter MAIN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_DES_CDR_CTRL_3_CST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_CST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RXDRV_CDR = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST2_DFEEM = 2'h0;
parameter PMA_DES_DFE_CTRL_2_RXDRV_DFE = 2'h0;
parameter PMA_DES_DFE_CTRL_2_CTLEEN_DFE = 1'h0;
parameter PMA_DES_EM_CTRL_2_RXDRV_EM = 2'h0;
parameter PMA_DES_EM_CTRL_2_CTLEEN_EM = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM = 4'h0;
parameter PMA_DES_IN_TERM_RXTEN = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM_SEL = 2'h0;
parameter PMA_DES_IN_TERM_ACCOUPLE_RXVCM_EN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETEN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETRANGE = 1'h0;
parameter PMA_DES_PKDET_RXPKDET_LOW_THRESHOLD = 3'h0;
parameter PMA_DES_PKDET_RXPKDET_HIGH_THRESHOLD = 3'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_MODE = 1'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE = 2'h0;
parameter PMA_DES_RTL_LOCK_CTRL_FDET_SAMPLE_PERIODS = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_RANGE = 2'h0;
parameter PMA_DES_RXPLL_DIV_CDR_GAIN = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTEN = 1'h0;
parameter PMA_DES_CLK_CTRL_RXREFCLK_SEL = 3'h0;
parameter PMA_DES_CLK_CTRL_DESMODE = 3'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKEN = 1'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKDIVEN = 1'h0;
parameter PMA_SER_CTRL_TXVBGREF_SEL = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIVEN = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIV = 2'h0;
parameter PMA_SER_CLK_CTRL_TXBITCLKSEL = 1'h0;
parameter PMA_SER_CLK_CTRL_SERMODE = 3'h0;
parameter PMA_SER_DRV_BYP_BYPASS_VALUE = 8'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT_RTL = 2'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_STEP_WAIT_COUNT = 5'h0;
parameter PMA_SER_TERM_CTRL_TXCM_LEVEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXTEN = 1'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM_SEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM = 4'h0;
parameter PMA_SER_TEST_BUS_TXATESTEN = 1'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDEL = 16'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDATA_INV = 8'h0;
parameter PMA_SER_DRV_CTRL_TXDRVTRIM = 24'h0;
parameter PMA_SER_DRV_CTRL_TXDRV = 3'h0;
parameter PMA_SER_DRV_CTRL_TXITRIM = 2'h0;
parameter PMA_SER_DRV_CTRL_TXODRV = 2'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDRV_CTRL_SEL = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXODRV_BOOSTER = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXMARGIN = 3'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXSWING = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS_BEACON = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_HALF_RATE10BIT = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_HALF_RATE10BIT = 1'h0;
parameter PCS_SOFT_RESET_PERIPH = 1'h0;
parameter PCS_LFWF_R0_RXFWF_RATIO = 2'h0;
parameter PCS_LFWF_R0_TXFWF_RATIO = 2'h0;
parameter PCS_LOVR_R0_FAB_IFC_MODE = 4'h0;
parameter PCS_LOVR_R0_PCSPMA_IFC_MODE = 4'h0;
parameter PCS_LPIP_R0_PIPEENABLE = 1'h0;
parameter PCS_LPIP_R0_PIPEMODE = 1'h0;
parameter PCS_LPIP_R0_PIPE_PCIE_HC = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_SCRAMBLER = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_DISPARITY = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_GEARBOX = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_64B67B = 1'h0;
parameter PCS_L64_R0_L64_CFG_BER_MON_EN = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_8B_MODE = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C49 = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C82 = 1'h0;
parameter PCS_L8_R0_L8_GEARMODE = 2'h0;
parameter PCS_LNTV_R0_LNTV_RX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_RX_IN_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_RX_MODE = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_OUT_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_TX_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_TMG_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_PCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_PCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_RCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_PIPE = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_LCL = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_OUT = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FAB_EPCS_PMA_RESET_B_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_APB_LINK(
       S_ADDR,
       S_CLK,
       S_EN,
       S_ARST_N,
       S_WDATA,
       S_RDATA,
       PCIE0_BRIDGE_CLK,
       PCIE0_BRIDGE_ADDR,
       PCIE0_BRIDGE_EN,
       PCIE0_BRIDGE_ARST_N,
       PCIE0_BRIDGE_WDATA,
       PCIE0_BRIDGE_RDATA,
       PCIE0_CTRL_CLK,
       PCIE0_CTRL_ADDR,
       PCIE0_CTRL_EN,
       PCIE0_CTRL_ARST_N,
       PCIE0_CTRL_WDATA,
       PCIE0_CTRL_RDATA,
       PCIE1_BRIDGE_CLK,
       PCIE1_BRIDGE_ADDR,
       PCIE1_BRIDGE_EN,
       PCIE1_BRIDGE_ARST_N,
       PCIE1_BRIDGE_WDATA,
       PCIE1_BRIDGE_RDATA,
       PCIE1_CTRL_CLK,
       PCIE1_CTRL_ADDR,
       PCIE1_CTRL_EN,
       PCIE1_CTRL_ARST_N,
       PCIE1_CTRL_WDATA,
       PCIE1_CTRL_RDATA,
       EXT_PLL_0_CLK,
       EXT_PLL_0_ADDR,
       EXT_PLL_0_EN,
       EXT_PLL_0_ARST_N,
       EXT_PLL_0_WDATA,
       EXT_PLL_0_RDATA,
       EXT_PLL_1_CLK,
       EXT_PLL_1_ADDR,
       EXT_PLL_1_EN,
       EXT_PLL_1_ARST_N,
       EXT_PLL_1_WDATA,
       EXT_PLL_1_RDATA,
       QUAD_PLL_CLK,
       QUAD_PLL_ADDR,
       QUAD_PLL_EN,
       QUAD_PLL_ARST_N,
       QUAD_PLL_WDATA,
       QUAD_PLL_RDATA,
       L0_CLK,
       L0_ADDR,
       L0_EN,
       L0_ARST_N,
       L0_WDATA,
       L0_RDATA,
       L1_CLK,
       L1_ADDR,
       L1_EN,
       L1_ARST_N,
       L1_WDATA,
       L1_RDATA,
       L2_CLK,
       L2_ADDR,
       L2_EN,
       L2_ARST_N,
       L2_WDATA,
       L2_RDATA,
       L3_CLK,
       L3_ADDR,
       L3_EN,
       L3_ARST_N,
       L3_WDATA,
       L3_RDATA
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " S_ADDR[0]->S_CLK = 2.078"
syn_tsu1 = " S_ADDR[1]->S_CLK = 2.005"
syn_tsu2 = " S_ADDR[2]->S_CLK = 1.903"
syn_tsu3 = " S_EN->S_CLK = 1.857"
syn_tsu4 = " S_WDATA[0]->S_CLK = 1.498"
syn_tsu5 = " S_WDATA[1]->S_CLK = 1.802"
syn_tsu6 = " S_WDATA[2]->S_CLK = 1.384"
syn_tsu7 = " S_WDATA[3]->S_CLK = 1.367"
syn_tco0 = " S_CLK->S_RDATA[0] = 5.549"
syn_tco1 = " S_CLK->S_RDATA[1] = 5.102"
syn_tco2 = " S_CLK->S_RDATA[2] = 4.833"
syn_tco3 = " S_CLK->S_RDATA[3] = 4.707"
*/
/* synthesis black_box_pad_pin ="" */
input  [2:0] S_ADDR;
input  S_CLK;
input  S_EN;
input  S_ARST_N;
input  [3:0] S_WDATA;
output [3:0] S_RDATA;
output PCIE0_BRIDGE_CLK;
output [2:0] PCIE0_BRIDGE_ADDR;
output PCIE0_BRIDGE_EN;
output PCIE0_BRIDGE_ARST_N;
output [3:0] PCIE0_BRIDGE_WDATA;
input  [3:0] PCIE0_BRIDGE_RDATA;
output PCIE0_CTRL_CLK;
output [2:0] PCIE0_CTRL_ADDR;
output PCIE0_CTRL_EN;
output PCIE0_CTRL_ARST_N;
output [3:0] PCIE0_CTRL_WDATA;
input  [3:0] PCIE0_CTRL_RDATA;
output PCIE1_BRIDGE_CLK;
output [2:0] PCIE1_BRIDGE_ADDR;
output PCIE1_BRIDGE_EN;
output PCIE1_BRIDGE_ARST_N;
output [3:0] PCIE1_BRIDGE_WDATA;
input  [3:0] PCIE1_BRIDGE_RDATA;
output PCIE1_CTRL_CLK;
output [2:0] PCIE1_CTRL_ADDR;
output PCIE1_CTRL_EN;
output PCIE1_CTRL_ARST_N;
output [3:0] PCIE1_CTRL_WDATA;
input  [3:0] PCIE1_CTRL_RDATA;
output EXT_PLL_0_CLK;
output [2:0] EXT_PLL_0_ADDR;
output EXT_PLL_0_EN;
output EXT_PLL_0_ARST_N;
output [3:0] EXT_PLL_0_WDATA;
input  [3:0] EXT_PLL_0_RDATA;
output EXT_PLL_1_CLK;
output [2:0] EXT_PLL_1_ADDR;
output EXT_PLL_1_EN;
output EXT_PLL_1_ARST_N;
output [3:0] EXT_PLL_1_WDATA;
input  [3:0] EXT_PLL_1_RDATA;
output QUAD_PLL_CLK;
output [2:0] QUAD_PLL_ADDR;
output QUAD_PLL_EN;
output QUAD_PLL_ARST_N;
output [3:0] QUAD_PLL_WDATA;
input  [3:0] QUAD_PLL_RDATA;
output L0_CLK;
output [2:0] L0_ADDR;
output L0_EN;
output L0_ARST_N;
output [3:0] L0_WDATA;
input  [3:0] L0_RDATA;
output L1_CLK;
output [2:0] L1_ADDR;
output L1_EN;
output L1_ARST_N;
output [3:0] L1_WDATA;
input  [3:0] L1_RDATA;
output L2_CLK;
output [2:0] L2_ADDR;
output L2_EN;
output L2_ARST_N;
output [3:0] L2_WDATA;
input  [3:0] L2_RDATA;
output L3_CLK;
output [2:0] L3_ADDR;
output L3_EN;
output L3_ARST_N;
output [3:0] L3_WDATA;
input  [3:0] L3_RDATA;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_APB_LINK_V(
       CTRL_CLK,
       CTRL_SRST_N,
       ARST_N,
       REQUEST,
       RQI,
       RQR,
       GRANT,
       LINK_CLK,
       LINK_ADDR,
       LINK_EN,
       LINK_ARST_N,
       LINK_WDATA,
       LINK_RDATA
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  CTRL_CLK;
input  CTRL_SRST_N;
input  ARST_N;
input  REQUEST;
input  [3:0] RQI;
output [1:0] RQR;
output GRANT;
output LINK_CLK;
output [2:0] LINK_ADDR;
output LINK_EN;
output LINK_ARST_N;
output [3:0] LINK_WDATA;
input  [3:0] LINK_RDATA;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_APB_LINK_V2(
       CTRL_CLK,
       CTRL_SRST_N,
       ARST_N,
       REQUEST,
       RQI,
       RQR,
       GRANT,
       LINK_CLK,
       LINK_ADDR,
       LINK_EN,
       LINK_ARST_N,
       LINK_WDATA,
       LINK_RDATA
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  CTRL_CLK;
input  CTRL_SRST_N;
input  ARST_N;
input  REQUEST;
input  [5:0] RQI;
output [1:0] RQR;
output GRANT;
output LINK_CLK;
output [2:0] LINK_ADDR;
output LINK_EN;
output LINK_ARST_N;
output [3:0] LINK_WDATA;
input  [3:0] LINK_RDATA;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_DUAL_PCS(
       RX_REF_CLK,
       TX_DATA,
       RX_FWF_EN,
       TX_FWF_EN,
       RX_SLIP,
       TX_STATUS_CTRL,
       PCS_ARST_N,
       PMA_ARST_N,
       RX_FWF_CLK,
       TX_FWF_CLK,
       TX_CLK_STABLE,
       RX_VAL,
       RX_READY,
       RX_IDLE,
       RX_STATUS_CTRL,
       RX_DATA,
       RX_CLK_R,
       TX_CLK_R,
       PCS_DEBUG,
       REF_CLK_N,
       REF_CLK_P,
       RX_N,
       RX_P,
       TX_N,
       TX_P,
       JA_CLK,
       TX_BIT_CLK_0,
       TX_BIT_CLK_1,
       TX_PLL_LOCK_0,
       TX_PLL_LOCK_1,
       TX_PLL_REF_CLK_0,
       TX_PLL_REF_CLK_1,
       TX_CLK_G,
       RX_CLK_G,
       PMA_DEBUG,
       ARST_N,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT,
       LINK_CLK,
       LINK_ADDR,
       LINK_EN,
       LINK_ARST_N,
       LINK_WDATA,
       LINK_RDATA
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " RX_FWF_EN->RX_FWF_CLK = 0.916"
syn_tsu1 = " TX_DATA[0]->TX_FWF_CLK = 1.212"
syn_tsu2 = " TX_DATA[10]->TX_FWF_CLK = 1.181"
syn_tsu3 = " TX_DATA[11]->TX_FWF_CLK = 1.196"
syn_tsu4 = " TX_DATA[12]->TX_FWF_CLK = 1.16"
syn_tsu5 = " TX_DATA[13]->TX_FWF_CLK = 1.17"
syn_tsu6 = " TX_DATA[14]->TX_FWF_CLK = 1.177"
syn_tsu7 = " TX_DATA[15]->TX_FWF_CLK = 1.251"
syn_tsu8 = " TX_DATA[16]->TX_FWF_CLK = 1.156"
syn_tsu9 = " TX_DATA[17]->TX_FWF_CLK = 1.255"
syn_tsu10 = " TX_DATA[18]->TX_FWF_CLK = 1.239"
syn_tsu11 = " TX_DATA[19]->TX_FWF_CLK = 1.214"
syn_tsu12 = " TX_DATA[1]->TX_FWF_CLK = 1.201"
syn_tsu13 = " TX_DATA[20]->TX_FWF_CLK = 1.201"
syn_tsu14 = " TX_DATA[21]->TX_FWF_CLK = 1.273"
syn_tsu15 = " TX_DATA[22]->TX_FWF_CLK = 1.231"
syn_tsu16 = " TX_DATA[23]->TX_FWF_CLK = 1.205"
syn_tsu17 = " TX_DATA[24]->TX_FWF_CLK = 1.227"
syn_tsu18 = " TX_DATA[25]->TX_FWF_CLK = 1.276"
syn_tsu19 = " TX_DATA[26]->TX_FWF_CLK = 1.24"
syn_tsu20 = " TX_DATA[27]->TX_FWF_CLK = 1.176"
syn_tsu21 = " TX_DATA[28]->TX_FWF_CLK = 1.259"
syn_tsu22 = " TX_DATA[29]->TX_FWF_CLK = 1.178"
syn_tsu23 = " TX_DATA[2]->TX_FWF_CLK = 1.174"
syn_tsu24 = " TX_DATA[30]->TX_FWF_CLK = 1.226"
syn_tsu25 = " TX_DATA[31]->TX_FWF_CLK = 1.207"
syn_tsu26 = " TX_DATA[32]->TX_FWF_CLK = 1.189"
syn_tsu27 = " TX_DATA[33]->TX_FWF_CLK = 1.158"
syn_tsu28 = " TX_DATA[34]->TX_FWF_CLK = 1.19"
syn_tsu29 = " TX_DATA[35]->TX_FWF_CLK = 1.251"
syn_tsu30 = " TX_DATA[36]->TX_FWF_CLK = 1.208"
syn_tsu31 = " TX_DATA[37]->TX_FWF_CLK = 1.189"
syn_tsu32 = " TX_DATA[38]->TX_FWF_CLK = 1.182"
syn_tsu33 = " TX_DATA[39]->TX_FWF_CLK = 1.27"
syn_tsu34 = " TX_DATA[3]->TX_FWF_CLK = 1.229"
syn_tsu35 = " TX_DATA[40]->TX_FWF_CLK = 1.228"
syn_tsu36 = " TX_DATA[41]->TX_FWF_CLK = 1.255"
syn_tsu37 = " TX_DATA[42]->TX_FWF_CLK = 1.274"
syn_tsu38 = " TX_DATA[43]->TX_FWF_CLK = 1.158"
syn_tsu39 = " TX_DATA[44]->TX_FWF_CLK = 1.154"
syn_tsu40 = " TX_DATA[45]->TX_FWF_CLK = 1.262"
syn_tsu41 = " TX_DATA[46]->TX_FWF_CLK = 1.22"
syn_tsu42 = " TX_DATA[47]->TX_FWF_CLK = 1.253"
syn_tsu43 = " TX_DATA[48]->TX_FWF_CLK = 1.175"
syn_tsu44 = " TX_DATA[49]->TX_FWF_CLK = 1.236"
syn_tsu45 = " TX_DATA[4]->TX_FWF_CLK = 1.188"
syn_tsu46 = " TX_DATA[50]->TX_FWF_CLK = 1.178"
syn_tsu47 = " TX_DATA[51]->TX_FWF_CLK = 1.146"
syn_tsu48 = " TX_DATA[52]->TX_FWF_CLK = 1.213"
syn_tsu49 = " TX_DATA[53]->TX_FWF_CLK = 1.165"
syn_tsu50 = " TX_DATA[54]->TX_FWF_CLK = 1.226"
syn_tsu51 = " TX_DATA[55]->TX_FWF_CLK = 1.162"
syn_tsu52 = " TX_DATA[56]->TX_FWF_CLK = 1.214"
syn_tsu53 = " TX_DATA[57]->TX_FWF_CLK = 1.191"
syn_tsu54 = " TX_DATA[58]->TX_FWF_CLK = 1.268"
syn_tsu55 = " TX_DATA[59]->TX_FWF_CLK = 1.24"
syn_tsu56 = " TX_DATA[5]->TX_FWF_CLK = 1.189"
syn_tsu57 = " TX_DATA[60]->TX_FWF_CLK = 1.174"
syn_tsu58 = " TX_DATA[61]->TX_FWF_CLK = 1.224"
syn_tsu59 = " TX_DATA[62]->TX_FWF_CLK = 1.154"
syn_tsu60 = " TX_DATA[63]->TX_FWF_CLK = 1.156"
syn_tsu61 = " TX_DATA[6]->TX_FWF_CLK = 1.199"
syn_tsu62 = " TX_DATA[7]->TX_FWF_CLK = 1.17"
syn_tsu63 = " TX_DATA[8]->TX_FWF_CLK = 1.25"
syn_tsu64 = " TX_DATA[9]->TX_FWF_CLK = 1.177"
syn_tsu65 = " TX_FWF_EN->TX_FWF_CLK = 1.043"
syn_tsu66 = " TX_STATUS_CTRL[0]->TX_FWF_CLK = 1.18"
syn_tsu67 = " TX_STATUS_CTRL[10]->TX_FWF_CLK = 1.17"
syn_tsu68 = " TX_STATUS_CTRL[11]->TX_FWF_CLK = 1.178"
syn_tsu69 = " TX_STATUS_CTRL[12]->TX_FWF_CLK = 1.258"
syn_tsu70 = " TX_STATUS_CTRL[13]->TX_FWF_CLK = 1.241"
syn_tsu71 = " TX_STATUS_CTRL[14]->TX_FWF_CLK = 1.176"
syn_tsu72 = " TX_STATUS_CTRL[15]->TX_FWF_CLK = 1.195"
syn_tsu73 = " TX_STATUS_CTRL[16]->TX_FWF_CLK = 1.175"
syn_tsu74 = " TX_STATUS_CTRL[17]->TX_FWF_CLK = 1.175"
syn_tsu75 = " TX_STATUS_CTRL[18]->TX_FWF_CLK = 1.158"
syn_tsu76 = " TX_STATUS_CTRL[19]->TX_FWF_CLK = 1.255"
syn_tsu77 = " TX_STATUS_CTRL[1]->TX_FWF_CLK = 1.233"
syn_tsu78 = " TX_STATUS_CTRL[20]->TX_FWF_CLK = 1.232"
syn_tsu79 = " TX_STATUS_CTRL[21]->TX_FWF_CLK = 1.154"
syn_tsu80 = " TX_STATUS_CTRL[22]->TX_FWF_CLK = 1.247"
syn_tsu81 = " TX_STATUS_CTRL[23]->TX_FWF_CLK = 1.17"
syn_tsu82 = " TX_STATUS_CTRL[2]->TX_FWF_CLK = 1.182"
syn_tsu83 = " TX_STATUS_CTRL[3]->TX_FWF_CLK = 1.197"
syn_tsu84 = " TX_STATUS_CTRL[4]->TX_FWF_CLK = 1.188"
syn_tsu85 = " TX_STATUS_CTRL[5]->TX_FWF_CLK = 1.211"
syn_tsu86 = " TX_STATUS_CTRL[6]->TX_FWF_CLK = 1.239"
syn_tsu87 = " TX_STATUS_CTRL[7]->TX_FWF_CLK = 1.173"
syn_tsu88 = " TX_STATUS_CTRL[8]->TX_FWF_CLK = 1.211"
syn_tsu89 = " TX_STATUS_CTRL[9]->TX_FWF_CLK = 1.203"
syn_tco0 = " RX_FWF_CLK->RX_DATA[0] = 2.954"
syn_tco1 = " RX_FWF_CLK->RX_DATA[10] = 2.830"
syn_tco2 = " RX_FWF_CLK->RX_DATA[11] = 2.832"
syn_tco3 = " RX_FWF_CLK->RX_DATA[12] = 2.867"
syn_tco4 = " RX_FWF_CLK->RX_DATA[13] = 2.858"
syn_tco5 = " RX_FWF_CLK->RX_DATA[14] = 2.835"
syn_tco6 = " RX_FWF_CLK->RX_DATA[15] = 2.826"
syn_tco7 = " RX_FWF_CLK->RX_DATA[16] = 2.858"
syn_tco8 = " RX_FWF_CLK->RX_DATA[17] = 2.841"
syn_tco9 = " RX_FWF_CLK->RX_DATA[18] = 2.856"
syn_tco10 = " RX_FWF_CLK->RX_DATA[19] = 2.862"
syn_tco11 = " RX_FWF_CLK->RX_DATA[1] = 2.937"
syn_tco12 = " RX_FWF_CLK->RX_DATA[20] = 2.845"
syn_tco13 = " RX_FWF_CLK->RX_DATA[21] = 2.879"
syn_tco14 = " RX_FWF_CLK->RX_DATA[22] = 2.877"
syn_tco15 = " RX_FWF_CLK->RX_DATA[23] = 2.852"
syn_tco16 = " RX_FWF_CLK->RX_DATA[24] = 2.830"
syn_tco17 = " RX_FWF_CLK->RX_DATA[25] = 2.865"
syn_tco18 = " RX_FWF_CLK->RX_DATA[26] = 2.857"
syn_tco19 = " RX_FWF_CLK->RX_DATA[27] = 2.875"
syn_tco20 = " RX_FWF_CLK->RX_DATA[28] = 2.852"
syn_tco21 = " RX_FWF_CLK->RX_DATA[29] = 2.875"
syn_tco22 = " RX_FWF_CLK->RX_DATA[2] = 2.928"
syn_tco23 = " RX_FWF_CLK->RX_DATA[30] = 2.844"
syn_tco24 = " RX_FWF_CLK->RX_DATA[31] = 2.860"
syn_tco25 = " RX_FWF_CLK->RX_DATA[32] = 2.866"
syn_tco26 = " RX_FWF_CLK->RX_DATA[33] = 2.886"
syn_tco27 = " RX_FWF_CLK->RX_DATA[34] = 2.877"
syn_tco28 = " RX_FWF_CLK->RX_DATA[35] = 2.879"
syn_tco29 = " RX_FWF_CLK->RX_DATA[36] = 2.883"
syn_tco30 = " RX_FWF_CLK->RX_DATA[37] = 2.854"
syn_tco31 = " RX_FWF_CLK->RX_DATA[38] = 2.855"
syn_tco32 = " RX_FWF_CLK->RX_DATA[39] = 2.883"
syn_tco33 = " RX_FWF_CLK->RX_DATA[3] = 2.964"
syn_tco34 = " RX_FWF_CLK->RX_DATA[40] = 2.875"
syn_tco35 = " RX_FWF_CLK->RX_DATA[41] = 2.848"
syn_tco36 = " RX_FWF_CLK->RX_DATA[42] = 2.862"
syn_tco37 = " RX_FWF_CLK->RX_DATA[43] = 2.827"
syn_tco38 = " RX_FWF_CLK->RX_DATA[44] = 2.845"
syn_tco39 = " RX_FWF_CLK->RX_DATA[45] = 2.850"
syn_tco40 = " RX_FWF_CLK->RX_DATA[46] = 2.886"
syn_tco41 = " RX_FWF_CLK->RX_DATA[47] = 2.873"
syn_tco42 = " RX_FWF_CLK->RX_DATA[48] = 2.859"
syn_tco43 = " RX_FWF_CLK->RX_DATA[49] = 2.856"
syn_tco44 = " RX_FWF_CLK->RX_DATA[4] = 2.851"
syn_tco45 = " RX_FWF_CLK->RX_DATA[50] = 2.840"
syn_tco46 = " RX_FWF_CLK->RX_DATA[51] = 2.839"
syn_tco47 = " RX_FWF_CLK->RX_DATA[52] = 2.865"
syn_tco48 = " RX_FWF_CLK->RX_DATA[53] = 2.854"
syn_tco49 = " RX_FWF_CLK->RX_DATA[54] = 2.831"
syn_tco50 = " RX_FWF_CLK->RX_DATA[55] = 2.862"
syn_tco51 = " RX_FWF_CLK->RX_DATA[56] = 2.845"
syn_tco52 = " RX_FWF_CLK->RX_DATA[57] = 2.815"
syn_tco53 = " RX_FWF_CLK->RX_DATA[58] = 2.795"
syn_tco54 = " RX_FWF_CLK->RX_DATA[59] = 2.827"
syn_tco55 = " RX_FWF_CLK->RX_DATA[5] = 2.846"
syn_tco56 = " RX_FWF_CLK->RX_DATA[60] = 2.777"
syn_tco57 = " RX_FWF_CLK->RX_DATA[61] = 2.802"
syn_tco58 = " RX_FWF_CLK->RX_DATA[62] = 2.767"
syn_tco59 = " RX_FWF_CLK->RX_DATA[63] = 2.809"
syn_tco60 = " RX_FWF_CLK->RX_DATA[6] = 2.818"
syn_tco61 = " RX_FWF_CLK->RX_DATA[7] = 2.868"
syn_tco62 = " RX_FWF_CLK->RX_DATA[8] = 2.841"
syn_tco63 = " RX_FWF_CLK->RX_DATA[9] = 2.840"
syn_tco64 = " RX_FWF_CLK->RX_STATUS_CTRL[0] = 2.890"
syn_tco65 = " RX_FWF_CLK->RX_STATUS_CTRL[10] = 2.897"
syn_tco66 = " RX_FWF_CLK->RX_STATUS_CTRL[11] = 2.886"
syn_tco67 = " RX_FWF_CLK->RX_STATUS_CTRL[12] = 2.896"
syn_tco68 = " RX_FWF_CLK->RX_STATUS_CTRL[13] = 2.892"
syn_tco69 = " RX_FWF_CLK->RX_STATUS_CTRL[14] = 2.871"
syn_tco70 = " RX_FWF_CLK->RX_STATUS_CTRL[15] = 2.862"
syn_tco71 = " RX_FWF_CLK->RX_STATUS_CTRL[16] = 2.898"
syn_tco72 = " RX_FWF_CLK->RX_STATUS_CTRL[17] = 2.904"
syn_tco73 = " RX_FWF_CLK->RX_STATUS_CTRL[18] = 2.890"
syn_tco74 = " RX_FWF_CLK->RX_STATUS_CTRL[19] = 2.903"
syn_tco75 = " RX_FWF_CLK->RX_STATUS_CTRL[1] = 2.900"
syn_tco76 = " RX_FWF_CLK->RX_STATUS_CTRL[20] = 2.873"
syn_tco77 = " RX_FWF_CLK->RX_STATUS_CTRL[21] = 2.884"
syn_tco78 = " RX_FWF_CLK->RX_STATUS_CTRL[22] = 2.880"
syn_tco79 = " RX_FWF_CLK->RX_STATUS_CTRL[23] = 2.911"
syn_tco80 = " RX_FWF_CLK->RX_STATUS_CTRL[2] = 2.861"
syn_tco81 = " RX_FWF_CLK->RX_STATUS_CTRL[3] = 2.899"
syn_tco82 = " RX_FWF_CLK->RX_STATUS_CTRL[4] = 2.903"
syn_tco83 = " RX_FWF_CLK->RX_STATUS_CTRL[5] = 2.885"
syn_tco84 = " RX_FWF_CLK->RX_STATUS_CTRL[6] = 2.910"
syn_tco85 = " RX_FWF_CLK->RX_STATUS_CTRL[7] = 2.909"
syn_tco86 = " RX_FWF_CLK->RX_STATUS_CTRL[8] = 2.938"
syn_tco87 = " RX_FWF_CLK->RX_STATUS_CTRL[9] = 2.877"
syn_tco88 = " RX_FWF_CLK->RX_VAL = 2.295"
syn_tpd89 = " TX_DATA[0]->PCS_DEBUG[14] = 6.324"
syn_tpd90 = " TX_DATA[0]->PCS_DEBUG[4] = 6.481"
syn_tpd91 = " TX_DATA[12]->PCS_DEBUG[12] = 5.969"
syn_tpd92 = " TX_DATA[12]->PCS_DEBUG[17] = 6.360"
syn_tpd93 = " TX_DATA[12]->PCS_DEBUG[2] = 6.261"
syn_tpd94 = " TX_DATA[12]->PCS_DEBUG[7] = 5.739"
syn_tpd95 = " TX_DATA[13]->PCS_DEBUG[13] = 5.676"
syn_tpd96 = " TX_DATA[13]->PCS_DEBUG[18] = 6.510"
syn_tpd97 = " TX_DATA[13]->PCS_DEBUG[3] = 6.658"
syn_tpd98 = " TX_DATA[13]->PCS_DEBUG[8] = 6.140"
*/
/* synthesis black_box_pad_pin ="RX_N,RX_P,TX_N,TX_P" */
input  RX_REF_CLK;
input  [63:0] TX_DATA;
input  RX_FWF_EN;
input  TX_FWF_EN;
input  RX_SLIP;
input  [23:0] TX_STATUS_CTRL;
input  PCS_ARST_N;
input  PMA_ARST_N;
input  RX_FWF_CLK;
input  TX_FWF_CLK;
output TX_CLK_STABLE;
output RX_VAL;
output RX_READY;
output RX_IDLE;
output [23:0] RX_STATUS_CTRL;
output [63:0] RX_DATA;
output RX_CLK_R;
output TX_CLK_R;
output [19:0] PCS_DEBUG;
input  REF_CLK_N;
input  REF_CLK_P;
input  RX_N;
input  RX_P;
output TX_N;
output TX_P;
output JA_CLK;
input  TX_BIT_CLK_0;
input  TX_BIT_CLK_1;
input  TX_PLL_LOCK_0;
input  TX_PLL_LOCK_1;
input  TX_PLL_REF_CLK_0;
input  TX_PLL_REF_CLK_1;
output TX_CLK_G;
output RX_CLK_G;
output PMA_DEBUG;
output [1:0] ARST_N;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
input  LINK_CLK;
input  [2:0] LINK_ADDR;
input  LINK_EN;
input  LINK_ARST_N;
input  [3:0] LINK_WDATA;
output [3:0] LINK_RDATA;
parameter MAIN_QMUX_R0_QRST0_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST1_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST2_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST3_SRC = 3'h0;
parameter MSC_UNIQUE = "";
parameter JA_REF_CLK_SEL = "";
parameter DATA_RATE = 0.0;
parameter REG_FILE = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter GPSSMAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_V_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_PERIPH = 1'h0;
parameter GPSSMAIN_SPARE_SCRATCHPAD = 8'h0;
parameter GPSSMAIN_SPARE_SPARE_CTRL = 24'h0;
parameter PMA_CMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_RDIFF = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_P = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_N = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_PULLUP = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_APAD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_BWSEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_VBGREF_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FBDIV_SEL = 2'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_DSMPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PHASESTEPAMOUNT = 8'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_STEP_PHASE = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_AUXDIVPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESETEN = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESET = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL_TXPLL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FOUTAUXDIV2_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_JA_FREF_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN01_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN23_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_UP_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_DN_SEL = 3'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_AUXDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_FBDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_FRAC = 24'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_REFDIV = 6'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFIN = 16'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFFB = 16'h0;
parameter PMA_CMN_TXPLL_JA_2_TXPLL_JA_SYNCCNTMAX = 32'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_CNTOFFSET = 16'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_TARGETCNT = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_OTDLY = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FMI = 8'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FKI = 5'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_DELAYK = 24'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_FDONLY = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_ONTARGETOV = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_PROGRAM = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_FRAC_PRESET = 24'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_PRESET_EN = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_HOLD = 1'h0;
parameter PMA_CMN_TXPLL_JA_9_TXPLL_JA_INT_PRESET = 12'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_EXT = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DOWNSPREAD = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DISABLE_SSCG = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SPREAD = 5'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DIVVAL = 6'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_EXT_MAXADDR = 8'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SEL_EXTWAVE = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_SEL = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_FILTER = 1'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL85 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL100 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL150 = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CAL_TERM = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CURRENT_PROG = 2'h0;
parameter PMA_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_DES_CDR_CTRL_1_DCFBEN_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR0 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR1 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR2 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR3 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_CMRTRIM_CDR = 3'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT3_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_SEL = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_EN = 1'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT3_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CMRTRIM_DFEEM = 3'h0;
parameter PMA_DES_DFEEM_CTRL_2_H1 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H2 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H3 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H4 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_3_H5 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_DCFBEN_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE0 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE1 = 5'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_TH_DFE = 8'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_GRAY_DFE = 3'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_SEL = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_EN = 1'h0;
parameter PMA_DES_EM_CTRL_1_DCFBEN_EM = 1'h0;
parameter PMA_DES_EM_CTRL_1_H0EM0 = 5'h0;
parameter PMA_DES_EM_CTRL_1_H0EM1 = 5'h0;
parameter PMA_DES_EM_CTRL_1_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_TH_EM = 8'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_GRAY_EM = 3'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_SEL = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_EN = 1'h0;
parameter PMA_DES_RTL_EM_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_RTL_EM_EYEMONITOR_SAMPLE_COUNT = 12'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE_FROMFAB = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTSEL = 3'h0;
parameter PMA_DES_TEST_BUS_RXDTESTEN = 1'h0;
parameter PMA_DES_TEST_BUS_RXDTESTSEL = 3'h0;
parameter PMA_DES_CLK_CTRL_RXBYPASSEN = 1'h0;
parameter PMA_DES_RSTPD_RXPD = 1'h0;
parameter PMA_DES_RSTPD_RESETDES = 1'h0;
parameter PMA_DES_RSTPD_PDDFE = 1'h0;
parameter PMA_DES_RSTPD_PDEM = 1'h0;
parameter PMA_DES_RSTPD_RCVEN = 1'h0;
parameter PMA_DES_RSTPD_RESET_FIFO = 1'h0;
parameter PMA_DES_RTL_ERR_CHK_READ_ERROR = 1'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_RANGE = 2'h0;
parameter PMA_SER_CTRL_CMSTEP_VALUE = 1'h0;
parameter PMA_SER_CTRL_CMSTEP = 1'h0;
parameter PMA_SER_CTRL_NLPBK_EN = 1'h0;
parameter PMA_SER_CTRL_HSLPBKEN = 1'h0;
parameter PMA_SER_CTRL_HSLPBK_SEL = 3'h0;
parameter PMA_SER_RSTPD_RESETSEREN = 1'h0;
parameter PMA_SER_RSTPD_RESETSER = 1'h0;
parameter PMA_SER_RSTPD_TXPD = 1'h0;
parameter PMA_SER_DRV_BYP_BYPASSSER = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_COUNT_THRESHOLD = 14'h0;
parameter PMA_SER_RXDET_CTRL_RX_DETECT_EN = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_START = 1'h0;
parameter PMA_SER_STATIC_LSB_STATIC_PATTERN_LSB = 20'h0;
parameter PMA_SER_STATIC_MSB_STATIC_PATTERN_MSB = 20'h0;
parameter PMA_SER_TEST_BUS_TXATESTSEL = 3'h0;
parameter PMA_SER_TEST_BUS_DTESTEN_RTL = 1'h0;
parameter PMA_SER_TEST_BUS_DTESTSEL_RTL = 4'h0;
parameter PMA_SER_TEST_BUS_JTAG_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_TEST_BUS_PRBSERR_TO_DTEST_SEL = 2'h0;
parameter PMA_SER_TEST_BUS_RXPKDETOUT_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_3P5DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_6P0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_HS_0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_3P5DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_6P0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_HS_0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_3P5DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_6P0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_HS_0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_3P5DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_6P0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_HS_0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_3P5DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_6P0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_HS_0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_1 = 6'h0;
parameter PMA_SERDES_RTL_CTRL_RESET_RTL = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_PRBSMODE = 3'h0;
parameter PMA_SERDES_RTL_CTRL_TX_DATA_SELECT = 3'h0;
parameter PMA_SERDES_RTL_CTRL_RX_DATA_SELECT = 2'h0;
parameter PMA_SERDES_RTL_CTRL_RX_FIFO_INPUT_SELECT_NEIGHBOR = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_EYEMONITOR_COMPARISON_DATA_SEL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_CEN = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_RESET = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_FE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_DFE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_OFFSET_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_WAIT_PERIOD_GOOD_LOCK = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_CTLE_OFFSET_CAL = 6'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_GOOD_LOCK = 8'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_BYPASS_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_EM_ONLY = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCEH = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_PHASE_DIRECTION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_CLKDIV = 4'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FREQUENCY = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCE_CDR_COEFFS = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_NUM_COEFFS = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_DFE_CYCLES = 5'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_AREA_CYCLES = 2'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SET_DFE_COEFFS_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_ERROR_THR_CHANNEL_ALIGN = 12'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL0_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL1_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL2_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL3_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL4_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL5_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL6_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL7_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_AREA_COMPUTE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CHANNEL_ALIGN_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FE_CALIBRATION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FULL_CAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_GOOD_LOCK_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_DFE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0CDR = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H1 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H2 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H3 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H4 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H5 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CDRCTLE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RCVEN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_SLIP_DES_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_LOCK_OVERRIDE = 1'h0;
parameter PCSCMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_V_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_0_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_1_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_2_SEL = 5'h0;
parameter PCSCMN_QRST_R0_QRST0_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST0_RST_SEL = 4'h0;
parameter PCSCMN_QRST_R0_QRST1_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST1_RST_SEL = 4'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_MODE = 3'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_X = 2'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_Y = 2'h0;
parameter PCS_SOFT_RESET_NV_MAP = 1'h0;
parameter PCS_SOFT_RESET_V_MAP = 1'h0;
parameter PCS_LFWF_R0_RXFWF_WMARK = 1'h0;
parameter PCS_LFWF_R0_TXFWF_WMARK = 1'h0;
parameter PCS_LPIP_R0_PIPE_SHAREDPLL = 1'h0;
parameter PCS_LPIP_R0_PIPE_INITIALIZATION_DONE = 1'h0;
parameter PCS_LPIP_R0_PIPE_OOB_IDLEBURST_TIMING = 2'h0;
parameter PCS_L64_R0_L64_CFG_BER_1US_TIMER_VAL = 11'h0;
parameter PCS_L64_R1_L64_BYPASS_TEST = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATTERN_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_TYPE_SEL = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PRBS31_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_DATA_SEL = 1'h0;
parameter PCS_L64_R2_L64_SEED_A_VALUE_LO32 = 32'h0;
parameter PCS_L64_R3_L64_SEED_A_VALUE_HI26 = 26'h0;
parameter PCS_L64_R4_L64_SEED_B_VALUE_LO32 = 32'h0;
parameter PCS_L64_R5_L64_SEED_B_VALUE_HI26 = 26'h0;
parameter PCS_L64_R6_L64_TX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R6_L64_TX_ADD_UI = 16'h0;
parameter PCS_L64_R7_L64_RX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R7_L64_RX_ADD_UI = 16'h0;
parameter PCS_L8_R0_L8_TXENCSWAPSEL = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_CDR_RESETS_PCS_RX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_RXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_PLL_RESETS_PCS_TX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_TXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PIPE_RESET = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_RX = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_TX = 1'h0;
parameter PCS_OOB_R0_OOB_BURST_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_BURST_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R2_TXOOB_PROG_DATA_L32B = 32'h0;
parameter PCS_OOB_R3_TXOOB_PROG_DATA_H8B = 8'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_FLOCK_SEL = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R1_RXBEACON_MAX_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R1_TXBEACON_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R2_PD_PLL_CNT = 8'h0;
parameter PCS_PMA_CTRL_R2_PIPE_RATE_INIT = 2'h0;
parameter PCS_PMA_CTRL_R2_FAB_DRIVES_TXPADS = 1'h0;
parameter PCS_MSTR_CTRL_LANE_MSTR = 2'h0;
parameter MAIN_SOFT_RESET_PERIPH = 1'h0;
parameter MAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter MAIN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_DES_CDR_CTRL_3_CST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_CST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RXDRV_CDR = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST2_DFEEM = 2'h0;
parameter PMA_DES_DFE_CTRL_2_RXDRV_DFE = 2'h0;
parameter PMA_DES_DFE_CTRL_2_CTLEEN_DFE = 1'h0;
parameter PMA_DES_EM_CTRL_2_RXDRV_EM = 2'h0;
parameter PMA_DES_EM_CTRL_2_CTLEEN_EM = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM = 4'h0;
parameter PMA_DES_IN_TERM_RXTEN = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM_SEL = 2'h0;
parameter PMA_DES_IN_TERM_ACCOUPLE_RXVCM_EN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETEN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETRANGE = 1'h0;
parameter PMA_DES_PKDET_RXPKDET_LOW_THRESHOLD = 3'h0;
parameter PMA_DES_PKDET_RXPKDET_HIGH_THRESHOLD = 3'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_MODE = 1'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE = 2'h0;
parameter PMA_DES_RTL_LOCK_CTRL_FDET_SAMPLE_PERIODS = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_RANGE = 2'h0;
parameter PMA_DES_RXPLL_DIV_CDR_GAIN = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTEN = 1'h0;
parameter PMA_DES_CLK_CTRL_RXREFCLK_SEL = 3'h0;
parameter PMA_DES_CLK_CTRL_DESMODE = 3'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKEN = 1'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKDIVEN = 1'h0;
parameter PMA_SER_CTRL_TXVBGREF_SEL = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIVEN = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIV = 2'h0;
parameter PMA_SER_CLK_CTRL_TXBITCLKSEL = 1'h0;
parameter PMA_SER_CLK_CTRL_SERMODE = 3'h0;
parameter PMA_SER_DRV_BYP_BYPASS_VALUE = 8'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT_RTL = 2'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_STEP_WAIT_COUNT = 5'h0;
parameter PMA_SER_TERM_CTRL_TXCM_LEVEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXTEN = 1'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM_SEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM = 4'h0;
parameter PMA_SER_TEST_BUS_TXATESTEN = 1'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDEL = 16'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDATA_INV = 8'h0;
parameter PMA_SER_DRV_CTRL_TXDRVTRIM = 24'h0;
parameter PMA_SER_DRV_CTRL_TXDRV = 3'h0;
parameter PMA_SER_DRV_CTRL_TXITRIM = 2'h0;
parameter PMA_SER_DRV_CTRL_TXODRV = 2'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDRV_CTRL_SEL = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXODRV_BOOSTER = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXMARGIN = 3'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXSWING = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS_BEACON = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_HALF_RATE10BIT = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_HALF_RATE10BIT = 1'h0;
parameter PCS_SOFT_RESET_PERIPH = 1'h0;
parameter PCS_LFWF_R0_RXFWF_RATIO = 2'h0;
parameter PCS_LFWF_R0_TXFWF_RATIO = 2'h0;
parameter PCS_LOVR_R0_FAB_IFC_MODE = 4'h0;
parameter PCS_LOVR_R0_PCSPMA_IFC_MODE = 4'h0;
parameter PCS_LPIP_R0_PIPEENABLE = 1'h0;
parameter PCS_LPIP_R0_PIPEMODE = 1'h0;
parameter PCS_LPIP_R0_PIPE_PCIE_HC = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_SCRAMBLER = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_DISPARITY = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_GEARBOX = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_64B67B = 1'h0;
parameter PCS_L64_R0_L64_CFG_BER_MON_EN = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_8B_MODE = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C49 = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C82 = 1'h0;
parameter PCS_L8_R0_L8_GEARMODE = 2'h0;
parameter PCS_LNTV_R0_LNTV_RX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_RX_IN_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_RX_MODE = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_OUT_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_TX_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_TMG_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_PCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_PCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_RCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_PIPE = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_LCL = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_OUT = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FAB_EPCS_PMA_RESET_B_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_PIPE_AXI0(
       RX_REF_CLK,
       M_RDATA,
       S_AWADDR_31,
       S_AWADDR_30,
       S_AWADDR_28,
       S_AWADDR_0,
       S_AWADDR_1,
       S_AWADDR_2,
       S_AWADDR_3,
       S_AWADDR_4,
       S_AWADDR_5,
       S_AWADDR_6,
       S_AWADDR_7,
       S_AWADDR_8,
       S_AWADDR_9,
       S_AWADDR_10,
       S_AWADDR_11,
       S_AWADDR_12,
       S_AWADDR_13,
       S_AWADDR_14,
       S_AWADDR_15,
       S_AWADDR_16,
       S_AWADDR_17,
       S_AWADDR_18,
       S_AWADDR_19,
       S_AWADDR_20,
       S_AWADDR_21,
       S_AWADDR_22,
       S_AWADDR_23,
       M_AWADDR_31,
       M_AWADDR_30,
       M_AWADDR_29,
       M_AWADDR_28,
       M_AWADDR_0,
       M_AWADDR_1,
       M_AWADDR_2,
       M_AWADDR_3,
       M_AWADDR_4,
       M_AWADDR_5,
       M_AWADDR_6,
       M_AWADDR_7,
       M_AWADDR_8,
       M_AWADDR_9,
       M_AWADDR_10,
       M_AWADDR_11,
       M_AWADDR_12,
       M_AWADDR_13,
       M_AWADDR_14,
       M_AWADDR_15,
       M_AWADDR_16,
       M_AWADDR_17,
       M_AWADDR_18,
       M_AWADDR_19,
       M_AWADDR_20,
       M_AWADDR_21,
       M_AWADDR_22,
       M_AWADDR_23,
       M_WDATA,
       M_AWADDR_HW_0,
       M_AWADDR_HW_1,
       M_AWADDR_HW_2,
       M_AWADDR_HW_3,
       M_AWADDR_HW_4,
       M_AWADDR_HW_5,
       M_AWADDR_HW_6,
       M_AWADDR_HW_7,
       M_AWADDR_HW_8,
       M_AWADDR_HW_9,
       M_AWADDR_HW_10,
       M_AWADDR_HW_11,
       M_AWADDR_HW_12,
       M_AWADDR_HW_13,
       M_AWADDR_HW_14,
       M_AWADDR_HW_15,
       M_AWADDR_HW_16,
       M_AWADDR_HW_17,
       M_AWADDR_HW_18,
       M_AWADDR_HW_19,
       M_AWADDR_HW_20,
       M_AWADDR_HW_21,
       M_AWADDR_HW_22,
       M_AWADDR_HW_23,
       M_AWADDR_HW_28,
       M_AWADDR_HW_29,
       M_AWADDR_HW_30,
       M_AWADDR_HW_31,
       M_RDATA_HW,
       M_WDATA_HW,
       S_AWADDR_HW_0,
       S_AWADDR_HW_1,
       S_AWADDR_HW_2,
       S_AWADDR_HW_3,
       S_AWADDR_HW_4,
       S_AWADDR_HW_5,
       S_AWADDR_HW_6,
       S_AWADDR_HW_7,
       S_AWADDR_HW_8,
       S_AWADDR_HW_9,
       S_AWADDR_HW_10,
       S_AWADDR_HW_11,
       S_AWADDR_HW_12,
       S_AWADDR_HW_13,
       S_AWADDR_HW_14,
       S_AWADDR_HW_15,
       S_AWADDR_HW_16,
       S_AWADDR_HW_17,
       S_AWADDR_HW_18,
       S_AWADDR_HW_19,
       S_AWADDR_HW_20,
       S_AWADDR_HW_21,
       S_AWADDR_HW_22,
       S_AWADDR_HW_23,
       S_AWADDR_HW_28,
       S_AWADDR_HW_30,
       S_AWADDR_HW_31,
       PCS_DEBUG,
       REF_CLK_N,
       REF_CLK_P,
       RX_N,
       RX_P,
       TX_N,
       TX_P,
       JA_CLK,
       TX_BIT_CLK_0,
       TX_BIT_CLK_1,
       TX_PLL_LOCK_0,
       TX_PLL_LOCK_1,
       TX_PLL_REF_CLK_0,
       TX_PLL_REF_CLK_1,
       TX_CLK_G,
       RX_CLK_G,
       PMA_DEBUG,
       ARST_N,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT,
       PHYSTATUS_0,
       POWERDOWN,
       RATE,
       RESET_N,
       RXDATA_0,
       RXDATAK_0,
       RXELECIDLE_0,
       RXPOLARITY_0,
       RXSTANDBYSTATUS_0,
       RXSTATUS_0,
       RXVALID_0,
       TXCOMPLIANCE_0,
       TXDATA_0,
       TXDATAK_0,
       TXDATAVALID_0,
       TXDEEMPH,
       TXDETECTRX_LOOPBACK_0,
       TXELECIDLE_0,
       TXMARGIN,
       TXSWING,
       PIPE_CLK_0,
       PCLK_OUT_0,
       AXI_CLK,
       LINK_CLK,
       LINK_ADDR,
       LINK_EN,
       LINK_ARST_N,
       LINK_WDATA,
       LINK_RDATA
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " M_RDATA[0]->AXI_CLK = 1.977"
syn_tsu1 = " M_RDATA[10]->AXI_CLK = 1.767"
syn_tsu2 = " M_RDATA[11]->AXI_CLK = 2.089"
syn_tsu3 = " M_RDATA[12]->AXI_CLK = 2.105"
syn_tsu4 = " M_RDATA[13]->AXI_CLK = 2.119"
syn_tsu5 = " M_RDATA[14]->AXI_CLK = 1.939"
syn_tsu6 = " M_RDATA[15]->AXI_CLK = 1.851"
syn_tsu7 = " M_RDATA[16]->AXI_CLK = 2.002"
syn_tsu8 = " M_RDATA[17]->AXI_CLK = 1.832"
syn_tsu9 = " M_RDATA[18]->AXI_CLK = 2.066"
syn_tsu10 = " M_RDATA[19]->AXI_CLK = 2.117"
syn_tsu11 = " M_RDATA[1]->AXI_CLK = 2.025"
syn_tsu12 = " M_RDATA[20]->AXI_CLK = 2.147"
syn_tsu13 = " M_RDATA[21]->AXI_CLK = 2.024"
syn_tsu14 = " M_RDATA[22]->AXI_CLK = 2.104"
syn_tsu15 = " M_RDATA[23]->AXI_CLK = 1.994"
syn_tsu16 = " M_RDATA[24]->AXI_CLK = 2.057"
syn_tsu17 = " M_RDATA[25]->AXI_CLK = 1.986"
syn_tsu18 = " M_RDATA[26]->AXI_CLK = 2.114"
syn_tsu19 = " M_RDATA[27]->AXI_CLK = 2.037"
syn_tsu20 = " M_RDATA[28]->AXI_CLK = 2.094"
syn_tsu21 = " M_RDATA[29]->AXI_CLK = 2.087"
syn_tsu22 = " M_RDATA[2]->AXI_CLK = 1.945"
syn_tsu23 = " M_RDATA[30]->AXI_CLK = 1.943"
syn_tsu24 = " M_RDATA[31]->AXI_CLK = 2.007"
syn_tsu25 = " M_RDATA[32]->AXI_CLK = 2.039"
syn_tsu26 = " M_RDATA[33]->AXI_CLK = 2.097"
syn_tsu27 = " M_RDATA[34]->AXI_CLK = 2.138"
syn_tsu28 = " M_RDATA[35]->AXI_CLK = 2.116"
syn_tsu29 = " M_RDATA[36]->AXI_CLK = 2.148"
syn_tsu30 = " M_RDATA[37]->AXI_CLK = 2.038"
syn_tsu31 = " M_RDATA[38]->AXI_CLK = 1.951"
syn_tsu32 = " M_RDATA[39]->AXI_CLK = 1.943"
syn_tsu33 = " M_RDATA[3]->AXI_CLK = 2.088"
syn_tsu34 = " M_RDATA[40]->AXI_CLK = 2.022"
syn_tsu35 = " M_RDATA[41]->AXI_CLK = 2.02"
syn_tsu36 = " M_RDATA[42]->AXI_CLK = 2.062"
syn_tsu37 = " M_RDATA[43]->AXI_CLK = 2.084"
syn_tsu38 = " M_RDATA[44]->AXI_CLK = 1.993"
syn_tsu39 = " M_RDATA[45]->AXI_CLK = 2.117"
syn_tsu40 = " M_RDATA[46]->AXI_CLK = 2.02"
syn_tsu41 = " M_RDATA[47]->AXI_CLK = 2.121"
syn_tsu42 = " M_RDATA[48]->AXI_CLK = 1.986"
syn_tsu43 = " M_RDATA[49]->AXI_CLK = 2.037"
syn_tsu44 = " M_RDATA[4]->AXI_CLK = 1.945"
syn_tsu45 = " M_RDATA[50]->AXI_CLK = 2.043"
syn_tsu46 = " M_RDATA[51]->AXI_CLK = 2.115"
syn_tsu47 = " M_RDATA[52]->AXI_CLK = 2"
syn_tsu48 = " M_RDATA[53]->AXI_CLK = 2.048"
syn_tsu49 = " M_RDATA[54]->AXI_CLK = 2.061"
syn_tsu50 = " M_RDATA[55]->AXI_CLK = 2.022"
syn_tsu51 = " M_RDATA[56]->AXI_CLK = 2.063"
syn_tsu52 = " M_RDATA[57]->AXI_CLK = 2.131"
syn_tsu53 = " M_RDATA[58]->AXI_CLK = 1.973"
syn_tsu54 = " M_RDATA[59]->AXI_CLK = 2.141"
syn_tsu55 = " M_RDATA[5]->AXI_CLK = 1.795"
syn_tsu56 = " M_RDATA[60]->AXI_CLK = 2.118"
syn_tsu57 = " M_RDATA[61]->AXI_CLK = 2.099"
syn_tsu58 = " M_RDATA[62]->AXI_CLK = 1.995"
syn_tsu59 = " M_RDATA[63]->AXI_CLK = 1.923"
syn_tsu60 = " M_RDATA[6]->AXI_CLK = 2"
syn_tsu61 = " M_RDATA[7]->AXI_CLK = 1.962"
syn_tsu62 = " M_RDATA[8]->AXI_CLK = 2.143"
syn_tsu63 = " M_RDATA[9]->AXI_CLK = 1.912"
syn_tsu64 = " S_AWADDR_0->AXI_CLK = 2.075"
syn_tsu65 = " S_AWADDR_1->AXI_CLK = 2.086"
syn_tsu66 = " S_AWADDR_10->AXI_CLK = 2.095"
syn_tsu67 = " S_AWADDR_11->AXI_CLK = 2.051"
syn_tsu68 = " S_AWADDR_12->AXI_CLK = 1.963"
syn_tsu69 = " S_AWADDR_13->AXI_CLK = 2.168"
syn_tsu70 = " S_AWADDR_14->AXI_CLK = 2.109"
syn_tsu71 = " S_AWADDR_15->AXI_CLK = 2.08"
syn_tsu72 = " S_AWADDR_16->AXI_CLK = 2.064"
syn_tsu73 = " S_AWADDR_17->AXI_CLK = 2.126"
syn_tsu74 = " S_AWADDR_18->AXI_CLK = 2.01"
syn_tsu75 = " S_AWADDR_19->AXI_CLK = 2.011"
syn_tsu76 = " S_AWADDR_2->AXI_CLK = 2.155"
syn_tsu77 = " S_AWADDR_20->AXI_CLK = 2.108"
syn_tsu78 = " S_AWADDR_21->AXI_CLK = 1.979"
syn_tsu79 = " S_AWADDR_22->AXI_CLK = 2.097"
syn_tsu80 = " S_AWADDR_23->AXI_CLK = 2.052"
syn_tsu81 = " S_AWADDR_28->AXI_CLK = 2.004"
syn_tsu82 = " S_AWADDR_3->AXI_CLK = 2.013"
syn_tsu83 = " S_AWADDR_30->AXI_CLK = 2.009"
syn_tsu84 = " S_AWADDR_31->AXI_CLK = 2.132"
syn_tsu85 = " S_AWADDR_4->AXI_CLK = 2.04"
syn_tsu86 = " S_AWADDR_5->AXI_CLK = 2.148"
syn_tsu87 = " S_AWADDR_6->AXI_CLK = 2.08"
syn_tsu88 = " S_AWADDR_7->AXI_CLK = 2.08"
syn_tsu89 = " S_AWADDR_8->AXI_CLK = 2.104"
syn_tsu90 = " S_AWADDR_9->AXI_CLK = 2.104"
syn_tco0 = " AXI_CLK->M_AWADDR_0 = 2.535"
syn_tco1 = " AXI_CLK->M_AWADDR_1 = 2.550"
syn_tco2 = " AXI_CLK->M_AWADDR_10 = 2.543"
syn_tco3 = " AXI_CLK->M_AWADDR_11 = 2.623"
syn_tco4 = " AXI_CLK->M_AWADDR_12 = 2.643"
syn_tco5 = " AXI_CLK->M_AWADDR_13 = 2.613"
syn_tco6 = " AXI_CLK->M_AWADDR_14 = 2.638"
syn_tco7 = " AXI_CLK->M_AWADDR_15 = 2.726"
syn_tco8 = " AXI_CLK->M_AWADDR_16 = 2.525"
syn_tco9 = " AXI_CLK->M_AWADDR_17 = 2.442"
syn_tco10 = " AXI_CLK->M_AWADDR_18 = 2.704"
syn_tco11 = " AXI_CLK->M_AWADDR_19 = 2.466"
syn_tco12 = " AXI_CLK->M_AWADDR_2 = 2.669"
syn_tco13 = " AXI_CLK->M_AWADDR_20 = 2.600"
syn_tco14 = " AXI_CLK->M_AWADDR_21 = 2.663"
syn_tco15 = " AXI_CLK->M_AWADDR_22 = 2.678"
syn_tco16 = " AXI_CLK->M_AWADDR_23 = 2.485"
syn_tco17 = " AXI_CLK->M_AWADDR_28 = 2.213"
syn_tco18 = " AXI_CLK->M_AWADDR_29 = 2.219"
syn_tco19 = " AXI_CLK->M_AWADDR_3 = 2.631"
syn_tco20 = " AXI_CLK->M_AWADDR_30 = 2.185"
syn_tco21 = " AXI_CLK->M_AWADDR_31 = 2.167"
syn_tco22 = " AXI_CLK->M_AWADDR_4 = 2.674"
syn_tco23 = " AXI_CLK->M_AWADDR_5 = 2.676"
syn_tco24 = " AXI_CLK->M_AWADDR_6 = 2.734"
syn_tco25 = " AXI_CLK->M_AWADDR_7 = 2.623"
syn_tco26 = " AXI_CLK->M_AWADDR_8 = 2.740"
syn_tco27 = " AXI_CLK->M_AWADDR_9 = 2.607"
syn_tco28 = " AXI_CLK->M_WDATA[0] = 2.776"
syn_tco29 = " AXI_CLK->M_WDATA[10] = 2.730"
syn_tco30 = " AXI_CLK->M_WDATA[11] = 2.768"
syn_tco31 = " AXI_CLK->M_WDATA[12] = 2.749"
syn_tco32 = " AXI_CLK->M_WDATA[13] = 2.732"
syn_tco33 = " AXI_CLK->M_WDATA[14] = 2.736"
syn_tco34 = " AXI_CLK->M_WDATA[15] = 2.532"
syn_tco35 = " AXI_CLK->M_WDATA[16] = 2.742"
syn_tco36 = " AXI_CLK->M_WDATA[17] = 2.739"
syn_tco37 = " AXI_CLK->M_WDATA[18] = 2.723"
syn_tco38 = " AXI_CLK->M_WDATA[19] = 2.759"
syn_tco39 = " AXI_CLK->M_WDATA[1] = 2.654"
syn_tco40 = " AXI_CLK->M_WDATA[20] = 2.683"
syn_tco41 = " AXI_CLK->M_WDATA[21] = 2.789"
syn_tco42 = " AXI_CLK->M_WDATA[22] = 2.424"
syn_tco43 = " AXI_CLK->M_WDATA[23] = 2.712"
syn_tco44 = " AXI_CLK->M_WDATA[24] = 2.670"
syn_tco45 = " AXI_CLK->M_WDATA[25] = 2.726"
syn_tco46 = " AXI_CLK->M_WDATA[26] = 2.709"
syn_tco47 = " AXI_CLK->M_WDATA[27] = 2.485"
syn_tco48 = " AXI_CLK->M_WDATA[28] = 2.760"
syn_tco49 = " AXI_CLK->M_WDATA[29] = 2.670"
syn_tco50 = " AXI_CLK->M_WDATA[2] = 2.708"
syn_tco51 = " AXI_CLK->M_WDATA[30] = 2.682"
syn_tco52 = " AXI_CLK->M_WDATA[31] = 2.772"
syn_tco53 = " AXI_CLK->M_WDATA[32] = 2.698"
syn_tco54 = " AXI_CLK->M_WDATA[33] = 2.708"
syn_tco55 = " AXI_CLK->M_WDATA[34] = 2.766"
syn_tco56 = " AXI_CLK->M_WDATA[35] = 2.744"
syn_tco57 = " AXI_CLK->M_WDATA[36] = 2.795"
syn_tco58 = " AXI_CLK->M_WDATA[37] = 2.757"
syn_tco59 = " AXI_CLK->M_WDATA[38] = 2.735"
syn_tco60 = " AXI_CLK->M_WDATA[39] = 2.675"
syn_tco61 = " AXI_CLK->M_WDATA[3] = 2.763"
syn_tco62 = " AXI_CLK->M_WDATA[40] = 2.733"
syn_tco63 = " AXI_CLK->M_WDATA[41] = 2.751"
syn_tco64 = " AXI_CLK->M_WDATA[42] = 2.635"
syn_tco65 = " AXI_CLK->M_WDATA[43] = 2.690"
syn_tco66 = " AXI_CLK->M_WDATA[44] = 2.677"
syn_tco67 = " AXI_CLK->M_WDATA[45] = 2.719"
syn_tco68 = " AXI_CLK->M_WDATA[46] = 2.753"
syn_tco69 = " AXI_CLK->M_WDATA[47] = 2.743"
syn_tco70 = " AXI_CLK->M_WDATA[48] = 2.689"
syn_tco71 = " AXI_CLK->M_WDATA[49] = 2.767"
syn_tco72 = " AXI_CLK->M_WDATA[4] = 2.767"
syn_tco73 = " AXI_CLK->M_WDATA[50] = 2.718"
syn_tco74 = " AXI_CLK->M_WDATA[51] = 2.698"
syn_tco75 = " AXI_CLK->M_WDATA[52] = 2.739"
syn_tco76 = " AXI_CLK->M_WDATA[53] = 2.737"
syn_tco77 = " AXI_CLK->M_WDATA[54] = 2.775"
syn_tco78 = " AXI_CLK->M_WDATA[55] = 2.781"
syn_tco79 = " AXI_CLK->M_WDATA[56] = 2.765"
syn_tco80 = " AXI_CLK->M_WDATA[57] = 2.761"
syn_tco81 = " AXI_CLK->M_WDATA[58] = 2.756"
syn_tco82 = " AXI_CLK->M_WDATA[59] = 2.605"
syn_tco83 = " AXI_CLK->M_WDATA[5] = 2.658"
syn_tco84 = " AXI_CLK->M_WDATA[60] = 2.712"
syn_tco85 = " AXI_CLK->M_WDATA[61] = 2.750"
syn_tco86 = " AXI_CLK->M_WDATA[62] = 2.697"
syn_tco87 = " AXI_CLK->M_WDATA[63] = 2.770"
syn_tco88 = " AXI_CLK->M_WDATA[6] = 2.475"
syn_tco89 = " AXI_CLK->M_WDATA[7] = 2.718"
syn_tco90 = " AXI_CLK->M_WDATA[8] = 2.765"
syn_tco91 = " AXI_CLK->M_WDATA[9] = 2.715"
syn_tpd92 = " M_RDATA[0]->PCS_DEBUG[14] = 6.324"
syn_tpd93 = " M_RDATA[0]->PCS_DEBUG[4] = 6.481"
syn_tpd94 = " M_RDATA[12]->PCS_DEBUG[12] = 5.969"
syn_tpd95 = " M_RDATA[12]->PCS_DEBUG[17] = 6.360"
syn_tpd96 = " M_RDATA[12]->PCS_DEBUG[2] = 6.261"
syn_tpd97 = " M_RDATA[12]->PCS_DEBUG[7] = 5.739"
syn_tpd98 = " M_RDATA[13]->PCS_DEBUG[13] = 5.676"
syn_tpd99 = " M_RDATA[13]->PCS_DEBUG[18] = 6.510"
syn_tpd100 = " M_RDATA[13]->PCS_DEBUG[3] = 6.658"
syn_tpd101 = " M_RDATA[13]->PCS_DEBUG[8] = 6.140"
*/
/* synthesis black_box_pad_pin ="RX_N,RX_P,TX_N,TX_P" */
input  RX_REF_CLK;
input  [63:0] M_RDATA;
input  S_AWADDR_31;
input  S_AWADDR_30;
input  S_AWADDR_28;
input  S_AWADDR_0;
input  S_AWADDR_1;
input  S_AWADDR_2;
input  S_AWADDR_3;
input  S_AWADDR_4;
input  S_AWADDR_5;
input  S_AWADDR_6;
input  S_AWADDR_7;
input  S_AWADDR_8;
input  S_AWADDR_9;
input  S_AWADDR_10;
input  S_AWADDR_11;
input  S_AWADDR_12;
input  S_AWADDR_13;
input  S_AWADDR_14;
input  S_AWADDR_15;
input  S_AWADDR_16;
input  S_AWADDR_17;
input  S_AWADDR_18;
input  S_AWADDR_19;
input  S_AWADDR_20;
input  S_AWADDR_21;
input  S_AWADDR_22;
input  S_AWADDR_23;
output M_AWADDR_31;
output M_AWADDR_30;
output M_AWADDR_29;
output M_AWADDR_28;
output M_AWADDR_0;
output M_AWADDR_1;
output M_AWADDR_2;
output M_AWADDR_3;
output M_AWADDR_4;
output M_AWADDR_5;
output M_AWADDR_6;
output M_AWADDR_7;
output M_AWADDR_8;
output M_AWADDR_9;
output M_AWADDR_10;
output M_AWADDR_11;
output M_AWADDR_12;
output M_AWADDR_13;
output M_AWADDR_14;
output M_AWADDR_15;
output M_AWADDR_16;
output M_AWADDR_17;
output M_AWADDR_18;
output M_AWADDR_19;
output M_AWADDR_20;
output M_AWADDR_21;
output M_AWADDR_22;
output M_AWADDR_23;
output [63:0] M_WDATA;
input  M_AWADDR_HW_0;
input  M_AWADDR_HW_1;
input  M_AWADDR_HW_2;
input  M_AWADDR_HW_3;
input  M_AWADDR_HW_4;
input  M_AWADDR_HW_5;
input  M_AWADDR_HW_6;
input  M_AWADDR_HW_7;
input  M_AWADDR_HW_8;
input  M_AWADDR_HW_9;
input  M_AWADDR_HW_10;
input  M_AWADDR_HW_11;
input  M_AWADDR_HW_12;
input  M_AWADDR_HW_13;
input  M_AWADDR_HW_14;
input  M_AWADDR_HW_15;
input  M_AWADDR_HW_16;
input  M_AWADDR_HW_17;
input  M_AWADDR_HW_18;
input  M_AWADDR_HW_19;
input  M_AWADDR_HW_20;
input  M_AWADDR_HW_21;
input  M_AWADDR_HW_22;
input  M_AWADDR_HW_23;
input  M_AWADDR_HW_28;
input  M_AWADDR_HW_29;
input  M_AWADDR_HW_30;
input  M_AWADDR_HW_31;
output [63:0] M_RDATA_HW;
input  [63:0] M_WDATA_HW;
output S_AWADDR_HW_0;
output S_AWADDR_HW_1;
output S_AWADDR_HW_2;
output S_AWADDR_HW_3;
output S_AWADDR_HW_4;
output S_AWADDR_HW_5;
output S_AWADDR_HW_6;
output S_AWADDR_HW_7;
output S_AWADDR_HW_8;
output S_AWADDR_HW_9;
output S_AWADDR_HW_10;
output S_AWADDR_HW_11;
output S_AWADDR_HW_12;
output S_AWADDR_HW_13;
output S_AWADDR_HW_14;
output S_AWADDR_HW_15;
output S_AWADDR_HW_16;
output S_AWADDR_HW_17;
output S_AWADDR_HW_18;
output S_AWADDR_HW_19;
output S_AWADDR_HW_20;
output S_AWADDR_HW_21;
output S_AWADDR_HW_22;
output S_AWADDR_HW_23;
output S_AWADDR_HW_28;
output S_AWADDR_HW_30;
output S_AWADDR_HW_31;
output [19:0] PCS_DEBUG;
input  REF_CLK_N;
input  REF_CLK_P;
input  RX_N;
input  RX_P;
output TX_N;
output TX_P;
output JA_CLK;
input  TX_BIT_CLK_0;
input  TX_BIT_CLK_1;
input  TX_PLL_LOCK_0;
input  TX_PLL_LOCK_1;
input  TX_PLL_REF_CLK_0;
input  TX_PLL_REF_CLK_1;
output TX_CLK_G;
output RX_CLK_G;
output PMA_DEBUG;
output [1:0] ARST_N;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
output PHYSTATUS_0;
input  [1:0] POWERDOWN;
input  [1:0] RATE;
input  RESET_N;
output [31:0] RXDATA_0;
output [3:0] RXDATAK_0;
output RXELECIDLE_0;
input  RXPOLARITY_0;
input  RXSTANDBYSTATUS_0;
output [2:0] RXSTATUS_0;
output RXVALID_0;
input  TXCOMPLIANCE_0;
input  [31:0] TXDATA_0;
input  [3:0] TXDATAK_0;
input  TXDATAVALID_0;
input  TXDEEMPH;
input  TXDETECTRX_LOOPBACK_0;
input  TXELECIDLE_0;
input  [2:0] TXMARGIN;
input  TXSWING;
input  PIPE_CLK_0;
output PCLK_OUT_0;
input  AXI_CLK;
input  LINK_CLK;
input  [2:0] LINK_ADDR;
input  LINK_EN;
input  LINK_ARST_N;
input  [3:0] LINK_WDATA;
output [3:0] LINK_RDATA;
parameter MAIN_QMUX_R0_QRST0_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST1_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST2_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST3_SRC = 3'h0;
parameter MSC_UNIQUE = "";
parameter JA_REF_CLK_SEL = "";
parameter DATA_RATE = 0.0;
parameter REG_FILE = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter GPSSMAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_V_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_PERIPH = 1'h0;
parameter GPSSMAIN_SPARE_SCRATCHPAD = 8'h0;
parameter GPSSMAIN_SPARE_SPARE_CTRL = 24'h0;
parameter PMA_CMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_RDIFF = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_P = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_N = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_PULLUP = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_APAD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_BWSEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_VBGREF_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FBDIV_SEL = 2'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_DSMPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PHASESTEPAMOUNT = 8'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_STEP_PHASE = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_AUXDIVPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESETEN = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESET = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL_TXPLL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FOUTAUXDIV2_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_JA_FREF_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN01_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN23_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_UP_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_DN_SEL = 3'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_AUXDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_FBDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_FRAC = 24'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_REFDIV = 6'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFIN = 16'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFFB = 16'h0;
parameter PMA_CMN_TXPLL_JA_2_TXPLL_JA_SYNCCNTMAX = 32'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_CNTOFFSET = 16'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_TARGETCNT = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_OTDLY = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FMI = 8'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FKI = 5'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_DELAYK = 24'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_FDONLY = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_ONTARGETOV = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_PROGRAM = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_FRAC_PRESET = 24'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_PRESET_EN = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_HOLD = 1'h0;
parameter PMA_CMN_TXPLL_JA_9_TXPLL_JA_INT_PRESET = 12'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_EXT = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DOWNSPREAD = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DISABLE_SSCG = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SPREAD = 5'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DIVVAL = 6'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_EXT_MAXADDR = 8'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SEL_EXTWAVE = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_SEL = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_FILTER = 1'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL85 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL100 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL150 = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CAL_TERM = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CURRENT_PROG = 2'h0;
parameter PMA_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_DES_CDR_CTRL_1_DCFBEN_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR0 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR1 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR2 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR3 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_CMRTRIM_CDR = 3'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT3_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_SEL = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_EN = 1'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT3_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CMRTRIM_DFEEM = 3'h0;
parameter PMA_DES_DFEEM_CTRL_2_H1 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H2 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H3 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H4 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_3_H5 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_DCFBEN_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE0 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE1 = 5'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_TH_DFE = 8'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_GRAY_DFE = 3'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_SEL = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_EN = 1'h0;
parameter PMA_DES_EM_CTRL_1_DCFBEN_EM = 1'h0;
parameter PMA_DES_EM_CTRL_1_H0EM0 = 5'h0;
parameter PMA_DES_EM_CTRL_1_H0EM1 = 5'h0;
parameter PMA_DES_EM_CTRL_1_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_TH_EM = 8'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_GRAY_EM = 3'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_SEL = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_EN = 1'h0;
parameter PMA_DES_RTL_EM_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_RTL_EM_EYEMONITOR_SAMPLE_COUNT = 12'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE_FROMFAB = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTSEL = 3'h0;
parameter PMA_DES_TEST_BUS_RXDTESTEN = 1'h0;
parameter PMA_DES_TEST_BUS_RXDTESTSEL = 3'h0;
parameter PMA_DES_CLK_CTRL_RXBYPASSEN = 1'h0;
parameter PMA_DES_RSTPD_RXPD = 1'h0;
parameter PMA_DES_RSTPD_RESETDES = 1'h0;
parameter PMA_DES_RSTPD_PDDFE = 1'h0;
parameter PMA_DES_RSTPD_PDEM = 1'h0;
parameter PMA_DES_RSTPD_RCVEN = 1'h0;
parameter PMA_DES_RSTPD_RESET_FIFO = 1'h0;
parameter PMA_DES_RTL_ERR_CHK_READ_ERROR = 1'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_RANGE = 2'h0;
parameter PMA_SER_CTRL_CMSTEP_VALUE = 1'h0;
parameter PMA_SER_CTRL_CMSTEP = 1'h0;
parameter PMA_SER_CTRL_NLPBK_EN = 1'h0;
parameter PMA_SER_CTRL_HSLPBKEN = 1'h0;
parameter PMA_SER_CTRL_HSLPBK_SEL = 3'h0;
parameter PMA_SER_RSTPD_RESETSEREN = 1'h0;
parameter PMA_SER_RSTPD_RESETSER = 1'h0;
parameter PMA_SER_RSTPD_TXPD = 1'h0;
parameter PMA_SER_DRV_BYP_BYPASSSER = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_COUNT_THRESHOLD = 14'h0;
parameter PMA_SER_RXDET_CTRL_RX_DETECT_EN = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_START = 1'h0;
parameter PMA_SER_STATIC_LSB_STATIC_PATTERN_LSB = 20'h0;
parameter PMA_SER_STATIC_MSB_STATIC_PATTERN_MSB = 20'h0;
parameter PMA_SER_TEST_BUS_TXATESTSEL = 3'h0;
parameter PMA_SER_TEST_BUS_DTESTEN_RTL = 1'h0;
parameter PMA_SER_TEST_BUS_DTESTSEL_RTL = 4'h0;
parameter PMA_SER_TEST_BUS_JTAG_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_TEST_BUS_PRBSERR_TO_DTEST_SEL = 2'h0;
parameter PMA_SER_TEST_BUS_RXPKDETOUT_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_3P5DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_6P0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_HS_0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_3P5DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_6P0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_HS_0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_3P5DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_6P0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_HS_0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_3P5DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_6P0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_HS_0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_3P5DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_6P0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_HS_0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_1 = 6'h0;
parameter PMA_SERDES_RTL_CTRL_RESET_RTL = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_PRBSMODE = 3'h0;
parameter PMA_SERDES_RTL_CTRL_TX_DATA_SELECT = 3'h0;
parameter PMA_SERDES_RTL_CTRL_RX_DATA_SELECT = 2'h0;
parameter PMA_SERDES_RTL_CTRL_RX_FIFO_INPUT_SELECT_NEIGHBOR = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_EYEMONITOR_COMPARISON_DATA_SEL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_CEN = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_RESET = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_FE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_DFE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_OFFSET_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_WAIT_PERIOD_GOOD_LOCK = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_CTLE_OFFSET_CAL = 6'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_GOOD_LOCK = 8'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_BYPASS_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_EM_ONLY = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCEH = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_PHASE_DIRECTION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_CLKDIV = 4'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FREQUENCY = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCE_CDR_COEFFS = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_NUM_COEFFS = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_DFE_CYCLES = 5'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_AREA_CYCLES = 2'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SET_DFE_COEFFS_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_ERROR_THR_CHANNEL_ALIGN = 12'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL0_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL1_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL2_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL3_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL4_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL5_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL6_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL7_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_AREA_COMPUTE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CHANNEL_ALIGN_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FE_CALIBRATION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FULL_CAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_GOOD_LOCK_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_DFE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0CDR = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H1 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H2 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H3 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H4 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H5 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CDRCTLE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RCVEN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_SLIP_DES_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_LOCK_OVERRIDE = 1'h0;
parameter PCSCMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_V_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_0_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_1_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_2_SEL = 5'h0;
parameter PCSCMN_QRST_R0_QRST0_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST0_RST_SEL = 4'h0;
parameter PCSCMN_QRST_R0_QRST1_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST1_RST_SEL = 4'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_MODE = 3'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_X = 2'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_Y = 2'h0;
parameter PCS_SOFT_RESET_NV_MAP = 1'h0;
parameter PCS_SOFT_RESET_V_MAP = 1'h0;
parameter PCS_LFWF_R0_RXFWF_WMARK = 1'h0;
parameter PCS_LFWF_R0_TXFWF_WMARK = 1'h0;
parameter PCS_LPIP_R0_PIPE_SHAREDPLL = 1'h0;
parameter PCS_LPIP_R0_PIPE_INITIALIZATION_DONE = 1'h0;
parameter PCS_LPIP_R0_PIPE_OOB_IDLEBURST_TIMING = 2'h0;
parameter PCS_L64_R0_L64_CFG_BER_1US_TIMER_VAL = 11'h0;
parameter PCS_L64_R1_L64_BYPASS_TEST = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATTERN_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_TYPE_SEL = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PRBS31_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_DATA_SEL = 1'h0;
parameter PCS_L64_R2_L64_SEED_A_VALUE_LO32 = 32'h0;
parameter PCS_L64_R3_L64_SEED_A_VALUE_HI26 = 26'h0;
parameter PCS_L64_R4_L64_SEED_B_VALUE_LO32 = 32'h0;
parameter PCS_L64_R5_L64_SEED_B_VALUE_HI26 = 26'h0;
parameter PCS_L64_R6_L64_TX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R6_L64_TX_ADD_UI = 16'h0;
parameter PCS_L64_R7_L64_RX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R7_L64_RX_ADD_UI = 16'h0;
parameter PCS_L8_R0_L8_TXENCSWAPSEL = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_CDR_RESETS_PCS_RX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_RXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_PLL_RESETS_PCS_TX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_TXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PIPE_RESET = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_RX = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_TX = 1'h0;
parameter PCS_OOB_R0_OOB_BURST_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_BURST_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R2_TXOOB_PROG_DATA_L32B = 32'h0;
parameter PCS_OOB_R3_TXOOB_PROG_DATA_H8B = 8'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_FLOCK_SEL = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R1_RXBEACON_MAX_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R1_TXBEACON_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R2_PD_PLL_CNT = 8'h0;
parameter PCS_PMA_CTRL_R2_PIPE_RATE_INIT = 2'h0;
parameter PCS_PMA_CTRL_R2_FAB_DRIVES_TXPADS = 1'h0;
parameter PCS_MSTR_CTRL_LANE_MSTR = 2'h0;
parameter MAIN_SOFT_RESET_PERIPH = 1'h0;
parameter MAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter MAIN_SOFT_RESET_V_MAP = 1'h0;
parameter MAIN_MAJOR_PCIE_USAGE_MODE = 4'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN0_SEL = 2'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN1_SEL = 2'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN2_SEL = 1'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN3_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN0_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN1_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN2_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN3_SEL = 1'h0;
parameter MAIN_QMUX_R0_PCIE_DBG_SEL = 3'h0;
parameter MAIN_DLL_CTRL0_PHASE_P = 2'h0;
parameter MAIN_DLL_CTRL0_PHASE_S = 2'h0;
parameter MAIN_DLL_CTRL0_SEL_P = 2'h0;
parameter MAIN_DLL_CTRL0_SEL_S = 2'h0;
parameter MAIN_DLL_CTRL0_REF_SEL = 1'h0;
parameter MAIN_DLL_CTRL0_FB_SEL = 1'h0;
parameter MAIN_DLL_CTRL0_DIV_SEL = 1'h0;
parameter MAIN_DLL_CTRL0_ALU_UPD = 2'h0;
parameter MAIN_DLL_CTRL0_LOCK_FRC = 1'h0;
parameter MAIN_DLL_CTRL0_LOCK_FLT = 2'h0;
parameter MAIN_DLL_CTRL0_LOCK_HIGH = 4'h0;
parameter MAIN_DLL_CTRL0_LOCK_LOW = 4'h0;
parameter MAIN_DLL_CTRL1_SET_ALU = 8'h0;
parameter MAIN_DLL_CTRL1_ADJ_DEL4 = 7'h0;
parameter MAIN_DLL_CTRL1_TEST_S = 1'h0;
parameter MAIN_DLL_CTRL1_TEST_RING = 1'h0;
parameter MAIN_DLL_CTRL1_INIT_CODE = 6'h0;
parameter MAIN_DLL_CTRL1_RELOCK_FAST = 1'h0;
parameter MAIN_DLL_STAT0_RESET = 1'h0;
parameter MAIN_DLL_STAT0_PHASE_MOVE_CLK = 1'h0;
parameter MAIN_OVRLY_AXI0_IFC_MODE = 2'h0;
parameter MAIN_OVRLY_AXI1_IFC_MODE = 2'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCIE_0_PCLK_SEL = 3'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCIE_1_PCLK_SEL = 3'h0;
parameter MAIN_CLK_CTRL_AXI0_CLKENA = 1'h0;
parameter MAIN_CLK_CTRL_AXI1_CLKENA = 1'h0;
parameter MAIN_DLL_STAT0_LOCK_INT_EN = 1'h0;
parameter MAIN_DLL_STAT0_UNLOCK_INT_EN = 1'h0;
parameter MAIN_DLL_STAT0_LOCK_INT = 1'h0;
parameter MAIN_DLL_STAT0_UNLOCK_INT = 1'h0;
parameter MAIN_TEST_DLL_RING_OSC_ENABLE = 1'h0;
parameter MAIN_TEST_DLL_REF_ENABLE = 1'h0;
parameter MAIN_SPARE_SCRATCHPAD = 8'h0;
parameter MAIN_SPARE_SPARE_CTRL = 24'h0;
parameter PMA_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_DES_CDR_CTRL_3_CST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_CST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RXDRV_CDR = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST2_DFEEM = 2'h0;
parameter PMA_DES_DFE_CTRL_2_RXDRV_DFE = 2'h0;
parameter PMA_DES_DFE_CTRL_2_CTLEEN_DFE = 1'h0;
parameter PMA_DES_EM_CTRL_2_RXDRV_EM = 2'h0;
parameter PMA_DES_EM_CTRL_2_CTLEEN_EM = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM = 4'h0;
parameter PMA_DES_IN_TERM_RXTEN = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM_SEL = 2'h0;
parameter PMA_DES_IN_TERM_ACCOUPLE_RXVCM_EN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETEN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETRANGE = 1'h0;
parameter PMA_DES_PKDET_RXPKDET_LOW_THRESHOLD = 3'h0;
parameter PMA_DES_PKDET_RXPKDET_HIGH_THRESHOLD = 3'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_MODE = 1'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE = 2'h0;
parameter PMA_DES_RTL_LOCK_CTRL_FDET_SAMPLE_PERIODS = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_RANGE = 2'h0;
parameter PMA_DES_RXPLL_DIV_CDR_GAIN = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTEN = 1'h0;
parameter PMA_DES_CLK_CTRL_RXREFCLK_SEL = 3'h0;
parameter PMA_DES_CLK_CTRL_DESMODE = 3'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKEN = 1'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKDIVEN = 1'h0;
parameter PMA_SER_CTRL_TXVBGREF_SEL = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIVEN = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIV = 2'h0;
parameter PMA_SER_CLK_CTRL_TXBITCLKSEL = 1'h0;
parameter PMA_SER_CLK_CTRL_SERMODE = 3'h0;
parameter PMA_SER_DRV_BYP_BYPASS_VALUE = 8'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT_RTL = 2'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_STEP_WAIT_COUNT = 5'h0;
parameter PMA_SER_TERM_CTRL_TXCM_LEVEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXTEN = 1'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM_SEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM = 4'h0;
parameter PMA_SER_TEST_BUS_TXATESTEN = 1'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDEL = 16'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDATA_INV = 8'h0;
parameter PMA_SER_DRV_CTRL_TXDRVTRIM = 24'h0;
parameter PMA_SER_DRV_CTRL_TXDRV = 3'h0;
parameter PMA_SER_DRV_CTRL_TXITRIM = 2'h0;
parameter PMA_SER_DRV_CTRL_TXODRV = 2'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDRV_CTRL_SEL = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXODRV_BOOSTER = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXMARGIN = 3'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXSWING = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS_BEACON = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_HALF_RATE10BIT = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_HALF_RATE10BIT = 1'h0;
parameter PCS_SOFT_RESET_PERIPH = 1'h0;
parameter PCS_LFWF_R0_RXFWF_RATIO = 2'h0;
parameter PCS_LFWF_R0_TXFWF_RATIO = 2'h0;
parameter PCS_LOVR_R0_FAB_IFC_MODE = 4'h0;
parameter PCS_LOVR_R0_PCSPMA_IFC_MODE = 4'h0;
parameter PCS_LPIP_R0_PIPEENABLE = 1'h0;
parameter PCS_LPIP_R0_PIPEMODE = 1'h0;
parameter PCS_LPIP_R0_PIPE_PCIE_HC = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_SCRAMBLER = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_DISPARITY = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_GEARBOX = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_64B67B = 1'h0;
parameter PCS_L64_R0_L64_CFG_BER_MON_EN = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_8B_MODE = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C49 = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C82 = 1'h0;
parameter PCS_L8_R0_L8_GEARMODE = 2'h0;
parameter PCS_LNTV_R0_LNTV_RX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_RX_IN_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_RX_MODE = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_OUT_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_TX_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_TMG_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_PCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_PCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_RCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_PIPE = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_LCL = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_OUT = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FAB_EPCS_PMA_RESET_B_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_PIPE_AXI1(
       RX_REF_CLK,
       S_ARADDR_31,
       S_ARADDR_30,
       S_ARADDR_28,
       S_ARADDR_0,
       S_ARADDR_1,
       S_ARADDR_2,
       S_ARADDR_3,
       S_ARADDR_4,
       S_ARADDR_5,
       S_ARADDR_6,
       S_ARADDR_7,
       S_ARADDR_8,
       S_ARADDR_9,
       S_ARADDR_10,
       S_ARADDR_11,
       S_ARADDR_12,
       S_ARADDR_13,
       S_ARADDR_14,
       S_ARADDR_15,
       S_ARADDR_16,
       S_ARADDR_17,
       S_ARADDR_18,
       S_ARADDR_19,
       S_ARADDR_20,
       S_ARADDR_21,
       S_ARADDR_22,
       S_ARADDR_23,
       S_WDATA,
       M_ARADDR_31,
       M_ARADDR_30,
       M_ARADDR_29,
       M_ARADDR_28,
       M_ARADDR_0,
       M_ARADDR_1,
       M_ARADDR_2,
       M_ARADDR_3,
       M_ARADDR_4,
       M_ARADDR_5,
       M_ARADDR_6,
       M_ARADDR_7,
       M_ARADDR_8,
       M_ARADDR_9,
       M_ARADDR_10,
       M_ARADDR_11,
       M_ARADDR_12,
       M_ARADDR_13,
       M_ARADDR_14,
       M_ARADDR_15,
       M_ARADDR_16,
       M_ARADDR_17,
       M_ARADDR_18,
       M_ARADDR_19,
       M_ARADDR_20,
       M_ARADDR_21,
       M_ARADDR_22,
       M_ARADDR_23,
       S_RDATA,
       M_ARADDR_HW_0,
       M_ARADDR_HW_1,
       M_ARADDR_HW_2,
       M_ARADDR_HW_3,
       M_ARADDR_HW_4,
       M_ARADDR_HW_5,
       M_ARADDR_HW_6,
       M_ARADDR_HW_7,
       M_ARADDR_HW_8,
       M_ARADDR_HW_9,
       M_ARADDR_HW_10,
       M_ARADDR_HW_11,
       M_ARADDR_HW_12,
       M_ARADDR_HW_13,
       M_ARADDR_HW_14,
       M_ARADDR_HW_15,
       M_ARADDR_HW_16,
       M_ARADDR_HW_17,
       M_ARADDR_HW_18,
       M_ARADDR_HW_19,
       M_ARADDR_HW_20,
       M_ARADDR_HW_21,
       M_ARADDR_HW_22,
       M_ARADDR_HW_23,
       M_ARADDR_HW_28,
       M_ARADDR_HW_29,
       M_ARADDR_HW_30,
       M_ARADDR_HW_31,
       S_ARADDR_HW_0,
       S_ARADDR_HW_1,
       S_ARADDR_HW_2,
       S_ARADDR_HW_3,
       S_ARADDR_HW_4,
       S_ARADDR_HW_5,
       S_ARADDR_HW_6,
       S_ARADDR_HW_7,
       S_ARADDR_HW_8,
       S_ARADDR_HW_9,
       S_ARADDR_HW_10,
       S_ARADDR_HW_11,
       S_ARADDR_HW_12,
       S_ARADDR_HW_13,
       S_ARADDR_HW_14,
       S_ARADDR_HW_15,
       S_ARADDR_HW_16,
       S_ARADDR_HW_17,
       S_ARADDR_HW_18,
       S_ARADDR_HW_19,
       S_ARADDR_HW_20,
       S_ARADDR_HW_21,
       S_ARADDR_HW_22,
       S_ARADDR_HW_23,
       S_ARADDR_HW_28,
       S_ARADDR_HW_30,
       S_ARADDR_HW_31,
       S_RDATA_HW,
       S_WDATA_HW,
       PCS_DEBUG,
       REF_CLK_N,
       REF_CLK_P,
       RX_N,
       RX_P,
       TX_N,
       TX_P,
       JA_CLK,
       TX_BIT_CLK_0,
       TX_BIT_CLK_1,
       TX_PLL_LOCK_0,
       TX_PLL_LOCK_1,
       TX_PLL_REF_CLK_0,
       TX_PLL_REF_CLK_1,
       TX_CLK_G,
       RX_CLK_G,
       PMA_DEBUG,
       ARST_N,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT,
       PHYSTATUS_0,
       POWERDOWN,
       RATE,
       RESET_N,
       RXDATA_0,
       RXDATAK_0,
       RXELECIDLE_0,
       RXPOLARITY_0,
       RXSTANDBYSTATUS_0,
       RXSTATUS_0,
       RXVALID_0,
       TXCOMPLIANCE_0,
       TXDATA_0,
       TXDATAK_0,
       TXDATAVALID_0,
       TXDEEMPH,
       TXDETECTRX_LOOPBACK_0,
       TXELECIDLE_0,
       TXMARGIN,
       TXSWING,
       PIPE_CLK_0,
       PCLK_OUT_0,
       AXI_CLK,
       LINK_CLK,
       LINK_ADDR,
       LINK_EN,
       LINK_ARST_N,
       LINK_WDATA,
       LINK_RDATA
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " S_ARADDR_0->AXI_CLK = 2.075"
syn_tsu1 = " S_ARADDR_1->AXI_CLK = 2.086"
syn_tsu2 = " S_ARADDR_10->AXI_CLK = 2.095"
syn_tsu3 = " S_ARADDR_11->AXI_CLK = 2.051"
syn_tsu4 = " S_ARADDR_12->AXI_CLK = 1.963"
syn_tsu5 = " S_ARADDR_13->AXI_CLK = 2.168"
syn_tsu6 = " S_ARADDR_14->AXI_CLK = 2.109"
syn_tsu7 = " S_ARADDR_15->AXI_CLK = 2.08"
syn_tsu8 = " S_ARADDR_16->AXI_CLK = 2.064"
syn_tsu9 = " S_ARADDR_17->AXI_CLK = 2.126"
syn_tsu10 = " S_ARADDR_18->AXI_CLK = 2.01"
syn_tsu11 = " S_ARADDR_19->AXI_CLK = 2.011"
syn_tsu12 = " S_ARADDR_2->AXI_CLK = 2.155"
syn_tsu13 = " S_ARADDR_20->AXI_CLK = 2.108"
syn_tsu14 = " S_ARADDR_21->AXI_CLK = 1.979"
syn_tsu15 = " S_ARADDR_22->AXI_CLK = 2.097"
syn_tsu16 = " S_ARADDR_23->AXI_CLK = 2.052"
syn_tsu17 = " S_ARADDR_28->AXI_CLK = 2.004"
syn_tsu18 = " S_ARADDR_3->AXI_CLK = 2.013"
syn_tsu19 = " S_ARADDR_30->AXI_CLK = 2.009"
syn_tsu20 = " S_ARADDR_31->AXI_CLK = 2.132"
syn_tsu21 = " S_ARADDR_4->AXI_CLK = 2.04"
syn_tsu22 = " S_ARADDR_5->AXI_CLK = 2.148"
syn_tsu23 = " S_ARADDR_6->AXI_CLK = 2.08"
syn_tsu24 = " S_ARADDR_7->AXI_CLK = 2.08"
syn_tsu25 = " S_ARADDR_8->AXI_CLK = 2.104"
syn_tsu26 = " S_ARADDR_9->AXI_CLK = 2.104"
syn_tsu27 = " S_WDATA[0]->AXI_CLK = 1.977"
syn_tsu28 = " S_WDATA[10]->AXI_CLK = 1.767"
syn_tsu29 = " S_WDATA[11]->AXI_CLK = 2.089"
syn_tsu30 = " S_WDATA[12]->AXI_CLK = 2.105"
syn_tsu31 = " S_WDATA[13]->AXI_CLK = 2.119"
syn_tsu32 = " S_WDATA[14]->AXI_CLK = 1.939"
syn_tsu33 = " S_WDATA[15]->AXI_CLK = 1.851"
syn_tsu34 = " S_WDATA[16]->AXI_CLK = 2.002"
syn_tsu35 = " S_WDATA[17]->AXI_CLK = 1.832"
syn_tsu36 = " S_WDATA[18]->AXI_CLK = 2.066"
syn_tsu37 = " S_WDATA[19]->AXI_CLK = 2.117"
syn_tsu38 = " S_WDATA[1]->AXI_CLK = 2.025"
syn_tsu39 = " S_WDATA[20]->AXI_CLK = 2.147"
syn_tsu40 = " S_WDATA[21]->AXI_CLK = 2.024"
syn_tsu41 = " S_WDATA[22]->AXI_CLK = 2.104"
syn_tsu42 = " S_WDATA[23]->AXI_CLK = 1.994"
syn_tsu43 = " S_WDATA[24]->AXI_CLK = 2.057"
syn_tsu44 = " S_WDATA[25]->AXI_CLK = 1.986"
syn_tsu45 = " S_WDATA[26]->AXI_CLK = 2.114"
syn_tsu46 = " S_WDATA[27]->AXI_CLK = 2.037"
syn_tsu47 = " S_WDATA[28]->AXI_CLK = 2.094"
syn_tsu48 = " S_WDATA[29]->AXI_CLK = 2.087"
syn_tsu49 = " S_WDATA[2]->AXI_CLK = 1.945"
syn_tsu50 = " S_WDATA[30]->AXI_CLK = 1.943"
syn_tsu51 = " S_WDATA[31]->AXI_CLK = 2.007"
syn_tsu52 = " S_WDATA[32]->AXI_CLK = 2.039"
syn_tsu53 = " S_WDATA[33]->AXI_CLK = 2.097"
syn_tsu54 = " S_WDATA[34]->AXI_CLK = 2.138"
syn_tsu55 = " S_WDATA[35]->AXI_CLK = 2.116"
syn_tsu56 = " S_WDATA[36]->AXI_CLK = 2.148"
syn_tsu57 = " S_WDATA[37]->AXI_CLK = 2.038"
syn_tsu58 = " S_WDATA[38]->AXI_CLK = 1.951"
syn_tsu59 = " S_WDATA[39]->AXI_CLK = 1.943"
syn_tsu60 = " S_WDATA[3]->AXI_CLK = 2.088"
syn_tsu61 = " S_WDATA[40]->AXI_CLK = 2.022"
syn_tsu62 = " S_WDATA[41]->AXI_CLK = 2.02"
syn_tsu63 = " S_WDATA[42]->AXI_CLK = 2.062"
syn_tsu64 = " S_WDATA[43]->AXI_CLK = 2.084"
syn_tsu65 = " S_WDATA[44]->AXI_CLK = 1.993"
syn_tsu66 = " S_WDATA[45]->AXI_CLK = 2.117"
syn_tsu67 = " S_WDATA[46]->AXI_CLK = 2.02"
syn_tsu68 = " S_WDATA[47]->AXI_CLK = 2.121"
syn_tsu69 = " S_WDATA[48]->AXI_CLK = 1.986"
syn_tsu70 = " S_WDATA[49]->AXI_CLK = 2.037"
syn_tsu71 = " S_WDATA[4]->AXI_CLK = 1.945"
syn_tsu72 = " S_WDATA[50]->AXI_CLK = 2.043"
syn_tsu73 = " S_WDATA[51]->AXI_CLK = 2.115"
syn_tsu74 = " S_WDATA[52]->AXI_CLK = 2"
syn_tsu75 = " S_WDATA[53]->AXI_CLK = 2.048"
syn_tsu76 = " S_WDATA[54]->AXI_CLK = 2.061"
syn_tsu77 = " S_WDATA[55]->AXI_CLK = 2.022"
syn_tsu78 = " S_WDATA[56]->AXI_CLK = 2.063"
syn_tsu79 = " S_WDATA[57]->AXI_CLK = 2.131"
syn_tsu80 = " S_WDATA[58]->AXI_CLK = 1.973"
syn_tsu81 = " S_WDATA[59]->AXI_CLK = 2.141"
syn_tsu82 = " S_WDATA[5]->AXI_CLK = 1.795"
syn_tsu83 = " S_WDATA[60]->AXI_CLK = 2.118"
syn_tsu84 = " S_WDATA[61]->AXI_CLK = 2.099"
syn_tsu85 = " S_WDATA[62]->AXI_CLK = 1.995"
syn_tsu86 = " S_WDATA[63]->AXI_CLK = 1.923"
syn_tsu87 = " S_WDATA[6]->AXI_CLK = 2"
syn_tsu88 = " S_WDATA[7]->AXI_CLK = 1.962"
syn_tsu89 = " S_WDATA[8]->AXI_CLK = 2.143"
syn_tsu90 = " S_WDATA[9]->AXI_CLK = 1.912"
syn_tco0 = " AXI_CLK->M_ARADDR_0 = 2.535"
syn_tco1 = " AXI_CLK->M_ARADDR_1 = 2.550"
syn_tco2 = " AXI_CLK->M_ARADDR_10 = 2.543"
syn_tco3 = " AXI_CLK->M_ARADDR_11 = 2.623"
syn_tco4 = " AXI_CLK->M_ARADDR_12 = 2.643"
syn_tco5 = " AXI_CLK->M_ARADDR_13 = 2.613"
syn_tco6 = " AXI_CLK->M_ARADDR_14 = 2.638"
syn_tco7 = " AXI_CLK->M_ARADDR_15 = 2.726"
syn_tco8 = " AXI_CLK->M_ARADDR_16 = 2.525"
syn_tco9 = " AXI_CLK->M_ARADDR_17 = 2.442"
syn_tco10 = " AXI_CLK->M_ARADDR_18 = 2.704"
syn_tco11 = " AXI_CLK->M_ARADDR_19 = 2.466"
syn_tco12 = " AXI_CLK->M_ARADDR_2 = 2.669"
syn_tco13 = " AXI_CLK->M_ARADDR_20 = 2.600"
syn_tco14 = " AXI_CLK->M_ARADDR_21 = 2.663"
syn_tco15 = " AXI_CLK->M_ARADDR_22 = 2.678"
syn_tco16 = " AXI_CLK->M_ARADDR_23 = 2.485"
syn_tco17 = " AXI_CLK->M_ARADDR_28 = 2.213"
syn_tco18 = " AXI_CLK->M_ARADDR_29 = 2.219"
syn_tco19 = " AXI_CLK->M_ARADDR_3 = 2.631"
syn_tco20 = " AXI_CLK->M_ARADDR_30 = 2.185"
syn_tco21 = " AXI_CLK->M_ARADDR_31 = 2.167"
syn_tco22 = " AXI_CLK->M_ARADDR_4 = 2.674"
syn_tco23 = " AXI_CLK->M_ARADDR_5 = 2.676"
syn_tco24 = " AXI_CLK->M_ARADDR_6 = 2.734"
syn_tco25 = " AXI_CLK->M_ARADDR_7 = 2.623"
syn_tco26 = " AXI_CLK->M_ARADDR_8 = 2.740"
syn_tco27 = " AXI_CLK->M_ARADDR_9 = 2.607"
syn_tco28 = " AXI_CLK->S_RDATA[0] = 2.776"
syn_tco29 = " AXI_CLK->S_RDATA[10] = 2.730"
syn_tco30 = " AXI_CLK->S_RDATA[11] = 2.768"
syn_tco31 = " AXI_CLK->S_RDATA[12] = 2.749"
syn_tco32 = " AXI_CLK->S_RDATA[13] = 2.732"
syn_tco33 = " AXI_CLK->S_RDATA[14] = 2.736"
syn_tco34 = " AXI_CLK->S_RDATA[15] = 2.532"
syn_tco35 = " AXI_CLK->S_RDATA[16] = 2.742"
syn_tco36 = " AXI_CLK->S_RDATA[17] = 2.739"
syn_tco37 = " AXI_CLK->S_RDATA[18] = 2.723"
syn_tco38 = " AXI_CLK->S_RDATA[19] = 2.759"
syn_tco39 = " AXI_CLK->S_RDATA[1] = 2.654"
syn_tco40 = " AXI_CLK->S_RDATA[20] = 2.683"
syn_tco41 = " AXI_CLK->S_RDATA[21] = 2.789"
syn_tco42 = " AXI_CLK->S_RDATA[22] = 2.424"
syn_tco43 = " AXI_CLK->S_RDATA[23] = 2.712"
syn_tco44 = " AXI_CLK->S_RDATA[24] = 2.670"
syn_tco45 = " AXI_CLK->S_RDATA[25] = 2.726"
syn_tco46 = " AXI_CLK->S_RDATA[26] = 2.709"
syn_tco47 = " AXI_CLK->S_RDATA[27] = 2.485"
syn_tco48 = " AXI_CLK->S_RDATA[28] = 2.760"
syn_tco49 = " AXI_CLK->S_RDATA[29] = 2.670"
syn_tco50 = " AXI_CLK->S_RDATA[2] = 2.708"
syn_tco51 = " AXI_CLK->S_RDATA[30] = 2.682"
syn_tco52 = " AXI_CLK->S_RDATA[31] = 2.772"
syn_tco53 = " AXI_CLK->S_RDATA[32] = 2.698"
syn_tco54 = " AXI_CLK->S_RDATA[33] = 2.708"
syn_tco55 = " AXI_CLK->S_RDATA[34] = 2.766"
syn_tco56 = " AXI_CLK->S_RDATA[35] = 2.744"
syn_tco57 = " AXI_CLK->S_RDATA[36] = 2.795"
syn_tco58 = " AXI_CLK->S_RDATA[37] = 2.757"
syn_tco59 = " AXI_CLK->S_RDATA[38] = 2.735"
syn_tco60 = " AXI_CLK->S_RDATA[39] = 2.675"
syn_tco61 = " AXI_CLK->S_RDATA[3] = 2.763"
syn_tco62 = " AXI_CLK->S_RDATA[40] = 2.733"
syn_tco63 = " AXI_CLK->S_RDATA[41] = 2.751"
syn_tco64 = " AXI_CLK->S_RDATA[42] = 2.635"
syn_tco65 = " AXI_CLK->S_RDATA[43] = 2.690"
syn_tco66 = " AXI_CLK->S_RDATA[44] = 2.677"
syn_tco67 = " AXI_CLK->S_RDATA[45] = 2.719"
syn_tco68 = " AXI_CLK->S_RDATA[46] = 2.753"
syn_tco69 = " AXI_CLK->S_RDATA[47] = 2.743"
syn_tco70 = " AXI_CLK->S_RDATA[48] = 2.689"
syn_tco71 = " AXI_CLK->S_RDATA[49] = 2.767"
syn_tco72 = " AXI_CLK->S_RDATA[4] = 2.767"
syn_tco73 = " AXI_CLK->S_RDATA[50] = 2.718"
syn_tco74 = " AXI_CLK->S_RDATA[51] = 2.698"
syn_tco75 = " AXI_CLK->S_RDATA[52] = 2.739"
syn_tco76 = " AXI_CLK->S_RDATA[53] = 2.737"
syn_tco77 = " AXI_CLK->S_RDATA[54] = 2.775"
syn_tco78 = " AXI_CLK->S_RDATA[55] = 2.781"
syn_tco79 = " AXI_CLK->S_RDATA[56] = 2.765"
syn_tco80 = " AXI_CLK->S_RDATA[57] = 2.761"
syn_tco81 = " AXI_CLK->S_RDATA[58] = 2.756"
syn_tco82 = " AXI_CLK->S_RDATA[59] = 2.605"
syn_tco83 = " AXI_CLK->S_RDATA[5] = 2.658"
syn_tco84 = " AXI_CLK->S_RDATA[60] = 2.712"
syn_tco85 = " AXI_CLK->S_RDATA[61] = 2.750"
syn_tco86 = " AXI_CLK->S_RDATA[62] = 2.697"
syn_tco87 = " AXI_CLK->S_RDATA[63] = 2.770"
syn_tco88 = " AXI_CLK->S_RDATA[6] = 2.475"
syn_tco89 = " AXI_CLK->S_RDATA[7] = 2.718"
syn_tco90 = " AXI_CLK->S_RDATA[8] = 2.765"
syn_tco91 = " AXI_CLK->S_RDATA[9] = 2.715"
syn_tpd92 = " S_WDATA[0]->PCS_DEBUG[14] = 6.324"
syn_tpd93 = " S_WDATA[0]->PCS_DEBUG[4] = 6.481"
syn_tpd94 = " S_WDATA[12]->PCS_DEBUG[12] = 5.969"
syn_tpd95 = " S_WDATA[12]->PCS_DEBUG[17] = 6.360"
syn_tpd96 = " S_WDATA[12]->PCS_DEBUG[2] = 6.261"
syn_tpd97 = " S_WDATA[12]->PCS_DEBUG[7] = 5.739"
syn_tpd98 = " S_WDATA[13]->PCS_DEBUG[13] = 5.676"
syn_tpd99 = " S_WDATA[13]->PCS_DEBUG[18] = 6.510"
syn_tpd100 = " S_WDATA[13]->PCS_DEBUG[3] = 6.658"
syn_tpd101 = " S_WDATA[13]->PCS_DEBUG[8] = 6.140"
*/
/* synthesis black_box_pad_pin ="RX_N,RX_P,TX_N,TX_P" */
input  RX_REF_CLK;
input  S_ARADDR_31;
input  S_ARADDR_30;
input  S_ARADDR_28;
input  S_ARADDR_0;
input  S_ARADDR_1;
input  S_ARADDR_2;
input  S_ARADDR_3;
input  S_ARADDR_4;
input  S_ARADDR_5;
input  S_ARADDR_6;
input  S_ARADDR_7;
input  S_ARADDR_8;
input  S_ARADDR_9;
input  S_ARADDR_10;
input  S_ARADDR_11;
input  S_ARADDR_12;
input  S_ARADDR_13;
input  S_ARADDR_14;
input  S_ARADDR_15;
input  S_ARADDR_16;
input  S_ARADDR_17;
input  S_ARADDR_18;
input  S_ARADDR_19;
input  S_ARADDR_20;
input  S_ARADDR_21;
input  S_ARADDR_22;
input  S_ARADDR_23;
input  [63:0] S_WDATA;
output M_ARADDR_31;
output M_ARADDR_30;
output M_ARADDR_29;
output M_ARADDR_28;
output M_ARADDR_0;
output M_ARADDR_1;
output M_ARADDR_2;
output M_ARADDR_3;
output M_ARADDR_4;
output M_ARADDR_5;
output M_ARADDR_6;
output M_ARADDR_7;
output M_ARADDR_8;
output M_ARADDR_9;
output M_ARADDR_10;
output M_ARADDR_11;
output M_ARADDR_12;
output M_ARADDR_13;
output M_ARADDR_14;
output M_ARADDR_15;
output M_ARADDR_16;
output M_ARADDR_17;
output M_ARADDR_18;
output M_ARADDR_19;
output M_ARADDR_20;
output M_ARADDR_21;
output M_ARADDR_22;
output M_ARADDR_23;
output [63:0] S_RDATA;
input  M_ARADDR_HW_0;
input  M_ARADDR_HW_1;
input  M_ARADDR_HW_2;
input  M_ARADDR_HW_3;
input  M_ARADDR_HW_4;
input  M_ARADDR_HW_5;
input  M_ARADDR_HW_6;
input  M_ARADDR_HW_7;
input  M_ARADDR_HW_8;
input  M_ARADDR_HW_9;
input  M_ARADDR_HW_10;
input  M_ARADDR_HW_11;
input  M_ARADDR_HW_12;
input  M_ARADDR_HW_13;
input  M_ARADDR_HW_14;
input  M_ARADDR_HW_15;
input  M_ARADDR_HW_16;
input  M_ARADDR_HW_17;
input  M_ARADDR_HW_18;
input  M_ARADDR_HW_19;
input  M_ARADDR_HW_20;
input  M_ARADDR_HW_21;
input  M_ARADDR_HW_22;
input  M_ARADDR_HW_23;
input  M_ARADDR_HW_28;
input  M_ARADDR_HW_29;
input  M_ARADDR_HW_30;
input  M_ARADDR_HW_31;
output S_ARADDR_HW_0;
output S_ARADDR_HW_1;
output S_ARADDR_HW_2;
output S_ARADDR_HW_3;
output S_ARADDR_HW_4;
output S_ARADDR_HW_5;
output S_ARADDR_HW_6;
output S_ARADDR_HW_7;
output S_ARADDR_HW_8;
output S_ARADDR_HW_9;
output S_ARADDR_HW_10;
output S_ARADDR_HW_11;
output S_ARADDR_HW_12;
output S_ARADDR_HW_13;
output S_ARADDR_HW_14;
output S_ARADDR_HW_15;
output S_ARADDR_HW_16;
output S_ARADDR_HW_17;
output S_ARADDR_HW_18;
output S_ARADDR_HW_19;
output S_ARADDR_HW_20;
output S_ARADDR_HW_21;
output S_ARADDR_HW_22;
output S_ARADDR_HW_23;
output S_ARADDR_HW_28;
output S_ARADDR_HW_30;
output S_ARADDR_HW_31;
input  [63:0] S_RDATA_HW;
output [63:0] S_WDATA_HW;
output [19:0] PCS_DEBUG;
input  REF_CLK_N;
input  REF_CLK_P;
input  RX_N;
input  RX_P;
output TX_N;
output TX_P;
output JA_CLK;
input  TX_BIT_CLK_0;
input  TX_BIT_CLK_1;
input  TX_PLL_LOCK_0;
input  TX_PLL_LOCK_1;
input  TX_PLL_REF_CLK_0;
input  TX_PLL_REF_CLK_1;
output TX_CLK_G;
output RX_CLK_G;
output PMA_DEBUG;
output [1:0] ARST_N;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
output PHYSTATUS_0;
input  [1:0] POWERDOWN;
input  [1:0] RATE;
input  RESET_N;
output [31:0] RXDATA_0;
output [3:0] RXDATAK_0;
output RXELECIDLE_0;
input  RXPOLARITY_0;
input  RXSTANDBYSTATUS_0;
output [2:0] RXSTATUS_0;
output RXVALID_0;
input  TXCOMPLIANCE_0;
input  [31:0] TXDATA_0;
input  [3:0] TXDATAK_0;
input  TXDATAVALID_0;
input  TXDEEMPH;
input  TXDETECTRX_LOOPBACK_0;
input  TXELECIDLE_0;
input  [2:0] TXMARGIN;
input  TXSWING;
input  PIPE_CLK_0;
output PCLK_OUT_0;
input  AXI_CLK;
input  LINK_CLK;
input  [2:0] LINK_ADDR;
input  LINK_EN;
input  LINK_ARST_N;
input  [3:0] LINK_WDATA;
output [3:0] LINK_RDATA;
parameter MAIN_QMUX_R0_QRST0_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST1_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST2_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST3_SRC = 3'h0;
parameter MSC_UNIQUE = "";
parameter JA_REF_CLK_SEL = "";
parameter DATA_RATE = 0.0;
parameter REG_FILE = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter GPSSMAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_V_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_PERIPH = 1'h0;
parameter GPSSMAIN_SPARE_SCRATCHPAD = 8'h0;
parameter GPSSMAIN_SPARE_SPARE_CTRL = 24'h0;
parameter PMA_CMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_RDIFF = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_P = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_N = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_PULLUP = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_APAD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_BWSEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_VBGREF_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FBDIV_SEL = 2'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_DSMPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PHASESTEPAMOUNT = 8'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_STEP_PHASE = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_AUXDIVPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESETEN = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESET = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL_TXPLL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FOUTAUXDIV2_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_JA_FREF_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN01_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN23_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_UP_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_DN_SEL = 3'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_AUXDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_FBDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_FRAC = 24'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_REFDIV = 6'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFIN = 16'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFFB = 16'h0;
parameter PMA_CMN_TXPLL_JA_2_TXPLL_JA_SYNCCNTMAX = 32'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_CNTOFFSET = 16'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_TARGETCNT = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_OTDLY = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FMI = 8'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FKI = 5'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_DELAYK = 24'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_FDONLY = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_ONTARGETOV = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_PROGRAM = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_FRAC_PRESET = 24'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_PRESET_EN = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_HOLD = 1'h0;
parameter PMA_CMN_TXPLL_JA_9_TXPLL_JA_INT_PRESET = 12'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_EXT = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DOWNSPREAD = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DISABLE_SSCG = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SPREAD = 5'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DIVVAL = 6'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_EXT_MAXADDR = 8'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SEL_EXTWAVE = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_SEL = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_FILTER = 1'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL85 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL100 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL150 = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CAL_TERM = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CURRENT_PROG = 2'h0;
parameter PMA_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_DES_CDR_CTRL_1_DCFBEN_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR0 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR1 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR2 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR3 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_CMRTRIM_CDR = 3'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT3_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_SEL = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_EN = 1'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT3_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CMRTRIM_DFEEM = 3'h0;
parameter PMA_DES_DFEEM_CTRL_2_H1 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H2 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H3 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H4 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_3_H5 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_DCFBEN_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE0 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE1 = 5'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_TH_DFE = 8'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_GRAY_DFE = 3'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_SEL = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_EN = 1'h0;
parameter PMA_DES_EM_CTRL_1_DCFBEN_EM = 1'h0;
parameter PMA_DES_EM_CTRL_1_H0EM0 = 5'h0;
parameter PMA_DES_EM_CTRL_1_H0EM1 = 5'h0;
parameter PMA_DES_EM_CTRL_1_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_TH_EM = 8'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_GRAY_EM = 3'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_SEL = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_EN = 1'h0;
parameter PMA_DES_RTL_EM_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_RTL_EM_EYEMONITOR_SAMPLE_COUNT = 12'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE_FROMFAB = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTSEL = 3'h0;
parameter PMA_DES_TEST_BUS_RXDTESTEN = 1'h0;
parameter PMA_DES_TEST_BUS_RXDTESTSEL = 3'h0;
parameter PMA_DES_CLK_CTRL_RXBYPASSEN = 1'h0;
parameter PMA_DES_RSTPD_RXPD = 1'h0;
parameter PMA_DES_RSTPD_RESETDES = 1'h0;
parameter PMA_DES_RSTPD_PDDFE = 1'h0;
parameter PMA_DES_RSTPD_PDEM = 1'h0;
parameter PMA_DES_RSTPD_RCVEN = 1'h0;
parameter PMA_DES_RSTPD_RESET_FIFO = 1'h0;
parameter PMA_DES_RTL_ERR_CHK_READ_ERROR = 1'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_RANGE = 2'h0;
parameter PMA_SER_CTRL_CMSTEP_VALUE = 1'h0;
parameter PMA_SER_CTRL_CMSTEP = 1'h0;
parameter PMA_SER_CTRL_NLPBK_EN = 1'h0;
parameter PMA_SER_CTRL_HSLPBKEN = 1'h0;
parameter PMA_SER_CTRL_HSLPBK_SEL = 3'h0;
parameter PMA_SER_RSTPD_RESETSEREN = 1'h0;
parameter PMA_SER_RSTPD_RESETSER = 1'h0;
parameter PMA_SER_RSTPD_TXPD = 1'h0;
parameter PMA_SER_DRV_BYP_BYPASSSER = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_COUNT_THRESHOLD = 14'h0;
parameter PMA_SER_RXDET_CTRL_RX_DETECT_EN = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_START = 1'h0;
parameter PMA_SER_STATIC_LSB_STATIC_PATTERN_LSB = 20'h0;
parameter PMA_SER_STATIC_MSB_STATIC_PATTERN_MSB = 20'h0;
parameter PMA_SER_TEST_BUS_TXATESTSEL = 3'h0;
parameter PMA_SER_TEST_BUS_DTESTEN_RTL = 1'h0;
parameter PMA_SER_TEST_BUS_DTESTSEL_RTL = 4'h0;
parameter PMA_SER_TEST_BUS_JTAG_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_TEST_BUS_PRBSERR_TO_DTEST_SEL = 2'h0;
parameter PMA_SER_TEST_BUS_RXPKDETOUT_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_3P5DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_6P0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_HS_0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_3P5DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_6P0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_HS_0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_3P5DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_6P0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_HS_0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_3P5DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_6P0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_HS_0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_3P5DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_6P0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_HS_0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_1 = 6'h0;
parameter PMA_SERDES_RTL_CTRL_RESET_RTL = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_PRBSMODE = 3'h0;
parameter PMA_SERDES_RTL_CTRL_TX_DATA_SELECT = 3'h0;
parameter PMA_SERDES_RTL_CTRL_RX_DATA_SELECT = 2'h0;
parameter PMA_SERDES_RTL_CTRL_RX_FIFO_INPUT_SELECT_NEIGHBOR = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_EYEMONITOR_COMPARISON_DATA_SEL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_CEN = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_RESET = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_FE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_DFE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_OFFSET_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_WAIT_PERIOD_GOOD_LOCK = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_CTLE_OFFSET_CAL = 6'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_GOOD_LOCK = 8'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_BYPASS_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_EM_ONLY = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCEH = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_PHASE_DIRECTION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_CLKDIV = 4'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FREQUENCY = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCE_CDR_COEFFS = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_NUM_COEFFS = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_DFE_CYCLES = 5'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_AREA_CYCLES = 2'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SET_DFE_COEFFS_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_ERROR_THR_CHANNEL_ALIGN = 12'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL0_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL1_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL2_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL3_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL4_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL5_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL6_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL7_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_AREA_COMPUTE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CHANNEL_ALIGN_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FE_CALIBRATION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FULL_CAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_GOOD_LOCK_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_DFE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0CDR = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H1 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H2 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H3 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H4 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H5 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CDRCTLE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RCVEN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_SLIP_DES_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_LOCK_OVERRIDE = 1'h0;
parameter PCSCMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_V_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_0_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_1_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_2_SEL = 5'h0;
parameter PCSCMN_QRST_R0_QRST0_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST0_RST_SEL = 4'h0;
parameter PCSCMN_QRST_R0_QRST1_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST1_RST_SEL = 4'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_MODE = 3'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_X = 2'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_Y = 2'h0;
parameter PCS_SOFT_RESET_NV_MAP = 1'h0;
parameter PCS_SOFT_RESET_V_MAP = 1'h0;
parameter PCS_LFWF_R0_RXFWF_WMARK = 1'h0;
parameter PCS_LFWF_R0_TXFWF_WMARK = 1'h0;
parameter PCS_LPIP_R0_PIPE_SHAREDPLL = 1'h0;
parameter PCS_LPIP_R0_PIPE_INITIALIZATION_DONE = 1'h0;
parameter PCS_LPIP_R0_PIPE_OOB_IDLEBURST_TIMING = 2'h0;
parameter PCS_L64_R0_L64_CFG_BER_1US_TIMER_VAL = 11'h0;
parameter PCS_L64_R1_L64_BYPASS_TEST = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATTERN_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_TYPE_SEL = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PRBS31_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_DATA_SEL = 1'h0;
parameter PCS_L64_R2_L64_SEED_A_VALUE_LO32 = 32'h0;
parameter PCS_L64_R3_L64_SEED_A_VALUE_HI26 = 26'h0;
parameter PCS_L64_R4_L64_SEED_B_VALUE_LO32 = 32'h0;
parameter PCS_L64_R5_L64_SEED_B_VALUE_HI26 = 26'h0;
parameter PCS_L64_R6_L64_TX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R6_L64_TX_ADD_UI = 16'h0;
parameter PCS_L64_R7_L64_RX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R7_L64_RX_ADD_UI = 16'h0;
parameter PCS_L8_R0_L8_TXENCSWAPSEL = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_CDR_RESETS_PCS_RX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_RXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_PLL_RESETS_PCS_TX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_TXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PIPE_RESET = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_RX = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_TX = 1'h0;
parameter PCS_OOB_R0_OOB_BURST_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_BURST_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R2_TXOOB_PROG_DATA_L32B = 32'h0;
parameter PCS_OOB_R3_TXOOB_PROG_DATA_H8B = 8'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_FLOCK_SEL = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R1_RXBEACON_MAX_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R1_TXBEACON_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R2_PD_PLL_CNT = 8'h0;
parameter PCS_PMA_CTRL_R2_PIPE_RATE_INIT = 2'h0;
parameter PCS_PMA_CTRL_R2_FAB_DRIVES_TXPADS = 1'h0;
parameter PCS_MSTR_CTRL_LANE_MSTR = 2'h0;
parameter MAIN_SOFT_RESET_PERIPH = 1'h0;
parameter MAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter MAIN_SOFT_RESET_V_MAP = 1'h0;
parameter MAIN_MAJOR_PCIE_USAGE_MODE = 4'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN0_SEL = 2'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN1_SEL = 2'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN2_SEL = 1'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCLK_INT_LN3_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN0_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN1_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN2_SEL = 1'h0;
parameter MAIN_EXT_PIPE_CLK_CTRL_PCLK_EXT_LN3_SEL = 1'h0;
parameter MAIN_QMUX_R0_PCIE_DBG_SEL = 3'h0;
parameter MAIN_DLL_CTRL0_PHASE_P = 2'h0;
parameter MAIN_DLL_CTRL0_PHASE_S = 2'h0;
parameter MAIN_DLL_CTRL0_SEL_P = 2'h0;
parameter MAIN_DLL_CTRL0_SEL_S = 2'h0;
parameter MAIN_DLL_CTRL0_REF_SEL = 1'h0;
parameter MAIN_DLL_CTRL0_FB_SEL = 1'h0;
parameter MAIN_DLL_CTRL0_DIV_SEL = 1'h0;
parameter MAIN_DLL_CTRL0_ALU_UPD = 2'h0;
parameter MAIN_DLL_CTRL0_LOCK_FRC = 1'h0;
parameter MAIN_DLL_CTRL0_LOCK_FLT = 2'h0;
parameter MAIN_DLL_CTRL0_LOCK_HIGH = 4'h0;
parameter MAIN_DLL_CTRL0_LOCK_LOW = 4'h0;
parameter MAIN_DLL_CTRL1_SET_ALU = 8'h0;
parameter MAIN_DLL_CTRL1_ADJ_DEL4 = 7'h0;
parameter MAIN_DLL_CTRL1_TEST_S = 1'h0;
parameter MAIN_DLL_CTRL1_TEST_RING = 1'h0;
parameter MAIN_DLL_CTRL1_INIT_CODE = 6'h0;
parameter MAIN_DLL_CTRL1_RELOCK_FAST = 1'h0;
parameter MAIN_DLL_STAT0_RESET = 1'h0;
parameter MAIN_DLL_STAT0_PHASE_MOVE_CLK = 1'h0;
parameter MAIN_OVRLY_AXI0_IFC_MODE = 2'h0;
parameter MAIN_OVRLY_AXI1_IFC_MODE = 2'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCIE_0_PCLK_SEL = 3'h0;
parameter MAIN_INT_PIPE_CLK_CTRL_PCIE_1_PCLK_SEL = 3'h0;
parameter MAIN_CLK_CTRL_AXI0_CLKENA = 1'h0;
parameter MAIN_CLK_CTRL_AXI1_CLKENA = 1'h0;
parameter MAIN_DLL_STAT0_LOCK_INT_EN = 1'h0;
parameter MAIN_DLL_STAT0_UNLOCK_INT_EN = 1'h0;
parameter MAIN_DLL_STAT0_LOCK_INT = 1'h0;
parameter MAIN_DLL_STAT0_UNLOCK_INT = 1'h0;
parameter MAIN_TEST_DLL_RING_OSC_ENABLE = 1'h0;
parameter MAIN_TEST_DLL_REF_ENABLE = 1'h0;
parameter MAIN_SPARE_SCRATCHPAD = 8'h0;
parameter MAIN_SPARE_SPARE_CTRL = 24'h0;
parameter PMA_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_DES_CDR_CTRL_3_CST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_CST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RXDRV_CDR = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST2_DFEEM = 2'h0;
parameter PMA_DES_DFE_CTRL_2_RXDRV_DFE = 2'h0;
parameter PMA_DES_DFE_CTRL_2_CTLEEN_DFE = 1'h0;
parameter PMA_DES_EM_CTRL_2_RXDRV_EM = 2'h0;
parameter PMA_DES_EM_CTRL_2_CTLEEN_EM = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM = 4'h0;
parameter PMA_DES_IN_TERM_RXTEN = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM_SEL = 2'h0;
parameter PMA_DES_IN_TERM_ACCOUPLE_RXVCM_EN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETEN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETRANGE = 1'h0;
parameter PMA_DES_PKDET_RXPKDET_LOW_THRESHOLD = 3'h0;
parameter PMA_DES_PKDET_RXPKDET_HIGH_THRESHOLD = 3'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_MODE = 1'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE = 2'h0;
parameter PMA_DES_RTL_LOCK_CTRL_FDET_SAMPLE_PERIODS = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_RANGE = 2'h0;
parameter PMA_DES_RXPLL_DIV_CDR_GAIN = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTEN = 1'h0;
parameter PMA_DES_CLK_CTRL_RXREFCLK_SEL = 3'h0;
parameter PMA_DES_CLK_CTRL_DESMODE = 3'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKEN = 1'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKDIVEN = 1'h0;
parameter PMA_SER_CTRL_TXVBGREF_SEL = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIVEN = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIV = 2'h0;
parameter PMA_SER_CLK_CTRL_TXBITCLKSEL = 1'h0;
parameter PMA_SER_CLK_CTRL_SERMODE = 3'h0;
parameter PMA_SER_DRV_BYP_BYPASS_VALUE = 8'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT_RTL = 2'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_STEP_WAIT_COUNT = 5'h0;
parameter PMA_SER_TERM_CTRL_TXCM_LEVEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXTEN = 1'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM_SEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM = 4'h0;
parameter PMA_SER_TEST_BUS_TXATESTEN = 1'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDEL = 16'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDATA_INV = 8'h0;
parameter PMA_SER_DRV_CTRL_TXDRVTRIM = 24'h0;
parameter PMA_SER_DRV_CTRL_TXDRV = 3'h0;
parameter PMA_SER_DRV_CTRL_TXITRIM = 2'h0;
parameter PMA_SER_DRV_CTRL_TXODRV = 2'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDRV_CTRL_SEL = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXODRV_BOOSTER = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXMARGIN = 3'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXSWING = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS_BEACON = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_HALF_RATE10BIT = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_HALF_RATE10BIT = 1'h0;
parameter PCS_SOFT_RESET_PERIPH = 1'h0;
parameter PCS_LFWF_R0_RXFWF_RATIO = 2'h0;
parameter PCS_LFWF_R0_TXFWF_RATIO = 2'h0;
parameter PCS_LOVR_R0_FAB_IFC_MODE = 4'h0;
parameter PCS_LOVR_R0_PCSPMA_IFC_MODE = 4'h0;
parameter PCS_LPIP_R0_PIPEENABLE = 1'h0;
parameter PCS_LPIP_R0_PIPEMODE = 1'h0;
parameter PCS_LPIP_R0_PIPE_PCIE_HC = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_SCRAMBLER = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_DISPARITY = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_GEARBOX = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_64B67B = 1'h0;
parameter PCS_L64_R0_L64_CFG_BER_MON_EN = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_8B_MODE = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C49 = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C82 = 1'h0;
parameter PCS_L8_R0_L8_GEARMODE = 2'h0;
parameter PCS_LNTV_R0_LNTV_RX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_RX_IN_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_RX_MODE = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_OUT_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_TX_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_TMG_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_PCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_PCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_RCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_PIPE = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_LCL = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_OUT = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FAB_EPCS_PMA_RESET_B_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_PIPE(
       RX_REF_CLK,
       TXELECIDLE,
       RXSTANDBY,
       RXPOLARITY,
       TXSWING,
       TXDEEMPH,
       TXMARGIN,
       TXPATTERN,
       RATE,
       POWERDOWN,
       TXCOMPLIANCE,
       TXDETECTRX_LOOPBACK,
       ENCODEDECODEBYPASS,
       SATA_TX_OOB,
       TXDATA,
       RX_FWF_EN,
       TX_FWF_EN,
       RX_SLIP,
       TXDATAVALID,
       TXDATAK,
       PCS_ARST_N,
       PMA_ARST_N,
       RX_FWF_CLK,
       TX_FWF_CLK,
       TX_CLK_STABLE,
       RX_VAL,
       RX_READY,
       RX_IDLE,
       ALIGNDETECT,
       RXSTANDBYSTATUS,
       RXELECIDLE,
       RX_BYPASS_DATA,
       PHYSTATUS,
       RXSTATUS,
       RXVALID,
       RXDATAK,
       RXDATA,
       SATA_RX_OOB,
       RX_CLK_R,
       TX_CLK_R,
       PCS_DEBUG,
       REF_CLK_N,
       REF_CLK_P,
       RX_N,
       RX_P,
       TX_N,
       TX_P,
       JA_CLK,
       TX_BIT_CLK_0,
       TX_BIT_CLK_1,
       TX_PLL_LOCK_0,
       TX_PLL_LOCK_1,
       TX_PLL_REF_CLK_0,
       TX_PLL_REF_CLK_1,
       TX_CLK_G,
       RX_CLK_G,
       PMA_DEBUG,
       ARST_N,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT,
       LINK_CLK,
       LINK_ADDR,
       LINK_EN,
       LINK_ARST_N,
       LINK_WDATA,
       LINK_RDATA
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " ENCODEDECODEBYPASS->TX_FWF_CLK = 1.156"
syn_tsu1 = " POWERDOWN[0]->TX_FWF_CLK = 1.16"
syn_tsu2 = " POWERDOWN[1]->TX_FWF_CLK = 1.17"
syn_tsu3 = " RATE[0]->TX_FWF_CLK = 1.181"
syn_tsu4 = " RATE[1]->TX_FWF_CLK = 1.196"
syn_tsu5 = " RXPOLARITY->TX_FWF_CLK = 1.174"
syn_tsu6 = " RXSTANDBY->TX_FWF_CLK = 1.201"
syn_tsu7 = " RX_FWF_EN->RX_FWF_CLK = 0.916"
syn_tsu8 = " SATA_TX_OOB[0]->TX_FWF_CLK = 1.255"
syn_tsu9 = " SATA_TX_OOB[1]->TX_FWF_CLK = 1.239"
syn_tsu10 = " TXCOMPLIANCE->TX_FWF_CLK = 1.177"
syn_tsu11 = " TXDATAK[0]->TX_FWF_CLK = 1.17"
syn_tsu12 = " TXDATAK[1]->TX_FWF_CLK = 1.178"
syn_tsu13 = " TXDATAK[2]->TX_FWF_CLK = 1.258"
syn_tsu14 = " TXDATAK[3]->TX_FWF_CLK = 1.241"
syn_tsu15 = " TXDATAVALID->TX_FWF_CLK = 1.203"
syn_tsu16 = " TXDATA[0]->TX_FWF_CLK = 1.158"
syn_tsu17 = " TXDATA[10]->TX_FWF_CLK = 1.158"
syn_tsu18 = " TXDATA[11]->TX_FWF_CLK = 1.154"
syn_tsu19 = " TXDATA[12]->TX_FWF_CLK = 1.262"
syn_tsu20 = " TXDATA[13]->TX_FWF_CLK = 1.22"
syn_tsu21 = " TXDATA[14]->TX_FWF_CLK = 1.253"
syn_tsu22 = " TXDATA[15]->TX_FWF_CLK = 1.175"
syn_tsu23 = " TXDATA[16]->TX_FWF_CLK = 1.236"
syn_tsu24 = " TXDATA[17]->TX_FWF_CLK = 1.178"
syn_tsu25 = " TXDATA[18]->TX_FWF_CLK = 1.146"
syn_tsu26 = " TXDATA[19]->TX_FWF_CLK = 1.213"
syn_tsu27 = " TXDATA[1]->TX_FWF_CLK = 1.19"
syn_tsu28 = " TXDATA[20]->TX_FWF_CLK = 1.165"
syn_tsu29 = " TXDATA[21]->TX_FWF_CLK = 1.226"
syn_tsu30 = " TXDATA[22]->TX_FWF_CLK = 1.162"
syn_tsu31 = " TXDATA[23]->TX_FWF_CLK = 1.214"
syn_tsu32 = " TXDATA[24]->TX_FWF_CLK = 1.191"
syn_tsu33 = " TXDATA[25]->TX_FWF_CLK = 1.268"
syn_tsu34 = " TXDATA[26]->TX_FWF_CLK = 1.24"
syn_tsu35 = " TXDATA[27]->TX_FWF_CLK = 1.174"
syn_tsu36 = " TXDATA[28]->TX_FWF_CLK = 1.224"
syn_tsu37 = " TXDATA[29]->TX_FWF_CLK = 1.154"
syn_tsu38 = " TXDATA[2]->TX_FWF_CLK = 1.251"
syn_tsu39 = " TXDATA[30]->TX_FWF_CLK = 1.156"
syn_tsu40 = " TXDATA[31]->TX_FWF_CLK = 1.18"
syn_tsu41 = " TXDATA[32]->TX_FWF_CLK = 1.233"
syn_tsu42 = " TXDATA[33]->TX_FWF_CLK = 1.182"
syn_tsu43 = " TXDATA[34]->TX_FWF_CLK = 1.197"
syn_tsu44 = " TXDATA[35]->TX_FWF_CLK = 1.188"
syn_tsu45 = " TXDATA[36]->TX_FWF_CLK = 1.211"
syn_tsu46 = " TXDATA[37]->TX_FWF_CLK = 1.239"
syn_tsu47 = " TXDATA[38]->TX_FWF_CLK = 1.173"
syn_tsu48 = " TXDATA[39]->TX_FWF_CLK = 1.211"
syn_tsu49 = " TXDATA[3]->TX_FWF_CLK = 1.208"
syn_tsu50 = " TXDATA[4]->TX_FWF_CLK = 1.189"
syn_tsu51 = " TXDATA[5]->TX_FWF_CLK = 1.182"
syn_tsu52 = " TXDATA[6]->TX_FWF_CLK = 1.27"
syn_tsu53 = " TXDATA[7]->TX_FWF_CLK = 1.228"
syn_tsu54 = " TXDATA[8]->TX_FWF_CLK = 1.255"
syn_tsu55 = " TXDATA[9]->TX_FWF_CLK = 1.274"
syn_tsu56 = " TXDEEMPH->TX_FWF_CLK = 1.188"
syn_tsu57 = " TXDETECTRX_LOOPBACK->TX_FWF_CLK = 1.251"
syn_tsu58 = " TXELECIDLE->TX_FWF_CLK = 1.212"
syn_tsu59 = " TXMARGIN[0]->TX_FWF_CLK = 1.189"
syn_tsu60 = " TXMARGIN[1]->TX_FWF_CLK = 1.199"
syn_tsu61 = " TXMARGIN[2]->TX_FWF_CLK = 1.17"
syn_tsu62 = " TXPATTERN[0]->TX_FWF_CLK = 1.25"
syn_tsu63 = " TXPATTERN[1]->TX_FWF_CLK = 1.177"
syn_tsu64 = " TXSWING->TX_FWF_CLK = 1.229"
syn_tsu65 = " TX_FWF_EN->TX_FWF_CLK = 1.043"
syn_tpd0 = " POWERDOWN[0]->PCS_DEBUG[12] = 5.969"
syn_tpd1 = " POWERDOWN[0]->PCS_DEBUG[17] = 6.360"
syn_tpd2 = " POWERDOWN[0]->PCS_DEBUG[2] = 6.261"
syn_tpd3 = " POWERDOWN[0]->PCS_DEBUG[7] = 5.739"
syn_tpd4 = " POWERDOWN[1]->PCS_DEBUG[13] = 5.676"
syn_tpd5 = " POWERDOWN[1]->PCS_DEBUG[18] = 6.510"
syn_tpd6 = " POWERDOWN[1]->PCS_DEBUG[3] = 6.658"
syn_tpd7 = " POWERDOWN[1]->PCS_DEBUG[8] = 6.140"
syn_tco8 = " RX_FWF_CLK->ALIGNDETECT = 2.903"
syn_tco9 = " RX_FWF_CLK->PHYSTATUS = 2.954"
syn_tco10 = " RX_FWF_CLK->RXDATAK[0] = 2.846"
syn_tco11 = " RX_FWF_CLK->RXDATAK[1] = 2.818"
syn_tco12 = " RX_FWF_CLK->RXDATAK[2] = 2.868"
syn_tco13 = " RX_FWF_CLK->RXDATAK[3] = 2.841"
syn_tco14 = " RX_FWF_CLK->RXDATA[0] = 2.840"
syn_tco15 = " RX_FWF_CLK->RXDATA[10] = 2.862"
syn_tco16 = " RX_FWF_CLK->RXDATA[11] = 2.845"
syn_tco17 = " RX_FWF_CLK->RXDATA[12] = 2.879"
syn_tco18 = " RX_FWF_CLK->RXDATA[13] = 2.877"
syn_tco19 = " RX_FWF_CLK->RXDATA[14] = 2.852"
syn_tco20 = " RX_FWF_CLK->RXDATA[15] = 2.830"
syn_tco21 = " RX_FWF_CLK->RXDATA[16] = 2.865"
syn_tco22 = " RX_FWF_CLK->RXDATA[17] = 2.857"
syn_tco23 = " RX_FWF_CLK->RXDATA[18] = 2.875"
syn_tco24 = " RX_FWF_CLK->RXDATA[19] = 2.852"
syn_tco25 = " RX_FWF_CLK->RXDATA[1] = 2.830"
syn_tco26 = " RX_FWF_CLK->RXDATA[20] = 2.875"
syn_tco27 = " RX_FWF_CLK->RXDATA[21] = 2.844"
syn_tco28 = " RX_FWF_CLK->RXDATA[22] = 2.860"
syn_tco29 = " RX_FWF_CLK->RXDATA[23] = 2.866"
syn_tco30 = " RX_FWF_CLK->RXDATA[24] = 2.886"
syn_tco31 = " RX_FWF_CLK->RXDATA[25] = 2.877"
syn_tco32 = " RX_FWF_CLK->RXDATA[26] = 2.879"
syn_tco33 = " RX_FWF_CLK->RXDATA[27] = 2.883"
syn_tco34 = " RX_FWF_CLK->RXDATA[28] = 2.854"
syn_tco35 = " RX_FWF_CLK->RXDATA[29] = 2.855"
syn_tco36 = " RX_FWF_CLK->RXDATA[2] = 2.832"
syn_tco37 = " RX_FWF_CLK->RXDATA[30] = 2.883"
syn_tco38 = " RX_FWF_CLK->RXDATA[31] = 2.875"
syn_tco39 = " RX_FWF_CLK->RXDATA[32] = 2.848"
syn_tco40 = " RX_FWF_CLK->RXDATA[33] = 2.862"
syn_tco41 = " RX_FWF_CLK->RXDATA[34] = 2.827"
syn_tco42 = " RX_FWF_CLK->RXDATA[35] = 2.845"
syn_tco43 = " RX_FWF_CLK->RXDATA[36] = 2.850"
syn_tco44 = " RX_FWF_CLK->RXDATA[37] = 2.886"
syn_tco45 = " RX_FWF_CLK->RXDATA[38] = 2.873"
syn_tco46 = " RX_FWF_CLK->RXDATA[39] = 2.859"
syn_tco47 = " RX_FWF_CLK->RXDATA[3] = 2.867"
syn_tco48 = " RX_FWF_CLK->RXDATA[4] = 2.858"
syn_tco49 = " RX_FWF_CLK->RXDATA[5] = 2.835"
syn_tco50 = " RX_FWF_CLK->RXDATA[6] = 2.826"
syn_tco51 = " RX_FWF_CLK->RXDATA[7] = 2.858"
syn_tco52 = " RX_FWF_CLK->RXDATA[8] = 2.841"
syn_tco53 = " RX_FWF_CLK->RXDATA[9] = 2.856"
syn_tco54 = " RX_FWF_CLK->RXELECIDLE = 2.938"
syn_tco55 = " RX_FWF_CLK->RXSTANDBYSTATUS = 2.885"
syn_tco56 = " RX_FWF_CLK->RXSTATUS[0] = 2.937"
syn_tco57 = " RX_FWF_CLK->RXSTATUS[1] = 2.928"
syn_tco58 = " RX_FWF_CLK->RXSTATUS[2] = 2.964"
syn_tco59 = " RX_FWF_CLK->RXVALID = 2.851"
syn_tco60 = " RX_FWF_CLK->RX_BYPASS_DATA = 2.911"
syn_tco61 = " RX_FWF_CLK->RX_VAL = 2.295"
syn_tco62 = " RX_FWF_CLK->SATA_RX_OOB[0] = 2.856"
syn_tco63 = " RX_FWF_CLK->SATA_RX_OOB[1] = 2.840"
syn_tpd64 = " TXELECIDLE->PCS_DEBUG[14] = 6.324"
syn_tpd65 = " TXELECIDLE->PCS_DEBUG[4] = 6.481"
*/
/* synthesis black_box_pad_pin ="RX_N,RX_P,TX_N,TX_P" */
input  RX_REF_CLK;
input  TXELECIDLE;
input  RXSTANDBY;
input  RXPOLARITY;
input  TXSWING;
input  TXDEEMPH;
input  [2:0] TXMARGIN;
input  [1:0] TXPATTERN;
input  [1:0] RATE;
input  [1:0] POWERDOWN;
input  TXCOMPLIANCE;
input  TXDETECTRX_LOOPBACK;
input  ENCODEDECODEBYPASS;
input  [1:0] SATA_TX_OOB;
input  [39:0] TXDATA;
input  RX_FWF_EN;
input  TX_FWF_EN;
input  RX_SLIP;
input  TXDATAVALID;
input  [3:0] TXDATAK;
input  PCS_ARST_N;
input  PMA_ARST_N;
input  RX_FWF_CLK;
input  TX_FWF_CLK;
output TX_CLK_STABLE;
output RX_VAL;
output RX_READY;
output RX_IDLE;
output ALIGNDETECT;
output RXSTANDBYSTATUS;
output RXELECIDLE;
output RX_BYPASS_DATA;
output PHYSTATUS;
output [2:0] RXSTATUS;
output RXVALID;
output [3:0] RXDATAK;
output [39:0] RXDATA;
output [1:0] SATA_RX_OOB;
output RX_CLK_R;
output TX_CLK_R;
output [19:0] PCS_DEBUG;
input  REF_CLK_N;
input  REF_CLK_P;
input  RX_N;
input  RX_P;
output TX_N;
output TX_P;
output JA_CLK;
input  TX_BIT_CLK_0;
input  TX_BIT_CLK_1;
input  TX_PLL_LOCK_0;
input  TX_PLL_LOCK_1;
input  TX_PLL_REF_CLK_0;
input  TX_PLL_REF_CLK_1;
output TX_CLK_G;
output RX_CLK_G;
output PMA_DEBUG;
output [1:0] ARST_N;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
input  LINK_CLK;
input  [2:0] LINK_ADDR;
input  LINK_EN;
input  LINK_ARST_N;
input  [3:0] LINK_WDATA;
output [3:0] LINK_RDATA;
parameter MAIN_QMUX_R0_QRST0_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST1_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST2_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST3_SRC = 3'h0;
parameter MSC_UNIQUE = "";
parameter JA_REF_CLK_SEL = "";
parameter DATA_RATE = 0.0;
parameter REG_FILE = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter GPSSMAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_V_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_PERIPH = 1'h0;
parameter GPSSMAIN_SPARE_SCRATCHPAD = 8'h0;
parameter GPSSMAIN_SPARE_SPARE_CTRL = 24'h0;
parameter PMA_CMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_RDIFF = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_P = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_N = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_PULLUP = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_APAD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_BWSEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_VBGREF_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FBDIV_SEL = 2'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_DSMPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PHASESTEPAMOUNT = 8'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_STEP_PHASE = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_AUXDIVPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESETEN = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESET = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL_TXPLL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FOUTAUXDIV2_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_JA_FREF_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN01_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN23_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_UP_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_DN_SEL = 3'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_AUXDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_FBDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_FRAC = 24'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_REFDIV = 6'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFIN = 16'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFFB = 16'h0;
parameter PMA_CMN_TXPLL_JA_2_TXPLL_JA_SYNCCNTMAX = 32'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_CNTOFFSET = 16'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_TARGETCNT = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_OTDLY = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FMI = 8'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FKI = 5'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_DELAYK = 24'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_FDONLY = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_ONTARGETOV = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_PROGRAM = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_FRAC_PRESET = 24'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_PRESET_EN = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_HOLD = 1'h0;
parameter PMA_CMN_TXPLL_JA_9_TXPLL_JA_INT_PRESET = 12'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_EXT = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DOWNSPREAD = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DISABLE_SSCG = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SPREAD = 5'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DIVVAL = 6'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_EXT_MAXADDR = 8'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SEL_EXTWAVE = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_SEL = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_FILTER = 1'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL85 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL100 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL150 = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CAL_TERM = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CURRENT_PROG = 2'h0;
parameter PMA_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_DES_CDR_CTRL_1_DCFBEN_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR0 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR1 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR2 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR3 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_CMRTRIM_CDR = 3'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT3_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_SEL = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_EN = 1'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT3_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CMRTRIM_DFEEM = 3'h0;
parameter PMA_DES_DFEEM_CTRL_2_H1 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H2 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H3 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H4 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_3_H5 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_DCFBEN_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE0 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE1 = 5'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_TH_DFE = 8'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_GRAY_DFE = 3'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_SEL = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_EN = 1'h0;
parameter PMA_DES_EM_CTRL_1_DCFBEN_EM = 1'h0;
parameter PMA_DES_EM_CTRL_1_H0EM0 = 5'h0;
parameter PMA_DES_EM_CTRL_1_H0EM1 = 5'h0;
parameter PMA_DES_EM_CTRL_1_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_TH_EM = 8'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_GRAY_EM = 3'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_SEL = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_EN = 1'h0;
parameter PMA_DES_RTL_EM_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_RTL_EM_EYEMONITOR_SAMPLE_COUNT = 12'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE_FROMFAB = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTSEL = 3'h0;
parameter PMA_DES_TEST_BUS_RXDTESTEN = 1'h0;
parameter PMA_DES_TEST_BUS_RXDTESTSEL = 3'h0;
parameter PMA_DES_CLK_CTRL_RXBYPASSEN = 1'h0;
parameter PMA_DES_RSTPD_RXPD = 1'h0;
parameter PMA_DES_RSTPD_RESETDES = 1'h0;
parameter PMA_DES_RSTPD_PDDFE = 1'h0;
parameter PMA_DES_RSTPD_PDEM = 1'h0;
parameter PMA_DES_RSTPD_RCVEN = 1'h0;
parameter PMA_DES_RSTPD_RESET_FIFO = 1'h0;
parameter PMA_DES_RTL_ERR_CHK_READ_ERROR = 1'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_RANGE = 2'h0;
parameter PMA_SER_CTRL_CMSTEP_VALUE = 1'h0;
parameter PMA_SER_CTRL_CMSTEP = 1'h0;
parameter PMA_SER_CTRL_NLPBK_EN = 1'h0;
parameter PMA_SER_CTRL_HSLPBKEN = 1'h0;
parameter PMA_SER_CTRL_HSLPBK_SEL = 3'h0;
parameter PMA_SER_RSTPD_RESETSEREN = 1'h0;
parameter PMA_SER_RSTPD_RESETSER = 1'h0;
parameter PMA_SER_RSTPD_TXPD = 1'h0;
parameter PMA_SER_DRV_BYP_BYPASSSER = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_COUNT_THRESHOLD = 14'h0;
parameter PMA_SER_RXDET_CTRL_RX_DETECT_EN = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_START = 1'h0;
parameter PMA_SER_STATIC_LSB_STATIC_PATTERN_LSB = 20'h0;
parameter PMA_SER_STATIC_MSB_STATIC_PATTERN_MSB = 20'h0;
parameter PMA_SER_TEST_BUS_TXATESTSEL = 3'h0;
parameter PMA_SER_TEST_BUS_DTESTEN_RTL = 1'h0;
parameter PMA_SER_TEST_BUS_DTESTSEL_RTL = 4'h0;
parameter PMA_SER_TEST_BUS_JTAG_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_TEST_BUS_PRBSERR_TO_DTEST_SEL = 2'h0;
parameter PMA_SER_TEST_BUS_RXPKDETOUT_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_3P5DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_6P0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_HS_0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_3P5DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_6P0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_HS_0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_3P5DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_6P0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_HS_0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_3P5DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_6P0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_HS_0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_3P5DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_6P0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_HS_0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_1 = 6'h0;
parameter PMA_SERDES_RTL_CTRL_RESET_RTL = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_PRBSMODE = 3'h0;
parameter PMA_SERDES_RTL_CTRL_TX_DATA_SELECT = 3'h0;
parameter PMA_SERDES_RTL_CTRL_RX_DATA_SELECT = 2'h0;
parameter PMA_SERDES_RTL_CTRL_RX_FIFO_INPUT_SELECT_NEIGHBOR = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_EYEMONITOR_COMPARISON_DATA_SEL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_CEN = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_RESET = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_FE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_DFE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_OFFSET_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_WAIT_PERIOD_GOOD_LOCK = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_CTLE_OFFSET_CAL = 6'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_GOOD_LOCK = 8'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_BYPASS_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_EM_ONLY = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCEH = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_PHASE_DIRECTION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_CLKDIV = 4'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FREQUENCY = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCE_CDR_COEFFS = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_NUM_COEFFS = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_DFE_CYCLES = 5'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_AREA_CYCLES = 2'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SET_DFE_COEFFS_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_ERROR_THR_CHANNEL_ALIGN = 12'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL0_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL1_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL2_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL3_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL4_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL5_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL6_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL7_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_AREA_COMPUTE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CHANNEL_ALIGN_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FE_CALIBRATION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FULL_CAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_GOOD_LOCK_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_DFE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0CDR = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H1 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H2 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H3 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H4 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H5 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CDRCTLE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RCVEN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_SLIP_DES_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_LOCK_OVERRIDE = 1'h0;
parameter PCSCMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_V_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_0_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_1_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_2_SEL = 5'h0;
parameter PCSCMN_QRST_R0_QRST0_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST0_RST_SEL = 4'h0;
parameter PCSCMN_QRST_R0_QRST1_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST1_RST_SEL = 4'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_MODE = 3'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_X = 2'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_Y = 2'h0;
parameter PCS_SOFT_RESET_NV_MAP = 1'h0;
parameter PCS_SOFT_RESET_V_MAP = 1'h0;
parameter PCS_LFWF_R0_RXFWF_WMARK = 1'h0;
parameter PCS_LFWF_R0_TXFWF_WMARK = 1'h0;
parameter PCS_LPIP_R0_PIPE_SHAREDPLL = 1'h0;
parameter PCS_LPIP_R0_PIPE_INITIALIZATION_DONE = 1'h0;
parameter PCS_LPIP_R0_PIPE_OOB_IDLEBURST_TIMING = 2'h0;
parameter PCS_L64_R0_L64_CFG_BER_1US_TIMER_VAL = 11'h0;
parameter PCS_L64_R1_L64_BYPASS_TEST = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATTERN_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_TYPE_SEL = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PRBS31_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_DATA_SEL = 1'h0;
parameter PCS_L64_R2_L64_SEED_A_VALUE_LO32 = 32'h0;
parameter PCS_L64_R3_L64_SEED_A_VALUE_HI26 = 26'h0;
parameter PCS_L64_R4_L64_SEED_B_VALUE_LO32 = 32'h0;
parameter PCS_L64_R5_L64_SEED_B_VALUE_HI26 = 26'h0;
parameter PCS_L64_R6_L64_TX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R6_L64_TX_ADD_UI = 16'h0;
parameter PCS_L64_R7_L64_RX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R7_L64_RX_ADD_UI = 16'h0;
parameter PCS_L8_R0_L8_TXENCSWAPSEL = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_CDR_RESETS_PCS_RX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_RXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_PLL_RESETS_PCS_TX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_TXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PIPE_RESET = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_RX = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_TX = 1'h0;
parameter PCS_OOB_R0_OOB_BURST_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_BURST_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R2_TXOOB_PROG_DATA_L32B = 32'h0;
parameter PCS_OOB_R3_TXOOB_PROG_DATA_H8B = 8'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_FLOCK_SEL = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R1_RXBEACON_MAX_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R1_TXBEACON_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R2_PD_PLL_CNT = 8'h0;
parameter PCS_PMA_CTRL_R2_PIPE_RATE_INIT = 2'h0;
parameter PCS_PMA_CTRL_R2_FAB_DRIVES_TXPADS = 1'h0;
parameter PCS_MSTR_CTRL_LANE_MSTR = 2'h0;
parameter MAIN_SOFT_RESET_PERIPH = 1'h0;
parameter MAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter MAIN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_DES_CDR_CTRL_3_CST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_CST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RXDRV_CDR = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST2_DFEEM = 2'h0;
parameter PMA_DES_DFE_CTRL_2_RXDRV_DFE = 2'h0;
parameter PMA_DES_DFE_CTRL_2_CTLEEN_DFE = 1'h0;
parameter PMA_DES_EM_CTRL_2_RXDRV_EM = 2'h0;
parameter PMA_DES_EM_CTRL_2_CTLEEN_EM = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM = 4'h0;
parameter PMA_DES_IN_TERM_RXTEN = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM_SEL = 2'h0;
parameter PMA_DES_IN_TERM_ACCOUPLE_RXVCM_EN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETEN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETRANGE = 1'h0;
parameter PMA_DES_PKDET_RXPKDET_LOW_THRESHOLD = 3'h0;
parameter PMA_DES_PKDET_RXPKDET_HIGH_THRESHOLD = 3'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_MODE = 1'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE = 2'h0;
parameter PMA_DES_RTL_LOCK_CTRL_FDET_SAMPLE_PERIODS = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_RANGE = 2'h0;
parameter PMA_DES_RXPLL_DIV_CDR_GAIN = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTEN = 1'h0;
parameter PMA_DES_CLK_CTRL_RXREFCLK_SEL = 3'h0;
parameter PMA_DES_CLK_CTRL_DESMODE = 3'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKEN = 1'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKDIVEN = 1'h0;
parameter PMA_SER_CTRL_TXVBGREF_SEL = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIVEN = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIV = 2'h0;
parameter PMA_SER_CLK_CTRL_TXBITCLKSEL = 1'h0;
parameter PMA_SER_CLK_CTRL_SERMODE = 3'h0;
parameter PMA_SER_DRV_BYP_BYPASS_VALUE = 8'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT_RTL = 2'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_STEP_WAIT_COUNT = 5'h0;
parameter PMA_SER_TERM_CTRL_TXCM_LEVEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXTEN = 1'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM_SEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM = 4'h0;
parameter PMA_SER_TEST_BUS_TXATESTEN = 1'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDEL = 16'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDATA_INV = 8'h0;
parameter PMA_SER_DRV_CTRL_TXDRVTRIM = 24'h0;
parameter PMA_SER_DRV_CTRL_TXDRV = 3'h0;
parameter PMA_SER_DRV_CTRL_TXITRIM = 2'h0;
parameter PMA_SER_DRV_CTRL_TXODRV = 2'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDRV_CTRL_SEL = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXODRV_BOOSTER = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXMARGIN = 3'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXSWING = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS_BEACON = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_HALF_RATE10BIT = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_HALF_RATE10BIT = 1'h0;
parameter PCS_SOFT_RESET_PERIPH = 1'h0;
parameter PCS_LFWF_R0_RXFWF_RATIO = 2'h0;
parameter PCS_LFWF_R0_TXFWF_RATIO = 2'h0;
parameter PCS_LOVR_R0_FAB_IFC_MODE = 4'h0;
parameter PCS_LOVR_R0_PCSPMA_IFC_MODE = 4'h0;
parameter PCS_LPIP_R0_PIPEENABLE = 1'h0;
parameter PCS_LPIP_R0_PIPEMODE = 1'h0;
parameter PCS_LPIP_R0_PIPE_PCIE_HC = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_SCRAMBLER = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_DISPARITY = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_GEARBOX = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_64B67B = 1'h0;
parameter PCS_L64_R0_L64_CFG_BER_MON_EN = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_8B_MODE = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C49 = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C82 = 1'h0;
parameter PCS_L8_R0_L8_GEARMODE = 2'h0;
parameter PCS_LNTV_R0_LNTV_RX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_RX_IN_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_RX_MODE = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_OUT_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_TX_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_TMG_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_PCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_PCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_RCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_PIPE = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_LCL = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_OUT = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FAB_EPCS_PMA_RESET_B_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_PMA(
       RX_REF_CLK,
       TX_DATA,
       RX_FWF_EN,
       TX_FWF_EN,
       RX_SLIP,
       LOCK_OVERRIDE,
       TX_BYPASS_DATA,
       TX_ELEC_IDLE,
       PCS_ARST_N,
       PMA_ARST_N,
       RX_FWF_CLK,
       TX_FWF_CLK,
       TX_CLK_STABLE,
       RX_VAL,
       RX_READY,
       RX_IDLE,
       RX_DATA,
       RX_BYPASS_DATA,
       RX_CLK_R,
       TX_CLK_R,
       PCS_DEBUG,
       REF_CLK_N,
       REF_CLK_P,
       RX_N,
       RX_P,
       TX_N,
       TX_P,
       JA_CLK,
       TX_BIT_CLK_0,
       TX_BIT_CLK_1,
       TX_PLL_LOCK_0,
       TX_PLL_LOCK_1,
       TX_PLL_REF_CLK_0,
       TX_PLL_REF_CLK_1,
       TX_CLK_G,
       RX_CLK_G,
       PMA_DEBUG,
       ARST_N,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT,
       LINK_CLK,
       LINK_ADDR,
       LINK_EN,
       LINK_ARST_N,
       LINK_WDATA,
       LINK_RDATA
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " LOCK_OVERRIDE[0]->TX_FWF_CLK = 1.232"
syn_tsu1 = " LOCK_OVERRIDE[1]->TX_FWF_CLK = 1.154"
syn_tsu2 = " RX_FWF_EN->RX_FWF_CLK = 0.916"
syn_tsu3 = " TX_BYPASS_DATA->TX_FWF_CLK = 1.247"
syn_tsu4 = " TX_DATA[0]->TX_FWF_CLK = 1.212"
syn_tsu5 = " TX_DATA[10]->TX_FWF_CLK = 1.181"
syn_tsu6 = " TX_DATA[11]->TX_FWF_CLK = 1.196"
syn_tsu7 = " TX_DATA[12]->TX_FWF_CLK = 1.16"
syn_tsu8 = " TX_DATA[13]->TX_FWF_CLK = 1.17"
syn_tsu9 = " TX_DATA[14]->TX_FWF_CLK = 1.177"
syn_tsu10 = " TX_DATA[15]->TX_FWF_CLK = 1.251"
syn_tsu11 = " TX_DATA[16]->TX_FWF_CLK = 1.156"
syn_tsu12 = " TX_DATA[17]->TX_FWF_CLK = 1.255"
syn_tsu13 = " TX_DATA[18]->TX_FWF_CLK = 1.239"
syn_tsu14 = " TX_DATA[19]->TX_FWF_CLK = 1.214"
syn_tsu15 = " TX_DATA[1]->TX_FWF_CLK = 1.201"
syn_tsu16 = " TX_DATA[20]->TX_FWF_CLK = 1.201"
syn_tsu17 = " TX_DATA[21]->TX_FWF_CLK = 1.273"
syn_tsu18 = " TX_DATA[22]->TX_FWF_CLK = 1.231"
syn_tsu19 = " TX_DATA[23]->TX_FWF_CLK = 1.205"
syn_tsu20 = " TX_DATA[24]->TX_FWF_CLK = 1.227"
syn_tsu21 = " TX_DATA[25]->TX_FWF_CLK = 1.276"
syn_tsu22 = " TX_DATA[26]->TX_FWF_CLK = 1.24"
syn_tsu23 = " TX_DATA[27]->TX_FWF_CLK = 1.176"
syn_tsu24 = " TX_DATA[28]->TX_FWF_CLK = 1.259"
syn_tsu25 = " TX_DATA[29]->TX_FWF_CLK = 1.178"
syn_tsu26 = " TX_DATA[2]->TX_FWF_CLK = 1.174"
syn_tsu27 = " TX_DATA[30]->TX_FWF_CLK = 1.226"
syn_tsu28 = " TX_DATA[31]->TX_FWF_CLK = 1.207"
syn_tsu29 = " TX_DATA[32]->TX_FWF_CLK = 1.189"
syn_tsu30 = " TX_DATA[33]->TX_FWF_CLK = 1.158"
syn_tsu31 = " TX_DATA[34]->TX_FWF_CLK = 1.19"
syn_tsu32 = " TX_DATA[35]->TX_FWF_CLK = 1.251"
syn_tsu33 = " TX_DATA[36]->TX_FWF_CLK = 1.208"
syn_tsu34 = " TX_DATA[37]->TX_FWF_CLK = 1.189"
syn_tsu35 = " TX_DATA[38]->TX_FWF_CLK = 1.182"
syn_tsu36 = " TX_DATA[39]->TX_FWF_CLK = 1.27"
syn_tsu37 = " TX_DATA[3]->TX_FWF_CLK = 1.229"
syn_tsu38 = " TX_DATA[40]->TX_FWF_CLK = 1.228"
syn_tsu39 = " TX_DATA[41]->TX_FWF_CLK = 1.255"
syn_tsu40 = " TX_DATA[42]->TX_FWF_CLK = 1.274"
syn_tsu41 = " TX_DATA[43]->TX_FWF_CLK = 1.158"
syn_tsu42 = " TX_DATA[44]->TX_FWF_CLK = 1.154"
syn_tsu43 = " TX_DATA[45]->TX_FWF_CLK = 1.262"
syn_tsu44 = " TX_DATA[46]->TX_FWF_CLK = 1.22"
syn_tsu45 = " TX_DATA[47]->TX_FWF_CLK = 1.253"
syn_tsu46 = " TX_DATA[48]->TX_FWF_CLK = 1.175"
syn_tsu47 = " TX_DATA[49]->TX_FWF_CLK = 1.236"
syn_tsu48 = " TX_DATA[4]->TX_FWF_CLK = 1.188"
syn_tsu49 = " TX_DATA[50]->TX_FWF_CLK = 1.178"
syn_tsu50 = " TX_DATA[51]->TX_FWF_CLK = 1.146"
syn_tsu51 = " TX_DATA[52]->TX_FWF_CLK = 1.213"
syn_tsu52 = " TX_DATA[53]->TX_FWF_CLK = 1.165"
syn_tsu53 = " TX_DATA[54]->TX_FWF_CLK = 1.226"
syn_tsu54 = " TX_DATA[55]->TX_FWF_CLK = 1.162"
syn_tsu55 = " TX_DATA[56]->TX_FWF_CLK = 1.214"
syn_tsu56 = " TX_DATA[57]->TX_FWF_CLK = 1.191"
syn_tsu57 = " TX_DATA[58]->TX_FWF_CLK = 1.268"
syn_tsu58 = " TX_DATA[59]->TX_FWF_CLK = 1.24"
syn_tsu59 = " TX_DATA[5]->TX_FWF_CLK = 1.189"
syn_tsu60 = " TX_DATA[60]->TX_FWF_CLK = 1.174"
syn_tsu61 = " TX_DATA[61]->TX_FWF_CLK = 1.224"
syn_tsu62 = " TX_DATA[62]->TX_FWF_CLK = 1.154"
syn_tsu63 = " TX_DATA[63]->TX_FWF_CLK = 1.156"
syn_tsu64 = " TX_DATA[64]->TX_FWF_CLK = 1.18"
syn_tsu65 = " TX_DATA[65]->TX_FWF_CLK = 1.233"
syn_tsu66 = " TX_DATA[66]->TX_FWF_CLK = 1.182"
syn_tsu67 = " TX_DATA[67]->TX_FWF_CLK = 1.197"
syn_tsu68 = " TX_DATA[68]->TX_FWF_CLK = 1.188"
syn_tsu69 = " TX_DATA[69]->TX_FWF_CLK = 1.211"
syn_tsu70 = " TX_DATA[6]->TX_FWF_CLK = 1.199"
syn_tsu71 = " TX_DATA[70]->TX_FWF_CLK = 1.239"
syn_tsu72 = " TX_DATA[71]->TX_FWF_CLK = 1.173"
syn_tsu73 = " TX_DATA[72]->TX_FWF_CLK = 1.211"
syn_tsu74 = " TX_DATA[73]->TX_FWF_CLK = 1.203"
syn_tsu75 = " TX_DATA[74]->TX_FWF_CLK = 1.17"
syn_tsu76 = " TX_DATA[75]->TX_FWF_CLK = 1.178"
syn_tsu77 = " TX_DATA[76]->TX_FWF_CLK = 1.258"
syn_tsu78 = " TX_DATA[77]->TX_FWF_CLK = 1.241"
syn_tsu79 = " TX_DATA[78]->TX_FWF_CLK = 1.176"
syn_tsu80 = " TX_DATA[79]->TX_FWF_CLK = 1.195"
syn_tsu81 = " TX_DATA[7]->TX_FWF_CLK = 1.17"
syn_tsu82 = " TX_DATA[8]->TX_FWF_CLK = 1.25"
syn_tsu83 = " TX_DATA[9]->TX_FWF_CLK = 1.177"
syn_tsu84 = " TX_ELEC_IDLE->TX_FWF_CLK = 1.17"
syn_tsu85 = " TX_FWF_EN->TX_FWF_CLK = 1.043"
syn_tco0 = " RX_FWF_CLK->RX_BYPASS_DATA = 2.911"
syn_tco1 = " RX_FWF_CLK->RX_DATA[0] = 2.954"
syn_tco2 = " RX_FWF_CLK->RX_DATA[10] = 2.830"
syn_tco3 = " RX_FWF_CLK->RX_DATA[11] = 2.832"
syn_tco4 = " RX_FWF_CLK->RX_DATA[12] = 2.867"
syn_tco5 = " RX_FWF_CLK->RX_DATA[13] = 2.858"
syn_tco6 = " RX_FWF_CLK->RX_DATA[14] = 2.835"
syn_tco7 = " RX_FWF_CLK->RX_DATA[15] = 2.826"
syn_tco8 = " RX_FWF_CLK->RX_DATA[16] = 2.858"
syn_tco9 = " RX_FWF_CLK->RX_DATA[17] = 2.841"
syn_tco10 = " RX_FWF_CLK->RX_DATA[18] = 2.856"
syn_tco11 = " RX_FWF_CLK->RX_DATA[19] = 2.862"
syn_tco12 = " RX_FWF_CLK->RX_DATA[1] = 2.937"
syn_tco13 = " RX_FWF_CLK->RX_DATA[20] = 2.845"
syn_tco14 = " RX_FWF_CLK->RX_DATA[21] = 2.879"
syn_tco15 = " RX_FWF_CLK->RX_DATA[22] = 2.877"
syn_tco16 = " RX_FWF_CLK->RX_DATA[23] = 2.852"
syn_tco17 = " RX_FWF_CLK->RX_DATA[24] = 2.830"
syn_tco18 = " RX_FWF_CLK->RX_DATA[25] = 2.865"
syn_tco19 = " RX_FWF_CLK->RX_DATA[26] = 2.857"
syn_tco20 = " RX_FWF_CLK->RX_DATA[27] = 2.875"
syn_tco21 = " RX_FWF_CLK->RX_DATA[28] = 2.852"
syn_tco22 = " RX_FWF_CLK->RX_DATA[29] = 2.875"
syn_tco23 = " RX_FWF_CLK->RX_DATA[2] = 2.928"
syn_tco24 = " RX_FWF_CLK->RX_DATA[30] = 2.844"
syn_tco25 = " RX_FWF_CLK->RX_DATA[31] = 2.860"
syn_tco26 = " RX_FWF_CLK->RX_DATA[32] = 2.866"
syn_tco27 = " RX_FWF_CLK->RX_DATA[33] = 2.886"
syn_tco28 = " RX_FWF_CLK->RX_DATA[34] = 2.877"
syn_tco29 = " RX_FWF_CLK->RX_DATA[35] = 2.879"
syn_tco30 = " RX_FWF_CLK->RX_DATA[36] = 2.883"
syn_tco31 = " RX_FWF_CLK->RX_DATA[37] = 2.854"
syn_tco32 = " RX_FWF_CLK->RX_DATA[38] = 2.855"
syn_tco33 = " RX_FWF_CLK->RX_DATA[39] = 2.883"
syn_tco34 = " RX_FWF_CLK->RX_DATA[3] = 2.964"
syn_tco35 = " RX_FWF_CLK->RX_DATA[40] = 2.875"
syn_tco36 = " RX_FWF_CLK->RX_DATA[41] = 2.848"
syn_tco37 = " RX_FWF_CLK->RX_DATA[42] = 2.862"
syn_tco38 = " RX_FWF_CLK->RX_DATA[43] = 2.827"
syn_tco39 = " RX_FWF_CLK->RX_DATA[44] = 2.845"
syn_tco40 = " RX_FWF_CLK->RX_DATA[45] = 2.850"
syn_tco41 = " RX_FWF_CLK->RX_DATA[46] = 2.886"
syn_tco42 = " RX_FWF_CLK->RX_DATA[47] = 2.873"
syn_tco43 = " RX_FWF_CLK->RX_DATA[48] = 2.859"
syn_tco44 = " RX_FWF_CLK->RX_DATA[49] = 2.856"
syn_tco45 = " RX_FWF_CLK->RX_DATA[4] = 2.851"
syn_tco46 = " RX_FWF_CLK->RX_DATA[50] = 2.840"
syn_tco47 = " RX_FWF_CLK->RX_DATA[51] = 2.839"
syn_tco48 = " RX_FWF_CLK->RX_DATA[52] = 2.865"
syn_tco49 = " RX_FWF_CLK->RX_DATA[53] = 2.854"
syn_tco50 = " RX_FWF_CLK->RX_DATA[54] = 2.831"
syn_tco51 = " RX_FWF_CLK->RX_DATA[55] = 2.862"
syn_tco52 = " RX_FWF_CLK->RX_DATA[56] = 2.845"
syn_tco53 = " RX_FWF_CLK->RX_DATA[57] = 2.815"
syn_tco54 = " RX_FWF_CLK->RX_DATA[58] = 2.795"
syn_tco55 = " RX_FWF_CLK->RX_DATA[59] = 2.827"
syn_tco56 = " RX_FWF_CLK->RX_DATA[5] = 2.846"
syn_tco57 = " RX_FWF_CLK->RX_DATA[60] = 2.777"
syn_tco58 = " RX_FWF_CLK->RX_DATA[61] = 2.802"
syn_tco59 = " RX_FWF_CLK->RX_DATA[62] = 2.767"
syn_tco60 = " RX_FWF_CLK->RX_DATA[63] = 2.809"
syn_tco61 = " RX_FWF_CLK->RX_DATA[64] = 2.890"
syn_tco62 = " RX_FWF_CLK->RX_DATA[65] = 2.900"
syn_tco63 = " RX_FWF_CLK->RX_DATA[66] = 2.861"
syn_tco64 = " RX_FWF_CLK->RX_DATA[67] = 2.899"
syn_tco65 = " RX_FWF_CLK->RX_DATA[68] = 2.903"
syn_tco66 = " RX_FWF_CLK->RX_DATA[69] = 2.885"
syn_tco67 = " RX_FWF_CLK->RX_DATA[6] = 2.818"
syn_tco68 = " RX_FWF_CLK->RX_DATA[70] = 2.910"
syn_tco69 = " RX_FWF_CLK->RX_DATA[71] = 2.909"
syn_tco70 = " RX_FWF_CLK->RX_DATA[72] = 2.938"
syn_tco71 = " RX_FWF_CLK->RX_DATA[73] = 2.877"
syn_tco72 = " RX_FWF_CLK->RX_DATA[74] = 2.897"
syn_tco73 = " RX_FWF_CLK->RX_DATA[75] = 2.886"
syn_tco74 = " RX_FWF_CLK->RX_DATA[76] = 2.896"
syn_tco75 = " RX_FWF_CLK->RX_DATA[77] = 2.892"
syn_tco76 = " RX_FWF_CLK->RX_DATA[78] = 2.871"
syn_tco77 = " RX_FWF_CLK->RX_DATA[79] = 2.862"
syn_tco78 = " RX_FWF_CLK->RX_DATA[7] = 2.868"
syn_tco79 = " RX_FWF_CLK->RX_DATA[8] = 2.841"
syn_tco80 = " RX_FWF_CLK->RX_DATA[9] = 2.840"
syn_tco81 = " RX_FWF_CLK->RX_VAL = 2.295"
syn_tpd82 = " TX_DATA[0]->PCS_DEBUG[14] = 6.324"
syn_tpd83 = " TX_DATA[0]->PCS_DEBUG[4] = 6.481"
syn_tpd84 = " TX_DATA[12]->PCS_DEBUG[12] = 5.969"
syn_tpd85 = " TX_DATA[12]->PCS_DEBUG[17] = 6.360"
syn_tpd86 = " TX_DATA[12]->PCS_DEBUG[2] = 6.261"
syn_tpd87 = " TX_DATA[12]->PCS_DEBUG[7] = 5.739"
syn_tpd88 = " TX_DATA[13]->PCS_DEBUG[13] = 5.676"
syn_tpd89 = " TX_DATA[13]->PCS_DEBUG[18] = 6.510"
syn_tpd90 = " TX_DATA[13]->PCS_DEBUG[3] = 6.658"
syn_tpd91 = " TX_DATA[13]->PCS_DEBUG[8] = 6.140"
*/
/* synthesis black_box_pad_pin ="RX_N,RX_P,TX_N,TX_P" */
input  RX_REF_CLK;
input  [79:0] TX_DATA;
input  RX_FWF_EN;
input  TX_FWF_EN;
input  RX_SLIP;
input  [1:0] LOCK_OVERRIDE;
input  TX_BYPASS_DATA;
input  TX_ELEC_IDLE;
input  PCS_ARST_N;
input  PMA_ARST_N;
input  RX_FWF_CLK;
input  TX_FWF_CLK;
output TX_CLK_STABLE;
output RX_VAL;
output RX_READY;
output RX_IDLE;
output [79:0] RX_DATA;
output RX_BYPASS_DATA;
output RX_CLK_R;
output TX_CLK_R;
output [19:0] PCS_DEBUG;
input  REF_CLK_N;
input  REF_CLK_P;
input  RX_N;
input  RX_P;
output TX_N;
output TX_P;
output JA_CLK;
input  TX_BIT_CLK_0;
input  TX_BIT_CLK_1;
input  TX_PLL_LOCK_0;
input  TX_PLL_LOCK_1;
input  TX_PLL_REF_CLK_0;
input  TX_PLL_REF_CLK_1;
output TX_CLK_G;
output RX_CLK_G;
output PMA_DEBUG;
output [1:0] ARST_N;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
input  LINK_CLK;
input  [2:0] LINK_ADDR;
input  LINK_EN;
input  LINK_ARST_N;
input  [3:0] LINK_WDATA;
output [3:0] LINK_RDATA;
parameter MAIN_QMUX_R0_QRST0_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST1_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST2_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST3_SRC = 3'h0;
parameter MSC_UNIQUE = "";
parameter JA_REF_CLK_SEL = "";
parameter DATA_RATE = 0.0;
parameter REG_FILE = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter GPSSMAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_V_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_PERIPH = 1'h0;
parameter GPSSMAIN_SPARE_SCRATCHPAD = 8'h0;
parameter GPSSMAIN_SPARE_SPARE_CTRL = 24'h0;
parameter PMA_CMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_RDIFF = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_P = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_N = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_PULLUP = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_APAD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_BWSEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_VBGREF_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FBDIV_SEL = 2'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_DSMPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PHASESTEPAMOUNT = 8'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_STEP_PHASE = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_AUXDIVPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESETEN = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESET = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL_TXPLL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FOUTAUXDIV2_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_JA_FREF_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN01_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN23_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_UP_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_DN_SEL = 3'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_AUXDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_FBDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_FRAC = 24'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_REFDIV = 6'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFIN = 16'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFFB = 16'h0;
parameter PMA_CMN_TXPLL_JA_2_TXPLL_JA_SYNCCNTMAX = 32'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_CNTOFFSET = 16'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_TARGETCNT = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_OTDLY = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FMI = 8'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FKI = 5'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_DELAYK = 24'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_FDONLY = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_ONTARGETOV = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_PROGRAM = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_FRAC_PRESET = 24'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_PRESET_EN = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_HOLD = 1'h0;
parameter PMA_CMN_TXPLL_JA_9_TXPLL_JA_INT_PRESET = 12'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_EXT = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DOWNSPREAD = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DISABLE_SSCG = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SPREAD = 5'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DIVVAL = 6'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_EXT_MAXADDR = 8'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SEL_EXTWAVE = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_SEL = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_FILTER = 1'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL85 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL100 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL150 = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CAL_TERM = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CURRENT_PROG = 2'h0;
parameter PMA_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_DES_CDR_CTRL_1_DCFBEN_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR0 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR1 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR2 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR3 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_CMRTRIM_CDR = 3'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT3_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_SEL = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_EN = 1'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT3_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CMRTRIM_DFEEM = 3'h0;
parameter PMA_DES_DFEEM_CTRL_2_H1 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H2 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H3 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H4 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_3_H5 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_DCFBEN_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE0 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE1 = 5'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_TH_DFE = 8'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_GRAY_DFE = 3'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_SEL = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_EN = 1'h0;
parameter PMA_DES_EM_CTRL_1_DCFBEN_EM = 1'h0;
parameter PMA_DES_EM_CTRL_1_H0EM0 = 5'h0;
parameter PMA_DES_EM_CTRL_1_H0EM1 = 5'h0;
parameter PMA_DES_EM_CTRL_1_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_TH_EM = 8'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_GRAY_EM = 3'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_SEL = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_EN = 1'h0;
parameter PMA_DES_RTL_EM_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_RTL_EM_EYEMONITOR_SAMPLE_COUNT = 12'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE_FROMFAB = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTSEL = 3'h0;
parameter PMA_DES_TEST_BUS_RXDTESTEN = 1'h0;
parameter PMA_DES_TEST_BUS_RXDTESTSEL = 3'h0;
parameter PMA_DES_CLK_CTRL_RXBYPASSEN = 1'h0;
parameter PMA_DES_RSTPD_RXPD = 1'h0;
parameter PMA_DES_RSTPD_RESETDES = 1'h0;
parameter PMA_DES_RSTPD_PDDFE = 1'h0;
parameter PMA_DES_RSTPD_PDEM = 1'h0;
parameter PMA_DES_RSTPD_RCVEN = 1'h0;
parameter PMA_DES_RSTPD_RESET_FIFO = 1'h0;
parameter PMA_DES_RTL_ERR_CHK_READ_ERROR = 1'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_RANGE = 2'h0;
parameter PMA_SER_CTRL_CMSTEP_VALUE = 1'h0;
parameter PMA_SER_CTRL_CMSTEP = 1'h0;
parameter PMA_SER_CTRL_NLPBK_EN = 1'h0;
parameter PMA_SER_CTRL_HSLPBKEN = 1'h0;
parameter PMA_SER_CTRL_HSLPBK_SEL = 3'h0;
parameter PMA_SER_RSTPD_RESETSEREN = 1'h0;
parameter PMA_SER_RSTPD_RESETSER = 1'h0;
parameter PMA_SER_RSTPD_TXPD = 1'h0;
parameter PMA_SER_DRV_BYP_BYPASSSER = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_COUNT_THRESHOLD = 14'h0;
parameter PMA_SER_RXDET_CTRL_RX_DETECT_EN = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_START = 1'h0;
parameter PMA_SER_STATIC_LSB_STATIC_PATTERN_LSB = 20'h0;
parameter PMA_SER_STATIC_MSB_STATIC_PATTERN_MSB = 20'h0;
parameter PMA_SER_TEST_BUS_TXATESTSEL = 3'h0;
parameter PMA_SER_TEST_BUS_DTESTEN_RTL = 1'h0;
parameter PMA_SER_TEST_BUS_DTESTSEL_RTL = 4'h0;
parameter PMA_SER_TEST_BUS_JTAG_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_TEST_BUS_PRBSERR_TO_DTEST_SEL = 2'h0;
parameter PMA_SER_TEST_BUS_RXPKDETOUT_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_3P5DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_6P0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_HS_0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_3P5DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_6P0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_HS_0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_3P5DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_6P0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_HS_0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_3P5DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_6P0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_HS_0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_3P5DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_6P0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_HS_0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_1 = 6'h0;
parameter PMA_SERDES_RTL_CTRL_RESET_RTL = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_PRBSMODE = 3'h0;
parameter PMA_SERDES_RTL_CTRL_TX_DATA_SELECT = 3'h0;
parameter PMA_SERDES_RTL_CTRL_RX_DATA_SELECT = 2'h0;
parameter PMA_SERDES_RTL_CTRL_RX_FIFO_INPUT_SELECT_NEIGHBOR = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_EYEMONITOR_COMPARISON_DATA_SEL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_CEN = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_RESET = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_FE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_DFE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_OFFSET_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_WAIT_PERIOD_GOOD_LOCK = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_CTLE_OFFSET_CAL = 6'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_GOOD_LOCK = 8'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_BYPASS_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_EM_ONLY = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCEH = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_PHASE_DIRECTION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_CLKDIV = 4'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FREQUENCY = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCE_CDR_COEFFS = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_NUM_COEFFS = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_DFE_CYCLES = 5'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_AREA_CYCLES = 2'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SET_DFE_COEFFS_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_ERROR_THR_CHANNEL_ALIGN = 12'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL0_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL1_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL2_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL3_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL4_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL5_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL6_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL7_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_AREA_COMPUTE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CHANNEL_ALIGN_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FE_CALIBRATION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FULL_CAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_GOOD_LOCK_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_DFE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0CDR = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H1 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H2 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H3 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H4 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H5 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CDRCTLE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RCVEN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_SLIP_DES_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_LOCK_OVERRIDE = 1'h0;
parameter PCSCMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_V_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_0_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_1_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_2_SEL = 5'h0;
parameter PCSCMN_QRST_R0_QRST0_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST0_RST_SEL = 4'h0;
parameter PCSCMN_QRST_R0_QRST1_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST1_RST_SEL = 4'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_MODE = 3'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_X = 2'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_Y = 2'h0;
parameter PCS_SOFT_RESET_NV_MAP = 1'h0;
parameter PCS_SOFT_RESET_V_MAP = 1'h0;
parameter PCS_LFWF_R0_RXFWF_WMARK = 1'h0;
parameter PCS_LFWF_R0_TXFWF_WMARK = 1'h0;
parameter PCS_LPIP_R0_PIPE_SHAREDPLL = 1'h0;
parameter PCS_LPIP_R0_PIPE_INITIALIZATION_DONE = 1'h0;
parameter PCS_LPIP_R0_PIPE_OOB_IDLEBURST_TIMING = 2'h0;
parameter PCS_L64_R0_L64_CFG_BER_1US_TIMER_VAL = 11'h0;
parameter PCS_L64_R1_L64_BYPASS_TEST = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATTERN_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_TYPE_SEL = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PRBS31_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_DATA_SEL = 1'h0;
parameter PCS_L64_R2_L64_SEED_A_VALUE_LO32 = 32'h0;
parameter PCS_L64_R3_L64_SEED_A_VALUE_HI26 = 26'h0;
parameter PCS_L64_R4_L64_SEED_B_VALUE_LO32 = 32'h0;
parameter PCS_L64_R5_L64_SEED_B_VALUE_HI26 = 26'h0;
parameter PCS_L64_R6_L64_TX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R6_L64_TX_ADD_UI = 16'h0;
parameter PCS_L64_R7_L64_RX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R7_L64_RX_ADD_UI = 16'h0;
parameter PCS_L8_R0_L8_TXENCSWAPSEL = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_CDR_RESETS_PCS_RX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_RXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_PLL_RESETS_PCS_TX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_TXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PIPE_RESET = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_RX = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_TX = 1'h0;
parameter PCS_OOB_R0_OOB_BURST_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_BURST_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R2_TXOOB_PROG_DATA_L32B = 32'h0;
parameter PCS_OOB_R3_TXOOB_PROG_DATA_H8B = 8'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_FLOCK_SEL = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R1_RXBEACON_MAX_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R1_TXBEACON_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R2_PD_PLL_CNT = 8'h0;
parameter PCS_PMA_CTRL_R2_PIPE_RATE_INIT = 2'h0;
parameter PCS_PMA_CTRL_R2_FAB_DRIVES_TXPADS = 1'h0;
parameter PCS_MSTR_CTRL_LANE_MSTR = 2'h0;
parameter MAIN_SOFT_RESET_PERIPH = 1'h0;
parameter MAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter MAIN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_DES_CDR_CTRL_3_CST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_CST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RXDRV_CDR = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST2_DFEEM = 2'h0;
parameter PMA_DES_DFE_CTRL_2_RXDRV_DFE = 2'h0;
parameter PMA_DES_DFE_CTRL_2_CTLEEN_DFE = 1'h0;
parameter PMA_DES_EM_CTRL_2_RXDRV_EM = 2'h0;
parameter PMA_DES_EM_CTRL_2_CTLEEN_EM = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM = 4'h0;
parameter PMA_DES_IN_TERM_RXTEN = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM_SEL = 2'h0;
parameter PMA_DES_IN_TERM_ACCOUPLE_RXVCM_EN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETEN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETRANGE = 1'h0;
parameter PMA_DES_PKDET_RXPKDET_LOW_THRESHOLD = 3'h0;
parameter PMA_DES_PKDET_RXPKDET_HIGH_THRESHOLD = 3'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_MODE = 1'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE = 2'h0;
parameter PMA_DES_RTL_LOCK_CTRL_FDET_SAMPLE_PERIODS = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_RANGE = 2'h0;
parameter PMA_DES_RXPLL_DIV_CDR_GAIN = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTEN = 1'h0;
parameter PMA_DES_CLK_CTRL_RXREFCLK_SEL = 3'h0;
parameter PMA_DES_CLK_CTRL_DESMODE = 3'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKEN = 1'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKDIVEN = 1'h0;
parameter PMA_SER_CTRL_TXVBGREF_SEL = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIVEN = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIV = 2'h0;
parameter PMA_SER_CLK_CTRL_TXBITCLKSEL = 1'h0;
parameter PMA_SER_CLK_CTRL_SERMODE = 3'h0;
parameter PMA_SER_DRV_BYP_BYPASS_VALUE = 8'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT_RTL = 2'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_STEP_WAIT_COUNT = 5'h0;
parameter PMA_SER_TERM_CTRL_TXCM_LEVEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXTEN = 1'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM_SEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM = 4'h0;
parameter PMA_SER_TEST_BUS_TXATESTEN = 1'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDEL = 16'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDATA_INV = 8'h0;
parameter PMA_SER_DRV_CTRL_TXDRVTRIM = 24'h0;
parameter PMA_SER_DRV_CTRL_TXDRV = 3'h0;
parameter PMA_SER_DRV_CTRL_TXITRIM = 2'h0;
parameter PMA_SER_DRV_CTRL_TXODRV = 2'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDRV_CTRL_SEL = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXODRV_BOOSTER = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXMARGIN = 3'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXSWING = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS_BEACON = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_HALF_RATE10BIT = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_HALF_RATE10BIT = 1'h0;
parameter PCS_SOFT_RESET_PERIPH = 1'h0;
parameter PCS_LFWF_R0_RXFWF_RATIO = 2'h0;
parameter PCS_LFWF_R0_TXFWF_RATIO = 2'h0;
parameter PCS_LOVR_R0_FAB_IFC_MODE = 4'h0;
parameter PCS_LOVR_R0_PCSPMA_IFC_MODE = 4'h0;
parameter PCS_LPIP_R0_PIPEENABLE = 1'h0;
parameter PCS_LPIP_R0_PIPEMODE = 1'h0;
parameter PCS_LPIP_R0_PIPE_PCIE_HC = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_SCRAMBLER = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_DISPARITY = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_GEARBOX = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_64B67B = 1'h0;
parameter PCS_L64_R0_L64_CFG_BER_MON_EN = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_8B_MODE = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C49 = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C82 = 1'h0;
parameter PCS_L8_R0_L8_GEARMODE = 2'h0;
parameter PCS_LNTV_R0_LNTV_RX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_RX_IN_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_RX_MODE = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_OUT_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_TX_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_TMG_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_PCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_PCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_RCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_PIPE = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_LCL = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_OUT = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FAB_EPCS_PMA_RESET_B_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_REF_CLK_N(
       Y,
       PAD_N,
       REFCLK
    ) ;
/* synthesis syn_black_box

syn_trr0 = " PAD_N->REFCLK = 1.438"
syn_tff0 = " PAD_N->REFCLK = 1.438"
syn_trr1 = " PAD_N->Y = 1.438"
syn_tff1 = " PAD_N->Y = 1.438"
*/
/* synthesis black_box_pad_pin ="PAD_N" */
output Y;
input  PAD_N;
output REFCLK;
parameter IOSTD = "";
parameter CLKBUF_DUALCLK1_MODE = 2'h0;
parameter CLKBUF_DUALCLK1_ENTERM = 2'h0;
parameter CLKBUF_DUALCLK0_MODE = 2'h0;
parameter CLKBUF_DUALCLK0_ENTERM = 2'h0;
parameter CLKBUF_DUALCLK1_EN_HYST = 1'h0;
parameter CLKBUF_DUALCLK0_EN_HYST = 1'h0;
parameter CLKBUF_CLKBUF_EN_RDIFF = 1'h0;
parameter CLKBUF_CLKBUF_EN_UDRIVE_N = 1'h0;
parameter CLKBUF_CLKBUF_EN_UDRIVE_P = 1'h0;
parameter CLKBUF_CLKBUF_EN_PULLUP = 1'h0;
parameter CLKBUF_CLKBUF_EN_APAD = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_REF_CLK_P(
       Y,
       PAD_P,
       REFCLK
    ) ;
/* synthesis syn_black_box

syn_trr0 = " PAD_P->REFCLK = 1.438"
syn_tff0 = " PAD_P->REFCLK = 1.438"
syn_trr1 = " PAD_P->Y = 1.438"
syn_tff1 = " PAD_P->Y = 1.438"
*/
/* synthesis black_box_pad_pin ="PAD_P" */
output Y;
input  PAD_P;
output REFCLK;
parameter IOSTD = "";
parameter CLKBUF_DUALCLK1_MODE = 2'h0;
parameter CLKBUF_DUALCLK1_ENTERM = 2'h0;
parameter CLKBUF_DUALCLK0_MODE = 2'h0;
parameter CLKBUF_DUALCLK0_ENTERM = 2'h0;
parameter CLKBUF_DUALCLK1_EN_HYST = 1'h0;
parameter CLKBUF_DUALCLK0_EN_HYST = 1'h0;
parameter CLKBUF_CLKBUF_EN_RDIFF = 1'h0;
parameter CLKBUF_CLKBUF_EN_UDRIVE_N = 1'h0;
parameter CLKBUF_CLKBUF_EN_UDRIVE_P = 1'h0;
parameter CLKBUF_CLKBUF_EN_PULLUP = 1'h0;
parameter CLKBUF_CLKBUF_EN_APAD = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_REF_CLK(
       Y,
       PAD_P,
       PAD_N,
       REFCLK_0,
       REFCLK_1
    ) ;
/* synthesis syn_black_box

syn_trr0 = " PAD_N->REFCLK_0 = 1.438"
syn_tff0 = " PAD_N->REFCLK_0 = 1.438"
syn_trr1 = " PAD_N->REFCLK_1 = 1.438"
syn_tff1 = " PAD_N->REFCLK_1 = 1.438"
syn_trr2 = " PAD_N->Y[0] = 1.438"
syn_tff2 = " PAD_N->Y[0] = 1.438"
syn_trr3 = " PAD_N->Y[1] = 1.438"
syn_tff3 = " PAD_N->Y[1] = 1.438"
syn_trr4 = " PAD_P->REFCLK_0 = 1.438"
syn_tff4 = " PAD_P->REFCLK_0 = 1.438"
syn_trr5 = " PAD_P->REFCLK_1 = 1.438"
syn_tff5 = " PAD_P->REFCLK_1 = 1.438"
syn_trr6 = " PAD_P->Y[0] = 1.438"
syn_tff6 = " PAD_P->Y[0] = 1.438"
syn_trr7 = " PAD_P->Y[1] = 1.438"
syn_tff7 = " PAD_P->Y[1] = 1.438"
*/
/* synthesis black_box_pad_pin ="PAD_P,PAD_N" */
output [1:0] Y;
input  PAD_P;
input  PAD_N;
output REFCLK_0;
output REFCLK_1;
parameter IOSTD = "";
parameter CLKBUF_DUALCLK1_MODE = 2'h0;
parameter CLKBUF_DUALCLK1_ENTERM = 2'h0;
parameter CLKBUF_DUALCLK0_MODE = 2'h0;
parameter CLKBUF_DUALCLK0_ENTERM = 2'h0;
parameter CLKBUF_DUALCLK1_EN_HYST = 1'h0;
parameter CLKBUF_DUALCLK0_EN_HYST = 1'h0;
parameter CLKBUF_CLKBUF_EN_RDIFF = 1'h0;
parameter CLKBUF_CLKBUF_EN_UDRIVE_N = 1'h0;
parameter CLKBUF_CLKBUF_EN_UDRIVE_P = 1'h0;
parameter CLKBUF_CLKBUF_EN_PULLUP = 1'h0;
parameter CLKBUF_CLKBUF_EN_APAD = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_TEST(
       RX_CLK_R,
       TX_CLK_R
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
output RX_CLK_R;
output TX_CLK_R;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR_VV(
       RX_REF_CLK,
       TX_DATA,
       RX_FWF_EN,
       TX_FWF_EN,
       RX_SLIP,
       PCS_ARST_N,
       PMA_ARST_N,
       RX_FWF_CLK,
       TX_FWF_CLK,
       RX_DATA,
       TX_CLK_STABLE,
       RX_VAL,
       RX_READY,
       RX_IDLE,
       RX_CLK_R,
       TX_CLK_R,
       RX_N,
       RX_P,
       TX_N,
       TX_P
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " RX_FWF_EN->RX_FWF_CLK = 0.916"
syn_tsu1 = " TX_DATA[0]->TX_FWF_CLK = 1.212"
syn_tsu2 = " TX_DATA[10]->TX_FWF_CLK = 1.181"
syn_tsu3 = " TX_DATA[11]->TX_FWF_CLK = 1.196"
syn_tsu4 = " TX_DATA[12]->TX_FWF_CLK = 1.16"
syn_tsu5 = " TX_DATA[13]->TX_FWF_CLK = 1.17"
syn_tsu6 = " TX_DATA[14]->TX_FWF_CLK = 1.177"
syn_tsu7 = " TX_DATA[15]->TX_FWF_CLK = 1.251"
syn_tsu8 = " TX_DATA[16]->TX_FWF_CLK = 1.156"
syn_tsu9 = " TX_DATA[17]->TX_FWF_CLK = 1.255"
syn_tsu10 = " TX_DATA[18]->TX_FWF_CLK = 1.239"
syn_tsu11 = " TX_DATA[19]->TX_FWF_CLK = 1.214"
syn_tsu12 = " TX_DATA[1]->TX_FWF_CLK = 1.201"
syn_tsu13 = " TX_DATA[20]->TX_FWF_CLK = 1.201"
syn_tsu14 = " TX_DATA[21]->TX_FWF_CLK = 1.273"
syn_tsu15 = " TX_DATA[22]->TX_FWF_CLK = 1.231"
syn_tsu16 = " TX_DATA[23]->TX_FWF_CLK = 1.205"
syn_tsu17 = " TX_DATA[24]->TX_FWF_CLK = 1.227"
syn_tsu18 = " TX_DATA[25]->TX_FWF_CLK = 1.276"
syn_tsu19 = " TX_DATA[26]->TX_FWF_CLK = 1.24"
syn_tsu20 = " TX_DATA[27]->TX_FWF_CLK = 1.176"
syn_tsu21 = " TX_DATA[28]->TX_FWF_CLK = 1.259"
syn_tsu22 = " TX_DATA[29]->TX_FWF_CLK = 1.178"
syn_tsu23 = " TX_DATA[2]->TX_FWF_CLK = 1.174"
syn_tsu24 = " TX_DATA[30]->TX_FWF_CLK = 1.226"
syn_tsu25 = " TX_DATA[31]->TX_FWF_CLK = 1.207"
syn_tsu26 = " TX_DATA[32]->TX_FWF_CLK = 1.189"
syn_tsu27 = " TX_DATA[33]->TX_FWF_CLK = 1.158"
syn_tsu28 = " TX_DATA[34]->TX_FWF_CLK = 1.19"
syn_tsu29 = " TX_DATA[35]->TX_FWF_CLK = 1.251"
syn_tsu30 = " TX_DATA[36]->TX_FWF_CLK = 1.208"
syn_tsu31 = " TX_DATA[37]->TX_FWF_CLK = 1.189"
syn_tsu32 = " TX_DATA[38]->TX_FWF_CLK = 1.182"
syn_tsu33 = " TX_DATA[39]->TX_FWF_CLK = 1.27"
syn_tsu34 = " TX_DATA[3]->TX_FWF_CLK = 1.229"
syn_tsu35 = " TX_DATA[40]->TX_FWF_CLK = 1.228"
syn_tsu36 = " TX_DATA[41]->TX_FWF_CLK = 1.255"
syn_tsu37 = " TX_DATA[42]->TX_FWF_CLK = 1.274"
syn_tsu38 = " TX_DATA[43]->TX_FWF_CLK = 1.158"
syn_tsu39 = " TX_DATA[44]->TX_FWF_CLK = 1.154"
syn_tsu40 = " TX_DATA[45]->TX_FWF_CLK = 1.262"
syn_tsu41 = " TX_DATA[46]->TX_FWF_CLK = 1.22"
syn_tsu42 = " TX_DATA[47]->TX_FWF_CLK = 1.253"
syn_tsu43 = " TX_DATA[48]->TX_FWF_CLK = 1.175"
syn_tsu44 = " TX_DATA[49]->TX_FWF_CLK = 1.236"
syn_tsu45 = " TX_DATA[4]->TX_FWF_CLK = 1.188"
syn_tsu46 = " TX_DATA[50]->TX_FWF_CLK = 1.178"
syn_tsu47 = " TX_DATA[51]->TX_FWF_CLK = 1.146"
syn_tsu48 = " TX_DATA[52]->TX_FWF_CLK = 1.213"
syn_tsu49 = " TX_DATA[53]->TX_FWF_CLK = 1.165"
syn_tsu50 = " TX_DATA[54]->TX_FWF_CLK = 1.226"
syn_tsu51 = " TX_DATA[55]->TX_FWF_CLK = 1.162"
syn_tsu52 = " TX_DATA[56]->TX_FWF_CLK = 1.214"
syn_tsu53 = " TX_DATA[57]->TX_FWF_CLK = 1.191"
syn_tsu54 = " TX_DATA[58]->TX_FWF_CLK = 1.268"
syn_tsu55 = " TX_DATA[59]->TX_FWF_CLK = 1.24"
syn_tsu56 = " TX_DATA[5]->TX_FWF_CLK = 1.189"
syn_tsu57 = " TX_DATA[60]->TX_FWF_CLK = 1.174"
syn_tsu58 = " TX_DATA[61]->TX_FWF_CLK = 1.224"
syn_tsu59 = " TX_DATA[62]->TX_FWF_CLK = 1.154"
syn_tsu60 = " TX_DATA[63]->TX_FWF_CLK = 1.156"
syn_tsu61 = " TX_DATA[64]->TX_FWF_CLK = 1.18"
syn_tsu62 = " TX_DATA[65]->TX_FWF_CLK = 1.233"
syn_tsu63 = " TX_DATA[66]->TX_FWF_CLK = 1.182"
syn_tsu64 = " TX_DATA[67]->TX_FWF_CLK = 1.197"
syn_tsu65 = " TX_DATA[68]->TX_FWF_CLK = 1.188"
syn_tsu66 = " TX_DATA[69]->TX_FWF_CLK = 1.211"
syn_tsu67 = " TX_DATA[6]->TX_FWF_CLK = 1.199"
syn_tsu68 = " TX_DATA[70]->TX_FWF_CLK = 1.239"
syn_tsu69 = " TX_DATA[71]->TX_FWF_CLK = 1.173"
syn_tsu70 = " TX_DATA[72]->TX_FWF_CLK = 1.211"
syn_tsu71 = " TX_DATA[73]->TX_FWF_CLK = 1.203"
syn_tsu72 = " TX_DATA[74]->TX_FWF_CLK = 1.17"
syn_tsu73 = " TX_DATA[75]->TX_FWF_CLK = 1.178"
syn_tsu74 = " TX_DATA[76]->TX_FWF_CLK = 1.258"
syn_tsu75 = " TX_DATA[77]->TX_FWF_CLK = 1.241"
syn_tsu76 = " TX_DATA[78]->TX_FWF_CLK = 1.176"
syn_tsu77 = " TX_DATA[79]->TX_FWF_CLK = 1.195"
syn_tsu78 = " TX_DATA[7]->TX_FWF_CLK = 1.17"
syn_tsu79 = " TX_DATA[80]->TX_FWF_CLK = 1.175"
syn_tsu80 = " TX_DATA[81]->TX_FWF_CLK = 1.175"
syn_tsu81 = " TX_DATA[82]->TX_FWF_CLK = 1.158"
syn_tsu82 = " TX_DATA[83]->TX_FWF_CLK = 1.255"
syn_tsu83 = " TX_DATA[84]->TX_FWF_CLK = 1.232"
syn_tsu84 = " TX_DATA[85]->TX_FWF_CLK = 1.154"
syn_tsu85 = " TX_DATA[86]->TX_FWF_CLK = 1.247"
syn_tsu86 = " TX_DATA[87]->TX_FWF_CLK = 1.17"
syn_tsu87 = " TX_DATA[8]->TX_FWF_CLK = 1.25"
syn_tsu88 = " TX_DATA[9]->TX_FWF_CLK = 1.177"
syn_tsu89 = " TX_FWF_EN->TX_FWF_CLK = 1.043"
syn_tco0 = " RX_FWF_CLK->RX_DATA[0] = 2.954"
syn_tco1 = " RX_FWF_CLK->RX_DATA[10] = 2.830"
syn_tco2 = " RX_FWF_CLK->RX_DATA[11] = 2.832"
syn_tco3 = " RX_FWF_CLK->RX_DATA[12] = 2.867"
syn_tco4 = " RX_FWF_CLK->RX_DATA[13] = 2.858"
syn_tco5 = " RX_FWF_CLK->RX_DATA[14] = 2.835"
syn_tco6 = " RX_FWF_CLK->RX_DATA[15] = 2.826"
syn_tco7 = " RX_FWF_CLK->RX_DATA[16] = 2.858"
syn_tco8 = " RX_FWF_CLK->RX_DATA[17] = 2.841"
syn_tco9 = " RX_FWF_CLK->RX_DATA[18] = 2.856"
syn_tco10 = " RX_FWF_CLK->RX_DATA[19] = 2.862"
syn_tco11 = " RX_FWF_CLK->RX_DATA[1] = 2.937"
syn_tco12 = " RX_FWF_CLK->RX_DATA[20] = 2.845"
syn_tco13 = " RX_FWF_CLK->RX_DATA[21] = 2.879"
syn_tco14 = " RX_FWF_CLK->RX_DATA[22] = 2.877"
syn_tco15 = " RX_FWF_CLK->RX_DATA[23] = 2.852"
syn_tco16 = " RX_FWF_CLK->RX_DATA[24] = 2.830"
syn_tco17 = " RX_FWF_CLK->RX_DATA[25] = 2.865"
syn_tco18 = " RX_FWF_CLK->RX_DATA[26] = 2.857"
syn_tco19 = " RX_FWF_CLK->RX_DATA[27] = 2.875"
syn_tco20 = " RX_FWF_CLK->RX_DATA[28] = 2.852"
syn_tco21 = " RX_FWF_CLK->RX_DATA[29] = 2.875"
syn_tco22 = " RX_FWF_CLK->RX_DATA[2] = 2.928"
syn_tco23 = " RX_FWF_CLK->RX_DATA[30] = 2.844"
syn_tco24 = " RX_FWF_CLK->RX_DATA[31] = 2.860"
syn_tco25 = " RX_FWF_CLK->RX_DATA[32] = 2.866"
syn_tco26 = " RX_FWF_CLK->RX_DATA[33] = 2.886"
syn_tco27 = " RX_FWF_CLK->RX_DATA[34] = 2.877"
syn_tco28 = " RX_FWF_CLK->RX_DATA[35] = 2.879"
syn_tco29 = " RX_FWF_CLK->RX_DATA[36] = 2.883"
syn_tco30 = " RX_FWF_CLK->RX_DATA[37] = 2.854"
syn_tco31 = " RX_FWF_CLK->RX_DATA[38] = 2.855"
syn_tco32 = " RX_FWF_CLK->RX_DATA[39] = 2.883"
syn_tco33 = " RX_FWF_CLK->RX_DATA[3] = 2.964"
syn_tco34 = " RX_FWF_CLK->RX_DATA[40] = 2.875"
syn_tco35 = " RX_FWF_CLK->RX_DATA[41] = 2.848"
syn_tco36 = " RX_FWF_CLK->RX_DATA[42] = 2.862"
syn_tco37 = " RX_FWF_CLK->RX_DATA[43] = 2.827"
syn_tco38 = " RX_FWF_CLK->RX_DATA[44] = 2.845"
syn_tco39 = " RX_FWF_CLK->RX_DATA[45] = 2.850"
syn_tco40 = " RX_FWF_CLK->RX_DATA[46] = 2.886"
syn_tco41 = " RX_FWF_CLK->RX_DATA[47] = 2.873"
syn_tco42 = " RX_FWF_CLK->RX_DATA[48] = 2.859"
syn_tco43 = " RX_FWF_CLK->RX_DATA[49] = 2.856"
syn_tco44 = " RX_FWF_CLK->RX_DATA[4] = 2.851"
syn_tco45 = " RX_FWF_CLK->RX_DATA[50] = 2.840"
syn_tco46 = " RX_FWF_CLK->RX_DATA[51] = 2.839"
syn_tco47 = " RX_FWF_CLK->RX_DATA[52] = 2.865"
syn_tco48 = " RX_FWF_CLK->RX_DATA[53] = 2.854"
syn_tco49 = " RX_FWF_CLK->RX_DATA[54] = 2.831"
syn_tco50 = " RX_FWF_CLK->RX_DATA[55] = 2.862"
syn_tco51 = " RX_FWF_CLK->RX_DATA[56] = 2.845"
syn_tco52 = " RX_FWF_CLK->RX_DATA[57] = 2.815"
syn_tco53 = " RX_FWF_CLK->RX_DATA[58] = 2.795"
syn_tco54 = " RX_FWF_CLK->RX_DATA[59] = 2.827"
syn_tco55 = " RX_FWF_CLK->RX_DATA[5] = 2.846"
syn_tco56 = " RX_FWF_CLK->RX_DATA[60] = 2.777"
syn_tco57 = " RX_FWF_CLK->RX_DATA[61] = 2.802"
syn_tco58 = " RX_FWF_CLK->RX_DATA[62] = 2.767"
syn_tco59 = " RX_FWF_CLK->RX_DATA[63] = 2.809"
syn_tco60 = " RX_FWF_CLK->RX_DATA[64] = 2.890"
syn_tco61 = " RX_FWF_CLK->RX_DATA[65] = 2.900"
syn_tco62 = " RX_FWF_CLK->RX_DATA[66] = 2.861"
syn_tco63 = " RX_FWF_CLK->RX_DATA[67] = 2.899"
syn_tco64 = " RX_FWF_CLK->RX_DATA[68] = 2.903"
syn_tco65 = " RX_FWF_CLK->RX_DATA[69] = 2.885"
syn_tco66 = " RX_FWF_CLK->RX_DATA[6] = 2.818"
syn_tco67 = " RX_FWF_CLK->RX_DATA[70] = 2.910"
syn_tco68 = " RX_FWF_CLK->RX_DATA[71] = 2.909"
syn_tco69 = " RX_FWF_CLK->RX_DATA[72] = 2.938"
syn_tco70 = " RX_FWF_CLK->RX_DATA[73] = 2.877"
syn_tco71 = " RX_FWF_CLK->RX_DATA[74] = 2.897"
syn_tco72 = " RX_FWF_CLK->RX_DATA[75] = 2.886"
syn_tco73 = " RX_FWF_CLK->RX_DATA[76] = 2.896"
syn_tco74 = " RX_FWF_CLK->RX_DATA[77] = 2.892"
syn_tco75 = " RX_FWF_CLK->RX_DATA[78] = 2.871"
syn_tco76 = " RX_FWF_CLK->RX_DATA[79] = 2.862"
syn_tco77 = " RX_FWF_CLK->RX_DATA[7] = 2.868"
syn_tco78 = " RX_FWF_CLK->RX_DATA[80] = 2.898"
syn_tco79 = " RX_FWF_CLK->RX_DATA[81] = 2.904"
syn_tco80 = " RX_FWF_CLK->RX_DATA[82] = 2.890"
syn_tco81 = " RX_FWF_CLK->RX_DATA[83] = 2.903"
syn_tco82 = " RX_FWF_CLK->RX_DATA[84] = 2.873"
syn_tco83 = " RX_FWF_CLK->RX_DATA[85] = 2.884"
syn_tco84 = " RX_FWF_CLK->RX_DATA[86] = 2.880"
syn_tco85 = " RX_FWF_CLK->RX_DATA[87] = 2.911"
syn_tco86 = " RX_FWF_CLK->RX_DATA[8] = 2.841"
syn_tco87 = " RX_FWF_CLK->RX_DATA[9] = 2.840"
syn_tco88 = " RX_FWF_CLK->RX_VAL = 2.295"
*/
/* synthesis black_box_pad_pin ="RX_N,RX_P,TX_N,TX_P" */
input  RX_REF_CLK;
input  [87:0] TX_DATA;
input  RX_FWF_EN;
input  TX_FWF_EN;
input  RX_SLIP;
input  PCS_ARST_N;
input  PMA_ARST_N;
input  RX_FWF_CLK;
input  TX_FWF_CLK;
output [87:0] RX_DATA;
output TX_CLK_STABLE;
output RX_VAL;
output RX_READY;
output RX_IDLE;
output RX_CLK_R;
output TX_CLK_R;
input  RX_N;
input  RX_P;
output TX_N;
output TX_P;
parameter MAIN_QMUX_R0_QRST0_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST1_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST2_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST3_SRC = 3'h0;
parameter MSC_UNIQUE = "";
parameter JA_REF_CLK_SEL = "";
parameter DATA_RATE = 0.0;
parameter REG_FILE = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter GPSSMAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_V_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_PERIPH = 1'h0;
parameter GPSSMAIN_SPARE_SCRATCHPAD = 8'h0;
parameter GPSSMAIN_SPARE_SPARE_CTRL = 24'h0;
parameter PMA_CMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_RDIFF = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_P = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_N = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_PULLUP = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_APAD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_BWSEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_VBGREF_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FBDIV_SEL = 2'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_DSMPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PHASESTEPAMOUNT = 8'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_STEP_PHASE = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_AUXDIVPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESETEN = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESET = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL_TXPLL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FOUTAUXDIV2_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_JA_FREF_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN01_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN23_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_UP_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_DN_SEL = 3'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_AUXDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_FBDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_FRAC = 24'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_REFDIV = 6'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFIN = 16'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFFB = 16'h0;
parameter PMA_CMN_TXPLL_JA_2_TXPLL_JA_SYNCCNTMAX = 32'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_CNTOFFSET = 16'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_TARGETCNT = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_OTDLY = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FMI = 8'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FKI = 5'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_DELAYK = 24'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_FDONLY = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_ONTARGETOV = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_PROGRAM = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_FRAC_PRESET = 24'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_PRESET_EN = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_HOLD = 1'h0;
parameter PMA_CMN_TXPLL_JA_9_TXPLL_JA_INT_PRESET = 12'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_EXT = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DOWNSPREAD = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DISABLE_SSCG = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SPREAD = 5'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DIVVAL = 6'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_EXT_MAXADDR = 8'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SEL_EXTWAVE = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_SEL = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_FILTER = 1'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL85 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL100 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL150 = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CAL_TERM = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CURRENT_PROG = 2'h0;
parameter PMA_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_DES_CDR_CTRL_1_DCFBEN_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR0 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR1 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR2 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR3 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_CMRTRIM_CDR = 3'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT3_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_SEL = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_EN = 1'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT3_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CMRTRIM_DFEEM = 3'h0;
parameter PMA_DES_DFEEM_CTRL_2_H1 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H2 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H3 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H4 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_3_H5 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_DCFBEN_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE0 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE1 = 5'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_TH_DFE = 8'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_GRAY_DFE = 3'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_SEL = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_EN = 1'h0;
parameter PMA_DES_EM_CTRL_1_DCFBEN_EM = 1'h0;
parameter PMA_DES_EM_CTRL_1_H0EM0 = 5'h0;
parameter PMA_DES_EM_CTRL_1_H0EM1 = 5'h0;
parameter PMA_DES_EM_CTRL_1_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_TH_EM = 8'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_GRAY_EM = 3'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_SEL = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_EN = 1'h0;
parameter PMA_DES_RTL_EM_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_RTL_EM_EYEMONITOR_SAMPLE_COUNT = 12'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE_FROMFAB = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTSEL = 3'h0;
parameter PMA_DES_TEST_BUS_RXDTESTEN = 1'h0;
parameter PMA_DES_TEST_BUS_RXDTESTSEL = 3'h0;
parameter PMA_DES_CLK_CTRL_RXBYPASSEN = 1'h0;
parameter PMA_DES_RSTPD_RXPD = 1'h0;
parameter PMA_DES_RSTPD_RESETDES = 1'h0;
parameter PMA_DES_RSTPD_PDDFE = 1'h0;
parameter PMA_DES_RSTPD_PDEM = 1'h0;
parameter PMA_DES_RSTPD_RCVEN = 1'h0;
parameter PMA_DES_RSTPD_RESET_FIFO = 1'h0;
parameter PMA_DES_RTL_ERR_CHK_READ_ERROR = 1'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_RANGE = 2'h0;
parameter PMA_SER_CTRL_CMSTEP_VALUE = 1'h0;
parameter PMA_SER_CTRL_CMSTEP = 1'h0;
parameter PMA_SER_CTRL_NLPBK_EN = 1'h0;
parameter PMA_SER_CTRL_HSLPBKEN = 1'h0;
parameter PMA_SER_CTRL_HSLPBK_SEL = 3'h0;
parameter PMA_SER_RSTPD_RESETSEREN = 1'h0;
parameter PMA_SER_RSTPD_RESETSER = 1'h0;
parameter PMA_SER_RSTPD_TXPD = 1'h0;
parameter PMA_SER_DRV_BYP_BYPASSSER = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_COUNT_THRESHOLD = 14'h0;
parameter PMA_SER_RXDET_CTRL_RX_DETECT_EN = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_START = 1'h0;
parameter PMA_SER_STATIC_LSB_STATIC_PATTERN_LSB = 20'h0;
parameter PMA_SER_STATIC_MSB_STATIC_PATTERN_MSB = 20'h0;
parameter PMA_SER_TEST_BUS_TXATESTSEL = 3'h0;
parameter PMA_SER_TEST_BUS_DTESTEN_RTL = 1'h0;
parameter PMA_SER_TEST_BUS_DTESTSEL_RTL = 4'h0;
parameter PMA_SER_TEST_BUS_JTAG_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_TEST_BUS_PRBSERR_TO_DTEST_SEL = 2'h0;
parameter PMA_SER_TEST_BUS_RXPKDETOUT_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_3P5DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_6P0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_HS_0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_3P5DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_6P0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_HS_0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_3P5DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_6P0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_HS_0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_3P5DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_6P0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_HS_0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_3P5DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_6P0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_HS_0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_1 = 6'h0;
parameter PMA_SERDES_RTL_CTRL_RESET_RTL = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_PRBSMODE = 3'h0;
parameter PMA_SERDES_RTL_CTRL_TX_DATA_SELECT = 3'h0;
parameter PMA_SERDES_RTL_CTRL_RX_DATA_SELECT = 2'h0;
parameter PMA_SERDES_RTL_CTRL_RX_FIFO_INPUT_SELECT_NEIGHBOR = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_EYEMONITOR_COMPARISON_DATA_SEL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_CEN = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_RESET = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_FE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_DFE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_OFFSET_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_WAIT_PERIOD_GOOD_LOCK = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_CTLE_OFFSET_CAL = 6'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_GOOD_LOCK = 8'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_BYPASS_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_EM_ONLY = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCEH = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_PHASE_DIRECTION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_CLKDIV = 4'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FREQUENCY = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCE_CDR_COEFFS = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_NUM_COEFFS = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_DFE_CYCLES = 5'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_AREA_CYCLES = 2'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SET_DFE_COEFFS_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_ERROR_THR_CHANNEL_ALIGN = 12'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL0_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL1_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL2_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL3_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL4_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL5_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL6_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL7_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_AREA_COMPUTE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CHANNEL_ALIGN_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FE_CALIBRATION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FULL_CAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_GOOD_LOCK_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_DFE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0CDR = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H1 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H2 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H3 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H4 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H5 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CDRCTLE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RCVEN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_SLIP_DES_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_LOCK_OVERRIDE = 1'h0;
parameter PCSCMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_V_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_0_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_1_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_2_SEL = 5'h0;
parameter PCSCMN_QRST_R0_QRST0_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST0_RST_SEL = 4'h0;
parameter PCSCMN_QRST_R0_QRST1_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST1_RST_SEL = 4'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_MODE = 3'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_X = 2'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_Y = 2'h0;
parameter PCS_SOFT_RESET_NV_MAP = 1'h0;
parameter PCS_SOFT_RESET_V_MAP = 1'h0;
parameter PCS_LFWF_R0_RXFWF_WMARK = 1'h0;
parameter PCS_LFWF_R0_TXFWF_WMARK = 1'h0;
parameter PCS_LPIP_R0_PIPE_SHAREDPLL = 1'h0;
parameter PCS_LPIP_R0_PIPE_INITIALIZATION_DONE = 1'h0;
parameter PCS_LPIP_R0_PIPE_OOB_IDLEBURST_TIMING = 2'h0;
parameter PCS_L64_R0_L64_CFG_BER_1US_TIMER_VAL = 11'h0;
parameter PCS_L64_R1_L64_BYPASS_TEST = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATTERN_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_TYPE_SEL = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PRBS31_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_DATA_SEL = 1'h0;
parameter PCS_L64_R2_L64_SEED_A_VALUE_LO32 = 32'h0;
parameter PCS_L64_R3_L64_SEED_A_VALUE_HI26 = 26'h0;
parameter PCS_L64_R4_L64_SEED_B_VALUE_LO32 = 32'h0;
parameter PCS_L64_R5_L64_SEED_B_VALUE_HI26 = 26'h0;
parameter PCS_L64_R6_L64_TX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R6_L64_TX_ADD_UI = 16'h0;
parameter PCS_L64_R7_L64_RX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R7_L64_RX_ADD_UI = 16'h0;
parameter PCS_L8_R0_L8_TXENCSWAPSEL = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_CDR_RESETS_PCS_RX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_RXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_PLL_RESETS_PCS_TX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_TXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PIPE_RESET = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_RX = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_TX = 1'h0;
parameter PCS_OOB_R0_OOB_BURST_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_BURST_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R2_TXOOB_PROG_DATA_L32B = 32'h0;
parameter PCS_OOB_R3_TXOOB_PROG_DATA_H8B = 8'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_FLOCK_SEL = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R1_RXBEACON_MAX_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R1_TXBEACON_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R2_PD_PLL_CNT = 8'h0;
parameter PCS_PMA_CTRL_R2_PIPE_RATE_INIT = 2'h0;
parameter PCS_PMA_CTRL_R2_FAB_DRIVES_TXPADS = 1'h0;
parameter PCS_MSTR_CTRL_LANE_MSTR = 2'h0;
parameter MAIN_SOFT_RESET_PERIPH = 1'h0;
parameter MAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter MAIN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_DES_CDR_CTRL_3_CST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_CST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RXDRV_CDR = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST2_DFEEM = 2'h0;
parameter PMA_DES_DFE_CTRL_2_RXDRV_DFE = 2'h0;
parameter PMA_DES_DFE_CTRL_2_CTLEEN_DFE = 1'h0;
parameter PMA_DES_EM_CTRL_2_RXDRV_EM = 2'h0;
parameter PMA_DES_EM_CTRL_2_CTLEEN_EM = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM = 4'h0;
parameter PMA_DES_IN_TERM_RXTEN = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM_SEL = 2'h0;
parameter PMA_DES_IN_TERM_ACCOUPLE_RXVCM_EN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETEN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETRANGE = 1'h0;
parameter PMA_DES_PKDET_RXPKDET_LOW_THRESHOLD = 3'h0;
parameter PMA_DES_PKDET_RXPKDET_HIGH_THRESHOLD = 3'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_MODE = 1'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE = 2'h0;
parameter PMA_DES_RTL_LOCK_CTRL_FDET_SAMPLE_PERIODS = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_RANGE = 2'h0;
parameter PMA_DES_RXPLL_DIV_CDR_GAIN = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTEN = 1'h0;
parameter PMA_DES_CLK_CTRL_RXREFCLK_SEL = 3'h0;
parameter PMA_DES_CLK_CTRL_DESMODE = 3'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKEN = 1'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKDIVEN = 1'h0;
parameter PMA_SER_CTRL_TXVBGREF_SEL = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIVEN = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIV = 2'h0;
parameter PMA_SER_CLK_CTRL_TXBITCLKSEL = 1'h0;
parameter PMA_SER_CLK_CTRL_SERMODE = 3'h0;
parameter PMA_SER_DRV_BYP_BYPASS_VALUE = 8'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT_RTL = 2'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_STEP_WAIT_COUNT = 5'h0;
parameter PMA_SER_TERM_CTRL_TXCM_LEVEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXTEN = 1'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM_SEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM = 4'h0;
parameter PMA_SER_TEST_BUS_TXATESTEN = 1'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDEL = 16'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDATA_INV = 8'h0;
parameter PMA_SER_DRV_CTRL_TXDRVTRIM = 24'h0;
parameter PMA_SER_DRV_CTRL_TXDRV = 3'h0;
parameter PMA_SER_DRV_CTRL_TXITRIM = 2'h0;
parameter PMA_SER_DRV_CTRL_TXODRV = 2'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDRV_CTRL_SEL = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXODRV_BOOSTER = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXMARGIN = 3'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXSWING = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS_BEACON = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_HALF_RATE10BIT = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_HALF_RATE10BIT = 1'h0;
parameter PCS_SOFT_RESET_PERIPH = 1'h0;
parameter PCS_LFWF_R0_RXFWF_RATIO = 2'h0;
parameter PCS_LFWF_R0_TXFWF_RATIO = 2'h0;
parameter PCS_LOVR_R0_FAB_IFC_MODE = 4'h0;
parameter PCS_LOVR_R0_PCSPMA_IFC_MODE = 4'h0;
parameter PCS_LPIP_R0_PIPEENABLE = 1'h0;
parameter PCS_LPIP_R0_PIPEMODE = 1'h0;
parameter PCS_LPIP_R0_PIPE_PCIE_HC = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_SCRAMBLER = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_DISPARITY = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_GEARBOX = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_64B67B = 1'h0;
parameter PCS_L64_R0_L64_CFG_BER_MON_EN = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_8B_MODE = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C49 = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C82 = 1'h0;
parameter PCS_L8_R0_L8_GEARMODE = 2'h0;
parameter PCS_LNTV_R0_LNTV_RX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_RX_IN_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_RX_MODE = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_OUT_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_TX_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_TMG_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_PCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_PCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_RCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_PIPE = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_LCL = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_OUT = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FAB_EPCS_PMA_RESET_B_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module XCVR(
       RX_REF_CLK,
       TX_DATA,
       RX_FWF_EN,
       TX_FWF_EN,
       RX_SLIP,
       PCS_ARST_N,
       PMA_ARST_N,
       RX_FWF_CLK,
       TX_FWF_CLK,
       TX_CLK_STABLE,
       RX_VAL,
       RX_READY,
       RX_IDLE,
       RX_DATA,
       RX_CLK_R,
       TX_CLK_R,
       RX_N,
       RX_P,
       TX_N,
       TX_P,
       PCS_DEBUG,
       REF_CLK_N,
       REF_CLK_P,
       JA_CLK,
       TX_BIT_CLK_0,
       TX_BIT_CLK_1,
       TX_PLL_LOCK_0,
       TX_PLL_LOCK_1,
       TX_PLL_REF_CLK_0,
       TX_PLL_REF_CLK_1,
       TX_CLK_G,
       RX_CLK_G,
       PMA_DEBUG,
       ARST_N,
       DRI_CLK,
       DRI_CTRL,
       DRI_WDATA,
       DRI_ARST_N,
       DRI_RDATA,
       DRI_INTERRUPT,
       M_AWADDR_HW_0,
       M_AWADDR_HW_1,
       M_AWADDR_HW_2,
       M_AWADDR_HW_3,
       M_AWADDR_HW_4,
       M_AWADDR_HW_5,
       M_AWADDR_HW_6,
       M_AWADDR_HW_7,
       M_AWADDR_HW_8,
       M_AWADDR_HW_9,
       M_AWADDR_HW_10,
       M_AWADDR_HW_11,
       M_AWADDR_HW_12,
       M_AWADDR_HW_13,
       M_AWADDR_HW_14,
       M_AWADDR_HW_15,
       M_AWADDR_HW_16,
       M_AWADDR_HW_17,
       M_AWADDR_HW_18,
       M_AWADDR_HW_19,
       M_AWADDR_HW_20,
       M_AWADDR_HW_21,
       M_AWADDR_HW_22,
       M_AWADDR_HW_23,
       M_AWADDR_HW_28,
       M_AWADDR_HW_29,
       M_AWADDR_HW_30,
       M_AWADDR_HW_31,
       M_RDATA_HW,
       M_WDATA_HW,
       S_AWADDR_HW_0,
       S_AWADDR_HW_1,
       S_AWADDR_HW_2,
       S_AWADDR_HW_3,
       S_AWADDR_HW_4,
       S_AWADDR_HW_5,
       S_AWADDR_HW_6,
       S_AWADDR_HW_7,
       S_AWADDR_HW_8,
       S_AWADDR_HW_9,
       S_AWADDR_HW_10,
       S_AWADDR_HW_11,
       S_AWADDR_HW_12,
       S_AWADDR_HW_13,
       S_AWADDR_HW_14,
       S_AWADDR_HW_15,
       S_AWADDR_HW_16,
       S_AWADDR_HW_17,
       S_AWADDR_HW_18,
       S_AWADDR_HW_19,
       S_AWADDR_HW_20,
       S_AWADDR_HW_21,
       S_AWADDR_HW_22,
       S_AWADDR_HW_23,
       S_AWADDR_HW_28,
       S_AWADDR_HW_30,
       S_AWADDR_HW_31,
       PHYSTATUS_0,
       POWERDOWN,
       RATE,
       RESET_N,
       RXDATA_0,
       RXDATAK_0,
       RXELECIDLE_0,
       RXPOLARITY_0,
       RXSTANDBYSTATUS_0,
       RXSTATUS_0,
       RXVALID_0,
       TXCOMPLIANCE_0,
       TXDATA_0,
       TXDATAK_0,
       TXDATAVALID_0,
       TXDEEMPH,
       TXDETECTRX_LOOPBACK_0,
       TXELECIDLE_0,
       TXMARGIN,
       TXSWING,
       PIPE_CLK_0,
       PCLK_OUT_0,
       AXI_CLK,
       M_ARADDR_HW_0,
       M_ARADDR_HW_1,
       M_ARADDR_HW_2,
       M_ARADDR_HW_3,
       M_ARADDR_HW_4,
       M_ARADDR_HW_5,
       M_ARADDR_HW_6,
       M_ARADDR_HW_7,
       M_ARADDR_HW_8,
       M_ARADDR_HW_9,
       M_ARADDR_HW_10,
       M_ARADDR_HW_11,
       M_ARADDR_HW_12,
       M_ARADDR_HW_13,
       M_ARADDR_HW_14,
       M_ARADDR_HW_15,
       M_ARADDR_HW_16,
       M_ARADDR_HW_17,
       M_ARADDR_HW_18,
       M_ARADDR_HW_19,
       M_ARADDR_HW_20,
       M_ARADDR_HW_21,
       M_ARADDR_HW_22,
       M_ARADDR_HW_23,
       M_ARADDR_HW_28,
       M_ARADDR_HW_29,
       M_ARADDR_HW_30,
       M_ARADDR_HW_31,
       S_ARADDR_HW_0,
       S_ARADDR_HW_1,
       S_ARADDR_HW_2,
       S_ARADDR_HW_3,
       S_ARADDR_HW_4,
       S_ARADDR_HW_5,
       S_ARADDR_HW_6,
       S_ARADDR_HW_7,
       S_ARADDR_HW_8,
       S_ARADDR_HW_9,
       S_ARADDR_HW_10,
       S_ARADDR_HW_11,
       S_ARADDR_HW_12,
       S_ARADDR_HW_13,
       S_ARADDR_HW_14,
       S_ARADDR_HW_15,
       S_ARADDR_HW_16,
       S_ARADDR_HW_17,
       S_ARADDR_HW_18,
       S_ARADDR_HW_19,
       S_ARADDR_HW_20,
       S_ARADDR_HW_21,
       S_ARADDR_HW_22,
       S_ARADDR_HW_23,
       S_ARADDR_HW_28,
       S_ARADDR_HW_30,
       S_ARADDR_HW_31,
       S_RDATA_HW,
       S_WDATA_HW,
       LINK_CLK,
       LINK_ADDR,
       LINK_EN,
       LINK_ARST_N,
       LINK_WDATA,
       LINK_RDATA
    ) ;
/* synthesis syn_black_box

syn_tsu0 = " RX_FWF_EN->AXI_CLK = 2.132"
syn_tsu1 = " RX_FWF_EN->RX_FWF_CLK = 0.916"
syn_tsu2 = " RX_SLIP->AXI_CLK = 2.004"
syn_tsu3 = " TX_DATA[0]->AXI_CLK = 1.977"
syn_tsu4 = " TX_DATA[0]->TX_FWF_CLK = 1.212"
syn_tsu5 = " TX_DATA[10]->AXI_CLK = 1.767"
syn_tsu6 = " TX_DATA[10]->TX_FWF_CLK = 1.181"
syn_tsu7 = " TX_DATA[11]->AXI_CLK = 2.089"
syn_tsu8 = " TX_DATA[11]->TX_FWF_CLK = 1.196"
syn_tsu9 = " TX_DATA[12]->AXI_CLK = 2.105"
syn_tsu10 = " TX_DATA[12]->TX_FWF_CLK = 1.16"
syn_tsu11 = " TX_DATA[13]->AXI_CLK = 2.119"
syn_tsu12 = " TX_DATA[13]->TX_FWF_CLK = 1.17"
syn_tsu13 = " TX_DATA[14]->AXI_CLK = 1.939"
syn_tsu14 = " TX_DATA[14]->TX_FWF_CLK = 1.177"
syn_tsu15 = " TX_DATA[15]->AXI_CLK = 1.851"
syn_tsu16 = " TX_DATA[15]->TX_FWF_CLK = 1.251"
syn_tsu17 = " TX_DATA[16]->AXI_CLK = 2.002"
syn_tsu18 = " TX_DATA[16]->TX_FWF_CLK = 1.156"
syn_tsu19 = " TX_DATA[17]->AXI_CLK = 1.832"
syn_tsu20 = " TX_DATA[17]->TX_FWF_CLK = 1.255"
syn_tsu21 = " TX_DATA[18]->AXI_CLK = 2.066"
syn_tsu22 = " TX_DATA[18]->TX_FWF_CLK = 1.239"
syn_tsu23 = " TX_DATA[19]->AXI_CLK = 2.117"
syn_tsu24 = " TX_DATA[19]->TX_FWF_CLK = 1.214"
syn_tsu25 = " TX_DATA[1]->AXI_CLK = 2.025"
syn_tsu26 = " TX_DATA[1]->TX_FWF_CLK = 1.201"
syn_tsu27 = " TX_DATA[20]->AXI_CLK = 2.147"
syn_tsu28 = " TX_DATA[20]->TX_FWF_CLK = 1.201"
syn_tsu29 = " TX_DATA[21]->AXI_CLK = 2.024"
syn_tsu30 = " TX_DATA[21]->TX_FWF_CLK = 1.273"
syn_tsu31 = " TX_DATA[22]->AXI_CLK = 2.104"
syn_tsu32 = " TX_DATA[22]->TX_FWF_CLK = 1.231"
syn_tsu33 = " TX_DATA[23]->AXI_CLK = 1.994"
syn_tsu34 = " TX_DATA[23]->TX_FWF_CLK = 1.205"
syn_tsu35 = " TX_DATA[24]->AXI_CLK = 2.057"
syn_tsu36 = " TX_DATA[24]->TX_FWF_CLK = 1.227"
syn_tsu37 = " TX_DATA[25]->AXI_CLK = 1.986"
syn_tsu38 = " TX_DATA[25]->TX_FWF_CLK = 1.276"
syn_tsu39 = " TX_DATA[26]->AXI_CLK = 2.114"
syn_tsu40 = " TX_DATA[26]->TX_FWF_CLK = 1.24"
syn_tsu41 = " TX_DATA[27]->AXI_CLK = 2.037"
syn_tsu42 = " TX_DATA[27]->TX_FWF_CLK = 1.176"
syn_tsu43 = " TX_DATA[28]->AXI_CLK = 2.094"
syn_tsu44 = " TX_DATA[28]->TX_FWF_CLK = 1.259"
syn_tsu45 = " TX_DATA[29]->AXI_CLK = 2.087"
syn_tsu46 = " TX_DATA[29]->TX_FWF_CLK = 1.178"
syn_tsu47 = " TX_DATA[2]->AXI_CLK = 1.945"
syn_tsu48 = " TX_DATA[2]->TX_FWF_CLK = 1.174"
syn_tsu49 = " TX_DATA[30]->AXI_CLK = 1.943"
syn_tsu50 = " TX_DATA[30]->TX_FWF_CLK = 1.226"
syn_tsu51 = " TX_DATA[31]->AXI_CLK = 2.007"
syn_tsu52 = " TX_DATA[31]->TX_FWF_CLK = 1.207"
syn_tsu53 = " TX_DATA[32]->AXI_CLK = 2.039"
syn_tsu54 = " TX_DATA[32]->TX_FWF_CLK = 1.189"
syn_tsu55 = " TX_DATA[33]->AXI_CLK = 2.097"
syn_tsu56 = " TX_DATA[33]->TX_FWF_CLK = 1.158"
syn_tsu57 = " TX_DATA[34]->AXI_CLK = 2.138"
syn_tsu58 = " TX_DATA[34]->TX_FWF_CLK = 1.19"
syn_tsu59 = " TX_DATA[35]->AXI_CLK = 2.116"
syn_tsu60 = " TX_DATA[35]->TX_FWF_CLK = 1.251"
syn_tsu61 = " TX_DATA[36]->AXI_CLK = 2.148"
syn_tsu62 = " TX_DATA[36]->TX_FWF_CLK = 1.208"
syn_tsu63 = " TX_DATA[37]->AXI_CLK = 2.038"
syn_tsu64 = " TX_DATA[37]->TX_FWF_CLK = 1.189"
syn_tsu65 = " TX_DATA[38]->AXI_CLK = 1.951"
syn_tsu66 = " TX_DATA[38]->TX_FWF_CLK = 1.182"
syn_tsu67 = " TX_DATA[39]->AXI_CLK = 1.943"
syn_tsu68 = " TX_DATA[39]->TX_FWF_CLK = 1.27"
syn_tsu69 = " TX_DATA[3]->AXI_CLK = 2.088"
syn_tsu70 = " TX_DATA[3]->TX_FWF_CLK = 1.229"
syn_tsu71 = " TX_DATA[40]->AXI_CLK = 2.022"
syn_tsu72 = " TX_DATA[40]->TX_FWF_CLK = 1.228"
syn_tsu73 = " TX_DATA[41]->AXI_CLK = 2.02"
syn_tsu74 = " TX_DATA[41]->TX_FWF_CLK = 1.255"
syn_tsu75 = " TX_DATA[42]->AXI_CLK = 2.062"
syn_tsu76 = " TX_DATA[42]->TX_FWF_CLK = 1.274"
syn_tsu77 = " TX_DATA[43]->AXI_CLK = 2.084"
syn_tsu78 = " TX_DATA[43]->TX_FWF_CLK = 1.158"
syn_tsu79 = " TX_DATA[44]->AXI_CLK = 1.993"
syn_tsu80 = " TX_DATA[44]->TX_FWF_CLK = 1.154"
syn_tsu81 = " TX_DATA[45]->AXI_CLK = 2.117"
syn_tsu82 = " TX_DATA[45]->TX_FWF_CLK = 1.262"
syn_tsu83 = " TX_DATA[46]->AXI_CLK = 2.02"
syn_tsu84 = " TX_DATA[46]->TX_FWF_CLK = 1.22"
syn_tsu85 = " TX_DATA[47]->AXI_CLK = 2.121"
syn_tsu86 = " TX_DATA[47]->TX_FWF_CLK = 1.253"
syn_tsu87 = " TX_DATA[48]->AXI_CLK = 1.986"
syn_tsu88 = " TX_DATA[48]->TX_FWF_CLK = 1.175"
syn_tsu89 = " TX_DATA[49]->AXI_CLK = 2.037"
syn_tsu90 = " TX_DATA[49]->TX_FWF_CLK = 1.236"
syn_tsu91 = " TX_DATA[4]->AXI_CLK = 1.945"
syn_tsu92 = " TX_DATA[4]->TX_FWF_CLK = 1.188"
syn_tsu93 = " TX_DATA[50]->AXI_CLK = 2.043"
syn_tsu94 = " TX_DATA[50]->TX_FWF_CLK = 1.178"
syn_tsu95 = " TX_DATA[51]->AXI_CLK = 2.115"
syn_tsu96 = " TX_DATA[51]->TX_FWF_CLK = 1.146"
syn_tsu97 = " TX_DATA[52]->AXI_CLK = 2"
syn_tsu98 = " TX_DATA[52]->TX_FWF_CLK = 1.213"
syn_tsu99 = " TX_DATA[53]->AXI_CLK = 2.048"
syn_tsu100 = " TX_DATA[53]->TX_FWF_CLK = 1.165"
syn_tsu101 = " TX_DATA[54]->AXI_CLK = 2.061"
syn_tsu102 = " TX_DATA[54]->TX_FWF_CLK = 1.226"
syn_tsu103 = " TX_DATA[55]->AXI_CLK = 2.022"
syn_tsu104 = " TX_DATA[55]->TX_FWF_CLK = 1.162"
syn_tsu105 = " TX_DATA[56]->AXI_CLK = 2.063"
syn_tsu106 = " TX_DATA[56]->TX_FWF_CLK = 1.214"
syn_tsu107 = " TX_DATA[57]->AXI_CLK = 2.131"
syn_tsu108 = " TX_DATA[57]->TX_FWF_CLK = 1.191"
syn_tsu109 = " TX_DATA[58]->AXI_CLK = 1.973"
syn_tsu110 = " TX_DATA[58]->TX_FWF_CLK = 1.268"
syn_tsu111 = " TX_DATA[59]->AXI_CLK = 2.141"
syn_tsu112 = " TX_DATA[59]->TX_FWF_CLK = 1.24"
syn_tsu113 = " TX_DATA[5]->AXI_CLK = 1.795"
syn_tsu114 = " TX_DATA[5]->TX_FWF_CLK = 1.189"
syn_tsu115 = " TX_DATA[60]->AXI_CLK = 2.118"
syn_tsu116 = " TX_DATA[60]->TX_FWF_CLK = 1.174"
syn_tsu117 = " TX_DATA[61]->AXI_CLK = 2.099"
syn_tsu118 = " TX_DATA[61]->TX_FWF_CLK = 1.224"
syn_tsu119 = " TX_DATA[62]->AXI_CLK = 1.995"
syn_tsu120 = " TX_DATA[62]->TX_FWF_CLK = 1.154"
syn_tsu121 = " TX_DATA[63]->AXI_CLK = 1.923"
syn_tsu122 = " TX_DATA[63]->TX_FWF_CLK = 1.156"
syn_tsu123 = " TX_DATA[64]->AXI_CLK = 2.075"
syn_tsu124 = " TX_DATA[64]->TX_FWF_CLK = 1.18"
syn_tsu125 = " TX_DATA[65]->AXI_CLK = 2.086"
syn_tsu126 = " TX_DATA[65]->TX_FWF_CLK = 1.233"
syn_tsu127 = " TX_DATA[66]->AXI_CLK = 2.155"
syn_tsu128 = " TX_DATA[66]->TX_FWF_CLK = 1.182"
syn_tsu129 = " TX_DATA[67]->AXI_CLK = 2.013"
syn_tsu130 = " TX_DATA[67]->TX_FWF_CLK = 1.197"
syn_tsu131 = " TX_DATA[68]->AXI_CLK = 2.04"
syn_tsu132 = " TX_DATA[68]->TX_FWF_CLK = 1.188"
syn_tsu133 = " TX_DATA[69]->AXI_CLK = 2.148"
syn_tsu134 = " TX_DATA[69]->TX_FWF_CLK = 1.211"
syn_tsu135 = " TX_DATA[6]->AXI_CLK = 2"
syn_tsu136 = " TX_DATA[6]->TX_FWF_CLK = 1.199"
syn_tsu137 = " TX_DATA[70]->AXI_CLK = 2.08"
syn_tsu138 = " TX_DATA[70]->TX_FWF_CLK = 1.239"
syn_tsu139 = " TX_DATA[71]->AXI_CLK = 2.08"
syn_tsu140 = " TX_DATA[71]->TX_FWF_CLK = 1.173"
syn_tsu141 = " TX_DATA[72]->AXI_CLK = 2.104"
syn_tsu142 = " TX_DATA[72]->TX_FWF_CLK = 1.211"
syn_tsu143 = " TX_DATA[73]->AXI_CLK = 2.104"
syn_tsu144 = " TX_DATA[73]->TX_FWF_CLK = 1.203"
syn_tsu145 = " TX_DATA[74]->AXI_CLK = 2.095"
syn_tsu146 = " TX_DATA[74]->TX_FWF_CLK = 1.17"
syn_tsu147 = " TX_DATA[75]->AXI_CLK = 2.051"
syn_tsu148 = " TX_DATA[75]->TX_FWF_CLK = 1.178"
syn_tsu149 = " TX_DATA[76]->AXI_CLK = 1.963"
syn_tsu150 = " TX_DATA[76]->TX_FWF_CLK = 1.258"
syn_tsu151 = " TX_DATA[77]->AXI_CLK = 2.168"
syn_tsu152 = " TX_DATA[77]->TX_FWF_CLK = 1.241"
syn_tsu153 = " TX_DATA[78]->AXI_CLK = 2.109"
syn_tsu154 = " TX_DATA[78]->TX_FWF_CLK = 1.176"
syn_tsu155 = " TX_DATA[79]->AXI_CLK = 2.08"
syn_tsu156 = " TX_DATA[79]->TX_FWF_CLK = 1.195"
syn_tsu157 = " TX_DATA[7]->AXI_CLK = 1.962"
syn_tsu158 = " TX_DATA[7]->TX_FWF_CLK = 1.17"
syn_tsu159 = " TX_DATA[80]->AXI_CLK = 2.064"
syn_tsu160 = " TX_DATA[80]->TX_FWF_CLK = 1.175"
syn_tsu161 = " TX_DATA[81]->AXI_CLK = 2.126"
syn_tsu162 = " TX_DATA[81]->TX_FWF_CLK = 1.175"
syn_tsu163 = " TX_DATA[82]->AXI_CLK = 2.01"
syn_tsu164 = " TX_DATA[82]->TX_FWF_CLK = 1.158"
syn_tsu165 = " TX_DATA[83]->AXI_CLK = 2.011"
syn_tsu166 = " TX_DATA[83]->TX_FWF_CLK = 1.255"
syn_tsu167 = " TX_DATA[84]->AXI_CLK = 2.108"
syn_tsu168 = " TX_DATA[84]->TX_FWF_CLK = 1.232"
syn_tsu169 = " TX_DATA[85]->AXI_CLK = 1.979"
syn_tsu170 = " TX_DATA[85]->TX_FWF_CLK = 1.154"
syn_tsu171 = " TX_DATA[86]->AXI_CLK = 2.097"
syn_tsu172 = " TX_DATA[86]->TX_FWF_CLK = 1.247"
syn_tsu173 = " TX_DATA[87]->AXI_CLK = 2.052"
syn_tsu174 = " TX_DATA[87]->TX_FWF_CLK = 1.17"
syn_tsu175 = " TX_DATA[8]->AXI_CLK = 2.143"
syn_tsu176 = " TX_DATA[8]->TX_FWF_CLK = 1.25"
syn_tsu177 = " TX_DATA[9]->AXI_CLK = 1.912"
syn_tsu178 = " TX_DATA[9]->TX_FWF_CLK = 1.177"
syn_tsu179 = " TX_FWF_EN->AXI_CLK = 2.009"
syn_tsu180 = " TX_FWF_EN->TX_FWF_CLK = 1.043"
syn_tco0 = " AXI_CLK->RX_DATA[0] = 2.776"
syn_tco1 = " AXI_CLK->RX_DATA[10] = 2.730"
syn_tco2 = " AXI_CLK->RX_DATA[11] = 2.768"
syn_tco3 = " AXI_CLK->RX_DATA[12] = 2.749"
syn_tco4 = " AXI_CLK->RX_DATA[13] = 2.732"
syn_tco5 = " AXI_CLK->RX_DATA[14] = 2.736"
syn_tco6 = " AXI_CLK->RX_DATA[15] = 2.532"
syn_tco7 = " AXI_CLK->RX_DATA[16] = 2.742"
syn_tco8 = " AXI_CLK->RX_DATA[17] = 2.739"
syn_tco9 = " AXI_CLK->RX_DATA[18] = 2.723"
syn_tco10 = " AXI_CLK->RX_DATA[19] = 2.759"
syn_tco11 = " AXI_CLK->RX_DATA[1] = 2.654"
syn_tco12 = " AXI_CLK->RX_DATA[20] = 2.683"
syn_tco13 = " AXI_CLK->RX_DATA[21] = 2.789"
syn_tco14 = " AXI_CLK->RX_DATA[22] = 2.424"
syn_tco15 = " AXI_CLK->RX_DATA[23] = 2.712"
syn_tco16 = " AXI_CLK->RX_DATA[24] = 2.670"
syn_tco17 = " AXI_CLK->RX_DATA[25] = 2.726"
syn_tco18 = " AXI_CLK->RX_DATA[26] = 2.709"
syn_tco19 = " AXI_CLK->RX_DATA[27] = 2.485"
syn_tco20 = " AXI_CLK->RX_DATA[28] = 2.760"
syn_tco21 = " AXI_CLK->RX_DATA[29] = 2.670"
syn_tco22 = " AXI_CLK->RX_DATA[2] = 2.708"
syn_tco23 = " AXI_CLK->RX_DATA[30] = 2.682"
syn_tco24 = " AXI_CLK->RX_DATA[31] = 2.772"
syn_tco25 = " AXI_CLK->RX_DATA[32] = 2.698"
syn_tco26 = " AXI_CLK->RX_DATA[33] = 2.708"
syn_tco27 = " AXI_CLK->RX_DATA[34] = 2.766"
syn_tco28 = " AXI_CLK->RX_DATA[35] = 2.744"
syn_tco29 = " AXI_CLK->RX_DATA[36] = 2.795"
syn_tco30 = " AXI_CLK->RX_DATA[37] = 2.757"
syn_tco31 = " AXI_CLK->RX_DATA[38] = 2.735"
syn_tco32 = " AXI_CLK->RX_DATA[39] = 2.675"
syn_tco33 = " AXI_CLK->RX_DATA[3] = 2.763"
syn_tco34 = " AXI_CLK->RX_DATA[40] = 2.733"
syn_tco35 = " AXI_CLK->RX_DATA[41] = 2.751"
syn_tco36 = " AXI_CLK->RX_DATA[42] = 2.635"
syn_tco37 = " AXI_CLK->RX_DATA[43] = 2.690"
syn_tco38 = " AXI_CLK->RX_DATA[44] = 2.677"
syn_tco39 = " AXI_CLK->RX_DATA[45] = 2.719"
syn_tco40 = " AXI_CLK->RX_DATA[46] = 2.753"
syn_tco41 = " AXI_CLK->RX_DATA[47] = 2.743"
syn_tco42 = " AXI_CLK->RX_DATA[48] = 2.689"
syn_tco43 = " AXI_CLK->RX_DATA[49] = 2.767"
syn_tco44 = " AXI_CLK->RX_DATA[4] = 2.767"
syn_tco45 = " AXI_CLK->RX_DATA[50] = 2.718"
syn_tco46 = " AXI_CLK->RX_DATA[51] = 2.698"
syn_tco47 = " AXI_CLK->RX_DATA[52] = 2.739"
syn_tco48 = " AXI_CLK->RX_DATA[53] = 2.737"
syn_tco49 = " AXI_CLK->RX_DATA[54] = 2.775"
syn_tco50 = " AXI_CLK->RX_DATA[55] = 2.781"
syn_tco51 = " AXI_CLK->RX_DATA[56] = 2.765"
syn_tco52 = " AXI_CLK->RX_DATA[57] = 2.761"
syn_tco53 = " AXI_CLK->RX_DATA[58] = 2.756"
syn_tco54 = " AXI_CLK->RX_DATA[59] = 2.605"
syn_tco55 = " AXI_CLK->RX_DATA[5] = 2.658"
syn_tco56 = " AXI_CLK->RX_DATA[60] = 2.712"
syn_tco57 = " AXI_CLK->RX_DATA[61] = 2.750"
syn_tco58 = " AXI_CLK->RX_DATA[62] = 2.697"
syn_tco59 = " AXI_CLK->RX_DATA[63] = 2.770"
syn_tco60 = " AXI_CLK->RX_DATA[64] = 2.535"
syn_tco61 = " AXI_CLK->RX_DATA[65] = 2.550"
syn_tco62 = " AXI_CLK->RX_DATA[66] = 2.669"
syn_tco63 = " AXI_CLK->RX_DATA[67] = 2.631"
syn_tco64 = " AXI_CLK->RX_DATA[68] = 2.674"
syn_tco65 = " AXI_CLK->RX_DATA[69] = 2.676"
syn_tco66 = " AXI_CLK->RX_DATA[6] = 2.475"
syn_tco67 = " AXI_CLK->RX_DATA[70] = 2.734"
syn_tco68 = " AXI_CLK->RX_DATA[71] = 2.623"
syn_tco69 = " AXI_CLK->RX_DATA[72] = 2.740"
syn_tco70 = " AXI_CLK->RX_DATA[73] = 2.607"
syn_tco71 = " AXI_CLK->RX_DATA[74] = 2.543"
syn_tco72 = " AXI_CLK->RX_DATA[75] = 2.623"
syn_tco73 = " AXI_CLK->RX_DATA[76] = 2.643"
syn_tco74 = " AXI_CLK->RX_DATA[77] = 2.613"
syn_tco75 = " AXI_CLK->RX_DATA[78] = 2.638"
syn_tco76 = " AXI_CLK->RX_DATA[79] = 2.726"
syn_tco77 = " AXI_CLK->RX_DATA[7] = 2.718"
syn_tco78 = " AXI_CLK->RX_DATA[80] = 2.525"
syn_tco79 = " AXI_CLK->RX_DATA[81] = 2.442"
syn_tco80 = " AXI_CLK->RX_DATA[82] = 2.704"
syn_tco81 = " AXI_CLK->RX_DATA[83] = 2.466"
syn_tco82 = " AXI_CLK->RX_DATA[84] = 2.600"
syn_tco83 = " AXI_CLK->RX_DATA[85] = 2.663"
syn_tco84 = " AXI_CLK->RX_DATA[86] = 2.678"
syn_tco85 = " AXI_CLK->RX_DATA[87] = 2.485"
syn_tco86 = " AXI_CLK->RX_DATA[8] = 2.765"
syn_tco87 = " AXI_CLK->RX_DATA[9] = 2.715"
syn_tco88 = " AXI_CLK->RX_IDLE = 2.213"
syn_tco89 = " AXI_CLK->RX_READY = 2.219"
syn_tco90 = " AXI_CLK->RX_VAL = 2.185"
syn_tco91 = " AXI_CLK->TX_CLK_STABLE = 2.167"
syn_tco92 = " RX_FWF_CLK->RX_DATA[0] = 2.954"
syn_tco93 = " RX_FWF_CLK->RX_DATA[10] = 2.830"
syn_tco94 = " RX_FWF_CLK->RX_DATA[11] = 2.832"
syn_tco95 = " RX_FWF_CLK->RX_DATA[12] = 2.867"
syn_tco96 = " RX_FWF_CLK->RX_DATA[13] = 2.858"
syn_tco97 = " RX_FWF_CLK->RX_DATA[14] = 2.835"
syn_tco98 = " RX_FWF_CLK->RX_DATA[15] = 2.826"
syn_tco99 = " RX_FWF_CLK->RX_DATA[16] = 2.858"
syn_tco100 = " RX_FWF_CLK->RX_DATA[17] = 2.841"
syn_tco101 = " RX_FWF_CLK->RX_DATA[18] = 2.856"
syn_tco102 = " RX_FWF_CLK->RX_DATA[19] = 2.862"
syn_tco103 = " RX_FWF_CLK->RX_DATA[1] = 2.937"
syn_tco104 = " RX_FWF_CLK->RX_DATA[20] = 2.845"
syn_tco105 = " RX_FWF_CLK->RX_DATA[21] = 2.879"
syn_tco106 = " RX_FWF_CLK->RX_DATA[22] = 2.877"
syn_tco107 = " RX_FWF_CLK->RX_DATA[23] = 2.852"
syn_tco108 = " RX_FWF_CLK->RX_DATA[24] = 2.830"
syn_tco109 = " RX_FWF_CLK->RX_DATA[25] = 2.865"
syn_tco110 = " RX_FWF_CLK->RX_DATA[26] = 2.857"
syn_tco111 = " RX_FWF_CLK->RX_DATA[27] = 2.875"
syn_tco112 = " RX_FWF_CLK->RX_DATA[28] = 2.852"
syn_tco113 = " RX_FWF_CLK->RX_DATA[29] = 2.875"
syn_tco114 = " RX_FWF_CLK->RX_DATA[2] = 2.928"
syn_tco115 = " RX_FWF_CLK->RX_DATA[30] = 2.844"
syn_tco116 = " RX_FWF_CLK->RX_DATA[31] = 2.860"
syn_tco117 = " RX_FWF_CLK->RX_DATA[32] = 2.866"
syn_tco118 = " RX_FWF_CLK->RX_DATA[33] = 2.886"
syn_tco119 = " RX_FWF_CLK->RX_DATA[34] = 2.877"
syn_tco120 = " RX_FWF_CLK->RX_DATA[35] = 2.879"
syn_tco121 = " RX_FWF_CLK->RX_DATA[36] = 2.883"
syn_tco122 = " RX_FWF_CLK->RX_DATA[37] = 2.854"
syn_tco123 = " RX_FWF_CLK->RX_DATA[38] = 2.855"
syn_tco124 = " RX_FWF_CLK->RX_DATA[39] = 2.883"
syn_tco125 = " RX_FWF_CLK->RX_DATA[3] = 2.964"
syn_tco126 = " RX_FWF_CLK->RX_DATA[40] = 2.875"
syn_tco127 = " RX_FWF_CLK->RX_DATA[41] = 2.848"
syn_tco128 = " RX_FWF_CLK->RX_DATA[42] = 2.862"
syn_tco129 = " RX_FWF_CLK->RX_DATA[43] = 2.827"
syn_tco130 = " RX_FWF_CLK->RX_DATA[44] = 2.845"
syn_tco131 = " RX_FWF_CLK->RX_DATA[45] = 2.850"
syn_tco132 = " RX_FWF_CLK->RX_DATA[46] = 2.886"
syn_tco133 = " RX_FWF_CLK->RX_DATA[47] = 2.873"
syn_tco134 = " RX_FWF_CLK->RX_DATA[48] = 2.859"
syn_tco135 = " RX_FWF_CLK->RX_DATA[49] = 2.856"
syn_tco136 = " RX_FWF_CLK->RX_DATA[4] = 2.851"
syn_tco137 = " RX_FWF_CLK->RX_DATA[50] = 2.840"
syn_tco138 = " RX_FWF_CLK->RX_DATA[51] = 2.839"
syn_tco139 = " RX_FWF_CLK->RX_DATA[52] = 2.865"
syn_tco140 = " RX_FWF_CLK->RX_DATA[53] = 2.854"
syn_tco141 = " RX_FWF_CLK->RX_DATA[54] = 2.831"
syn_tco142 = " RX_FWF_CLK->RX_DATA[55] = 2.862"
syn_tco143 = " RX_FWF_CLK->RX_DATA[56] = 2.845"
syn_tco144 = " RX_FWF_CLK->RX_DATA[57] = 2.815"
syn_tco145 = " RX_FWF_CLK->RX_DATA[58] = 2.795"
syn_tco146 = " RX_FWF_CLK->RX_DATA[59] = 2.827"
syn_tco147 = " RX_FWF_CLK->RX_DATA[5] = 2.846"
syn_tco148 = " RX_FWF_CLK->RX_DATA[60] = 2.777"
syn_tco149 = " RX_FWF_CLK->RX_DATA[61] = 2.802"
syn_tco150 = " RX_FWF_CLK->RX_DATA[62] = 2.767"
syn_tco151 = " RX_FWF_CLK->RX_DATA[63] = 2.809"
syn_tco152 = " RX_FWF_CLK->RX_DATA[64] = 2.890"
syn_tco153 = " RX_FWF_CLK->RX_DATA[65] = 2.900"
syn_tco154 = " RX_FWF_CLK->RX_DATA[66] = 2.861"
syn_tco155 = " RX_FWF_CLK->RX_DATA[67] = 2.899"
syn_tco156 = " RX_FWF_CLK->RX_DATA[68] = 2.903"
syn_tco157 = " RX_FWF_CLK->RX_DATA[69] = 2.885"
syn_tco158 = " RX_FWF_CLK->RX_DATA[6] = 2.818"
syn_tco159 = " RX_FWF_CLK->RX_DATA[70] = 2.910"
syn_tco160 = " RX_FWF_CLK->RX_DATA[71] = 2.909"
syn_tco161 = " RX_FWF_CLK->RX_DATA[72] = 2.938"
syn_tco162 = " RX_FWF_CLK->RX_DATA[73] = 2.877"
syn_tco163 = " RX_FWF_CLK->RX_DATA[74] = 2.897"
syn_tco164 = " RX_FWF_CLK->RX_DATA[75] = 2.886"
syn_tco165 = " RX_FWF_CLK->RX_DATA[76] = 2.896"
syn_tco166 = " RX_FWF_CLK->RX_DATA[77] = 2.892"
syn_tco167 = " RX_FWF_CLK->RX_DATA[78] = 2.871"
syn_tco168 = " RX_FWF_CLK->RX_DATA[79] = 2.862"
syn_tco169 = " RX_FWF_CLK->RX_DATA[7] = 2.868"
syn_tco170 = " RX_FWF_CLK->RX_DATA[80] = 2.898"
syn_tco171 = " RX_FWF_CLK->RX_DATA[81] = 2.904"
syn_tco172 = " RX_FWF_CLK->RX_DATA[82] = 2.890"
syn_tco173 = " RX_FWF_CLK->RX_DATA[83] = 2.903"
syn_tco174 = " RX_FWF_CLK->RX_DATA[84] = 2.873"
syn_tco175 = " RX_FWF_CLK->RX_DATA[85] = 2.884"
syn_tco176 = " RX_FWF_CLK->RX_DATA[86] = 2.880"
syn_tco177 = " RX_FWF_CLK->RX_DATA[87] = 2.911"
syn_tco178 = " RX_FWF_CLK->RX_DATA[8] = 2.841"
syn_tco179 = " RX_FWF_CLK->RX_DATA[9] = 2.840"
syn_tco180 = " RX_FWF_CLK->RX_VAL = 2.295"
syn_tpd181 = " TX_DATA[0]->PCS_DEBUG[14] = 6.324"
syn_tpd182 = " TX_DATA[0]->PCS_DEBUG[4] = 6.481"
syn_tpd183 = " TX_DATA[12]->PCS_DEBUG[12] = 5.969"
syn_tpd184 = " TX_DATA[12]->PCS_DEBUG[17] = 6.360"
syn_tpd185 = " TX_DATA[12]->PCS_DEBUG[2] = 6.261"
syn_tpd186 = " TX_DATA[12]->PCS_DEBUG[7] = 5.739"
syn_tpd187 = " TX_DATA[13]->PCS_DEBUG[13] = 5.676"
syn_tpd188 = " TX_DATA[13]->PCS_DEBUG[18] = 6.510"
syn_tpd189 = " TX_DATA[13]->PCS_DEBUG[3] = 6.658"
syn_tpd190 = " TX_DATA[13]->PCS_DEBUG[8] = 6.140"
*/
/* synthesis black_box_pad_pin ="RX_N,RX_P,TX_N,TX_P" */
input  RX_REF_CLK;
input  [87:0] TX_DATA;
input  RX_FWF_EN;
input  TX_FWF_EN;
input  RX_SLIP;
input  PCS_ARST_N;
input  PMA_ARST_N;
input  RX_FWF_CLK;
input  TX_FWF_CLK;
output TX_CLK_STABLE;
output RX_VAL;
output RX_READY;
output RX_IDLE;
output [87:0] RX_DATA;
output RX_CLK_R;
output TX_CLK_R;
input  RX_N;
input  RX_P;
output TX_N;
output TX_P;
output [19:0] PCS_DEBUG;
input  REF_CLK_N;
input  REF_CLK_P;
output JA_CLK;
input  TX_BIT_CLK_0;
input  TX_BIT_CLK_1;
input  TX_PLL_LOCK_0;
input  TX_PLL_LOCK_1;
input  TX_PLL_REF_CLK_0;
input  TX_PLL_REF_CLK_1;
output TX_CLK_G;
output RX_CLK_G;
output PMA_DEBUG;
output [1:0] ARST_N;
input  DRI_CLK;
input  [10:0] DRI_CTRL;
input  [32:0] DRI_WDATA;
input  DRI_ARST_N;
output [32:0] DRI_RDATA;
output DRI_INTERRUPT;
input  M_AWADDR_HW_0;
input  M_AWADDR_HW_1;
input  M_AWADDR_HW_2;
input  M_AWADDR_HW_3;
input  M_AWADDR_HW_4;
input  M_AWADDR_HW_5;
input  M_AWADDR_HW_6;
input  M_AWADDR_HW_7;
input  M_AWADDR_HW_8;
input  M_AWADDR_HW_9;
input  M_AWADDR_HW_10;
input  M_AWADDR_HW_11;
input  M_AWADDR_HW_12;
input  M_AWADDR_HW_13;
input  M_AWADDR_HW_14;
input  M_AWADDR_HW_15;
input  M_AWADDR_HW_16;
input  M_AWADDR_HW_17;
input  M_AWADDR_HW_18;
input  M_AWADDR_HW_19;
input  M_AWADDR_HW_20;
input  M_AWADDR_HW_21;
input  M_AWADDR_HW_22;
input  M_AWADDR_HW_23;
input  M_AWADDR_HW_28;
input  M_AWADDR_HW_29;
input  M_AWADDR_HW_30;
input  M_AWADDR_HW_31;
output [63:0] M_RDATA_HW;
input  [63:0] M_WDATA_HW;
output S_AWADDR_HW_0;
output S_AWADDR_HW_1;
output S_AWADDR_HW_2;
output S_AWADDR_HW_3;
output S_AWADDR_HW_4;
output S_AWADDR_HW_5;
output S_AWADDR_HW_6;
output S_AWADDR_HW_7;
output S_AWADDR_HW_8;
output S_AWADDR_HW_9;
output S_AWADDR_HW_10;
output S_AWADDR_HW_11;
output S_AWADDR_HW_12;
output S_AWADDR_HW_13;
output S_AWADDR_HW_14;
output S_AWADDR_HW_15;
output S_AWADDR_HW_16;
output S_AWADDR_HW_17;
output S_AWADDR_HW_18;
output S_AWADDR_HW_19;
output S_AWADDR_HW_20;
output S_AWADDR_HW_21;
output S_AWADDR_HW_22;
output S_AWADDR_HW_23;
output S_AWADDR_HW_28;
output S_AWADDR_HW_30;
output S_AWADDR_HW_31;
output PHYSTATUS_0;
input  [1:0] POWERDOWN;
input  [1:0] RATE;
input  RESET_N;
output [31:0] RXDATA_0;
output [3:0] RXDATAK_0;
output RXELECIDLE_0;
input  RXPOLARITY_0;
input  RXSTANDBYSTATUS_0;
output [2:0] RXSTATUS_0;
output RXVALID_0;
input  TXCOMPLIANCE_0;
input  [31:0] TXDATA_0;
input  [3:0] TXDATAK_0;
input  TXDATAVALID_0;
input  TXDEEMPH;
input  TXDETECTRX_LOOPBACK_0;
input  TXELECIDLE_0;
input  [2:0] TXMARGIN;
input  TXSWING;
input  PIPE_CLK_0;
output PCLK_OUT_0;
input  AXI_CLK;
input  M_ARADDR_HW_0;
input  M_ARADDR_HW_1;
input  M_ARADDR_HW_2;
input  M_ARADDR_HW_3;
input  M_ARADDR_HW_4;
input  M_ARADDR_HW_5;
input  M_ARADDR_HW_6;
input  M_ARADDR_HW_7;
input  M_ARADDR_HW_8;
input  M_ARADDR_HW_9;
input  M_ARADDR_HW_10;
input  M_ARADDR_HW_11;
input  M_ARADDR_HW_12;
input  M_ARADDR_HW_13;
input  M_ARADDR_HW_14;
input  M_ARADDR_HW_15;
input  M_ARADDR_HW_16;
input  M_ARADDR_HW_17;
input  M_ARADDR_HW_18;
input  M_ARADDR_HW_19;
input  M_ARADDR_HW_20;
input  M_ARADDR_HW_21;
input  M_ARADDR_HW_22;
input  M_ARADDR_HW_23;
input  M_ARADDR_HW_28;
input  M_ARADDR_HW_29;
input  M_ARADDR_HW_30;
input  M_ARADDR_HW_31;
output S_ARADDR_HW_0;
output S_ARADDR_HW_1;
output S_ARADDR_HW_2;
output S_ARADDR_HW_3;
output S_ARADDR_HW_4;
output S_ARADDR_HW_5;
output S_ARADDR_HW_6;
output S_ARADDR_HW_7;
output S_ARADDR_HW_8;
output S_ARADDR_HW_9;
output S_ARADDR_HW_10;
output S_ARADDR_HW_11;
output S_ARADDR_HW_12;
output S_ARADDR_HW_13;
output S_ARADDR_HW_14;
output S_ARADDR_HW_15;
output S_ARADDR_HW_16;
output S_ARADDR_HW_17;
output S_ARADDR_HW_18;
output S_ARADDR_HW_19;
output S_ARADDR_HW_20;
output S_ARADDR_HW_21;
output S_ARADDR_HW_22;
output S_ARADDR_HW_23;
output S_ARADDR_HW_28;
output S_ARADDR_HW_30;
output S_ARADDR_HW_31;
input  [63:0] S_RDATA_HW;
output [63:0] S_WDATA_HW;
input  LINK_CLK;
input  [2:0] LINK_ADDR;
input  LINK_EN;
input  LINK_ARST_N;
input  [3:0] LINK_WDATA;
output [3:0] LINK_RDATA;
parameter MAIN_QMUX_R0_QRST0_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST1_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST2_SRC = 3'h0;
parameter MAIN_QMUX_R0_QRST3_SRC = 3'h0;
parameter MSC_UNIQUE = "";
parameter JA_REF_CLK_SEL = "";
parameter DATA_RATE = 0.0;
parameter REG_FILE = "";
parameter INTERFACE_LEVEL = 3'h0;
parameter GPSSMAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_V_MAP = 1'h0;
parameter GPSSMAIN_SOFT_RESET_PERIPH = 1'h0;
parameter GPSSMAIN_SPARE_SCRATCHPAD = 8'h0;
parameter GPSSMAIN_SPARE_SPARE_CTRL = 24'h0;
parameter PMA_CMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_CMN_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_MODE = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_ENTERM = 2'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK1_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_DUALCLK0_EN_HYST = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_RDIFF = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_P = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_UDRIVE_N = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_PULLUP = 1'h0;
parameter PMA_CMN_TXPLL_CLKBUF_TXPLL_CLKBUF_EN_APAD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_BWSEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_VBGREF_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FBDIV_SEL = 2'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_DSMPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PHASESTEPAMOUNT = 8'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_STEP_PHASE = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_PD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_AUXDIVPD = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESETEN = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_CLKRESET = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL_TXPLL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_RESET_RTL = 1'h0;
parameter PMA_CMN_TXPLL_CTRL_TXPLL_FOUTAUXDIV2_SEL = 1'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_REFCLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_HM = 2'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CASCADE_CLK_SEL_SM = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_TXPLL_JA_FREF_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN01_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_LN23_INT_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_UP_SEL = 3'h0;
parameter PMA_CMN_TXPLL_CLK_SEL_CDRCLK_OUT_DN_SEL = 3'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_AUXDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_1_TXPLL_FBDIV = 12'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_FRAC = 24'h0;
parameter PMA_CMN_TXPLL_DIV_2_TXPLL_REFDIV = 6'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFIN = 16'h0;
parameter PMA_CMN_TXPLL_JA_1_TXPLL_JA_DIVFFB = 16'h0;
parameter PMA_CMN_TXPLL_JA_2_TXPLL_JA_SYNCCNTMAX = 32'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_CNTOFFSET = 16'h0;
parameter PMA_CMN_TXPLL_JA_3_TXPLL_JA_TARGETCNT = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_OTDLY = 16'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FMI = 8'h0;
parameter PMA_CMN_TXPLL_JA_4_TXPLL_JA_FKI = 5'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMP2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI1 = 8'h0;
parameter PMA_CMN_TXPLL_JA_5_TXPLL_JA_PMI2 = 8'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKP2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI1 = 5'h0;
parameter PMA_CMN_TXPLL_JA_6_TXPLL_JA_PKI2 = 5'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_DELAYK = 24'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_FDONLY = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_ONTARGETOV = 1'h0;
parameter PMA_CMN_TXPLL_JA_7_TXPLL_JA_PROGRAM = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_FRAC_PRESET = 24'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_PRESET_EN = 1'h0;
parameter PMA_CMN_TXPLL_JA_8_TXPLL_JA_HOLD = 1'h0;
parameter PMA_CMN_TXPLL_JA_9_TXPLL_JA_INT_PRESET = 12'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FFB_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_FIN_EXT = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_OVERRIDE = 1'h0;
parameter PMA_CMN_TXPLL_JA_RST_TXPLL_JA_RESET_CLKS_EXT = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DOWNSPREAD = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DISABLE_SSCG = 1'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SPREAD = 5'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_DIVVAL = 6'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_EXT_MAXADDR = 8'h0;
parameter PMA_CMN_SERDES_SSMOD_SSMOD_SEL_EXTWAVE = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_SEL = 2'h0;
parameter PMA_CMN_SERDES_SSMOD_RN_FILTER = 1'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL85 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL100 = 4'h0;
parameter PMA_CMN_SERDES_RTERM_RTERMCAL150 = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CAL_TERM = 4'h0;
parameter PMA_CMN_SERDES_RTT_RTT_CURRENT_PROG = 2'h0;
parameter PMA_SOFT_RESET_NV_MAP = 1'h0;
parameter PMA_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_DES_CDR_CTRL_1_DCFBEN_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR0 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR1 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR2 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_H0CDR3 = 5'h0;
parameter PMA_DES_CDR_CTRL_1_CMRTRIM_CDR = 3'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_2_CSENT3_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_SEL = 1'h0;
parameter PMA_DES_CDR_CTRL_3_SLIP_DES_CDR_EN = 1'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CSENT3_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_1_CMRTRIM_DFEEM = 3'h0;
parameter PMA_DES_DFEEM_CTRL_2_H1 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H2 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H3 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_2_H4 = 5'h0;
parameter PMA_DES_DFEEM_CTRL_3_H5 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_DCFBEN_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE0 = 5'h0;
parameter PMA_DES_DFE_CTRL_1_H0DFE1 = 5'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_TH_DFE = 8'h0;
parameter PMA_DES_DFE_CTRL_2_PHICTRL_GRAY_DFE = 3'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_SEL = 1'h0;
parameter PMA_DES_DFE_CTRL_2_SLIP_DES_DFE_EN = 1'h0;
parameter PMA_DES_EM_CTRL_1_DCFBEN_EM = 1'h0;
parameter PMA_DES_EM_CTRL_1_H0EM0 = 5'h0;
parameter PMA_DES_EM_CTRL_1_H0EM1 = 5'h0;
parameter PMA_DES_EM_CTRL_1_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_TH_EM = 8'h0;
parameter PMA_DES_EM_CTRL_2_PHICTRL_GRAY_EM = 3'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_SEL = 1'h0;
parameter PMA_DES_EM_CTRL_2_SLIP_DES_EM_EN = 1'h0;
parameter PMA_DES_RTL_EM_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_RTL_EM_EYEMONITOR_SAMPLE_COUNT = 12'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE_FROMFAB = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTSEL = 3'h0;
parameter PMA_DES_TEST_BUS_RXDTESTEN = 1'h0;
parameter PMA_DES_TEST_BUS_RXDTESTSEL = 3'h0;
parameter PMA_DES_CLK_CTRL_RXBYPASSEN = 1'h0;
parameter PMA_DES_RSTPD_RXPD = 1'h0;
parameter PMA_DES_RSTPD_RESETDES = 1'h0;
parameter PMA_DES_RSTPD_PDDFE = 1'h0;
parameter PMA_DES_RSTPD_PDEM = 1'h0;
parameter PMA_DES_RSTPD_RCVEN = 1'h0;
parameter PMA_DES_RSTPD_RESET_FIFO = 1'h0;
parameter PMA_DES_RTL_ERR_CHK_READ_ERROR = 1'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_PCIE1_2_RXPLL_DIV_PCIE2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA1_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA1_2_RXPLL_DIV_SATA2_RXPLL_RANGE = 2'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_SATA3_RXPLL_DIV_SATA3_RXPLL_RANGE = 2'h0;
parameter PMA_SER_CTRL_CMSTEP_VALUE = 1'h0;
parameter PMA_SER_CTRL_CMSTEP = 1'h0;
parameter PMA_SER_CTRL_NLPBK_EN = 1'h0;
parameter PMA_SER_CTRL_HSLPBKEN = 1'h0;
parameter PMA_SER_CTRL_HSLPBK_SEL = 3'h0;
parameter PMA_SER_RSTPD_RESETSEREN = 1'h0;
parameter PMA_SER_RSTPD_RESETSER = 1'h0;
parameter PMA_SER_RSTPD_TXPD = 1'h0;
parameter PMA_SER_DRV_BYP_BYPASSSER = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_COUNT_THRESHOLD = 14'h0;
parameter PMA_SER_RXDET_CTRL_RX_DETECT_EN = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_START = 1'h0;
parameter PMA_SER_STATIC_LSB_STATIC_PATTERN_LSB = 20'h0;
parameter PMA_SER_STATIC_MSB_STATIC_PATTERN_MSB = 20'h0;
parameter PMA_SER_TEST_BUS_TXATESTSEL = 3'h0;
parameter PMA_SER_TEST_BUS_DTESTEN_RTL = 1'h0;
parameter PMA_SER_TEST_BUS_DTESTSEL_RTL = 4'h0;
parameter PMA_SER_TEST_BUS_JTAG_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_TEST_BUS_PRBSERR_TO_DTEST_SEL = 2'h0;
parameter PMA_SER_TEST_BUS_RXPKDETOUT_TO_DTEST_SEL = 3'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_3P5DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_FS_6P0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M0_TXDRVTRIM_HS_0DB_M0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_3P5DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_FS_6P0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M1_TXDRVTRIM_HS_0DB_M1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_3P5DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_FS_6P0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M2_TXDRVTRIM_HS_0DB_M2 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_3P5DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_FS_6P0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M3_TXDRVTRIM_HS_0DB_M3 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_3P5DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_FS_6P0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M4_TXDRVTRIM_HS_0DB_M4 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_3P5DB_1 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_0 = 6'h0;
parameter PMA_SER_DRV_CTRL_M5_TXDRVTRIM_BEACON_6P0DB_1 = 6'h0;
parameter PMA_SERDES_RTL_CTRL_RESET_RTL = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_PRBSMODE = 3'h0;
parameter PMA_SERDES_RTL_CTRL_TX_DATA_SELECT = 3'h0;
parameter PMA_SERDES_RTL_CTRL_RX_DATA_SELECT = 2'h0;
parameter PMA_SERDES_RTL_CTRL_RX_FIFO_INPUT_SELECT_NEIGHBOR = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_EYEMONITOR_COMPARISON_DATA_SEL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_CEN = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_DFE_CAL_RESET = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_FE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_DFE_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_EN_OFFSET_CAL = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_WAIT_PERIOD_GOOD_LOCK = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_CTLE_OFFSET_CAL = 6'h0;
parameter PMA_DES_DFE_CAL_CTRL_0_NUM_SAMPLES_GOOD_LOCK = 8'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_BYPASS_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_EM_ONLY = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCEH = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_PHASE_DIRECTION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_CLKDIV = 4'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FREQUENCY = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_FORCE_CDR_COEFFS = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_DFE_CAL_NUM_COEFFS = 3'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_DFE_CYCLES = 5'h0;
parameter PMA_DES_DFE_CAL_CTRL_1_MAX_AREA_CYCLES = 2'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_DFE1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM0 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SETALT_OFFSET_EM1 = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_SET_DFE_COEFFS_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CTRL_2_ERROR_THR_CHANNEL_ALIGN = 12'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL0_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL1_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL2_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL3_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL4_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL5_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL6_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CTLE_OFFSET_CAL7_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_AREA_COMPUTE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CHANNEL_ALIGN_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_CENTER_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_HORIZONTAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_VERTICAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_DFECAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FE_CALIBRATION_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_FULL_CAL_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_GOOD_LOCK_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_DFE_USER = 1'h0;
parameter PMA_DES_DFE_CAL_CMD_RUN_STEP_PHASE_EM_USER = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0CDR = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H0EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H1 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H2 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H3 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H4 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_H5 = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CALIBRATION_CLK_EN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CDRCTLE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_CTLEEN_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_DFE = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_PHICTRL_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RCVEN = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST1_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RST2_DFEEM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_RUN_EYEMONITOR_COMPARISON = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_SLIP_DES_EM = 1'h0;
parameter PMA_DES_DFE_CAL_BYPASS_SEL_LOCK_OVERRIDE = 1'h0;
parameter PCSCMN_SOFT_RESET_NV_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_V_MAP = 1'h0;
parameter PCSCMN_SOFT_RESET_PERIPH = 1'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_0_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_1_SEL = 5'h0;
parameter PCSCMN_GSSCLK_CTRL_MCLK_GSSCLK_2_SEL = 5'h0;
parameter PCSCMN_QRST_R0_QRST0_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST0_RST_SEL = 4'h0;
parameter PCSCMN_QRST_R0_QRST1_LANE = 2'h0;
parameter PCSCMN_QRST_R0_QRST1_RST_SEL = 4'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_MODE = 3'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_X = 2'h0;
parameter PCSCMN_QDBG_R0_PCS_DBG_LANE_Y = 2'h0;
parameter PCS_SOFT_RESET_NV_MAP = 1'h0;
parameter PCS_SOFT_RESET_V_MAP = 1'h0;
parameter PCS_LFWF_R0_RXFWF_WMARK = 1'h0;
parameter PCS_LFWF_R0_TXFWF_WMARK = 1'h0;
parameter PCS_LPIP_R0_PIPE_SHAREDPLL = 1'h0;
parameter PCS_LPIP_R0_PIPE_INITIALIZATION_DONE = 1'h0;
parameter PCS_LPIP_R0_PIPE_OOB_IDLEBURST_TIMING = 2'h0;
parameter PCS_L64_R0_L64_CFG_BER_1US_TIMER_VAL = 11'h0;
parameter PCS_L64_R1_L64_BYPASS_TEST = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATTERN_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_TYPE_SEL = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PRBS31_EN = 1'h0;
parameter PCS_L64_R1_L64_CFG_TEST_PATT_DATA_SEL = 1'h0;
parameter PCS_L64_R2_L64_SEED_A_VALUE_LO32 = 32'h0;
parameter PCS_L64_R3_L64_SEED_A_VALUE_HI26 = 26'h0;
parameter PCS_L64_R4_L64_SEED_B_VALUE_LO32 = 32'h0;
parameter PCS_L64_R5_L64_SEED_B_VALUE_HI26 = 26'h0;
parameter PCS_L64_R6_L64_TX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R6_L64_TX_ADD_UI = 16'h0;
parameter PCS_L64_R7_L64_RX_ADV_CYC_DLY = 5'h0;
parameter PCS_L64_R7_L64_RX_ADD_UI = 16'h0;
parameter PCS_L8_R0_L8_TXENCSWAPSEL = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_RX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_CDR_RESETS_PCS_RX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_RXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PCS_TX_DIV2_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_ULCKD_PLL_RESETS_PCS_TX = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_TXFWF_RESET = 1'h0;
parameter PCS_LRST_R0_LRST_SOFT_PIPE_RESET = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_RX = 1'h0;
parameter PCS_LRST_OPT_LRST_DISABLE_FAB_PCS_RESET_FOR_TX = 1'h0;
parameter PCS_OOB_R0_OOB_BURST_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_BURST_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R0_OOB_WAKE_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_RST_INIT_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MIN_CYCLE = 8'h0;
parameter PCS_OOB_R1_OOB_SAS_MAX_CYCLE = 8'h0;
parameter PCS_OOB_R2_TXOOB_PROG_DATA_L32B = 32'h0;
parameter PCS_OOB_R3_TXOOB_PROG_DATA_H8B = 8'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_ENTER_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_P2_EXIT_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_RXPLL_FLOCK_SEL = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT_MASK = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_LOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R0_PMA_TXPLL_UNLOCK_INT = 1'h0;
parameter PCS_PMA_CTRL_R1_RXBEACON_MAX_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R1_TXBEACON_PULSE_WIDTH = 12'h0;
parameter PCS_PMA_CTRL_R2_PD_PLL_CNT = 8'h0;
parameter PCS_PMA_CTRL_R2_PIPE_RATE_INIT = 2'h0;
parameter PCS_PMA_CTRL_R2_FAB_DRIVES_TXPADS = 1'h0;
parameter PCS_MSTR_CTRL_LANE_MSTR = 2'h0;
parameter MAIN_SOFT_RESET_PERIPH = 1'h0;
parameter MAIN_SOFT_RESET_NV_MAP = 1'h0;
parameter MAIN_SOFT_RESET_V_MAP = 1'h0;
parameter PMA_SOFT_RESET_PERIPH = 1'h0;
parameter PMA_DES_CDR_CTRL_3_CST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_CST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST1_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RST2_CDR = 2'h0;
parameter PMA_DES_CDR_CTRL_3_RXDRV_CDR = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_CST2_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST1_DFEEM = 2'h0;
parameter PMA_DES_DFEEM_CTRL_3_RST2_DFEEM = 2'h0;
parameter PMA_DES_DFE_CTRL_2_RXDRV_DFE = 2'h0;
parameter PMA_DES_DFE_CTRL_2_CTLEEN_DFE = 1'h0;
parameter PMA_DES_EM_CTRL_2_RXDRV_EM = 2'h0;
parameter PMA_DES_EM_CTRL_2_CTLEEN_EM = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM = 4'h0;
parameter PMA_DES_IN_TERM_RXTEN = 1'h0;
parameter PMA_DES_IN_TERM_RXRTRIM_SEL = 2'h0;
parameter PMA_DES_IN_TERM_ACCOUPLE_RXVCM_EN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETEN = 1'h0;
parameter PMA_DES_PKDET_RXPKDETRANGE = 1'h0;
parameter PMA_DES_PKDET_RXPKDET_LOW_THRESHOLD = 3'h0;
parameter PMA_DES_PKDET_RXPKDET_HIGH_THRESHOLD = 3'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_MODE = 1'h0;
parameter PMA_DES_RTL_LOCK_CTRL_LOCK_OVERRIDE = 2'h0;
parameter PMA_DES_RTL_LOCK_CTRL_FDET_SAMPLE_PERIODS = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_FBDIV = 8'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_REFDIV = 5'h0;
parameter PMA_DES_RXPLL_DIV_RXPLL_RANGE = 2'h0;
parameter PMA_DES_RXPLL_DIV_CDR_GAIN = 1'h0;
parameter PMA_DES_TEST_BUS_RXATESTEN = 1'h0;
parameter PMA_DES_CLK_CTRL_RXREFCLK_SEL = 3'h0;
parameter PMA_DES_CLK_CTRL_DESMODE = 3'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKEN = 1'h0;
parameter PMA_DES_CLK_CTRL_DATALOCKDIVEN = 1'h0;
parameter PMA_SER_CTRL_TXVBGREF_SEL = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIVEN = 1'h0;
parameter PMA_SER_CLK_CTRL_TXPOSTDIV = 2'h0;
parameter PMA_SER_CLK_CTRL_TXBITCLKSEL = 1'h0;
parameter PMA_SER_CLK_CTRL_SERMODE = 3'h0;
parameter PMA_SER_DRV_BYP_BYPASS_VALUE = 8'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT_RTL = 2'h0;
parameter PMA_SER_DRV_BYP_TX_BYPASS_SELECT = 1'h0;
parameter PMA_SER_RXDET_CTRL_RXDETECT_STEP_WAIT_COUNT = 5'h0;
parameter PMA_SER_TERM_CTRL_TXCM_LEVEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXTEN = 1'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM_SEL = 2'h0;
parameter PMA_SER_TERM_CTRL_TXRTRIM = 4'h0;
parameter PMA_SER_TEST_BUS_TXATESTEN = 1'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDEL = 16'h0;
parameter PMA_SER_DRV_DATA_CTRL_TXDATA_INV = 8'h0;
parameter PMA_SER_DRV_CTRL_TXDRVTRIM = 24'h0;
parameter PMA_SER_DRV_CTRL_TXDRV = 3'h0;
parameter PMA_SER_DRV_CTRL_TXITRIM = 2'h0;
parameter PMA_SER_DRV_CTRL_TXODRV = 2'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDRV_CTRL_SEL = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXODRV_BOOSTER = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXMARGIN = 3'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXSWING = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS = 1'h0;
parameter PMA_SER_DRV_CTRL_SEL_TXDEEMPHASIS_BEACON = 1'h0;
parameter PMA_SERDES_RTL_CTRL_RX_HALF_RATE10BIT = 1'h0;
parameter PMA_SERDES_RTL_CTRL_TX_HALF_RATE10BIT = 1'h0;
parameter PCS_SOFT_RESET_PERIPH = 1'h0;
parameter PCS_LFWF_R0_RXFWF_RATIO = 2'h0;
parameter PCS_LFWF_R0_TXFWF_RATIO = 2'h0;
parameter PCS_LOVR_R0_FAB_IFC_MODE = 4'h0;
parameter PCS_LOVR_R0_PCSPMA_IFC_MODE = 4'h0;
parameter PCS_LPIP_R0_PIPEENABLE = 1'h0;
parameter PCS_LPIP_R0_PIPEMODE = 1'h0;
parameter PCS_LPIP_R0_PIPE_PCIE_HC = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_SCRAMBLER = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_DISPARITY = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_GEARBOX = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_64B67B = 1'h0;
parameter PCS_L64_R0_L64_CFG_BER_MON_EN = 1'h0;
parameter PCS_L64_R0_L64_CFG_BYPASS_8B_MODE = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C49 = 1'h0;
parameter PCS_L64_R0_L64_CFG_GRBX_SM_C82 = 1'h0;
parameter PCS_L8_R0_L8_GEARMODE = 2'h0;
parameter PCS_LNTV_R0_LNTV_RX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_RX_IN_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_RX_MODE = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_GEAR = 1'h0;
parameter PCS_LNTV_R0_LNTV_TX_OUT_WIDTH = 3'h0;
parameter PCS_LNTV_R0_LNTV_TX_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_EPCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_TMG_MODE = 1'h0;
parameter PCS_LCLK_R0_LCLK_PCS_RX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_PCS_TX_CLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_TXFWF_RCLK_SEL = 2'h0;
parameter PCS_LCLK_R0_LCLK_RXFWF_WCLK_PIPE = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_RX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_64B6XB_TX_CLK_DIV2 = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_8B10B_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_RXFWF_WCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TX_CLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_NATIVE_TXFWF_RCLK = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_LCL = 1'h0;
parameter PCS_LCLK_R1_LCLK_ENA_PIPE_OUT = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_PIPE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P0S_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P1_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FLASH_FREEZE_P2_EN = 1'h0;
parameter PCS_PMA_CTRL_R0_FAB_EPCS_PMA_RESET_B_EN = 1'h0;

endmodule
`timescale 1 ns/100 ps
// Version: 


module CORELNKTMR_V(
       CTRL_CLK,
       CTRL_ARST_N,
       CTRL_SRST_N,
       LTPULSE
    ) ;
/* synthesis syn_black_box

*/
/* synthesis black_box_pad_pin ="" */
input  CTRL_CLK;
input  CTRL_ARST_N;
output CTRL_SRST_N;
output [20:0] LTPULSE;

endmodule

module CLKBUF_DIFF(
       Y,
       PADP,
       PADN
    ) ;
/* synthesis syn_black_box */
/* synthesis black_box_pad_pin = "PADN,PADP" */
output Y;
input  PADP, PADN;

endmodule

module CLKBUF_DIFF_ODT(
       Y,
       PADP,
       PADN,
       ODT_EN
    ) ;
/* synthesis syn_black_box */
/* synthesis black_box_pad_pin = "PADN,PADP" */
output Y;
input  PADP, PADN, ODT_EN;

endmodule

