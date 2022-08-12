
/// Header_Start --->>>
//---------------------------------------------------------
// COPYRIGHT CreVinn Teoranta 2015  
// CreVinn CONFIDENTIAL AND PROPRIETARY   
// Project Name: ms_tip
//---------------------------------------------------------
// $Author: gianl $
// $Data$
// $Log: LANE_CTRL.v $
//
//
//---------------------------------------------------------


/// Header_End <<<---


/// I/O_Start --->>>

// - read_FIFO_en = 1 when entries_in_FIFO > 0
// - generate dfi_rddata_valid to NWL while entries in FIFO are non-zero.

module LANE_CTRL( SCLK,
                  reset_n,
                  dfi_rddata_valid,
                  entries_in_FIFO_N,
                  read_FIFO_en );

//parameter IOG_DQS_LANES = `IOG_DQS_LANES_DEF; // Number of lanes
parameter IOG_DQS_LANES = 2; // Number of lanes

parameter MIN_ENTRIES_IN_FIFO = 1;

input          SCLK;
input          reset_n;

// Port: Port_1

output         dfi_rddata_valid;

// Port: Port_2

input [IOG_DQS_LANES-1:0] entries_in_FIFO_N;//EON..bit per lane, each bit indicates at least one entry in per lane fifo
output         read_FIFO_en;

/// I/O_End <<<---

reg dfi_rddata_valid;
//wire [IOG_DQS_LANES-1:0] enough_entries_in_fifo_N;
wire read_FIFO_en;

assign read_FIFO_en = &(entries_in_FIFO_N); //ie all bits in enough_entries_in_lane_N are non zero -> enough entries in each fifo

always @(posedge SCLK or negedge reset_n)
begin
	if(~reset_n)
	begin
		dfi_rddata_valid <= 0;
	end
	else
	begin
		// Assert valid one clock tick after the read_FIFO_en
		if(read_FIFO_en)
		begin
			dfi_rddata_valid <= 1;
		end
		else
		begin
			dfi_rddata_valid <= 0;
		end
	end
end
endmodule

