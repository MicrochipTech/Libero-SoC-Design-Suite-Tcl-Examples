///////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------------
//                                                                
//  © 2022 Microchip Technology Inc. and its subsidiaries
//  All rights reserved.
//                                                                 
//  ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
//  ACCORDANCE WITH THE MICROCHIP LICENSE AGREEMENT AND MUST BE APPROVED
//  IN ADVANCE IN WRITING.
//
//-------------------------------------------------------------------------
// Title       : CMD_Decoder.v
// Created     : December-2017
// Description : Once the DDR is ready, this block initiates writes and reads for 1k transactions.
// Hierarchy   :
//               -- top
//                   -- DDR4_Interface
//                     -- AXI_IF
//                     -- CMD_Decoder
//                     -- DDR4_Splash
//                     -- PF_RESET 
//                          
//-------------------------------------------------------------------------


/*-----------------------------------------------------------------------------
 Title      : Command Decoder
-------------------------------------------------------------------------------
 File       : CMD_Decoder.v
 Author     : Corporate Applications Engineering
 Company    : Microsemi Corporation
 Device     : RTG4
 Standard   : Verilog
-------------------------------------------------------------------------------
 Description: Once the DDR is ready, this block initiates writes and reads for 1k transactions
-------------------------------------------------------------------------------
 Copyright (c) 2014   Microsemi Corporation
                      All rights reserved.
-------------------------------------------------------------------------------
 Revisions  : V1.0
------------------------------------------------------------------------------- */
module CMD_Decoder(input CLK, // input clock signal
                   input RESETn, // input active low reset signal
                   input DDR_READY, // input DDR ready
                   input AXI_BUSY, // AXI_IF block is busy with transactions
                   output reg transactions_complete, // Indicates writes and reads are completed
                   output reg write_start, // output write start signal
                   output reg read_start, // output read start signal
                   output reg[9 : 0] w_xfer_size, // output write bus 
                   output reg[9 : 0] r_xfer_size); // output read bus

/* synthesis syn_preserve=1 */;
                   
                   
parameter[2 : 0] IDLE = 3'b000,
                   INITIATE_WRITE = 3'b001,
                   WAIT_FOR_WR_COMPLETE = 3'b010,
                   INITIATE_READ = 3'b011,
                   WAIT_FOR_RD_COMPLETE = 3'b100; 
				   
reg [2:0] rw_ctrl_state;

// Following always block is for initiating write and read transaction
// to AXI_IF "will be executed only once for 1K writes and reads"

  always
    @(posedge CLK or negedge RESETn)
    begin
      if (RESETn == 1'b0)
        begin
          write_start <= 0;
          read_start <= 0;
          w_xfer_size <= 10'h00;
          r_xfer_size <= 10'h00;
          rw_ctrl_state <= IDLE;
          transactions_complete <= 1'd0;
        end
      else
        begin
          case (rw_ctrl_state)
            IDLE:
              begin
                if (DDR_READY & !transactions_complete)
                  begin
                    rw_ctrl_state <= INITIATE_WRITE;
                  end
              end
            INITIATE_WRITE:
              begin
                write_start <= 1'b1;
                w_xfer_size[9 : 0] <= 10'h10;
                if (write_start)
                  rw_ctrl_state <= WAIT_FOR_WR_COMPLETE;
              end
            WAIT_FOR_WR_COMPLETE:
              begin
                write_start <= 1'b0;
                if (!AXI_BUSY)
                  begin
                    rw_ctrl_state <= INITIATE_READ;
                  end
              end
            INITIATE_READ:
              begin
                read_start <= 1'b1;
                r_xfer_size <= 10'h10;
                rw_ctrl_state <= WAIT_FOR_RD_COMPLETE;
              end
            WAIT_FOR_RD_COMPLETE:
              begin
                read_start <= 1'b0;
                transactions_complete <= 1'd1;
			   if (!AXI_BUSY)
                  begin
                    rw_ctrl_state <= IDLE;
                  end
              end
            default:
              begin
                write_start <= 0;
                read_start <= 0;
                w_xfer_size <= 10'h00;
                r_xfer_size <= 10'h00;
                rw_ctrl_state <= IDLE;
                transactions_complete <= 1'd0;
              end
          endcase
        end
    end
  
endmodule
