///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: IOD_MIPI_TRAINING.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF300TS_ES> <Package::FCG1152>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module IOD_MIPI_TRAINING (
  input SCLK,
  input RESETN,
  input RESTART_TRNG,
  input LP_IN,
  input IOD_EARLY,
  input IOD_LATE,
  input IOD_OOR,
  input SKIP_TRNG,
  output BIT_ALGN_LOAD,
  output BIT_ALGN_MOVE,
  output BIT_ALGN_DIR,
  output BIT_ALGN_CLR_FLG,
  output BIT_TRNG_DONE,
  output BIT_TRNG_FAIL,
  ///Debug ports
  output reg [6:0] WINDOW_START_INDEX,
  output reg [6:0] WINDOW_END_INDEX,
  output reg [6:0] WINDOW_SET_INDEX);

CoreRxIODBitAlign_top 
 U_CoreRxIODBitAlign_top (
                               // Clocks and clock control signals
                               .SCLK					(SCLK				),
			       .RESETN					(RESETN				),	
                               .PLL_LOCK				(1'b1				),
                               .LP_IN					(LP_IN				),
                                                                                                         
                  	       // IOD Controller IN signals                  
                  	       .IOD_EARLY				(IOD_EARLY			),
			       .IOD_LATE				(IOD_LATE			),
		  	       .IOD_OOR					(IOD_OOR			),
                                                                                                         
		  	       // BIT Align status IN and OUT signals   
		  	       .BIT_ALGN_START				(				),
		  	       .BIT_ALGN_DONE				(BIT_TRNG_DONE			),
		  	       .BIT_ALGN_ERR				(BIT_TRNG_FAIL			),
		  	       .BIT_ALGN_OOR				(				),
		  	       .BIT_ALGN_RSTRT				(RESTART_TRNG			),
		  	       .BIT_ALGN_HOLD				(1'b0				),
		  	       .BIT_ALGN_SKIP				(SKIP_TRNG			),
                  	       .BIT_ALGN_EYE_IN				(3'b001				),
                                                                                                         
		               // IOD Controller OUT signals                
                  	       .BIT_ALGN_CLR_FLGS			(BIT_ALGN_CLR_FLG		),
                  	       .BIT_ALGN_LOAD				(BIT_ALGN_LOAD			),
                  	       .BIT_ALGN_DIR				(BIT_ALGN_DIR			),
                  	       .BIT_ALGN_MOVE				(BIT_ALGN_MOVE			)
                               );

/*
//Parameter Declarations
//parameter [2:0] EYE_WIDTH = 3'b110;
parameter rst_cnt_width = 10;
parameter MIN_WINDOW_VALUE = 10;
parameter LP_PULSE_WD = 16;
 
//State Definitions
localparam LOAD_STATE = 0;
localparam MV_STATE = 1;
localparam MV_STATE1 = 2;
localparam CLR_STATE = 3;
localparam CALC_STATE1 = 4;
localparam CALC_STATE2 = 5;
localparam COMP_STATE = 6;
localparam LOAD_STATE1 = 7;
localparam LOAD_STATE2 = 8;
localparam CALC_STATE3 = 9;
localparam COMP_STATE1 = 10;
localparam LP_WAIT = 11;
localparam OPT_WIN_SEL = 12;
localparam OPT_WIN_SEL1 = 13;

//Register declarations
reg [1:0] cnt;
reg bit_move;
reg bit_dir;
reg bit_load;
reg bit_clr_fg;
reg [3:0] TRNG_STATE;
reg [6:0] tap_cnt;

reg [127:0] early_fg;
reg [127:0] late_fg;
reg [6:0] fg_index;

reg [6:0] min_window;
reg [6:0] vld_window1;
reg [6:0] vld_window2;

reg [(rst_cnt_width-1):0] rst_cnt;
reg reset_dly_fg;

reg ld_fg;
reg trng_done;

reg [3:0] LP_IN_reg;
reg [3:0] LP_edge_reg;
wire LP_edge_det;
wire LP_start;

reg [2:0] skip_trng_reg;

wire Restart_trng_edge_det;
reg [2:0] restart_reg;
reg [3:0] restart_edge_reg;
wire restart_trng_fg;

wire mipi_re_train;
reg[2:0] retrain_reg;
reg [(LP_PULSE_WD - 1):0] LP_Clear_pulse;
wire clr_lp_pulse;

reg [1:0] window_cnt;
reg [6:0] vld_win1_start;
reg [6:0] vld_win1_end;

reg [6:0] vld_win2_start;
reg [6:0] vld_win2_end;

reg [6:0] vld_win3_start;
reg [6:0] vld_win3_end;

reg [6:0] win1_size;
reg [6:0] win2_size;
reg [6:0] win3_size;

reg win1_fg;
reg win2_fg;
reg win3_fg;

wire max_tap_index;
reg [7:0] final_tap_index;

reg retrain_flag;
reg mv_dn_fg;
reg mv_up_fg;
wire timeout_fg;
wire start_trng_fg;

reg [9:0] timeout_cnt;

//Assign Statements
assign BIT_ALGN_LOAD = bit_load;
assign BIT_ALGN_MOVE = bit_move;
assign BIT_ALGN_DIR = bit_dir;
assign BIT_ALGN_CLR_FLG = (!trng_done)? bit_clr_fg: clr_lp_pulse;
assign BIT_TRNG_DONE = (skip_trng_reg[2])?1'b1:trng_done;

assign mipi_re_train = (trng_done&(IOD_EARLY|IOD_LATE)&(!LP_IN))?1'b1:1'b0;

assign max_tap_index = &fg_index[6:0];

assign retrain_adj_tap = !(mv_up_fg & mv_dn_fg);
assign timeout_fg = &timeout_cnt;
assign start_trng_fg = ((!trng_done) & reset_dly_fg & LP_start & (!skip_trng_reg[2]) & (!timeout_fg));

assign BIT_TRNG_FAIL = timeout_fg;
//Assign Debug port outputs
always@(posedge SCLK or negedge RESETN)
begin
  if(!RESETN)begin
    WINDOW_START_INDEX <= 0;
    WINDOW_END_INDEX <= 0;
    WINDOW_SET_INDEX <= 0;
  end else begin
    if(trng_done)begin
      WINDOW_SET_INDEX <= final_tap_index;
      if(win1_fg)begin
        WINDOW_START_INDEX <= vld_win1_start;
        WINDOW_END_INDEX <= vld_win1_end;
      end else if(win2_fg)begin
        WINDOW_START_INDEX <= vld_win2_start;
        WINDOW_END_INDEX <= vld_win2_end;
      end else if(win3_fg)begin
        WINDOW_START_INDEX <= vld_win3_start;
        WINDOW_END_INDEX <= vld_win3_end;
      end else begin
        WINDOW_START_INDEX <= 0;
        WINDOW_END_INDEX <= 0;
      end
    end else begin
      WINDOW_SET_INDEX <= 0;
      WINDOW_START_INDEX <= 0;
      WINDOW_END_INDEX <= 0;
    end
  end
end

//stretch the LP_IN to clear the flags
always@(posedge SCLK or negedge RESETN)
begin
  if(!RESETN)begin
    LP_Clear_pulse <= 0;
  end else begin
    LP_Clear_pulse <= {LP_Clear_pulse[(LP_PULSE_WD - 2):0],LP_IN};
  end
end

assign clr_lp_pulse = |LP_Clear_pulse;

//Synchronise Re_train bit with SCLK
always@(posedge SCLK or negedge RESETN)
begin
  if(!RESETN)begin
    retrain_reg <= 3'b000;
  end else begin
    retrain_reg <= {retrain_reg[1:0],mipi_re_train};
  end
end


///LP Signal Negative edge detect Logic
always@(posedge SCLK or negedge RESETN)
begin
  if(!RESETN)begin
    LP_IN_reg <= 4'hF;
    LP_edge_reg <= 4'h0;
  end else begin
    if(reset_dly_fg)begin
      LP_IN_reg <= {LP_IN_reg[2:0],LP_IN};   
      LP_edge_reg <= {LP_edge_reg[2:0],LP_edge_det};
    end
  end
end


//Negative Edge det on LP signal
assign LP_edge_det = (LP_IN_reg[3] & !LP_IN_reg[2]);
assign LP_start = |LP_edge_reg; //Stretch the LP -ve edge pulse

//Synchronise RESTART_TRNG Signal with SCLK
always@(posedge SCLK or negedge RESETN)
begin
  if(!RESETN)begin
    restart_reg <= 3'b000;
    restart_edge_reg <= 4'b0000;
  end else begin
    restart_reg <= {restart_reg[1:0],RESTART_TRNG};
    restart_edge_reg <= {restart_edge_reg[2:0],Restart_trng_edge_det};     
  end
end
//positive Edge det on Restart training signal
assign Restart_trng_edge_det = (!restart_reg[2] & restart_reg[1]);
assign restart_trng_fg = |restart_edge_reg; //Stretch the Restart pulse

///Free running 2 bit counter
always@(posedge SCLK or negedge RESETN)
begin
  if(!RESETN)begin
    cnt <= 2'b00;
  end else begin
    cnt <= cnt + 2'b01;  
  end
end


//Reset Counter to add delay 
always@(posedge SCLK or negedge RESETN)
begin
  if(!RESETN)begin
    rst_cnt <= 0;
    reset_dly_fg <= 1'b0;
  end else begin
    if((!reset_dly_fg) & (&rst_cnt))
      reset_dly_fg <= 1'b1;
    rst_cnt <= rst_cnt + 1;
  end     
end

always@(posedge SCLK or negedge RESETN)
begin
  if(!RESETN)begin
    skip_trng_reg <= 0;
  end else begin
    skip_trng_reg <= {skip_trng_reg[1:0],SKIP_TRNG};
  end     
end

//State Machine to Window the Valid Sampling Window
always@(posedge SCLK or negedge RESETN)
begin
  if(!RESETN)begin
    bit_move <= 1'b0;
    bit_dir <= 1'b1;
    bit_load <= 1'b1;
    bit_clr_fg <= 1'b1;
    tap_cnt <= 7'd0;  
    early_fg <= 128'd0;
    late_fg <= 128'd0;
    fg_index <= 7'd0;
    final_tap_index <= 8'd0;
    min_window <= 7'd0; 
    vld_window1 <= 7'd0;
    vld_window2 <= 7'd0;
    window_cnt <=2'd0;
    vld_win1_start <= 7'd0;
    vld_win2_start <= 7'd0;
    vld_win3_start <= 7'd0;
    vld_win1_end <= 7'd0;
    vld_win2_end <= 7'd0;
    vld_win3_end <= 7'd0;
    ld_fg <= 1'b0;
    trng_done <= 1'b0;
    win1_size <= 7'd0;
    win2_size <= 7'd0;
    win3_size <= 7'd0;
    win1_fg <= 1'b0;
    win2_fg <= 1'b0;
    win3_fg <= 1'b0;
    retrain_flag <= 1'b0;
    mv_dn_fg <= 1'b0;
    mv_up_fg <= 1'b0;
    timeout_cnt <= 10'd0;
    TRNG_STATE <= LOAD_STATE;
  end else begin
    case (TRNG_STATE)
      LOAD_STATE:begin //start the state machine
        fg_index <= 7'd0;
        min_window <= 7'd0;
        window_cnt <=2'd0;
        bit_move <= 1'b0;
        if(start_trng_fg)begin
          final_tap_index <= 8'd0;
          tap_cnt <= 7'd0;
          vld_win1_start <= 7'd0;
          vld_win2_start <= 7'd0;
          vld_win3_start <= 7'd0;
          vld_win1_end <= 7'd0;
          vld_win2_end <= 7'd0;
          vld_win3_end <= 7'd0;
          win1_size <= 7'd0;
          win2_size <= 7'd0;
          win3_size <= 7'd0;
          win1_fg <= 1'b0;
          win2_fg <= 1'b0;
          win3_fg <= 1'b0;
          bit_dir <= 1'b1;
          retrain_flag <= 1'b0;
          mv_dn_fg <= 1'b0;
          mv_up_fg <= 1'b0;
          timeout_cnt <= 0;
          if(&cnt)begin
            bit_load <= 1'b0;
            bit_clr_fg <= 1'b0; 
            TRNG_STATE <= MV_STATE; 
          end else begin
            bit_load <= 1'b1;
            bit_clr_fg <= 1'b1;
            TRNG_STATE <= LOAD_STATE;
          end
        end else if(restart_trng_fg)begin
          fg_index <= 7'd0;         
          bit_load <= 1'b1;
          tap_cnt <= 7'd0;
          bit_dir <= 1'b1;
          mv_dn_fg <= 1'b0;
          mv_up_fg <= 1'b0;
          retrain_flag <= 1'b0;
          timeout_cnt <= 0;
          bit_clr_fg <= 1'b1; 
          trng_done <= 1'b0;
          TRNG_STATE <= LP_WAIT; 
        end else if((retrain_reg[2] & (!timeout_fg)))begin
          if(!mv_up_fg)begin  
            retrain_flag <= 1'b1;
            tap_cnt <= final_tap_index;
            bit_dir <= 1'b1;
            final_tap_index <= final_tap_index + 'd4;
            bit_load <= 1'b0;
            mv_up_fg <= 1'b1;
          end else if(!mv_dn_fg)begin
            retrain_flag <= 1'b1;
            tap_cnt <= final_tap_index;
            bit_dir <= 1'b0;
            final_tap_index <= final_tap_index - 'd8;
            bit_load <= 1'b0;
            mv_dn_fg <= 1'b1;
          end else begin
            bit_load <= 1'b1;
            tap_cnt <= 7'd0;
            retrain_flag <= 1'b0;
            bit_dir <= 1'b1;
            mv_dn_fg <= 1'b0;
            mv_up_fg <= 1'b0;
            timeout_cnt <= timeout_cnt + 1;
          end
          bit_clr_fg <= 1'b1; 
          bit_move <= 1'b0;
          trng_done <= 1'b0;
          if(retrain_adj_tap)begin
           TRNG_STATE <= LOAD_STATE1;
          end else begin 
            TRNG_STATE <= LP_WAIT;    
          end
        end else begin
          TRNG_STATE <= LOAD_STATE;
          bit_load <= 1'b0;
          bit_clr_fg <= 1'b0;
        end
      end
      
      LP_WAIT:begin
        if(timeout_fg)begin
          TRNG_STATE <= LOAD_STATE;          
        end else if(&cnt & LP_start)begin
          bit_load <= 1'b0;
          bit_clr_fg <= 1'b0; 
          fg_index <= 7'd0;
          min_window <= 7'd0;
          trng_done <= 1'b0;
          tap_cnt <= 7'd0;
          TRNG_STATE <= MV_STATE;      
        end else
          TRNG_STATE <= LP_WAIT;         
      end  

      MV_STATE:begin
        bit_load <= 1'b0;
        bit_clr_fg <= 1'b0;
        bit_move <= 1'b1;
        if(mv_dn_fg)
          tap_cnt <= tap_cnt - 1;
        else  
          tap_cnt <= tap_cnt + 1;
        if(ld_fg)
          TRNG_STATE <= LOAD_STATE2;
        else  
          TRNG_STATE <= MV_STATE1;
      end

      MV_STATE1:begin
        if(&cnt)begin
          bit_move <= 1'b0; 
          early_fg <= {IOD_EARLY,early_fg[127:1]};
          late_fg <= {IOD_LATE,late_fg[127:1]};
          TRNG_STATE <= CLR_STATE;  
        end         
      end

      CLR_STATE:begin
        bit_clr_fg <= 1'b1;
        if(&cnt)begin
          bit_clr_fg <= 1'b0; 
          if(IOD_OOR)
            TRNG_STATE <= CALC_STATE1;
          else
            TRNG_STATE <= MV_STATE;            
        end
      end        
      
      CALC_STATE1:begin
        bit_clr_fg <= 1'b0;
        bit_load <= 1'b0;
        bit_move <= 1'b0;
        if(early_fg[fg_index[6:0]] | late_fg[fg_index[6:0]])begin //Early or late  found
          TRNG_STATE <= CALC_STATE2;
          fg_index <= fg_index + 7'd1; 
        end else begin
          if(fg_index < tap_cnt)begin
            fg_index <= fg_index + 7'd1; 
            TRNG_STATE <= CALC_STATE1;
          end else begin
            vld_window1 <= 0;
            vld_window2 <= fg_index;
            fg_index <= fg_index + 7'd1; 
            TRNG_STATE <= COMP_STATE;
          end           
        end        
      end
      
      
      CALC_STATE2:begin
        if(!(&fg_index[6:0]))begin //count <127
          if((early_fg[fg_index[6:0]] | late_fg[fg_index[6:0]]) == 0)begin //valid window
            vld_window1 <= fg_index;
            TRNG_STATE <= CALC_STATE3;
            fg_index <= fg_index + 7'd1; 
          end else begin
            fg_index <= fg_index + 7'd1; 
            TRNG_STATE <= CALC_STATE2;
          end
        end else begin 
          if(window_cnt > 0)begin //prev windows are valid
            TRNG_STATE <= OPT_WIN_SEL;
          end else begin    //No valid window found
            bit_move <= 1'b0;
            bit_dir <= 1'b1;
            bit_load <= 1'b1;
            bit_clr_fg <= 1'b1;
            tap_cnt <= 7'd0;   
            fg_index <= 7'd0;         
            mv_dn_fg <= 1'b0;
            mv_up_fg <= 1'b0;
            retrain_flag <= 1'b0;
            timeout_cnt <= timeout_cnt + 1;
            TRNG_STATE <= LP_WAIT;
          end
        end
      end 
      
         
      CALC_STATE3:begin //Search other end of valid window
        bit_load <= 1'b0;
        bit_move <= 1'b0;
        bit_clr_fg <= 1'b0;
        if(!(&fg_index[6:0]))begin //count <127
          if(early_fg[fg_index] | late_fg[fg_index])begin ///valid window other bound found
            vld_window2 <= fg_index[6:0] - 1;
            TRNG_STATE <= COMP_STATE;  
          end else begin
            fg_index <= fg_index + 7'd1; 
            TRNG_STATE <= CALC_STATE3;
          end
        end else begin //No late or early are found
          vld_window2 <= fg_index[6:0] - 1;
          TRNG_STATE <= COMP_STATE; 
        end    
      end  
      
      COMP_STATE:begin
        //fg_index <= ((vld_window1 + vld_window2) >> 1);  //this needs to changed from this state
        min_window <= (vld_window2 - vld_window1);
        //bit_load <= 1'b1;
        bit_clr_fg <= 1'b1;
        //tap_cnt <= 7'd0;
        bit_move <= 1'b0;
        bit_dir <= 1'b1;
        TRNG_STATE <= COMP_STATE1;
      end 
      
      COMP_STATE1:begin //check for Min window criteria
        bit_load <= 1'b0;
        bit_clr_fg <= 1'b0;
        if(min_window < MIN_WINDOW_VALUE)begin
          if(vld_window2 < tap_cnt[6:0])begin //traverse rest of the fg array 
            TRNG_STATE <= CALC_STATE1;
            fg_index[6:0] <= vld_window2;    
          end else if ((window_cnt > 0) & max_tap_index)begin //other valid windows are present
            TRNG_STATE <= OPT_WIN_SEL;      
          end else begin //to start of state machine as no valid window is found add timeout counter here
            TRNG_STATE <= LP_WAIT;
            bit_load <= 1'b1;
            bit_clr_fg <= 1'b1;
            bit_move <= 1'b0;
            bit_dir <= 1'b1;
            tap_cnt <= 7'd0;   
            fg_index <= 7'd0;         
            mv_dn_fg <= 1'b0;
            mv_up_fg <= 1'b0;
            retrain_flag <= 1'b0;
            timeout_cnt <= timeout_cnt + 1;
          end
        end else begin
          //added logic for traversing entire array for valid windows
          //store the start and end array index for the respective windows
          //Max 3 windows supported
          if((window_cnt < 3)) begin // | (!max_tap_index))begin
            if(window_cnt[1])begin
             vld_win3_start <= vld_window1;
             vld_win3_end <= vld_window2;
             win3_size <= min_window; 
             window_cnt <= window_cnt + 1;             
            end else if(window_cnt[0])begin
              vld_win2_start <= vld_window1;    
              vld_win2_end <= vld_window2;
              win2_size <= min_window;
              window_cnt <= window_cnt + 1;
            end else begin
              vld_win1_start <= vld_window1;    
              vld_win1_end <= vld_window2;    
              win1_size <= min_window;
              window_cnt <= window_cnt + 1;
            end
            if(max_tap_index)
              TRNG_STATE <= OPT_WIN_SEL;
            else
              TRNG_STATE <= CALC_STATE1; //Traverse rest of the array
          end else begin
             TRNG_STATE <= OPT_WIN_SEL;  
          end 
           
        end
      end
  
      OPT_WIN_SEL:begin
        if(win1_size > win2_size)begin
          win1_fg <= 1'b1;
        end else
          win2_fg <= 1'b1;

        if(win2_size > win3_size)begin
          win2_fg <= 1'b1;
        end else
          win3_fg <= 1'b1;
        TRNG_STATE <= OPT_WIN_SEL1;
      end
  
      OPT_WIN_SEL1:begin           
        if(win1_fg || win3_fg)begin //sel between win1 & win3
          if(win1_size > win3_size)begin
            vld_window1 <= vld_win1_start;
            vld_window2 <= vld_win1_end;
            final_tap_index <= ((vld_win1_start + vld_win1_end) >> 1); 
            win2_fg <= 1'b0;
            win3_fg <= 1'b0;
          end else begin
            vld_window1 <= vld_win3_start;
            vld_window2 <= vld_win3_end;
            final_tap_index <= ((vld_win3_start + vld_win3_end) >> 1);  
            win1_fg <= 1'b0;
            win2_fg <= 1'b0;  
          end
        end else if(win2_fg) begin //win2 is largest
          vld_window1 <= vld_win2_start;
          vld_window2 <= vld_win2_end;
          final_tap_index <= ((vld_win2_start + vld_win2_end) >> 1);  
          win1_fg <= 1'b0;
          win3_fg <= 1'b0;  
        end     
        
        if(&cnt)begin     
          bit_load <= 1'b1;
          bit_clr_fg <= 1'b1;
          tap_cnt <= 7'd0;
          bit_move <= 1'b0;
          bit_dir <= 1'b1;
          TRNG_STATE <= LOAD_STATE1;
        end else
          TRNG_STATE <= OPT_WIN_SEL1;         
      end 
          
      LOAD_STATE1:begin
        if(&cnt)begin
          bit_load <= 1'b0;
          bit_clr_fg <= 1'b0;
          ld_fg <= 1'b1;  
          TRNG_STATE <= MV_STATE; 
        end    
      end
      
      LOAD_STATE2:begin
        bit_clr_fg <= 1'b1;
        if(&cnt)begin
          bit_move <= 1'b0;
          bit_clr_fg <= 1'b0;  
          if(tap_cnt == final_tap_index[6:0])begin
            ld_fg <= 1'b0;
            trng_done <= 1'b1;
            TRNG_STATE <= LOAD_STATE;
          end else
            TRNG_STATE <= MV_STATE;    
        end     
      end
    
    endcase  
  end
end
*/

endmodule

