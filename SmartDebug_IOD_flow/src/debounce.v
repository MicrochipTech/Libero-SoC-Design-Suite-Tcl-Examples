///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: debounce.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF300TS_ES> <Package::FCG1152>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module  ACT_UNIQUE_debouncer 
                (
                input                                     CLK, RESET_N, SWITCH,                                                 // inputs
                output reg          DB_OUT                                                                                                                                                                                                               // output
                );
//// ---------------- internal constants --------------
                parameter N = 4 ;
////---------------- internal variables ---------------
                reg  [N-1 : 0]       q_reg;                                                                                                   // timing regs
                reg  [N-1 : 0]       q_next;
                reg DFF1, DFF2;                                                                                                                                 // input flip-flops
                wire q_add;                                                                                                                                                                        // control flags
                wire q_reset;
//// ------------------------------------------------------

////contenious assignment for counter control
                assign q_reset = (DFF1  ^ DFF2);                                // xor input flip flops to look for level chage to reset counter
                assign  q_add = ~(q_reg[N-1]);                                  // add to counter when q_reg msb is equal to 0
                
//// combo counter to manage q_next  
                always @ ( q_reset, q_add, q_reg)
                                begin
                                                case( {q_reset , q_add})
                                                                2'b00 :
                                                                                                q_next <= q_reg;
                                                                2'b01 :
                                                                                                q_next <= q_reg + 1;
                                                                default :
                                                                                                q_next <= { N {1'b0} };
                                                endcase               
                                end
                
//// Flip flop inputs and q_reg update
                always @ ( posedge CLK or negedge RESET_N )
                                begin
                                                if(RESET_N ==  1'b0)
                                                                begin
                                                                                DFF1 <= 1'b0;
                                                                                DFF2 <= 1'b0;
                                                                                q_reg <= { N {1'b0} };
                                                                end
                                                else
                                                                begin
                                                                                DFF1 <= SWITCH;
                                                                                DFF2 <= DFF1;
                                                                                q_reg <= q_next;
                                                                end
                                end
                
//// counter control
                always @ ( posedge CLK or negedge RESET_N )
                                begin
                                                if(RESET_N ==  1'b0)
                                                                begin
                                                                                DB_OUT <= 1'b0;
                                                                end
                                                else
                                                                begin
                                                                                if(q_reg[N-1] == 1'b1)
                                                                                // DB_OUT <= ~DFF2;
                                                                                DB_OUT <= DFF2;
                                                                                else
                                                                                DB_OUT <= DB_OUT;
                                                                end
                                end

                endmodule


