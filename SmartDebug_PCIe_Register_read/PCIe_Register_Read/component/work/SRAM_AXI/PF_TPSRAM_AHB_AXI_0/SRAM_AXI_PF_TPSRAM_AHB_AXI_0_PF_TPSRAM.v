`timescale 1 ns/100 ps
// Version: 2022.1 2022.1.0.1


module SRAM_AXI_PF_TPSRAM_AHB_AXI_0_PF_TPSRAM(
       W_DATA,
       R_DATA,
       W_ADDR,
       R_ADDR,
       W_EN,
       R_EN,
       CLK,
       WBYTE_EN
    );
input  [79:0] W_DATA;
output [79:0] R_DATA;
input  [8:0] W_ADDR;
input  [8:0] R_ADDR;
input  W_EN;
input  R_EN;
input  CLK;
input  [7:0] WBYTE_EN;

    wire \BLKX1WBYTEEN[0] , \BLKX1WBYTEEN[1] , \ACCESS_BUSY[0][0] , 
        \ACCESS_BUSY[0][1] , VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("SRAM_AXI%512-512%80-80%POWER%0%0%TWO-PORT%ECC_EN-0")
         )  SRAM_AXI_PF_TPSRAM_AHB_AXI_0_PF_TPSRAM_R0C0 (.A_DOUT({
        R_DATA[39], R_DATA[38], R_DATA[37], R_DATA[36], R_DATA[35], 
        R_DATA[34], R_DATA[33], R_DATA[32], R_DATA[31], R_DATA[30], 
        R_DATA[29], R_DATA[28], R_DATA[27], R_DATA[26], R_DATA[25], 
        R_DATA[24], R_DATA[23], R_DATA[22], R_DATA[21], R_DATA[20]}), 
        .B_DOUT({R_DATA[19], R_DATA[18], R_DATA[17], R_DATA[16], 
        R_DATA[15], R_DATA[14], R_DATA[13], R_DATA[12], R_DATA[11], 
        R_DATA[10], R_DATA[9], R_DATA[8], R_DATA[7], R_DATA[6], 
        R_DATA[5], R_DATA[4], R_DATA[3], R_DATA[2], R_DATA[1], 
        R_DATA[0]}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][0] ), .A_ADDR({R_ADDR[8], R_ADDR[7], R_ADDR[6], 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[39], W_DATA[38], W_DATA[37], 
        W_DATA[36], W_DATA[35], W_DATA[34], W_DATA[33], W_DATA[32], 
        W_DATA[31], W_DATA[30], W_DATA[29], W_DATA[28], W_DATA[27], 
        W_DATA[26], W_DATA[25], W_DATA[24], W_DATA[23], W_DATA[22], 
        W_DATA[21], W_DATA[20]}), .A_REN(R_EN), .A_WEN({WBYTE_EN[3], 
        WBYTE_EN[2]}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[8], W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, 
        \BLKX1WBYTEEN[0] , VCC}), .B_CLK(CLK), .B_DIN({W_DATA[19], 
        W_DATA[18], W_DATA[17], W_DATA[16], W_DATA[15], W_DATA[14], 
        W_DATA[13], W_DATA[12], W_DATA[11], W_DATA[10], W_DATA[9], 
        W_DATA[8], W_DATA[7], W_DATA[6], W_DATA[5], W_DATA[4], 
        W_DATA[3], W_DATA[2], W_DATA[1], W_DATA[0]}), .B_REN(VCC), 
        .B_WEN({WBYTE_EN[1], WBYTE_EN[0]}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    OR4 \OR4BLKX1WBYTEEN[1]  (.A(WBYTE_EN[4]), .B(WBYTE_EN[5]), .C(
        WBYTE_EN[6]), .D(WBYTE_EN[7]), .Y(\BLKX1WBYTEEN[1] ));
    OR4 \OR4BLKX1WBYTEEN[0]  (.A(WBYTE_EN[0]), .B(WBYTE_EN[1]), .C(
        WBYTE_EN[2]), .D(WBYTE_EN[3]), .Y(\BLKX1WBYTEEN[0] ));
    RAM1K20 #( .RAMINDEX("SRAM_AXI%512-512%80-80%POWER%0%1%TWO-PORT%ECC_EN-0")
         )  SRAM_AXI_PF_TPSRAM_AHB_AXI_0_PF_TPSRAM_R0C1 (.A_DOUT({
        R_DATA[79], R_DATA[78], R_DATA[77], R_DATA[76], R_DATA[75], 
        R_DATA[74], R_DATA[73], R_DATA[72], R_DATA[71], R_DATA[70], 
        R_DATA[69], R_DATA[68], R_DATA[67], R_DATA[66], R_DATA[65], 
        R_DATA[64], R_DATA[63], R_DATA[62], R_DATA[61], R_DATA[60]}), 
        .B_DOUT({R_DATA[59], R_DATA[58], R_DATA[57], R_DATA[56], 
        R_DATA[55], R_DATA[54], R_DATA[53], R_DATA[52], R_DATA[51], 
        R_DATA[50], R_DATA[49], R_DATA[48], R_DATA[47], R_DATA[46], 
        R_DATA[45], R_DATA[44], R_DATA[43], R_DATA[42], R_DATA[41], 
        R_DATA[40]}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][1] ), .A_ADDR({R_ADDR[8], R_ADDR[7], R_ADDR[6], 
        R_ADDR[5], R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], 
        R_ADDR[0], GND, GND, GND, GND, GND}), .A_BLK_EN({VCC, VCC, VCC})
        , .A_CLK(CLK), .A_DIN({W_DATA[79], W_DATA[78], W_DATA[77], 
        W_DATA[76], W_DATA[75], W_DATA[74], W_DATA[73], W_DATA[72], 
        W_DATA[71], W_DATA[70], W_DATA[69], W_DATA[68], W_DATA[67], 
        W_DATA[66], W_DATA[65], W_DATA[64], W_DATA[63], W_DATA[62], 
        W_DATA[61], W_DATA[60]}), .A_REN(R_EN), .A_WEN({WBYTE_EN[7], 
        WBYTE_EN[6]}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[8], W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, 
        \BLKX1WBYTEEN[1] , VCC}), .B_CLK(CLK), .B_DIN({W_DATA[59], 
        W_DATA[58], W_DATA[57], W_DATA[56], W_DATA[55], W_DATA[54], 
        W_DATA[53], W_DATA[52], W_DATA[51], W_DATA[50], W_DATA[49], 
        W_DATA[48], W_DATA[47], W_DATA[46], W_DATA[45], W_DATA[44], 
        W_DATA[43], W_DATA[42], W_DATA[41], W_DATA[40]}), .B_REN(VCC), 
        .B_WEN({WBYTE_EN[5], WBYTE_EN[4]}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(VCC), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({VCC, GND, VCC}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
