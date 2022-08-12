// ------------------------------------------------------------------------- --
// ------------------------------------------------------------------------- --
//                                                                           --
// File................: TESTBNCH.VHD                                        --
// Function............: Test bench for GENERIC UART                          --
// Version.............: 3.00                                                --
// Last Updated........: 05-25-05                                            --
// Component of........: None                                                --
// Components Required.: UART                                                 --
// Compilation Notes...:                                                     --
//                                                                           --
// Revision History:                                                         --
//   4.00:  added 13-bit baud_value
//   3.00:  added fifo verification
//   2.00:  improve report
//   1.01:  Initial design                                                   --
//   1.00:  Initial design                                                   --
//                                                                           --
//                                                                           --
// ------------------------------------------------------------------------- --
// ------------------------------------------------------------------------- --
`timescale  1ns/1ps

module testbnch ();

//`include "coreparameters.v"
//`include "../../../coreparameters.v"
`include "../../../../coreparameters.v"

//  1=fifo depth is 16 bytes, FIFO_DEPTH_16
//  is used for the testbench purpose only to
//  support the devices(SX-A, RTSX-S)

// The following parameter is used only in the testbench

parameter FIFO_DEPTH_16 = USE_SOFT_FIFO;
parameter FIFO_DEPTH_128 = ((FAMILY == 19) || (FAMILY == 24) || (FAMILY == 25)) ? 1 : 0;

//-----------------------------------------------
// component port listings
//-----------------------------------------------
//  1=with fifo operation mode
//  1=with fifo operation mode
//-----------------------------------------------
// internal signals
//-----------------------------------------------
reg clk = 1'b0; 
reg reset_n = 1'b0; 
wire [7:0] UARTstatus1_data_out; 
wire [7:0] UARTstatus2_data_out;
wire UARTstatus1_framing_err; 
wire UARTstatus2_framing_err;
reg UARTconfig1_bit8; 
reg UARTconfig1_parity_en; 
reg UARTconfig1_odd_n_even; 
reg [2:0] UARTconfig1_BAUD_VAL_FRACTION;
reg UARTconfig2_bit8; 
reg UARTconfig2_parity_en; 
reg UARTconfig2_odd_n_even;
reg [2:0] UARTconfig2_BAUD_VAL_FRACTION; 
wire[7:0] cpudata; 
wire txdata1; 
wire rxdata1; 
wire txdata2; 
wire rxdata2; 
//wire[12:0] baud_val; 
reg [12:0] UARTconfig1_baud_val; 
reg [12:0] UARTconfig2_baud_val; 
reg [7:0] cpucontrol_data;
reg cpucontrol_sel1; 
reg cpucontrol_sel2; 
reg cpucontrol_WEn; 
reg cpucontrol_OEn;

reg [8:0] count; 
reg [7:0] tdata[0:511] ; 
reg [7:0] rdata[0:511] ; 
reg[7:0] wdata; 
reg [8:0] rc; 
reg [8:0] tc; 
reg [8:0] i; 
reg [8:0] passflag; 
reg [7:0] par_err[0:511];


reg rxdata2_select; 

assign cpudata = cpucontrol_data ;


//-----------------------------------------------
// drive clock
//-----------------------------------------------
always 
begin
  #15; 
  clk = ~clk ; 
end 
//-----------------------------------------------
// component instantiations
//-----------------------------------------------

Core_UART_Core_UART_0_COREUART #(.TX_FIFO(TX_FIFO), .RX_FIFO(RX_FIFO), .FAMILY(FAMILY), .RX_LEGACY_MODE(RX_LEGACY_MODE), .BAUD_VAL_FRCTN_EN(BAUD_VAL_FRCTN_EN)) make_UART1(.RESET_N(reset_n), .CLK(clk), .WEN(cpucontrol_WEn), .OEN(cpucontrol_OEn), .CSN(cpucontrol_sel1), .DATA_IN(cpudata), .RX(rxdata1), .BAUD_VAL(UARTconfig1_baud_val), .BIT8(UARTconfig1_bit8), .PARITY_EN(UARTconfig1_parity_en), .ODD_N_EVEN(UARTconfig1_odd_n_even), .PARITY_ERR(UARTstatus1_parity_err), .OVERFLOW(UARTstatus1_overflow), .TXRDY(UARTstatus1_txrdy), .RXRDY(UARTstatus1_rxrdy), .DATA_OUT(UARTstatus1_data_out), .TX(txdata1), .FRAMING_ERR(UARTstatus1_framing_err), .BAUD_VAL_FRACTION(UARTconfig1_BAUD_VAL_FRACTION)); 

Core_UART_Core_UART_0_COREUART #(.TX_FIFO(TX_FIFO), .RX_FIFO(RX_FIFO), .FAMILY(FAMILY), .RX_LEGACY_MODE(RX_LEGACY_MODE), .BAUD_VAL_FRCTN_EN(BAUD_VAL_FRCTN_EN)) make_UART2(.RESET_N(reset_n), .CLK(clk), .WEN(cpucontrol_WEn), .OEN(cpucontrol_OEn), .CSN(cpucontrol_sel2), .DATA_IN(cpudata), .RX(rxdata2), .BAUD_VAL(UARTconfig2_baud_val), .BIT8(UARTconfig2_bit8), .PARITY_EN(UARTconfig2_parity_en), .ODD_N_EVEN(UARTconfig2_odd_n_even), .PARITY_ERR(UARTstatus2_parity_err), .OVERFLOW(UARTstatus2_overflow), .TXRDY(UARTstatus2_txrdy), .RXRDY(UARTstatus2_rxrdy), .DATA_OUT(UARTstatus2_data_out), .TX(txdata2), .FRAMING_ERR(UARTstatus2_framing_err), .BAUD_VAL_FRACTION(UARTconfig2_BAUD_VAL_FRACTION)); 

assign rxdata1 = txdata2 ;
// select zero bits for framing error test
assign rxdata2 = (rxdata2_select == 1'b0) ? txdata1 : 1'b0;

initial 
begin : xhdl_7
  // ALL TESTS BY DEFAULT TRANSMIT ON UART1 AND RECEIVE ON UART2
  
  //-----------------------------------------------
  // 2 Meg baud selection based on 33 MHZ clock
  // This is fixed if BAUD_VAL_FRCTN_EN = 0
  //-----------------------------------------------
  UARTconfig1_baud_val = 13'b0000000000001 ;
  UARTconfig2_baud_val = 13'b0000000000001 ;
  
  $display("Actel UART Testbench  v3.00 "); 
  $display("--------------------------------------"); 
  $display(" "); 
  //----------------------------------
  // initial control signal conditions
  //----------------------------------
  cpucontrol_sel1 = 1'b1;
  cpucontrol_sel2 = 1'b1;
  cpucontrol_WEn = 1'b1;
  cpucontrol_OEn = 1'b1;
  cpucontrol_data = 8'b00000000;
  // select txdata1 for rxdata2
  rxdata2_select = 1'b0;

  //-----------------------------------------------
  // drive the resets
  //-----------------------------------------------
  $display("Applying Reset"); 
  reset_n = 1'b0 ; 
  repeat (10) @(posedge clk); 
  @(posedge clk); 
  #100; 
  reset_n = 1'b1 ; 
  $display("Setting UART1 Operating Mode 8 bit, parity enabled, and even parity");
  UARTconfig1_bit8 = 1'b1 ; 
  UARTconfig1_parity_en = 1'b1 ; 
  UARTconfig1_odd_n_even = 1'b0 ;  
  $display("Setting UART2 Operating Mode 8 bit, parity enabled, and even parity"); 
  UARTconfig2_bit8 = 1'b1 ; 
  UARTconfig2_parity_en = 1'b1 ; 
  UARTconfig2_odd_n_even = 1'b0 ; 
  
  if(BAUD_VAL_FRCTN_EN == 1'b1)
    begin
      $display("Setting UART1 baud_val = 1");
      UARTconfig1_baud_val = 13'b0000000000001; 
      UARTconfig1_BAUD_VAL_FRACTION = 3'b000; 
      $display("Setting UART2 baud_val = 1");
      UARTconfig2_baud_val = 13'b0000000000001 ;
      UARTconfig2_BAUD_VAL_FRACTION = 3'b000;   
    end

  repeat (10) @(posedge clk);
  begin 
  if (FIFO_DEPTH_16 == 1)
    count = 16;
  else if (FIFO_DEPTH_128)
    count = 128;
  else
    count = 256;
end
tc = 0;
rc = 0;
$display("Testing Continuous Data Stream UART1 to UART2"); 
// Initialiase test data
begin
  for(i = 0; i <= count-1; i = i + 1)
  begin
    tdata[i] = i; 
  end
end 
while (rc < count)
          begin
            @(posedge clk); 
            if (tc < count)
            begin
              // Firstly See if the Transmitter is ready
                if (UARTstatus1_txrdy == 1'b1)
                begin
                  wdata = tdata[tc]; 
                  cpu_write(wdata);
                  tc = tc + 1; 
                end 
              end 
              // Now See if any received data
                //@ (posedge UARTstatus2_rxrdy);
                if (UARTstatus2_rxrdy == 1'b1)
                begin
                  cpu_read;
                  rdata[rc] = UARTstatus2_data_out; 
                  rc = rc + 1; 
                end 
              end 
              // Verify that correct data received
              begin 
              passflag = 0; 
              for(i = 0; i <= count - 1; i = i + 1)
              begin
                if (rdata[i] != tdata[i])
                begin
                  $display("THIS TEST IS FAILED\n"); 
                  $stop;
                end 
                else
                begin
                  passflag = passflag +1;
                  if (passflag == count)
                  begin 
                  $display("THIS TEST IS PASSED\n"); 
                  $display("-----------------------------------------------------"); 
                end
              end 
            end
          end 


          $display("Setting UART1 Operating Mode 8 bit, parity enabled, and odd parity");
          UARTconfig1_bit8 = 1'b1 ; 
          UARTconfig1_parity_en = 1'b1 ; 
          UARTconfig1_odd_n_even = 1'b1 ; 
          $display("Setting UART2 Operating Mode 8 bit, parity enabled, and odd parity"); 
          UARTconfig2_bit8 = 1'b1 ; 
          UARTconfig2_parity_en = 1'b1 ; 
          UARTconfig2_odd_n_even = 1'b1 ; 

          if(BAUD_VAL_FRCTN_EN == 1'b1)
            begin
              $display("Setting UART1 baud_val = 1.125");
              UARTconfig1_BAUD_VAL_FRACTION = 3'b001;
              UARTconfig1_baud_val = 13'b0000000000001;
              $display("Setting UART2 baud_val = 1.125");
              UARTconfig2_baud_val = 13'b0000000000001 ;
              UARTconfig2_BAUD_VAL_FRACTION = 3'b001;  
            end

          repeat (10) @(posedge clk); 
          begin 
          if (FIFO_DEPTH_16 == 1)
            count = 16;
          else
            count = 256;
        end
        tc = 0;
        rc = 0;
        $display("Testing Continuous Data Stream UART1 to UART2"); 
        // Initialiase test data
        begin
          for(i = 0; i <= count-1; i = i + 1)
          begin
            tdata[i] = i; 
          end
        end 
        while (rc < count)
      begin
        @(posedge clk); 
        if (tc < count)
        begin
          // Firstly See if the Transmitter is ready
            if (UARTstatus1_txrdy == 1'b1)
            begin
              wdata = tdata[tc]; 
              cpu_write(wdata);
              tc = tc + 1; 
            end 
          end 
          // Now See if any received data
            if (UARTstatus2_rxrdy == 1'b1)
            begin
              cpu_read;
              rdata[rc] = UARTstatus2_data_out; 
              rc = rc + 1; 
            end 
          end 
          // Verify that correct data received
          begin 
          passflag = 0; 
          for(i = 0; i <= count - 1; i = i + 1)
          begin
            if (rdata[i] != tdata[i])
            begin
              $display("THIS TEST IS FAILED\n"); 
              $stop;
            end 
            else
            begin
              passflag = passflag +1;
              if (passflag == count) 
              begin 
              $display("THIS TEST IS PASSED\n"); 
              $display("-----------------------------------------------------"); 
            end
          end 
        end
      end 

      $display("Setting UART1 Operating Mode 7 bit, parity enabled, and even parity"); 
      UARTconfig1_bit8 = 1'b0 ; 
      UARTconfig1_parity_en = 1'b1 ; 
      UARTconfig1_odd_n_even = 1'b0 ; 
      $display("Setting UART2 Operating Mode 7 bit, parity enabled, and even parity"); 
      UARTconfig2_bit8 = 1'b0 ; 
      UARTconfig2_parity_en = 1'b1 ; 
      UARTconfig2_odd_n_even = 1'b0 ; 

      if(BAUD_VAL_FRCTN_EN == 1'b1)
        begin
          $display("Setting UART1 baud_val = 1.25"); 
          UARTconfig1_baud_val = 13'b0000000000001;
          UARTconfig1_BAUD_VAL_FRACTION = 3'b010;
          $display("Setting UART2 baud_val = 1.25"); 
          UARTconfig2_baud_val = 13'b0000000000001 ;
          UARTconfig2_BAUD_VAL_FRACTION = 3'b010; 
        end
  
      repeat (10) @(posedge clk); 
      begin 
      if (FIFO_DEPTH_16 == 1)
        count = 16;
      else if (FIFO_DEPTH_128)
        count = 64;
      else
        count = 128;
    end
    tc = 0;
    rc = 0;
    $display("Testing Continuous Data Stream UART1 to UART2"); 
    // Initialiase test data
    begin
      for(i = 0; i <= count-1; i = i + 1)
      begin
        tdata[i] = i; 
      end
    end 
    while (rc < count)
  begin
    @(posedge clk); 
    if (tc < count)
    begin
      // Firstly See if the Transmitter is ready
        if (UARTstatus1_txrdy == 1'b1)
        begin
          wdata = tdata[tc]; 
          cpu_write(wdata);
          tc = tc + 1; 
        end 
      end 
      // Now See if any received data
        if (UARTstatus2_rxrdy == 1'b1)
        begin
          cpu_read;
          rdata[rc] = UARTstatus2_data_out; 
          rc = rc + 1; 
        end 
      end 
      // Verify that correct data received
      begin 
      passflag = 0; 
      for(i = 0; i <= count - 1; i = i + 1)
      begin
        if (rdata[i] != tdata[i])
        begin
          $display("THIS TEST IS FAILED\n"); 
          $stop;
        end 
        else
        begin
          passflag = passflag +1;
          if (passflag == count) 
          begin 
          $display("THIS TEST IS PASSED\n"); 
          $display("-----------------------------------------------------"); 
        end
      end 
    end
  end 

  $display("Setting UART1 Operating Mode 7 bit, parity enabled, and odd parity"); 

  UARTconfig1_bit8 = 1'b0 ; 
  UARTconfig1_parity_en = 1'b1 ; 
  UARTconfig1_odd_n_even = 1'b1 ; 
  $display("Setting UART2 Operating Mode 7 bit, parity enabled, and odd parity"); 

  UARTconfig2_bit8 = 1'b0 ; 
  UARTconfig2_parity_en = 1'b1 ; 
  UARTconfig2_odd_n_even = 1'b1 ;

  if(BAUD_VAL_FRCTN_EN == 1'b1)
    begin
      $display("Setting UART1 baud_val = 1.375"); 
      UARTconfig1_baud_val = 13'b0000000000001;
      UARTconfig1_BAUD_VAL_FRACTION = 3'b011;
      $display("Setting UART2 baud_val = 1.375"); 
      UARTconfig2_baud_val = 13'b0000000000001;
      UARTconfig2_BAUD_VAL_FRACTION = 3'b011;
    end
  
  repeat (10) @(posedge clk); 
  begin 
    if (FIFO_DEPTH_16 == 1)
      count = 16;
    else if (FIFO_DEPTH_128)
      count = 64;
    else
      count = 128;
  end
tc = 0;
rc = 0;
$display("Testing Continuous Data Stream UART1 to UART2"); 
// Initialiase test data
begin
  for(i = 0; i <= count-1; i = i + 1)
  begin
    tdata[i] = i; 
  end
end 
while (rc < count)
          begin
            @(posedge clk); 
            if (tc < count)
            begin
              // Firstly See if the Transmitter is ready
                if (UARTstatus1_txrdy == 1'b1)
                begin
                  wdata = tdata[tc]; 
                  cpu_write(wdata);
                  tc = tc + 1; 
                end 
              end 
              // Now See if any received data
                if (UARTstatus2_rxrdy == 1'b1)
                begin
                  cpu_read;
                  rdata[rc] = UARTstatus2_data_out; 
                  rc = rc + 1; 
                end 
              end 
              // Verify that correct data received
              begin 
              passflag = 0; 
              for(i = 0; i <= count - 1; i = i + 1)
              begin
                if (rdata[i] != tdata[i])
                begin
                  $display("THIS TEST IS FAILED\n"); 
                  $stop;
                end 
                else
                begin
                  passflag = passflag +1;
                  if (passflag == count) 
                  begin 
                  $display("THIS TEST IS PASSED\n"); 
                  $display("-----------------------------------------------------"); 
                end
              end 
            end
          end 

          $display("Setting UART1 Operating Mode 8 bit, parity disabled"); 
          UARTconfig1_bit8 = 1'b1; 
          UARTconfig1_parity_en = 1'b0; 
          UARTconfig1_odd_n_even = 1'b1; 
          $display("Setting UART2 Operating Mode 8 bit, parity disabled"); 
          UARTconfig2_bit8 = 1'b1; 
          UARTconfig2_parity_en = 1'b0; 
          UARTconfig2_odd_n_even = 1'b1; 

          if(BAUD_VAL_FRCTN_EN == 1'b1)
            begin
              $display("Setting UART1 baud_val = 1.5");
              UARTconfig1_baud_val = 13'b0000000000001;  
              UARTconfig1_BAUD_VAL_FRACTION = 3'b100;
              $display("Setting UART2 baud_val = 1.5"); 
              UARTconfig2_baud_val = 13'b0000000000001;
              UARTconfig2_BAUD_VAL_FRACTION = 3'b100;
            end  
  
          repeat (10) @(posedge clk); 
          begin   
          if (FIFO_DEPTH_16 == 1)
            count = 16;
          else if (FIFO_DEPTH_128)
            count = 128;   
          else
            count = 256;
        end
        tc = 0;
        rc = 0;
        $display("Testing Continuous Data Stream UART1 to UART2"); 
        // Initialiase test data
        begin
          for(i = 0; i <= count-1; i = i + 1)
          begin
            tdata[i] = i; 
          end
        end 
        while (rc < count)
      begin
        @(posedge clk); 
        if (tc < count)
        begin
          // Firstly See if the Transmitter is ready
            if (UARTstatus1_txrdy == 1'b1)
            begin
              wdata = tdata[tc]; 
              cpu_write(wdata);
              tc = tc + 1; 
            end 
          end 
          // Now See if any received data
            if (UARTstatus2_rxrdy == 1'b1)
            begin
              cpu_read;
              rdata[rc] = UARTstatus2_data_out; 
              rc = rc + 1; 
            end 
          end 
          // Verify that correct data received
          begin 
          passflag = 0; 
          for(i = 0; i <= count - 1; i = i + 1)
          begin
            if (rdata[i] != tdata[i])
            begin
              $display("THIS TEST IS FAILED\n"); 
              $stop;
            end 
            else
            begin
              passflag = passflag +1;
              if (passflag == count) 
              begin 
              $display("THIS TEST IS PASSED\n"); 
              $display("-----------------------------------------------------"); 
            end
          end 
        end
      end 

      $display("Setting UART1 Operating Mode 7 bit, parity disabled");
      UARTconfig1_bit8 = 1'b0; 
      UARTconfig1_parity_en = 1'b0; 
      UARTconfig1_odd_n_even = 1'b1; 
      $display("Setting UART2 Operating Mode 7 bit, parity disabled"); 
      UARTconfig2_bit8 = 1'b0; 
      UARTconfig2_parity_en = 1'b0; 
      UARTconfig2_odd_n_even = 1'b1;

      if(BAUD_VAL_FRCTN_EN == 1'b1)
        begin
          $display("Setting UART1 baud_val = 1.625"); 
          UARTconfig1_baud_val = 13'b0000000000001;
          UARTconfig1_BAUD_VAL_FRACTION = 3'b101;
          $display("Setting UART2 baud_val = 1.625"); 
          UARTconfig2_baud_val = 13'b0000000000001;
          UARTconfig2_BAUD_VAL_FRACTION = 3'b101;
        end 
  
      repeat (10) @(posedge clk); 
      begin 
      if (FIFO_DEPTH_16 == 1)
        count = 16;
      else if (FIFO_DEPTH_128)
        count = 64;   
      else
        count = 128;
     end
    tc = 0;
    rc = 0;
    $display("Testing Continuous Data Stream UART1 to UART2"); 
    // Initialiase test data
    begin
      for(i = 0; i <= count-1; i = i + 1)
      begin
        tdata[i] = i; 
      end
    end 
    while (rc < count)
  begin
    @(posedge clk); 
    if (tc < count)
    begin
      // Firstly See if the Transmitter is ready
        if (UARTstatus1_txrdy == 1'b1)
        begin
          wdata = tdata[tc]; 
          cpu_write(wdata);
          tc = tc + 1; 
        end 
      end 
      // Now See if any received data
        if (UARTstatus2_rxrdy == 1'b1)
        begin
          cpu_read;
          rdata[rc] = UARTstatus2_data_out; 
          rc = rc + 1; 
        end 
      end 
      // Verify that correct data received
      begin 
      passflag = 0; 
      for(i = 0; i <= count - 1; i = i + 1)
      begin
        if (rdata[i] != tdata[i])
        begin
          $display("THIS TEST IS FAILED\n"); 
          $stop;
        end 
        else
        begin
          passflag = passflag +1;
          if (passflag == count) 
          begin 
          $display("THIS TEST IS PASSED\n"); 
          $display("-----------------------------------------------------"); 
        end
      end 
    end
  end 

  //---------------------------------
  // Testing PARITY ERROR Generations
  //---------------------------------
  $display("Setting UART1 8bit, parity enabled, and even parity");
  // UART1 8bit, parity enabled, and even parity  
  UARTconfig1_bit8 = 1'b1 ; 
  UARTconfig1_parity_en = 1'b1 ; 
  UARTconfig1_odd_n_even = 1'b0 ; 
  $display("Setting UART2 8bit, parity enabled, and odd parity"); 

  // UART2 8bit, parity enabled, and odd parity
  UARTconfig2_bit8 = 1'b1 ; 
  UARTconfig2_parity_en = 1'b1 ; 
  UARTconfig2_odd_n_even = 1'b1 ; 
  
  if(BAUD_VAL_FRCTN_EN == 1'b1)
    begin
      $display("Setting UART1 baud_val = 1.75");
      UARTconfig1_baud_val = 13'b0000000000001 ;  
      UARTconfig1_BAUD_VAL_FRACTION = 3'b110;  
      $display("Setting UART2 baud_val = 1.75"); 
      UARTconfig2_baud_val = 13'b0000000000001 ;
      UARTconfig2_BAUD_VAL_FRACTION = 3'b110; 
    end  
  
  repeat (10) @(posedge clk); 
  begin 
  if (FIFO_DEPTH_16 == 1)
    count = 16;
  else if (FIFO_DEPTH_128)
    count = 128;   
  else
    count = 256;
end
$display("Testing parity error generation"); 
// Initialiase test data
tc = 0; 
rc = 0; 
i = 0; 

begin
  for(i = 0; i <= count-1; i = i + 1)
  begin
    tdata[i] = i; 
    par_err[i] = 0; 
  end
end

while (rc < count)
         begin
           @(posedge clk); 
           if (tc < count)
           begin
             // Firstly See if the Transmitter is ready
               if (UARTstatus1_txrdy == 1'b1)
               begin
                 wdata = tdata[tc]; 
                 cpu_write(wdata);
                 tc = tc + 1; 
               end 
             end 
             if (RX_FIFO == 0)
             begin
               // Now See if any received data
                 if (UARTstatus2_rxrdy == 1'b1)
                 begin
                   par_err[rc] = UARTstatus2_parity_err; 
                   cpu_read;
                   rdata[rc] = UARTstatus2_data_out; 
                   rc = rc + 1; 
                 end 
               end
               else
               begin
                 if (UARTstatus2_parity_err == 1'b1)
                 begin
                   par_err[rc] = UARTstatus2_parity_err; 
                   cpu_read;
                   rdata[rc] = UARTstatus2_data_out; 
                   rc = rc + 1; 
                 end 
               end 
             end 

             begin 
             passflag = 0; 
             for(i = 0; i <= count - 1; i = i + 1)
             begin
               if (par_err[i] != 1)
               begin 
               $display("THIS TEST IS FAILED\n"); 
               $stop;
             end 
             else
             begin
               passflag = passflag +1;
               if (passflag == count) 
               begin 
               $display("THIS TEST IS PASSED\n"); 
               $display("-----------------------------------------------------"); 
             end
           end 
         end
       end 

       $display("Setting UART1 8bit, parity enabled, and odd parity"); 

       // UART1 8bit, parity enabled, and odd parity
       UARTconfig1_bit8 = 1'b1 ; 
       UARTconfig1_parity_en = 1'b1 ; 
       UARTconfig1_odd_n_even = 1'b1 ; 
       $display("Setting UART2 8bit, parity enabled, and even parity"); 

       // UART2 8bit, parity enabled, and even parity
       UARTconfig2_bit8 = 1'b1 ; 
       UARTconfig2_parity_en = 1'b1 ; 
       UARTconfig2_odd_n_even = 1'b0 ; 
   
       if(BAUD_VAL_FRCTN_EN == 1'b1)
         begin
           $display("Setting UART1 baud_val = 1.875"); 
           UARTconfig1_baud_val = 13'b0000000000001 ;
           UARTconfig1_BAUD_VAL_FRACTION = 3'b111; 
           $display("Setting UART2 baud_val = 1.875"); 
           UARTconfig2_baud_val = 13'b0000000000001 ;
           UARTconfig2_BAUD_VAL_FRACTION = 3'b111;
         end     
   
       repeat (10) @(posedge clk); 
       begin 
       if (FIFO_DEPTH_16 == 1)
         count = 16;
       else
         count = 256;
     end
     $display("Testing parity error generation"); 
     // Initialiase test data
     tc = 0; 
     rc = 0; 
     i = 0; 

     begin
       for(i = 0; i <= count-1; i = i + 1)
       begin
         tdata[i] = i; 
         par_err[i] = 0; 
       end
     end

     while (rc < count)
   begin
     @(posedge clk); 
     if (tc < count)
     begin
       // Firstly See if the Transmitter is ready
         if (UARTstatus1_txrdy == 1'b1)
         begin
           wdata = tdata[tc]; 
           cpu_write(wdata);
           tc = tc + 1; 
         end 
       end 
       if (RX_FIFO == 0)
       begin
         // Now See if any received data
           if (UARTstatus2_rxrdy == 1'b1)
           begin
             par_err[rc] = UARTstatus2_parity_err; 
             cpu_read;
             rdata[rc] = UARTstatus2_data_out; 
             rc = rc + 1; 
           end 
         end
         else
         begin
           if (UARTstatus2_parity_err == 1'b1)
           begin
             par_err[rc] = UARTstatus2_parity_err; 
             cpu_read;
             rdata[rc] = UARTstatus2_data_out; 
             rc = rc + 1; 
           end 
         end 
       end 

       begin 
       passflag = 0; 
       for(i = 0; i <= count - 1; i = i + 1)
       begin
         if (par_err[i] != 1)
         begin 
         $display("THIS TEST IS FAILED\n"); 
         $stop;
       end 
       else
       begin
         passflag = passflag +1;
         if (passflag == count) 
         begin 
         $display("THIS TEST IS PASSED\n"); 
         $display("-----------------------------------------------------"); 
       end
     end 
   end
 end 

 $display("Setting UART1 7bit, parity enabled, and even parity"); 

 // UART1 7bit, parity enabled, and even parity
 UARTconfig1_bit8 = 1'b0 ; 
 UARTconfig1_parity_en = 1'b1 ; 
 UARTconfig1_odd_n_even = 1'b0 ; 
 $display("Setting UART2 7bit, parity enabled, and odd parity"); 

 // UART2 7bit, parity enabled, and odd parity
 UARTconfig2_bit8 = 1'b0 ; 
 UARTconfig2_parity_en = 1'b1 ; 
 UARTconfig2_odd_n_even = 1'b1 ; 
 
 if(BAUD_VAL_FRCTN_EN == 1'b1)
   begin
     $display("Setting UART1 baud_val = 5.5"); 
     UARTconfig1_baud_val = 13'b0000000000101 ;
     UARTconfig1_BAUD_VAL_FRACTION = 3'b100;
     $display("Setting UART2 baud_val = 5.5"); 
     UARTconfig2_baud_val = 13'b0000000000101 ;
     UARTconfig2_BAUD_VAL_FRACTION = 3'b100;
   end  
 
 repeat (10) @(posedge clk); 
 begin 
 if (FIFO_DEPTH_16 == 1)
   count = 16;
 else if (FIFO_DEPTH_128)
   count = 64;   
 else
   count = 128;
      end
      $display("Testing parity error generation"); 
      // Initialiase test data
      tc = 0; 
      rc = 0; 
      i = 0; 

      begin
        for(i = 0; i <= count-1; i = i + 1)
        begin
          tdata[i] = i; 
          par_err[i] = 0; 
        end
      end

      while (rc < count)
    begin
      @(posedge clk); 
      if (tc < count)
      begin
        // Firstly See if the Transmitter is ready
          if (UARTstatus1_txrdy == 1'b1)
          begin
            wdata = tdata[tc]; 
            cpu_write(wdata);
            tc = tc + 1; 
          end 
        end 
        if (RX_FIFO == 0)
        begin
          // Now See if any received data
            if (UARTstatus2_rxrdy == 1'b1)
            begin
              par_err[rc] = UARTstatus2_parity_err; 
              cpu_read;
              rdata[rc] = UARTstatus2_data_out; 
              rc = rc + 1; 
            end 
          end
          else
          begin
            if (UARTstatus2_parity_err == 1'b1)
            begin
              par_err[rc] = UARTstatus2_parity_err; 
              cpu_read;
              rdata[rc] = UARTstatus2_data_out; 
              rc = rc + 1; 
            end 
          end 
        end 

        begin 
        passflag = 0; 
        for(i = 0; i <= count - 1; i = i + 1)
        begin
          if (par_err[i] != 1)
          begin 
          $display("THIS TEST IS FAILED\n"); 
          $stop;
        end 
        else
        begin
          passflag = passflag +1;
          if (passflag == count) 
          begin 
          $display("THIS TEST IS PASSED\n"); 
          $display("-----------------------------------------------------"); 
        end
      end 
    end
  end 

  $display("Setting UART1 7bit, parity enabled, and odd parity");
  // UART1 7bit, parity enabled, and odd parity
  UARTconfig1_bit8 = 1'b0 ; 
  UARTconfig1_parity_en = 1'b1 ; 
  UARTconfig1_odd_n_even = 1'b1 ; 
  $display("Setting UART2 8bit, parity enabled, and even parity"); 
  // UART2 7bit, parity enabled, and even parity
  UARTconfig2_bit8 = 1'b0 ; 
  UARTconfig2_parity_en = 1'b1 ; 
  UARTconfig2_odd_n_even = 1'b0 ; 
  
  if(BAUD_VAL_FRCTN_EN == 1'b1)
    begin
      $display("Setting UART1 baud_val = 3.125"); 
      UARTconfig1_baud_val = 13'b0000000000011;
      UARTconfig1_BAUD_VAL_FRACTION = 3'b001;
      $display("Setting UART2 baud_val = 3.125"); 
      UARTconfig2_baud_val = 13'b0000000000011;
      UARTconfig2_BAUD_VAL_FRACTION = 3'b001; 
    end 
  
  repeat (10) @(posedge clk); 
  begin 
  if (FIFO_DEPTH_16 == 1)
    count = 16;
  else if (FIFO_DEPTH_128)
    count = 128;   
  else
    count = 256;
end
$display("Testing parity error generation"); 
// Initialiase test data
tc = 0; 
rc = 0; 
i = 0; 

begin
  for(i = 0; i <= count-1; i = i + 1)
  begin
    tdata[i] = i; 
    par_err[i] = 0; 
  end
end

while (rc < count)
         begin
           @(posedge clk); 
           if (tc < count)
           begin
             // Firstly See if the Transmitter is ready
               if (UARTstatus1_txrdy == 1'b1)
               begin
                 wdata = tdata[tc]; 
                 cpu_write(wdata);
                 tc = tc + 1; 
               end 
             end 
             if (RX_FIFO == 0)
             begin
               // Now See if any received data
                 if (UARTstatus2_rxrdy == 1'b1)
                 begin
                   par_err[rc] = UARTstatus2_parity_err; 
                   cpu_read;
                   rdata[rc] = UARTstatus2_data_out; 
                   rc = rc + 1; 
                 end 
               end
               else
               begin
                 if (UARTstatus2_parity_err == 1'b1)
                 begin
                   par_err[rc] = UARTstatus2_parity_err; 
                   cpu_read;
                   rdata[rc] = UARTstatus2_data_out; 
                   rc = rc + 1; 
                 end 
               end 
             end 

             begin 
             passflag = 0; 
             for(i = 0; i <= count - 1; i = i + 1)
             begin
               if (par_err[i] != 1)
               begin 
               $display("THIS TEST IS FAILED\n"); 
               $stop;
             end 
             else
             begin
               passflag = passflag +1;
               if (passflag == count) 
               begin 
               $display("THIS TEST IS PASSED\n"); 
               $display("-----------------------------------------------------"); 
             end
           end 
         end
       end 
  
   
       //---------------------------------
       // Testing Overflow circuitry
       //---------------------------------
       if (RX_FIFO == 0)
       begin
         $display("Setting UART1 8bit, parity enabled, and odd parity"); 
         UARTconfig1_bit8 = 1'b1 ; 
         UARTconfig1_parity_en = 1'b1 ; 
         UARTconfig1_odd_n_even = 1'b0 ; 
         $display("Setting UART2 8bit, parity enabled, and odd parity"); 
         UARTconfig2_bit8 = 1'b1 ; 
         UARTconfig2_parity_en = 1'b1 ; 
         UARTconfig2_odd_n_even = 1'b0 ; 
 
         if(BAUD_VAL_FRCTN_EN == 1'b1)
           begin
             $display("Setting UART1 baud_val = 2.25"); 
             UARTconfig1_baud_val = 13'b0000000000010;
             UARTconfig1_BAUD_VAL_FRACTION = 3'b010;
             $display("Setting UART2 baud_val = 2.25"); 
             UARTconfig2_baud_val = 13'b0000000000010;
             UARTconfig2_BAUD_VAL_FRACTION = 3'b010;
           end 
 
         repeat (100) @(posedge clk); 
         $display("Testing for RX data overflow"); 
         cpu_write(8'b10100101);
       repeat (5) @(posedge clk); 
       if (UARTstatus2_overflow == 1'b1)
       begin
         $display("Overflow set too early"); 
       end 
       if (UARTstatus1_txrdy == 1'b1)
       begin
         cpu_write(8'b01011010);
         @(posedge UARTstatus2_overflow); 
         repeat (10) @(posedge clk); 
       end
       else
       begin
         @(posedge UARTstatus1_txrdy); 
         repeat (10) @(posedge clk); 
         cpu_write(8'b01011010);
         @(posedge UARTstatus2_overflow); 
         repeat (10) @(posedge clk); 
       end 
       // Get the byte, should be the first one
       if (UARTstatus2_rxrdy == 1'b1)
       begin
         cpu_read;
       end
       else
       begin
         @(posedge UARTstatus2_rxrdy); 
         cpu_read;
       end 
       if (UARTstatus2_data_out != 8'b10100101)
       begin
         $display("THIS TEST IS FAILED\n"); 
         $stop;
       end
       else
       begin
         $display("THIS TEST IS PASSED\n"); 
         $display("-----------------------------------------------------"); 
       end 
       repeat (5) @(posedge clk); 
       cpu_write(8'b01011010);
     end 

     if (RX_FIFO == 1)
     begin
       $display ("Clearing out FIFO for next test");   
       repeat (130000) @(posedge clk);                // Different delays are needed for different baud values and FIFO sizes
                                                      // If the testbench is modified the repeat() delay may need to be increase to clear FIFO
       // clear out fifo
       while(UARTstatus2_rxrdy == 1'b1)
         begin
           @(posedge clk);
           cpu_read;
         end  
       $display("Setting UART1 Operating Mode 8 bit, parity enabled, and even parity"); 
       UARTconfig1_bit8 = 1'b1 ; 
       UARTconfig1_parity_en = 1'b1 ; 
       UARTconfig1_odd_n_even = 1'b0 ; 
       $display("Setting UART2 Operating Mode 8 bit, parity enabled, and even parity"); 
       UARTconfig2_bit8 = 1'b1 ; 
       UARTconfig2_parity_en = 1'b1 ; 
       UARTconfig2_odd_n_even = 1'b0 ; 
   
       if(BAUD_VAL_FRCTN_EN == 1'b1)
         begin
           $display("Setting UART1 baud_val = 2.25");
           UARTconfig1_baud_val = 13'b0000000000010;	   
           UARTconfig1_BAUD_VAL_FRACTION = 3'b010;
           $display("Setting UART2 baud_val = 2.25"); 
           UARTconfig2_baud_val = 13'b0000000000010;
           UARTconfig2_BAUD_VAL_FRACTION = 3'b010;
         end    
  
       repeat (10) @(posedge clk);
       begin 
       if (FIFO_DEPTH_16 == 1)
//         count = 16;
         count = 17;
       else if (FIFO_DEPTH_128)
         count = 129;   
       else
//         count = 256;
         count = 257;
       end
     tc = 0;
     rc = 0;
     $display("Testing for RX data overflow"); 
     // Initialiase test data
   begin
     for(i = 0; i <= count-1; i = i + 1)
     begin
       tdata[i] = i; 
     end
   end 
   while (tc < count)
 begin
   @(posedge clk); 
   if (tc < count)
   begin
     // Firstly See if the Transmitter is ready
       if (UARTstatus1_txrdy == 1'b1)
       begin
//         $display(">> Sending byte %0d", tc);
         wdata = tdata[tc]; 
         cpu_write(wdata);
         tc = tc + 1; 
       end 
     end 
   end 
   // Now See if any received data
     @(posedge UARTstatus2_overflow); 
     begin
       cpu_read;
       rdata[0] = UARTstatus2_data_out; 
     end 
   end 
   // Verify that correct data received
   begin 
   if (rdata[0] != tdata[0])
   begin
     $display("THIS TEST IS FAILED\n"); 
	 $display ("See note on line 1042 of testbnch");
     $stop;
   end 
   else
   begin
     $display("THIS TEST IS PASSED\n"); 
     $display("-----------------------------------------------------"); 
   end 
 end

 repeat (10000) @(posedge clk);
 $display ("Clearing out FIFO for next test");

 // clear out fifo
 while(UARTstatus2_rxrdy == 1'b1)
 begin
    @(posedge clk);
    cpu_read;
 end


  repeat (10000) @(posedge clk);
  // framing error test (AS)
  $display("Framing Error Test");
  // fill rxdata2 line with zeros (frame error)
  rxdata2_select = 1'b1;
  repeat (80000) @(posedge clk);
  if (UARTstatus2_framing_err == 1'b0) 
  begin
    $display("THIS TEST IS FAILED\n"); 
    $stop;
  end

  // clear framing error, switch to normal rx
  rxdata2_select = 1'b0;
  cpu_read;
  repeat (10000) @(posedge clk);  
  if (UARTstatus2_framing_err == 1'b1) 
  begin
    $display("THIS TEST IS FAILED\n"); 
    $stop;
  end
  else begin
    $display("THIS TEST IS PASSED\n"); 
    $display("-----------------------------------------------------"); 
  end


 $display("END OF SIMULATION"); 
 $display("ALL TESTS ARE PASSED"); 
 $stop; 
   end 


   //----------------------------------------------------------------
   // basic CPU read and write cycles 
   //       
   task cpu_write;
     input [7:0] data; 

     begin
       cpucontrol_sel1 = 1'b0 ; 
       cpucontrol_data = data ; 
       cpucontrol_WEn = 1'b0 ; 
       @(posedge clk); 
       cpucontrol_WEn = 1'b1 ; 
       @(posedge clk); 
       cpucontrol_sel1 = 1'b1 ; 
       @(posedge clk); 
     end
   endtask

   task cpu_read;
     begin
       cpucontrol_sel2 = 1'b0 ; 
       cpucontrol_OEn = 1'b0 ; 
       @(posedge clk); 
       cpucontrol_sel2 = 1'b1 ; 
       cpucontrol_OEn = 1'b1 ; 
       repeat (4) @(posedge clk); 
     end
   endtask

   endmodule
