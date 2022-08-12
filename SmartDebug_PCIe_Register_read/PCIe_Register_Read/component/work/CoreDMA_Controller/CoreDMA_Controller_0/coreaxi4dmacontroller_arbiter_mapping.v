
////////////////////////////////////////////////////////////////////////////////
// Wire declarations
////////////////////////////////////////////////////////////////////////////////

// Priority 0 wires
wire [3:0] reqPri0;
wire [1:0] intDscrptrNum_Pri0RRA;

// Priority 1 wires - Unused priority level. Only declaring wires to pass HDL check
wire reqPri1;
wire [1:0] intDscrptrNum_Pri1RRA;

// Priority 2 wires - Unused priority level. Only declaring wires to pass HDL check
wire reqPri2;
wire [1:0] intDscrptrNum_Pri2RRA;

// Priority 3 wires - Unused priority level. Only declaring wires to pass HDL check
wire reqPri3;
wire [1:0] intDscrptrNum_Pri3RRA;

// Priority 4 wires - Unused priority level. Only declaring wires to pass HDL check
wire reqPri4;
wire [1:0] intDscrptrNum_Pri4RRA;

// Priority 5 wires - Unused priority level. Only declaring wires to pass HDL check
wire reqPri5;
wire [1:0] intDscrptrNum_Pri5RRA;

// Priority 6 wires - Unused priority level. Only declaring wires to pass HDL check
wire reqPri6;
wire [1:0] intDscrptrNum_Pri6RRA;

// Priority 7 wires - Unused priority level. Only declaring wires to pass HDL check
wire reqPri7;
wire [1:0] intDscrptrNum_Pri7RRA;

// Fixed priority arbiter wires
wire reqFPA;

////////////////////////////////////////////////////////////////////////////////
// Wire mapping
////////////////////////////////////////////////////////////////////////////////

// Priority 0 mapping
assign reqPri0[0] = reqValid[0] & !waitDscrptr[0];
assign reqPri0[1] = reqValid[1] & !waitDscrptr[1];
assign reqPri0[2] = reqValid[2] & !waitDscrptr[2];
assign reqPri0[3] = reqValid[3] & !waitDscrptr[3];

////////////////////////////////////////////////////////////////////////////////
// Round robin arbiter grant decoding
////////////////////////////////////////////////////////////////////////////////
// Priority 0 grant decoding
assign reqFPA = |grant_Pri0RRA[3:0];
assign intDscrptrNum_Pri0RRA[1:0] = 
                                (grant_Pri0RRA[3:0] == 4'd1) ? 2'd0 :
                                (grant_Pri0RRA[3:0] == 4'd2) ? 2'd1 :
                                (grant_Pri0RRA[3:0] == 4'd4) ? 2'd2 :
                                (grant_Pri0RRA[3:0] == 4'd8) ? 2'd3 :
                                2'd0;
