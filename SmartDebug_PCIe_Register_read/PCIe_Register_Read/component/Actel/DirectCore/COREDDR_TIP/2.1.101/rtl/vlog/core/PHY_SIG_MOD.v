
/// Header_Start --->>>



/// Header_End <<<---


/// I/O_Start --->>>

// Transfer output enable from the DFI interface to the IOG. Inserting required delays.

module PHY_SIG_MOD( SCLK,
                    reset_n,
                    dfi_rdlvl_en,
                    dfi_rdlvl_gate_en,
                    dfi_wrdata_en_p0,
                    dfi_wrdata_en_p1,
                    dfi_wrdata_en_p2,
                    dfi_wrdata_en_p3,
                    dfi_wrlvl_en,
                    trn_delay_line_sel,
                    iog_oe_p0,
                    iog_oe_p1,
                    iog_oe_p2,
                    iog_oe_p3,
                    dqs_oe_p0,
                    dqs_oe_p1,
                    dqs_oe_p2,
                    dqs_oe_p3,
                    // AS: added dm_oe
                    dm_oe_p0,
                    dm_oe_p1,
                    dm_oe_p2,
                    dm_oe_p3,
                    dfi_rddata_cs_0_n_p0,
                    dfi_rddata_cs_0_n_p1,
                    dfi_rddata_cs_0_n_p2,
                    dfi_rddata_cs_0_n_p3,
                    dfi_rddata_cs_1_n_p0,
                    dfi_rddata_cs_1_n_p1,
                    dfi_rddata_cs_1_n_p2,
                    dfi_rddata_cs_1_n_p3,
                    dfi_wrdata_cs_0_n_p0,
                    dfi_wrdata_cs_0_n_p1,
                    dfi_wrdata_cs_0_n_p2,
                    dfi_wrdata_cs_0_n_p3,
                    dfi_wrdata_cs_1_n_p0,
                    dfi_wrdata_cs_1_n_p1,
                    dfi_wrdata_cs_1_n_p2,
                    dfi_wrdata_cs_1_n_p3,
                    dfi_rddata_cs_0_n,
                    dfi_rddata_cs_1_n,
                    apb_ctrl_chip_sel,
                    apb_iog_on,
                    odt_dyn_lane,
                    dfi_rddata_en_p3,
                    iog_rddata_en_p0_p,
                    select_rank_1_gt,
                    select_rank_1,
                    dfi_init_complete,
                    // AS: added new signals for write callibration
                    // Note: final register for all write datapath signals is 
                    // outside of the PHY_SIG_MOD block, for code clarity
                    iog_dq_txdata_in,
                    iog_dq_txdata_out,
                    iog_dm_txdata_in,
                    iog_dm_txdata_out,
                    write_callibration_offset
          
          
					);

parameter IOG_DQS_LANES = 9; // Number of Lanes
parameter HOLD_ODT_CYCLES = 2; // Number clks to hold signal high

input          SCLK;
input          reset_n;

// Port: NWL

input          dfi_rdlvl_en;   // Read level enable. Signal used for read levelling. Comes from the NWL controller
input          dfi_rdlvl_gate_en; // Read level gate enable. Signal used for read gate training. Comes from the NWL controller
input          dfi_wrdata_en_p0;
input          dfi_wrdata_en_p1;
input          dfi_wrdata_en_p2;
input          dfi_wrdata_en_p3;
input          dfi_wrlvl_en;   // Write level enable. Signal used for write levelling. Comes from the NWL controller

// Port: PHY

output [IOG_DQS_LANES-1:0]       trn_delay_line_sel;
output [IOG_DQS_LANES-1:0]       iog_oe_p0;
output [IOG_DQS_LANES-1:0]       iog_oe_p1;
output [IOG_DQS_LANES-1:0]       iog_oe_p2;
output [IOG_DQS_LANES-1:0]       iog_oe_p3;
output [IOG_DQS_LANES-1:0]       dqs_oe_p0;
output [IOG_DQS_LANES-1:0]       dqs_oe_p1;
output [IOG_DQS_LANES-1:0]       dqs_oe_p2;
output [IOG_DQS_LANES-1:0]       dqs_oe_p3;
output [IOG_DQS_LANES-1:0]       dm_oe_p0;
output [IOG_DQS_LANES-1:0]       dm_oe_p1;
output [IOG_DQS_LANES-1:0]       dm_oe_p2;
output [IOG_DQS_LANES-1:0]       dm_oe_p3;

reg    [IOG_DQS_LANES-1:0]       iog_oe_p0;
reg    [IOG_DQS_LANES-1:0]       iog_oe_p1;
reg    [IOG_DQS_LANES-1:0]       iog_oe_p2;
reg    [IOG_DQS_LANES-1:0]       iog_oe_p3;
reg    [IOG_DQS_LANES-1:0]       dqs_oe_p0;
reg    [IOG_DQS_LANES-1:0]       dqs_oe_p1;
reg    [IOG_DQS_LANES-1:0]       dqs_oe_p2;
reg    [IOG_DQS_LANES-1:0]       dqs_oe_p3;
reg    [IOG_DQS_LANES-1:0]       dm_oe_p0;
reg    [IOG_DQS_LANES-1:0]       dm_oe_p1;
reg    [IOG_DQS_LANES-1:0]       dm_oe_p2;
reg    [IOG_DQS_LANES-1:0]       dm_oe_p3;

input  [IOG_DQS_LANES*64-1:0]    iog_dq_txdata_in;
output [IOG_DQS_LANES*64-1:0]    iog_dq_txdata_out;
reg    [IOG_DQS_LANES*64-1:0]    iog_dq_txdata_out;
input  [IOG_DQS_LANES*8-1:0]     iog_dm_txdata_in;
output [IOG_DQS_LANES*8-1:0]     iog_dm_txdata_out;
reg    [IOG_DQS_LANES*8-1:0]     iog_dm_txdata_out;

// Port: NWL_PHY

output          dfi_rddata_cs_0_n; // Read data data path chip select
output          dfi_rddata_cs_1_n; // Read data data path chip select

input          dfi_rddata_cs_0_n_p0; // Read data data path chip select
input          dfi_rddata_cs_0_n_p1; // Read data data path chip select
input          dfi_rddata_cs_0_n_p2; // Read data data path chip select
input          dfi_rddata_cs_0_n_p3; // Read data data path chip select
input          dfi_rddata_cs_1_n_p0; // Read data data path chip select
input          dfi_rddata_cs_1_n_p1; // Read data data path chip select
input          dfi_rddata_cs_1_n_p2; // Read data data path chip select
input          dfi_rddata_cs_1_n_p3; // Read data data path chip select

input          dfi_wrdata_cs_0_n_p0; // Write data data path chip select
input          dfi_wrdata_cs_0_n_p1; // Write data data path chip select
input          dfi_wrdata_cs_0_n_p2; // Write data data path chip select
input          dfi_wrdata_cs_0_n_p3; // Write data data path chip select
input          dfi_wrdata_cs_1_n_p0; // Write data data path chip select
input          dfi_wrdata_cs_1_n_p1; // Write data data path chip select
input          dfi_wrdata_cs_1_n_p2; // Write data data path chip select
input          dfi_wrdata_cs_1_n_p3; // Write data data path chip select



// Port: LEVELLING

input apb_ctrl_chip_sel;
input apb_iog_on;

//SMG add
output 	[IOG_DQS_LANES-1:0] 	odt_dyn_lane;
wire 	[IOG_DQS_LANES-1:0] 	odt_dyn_lane;
input         					dfi_rddata_en_p3; //earliest guaranteed entry to start odt_dyn_lane with
input  [IOG_DQS_LANES-1:0] 		iog_rddata_en_p0_p; //latest guaranteed entry to finish odt_dyn_lane with
reg  [HOLD_ODT_CYCLES-1:0] 		odt_dyn_on [IOG_DQS_LANES-1:0];

input select_rank_1_gt;
output select_rank_1;
wire select_rank_1;

// AS: added dfi_init_complete for mux'ing
input dfi_init_complete;

// AS: added offset from write callibration logic
input [IOG_DQS_LANES*3-1:0]          write_callibration_offset;


/// I/O_End <<<---

// AS: made these internal so we can delay them as needed for shifting
wire   [IOG_DQS_LANES-1:0]       iog_oe_p0_internal;
wire   [IOG_DQS_LANES-1:0]       iog_oe_p1_internal;
wire   [IOG_DQS_LANES-1:0]       iog_oe_p2_internal;
wire   [IOG_DQS_LANES-1:0]       iog_oe_p3_internal;
wire   [IOG_DQS_LANES-1:0]       dqs_oe_p0_internal;
wire   [IOG_DQS_LANES-1:0]       dqs_oe_p1_internal;
wire   [IOG_DQS_LANES-1:0]       dqs_oe_p2_internal;
wire   [IOG_DQS_LANES-1:0]       dqs_oe_p3_internal;
wire   [IOG_DQS_LANES-1:0]       dm_oe_p0_internal;
wire   [IOG_DQS_LANES-1:0]       dm_oe_p1_internal;
wire   [IOG_DQS_LANES-1:0]       dm_oe_p2_internal;
wire   [IOG_DQS_LANES-1:0]       dm_oe_p3_internal;

// these are the delay registers
reg    [IOG_DQS_LANES-1:0]       iog_oe_p0_reg;
reg    [IOG_DQS_LANES-1:0]       iog_oe_p1_reg;
reg    [IOG_DQS_LANES-1:0]       iog_oe_p2_reg;
reg    [IOG_DQS_LANES-1:0]       iog_oe_p3_reg;
reg    [IOG_DQS_LANES-1:0]       dqs_oe_p0_reg;
reg    [IOG_DQS_LANES-1:0]       dqs_oe_p1_reg;
reg    [IOG_DQS_LANES-1:0]       dqs_oe_p2_reg;
reg    [IOG_DQS_LANES-1:0]       dqs_oe_p3_reg;
reg    [IOG_DQS_LANES-1:0]       dm_oe_p0_reg;
reg    [IOG_DQS_LANES-1:0]       dm_oe_p1_reg;
reg    [IOG_DQS_LANES-1:0]       dm_oe_p2_reg;
reg    [IOG_DQS_LANES-1:0]       dm_oe_p3_reg;

reg    [IOG_DQS_LANES-1:0]       iog_oe_p0_reg_2;
reg    [IOG_DQS_LANES-1:0]       iog_oe_p1_reg_2;
reg    [IOG_DQS_LANES-1:0]       iog_oe_p2_reg_2;
reg    [IOG_DQS_LANES-1:0]       iog_oe_p3_reg_2;
reg    [IOG_DQS_LANES-1:0]       dqs_oe_p0_reg_2;
reg    [IOG_DQS_LANES-1:0]       dqs_oe_p1_reg_2;
reg    [IOG_DQS_LANES-1:0]       dqs_oe_p2_reg_2;
reg    [IOG_DQS_LANES-1:0]       dqs_oe_p3_reg_2;
reg    [IOG_DQS_LANES-1:0]       dm_oe_p0_reg_2;
reg    [IOG_DQS_LANES-1:0]       dm_oe_p1_reg_2;
reg    [IOG_DQS_LANES-1:0]       dm_oe_p2_reg_2;
reg    [IOG_DQS_LANES-1:0]       dm_oe_p3_reg_2;

reg    [IOG_DQS_LANES*64-1:0]    iog_dq_txdata_in_reg;
reg    [IOG_DQS_LANES*8-1:0]     iog_dm_txdata_in_reg;
reg    [IOG_DQS_LANES*64-1:0]    iog_dq_txdata_in_reg_2;
reg    [IOG_DQS_LANES*8-1:0]     iog_dm_txdata_in_reg_2;

// -----------------------------------------------------------------------
// AS: write calibration offset shifting logic (not registered internally)
// -----------------------------------------------------------------------

// registers for delay purposes 
always @ (posedge SCLK or negedge reset_n)
begin : register_for_delay
  if (!reset_n)
  begin
    iog_oe_p0_reg           <= 0;
    iog_oe_p1_reg           <= 0;
    iog_oe_p2_reg           <= 0;
    iog_oe_p3_reg           <= 0;
    dqs_oe_p0_reg           <= 0;
    dqs_oe_p1_reg           <= 0;
    dqs_oe_p2_reg           <= 0;
    dqs_oe_p3_reg           <= 0;
    dm_oe_p0_reg            <= 0;
    dm_oe_p1_reg            <= 0;
    dm_oe_p2_reg            <= 0;
    dm_oe_p3_reg            <= 0;
    iog_oe_p0_reg_2         <= 0;
    iog_oe_p1_reg_2         <= 0;
    iog_oe_p2_reg_2         <= 0;
    iog_oe_p3_reg_2         <= 0;
    dqs_oe_p0_reg_2         <= 0;
    dqs_oe_p1_reg_2         <= 0;
    dqs_oe_p2_reg_2         <= 0;
    dqs_oe_p3_reg_2         <= 0;
    dm_oe_p0_reg_2          <= 0;
    dm_oe_p1_reg_2          <= 0;
    dm_oe_p2_reg_2          <= 0;
    dm_oe_p3_reg_2          <= 0;
    iog_dq_txdata_in_reg    <= 0;
    iog_dm_txdata_in_reg    <= 0;
    iog_dq_txdata_in_reg_2  <= 0;
    iog_dm_txdata_in_reg_2  <= 0;
  end
  else
  begin
    iog_oe_p0_reg           <= iog_oe_p0_internal; 
    iog_oe_p1_reg           <= iog_oe_p1_internal;
    iog_oe_p2_reg           <= iog_oe_p2_internal;
    iog_oe_p3_reg           <= iog_oe_p3_internal;
    dqs_oe_p0_reg           <= dqs_oe_p0_internal;
    dqs_oe_p1_reg           <= dqs_oe_p1_internal;
    dqs_oe_p2_reg           <= dqs_oe_p2_internal;
    dqs_oe_p3_reg           <= dqs_oe_p3_internal;
    dm_oe_p0_reg            <= dm_oe_p0_internal; 
    dm_oe_p1_reg            <= dm_oe_p1_internal; 
    dm_oe_p2_reg            <= dm_oe_p2_internal; 
    dm_oe_p3_reg            <= dm_oe_p3_internal; 
    iog_oe_p0_reg_2         <= iog_oe_p0_reg;
    iog_oe_p1_reg_2         <= iog_oe_p1_reg;
    iog_oe_p2_reg_2         <= iog_oe_p2_reg;
    iog_oe_p3_reg_2         <= iog_oe_p3_reg;
    dqs_oe_p0_reg_2         <= dqs_oe_p0_reg;
    dqs_oe_p1_reg_2         <= dqs_oe_p1_reg;
    dqs_oe_p2_reg_2         <= dqs_oe_p2_reg;
    dqs_oe_p3_reg_2         <= dqs_oe_p3_reg;
    dm_oe_p0_reg_2          <= dm_oe_p0_reg ;
    dm_oe_p1_reg_2          <= dm_oe_p1_reg ;
    dm_oe_p2_reg_2          <= dm_oe_p2_reg ;
    dm_oe_p3_reg_2          <= dm_oe_p3_reg ;
    iog_dq_txdata_in_reg    <= iog_dq_txdata_in;
    iog_dm_txdata_in_reg    <= iog_dm_txdata_in;
    iog_dq_txdata_in_reg_2  <= iog_dq_txdata_in_reg;
    iog_dm_txdata_in_reg_2  <= iog_dm_txdata_in_reg;
  end
end

genvar i;
generate 
for (i=0; i<IOG_DQS_LANES; i=i+1)
begin
  always@(*)
  begin : output_assignments
    case(write_callibration_offset[3*(i+1)-1:3*i])
      0: // no shift (0 bits)
        begin
          iog_dq_txdata_out[64*(i+1)-1    :64*i] <= {
            {iog_dq_txdata_in[64*i+8*8-1   :64*i+8*7 ]}, // byte7  tx_data = { tx_data }
            {iog_dq_txdata_in[64*i+8*7-1   :64*i+8*6 ]}, // byte6  tx_data = { tx_data }
            {iog_dq_txdata_in[64*i+8*6-1   :64*i+8*5 ]}, // byte5  tx_data = { tx_data }
            {iog_dq_txdata_in[64*i+8*5-1   :64*i+8*4 ]}, // byte4  tx_data = { tx_data }
            {iog_dq_txdata_in[64*i+8*4-1   :64*i+8*3 ]}, // byte3  tx_data = { tx_data }
            {iog_dq_txdata_in[64*i+8*3-1   :64*i+8*2 ]}, // byte2  tx_data = { tx_data }
            {iog_dq_txdata_in[64*i+8*2-1   :64*i+8*1 ]}, // byte1  tx_data = { tx_data }
            {iog_dq_txdata_in[64*i+8*1-1   :64*i+8*0 ]}  // byte0  tx_data = { tx_data }

          };
          
          iog_dm_txdata_out[8*(i+1)-1:(8*i)] <= {
            iog_dm_txdata_in[8*(i+1)-1:(8*i)]
          };
          
          iog_oe_p0[i] <= iog_oe_p0_internal[i];
          iog_oe_p1[i] <= iog_oe_p1_internal[i];
          iog_oe_p2[i] <= iog_oe_p2_internal[i];
          iog_oe_p3[i] <= iog_oe_p3_internal[i];
          
          dqs_oe_p0[i] <= dqs_oe_p0_internal[i];
          dqs_oe_p1[i] <= dqs_oe_p1_internal[i];
          dqs_oe_p2[i] <= dqs_oe_p2_internal[i];
          dqs_oe_p3[i] <= dqs_oe_p3_internal[i];
          
          dm_oe_p0[i]  <= dm_oe_p0_internal[i];
          dm_oe_p1[i]  <= dm_oe_p1_internal[i];
          dm_oe_p2[i]  <= dm_oe_p2_internal[i];
          dm_oe_p3[i]  <= dm_oe_p3_internal[i];

        end
      1: // one shift (2 bits)
        begin
          iog_dq_txdata_out[64*(i+1)-1    :64*i] <= {
            { iog_dq_txdata_in[64*i+8*8-1-2   :64*i+8*7 ] , iog_dq_txdata_in_reg[64*i+8*8-1   :64*i+8*7+6 ]  }, // byte7  tx_data = { tx_data[5:0], tx_data_reg[7:6]}
            { iog_dq_txdata_in[64*i+8*7-1-2   :64*i+8*6 ] , iog_dq_txdata_in_reg[64*i+8*7-1   :64*i+8*6+6 ]  }, // byte6  tx_data = { tx_data[5:0], tx_data_reg[7:6]}
            { iog_dq_txdata_in[64*i+8*6-1-2   :64*i+8*5 ] , iog_dq_txdata_in_reg[64*i+8*6-1   :64*i+8*5+6 ]  }, // byte5  tx_data = { tx_data[5:0], tx_data_reg[7:6]}
            { iog_dq_txdata_in[64*i+8*5-1-2   :64*i+8*4 ] , iog_dq_txdata_in_reg[64*i+8*5-1   :64*i+8*4+6 ]  }, // byte4  tx_data = { tx_data[5:0], tx_data_reg[7:6]}
            { iog_dq_txdata_in[64*i+8*4-1-2   :64*i+8*3 ] , iog_dq_txdata_in_reg[64*i+8*4-1   :64*i+8*3+6 ]  }, // byte3  tx_data = { tx_data[5:0], tx_data_reg[7:6]}
            { iog_dq_txdata_in[64*i+8*3-1-2   :64*i+8*2 ] , iog_dq_txdata_in_reg[64*i+8*3-1   :64*i+8*2+6 ]  }, // byte2  tx_data = { tx_data[5:0], tx_data_reg[7:6]}
            { iog_dq_txdata_in[64*i+8*2-1-2   :64*i+8*1 ] , iog_dq_txdata_in_reg[64*i+8*2-1   :64*i+8*1+6 ]  }, // byte1  tx_data = { tx_data[5:0], tx_data_reg[7:6]}
            { iog_dq_txdata_in[64*i+8*1-1-2   :64*i+8*0 ] , iog_dq_txdata_in_reg[64*i+8*1-1   :64*i+8*0+6 ]  }  // byte0  tx_data = { tx_data[5:0], tx_data_reg[7:6]}
          };
          
          iog_dm_txdata_out[8*(i+1)-1:(8*i)] <= {
            iog_dm_txdata_in[8*(i+1)-1-2:(8*i)], iog_dm_txdata_in_reg[8*(i+1)-1:(8*i)+6]
          };


          iog_oe_p0[i] <= iog_oe_p3_reg     [i];
          iog_oe_p1[i] <= iog_oe_p0_internal[i];
          iog_oe_p2[i] <= iog_oe_p1_internal[i];
          iog_oe_p3[i] <= iog_oe_p2_internal[i];
          
          dqs_oe_p0[i] <= dqs_oe_p3_reg     [i];
          dqs_oe_p1[i] <= dqs_oe_p0_internal[i];
          dqs_oe_p2[i] <= dqs_oe_p1_internal[i];
          dqs_oe_p3[i] <= dqs_oe_p2_internal[i];
          
          dm_oe_p0[i]  <= dm_oe_p3_reg     [i];
          dm_oe_p1[i]  <= dm_oe_p0_internal[i];
          dm_oe_p2[i]  <= dm_oe_p1_internal[i];
          dm_oe_p3[i]  <= dm_oe_p2_internal[i];
          
        end
      2: // two shift (4 bits)
        begin
          iog_dq_txdata_out[64*(i+1)-1    :64*i] <= {
            { iog_dq_txdata_in[64*i+8*8-1-4   :64*i+8*7 ], iog_dq_txdata_in_reg[64*i+8*8-1   :64*i+8*7 + 4 ]  }, // byte7 tx_data = { tx_data[3:0], tx_data_reg[7:4] }
            { iog_dq_txdata_in[64*i+8*7-1-4   :64*i+8*6 ], iog_dq_txdata_in_reg[64*i+8*7-1   :64*i+8*6 + 4 ]  }, // byte6 tx_data = { tx_data[3:0], tx_data_reg[7:4] }
            { iog_dq_txdata_in[64*i+8*6-1-4   :64*i+8*5 ], iog_dq_txdata_in_reg[64*i+8*6-1   :64*i+8*5 + 4 ]  }, // byte5 tx_data = { tx_data[3:0], tx_data_reg[7:4] }
            { iog_dq_txdata_in[64*i+8*5-1-4   :64*i+8*4 ], iog_dq_txdata_in_reg[64*i+8*5-1   :64*i+8*4 + 4 ]  }, // byte4 tx_data = { tx_data[3:0], tx_data_reg[7:4] }
            { iog_dq_txdata_in[64*i+8*4-1-4   :64*i+8*3 ], iog_dq_txdata_in_reg[64*i+8*4-1   :64*i+8*3 + 4 ]  }, // byte3 tx_data = { tx_data[3:0], tx_data_reg[7:4] }
            { iog_dq_txdata_in[64*i+8*3-1-4   :64*i+8*2 ], iog_dq_txdata_in_reg[64*i+8*3-1   :64*i+8*2 + 4 ]  }, // byte2 tx_data = { tx_data[3:0], tx_data_reg[7:4] }
            { iog_dq_txdata_in[64*i+8*2-1-4   :64*i+8*1 ], iog_dq_txdata_in_reg[64*i+8*2-1   :64*i+8*1 + 4 ]  }, // byte1 tx_data = { tx_data[3:0], tx_data_reg[7:4] }
            { iog_dq_txdata_in[64*i+8*1-1-4   :64*i+8*0 ], iog_dq_txdata_in_reg[64*i+8*1-1   :64*i+8*0 + 4 ]  }  // byte0 tx_data = { tx_data[3:0], tx_data_reg[7:4] }
          };
          
          iog_dm_txdata_out[8*(i+1)-1:(8*i)] <= {
             iog_dm_txdata_in[8*(i+1)-1-4:(8*i)], iog_dm_txdata_in_reg[8*(i+1)-1:(8*i)+4] 
          };
          
          iog_oe_p0[i] <= iog_oe_p2_reg     [i];
          iog_oe_p1[i] <= iog_oe_p3_reg     [i];
          iog_oe_p2[i] <= iog_oe_p0_internal[i];
          iog_oe_p3[i] <= iog_oe_p1_internal[i];
          
          dqs_oe_p0[i] <= dqs_oe_p2_reg     [i];
          dqs_oe_p1[i] <= dqs_oe_p3_reg     [i];
          dqs_oe_p2[i] <= dqs_oe_p0_internal[i];
          dqs_oe_p3[i] <= dqs_oe_p1_internal[i];
          
          dm_oe_p0[i]  <= dm_oe_p2_reg     [i];
          dm_oe_p1[i]  <= dm_oe_p3_reg     [i];
          dm_oe_p2[i]  <= dm_oe_p0_internal[i];
          dm_oe_p3[i]  <= dm_oe_p1_internal[i];
        end
      3:
        begin
          iog_dq_txdata_out[64*(i+1)-1    :64*i] <= {
            { iog_dq_txdata_in[64*i+8*8-1-6  :64*i+8*7 ], iog_dq_txdata_in_reg[64*i+8*8-1   :64*i+8*7 + 2 ] }, // byte7 tx_data = { tx_data[1:0], tx_data_reg[7:2] }
            { iog_dq_txdata_in[64*i+8*7-1-6  :64*i+8*6 ], iog_dq_txdata_in_reg[64*i+8*7-1   :64*i+8*6 + 2 ] }, // byte6 tx_data = { tx_data[1:0], tx_data_reg[7:2] }
            { iog_dq_txdata_in[64*i+8*6-1-6  :64*i+8*5 ], iog_dq_txdata_in_reg[64*i+8*6-1   :64*i+8*5 + 2 ] }, // byte5 tx_data = { tx_data[1:0], tx_data_reg[7:2] }
            { iog_dq_txdata_in[64*i+8*5-1-6  :64*i+8*4 ], iog_dq_txdata_in_reg[64*i+8*5-1   :64*i+8*4 + 2 ] }, // byte4 tx_data = { tx_data[1:0], tx_data_reg[7:2] }
            { iog_dq_txdata_in[64*i+8*4-1-6  :64*i+8*3 ], iog_dq_txdata_in_reg[64*i+8*4-1   :64*i+8*3 + 2 ] }, // byte3 tx_data = { tx_data[1:0], tx_data_reg[7:2] }
            { iog_dq_txdata_in[64*i+8*3-1-6  :64*i+8*2 ], iog_dq_txdata_in_reg[64*i+8*3-1   :64*i+8*2 + 2 ] }, // byte2 tx_data = { tx_data[1:0], tx_data_reg[7:2] }
            { iog_dq_txdata_in[64*i+8*2-1-6  :64*i+8*1 ], iog_dq_txdata_in_reg[64*i+8*2-1   :64*i+8*1 + 2 ] }, // byte1 tx_data = { tx_data[1:0], tx_data_reg[7:2] }
            { iog_dq_txdata_in[64*i+8*1-1-6  :64*i+8*0 ], iog_dq_txdata_in_reg[64*i+8*1-1   :64*i+8*0 + 2 ] }  // byte0 tx_data = { tx_data[1:0], tx_data_reg[7:2] }
          };
          
          iog_dm_txdata_out[8*(i+1)-1:(8*i)] <= {
            iog_dm_txdata_in[8*(i+1)-1-6:(8*i)], iog_dm_txdata_in_reg[8*(i+1)-1:(8*i)+2] 
          };
          
          iog_oe_p0[i] <= iog_oe_p1_reg     [i];
          iog_oe_p1[i] <= iog_oe_p2_reg     [i];
          iog_oe_p2[i] <= iog_oe_p3_reg     [i];
          iog_oe_p3[i] <= iog_oe_p0_internal[i];
          
          dqs_oe_p0[i] <= dqs_oe_p1_reg     [i];
          dqs_oe_p1[i] <= dqs_oe_p2_reg     [i];
          dqs_oe_p2[i] <= dqs_oe_p3_reg     [i];
          dqs_oe_p3[i] <= dqs_oe_p0_internal[i];
          
          dm_oe_p0[i]  <= dm_oe_p1_reg     [i];
          dm_oe_p1[i]  <= dm_oe_p2_reg     [i];
          dm_oe_p2[i]  <= dm_oe_p3_reg     [i];
          dm_oe_p3[i]  <= dm_oe_p0_internal[i];
          
        end
      4:
        begin
          iog_dq_txdata_out[64*(i+1)-1    :64*i] <= {
            {iog_dq_txdata_in_reg[64*i+8*8-1   :64*i+8*7 ]}, // byte7 tx_data = { tx_data_reg }
            {iog_dq_txdata_in_reg[64*i+8*7-1   :64*i+8*6 ]}, // byte6 tx_data = { tx_data_reg }
            {iog_dq_txdata_in_reg[64*i+8*6-1   :64*i+8*5 ]}, // byte5 tx_data = { tx_data_reg }
            {iog_dq_txdata_in_reg[64*i+8*5-1   :64*i+8*4 ]}, // byte4 tx_data = { tx_data_reg }
            {iog_dq_txdata_in_reg[64*i+8*4-1   :64*i+8*3 ]}, // byte3 tx_data = { tx_data_reg }
            {iog_dq_txdata_in_reg[64*i+8*3-1   :64*i+8*2 ]}, // byte2 tx_data = { tx_data_reg }
            {iog_dq_txdata_in_reg[64*i+8*2-1   :64*i+8*1 ]}, // byte1 tx_data = { tx_data_reg }
            {iog_dq_txdata_in_reg[64*i+8*1-1   :64*i+8*0 ]}  // byte0 tx_data = { tx_data_reg }
          };
          
          iog_dm_txdata_out[8*(i+1)-1:(8*i)] <= {
            iog_dm_txdata_in_reg[8*(i+1)-1:(8*i)]
          };
          
          iog_oe_p0[i] <= iog_oe_p0_reg[i];
          iog_oe_p1[i] <= iog_oe_p1_reg[i];
          iog_oe_p2[i] <= iog_oe_p2_reg[i];
          iog_oe_p3[i] <= iog_oe_p3_reg[i];
          
          dqs_oe_p0[i] <= dqs_oe_p0_reg[i];
          dqs_oe_p1[i] <= dqs_oe_p1_reg[i];
          dqs_oe_p2[i] <= dqs_oe_p2_reg[i];
          dqs_oe_p3[i] <= dqs_oe_p3_reg[i];
          
          dm_oe_p0[i]  <= dm_oe_p0_reg[i];
          dm_oe_p1[i]  <= dm_oe_p1_reg[i];
          dm_oe_p2[i]  <= dm_oe_p2_reg[i];
          dm_oe_p3[i]  <= dm_oe_p3_reg[i];

        end
      5:
        begin
          iog_dq_txdata_out[64*(i+1)-1    :64*i] <= {
            { iog_dq_txdata_in_reg[64*i+8*8-1-2   :64*i+8*7 ], iog_dq_txdata_in_reg_2[64*i+8*8-1   :64*i+8*7 + 6 ] }, // byte0 tx_data = { tx_data_reg[5:0], tx_data_reg2[7:6] }
            { iog_dq_txdata_in_reg[64*i+8*7-1-2   :64*i+8*6 ], iog_dq_txdata_in_reg_2[64*i+8*7-1   :64*i+8*6 + 6 ] }, // byte1 tx_data = { tx_data_reg[5:0], tx_data_reg2[7:6] }
            { iog_dq_txdata_in_reg[64*i+8*6-1-2   :64*i+8*5 ], iog_dq_txdata_in_reg_2[64*i+8*6-1   :64*i+8*5 + 6 ] }, // byte2 tx_data = { tx_data_reg[5:0], tx_data_reg2[7:6] }
            { iog_dq_txdata_in_reg[64*i+8*5-1-2   :64*i+8*4 ], iog_dq_txdata_in_reg_2[64*i+8*5-1   :64*i+8*4 + 6 ] }, // byte3 tx_data = { tx_data_reg[5:0], tx_data_reg2[7:6] }
            { iog_dq_txdata_in_reg[64*i+8*4-1-2   :64*i+8*3 ], iog_dq_txdata_in_reg_2[64*i+8*4-1   :64*i+8*3 + 6 ] }, // byte4 tx_data = { tx_data_reg[5:0], tx_data_reg2[7:6] }
            { iog_dq_txdata_in_reg[64*i+8*3-1-2   :64*i+8*2 ], iog_dq_txdata_in_reg_2[64*i+8*3-1   :64*i+8*2 + 6 ] }, // byte5 tx_data = { tx_data_reg[5:0], tx_data_reg2[7:6] }
            { iog_dq_txdata_in_reg[64*i+8*2-1-2   :64*i+8*1 ], iog_dq_txdata_in_reg_2[64*i+8*2-1   :64*i+8*1 + 6 ] }, // byte6 tx_data = { tx_data_reg[5:0], tx_data_reg2[7:6] }
            { iog_dq_txdata_in_reg[64*i+8*1-1-2   :64*i+8*0 ], iog_dq_txdata_in_reg_2[64*i+8*1-1   :64*i+8*0 + 6 ] }  // byte7 tx_data = { tx_data_reg[5:0], tx_data_reg2[7:6] }
          };
          
          iog_dm_txdata_out[8*(i+1)-1:(8*i)] <= {
            iog_dm_txdata_in_reg[8*(i+1)-1-2:(8*i)], iog_dm_txdata_in_reg_2[8*(i+1)-1:(8*i)+6] 
          };

          
          iog_oe_p0[i] <= iog_oe_p3_reg_2[i];
          iog_oe_p1[i] <= iog_oe_p0_reg  [i];
          iog_oe_p2[i] <= iog_oe_p1_reg  [i];
          iog_oe_p3[i] <= iog_oe_p2_reg  [i];
          
          dqs_oe_p0[i] <= dqs_oe_p3_reg_2[i];
          dqs_oe_p1[i] <= dqs_oe_p0_reg  [i];
          dqs_oe_p2[i] <= dqs_oe_p1_reg  [i];
          dqs_oe_p3[i] <= dqs_oe_p2_reg  [i];
          
          dm_oe_p0[i]  <= dm_oe_p3_reg_2[i];
          dm_oe_p1[i]  <= dm_oe_p0_reg  [i];
          dm_oe_p2[i]  <= dm_oe_p1_reg  [i];
          dm_oe_p3[i]  <= dm_oe_p2_reg  [i];
          
        end
      6:
        begin
          iog_dq_txdata_out[64*(i+1)-1    :64*i] <= {
            { iog_dq_txdata_in_reg[64*i+8*8-1-4   :64*i+8*7 ], iog_dq_txdata_in_reg_2[64*i+8*8-1   :64*i+8*7 + 4 ] }, // byte0 tx_data = { tx_data_reg[3:0], tx_data_reg2[7:4] }
            { iog_dq_txdata_in_reg[64*i+8*7-1-4   :64*i+8*6 ], iog_dq_txdata_in_reg_2[64*i+8*7-1   :64*i+8*6 + 4 ] }, // byte1 tx_data = { tx_data_reg[3:0], tx_data_reg2[7:4] }
            { iog_dq_txdata_in_reg[64*i+8*6-1-4   :64*i+8*5 ], iog_dq_txdata_in_reg_2[64*i+8*6-1   :64*i+8*5 + 4 ] }, // byte2 tx_data = { tx_data_reg[3:0], tx_data_reg2[7:4] }
            { iog_dq_txdata_in_reg[64*i+8*5-1-4   :64*i+8*4 ], iog_dq_txdata_in_reg_2[64*i+8*5-1   :64*i+8*4 + 4 ] }, // byte3 tx_data = { tx_data_reg[3:0], tx_data_reg2[7:4] }
            { iog_dq_txdata_in_reg[64*i+8*4-1-4   :64*i+8*3 ], iog_dq_txdata_in_reg_2[64*i+8*4-1   :64*i+8*3 + 4 ] }, // byte4 tx_data = { tx_data_reg[3:0], tx_data_reg2[7:4] }
            { iog_dq_txdata_in_reg[64*i+8*3-1-4   :64*i+8*2 ], iog_dq_txdata_in_reg_2[64*i+8*3-1   :64*i+8*2 + 4 ] }, // byte5 tx_data = { tx_data_reg[3:0], tx_data_reg2[7:4] }
            { iog_dq_txdata_in_reg[64*i+8*2-1-4   :64*i+8*1 ], iog_dq_txdata_in_reg_2[64*i+8*2-1   :64*i+8*1 + 4 ] }, // byte6 tx_data = { tx_data_reg[3:0], tx_data_reg2[7:4] }
            { iog_dq_txdata_in_reg[64*i+8*1-1-4   :64*i+8*0 ], iog_dq_txdata_in_reg_2[64*i+8*1-1   :64*i+8*0 + 4 ] }  // byte7 tx_data = { tx_data_reg[3:0], tx_data_reg2[7:4] }
          };

        


          
          iog_dm_txdata_out[8*(i+1)-1:(8*i)] <= {
            iog_dm_txdata_in_reg[8*(i+1)-1-4:(8*i)], iog_dm_txdata_in_reg_2[8*(i+1)-1:(8*i)+4]
          };
          
          iog_oe_p0[i] <= iog_oe_p2_reg_2[i];
          iog_oe_p1[i] <= iog_oe_p3_reg_2[i];
          iog_oe_p2[i] <= iog_oe_p0_reg  [i];
          iog_oe_p3[i] <= iog_oe_p1_reg  [i];
          
          dqs_oe_p0[i] <= dqs_oe_p2_reg_2[i];
          dqs_oe_p1[i] <= dqs_oe_p3_reg_2[i];
          dqs_oe_p2[i] <= dqs_oe_p0_reg  [i];
          dqs_oe_p3[i] <= dqs_oe_p1_reg  [i];
          
          dm_oe_p0[i]  <= dm_oe_p2_reg_2[i];
          dm_oe_p1[i]  <= dm_oe_p3_reg_2[i];
          dm_oe_p2[i]  <= dm_oe_p0_reg  [i];
          dm_oe_p3[i]  <= dm_oe_p1_reg  [i];
          
        end
      7:
        begin
          iog_dq_txdata_out[64*(i+1)-1    :64*i] <= {
            { iog_dq_txdata_in_reg[64*i+8*8-1-6   :64*i+8*7 ], iog_dq_txdata_in_reg_2[64*i+8*8-1   :64*i+8*7 + 2 ] }, // byte0 tx_data = { tx_data_reg[1:0], tx_data_reg2[7:2] }
            { iog_dq_txdata_in_reg[64*i+8*7-1-6   :64*i+8*6 ], iog_dq_txdata_in_reg_2[64*i+8*7-1   :64*i+8*6 + 2 ] }, // byte1 tx_data = { tx_data_reg[1:0], tx_data_reg2[7:2] }
            { iog_dq_txdata_in_reg[64*i+8*6-1-6   :64*i+8*5 ], iog_dq_txdata_in_reg_2[64*i+8*6-1   :64*i+8*5 + 2 ] }, // byte2 tx_data = { tx_data_reg[1:0], tx_data_reg2[7:2] }
            { iog_dq_txdata_in_reg[64*i+8*5-1-6   :64*i+8*4 ], iog_dq_txdata_in_reg_2[64*i+8*5-1   :64*i+8*4 + 2 ] }, // byte3 tx_data = { tx_data_reg[1:0], tx_data_reg2[7:2] }
            { iog_dq_txdata_in_reg[64*i+8*4-1-6   :64*i+8*3 ], iog_dq_txdata_in_reg_2[64*i+8*4-1   :64*i+8*3 + 2 ] }, // byte4 tx_data = { tx_data_reg[1:0], tx_data_reg2[7:2] }
            { iog_dq_txdata_in_reg[64*i+8*3-1-6   :64*i+8*2 ], iog_dq_txdata_in_reg_2[64*i+8*3-1   :64*i+8*2 + 2 ] }, // byte5 tx_data = { tx_data_reg[1:0], tx_data_reg2[7:2] }
            { iog_dq_txdata_in_reg[64*i+8*2-1-6   :64*i+8*1 ], iog_dq_txdata_in_reg_2[64*i+8*2-1   :64*i+8*1 + 2 ] }, // byte6 tx_data = { tx_data_reg[1:0], tx_data_reg2[7:2] }
            { iog_dq_txdata_in_reg[64*i+8*1-1-6   :64*i+8*0 ], iog_dq_txdata_in_reg_2[64*i+8*1-1   :64*i+8*0 + 2 ] }  // byte7 tx_data = { tx_data_reg[1:0], tx_data_reg2[7:2] }
          };
          
          iog_dm_txdata_out[8*(i+1)-1:(8*i)] <= {
            iog_dm_txdata_in_reg[8*(i+1)-1-6:(8*i)], iog_dm_txdata_in_reg_2[8*(i+1)-1:(8*i)+2] 
          };
          
          iog_oe_p0[i] <= iog_oe_p1_reg_2[i];
          iog_oe_p1[i] <= iog_oe_p2_reg_2[i];
          iog_oe_p2[i] <= iog_oe_p3_reg_2[i];
          iog_oe_p3[i] <= iog_oe_p0_reg  [i];
          
          dqs_oe_p0[i] <= dqs_oe_p1_reg_2[i];
          dqs_oe_p1[i] <= dqs_oe_p2_reg_2[i];
          dqs_oe_p2[i] <= dqs_oe_p3_reg_2[i];
          dqs_oe_p3[i] <= dqs_oe_p0_reg  [i];
          
          dm_oe_p0[i]  <= dm_oe_p1_reg_2[i];
          dm_oe_p1[i]  <= dm_oe_p2_reg_2[i];
          dm_oe_p2[i]  <= dm_oe_p3_reg_2[i];
          dm_oe_p3[i]  <= dm_oe_p0_reg  [i];
          
        end
        
      default: // no shift default
        begin
          iog_dq_txdata_out[64*(i+1)-1    :64*i] <= {
            {iog_dq_txdata_in[64*i+8*8-1   :64*i+8*7 ]}, // byte7 tx_data = { tx_data_reg2 }
            {iog_dq_txdata_in[64*i+8*7-1   :64*i+8*6 ]}, // byte6 tx_data = { tx_data_reg2 }
            {iog_dq_txdata_in[64*i+8*6-1   :64*i+8*5 ]}, // byte5 tx_data = { tx_data_reg2 }
            {iog_dq_txdata_in[64*i+8*5-1   :64*i+8*4 ]}, // byte4 tx_data = { tx_data_reg2 }
            {iog_dq_txdata_in[64*i+8*4-1   :64*i+8*3 ]}, // byte3 tx_data = { tx_data_reg2 }
            {iog_dq_txdata_in[64*i+8*3-1   :64*i+8*2 ]}, // byte2 tx_data = { tx_data_reg2 }
            {iog_dq_txdata_in[64*i+8*2-1   :64*i+8*1 ]}, // byte1 tx_data = { tx_data_reg2 }
            {iog_dq_txdata_in[64*i+8*1-1   :64*i+8*0 ]}  // byte0 tx_data = { tx_data_reg2 }
          };
          
          iog_dm_txdata_out[8*(i+1)-1:(8*i)] <= {
            iog_dm_txdata_in[8*(i+1)-1:(8*i)]
          };
          
          iog_oe_p0[i] <= iog_oe_p0_internal[i];
          iog_oe_p1[i] <= iog_oe_p1_internal[i];
          iog_oe_p2[i] <= iog_oe_p2_internal[i];
          iog_oe_p3[i] <= iog_oe_p3_internal[i];
          
          dqs_oe_p0[i] <= dqs_oe_p0_internal[i];
          dqs_oe_p1[i] <= dqs_oe_p1_internal[i];
          dqs_oe_p2[i] <= dqs_oe_p2_internal[i];
          dqs_oe_p3[i] <= dqs_oe_p3_internal[i];
          
          dm_oe_p0[i]  <= dm_oe_p0_internal[i];
          dm_oe_p1[i]  <= dm_oe_p1_internal[i];
          dm_oe_p2[i]  <= dm_oe_p2_internal[i];
          dm_oe_p3[i]  <= dm_oe_p3_internal[i];
        end
      
      
    endcase
  end
end
endgenerate

// -----------------------------------------------------------------------
// end of added write callibration shifting logic
// -----------------------------------------------------------------------

//SMG add
//genvar i;
integer j;
generate

for (i=0; i<IOG_DQS_LANES; i=i+1) 
begin : per_lane	
	
	always @(posedge SCLK or negedge reset_n)
	begin
		if(!reset_n)
		begin
			odt_dyn_on[i][HOLD_ODT_CYCLES-1:0] <= 0;
		end	
		else
		begin
			// these are the earliest and latest the rddata_en signal will be high for
			if(iog_rddata_en_p0_p[i] || dfi_rddata_en_p3) 
			begin
				odt_dyn_on[i][0] <= 1;
			end
			else
			begin
				odt_dyn_on[i][0] <= 0;
			end
			
			for(j = 1 ; j<(HOLD_ODT_CYCLES); j=j+1)
				odt_dyn_on[i][j] <= odt_dyn_on[i][j-1];	
		end
	end

	//or's all the odt_dyn_on delayed signals against itself (and dfi_rddata_cs_0_n_p3 as want it high on that edge)
	assign odt_dyn_lane[i] = (|odt_dyn_on[i]) | dfi_rddata_en_p3;		
	
end
endgenerate


// Gian Edit

// delay line select - delay_line_sel_rd that gets used during training. Mux-ed in IOG_IF
//assign trn_delay_line_sel = (dfi_wrlvl_en) ? 'h0 : (2**IOG_DQS_LANES)-1;
// AS: modified to select output delay during clock training too
assign trn_delay_line_sel = (dfi_wrlvl_en | !dfi_init_complete) ? 'h0 : (2**IOG_DQS_LANES)-1;

// Alex Edit 3/8/2016:  delayed iog output delay when not in training mode
//                      also EXTENDED dqs output delay

reg dfi_wrdata_en_p3_reg;

always @( posedge SCLK or negedge reset_n )
begin   : wdata_en_registering

  if (!(reset_n))
  begin
    dfi_wrdata_en_p3_reg <= 0;
  end
  else
  begin
    dfi_wrdata_en_p3_reg <= dfi_wrdata_en_p3;
  end
end

// OE MUX
assign iog_oe_p0_internal = (dfi_wrlvl_en) ? {IOG_DQS_LANES{1'b0}} : (dfi_wrdata_en_p0|dfi_wrdata_en_p3_reg) ? (2**IOG_DQS_LANES)-1:'h0;
assign iog_oe_p1_internal = (dfi_wrlvl_en) ? {IOG_DQS_LANES{1'b0}} : (dfi_wrdata_en_p1|dfi_wrdata_en_p0)	? (2**IOG_DQS_LANES)-1:'h0;
assign iog_oe_p2_internal = (dfi_wrlvl_en) ? {IOG_DQS_LANES{1'b0}} : (dfi_wrdata_en_p2|dfi_wrdata_en_p1)	? (2**IOG_DQS_LANES)-1:'h0;
assign iog_oe_p3_internal = (dfi_wrlvl_en) ? {IOG_DQS_LANES{1'b0}} : (dfi_wrdata_en_p3|dfi_wrdata_en_p2)	? (2**IOG_DQS_LANES)-1:'h0;

assign dm_oe_p0_internal = (!dfi_init_complete ) ? {IOG_DQS_LANES{1'b1}} : iog_oe_p0_internal;
assign dm_oe_p1_internal = (!dfi_init_complete ) ? {IOG_DQS_LANES{1'b1}} : iog_oe_p1_internal;
assign dm_oe_p2_internal = (!dfi_init_complete ) ? {IOG_DQS_LANES{1'b1}} : iog_oe_p2_internal;
assign dm_oe_p3_internal = (!dfi_init_complete ) ? {IOG_DQS_LANES{1'b1}} : iog_oe_p3_internal;


assign dqs_oe_p0_internal = (!dfi_init_complete | dfi_wrlvl_en) ?  {IOG_DQS_LANES{1'b1}} : (dfi_wrdata_en_p0|dfi_wrdata_en_p3_reg) ? (2**IOG_DQS_LANES)-1:'h0;
assign dqs_oe_p1_internal = (!dfi_init_complete | dfi_wrlvl_en) ?  {IOG_DQS_LANES{1'b1}} : (dfi_wrdata_en_p1|dfi_wrdata_en_p0)	? (2**IOG_DQS_LANES)-1:'h0;
assign dqs_oe_p2_internal = (!dfi_init_complete | dfi_wrlvl_en) ?  {IOG_DQS_LANES{1'b1}} : (dfi_wrdata_en_p2|dfi_wrdata_en_p1)	? (2**IOG_DQS_LANES)-1:'h0;
assign dqs_oe_p3_internal = (!dfi_init_complete | dfi_wrlvl_en) ?  {IOG_DQS_LANES{1'b1}} : (dfi_wrdata_en_p3|dfi_wrdata_en_p2)	? (2**IOG_DQS_LANES)-1:'h0;

//Choosing cs_N_p0 as the main chip select that gets passed to the Training IP for now.
//This assign statement is to MUX control of the chip select for when the APB_IOG_CTRL_SM is doing an operation
//on a specfic lane.
//apb_ctrl_chip_sel = 0 for lane 0, and 1 for lane 1
// assign dfi_rddata_cs_0_n = apb_iog_on ? !apb_ctrl_chip_sel	: dfi_rddata_cs_0_n_p0;
// assign dfi_rddata_cs_1_n = apb_iog_on ? apb_ctrl_chip_sel 	: dfi_rddata_cs_1_n_p0;

//change to p3
assign dfi_rddata_cs_0_n = dfi_rddata_cs_0_n_p3;
assign dfi_rddata_cs_1_n = dfi_rddata_cs_1_n_p3;

assign select_rank_1 = apb_iog_on ? apb_ctrl_chip_sel : select_rank_1_gt;


endmodule

