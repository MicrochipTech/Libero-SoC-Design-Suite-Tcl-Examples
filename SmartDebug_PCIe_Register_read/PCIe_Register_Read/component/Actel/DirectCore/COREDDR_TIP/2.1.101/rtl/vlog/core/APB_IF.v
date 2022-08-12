//--------------------------------------------------
//-- -----------------------------------------------------------------------------                                                                                                                                                
//--    Crevinn Teoranta                                                                                                                                         
//-- -----------------------------------------------------------------------------                                                                                                                                                
//-- Author      : $Author:      gianl                                                                                                       
//-- Date        : $Date: 2010-04-29 14:34:52 $                                                                                                                                                
//-- Revision    : $Revision: 1.11 $                                                                                                                                                
//-- Location    : $URL: $                                                                                                                                                
//-- -----------------------------------------------------------------------------                                                                                                                                                
//--------------------------------------------------
 
 
module APB_IF (
               //  input ports
               SCLK,
               reset_n,
               paddr,
               psel,
               pwdata,
               pwrite,
               rdlvl_rddata,
               vref_rddata,
               wrlvl_rddata,
               debug_rddata,
               penable,
 
               //  output ports
               prdata,
               pready,
               apb_addr,
               apb_we,
               apb_wrdata,
               apb_re,
               read_access,
               // AS: added (/2) pclk
               pclk,
               // AS: added new read registers
               addcmd_rddata,
               wrcal_rddata,
               bclk_rddata
               );
 
   parameter        N_WAIT_STATES   = 4;
//  input ports
   input            SCLK;
   wire             SCLK;
   input            reset_n;
   wire             reset_n;
   input     [15:0] paddr;
   wire      [15:0] paddr;
   input            psel;
   wire             psel;
   input     [7:0]  pwdata;
   wire      [7:0]  pwdata;
   input            pwrite;
   wire             pwrite;
   input     [7:0]  rdlvl_rddata;
   wire      [7:0]  rdlvl_rddata;
   input     [7:0]  vref_rddata;
   wire      [7:0]  vref_rddata;
   input     [7:0]  wrlvl_rddata;
   wire      [7:0]  wrlvl_rddata;
   input     [7:0]  debug_rddata;
   wire      [7:0]  debug_rddata;
   // AS: added new read registers
   input     [7:0]  addcmd_rddata;
   input     [7:0]  wrcal_rddata;   
   input     [7:0]  bclk_rddata;
   wire      [7:0]  addcmd_rddata;
   wire      [7:0]  wrcal_rddata;   
   wire      [7:0]  bclk_rddata;
   input            penable;
   wire             penable;
//  output ports
   output    [7:0]  prdata;
   reg       [7:0]  prdata;
   output           pready;
   reg              pready;
   output    [15:0] apb_addr;
   wire      [15:0] apb_addr;
   output           apb_we;
   output    [7:0]  apb_wrdata;
   wire      [7:0]  apb_wrdata;
   output           apb_re;

   output    [6:0]  read_access;
   reg       [6:0]  read_access;
   
   // AS: added
   input            pclk;
   wire             pclk;
   
//  local signals
   reg       [2:0]  wait_cnt;
 
   parameter FINISH      = 2'b00,
             SETUP       = 2'b01,
             WAIT_ACCESS = 2'b10;
 
 
   reg [1:0] visual_Start_current, visual_Start_next;
 
   reg              visual_pready_next;
   reg              visual_apb_we_next;
   reg              visual_apb_re_next;
   reg       [2:0]  visual_wait_cnt_next;
 
   // AS: added sync registers
   // PCLK
   reg [15:0]       paddr_p;
   reg [7:0]        pwdata_p;
   reg              apb_we_p;
   reg              apb_re_p;
   reg [6:0]        read_access_p;

   // SCLK phase 0
   reg [15:0]       paddr_s0;
   reg [7:0]        pwdata_s0;
   reg              apb_we_s0;
   reg              apb_re_s0;
   reg [6:0]        read_access_s0;
   // SCLK phase 1
   reg [15:0]       paddr_s1;
   reg [7:0]        pwdata_s1;
   reg              apb_we_s1;
   reg              apb_re_s1;
   reg [6:0]        read_access_s1;
 
 
   // Combinational process
   always  @(apb_we or apb_re or wait_cnt or psel or penable or apb_addr or pwrite or visual_Start_current)
   begin : Start_comb
      visual_pready_next <= 0;
      visual_apb_we_next <= apb_we;
      visual_apb_re_next <= apb_re;
      visual_wait_cnt_next <= wait_cnt;
 
 
 
      case (visual_Start_current)
         FINISH:
            begin
               visual_Start_next <= SETUP;
            end
 
         SETUP:
            begin
               visual_wait_cnt_next <= 0;
               visual_apb_we_next <= 0;
               visual_apb_re_next <= 0;
               if (psel == 1 && penable == 1)
               begin
                  if (apb_addr[15:12] == 0)
                  begin
                     if (pwrite == 1)
                     begin
                        visual_apb_we_next <= 1;
                        visual_apb_re_next <= 0;
                        visual_Start_next <= WAIT_ACCESS;
                     end
                     else
                     begin
                        visual_apb_we_next <= 0;
                        visual_apb_re_next <= 1;
                        visual_Start_next <= WAIT_ACCESS;
                     end
                  end
                  else
                  begin
                     visual_Start_next <= WAIT_ACCESS;
                  end
               end
               else
               begin
                  visual_Start_next <= SETUP;
               end
            end
 
         WAIT_ACCESS:
            begin
               visual_apb_we_next <= 0;
               visual_apb_re_next <= 0;
               if (wait_cnt == N_WAIT_STATES - 1)
               begin
                  visual_wait_cnt_next <= 0;
                  visual_pready_next <= 1;
                  visual_Start_next <= FINISH;
               end
               else
               begin
                  visual_wait_cnt_next <= wait_cnt + 1;
                  visual_Start_next <= WAIT_ACCESS;
               end
            end
 
         default:
            begin
               visual_Start_next <= SETUP;
            end
      endcase
   end

   // AS: register with pclk before double-registering
   //     with SCLK (below)
   //always  @(posedge SCLK or negedge reset_n)
   always  @(posedge pclk or negedge reset_n)
   begin : Start
 
      if (~(reset_n))
      begin
         pready <= 0;
         visual_Start_current <= SETUP;
      end
      else
      begin
         pready <= visual_pready_next;
         apb_we_p <= visual_apb_we_next;
         apb_re_p <= visual_apb_re_next;
         wait_cnt <= visual_wait_cnt_next;
         visual_Start_current <= visual_Start_next;
      end
   end
 
 // ----------------------------------------------
 // AS: added
 // sync logic (single PCLK register, double SCLK)
 // ----------------------------------------------
 // pclk
always @ (posedge pclk or negedge reset_n)
begin : pclk_control_phase_0
  if (!reset_n)
  begin
    paddr_p <= 0;
    pwdata_p <= 0;
  end
  else
  begin
    paddr_p <= paddr;
    pwdata_p <= pwdata;
  end
end

// sclk
always @ (posedge SCLK or negedge reset_n)
begin : sclk_control_phase_1
  if (!reset_n)
  begin
    pwdata_s0 <= 0;
    paddr_s0 <= 0;
    pwdata_s1 <= 0;
    paddr_s1 <= 0;
    apb_we_s0 <= 0;
    apb_re_s0 <= 0;
    apb_we_s1 <= 0;
    apb_re_s1 <= 0;
    read_access_s0 <= 0;
    read_access_s1 <= 0;
  end
  else
  begin
    pwdata_s0 <= pwdata_p;
    paddr_s0 <= paddr_p;
    pwdata_s1 <= pwdata_s0;
    paddr_s1 <= paddr_s0;
    apb_we_s0 <= apb_we_p;
    apb_re_s0 <= apb_re_p;
    apb_we_s1 <= apb_we_s0;
    apb_re_s1 <= apb_re_s0;
    read_access_s0 <= read_access_p;
    read_access_s1 <= read_access_s0;
  end
end
 
 
 // AS: run the state machine on the PCLK
 // then re-register all the APB control using SCLK
 // for further access 
   // always @( posedge SCLK or negedge reset_n )
   always @( posedge pclk or negedge reset_n )
   begin   :Start1
 
      if (reset_n == 0)
      begin
         prdata <= 0;
         read_access <= 0;
      end
      else
      begin
         if (apb_addr[15:13] == 0)
         begin
            case (apb_addr[12:10])
 
               3'b000 :
                  begin
                     prdata <= rdlvl_rddata;
                     read_access <= 7'b0000001;
                  end
 
               3'b001 :
                  begin
                     prdata <= wrlvl_rddata;
                     read_access <= 7'b0000010;
                  end
 
               3'b010 :
                  begin
                     prdata <= vref_rddata;
                     read_access <= 7'b0000100;
                  end
 
               3'b011 :
                  begin
                     prdata <= debug_rddata;
                     read_access <= 7'b0001000;
                  end
                  
                // AS: added additional read registers
                3'b100:
                  begin
                    prdata <= wrcal_rddata;
                    read_access <= 7'b0010000;
                  end
 
                3'b101:
                  begin
                    prdata <= bclk_rddata;
                    read_access <= 7'b0100000;
                  end
 
                3'b110:
                  begin
                    prdata <= addcmd_rddata;
                    read_access <= 7'b1000000;
                  end
 
               default  :
                  begin
                     prdata <= debug_rddata;
                     read_access <= 7'b0001000;
                  end
            endcase
         end
         else
         begin
            prdata <= 0;
            read_access <= 0;
         end
      end
   end
   
  // AS: use synched data instead
  //assign apb_wrdata = pwdata;
  //assign apb_addr = paddr;
  assign apb_wrdata = pwdata_s1;
  assign apb_addr = paddr_s1;
  
  assign apb_we = apb_we_s1;
  assign apb_re = apb_re_s1;
 
endmodule

