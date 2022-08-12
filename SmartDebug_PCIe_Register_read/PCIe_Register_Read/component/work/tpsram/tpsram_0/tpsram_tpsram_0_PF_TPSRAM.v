`timescale 1 ns/100 ps
// Version: 2022.1 2022.1.0.1


module tpsram_tpsram_0_PF_TPSRAM(
       W_DATA,
       R_DATA,
       W_ADDR,
       R_ADDR,
       W_EN,
       CLK
    );
input  [63:0] W_DATA;
output [7:0] R_DATA;
input  [8:0] W_ADDR;
input  [11:0] R_ADDR;
input  W_EN;
input  CLK;

    wire \ACCESS_BUSY[0][0] , \ACCESS_BUSY[0][1] , VCC, GND, ADLIB_VCC;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign ADLIB_VCC = VCC_power_net1;
    
    RAM1K20 #( .RAMINDEX("tpsram_0%4096-512%8-64%SPEED%0%1%TWO-PORT%ECC_EN-0")
         )  tpsram_tpsram_0_PF_TPSRAM_R0C1 (.A_DOUT({nc0, nc1, nc2, 
        nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, nc13, 
        nc14, nc15, R_DATA[7], R_DATA[6], R_DATA[5], R_DATA[4]}), 
        .B_DOUT({nc16, nc17, nc18, nc19, nc20, nc21, nc22, nc23, nc24, 
        nc25, nc26, nc27, nc28, nc29, nc30, nc31, nc32, nc33, nc34, 
        nc35}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][1] ), .A_ADDR({R_ADDR[11], R_ADDR[10], 
        R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        W_DATA[63], W_DATA[62], W_DATA[61], W_DATA[60], GND, 
        W_DATA[55], W_DATA[54], W_DATA[53], W_DATA[52], GND, 
        W_DATA[47], W_DATA[46], W_DATA[45], W_DATA[44], GND, 
        W_DATA[39], W_DATA[38], W_DATA[37], W_DATA[36]}), .A_REN(VCC), 
        .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[8], W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, 
        VCC}), .B_CLK(CLK), .B_DIN({GND, W_DATA[31], W_DATA[30], 
        W_DATA[29], W_DATA[28], GND, W_DATA[23], W_DATA[22], 
        W_DATA[21], W_DATA[20], GND, W_DATA[15], W_DATA[14], 
        W_DATA[13], W_DATA[12], GND, W_DATA[7], W_DATA[6], W_DATA[5], 
        W_DATA[4]}), .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, VCC, GND}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    RAM1K20 #( .RAMINDEX("tpsram_0%4096-512%8-64%SPEED%0%0%TWO-PORT%ECC_EN-0")
         )  tpsram_tpsram_0_PF_TPSRAM_R0C0 (.A_DOUT({nc36, nc37, nc38, 
        nc39, nc40, nc41, nc42, nc43, nc44, nc45, nc46, nc47, nc48, 
        nc49, nc50, nc51, R_DATA[3], R_DATA[2], R_DATA[1], R_DATA[0]}), 
        .B_DOUT({nc52, nc53, nc54, nc55, nc56, nc57, nc58, nc59, nc60, 
        nc61, nc62, nc63, nc64, nc65, nc66, nc67, nc68, nc69, nc70, 
        nc71}), .DB_DETECT(), .SB_CORRECT(), .ACCESS_BUSY(
        \ACCESS_BUSY[0][0] ), .A_ADDR({R_ADDR[11], R_ADDR[10], 
        R_ADDR[9], R_ADDR[8], R_ADDR[7], R_ADDR[6], R_ADDR[5], 
        R_ADDR[4], R_ADDR[3], R_ADDR[2], R_ADDR[1], R_ADDR[0], GND, 
        GND}), .A_BLK_EN({VCC, VCC, VCC}), .A_CLK(CLK), .A_DIN({GND, 
        W_DATA[59], W_DATA[58], W_DATA[57], W_DATA[56], GND, 
        W_DATA[51], W_DATA[50], W_DATA[49], W_DATA[48], GND, 
        W_DATA[43], W_DATA[42], W_DATA[41], W_DATA[40], GND, 
        W_DATA[35], W_DATA[34], W_DATA[33], W_DATA[32]}), .A_REN(VCC), 
        .A_WEN({VCC, VCC}), .A_DOUT_EN(VCC), .A_DOUT_ARST_N(VCC), 
        .A_DOUT_SRST_N(VCC), .B_ADDR({W_ADDR[8], W_ADDR[7], W_ADDR[6], 
        W_ADDR[5], W_ADDR[4], W_ADDR[3], W_ADDR[2], W_ADDR[1], 
        W_ADDR[0], GND, GND, GND, GND, GND}), .B_BLK_EN({W_EN, VCC, 
        VCC}), .B_CLK(CLK), .B_DIN({GND, W_DATA[27], W_DATA[26], 
        W_DATA[25], W_DATA[24], GND, W_DATA[19], W_DATA[18], 
        W_DATA[17], W_DATA[16], GND, W_DATA[11], W_DATA[10], W_DATA[9], 
        W_DATA[8], GND, W_DATA[3], W_DATA[2], W_DATA[1], W_DATA[0]}), 
        .B_REN(VCC), .B_WEN({VCC, VCC}), .B_DOUT_EN(VCC), 
        .B_DOUT_ARST_N(GND), .B_DOUT_SRST_N(VCC), .ECC_EN(GND), 
        .BUSY_FB(GND), .A_WIDTH({GND, VCC, GND}), .A_WMODE({GND, GND}), 
        .A_BYPASS(VCC), .B_WIDTH({VCC, GND, VCC}), .B_WMODE({GND, GND})
        , .B_BYPASS(VCC), .ECC_BYPASS(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
