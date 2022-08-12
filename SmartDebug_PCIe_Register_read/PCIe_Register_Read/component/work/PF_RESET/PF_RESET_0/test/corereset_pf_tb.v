`timescale 1ns/100ps

module corereset_pf_tb;

parameter SYSCLK_PERIOD = 100;// 10MHZ

reg SYSCLK;
reg EXT_RST_N;
reg PLL_LOCK;
reg SS_BUSY;
reg INIT_DONE;
reg FF_US_RESTORE;
wire FABRIC_RESET_N;

initial
begin
    SYSCLK = 1'b0;
end

//////////////////////////////////////////////////////////////////////
// Reset Pulse
//////////////////////////////////////////////////////////////////////
initial
begin
   ext_rst();
   PLL_LOCK_rst();
   init_done_rst(); 
   $stop;
end

task ext_rst;
begin
   $display("External Reset test  :: time is %0t",$time); 
   EXT_RST_N = 1'b1;
   PLL_LOCK = 1'b1;
   SS_BUSY = 1'b1;
   INIT_DONE = 1'b1;
   FF_US_RESTORE = 1'b1;
   #100;
   EXT_RST_N = 1'b0;
   #100;
   FF_US_RESTORE = 1'b0;
   #100;
   SS_BUSY = 1'b0;
   #100;
   if (FABRIC_RESET_N == 1'b0)
      begin 
         $display("External Reset Test Success :: time is %0t",$time);
      end
   else
      begin
        $display("External Reset Test Failed :: time is %0t",$time);
      end
   FF_US_RESTORE = 1'b1;
   #100;
end
endtask

task PLL_LOCK_rst;
begin
   $display("PLL_LOCK Reset test  :: time is %0t",$time); 
   EXT_RST_N = 1'b1;
   PLL_LOCK = 1'b1;
   SS_BUSY = 1'b1;
   INIT_DONE = 1'b1;
   FF_US_RESTORE = 1'b1;
   #100;
   PLL_LOCK = 1'b0;
   #100;
   FF_US_RESTORE = 1'b0;
   #100;
   SS_BUSY = 1'b0;
   #100;
   if (FABRIC_RESET_N == 1'b0)
      begin 
         $display("PLL Lock Reset Test Success :: time is %0t",$time);
      end
   else
      begin
        $display("PLL Lock Reset Test Failed :: time is %0t",$time);
      end
   FF_US_RESTORE = 1'b1;
   #100;
   
end
endtask

task init_done_rst;
begin
   $display("Init Done Reset test  :: time is %0t",$time); 
   EXT_RST_N = 1'b1;
   PLL_LOCK = 1'b1;
   SS_BUSY = 1'b1;
   INIT_DONE = 1'b1;
   FF_US_RESTORE = 1'b1;
   #100;
   INIT_DONE = 1'b0;
   #100;
   FF_US_RESTORE = 1'b0;
   #100;
   SS_BUSY = 1'b0;
   #100;
   if (FABRIC_RESET_N == 1'b0)
      begin 
         $display("Init Done Reset Test Success :: time is %0t",$time);
      end
   else
      begin
        $display("Init Done Reset Test Failed :: time is %0t",$time);
      end
   FF_US_RESTORE = 1'b1;
   #100;
end
endtask

//////////////////////////////////////////////////////////////////////
// Clock Driver
//////////////////////////////////////////////////////////////////////
always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;


//////////////////////////////////////////////////////////////////////
// Instantiate Unit Under Test:  CORERESET_PF
//////////////////////////////////////////////////////////////////////
PF_RESET_PF_RESET_0_CORERESET_PF CORERESET_PF_0 (
    .CLK(SYSCLK),
    .EXT_RST_N(EXT_RST_N),
    .PLL_LOCK(PLL_LOCK),
    .SS_BUSY(SS_BUSY),
    .INIT_DONE(INIT_DONE),
    .FF_US_RESTORE(FF_US_RESTORE),

    // Outputs
    .FABRIC_RESET_N(FABRIC_RESET_N )

);

endmodule

