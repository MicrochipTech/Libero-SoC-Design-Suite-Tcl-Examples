///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: init_iterator.v
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

module ddr_init_iterator( clk, SYS_RESET_IN_N, SYS_RESET_OUT_N, ctrlr_ready,reset_counter );
input clk;
input ctrlr_ready;
input SYS_RESET_IN_N;
output reg SYS_RESET_OUT_N;
output reg [3:0] reset_counter;

parameter [22:0] TIMEOUT_COUNT=23'h7FFFFF;
parameter [3:0] ITERATION_COUNT=4'hA;

reg [22:0] timeout_counter;
reg finished_iterating;

always @ (posedge clk or negedge SYS_RESET_IN_N) begin


    if(SYS_RESET_IN_N==0) begin
        timeout_counter <= 0;
        finished_iterating <= 0;
        reset_counter <= 0;
        SYS_RESET_OUT_N<= 0;
    end
    else begin

        if (finished_iterating)                     timeout_counter <= timeout_counter;
        else if (timeout_counter==TIMEOUT_COUNT)    timeout_counter <= 0;
        else                                        timeout_counter <= timeout_counter+1;

        if (finished_iterating)                 SYS_RESET_OUT_N <=1'b1;
        else if (timeout_counter < 23'h003FF)   SYS_RESET_OUT_N <=1'b0;
        else                                    SYS_RESET_OUT_N <=1'b1;

    
        if (finished_iterating)                 reset_counter <= reset_counter;
        else if (timeout_counter==23'h00FFF)    reset_counter <= reset_counter+1;
        else                                    reset_counter <= reset_counter;

    
        if (ctrlr_ready ==1'b1)                     finished_iterating<=1'b1;
        else if ( reset_counter == ITERATION_COUNT ) finished_iterating<=1'b1;
        else                                        finished_iterating<=finished_iterating;
    end
end







//<statements>

endmodule

