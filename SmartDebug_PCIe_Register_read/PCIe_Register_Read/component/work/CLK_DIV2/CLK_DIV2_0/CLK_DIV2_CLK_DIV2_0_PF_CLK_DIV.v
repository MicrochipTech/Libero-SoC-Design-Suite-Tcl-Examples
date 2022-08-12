`timescale 1 ns/100 ps
// Version: 2022.1 2022.1.0.1


module CLK_DIV2_CLK_DIV2_0_PF_CLK_DIV(
       CLK_IN,
       CLK_OUT
    );
input  CLK_IN;
output CLK_OUT;

    wire GND_net, VCC_net;
    
    ICB_CLKDIV #( .DIVIDER(3'b010) )  I_CD (.RST_N(VCC_net), .BIT_SLIP(
        GND_net), .A(CLK_IN), .Y_DIV(CLK_OUT));
    VCC vcc_inst (.Y(VCC_net));
    GND gnd_inst (.Y(GND_net));
    
endmodule
