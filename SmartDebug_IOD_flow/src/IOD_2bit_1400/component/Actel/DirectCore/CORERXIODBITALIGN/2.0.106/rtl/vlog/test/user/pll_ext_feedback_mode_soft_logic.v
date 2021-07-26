// *********************************************************************/ 
// Copyright (c) 2019 Microsemi Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Microsemi license agreement and must be approved 
// in advance in writing.  
//  
// File: pll_ext_feedback_mode_soft_logic.v
//     
// Description: Soft logic for re-synchronizations of outputs in 
//              'External' and 'Post-Divider' feedback modes
//
// *********************************************************************
module PLL_EXT_FEEDBACK_MODE_RTL (
                                 FREF,
                                 OUT0,
                                 RESET_N,
                                 POWERDOWN_N, 
                                 BYPASS_EN_N,
                                 OUT0_EN
                                 );

input        FREF;
input        OUT0; 
input        RESET_N;
output wire  POWERDOWN_N;
output reg   BYPASS_EN_N /* synthesis syn_keep = 1 */;
output wire  OUT0_EN;

reg          OUT0_EN_reg;
reg          POWERDOWN_N_reg;
reg [2:0]    state;
reg [2:0]    next_state;
reg [2:0]    clk_count;
reg [2:0]    out0_sync;

localparam   IDLE = 0;                                     
localparam   Step_1 = 1;
localparam   Step_2 = 2;
localparam   Step_3 = 3;
localparam   Step_4 = 4;

assign OUT0_EN = OUT0_EN_reg; 

/* synthesis translate_off */
if ( 1 ) 
    begin
        assign POWERDOWN_N = RESET_N; // Simulation code
    end 
else 
    begin
/* synthesis translate_on */
        assign POWERDOWN_N = POWERDOWN_N_reg; // Synthesis code
/* synthesis translate_off */
    end 
/* synthesis translate_on */


always @ (negedge FREF or negedge RESET_N)
begin : FSM
    if (RESET_N == 1'b0)
        begin
            state <= IDLE;
        end
    else
        begin
            state <= next_state;
        end
end


always @ (negedge FREF)
begin
    out0_sync <= { out0_sync[1:0], OUT0 };
end

always @ (*)
begin : FSM_next_state
    case (state)

        IDLE:
            next_state = Step_1;
   
        Step_1:
            next_state = Step_2;
     
        Step_2:
            // delay 5 cycles 
            if (OUT0 == 1'b1 && clk_count >= 3'b101) 
                next_state = Step_3; 
            else
                next_state = Step_2;
        Step_3:
            if (OUT0 == 1'b0)
                next_state = Step_4; 
            else
                next_state = Step_3; 

        Step_4:
            next_state = Step_4;

        default:
            next_state = IDLE;
    endcase
end


always @ (negedge FREF)
begin:FSM_output_assign
    case(state)
  
        IDLE:
            begin
                clk_count <= 3'b0;
                POWERDOWN_N_reg <= 1'b0; // assert Powerdown
                BYPASS_EN_N <= 1'b0;     // by-pass all dividers
                OUT0_EN_reg <= 1'b0;     // assert reset of all output dividers 
            end
  
        Step_1:
            begin
                OUT0_EN_reg <= 1'b1; // de-assert reset of all output dividers
            end

        Step_2:
            begin
                // detect an edge
                if ((out0_sync[2] != out0_sync[1]) && (out0_sync[2] == 1'b0))  
                    clk_count <= clk_count+1'b1;
                else
                    clk_count <= clk_count;
            end

        Step_3:
            begin
                OUT0_EN_reg <=   1'b0; // assert reset of all output dividers
            end
   
        Step_4:
            begin
                POWERDOWN_N_reg <= 1'b1; // de-assert Powerdown
                BYPASS_EN_N <= 1'b1;     // dont bypass dividers                        
                OUT0_EN_reg <= 1'b1;     // de-assert reset of all output dividers
            end

    endcase
end

endmodule

