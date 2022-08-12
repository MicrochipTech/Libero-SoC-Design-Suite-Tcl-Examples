//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue May 17 09:02:29 2022
// Version: 2022.1 2022.1.0.1
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// PCIe_TL_CLK
module PCIe_TL_CLK(
    // Inputs
    CLK_125MHz,
    // Outputs
    BANK0_1_7_CALIB_DONE,
    DEVICE_INIT_DONE,
    TL_CLK
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  CLK_125MHz;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output BANK0_1_7_CALIB_DONE;
output DEVICE_INIT_DONE;
output TL_CLK;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   BANK0_1_7_CALIB_DONE_net_0;
wire   CLK_125MHz;
wire   CLK_DIV2_0_CLK_OUT;
wire   DEVICE_INIT_DONE_net_0;
wire   OSC_160MHz_0_RCOSC_160MHZ_CLK_DIV;
wire   PCIe_INIT_MONITOR_0_BANK_0_CALIB_STATUS;
wire   PCIe_INIT_MONITOR_0_BANK_1_CALIB_STATUS;
wire   PCIe_INIT_MONITOR_0_BANK_7_CALIB_STATUS;
wire   PCIe_INIT_MONITOR_0_PCIE_INIT_DONE;
wire   TL_CLK_net_0;
wire   DEVICE_INIT_DONE_net_1;
wire   BANK0_1_7_CALIB_DONE_net_1;
wire   TL_CLK_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign DEVICE_INIT_DONE_net_1     = DEVICE_INIT_DONE_net_0;
assign DEVICE_INIT_DONE           = DEVICE_INIT_DONE_net_1;
assign BANK0_1_7_CALIB_DONE_net_1 = BANK0_1_7_CALIB_DONE_net_0;
assign BANK0_1_7_CALIB_DONE       = BANK0_1_7_CALIB_DONE_net_1;
assign TL_CLK_net_1               = TL_CLK_net_0;
assign TL_CLK                     = TL_CLK_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND3
AND3 AND3_0(
        // Inputs
        .A ( PCIe_INIT_MONITOR_0_BANK_0_CALIB_STATUS ),
        .B ( PCIe_INIT_MONITOR_0_BANK_1_CALIB_STATUS ),
        .C ( PCIe_INIT_MONITOR_0_BANK_7_CALIB_STATUS ),
        // Outputs
        .Y ( BANK0_1_7_CALIB_DONE_net_0 ) 
        );

//--------CLK_DIV2
CLK_DIV2 CLK_DIV2_0(
        // Inputs
        .CLK_IN  ( OSC_160MHz_0_RCOSC_160MHZ_CLK_DIV ),
        // Outputs
        .CLK_OUT ( CLK_DIV2_0_CLK_OUT ) 
        );

//--------NGMUX
NGMUX NGMUX_0(
        // Inputs
        .CLK0    ( CLK_DIV2_0_CLK_OUT ),
        .CLK1    ( CLK_125MHz ),
        .SEL     ( PCIe_INIT_MONITOR_0_PCIE_INIT_DONE ),
        // Outputs
        .CLK_OUT ( TL_CLK_net_0 ) 
        );

//--------OSC_160MHz
OSC_160MHz OSC_160MHz_0(
        // Outputs
        .RCOSC_160MHZ_CLK_DIV ( OSC_160MHz_0_RCOSC_160MHZ_CLK_DIV ) 
        );

//--------PCIe_INIT_MONITOR
PCIe_INIT_MONITOR PCIe_INIT_MONITOR_0(
        // Outputs
        .FABRIC_POR_N               (  ),
        .PCIE_INIT_DONE             ( PCIe_INIT_MONITOR_0_PCIE_INIT_DONE ),
        .USRAM_INIT_DONE            (  ),
        .SRAM_INIT_DONE             (  ),
        .DEVICE_INIT_DONE           ( DEVICE_INIT_DONE_net_0 ),
        .BANK_0_CALIB_STATUS        ( PCIe_INIT_MONITOR_0_BANK_0_CALIB_STATUS ),
        .BANK_1_CALIB_STATUS        ( PCIe_INIT_MONITOR_0_BANK_1_CALIB_STATUS ),
        .BANK_2_CALIB_STATUS        (  ),
        .BANK_4_CALIB_STATUS        (  ),
        .BANK_5_CALIB_STATUS        (  ),
        .BANK_6_CALIB_STATUS        (  ),
        .BANK_7_CALIB_STATUS        ( PCIe_INIT_MONITOR_0_BANK_7_CALIB_STATUS ),
        .XCVR_INIT_DONE             (  ),
        .USRAM_INIT_FROM_SNVM_DONE  (  ),
        .USRAM_INIT_FROM_UPROM_DONE (  ),
        .USRAM_INIT_FROM_SPI_DONE   (  ),
        .SRAM_INIT_FROM_SNVM_DONE   (  ),
        .SRAM_INIT_FROM_UPROM_DONE  (  ),
        .SRAM_INIT_FROM_SPI_DONE    (  ),
        .AUTOCALIB_DONE             (  ) 
        );


endmodule
