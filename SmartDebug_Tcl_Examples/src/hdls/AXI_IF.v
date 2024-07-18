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
// Title       : AXI Master Interface
// Created     : December-2017
// Description : The AXI master (AXI_IF) block consists of AXI read channel, AXI 
//               write channel, write throughput counter, read throughput counter and a 512x64 
//               LSRAM. AXI master performs the read or write operation based on the inputs 
//               signals from command decoder. During the write operation, the AXI master reads 
//               the content from LSRAM and writes into DDR3 memory and measures the write 
//               throughput. During the read operation, the AXI master read the content from DDR3 
//               memory and writes into LSRAM and measures the read throughput. The write 
//               throughput counter counts the AXI clocks between AWVALID of first data and WLAST 
//               of last data. Similarly read throughput counter counts the AXI clocks between 
//               ARVALID of first data and RLAST of last data. After each write or read operation, 
//               the AXI master sends the throughput count value and an address starting 
//               from 0x000 to COM_Interface block.
// Hierarchy   :
//               -- top
//                   -- DDR4_Interface
//                     -- AXI_IF
//                     -- CMD_Decoder
//                     -- DDR4_Splash
//                     -- PF_RESET
//                          
//-------------------------------------------------------------------------



module AXI_IF(input CLK,
              input RESETn,
              input write_start,
              input read_start,
              input[9 : 0] w_xfer_size,
              input[9 : 0] r_xfer_size,
              output wire AXI_BUSY,
              //output  reg         WEN,
              //output  reg  [2:0]  WADDR,
              output reg[15 : 0] WD,
              output reg ddr_rd_wrt_err,
              /* Write Address Channel (WAC) */
              output[3 : 0] AWID,
              output reg[31 : 0] AWADDR,
              output[3 : 0] AWLEN,
              output reg[2 : 0] AWSIZE,
              output[1 : 0] AWLOCK,
              output reg[1 : 0] AWBURST,
              output reg AWVALID,
              input AWREADY,
              /*  Write Data Channel (RDC) */
              output[3 : 0] WID,
              output reg[7 : 0] WSTRB,
              output reg WLAST,
              output reg WVALID,
              output reg[63 : 0] WDATA,
              input WREADY,
              /* Write Response Channel (WRC) */
              //input [3:0]         BID,
              //input [1:0]         BRESP,  
              input BVALID,
              output BREADY,
              /* Read Address Channel (RAC) */
              output[3 : 0] ARID,
              output reg[31 : 0] ARADDR,
              output[3 : 0] ARLEN,
              output reg[1 : 0] ARSIZE,
              output[1 : 0] ARLOCK,
              output reg[1 : 0] ARBURST,
              output reg ARVALID,
              input ARREADY,
              /* Read Data Channel (RDC) */
              //input [3:0]         RID,
              input[63 : 0] RDATA,
              //input [1:0]         RRESP,
              input RLAST,
              input RVALID,
              output reg RREADY);  

/* synthesis syn_preserve=1 */;

//  `define WITHOUT_WRITE_RESPONSE  \
                                 /* Comment this line to define With Write Response state    */

  /* AXI FSM States */
  reg[2 : 0] axi_fsm_current_state;
  reg[2 : 0] axi_fsm_read_state,
             axi_fsm_read1_state;
  parameter[2 : 0] Idle_0 = 3'b000,
				   Idle_1 = 3'b001,
                   Write_0 = 3'b010,
                   Write_1 = 3'b011,
                   Read_0 = 3'b010,
                   Read_1 = 3'b011,
                   Read_2 = 3'b100,
                   Bresp_0 = 3'b100,
                   Write_2 = 3'b101;
  parameter[1 : 0] write_enable = 2'b00,
                   burst_count = 2'b01;
  parameter[1 : 0] read_enable = 2'b00,
                   read_burst_count = 2'b01;
  reg[31 : 0] AWADDR_int;
  //reg   [31:0] ARADDR_int;
  reg[11 : 0] WDATA_int;
  reg[3 : 0] burst_cnt;
  reg[13 : 0] w_clk_cnt;
  reg[13 : 0] r_clk_cnt;
  reg[11 : 0] rdata_cnt;
  reg[9 : 0] wburst_cnt;
  reg[9 : 0] rburst_cnt;
  reg ddr_rd_wrt_err_r;
  reg w_start;
  reg r_start;
  reg[1 : 0] w_loop_state;
  reg[1 : 0] r_loop_state;
  reg[9 : 0] w_xfer_size_i;
  reg[9 : 0] r_xfer_size_i,
             r_xfer_size_j;
  //reg ddr_rd_wrt_err_reg;
  wire[3 : 0] WLEN;
  wire[3 : 0] RLEN;
  
  assign WLEN = 4'b1111;
  assign RLEN = 4'b1111;
  assign AWLEN = WLEN;
  assign ARLEN = RLEN;
  assign AWLOCK = 2'b00;
  assign ARLOCK = 2'b00;
  assign AWID = 4'b0000;
  assign WID = 4'b0000;
  assign ARID = 4'b0000;
  assign BREADY = 1'b1;
  //assign AXI_BUSY = (w_start || r_start );
  assign AXI_BUSY = (w_start == 1'b1) ? 1'b1 : (r_start == 1'b1) ? 1'b1 : 1'b0;
  `ifndef WITHOUT_WRITE_RESPONSE
    `define WITH_WRITE_RESPONSE 
  `else
    `define WITHOUT_WRITE_RESPONSE 
  `endif

  /* Write Signal generation. Write signal asserts till write burst count reaches write transfer size */
  always
    @(posedge CLK or negedge RESETn)
    begin
      if (RESETn == 1'b0)
        begin
          w_start <= 0;
          w_clk_cnt <= 0;
          w_xfer_size_i <= 10'h000;
          w_loop_state <= write_enable;
        end
      else
        begin
          case (w_loop_state)
            write_enable:
              begin
                if (write_start == 1'b1)
                  begin
                    w_start <= 1;
                    w_xfer_size_i <= w_xfer_size;
                    w_loop_state <= burst_count;
                  end
                else
                  begin
                    w_start <= 0;
                    w_loop_state <= write_enable;
                  end
              end
            burst_count:
              begin
                if ( wburst_cnt != w_xfer_size_i)
                  begin
                    w_start <= 1;
                    w_clk_cnt <= w_clk_cnt + 1;
                    w_loop_state <= burst_count;
                  end
                else
                  begin
                    w_start <= 0;
                    w_clk_cnt <= 0;
                    w_loop_state <= write_enable;
                  end
              end
            default:
              begin
                w_start <= 0;
                w_clk_cnt <= 0;
                w_xfer_size_i <= 10'h000;
                w_loop_state <= write_enable;
              end
          endcase
        end
    end
  /* Read Signal generation. Read signal asserts till loop count reaches 8 */
  always
    @(posedge CLK or negedge RESETn)
    begin
      if (RESETn == 1'b0)
        begin
          r_start <= 0;
          r_clk_cnt <= 0;
          r_xfer_size_i <= 10'h000;
          r_loop_state <= read_enable;
        end
      else
        begin
          case (r_loop_state)
            read_enable:
              begin
                if (read_start == 1'b1)
                  begin
                    r_start <= 1;
                    r_xfer_size_i <= r_xfer_size;
                    r_loop_state <= read_burst_count;
                  end
                else
                  begin
                    r_start <= 0;
                    r_loop_state <= read_enable;
                  end
              end
            read_burst_count:
              begin
                if (rburst_cnt != r_xfer_size_i)
                  begin
                    r_start <= 1;
                    r_clk_cnt <= r_clk_cnt + 1;
                    r_loop_state <= read_burst_count;
                  end
                else
                  begin
                    r_start <= 0;
                    r_clk_cnt <= 0;
                    r_loop_state <= read_enable;
                  end
              end
            default:
              begin
                r_start <= 0;
                r_clk_cnt <= 0;
                r_xfer_size_i <= 10'h000;
                r_loop_state <= read_enable;
              end
          endcase
        end
    end
  /*Write address, Write data and Write response channels */
  always
    @(posedge CLK or negedge RESETn)
    begin
      if (RESETn == 1'b0)
        begin
          AWADDR <= 32'h00000000;
          AWADDR_int <= 32'h00000000;
          WDATA <= 64'h0000000000000000;
          WDATA_int <= 12'h000;
          AWSIZE <= 3'b000;
          AWBURST <= 2'b00;
          WSTRB <= 8'h00;
          AWVALID <= 1'b0;
          WVALID <= 1'b0;
          WLAST <= 1'b0;
          wburst_cnt <= 0;
          burst_cnt <= 4'b0000;
          axi_fsm_current_state <= Idle_1;
        end
      else
        begin
          case (axi_fsm_current_state)
            Idle_1:
              begin
                if (w_start == 1'b1 && (wburst_cnt != w_xfer_size_i))
                  begin
                    AWSIZE <= 3'b011;
                    AWBURST <= 2'b01;
                    AWADDR <= AWADDR_int;
                    AWVALID <= 1'b1;
                    burst_cnt <= 1;
                    axi_fsm_current_state <= Write_0;
                  end
                else
                  begin
                    AWADDR_int <= 32'h00000000;
                    axi_fsm_current_state <= Idle_1;
                    wburst_cnt <= 0;
                    burst_cnt <= 0;
                    WDATA_int <= 12'h000;
                  end
              end
            Write_0:
              begin
                if (AWREADY == 1'b1)
                  begin
                    AWVALID <= 1'b0;
                    WSTRB <= 8'hFF;
                    WVALID <= 1'b1;
                    WDATA <= { 52'h0000000000000, WDATA_int };
                    WDATA_int <= WDATA_int + 1;
                    axi_fsm_current_state <= Write_1;
                  end
                else
                  begin
                    axi_fsm_current_state <= Write_0;
                  end
              end
            Write_1:
              begin
                if (WREADY == 1'b1)
                  begin
                    WDATA <= { 52'h0000000000000, WDATA_int };
                    burst_cnt <= burst_cnt + 1;
                    if (burst_cnt == WLEN)
                      begin
                        WLAST <= 1'b1;
                        axi_fsm_current_state <= Bresp_0;
                      end
                    else
                      begin
                        WDATA_int <= WDATA_int + 1;
                        axi_fsm_current_state <= Write_1;
                      end
                  end
              end
            Bresp_0:
              begin
                if (WREADY == 1'b1)
                  begin
                    WVALID <= 1'b0;
                    WLAST <= 1'b0;
                    `ifdef WITHOUT_WRITE_RESPONSE
                      //$display("WITHOUT_WRITE_RESPONSE");
                      wburst_cnt <= wburst_cnt + 1'b1;
                      AWADDR_int <= AWADDR_int + 128;
                      WDATA_int <= WDATA_int + 1;
                      axi_fsm_current_state <= Idle_1;
                    `endif
                  end
                `ifdef WITH_WRITE_RESPONSE
                //$display("WITH_WRITE_RESPONSE");
                if (BVALID == 1'b1)
                  begin
                    wburst_cnt <= wburst_cnt + 1'b1;
                    AWADDR_int <= AWADDR_int + 128;
                    WDATA_int <= WDATA_int + 1;
                    axi_fsm_current_state <= Idle_1;
                  end
                `endif
                else
                  begin
                    axi_fsm_current_state <= Bresp_0;
                  end
              end
            default:
              begin
                AWADDR <= 32'h00000000;
                AWADDR_int <= 32'h00000000;
                WDATA <= 64'h0000000000000000;
                WDATA_int <= 12'h000;
                AWSIZE <= 3'b000;
                AWBURST <= 2'b00;
                WSTRB <= 8'h00;
                AWVALID <= 1'b0;
                WVALID <= 1'b0;
                WLAST <= 1'b0;
                wburst_cnt <= 0;
                burst_cnt <= 4'b0000;
                axi_fsm_current_state <= Idle_1;
              end
          endcase
        end
    end

  always
    @(posedge CLK or negedge RESETn)
     
    begin
      if (RESETn == 1'b0)
        begin
          WD <= 16'h0000;
        end
      else
        begin
          if (w_start == 1'b1 &&  (wburst_cnt  == w_xfer_size_i))
            begin
              WD <= { 2'b00, w_clk_cnt };
            end
          else
            if (r_start == 1'b1 && (rburst_cnt == r_xfer_size_i))
              begin
                WD <= { 2'b00, r_clk_cnt };
              end
        end
    end


    /* Read address channel */
    always
      @(posedge CLK or negedge RESETn)
       
      begin
        if (RESETn == 1'b0)
          begin
            ARADDR <= 32'h00000000;
            //ARADDR_int  <= 32'h00000000;                 
            ARSIZE <= 2'b00;
            ARBURST <= 2'b00;
            ARVALID <= 1'b0;
            r_xfer_size_j <= 10'h000;
            axi_fsm_read_state <= Idle_1;
          end
        else
          begin
            case (axi_fsm_read_state)
              Idle_1:
                begin
                  if (r_start == 1'b1)
                    begin
                      r_xfer_size_j <= r_xfer_size_i;
                      ARSIZE <= 2'b11;
                      ARBURST <= 2'b01;
                      ARADDR <= ARADDR;
                      ARVALID <= 1'b1;
                      axi_fsm_read_state <= Read_0;
                    end
                  else
                    begin
                      axi_fsm_read_state <= Idle_1;
                      ARADDR <= 32'h00000000;
                    end
                end
              Read_0:
                begin
                  if (rburst_cnt == r_xfer_size_i)
                    axi_fsm_read_state <= Idle_1;
                  else
                    axi_fsm_read_state <= Read_0;
                  if (ARREADY == 1'b1)
                    begin
                      if (r_xfer_size_j != 1)
                        begin
                          ARADDR <= ARADDR + 128;
                          ARVALID <= 1'b1;
                          r_xfer_size_j <= r_xfer_size_j - 1;
                        end
                      else
                        begin
                          ARADDR <= 32'h00000000;
                          ARVALID <= 1'b0;
                          r_xfer_size_j <= 1;
                        end
                    end
                end
              default:
                begin
                  ARADDR <= 32'h00000000;
                  //ARADDR_int  <= 32'h00000000;                 
                  ARSIZE <= 2'b00;
                  ARBURST <= 2'b00;
                  ARVALID <= 1'b0;
                  r_xfer_size_j <= 10'h000;
                  axi_fsm_read_state <= Idle_1;
                end
            endcase
          end
      end
    /* Read data channel */
    always
      @(posedge CLK or negedge RESETn)
      
      begin
        if (RESETn == 1'b0)
          begin
            RREADY <= 1'b0;
            rdata_cnt <= 12'h000;
            rburst_cnt <= 0;
            ddr_rd_wrt_err_r <= 0;
            axi_fsm_read1_state <= Idle_1;
          end
        else
          begin
            case (axi_fsm_read1_state)
              Idle_1:
                begin
                  if (r_start == 1'b1 && (rburst_cnt != r_xfer_size_i))
                    begin
                      axi_fsm_read1_state <= Read_1;
                    end
                  else
                    begin
                      axi_fsm_read1_state <= Idle_1;
                      rburst_cnt <= 0;
                      rdata_cnt <= 12'h000;
                    end
                end
              Read_1:
                begin
                  if (RLAST == 1'b0)
                    begin
                      RREADY <= 1'b1;
                      axi_fsm_read1_state <= Read_2;
                    end
                  else
                    begin
                      axi_fsm_read1_state <= Read_1;
                    end
                end
              Read_2:
                begin
                  if (RVALID == 1'b1)
                    begin
                      if (RDATA == { 52'h0000000000000, rdata_cnt })
                        ddr_rd_wrt_err_r <= 0;
                      else begin
                        ddr_rd_wrt_err_r <= 1;
                      end
                      rdata_cnt <= rdata_cnt + 1;
                      if (RLAST == 1'b1)
                        begin
                          rburst_cnt <= rburst_cnt + 1;
                          RREADY <= 1'b0;
                          axi_fsm_read1_state <= Idle_1;
                        end
                      else
                        begin
                          RREADY <= 1'b1;
                          axi_fsm_read1_state <= Read_2;
                        end
                    end
                end
              default:
                begin
                  RREADY <= 1'b0;
                  rdata_cnt <= 12'h000;
                  rburst_cnt <= 0;
                  ddr_rd_wrt_err_r <= 0;
                  axi_fsm_read1_state <= Idle_1;
                end
            endcase
          end
      end
  
always
    @(posedge CLK or negedge RESETn)
    begin
        if (RESETn == 1'b0)
          begin
            ddr_rd_wrt_err  <= 0;
          end
        else    
          begin
            ddr_rd_wrt_err <= ddr_rd_wrt_err_r;
          end
    end
endmodule
