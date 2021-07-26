`timescale 1 ns/100 ps
// Version: v12.2 12.700.0.21


module PF_CCC_C0_PF_CCC_C0_0_PF_CCC(
       OUT0_HS_IO_CLK_0,
       OUT1_HS_IO_CLK_0,
       OUT2_FABCLK_0,
       OUT3_HS_IO_CLK_0,
       DRI_CLK_0,
       DRI_CTRL_0,
       DRI_WDATA_0,
       DRI_RDATA_0,
       DRI_ARST_N_0,
       DRI_INTERRUPT_0,
       PLL_LOCK_0,
       REF_CLK_0,
       PLL_POWERDOWN_N_0
    );
output OUT0_HS_IO_CLK_0;
output OUT1_HS_IO_CLK_0;
output OUT2_FABCLK_0;
output OUT3_HS_IO_CLK_0;
input  DRI_CLK_0;
input  [10:0] DRI_CTRL_0;
input  [32:0] DRI_WDATA_0;
output [32:0] DRI_RDATA_0;
input  DRI_ARST_N_0;
output DRI_INTERRUPT_0;
output PLL_LOCK_0;
input  REF_CLK_0;
input  PLL_POWERDOWN_N_0;

    wire gnd_net, vcc_net, pll_inst_0_hs_io_clk_3, 
        pll_inst_0_hs_io_clk_7, pll_inst_0_clkint_8, 
        pll_inst_0_hs_io_clk_15;
    
    HS_IO_CLK hs_io_clk_15 (.A(pll_inst_0_hs_io_clk_15), .Y(
        OUT3_HS_IO_CLK_0));
    CLKINT clkint_8 (.A(pll_inst_0_clkint_8), .Y(OUT2_FABCLK_0));
    PLL #( .VCOFREQUENCY(4800), .DELAY_LINE_SIMULATION_MODE(""), .DATA_RATE(0.0)
        , .FORMAL_NAME(""), .INTERFACE_NAME(""), .INTERFACE_LEVEL(3'b0)
        , .SOFTRESET(1'b0), .SOFT_POWERDOWN_N(1'b1), .RFDIV_EN(1'b1), .OUT0_DIV_EN(1'b1)
        , .OUT1_DIV_EN(1'b1), .OUT2_DIV_EN(1'b1), .OUT3_DIV_EN(1'b1), .SOFT_REF_CLK_SEL(1'b0)
        , .RESET_ON_LOCK(1'b1), .BYPASS_CLK_SEL(4'b0), .BYPASS_GO_EN_N(1'b1)
        , .BYPASS_PLL(4'b0), .BYPASS_OUT_DIVIDER(4'b0), .FF_REQUIRES_LOCK(1'b0)
        , .FSE_N(1'b0), .FB_CLK_SEL_0(2'b00), .FB_CLK_SEL_1(1'b0), .RFDIV(6'b000001)
        , .FRAC_EN(1'b0), .FRAC_DAC_EN(1'b0), .DIV0_RST_DELAY(3'b000)
        , .DIV0_VAL(7'b0000010), .DIV1_RST_DELAY(3'b000), .DIV1_VAL(7'b0000010)
        , .DIV2_RST_DELAY(3'b000), .DIV2_VAL(7'b0000100), .DIV3_RST_DELAY(3'b000)
        , .DIV3_VAL(7'b0000010), .DIV3_CLK_SEL(1'b0), .BW_INT_CTRL(2'b0)
        , .BW_PROP_CTRL(2'b11), .IREF_EN(1'b1), .IREF_TOGGLE(1'b0), .LOCK_CNT(4'b1000)
        , .DESKEW_CAL_CNT(3'b110), .DESKEW_CAL_EN(1'b1), .DESKEW_CAL_BYPASS(1'b0)
        , .SYNC_REF_DIV_EN(1'b0), .SYNC_REF_DIV_EN_2(1'b0), .OUT0_PHASE_SEL(3'b000)
        , .OUT1_PHASE_SEL(3'b100), .OUT2_PHASE_SEL(3'b000), .OUT3_PHASE_SEL(3'b000)
        , .SOFT_LOAD_PHASE_N(1'b1), .SSM_DIV_VAL(6'b1), .FB_FRAC_VAL(24'b0)
        , .SSM_SPREAD_MODE(1'b0), .SSM_MODULATION(5'b00101), .FB_INT_VAL(12'b000000011110)
        , .SSM_EN_N(1'b1), .SSM_EXT_WAVE_EN(2'b0), .SSM_EXT_WAVE_MAX_ADDR(8'b0)
        , .SSM_RANDOM_EN(1'b0), .SSM_RANDOM_PATTERN_SEL(3'b0), .CDMUX0_SEL(2'b0)
        , .CDMUX1_SEL(1'b1), .CDMUX2_SEL(1'b0), .CDELAY0_SEL(8'b0), .CDELAY0_EN(1'b0)
        , .DRI_EN(1'b1) )  pll_inst_0 (.LOCK(PLL_LOCK_0), 
        .SSCG_WAVE_TABLE_ADDR({nc0, nc1, nc2, nc3, nc4, nc5, nc6, nc7})
        , .DELAY_LINE_OUT_OF_RANGE(), .POWERDOWN_N(PLL_POWERDOWN_N_0), 
        .OUT0_EN(vcc_net), .OUT1_EN(vcc_net), .OUT2_EN(vcc_net), 
        .OUT3_EN(vcc_net), .REF_CLK_SEL(gnd_net), .BYPASS_EN_N(vcc_net)
        , .LOAD_PHASE_N(vcc_net), .SSCG_WAVE_TABLE({gnd_net, gnd_net, 
        gnd_net, gnd_net, gnd_net, gnd_net, gnd_net, gnd_net}), 
        .PHASE_DIRECTION(gnd_net), .PHASE_ROTATE(gnd_net), 
        .PHASE_OUT0_SEL(gnd_net), .PHASE_OUT1_SEL(gnd_net), 
        .PHASE_OUT2_SEL(gnd_net), .PHASE_OUT3_SEL(gnd_net), 
        .DELAY_LINE_MOVE(gnd_net), .DELAY_LINE_DIRECTION(gnd_net), 
        .DELAY_LINE_WIDE(gnd_net), .DELAY_LINE_LOAD(vcc_net), 
        .REFCLK_SYNC_EN(gnd_net), .REF_CLK_0(REF_CLK_0), .REF_CLK_1(
        gnd_net), .FB_CLK(gnd_net), .OUT0(pll_inst_0_hs_io_clk_3), 
        .OUT1(pll_inst_0_hs_io_clk_7), .OUT2(pll_inst_0_clkint_8), 
        .OUT3(pll_inst_0_hs_io_clk_15), .DRI_CLK(DRI_CLK_0), .DRI_CTRL({
        DRI_CTRL_0[10], DRI_CTRL_0[9], DRI_CTRL_0[8], DRI_CTRL_0[7], 
        DRI_CTRL_0[6], DRI_CTRL_0[5], DRI_CTRL_0[4], DRI_CTRL_0[3], 
        DRI_CTRL_0[2], DRI_CTRL_0[1], DRI_CTRL_0[0]}), .DRI_WDATA({
        DRI_WDATA_0[32], DRI_WDATA_0[31], DRI_WDATA_0[30], 
        DRI_WDATA_0[29], DRI_WDATA_0[28], DRI_WDATA_0[27], 
        DRI_WDATA_0[26], DRI_WDATA_0[25], DRI_WDATA_0[24], 
        DRI_WDATA_0[23], DRI_WDATA_0[22], DRI_WDATA_0[21], 
        DRI_WDATA_0[20], DRI_WDATA_0[19], DRI_WDATA_0[18], 
        DRI_WDATA_0[17], DRI_WDATA_0[16], DRI_WDATA_0[15], 
        DRI_WDATA_0[14], DRI_WDATA_0[13], DRI_WDATA_0[12], 
        DRI_WDATA_0[11], DRI_WDATA_0[10], DRI_WDATA_0[9], 
        DRI_WDATA_0[8], DRI_WDATA_0[7], DRI_WDATA_0[6], DRI_WDATA_0[5], 
        DRI_WDATA_0[4], DRI_WDATA_0[3], DRI_WDATA_0[2], DRI_WDATA_0[1], 
        DRI_WDATA_0[0]}), .DRI_ARST_N(DRI_ARST_N_0), .DRI_RDATA({
        DRI_RDATA_0[32], DRI_RDATA_0[31], DRI_RDATA_0[30], 
        DRI_RDATA_0[29], DRI_RDATA_0[28], DRI_RDATA_0[27], 
        DRI_RDATA_0[26], DRI_RDATA_0[25], DRI_RDATA_0[24], 
        DRI_RDATA_0[23], DRI_RDATA_0[22], DRI_RDATA_0[21], 
        DRI_RDATA_0[20], DRI_RDATA_0[19], DRI_RDATA_0[18], 
        DRI_RDATA_0[17], DRI_RDATA_0[16], DRI_RDATA_0[15], 
        DRI_RDATA_0[14], DRI_RDATA_0[13], DRI_RDATA_0[12], 
        DRI_RDATA_0[11], DRI_RDATA_0[10], DRI_RDATA_0[9], 
        DRI_RDATA_0[8], DRI_RDATA_0[7], DRI_RDATA_0[6], DRI_RDATA_0[5], 
        DRI_RDATA_0[4], DRI_RDATA_0[3], DRI_RDATA_0[2], DRI_RDATA_0[1], 
        DRI_RDATA_0[0]}), .DRI_INTERRUPT(DRI_INTERRUPT_0));
    VCC vcc_inst (.Y(vcc_net));
    HS_IO_CLK hs_io_clk_7 (.A(pll_inst_0_hs_io_clk_7), .Y(
        OUT1_HS_IO_CLK_0));
    HS_IO_CLK hs_io_clk_3 (.A(pll_inst_0_hs_io_clk_3), .Y(
        OUT0_HS_IO_CLK_0));
    GND gnd_inst (.Y(gnd_net));
    
endmodule
