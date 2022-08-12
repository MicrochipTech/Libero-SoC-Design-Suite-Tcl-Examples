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


module ram_simple_dp (
                     SCLK,       // system clock
                     address_0,  // write address
                     data_0,     // input data
                     we_0,       // input write enable
                     address_1,  // read address
                     data_1     // output data
                     ); 
		     

//parameter FIF_DEPTH         = `FIF_DEPTH_DEF;
//parameter DATA_WIDTH         = `FIFO_DATA_WIDTH_DEF;
parameter FIF_DEPTH         = 3;
parameter DATA_WIDTH         = 64;
parameter FIF_ADDR_WIDTH = $clog2(FIF_DEPTH);

localparam FIFOTOP = (FIF_DEPTH) - 1;

//  input ports
input SCLK;
input [FIF_ADDR_WIDTH-1 : 0] address_0; 
input we_0 ;
input [FIF_ADDR_WIDTH-1 : 0] address_1; 
input [(DATA_WIDTH - 1) : 0] data_0;

//  output ports 
output [(DATA_WIDTH - 1) : 0] data_1; 
reg [(DATA_WIDTH - 1) : 0] data_1;

//  local signals
reg [(DATA_WIDTH - 1) : 0] mem [0 : (FIFOTOP)];


// First Port of RAM
// Memory Write Block 
always @ (posedge SCLK)
begin : write_mem
  if ( we_0 ) begin
     mem[address_0] <= data_0;
  end
end


// Second Port of RAM
// Memory Read Block
always @ (posedge SCLK)
begin : read_mem
    data_1 <= mem[address_1]; 
end

endmodule // End of ram_simple_dp
