//--------------------------------------------------
//-- -----------------------------------------------------------------------------                                                                                                                                                                   
//--    Crevinn Teoranta                                                                                                                                                            
//-- -----------------------------------------------------------------------------                                                                                                                                                                   
//-- Author      : $Author:      darrenc                                                                                                                          
//-- Date        : $Date: 2010-04-29 14:34:52 $                                                                                                                                                                   
//-- Revision    : $Revision: 1.11 $                                                                                                                                                                   
//-- Location    : $URL: $                                                                                                                                                                   
//-- -----------------------------------------------------------------------------                                                                                                                                                                   
//--------------------------------------------------
 
 
module FIFO_BLK (
                         //  input ports
                         iog_rddata,
                         iog_rddata_valid,
                         read_FIFO_en,
                         SCLK,
                         reset_n,
 
                         //  output ports
                         dfi_rddata,
                         entries_in_FIFO
                         );
 
//   parameter        FIF_DEPTH         = `FIF_DEPTH_DEF;
   parameter        FIF_DEPTH         = 3;
   parameter FIF_ADDR_WIDTH = $clog2(FIF_DEPTH);
   
   
//  input ports
   input     [63:0] iog_rddata;
   wire      [63:0] iog_rddata;
   input            iog_rddata_valid;
   wire             iog_rddata_valid;
   input            read_FIFO_en;
   wire             read_FIFO_en;
   input            SCLK;
   wire             SCLK;
   input            reset_n;
   wire             reset_n;
//  output ports
   output    [63:0] dfi_rddata;
   wire      [63:0] dfi_rddata;
   output    entries_in_FIFO;//EON
   wire      entries_in_FIFO;//EON
//  local signals
   reg             empty;//EON..changed from wire
   reg             full; //EON..changed from wire
   reg       [FIF_ADDR_WIDTH-1:0] wrptr;
   wire      [FIF_ADDR_WIDTH-1:0] wrptr_nxt;//EON... 
   reg       [FIF_ADDR_WIDTH-1:0] rdptr;
   wire      [FIF_ADDR_WIDTH-1:0] rdptr_nxt;//EON
   wire      [FIF_ADDR_WIDTH-1:0] fifotop;//EON
 
 
 // instantiate RAM 
      ram_simple_dp # (
     .FIF_DEPTH(FIF_DEPTH)
   ) ram_simple_dp (
                        .SCLK       (SCLK),             // clock input
                        .address_0  (wrptr),            // write address
                        .data_0     (iog_rddata),       // input data
                        .we_0       (iog_rddata_valid), // input write enable
                        .address_1  (rdptr),            // read address
                        .data_1     (dfi_rddata)       // output data
			);
 
 
   always
      @( posedge SCLK or negedge reset_n )
   begin   :write
 
      if (reset_n == 1'b0)
      begin
         wrptr <= 'h0;
      end
      else
      begin
         if ((iog_rddata_valid == 1'b1) && (full == 1'b0))
         begin
            wrptr <= wrptr_nxt;//EON
         end
      end
   end
 
   always
      @( posedge SCLK or negedge reset_n )
   begin   :empty_ff
 
      if (reset_n == 1'b0)
      begin
         empty <= 'h1;
      end
      else
      begin
         if (((rdptr_nxt == wrptr) && (read_FIFO_en == 1'b1) && (iog_rddata_valid == 1'b0))||((empty == 1'b1) && (iog_rddata_valid == 1'b0)))
         begin
            empty <= 1'b1;
         end
         else
         begin
            empty<=0;
         end   
      end
   end
 
   always
      @( posedge SCLK or negedge reset_n )
   begin   :read
 
      if (reset_n == 1'b0)
      begin
         rdptr <= 'h0;
      end
      else
      begin
         if ((read_FIFO_en == 1'b1) && (empty == 1'b0))
         begin
            rdptr <= rdptr_nxt;//EON
         end
      end
   end


   always
      @( posedge SCLK or negedge reset_n )
   begin   :full_ff
 
      if (reset_n == 1'b0)
      begin
         full <= 'h0;
      end
      else
      begin
         if (((wrptr_nxt == rdptr) && (iog_rddata_valid == 1'b1) && (read_FIFO_en==1'b0))||( (full == 1'b1) &&(read_FIFO_en == 1'b0) ))
         begin
            full <= 1'b1;
         end
         else
         begin
            full<=0;
         end   
      end
   end   
   assign fifotop = (FIF_DEPTH ) -1; //EON...eg FIF_DEPTH =4 entries, rollover =3..ie 0-3 are valid entries in fifo
   assign wrptr_nxt = (wrptr == fifotop) ? 0 : wrptr + 1;//EON.. must detect rollover as fifo_depth does not need to be 2**n
   assign rdptr_nxt = (rdptr == fifotop) ? 0 : rdptr + 1;//EON.. must detect rollover as fifo_depth does not need to be 2**n
   assign entries_in_FIFO = (empty ==1'b0);//EON..

endmodule

