
/// Header_Start --->>>



/// Header_End <<<---


/// I/O_Start --->>>

// MUX write/read levelling IOG output signals
// AS: modified port dfi_wrlvl_en to wr_select

module IOG_IF( SCLK,
               reset_n,
               apb_addr,
               apb_we,
               apb_wrdata,
               debug_rddata,
               wr_select,
               wr_direction,
               wr_load,
               wr_move,
               rd_direction,
               rd_load,
               rd_move,
               direction,
               load,
               move,
               dfi_training_complete,
               rx_out_of_range,
			   trn_delay_line_sel,
			   delay_line_sel_rd,
			   apb_ctrl_chip_sel,			   
			   apb_iog_on,
			   apb_block_fifo,
			   apb_pause,
         apb_ctrl_dqsw_sel
);

parameter     IOG_DQS_LANES = 9;
parameter     IOG_DQS_LANES_9 = IOG_DQS_LANES*9; // Derived parameter from IOG_DQS_LANES

// Port globals
input SCLK;
input reset_n;



// Port: WRLVL

input          wr_select;   // Write level enable. Signal used for write levelling. Comes from the NWL controller
input [IOG_DQS_LANES-1:0]   wr_direction;   // To be used by a renaming module to assign the to the LANEx_IOGy_IOG direction signals
input [IOG_DQS_LANES-1:0]   wr_load;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG load signals
input [IOG_DQS_LANES-1:0]   wr_move;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG move signals

// Port: RDLVL

input [(IOG_DQS_LANES_9)-1:0]   rd_direction;   // To be used by a renaming module to assign the to the LANEx_IOGy_IOG direction signals 
input [(IOG_DQS_LANES_9)-1:0]   rd_load;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG load signals
input [(IOG_DQS_LANES_9)-1:0]   rd_move;        // To be used by a renaming module to assign the to the LANEx_IOGy_IOG move signals

// Port: PHY

output [(IOG_DQS_LANES_9)-1:0]  direction;      // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_DIRECTION signals
output [(IOG_DQS_LANES_9)-1:0]  load;           // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_LOAD signals
output [(IOG_DQS_LANES_9)-1:0]  move;           // To be used by a renaming module to assign the to the LANEx_IOGy_IOG_DELAY_LINE_MOVE signals
output [7:0]   debug_rddata;
input  [(IOG_DQS_LANES_9)-1:0]  rx_out_of_range;       

// Port TRN_COMPLETE
input          dfi_training_complete;

// Port debug

wire  [8:0] direction_out;
wire  [8:0] move_out;
wire  [8:0] load_out;
wire  [3:0] iog_lane_sel;


// Port APB
input [15:0]  apb_addr;
input         apb_we;
input [7:0]   apb_wrdata;

// apb_aux wire for writes
wire          apb_we_aux;

output [IOG_DQS_LANES-1:0] delay_line_sel_rd;
reg [IOG_DQS_LANES-1:0] delay_line_sel_rd;
input [IOG_DQS_LANES-1:0] trn_delay_line_sel;
wire  apb_ctrl_delay_line_sel;

//SMG - 31/03/16
output [IOG_DQS_LANES-1:0]     apb_block_fifo;
output [IOG_DQS_LANES-1:0]     apb_pause;

output                         apb_ctrl_dqsw_sel;

assign apb_we_aux = (apb_addr[11:10] == 2'b11)? apb_we:1'b0;
/// I/O_End <<<---


// Simple MUX - GIAN
// Load, Direction, and move MUX
// AS: reversed

parameter RDLVL = 1'b0;
parameter WRLVL = 1'b1;

wire [80:0] wr_direction_internal;
wire [80:0] wr_move_internal;
wire [80:0] wr_load_internal;

wire [9:0]  wr_direction_pad;
wire [9:0]  wr_move_pad;
wire [9:0]  wr_load_pad;

wire [(9-IOG_DQS_LANES):0] blanks;

wire    apb_block_fifo_pre;
wire    apb_pause_pre;

assign blanks = 'b0;
assign wr_direction_pad = {blanks, wr_direction}; // Takes a signal with length that varies with the number of lanes and pads accordingly.
assign wr_load_pad = {blanks, wr_load};
assign wr_move_pad = {blanks, wr_move};

// AS: reversed LSB-->MSB (as per MA)
assign wr_direction_internal = {wr_direction_pad[8],8'b0,wr_direction_pad[7],8'b0,wr_direction_pad[6],8'b0,wr_direction_pad[5],8'b0,wr_direction_pad[4],8'b0,wr_direction_pad[3],8'b0,wr_direction_pad[2],8'b0,wr_direction_pad[1],8'b0,wr_direction_pad[0],8'b0};
assign wr_load_internal = {wr_load_pad[8],8'b0,wr_load_pad[7],8'b0,wr_load_pad[6],8'b0,wr_load_pad[5],8'b0,wr_load_pad[4],8'b0,wr_load_pad[3],8'b0,wr_load_pad[2],8'b0,wr_load_pad[1],8'b0,wr_load_pad[0],8'b0};
assign wr_move_internal = {wr_move_pad[8],8'b0,wr_move_pad[7],8'b0,wr_move_pad[6],8'b0,wr_move_pad[5],8'b0,wr_move_pad[4],8'b0,wr_move_pad[3],8'b0,wr_move_pad[2],8'b0,wr_move_pad[1],8'b0,wr_move_pad[0],8'b0};

wire [(IOG_DQS_LANES_9)-1:0]  direction;
wire [(IOG_DQS_LANES_9)-1:0]  load;
wire [(IOG_DQS_LANES_9)-1:0]  move;

reg [80:0]  out_of_range_reg;
reg [80:0]  out_of_range_reg_next;

//SMG - variables to help speed up timing 151116
reg [80:0]  direction_int;
reg [80:0]  load_int;
reg [80:0]  move_int;
reg [80:0]  apb_pause_int;
reg [80:0]  apb_block_fifo_int;


assign direction = direction_int;
assign load = load_int;
assign move = move_int;
//SMG - only allow these signals to have effect if training is finished
assign apb_pause = apb_pause_int;
assign apb_block_fifo = apb_block_fifo_int;



// wire [80:0]  direction_aux;
// wire [80:0]  load_aux;
// wire [80:0]  move_aux;


// assign direction_aux = {72'b0,direction_out};
// assign move_aux = {72'b0,move_out};
// assign load_aux = {72'b0,load_out};

// Out of range MUX
reg  [8:0]  out_of_range_in;
wire [8:0]  out_of_range_0;
wire [8:0]  out_of_range_1;
wire [8:0]  out_of_range_2;
wire [8:0]  out_of_range_3;
wire [8:0]  out_of_range_4;
wire [8:0]  out_of_range_5;
wire [8:0]  out_of_range_6;
wire [8:0]  out_of_range_7;
wire [8:0]  out_of_range_8;

assign out_of_range_0 = out_of_range_reg[8:0];
assign out_of_range_1 = out_of_range_reg[17:9];
assign out_of_range_2 = out_of_range_reg[26:18];
assign out_of_range_3 = out_of_range_reg[35:27];
assign out_of_range_4 = out_of_range_reg[44:36];
assign out_of_range_5 = out_of_range_reg[53:45];
assign out_of_range_6 = out_of_range_reg[62:54];
assign out_of_range_7 = out_of_range_reg[71:63];
assign out_of_range_8 = out_of_range_reg[80:72];


output apb_ctrl_chip_sel;
output apb_iog_on;

always @(rx_out_of_range) begin
    out_of_range_reg_next <= rx_out_of_range;
end

always @(posedge SCLK or negedge reset_n) begin
  if(!reset_n) 
    out_of_range_reg <= 81'b0;
  else 
    out_of_range_reg <= out_of_range_reg_next;
end

always @(posedge SCLK or negedge reset_n)
begin : MUX
	if(reset_n == 1'b0)
	begin
		out_of_range_in <= 9'h0;
		direction_int <= 0;
		load_int <= 0;
		move_int <= 0;
		delay_line_sel_rd <= 0;
    apb_pause_int <= 0;
    apb_block_fifo_int <= 0;
	end
	else if(~dfi_training_complete) 
	begin
		out_of_range_in <= 0;
		delay_line_sel_rd <= trn_delay_line_sel;
    apb_pause_int <= 0;
    apb_block_fifo_int <= 0;
		case(wr_select) 
			WRLVL: 
			begin
				direction_int <= wr_direction_internal;
				load_int <= wr_load_internal;
				move_int <= wr_move_internal;
			end
			RDLVL: 
			begin
				direction_int <= rd_direction;
				load_int <= rd_load;
				move_int <= rd_move;
			end
			default : 
			begin
				direction_int <= 1'b0;
				load_int <= 1'b0;
				move_int <= 1'b0;
			end  
		endcase
	end 
	else 
	begin		
		// direction_int <= (direction_out << (iog_lane_sel*9));
		// move_int <= (move_out << (iog_lane_sel*9));
		// load_int <= (load_out << (iog_lane_sel*9));	
		delay_line_sel_rd <= (apb_ctrl_delay_line_sel << iog_lane_sel);
    
    direction_int <= 0;
    move_int <= 0;
    load_int <= 0;
    apb_pause_int <= 0;
    apb_block_fifo_int <= 0;
		case(iog_lane_sel)
			0:  begin   
            out_of_range_in <= out_of_range_0; 
            direction_int[8:0] <= direction_out;
            move_int[8:0] <= move_out;
            load_int[8:0] <= load_out; 
            apb_pause_int[8:0] <= {9{apb_pause_pre}};
            apb_block_fifo_int[8:0] <= apb_block_fifo;            
          end           
			1:  begin   
            out_of_range_in <= out_of_range_1; 
            direction_int[17:9] <= direction_out;
            move_int[17:9] <= move_out;
            load_int[17:9] <= load_out;  
            apb_pause_int[17:9] <= apb_pause;
            apb_pause_int[8:0] <= {9{apb_pause_pre}};
            apb_block_fifo_int[17:9] <= apb_block_fifo; 
          end
      2:  begin   
            out_of_range_in <= out_of_range_2; 
            direction_int[26:18] <= direction_out;
            move_int[26:18] <= move_out;
            load_int[26:18] <= load_out; 
            apb_pause_int[26:18] <= apb_pause;
            apb_pause_int[8:0] <= {9{apb_pause_pre}};
            apb_block_fifo_int[26:18] <= apb_block_fifo;             
          end
      3:  begin   
            out_of_range_in <= out_of_range_3; 
            direction_int[35:27] <= direction_out;
            move_int[35:27] <= move_out;
            load_int[35:27] <= load_out; 
            apb_pause_int[35:27] <= apb_pause;
            apb_pause_int[8:0] <= {9{apb_pause_pre}};
            apb_block_fifo_int[35:27] <= apb_block_fifo; 
          end
      4:  begin   
            out_of_range_in <= out_of_range_4; 
            direction_int[44:36] <= direction_out;
            move_int[44:36] <= move_out;
            load_int[44:36] <= load_out;
            apb_pause_int[44:36] <= apb_pause;
            apb_pause_int[8:0] <= {9{apb_pause_pre}};
            apb_block_fifo_int[44:36] <= apb_block_fifo; 
          end
      5:  begin   
            out_of_range_in <= out_of_range_5; 
            direction_int[53:45] <= direction_out;
            move_int[53:45] <= move_out;
            load_int[53:45] <= load_out; 
            apb_pause_int[53:45] <= apb_pause;
            apb_pause_int[8:0] <= {9{apb_pause_pre}};
            apb_block_fifo_int[53:45] <= apb_block_fifo; 
          end
      6:  begin   
            out_of_range_in <= out_of_range_6; 
            direction_int[62:54] <= direction_out;
            move_int[62:54] <= move_out;
            load_int[62:54] <= load_out; 
            apb_pause_int[8:0] <= {9{apb_pause_pre}};
            apb_pause_int[62:54] <= apb_pause;
            apb_block_fifo_int[62:54] <= apb_block_fifo; 
          end
      7:  begin   
            out_of_range_in <= out_of_range_7; 
            direction_int[71:63] <= direction_out;
            move_int[71:63] <= move_out;
            load_int[71:63] <= load_out;
            apb_pause_int[8:0] <= {9{apb_pause_pre}};
            apb_pause_int[71:63] <= apb_pause;
            apb_block_fifo_int[71:63] <= apb_block_fifo; 
          end
      8:  begin   
            out_of_range_in <= out_of_range_8; 
            direction_int[80:72] <= direction_out;
            move_int[80:72] <= move_out;
            load_int[80:72] <= load_out;
            apb_pause_int[8:0] <= {9{apb_pause_pre}};
            apb_pause_int[80:72] <= apb_pause;
            apb_block_fifo_int[80:72] <= apb_block_fifo; 
          end
			default:  
          begin  
            out_of_range_in <= 0;  
            direction_int <= 0;
            move_int <= 0;
            load_int <= 0;
            apb_pause_int <= 0;
            apb_block_fifo_int <= 0;
          end                 
		endcase
	end
end

APB_IOG_CTRL_SM APB_IOG_CTRL_SM (
    //  input ports
    .SCLK(SCLK),
    .reset_n(reset_n),
    .out_of_range(out_of_range_in),
    .apb_addr(apb_addr),
    .apb_we(apb_we_aux),
    .apb_data_in(apb_wrdata),
    .dfi_training_complete(dfi_training_complete),

    //  output ports
    .move_out(move_out),
    .direction_out(direction_out),
    .load_out(load_out),
    .apb_data_out(debug_rddata),
    .iog_lane_sel(iog_lane_sel),
    .apb_iog_on(apb_iog_on),
    .apb_ctrl_delay_line_sel(apb_ctrl_delay_line_sel),
    .apb_ctrl_chip_sel(apb_ctrl_chip_sel),
    .apb_block_fifo(apb_block_fifo_pre),
    .apb_pause(apb_pause_pre),
    .apb_ctrl_dqsw_sel(apb_ctrl_dqsw_sel)
    );

endmodule

