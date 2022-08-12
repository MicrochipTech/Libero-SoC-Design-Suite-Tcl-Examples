
////////////////////////////////////////////////////////////////////////////////
// Wire declarations
////////////////////////////////////////////////////////////////////////////////
wire intValidQueue0;
wire intValidQueue1;
wire intValidQueue2;
wire intValidQueue3;

////////////////////////////////////////////////////////////////////////////////
// Wire mapping
////////////////////////////////////////////////////////////////////////////////

// Interrupt 0 mapping
assign intValidQueue0 =
                        (intDscrptrNum == 5'd0) ? valid :
                        (intDscrptrNum == 5'd2) ? valid :
                        (intDscrptrNum == 5'd3) ? valid :
                        1'b0;

// Interrupt 1 mapping
assign intValidQueue1 =
                        (intDscrptrNum == 5'd1) ? valid :
                        1'b0;

// Interrupt 2 mapping
assign intValidQueue2 = 1'b0;

// Interrupt 3 mapping
assign intValidQueue3 = 1'b0;

// Map the FIFO full signals to the related descriptors to prevent further
// operations of these descriptors taking place until there's space in the
// interrupt queue
assign waitDscrptr[0] = fifoFullQueue0;
assign waitDscrptr[1] = fifoFullQueue1;
assign waitDscrptr[2] = fifoFullQueue0;
assign waitDscrptr[3] = fifoFullQueue0;
