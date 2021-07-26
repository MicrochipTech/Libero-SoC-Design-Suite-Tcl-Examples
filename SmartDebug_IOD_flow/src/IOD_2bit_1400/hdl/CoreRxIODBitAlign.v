`timescale 1ps / 1ps
module ACT_UNIQUE_CORERXIODBITALIGN_TRNG(
	          //Sys Clk , Async Rst
                  input SCLK,              
                  input RESETN,            
                  input PLL_LOCK,            
		  input LP_IN,

		  // BIT Align status IN and OUT signals 
		  output rx_BIT_ALGN_START,
		  output rx_BIT_ALGN_DONE,
		  output rx_BIT_ALGN_ERR,
		  output rx_BIT_ALGN_OOR,
		  input  rx_BIT_ALGN_RSTRT,
		  input  rx_BIT_ALGN_HOLD,
		  input  rx_BIT_ALGN_SKIP,

                  // IOD Controller IN signals       
                  input IOD_EARLY,   
                  input IOD_LATE,
		  input IOD_OOR,

                  // IOD Controller OUT signals       
                  output rx_BIT_ALGN_CLR_FLGS,
                  output reg rx_BIT_ALGN_LOAD,
                  output reg rx_BIT_ALGN_DIR,
                  output reg rx_BIT_ALGN_MOVE,
                  input  [2:0] rx_BIT_ALGN_EYE_IN,
                  output [2:0] rx_BIT_ALGN_EYE_OUT
                  );

   // --------------------------------------------------------------------------
   // PARAMETER Declaration
   // --------------------------------------------------------------------------
   parameter MIPI_TRNG        = 0;     // 0 - Perform NO MIPI training,  1 - MIPI training is done
   parameter SKIP_TRNG        = 0;     // 0 - Perform training,  1 - No training is done
   parameter HOLD_TRNG 	      = 0;     // 0 - Continue training, 1 - Hold training
   parameter MIN_WINDOW_VALUE = 5;     // No of Tap Delays 
   parameter RST_CNT_WIDTH    = 10;
   parameter LP_PULSE_WD      = 16;

   localparam BITALIGN_IDLE_ST           = 5'b00000;
   localparam BITALIGN_LOAD_ST           = 5'b00001;
   localparam BITALIGN_CLRFLAGS_ST       = 5'b00010;
   localparam BITALIGN_EM_ST             = 5'b00011;
   localparam BITALIGN_TAPSTORE_ST       = 5'b00100;
   localparam BITALIGN_TAPCALC_ST        = 5'b00101;
   localparam BITALIGN_TAPCMP_ST         = 5'b00110;
   localparam BITALIGN_TAPCMP2_ST        = 5'b00111;
   localparam BITALIGN_DONE_ST           = 5'b01000;
   localparam BITALIGN_HOLD_ST           = 5'b01001;
   localparam BITALIGN_VALID_TAP_WAIT_ST1= 5'b01010;
   localparam BITALIGN_VALID_TAP_WAIT_ST2= 5'b01011;
   localparam BITALIGN_LP_WAIT_ST        = 5'b01100;
   localparam BITALIGN_TAPCALC_STRT_ST   = 5'b01101;
   localparam BITALIGN_NOELY_NOLTE_ST  	 = 5'b01110;
   localparam BITALIGN_ELY_ST  		 = 5'b01111;
   localparam BITALIGN_LTE_ST  		 = 5'b10000;
   localparam BITALIGN_VALID_TAP_CHK_ST	 = 5'b10001;

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   reg [1:0]    cnt;
   reg          rx_err;
   reg          rx_trng_done;
   //reg          rx_trng_done_rst;
   reg          calc_done;
   reg          early_last_set;
   reg          early_cur_set;
   reg          late_cur_set;
   reg          late_last_set;
   reg          bit_align_dly_done;
   reg          bit_align_done;
   reg          bit_align_start;
   reg 	        mv_dn_fg;
   reg          mv_up_fg;
   reg          sig_rx_BIT_ALGN_CLR_FLGS;
   reg          rx_trng_done1;
      
   wire [6:0]   early_late_val_st_end;
   wire [6:0]   no_early_no_late_val_st1_end1;
   wire [6:0]   no_early_no_late_val_st2_end2;

   reg [127:0]  early_flags;
   reg [127:0]  late_flags;
   reg 		rx_BIT_ALGN_HOLD_flag;
   reg [6:0]    early_val;
   reg [6:0]    late_val;
   reg [6:0]    no_early_no_late_val_st1;
   reg [6:0]    no_early_no_late_val_end1;
   reg [6:0]    no_early_no_late_val_st2;
   reg [6:0]    no_early_no_late_val_end2;
   reg [7:0]    tapcnt_final;
   reg [7:0]    tapcnt_final_upd;
   reg [2:0]    wait_cnt;
   reg [6:0]    tap_cnt;
   reg [4:0]    bitalign_curr_state;
   reg [4:0]    bitalign_hold_state;
   reg [6:0]    emflag_cnt;

   wire [7:0] sig_tapcnt_final_upd;
   reg  [7:0] early_late_diff;
   reg  [7:0] noearly_nolate_diff_start;   
   reg  [7:0] noearly_nolate_diff_nxt;   
   wire early_late_diff_valid;
   wire noearly_nolate_diff_start_valid;   
   wire noearly_nolate_diff_nxt_valid;

   reg [2:0] 		  skip_trng_reg;
   reg 			  reset_dly_fg;
   reg [(RST_CNT_WIDTH-1):0] rst_cnt;
   reg [(LP_PULSE_WD - 1):0] LP_Clear_pulse;
   reg [3:0] 		  LP_IN_reg;
   reg [3:0] 		  LP_edge_reg;
   reg [2:0] 		  restart_reg;
   reg [3:0]              restart_edge_reg;
   reg [2:0] 		  retrain_reg;
   reg [7:0] 		  timeout_cnt;

   wire retrain_adj_tap;
   wire restart_trng_fg;
   wire Restart_trng_edge_det;
   wire re_train;
   wire timeout_fg;
   wire start_trng_fg;
   wire LP_edge_det;
   wire LP_start;
   wire clr_lp_pulse;

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   // Sweep all data delay settings.
   //          a. i ) Sweep the IO data delay from min to max value.
   //             ii) Monitor the Early/ Late flag in the spare IOD
   //            iii) Adjust the delay setting and send the done 
   //                 signal as the delay is incremented.
   //          b. i ) Determine where no data edge are too close to 
   //                 the clock edges, as set by the eyewidth.
   //          c. i ) Change the delay setting half way between the
   //                 the two settings that produced the early and late
   //                 flags.
   always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0) begin
       bitalign_curr_state      <= BITALIGN_IDLE_ST;         
       bitalign_hold_state      <= BITALIGN_IDLE_ST;         
       bit_align_dly_done       <= 1'b0;
       bit_align_start          <= 1'b0;
       bit_align_done           <= 1'b0;
       mv_dn_fg                 <= 1'b0;
       mv_up_fg                 <= 1'b0;
       //rx_trng_done_rst         <= 1'b0;
       sig_rx_BIT_ALGN_CLR_FLGS <= 1'b0;  
       rx_BIT_ALGN_MOVE         <= 1'b0;  
       rx_BIT_ALGN_LOAD         <= 1'b0;  
       rx_BIT_ALGN_DIR          <= 1'b1;  
       early_flags              <= 'h0;
       late_flags               <= 'h0;
       tap_cnt                  <= 'h0;
       tapcnt_final_upd         <= 'h0;
       rx_trng_done1            <= 1'b0;
       //OPTWIN_ST
       early_last_set 		<= 1'b0;
       early_cur_set		<= 1'b0;
       late_cur_set		<= 1'b0;
       late_last_set 		<= 1'b0;   
       early_val 		<= 'h0;
       late_val  		<= 'h0;
       no_early_no_late_val_st1 <= 'h0;
       no_early_no_late_val_end1<= 'h0;
       no_early_no_late_val_st2 <= 'h0;
       no_early_no_late_val_end2<= 'h0;
       calc_done 		<= 1'b0;               
       tapcnt_final 		<= 'h0;                  
       emflag_cnt 		<= 'h0;
       rx_err 		        <= 1'b0;               
       rx_trng_done 	        <= 1'b0;               
       timeout_cnt              <= 'd0;
       //OPTWIN_END
       rx_BIT_ALGN_HOLD_flag <= 1'b0; 
       early_late_diff           <= 'd0;
       noearly_nolate_diff_start <= 'd0;   
       noearly_nolate_diff_nxt   <= 'd0;   
      end
      //else if ((restart_trng_fg == 1'b1) || (rx_trng_done_rst == 1'b1)) begin //High Priority for RESET Training
      else if (restart_trng_fg == 1'b1) begin //High Priority for RESET Training
       bitalign_curr_state      <= BITALIGN_IDLE_ST;         
       bitalign_hold_state      <= BITALIGN_IDLE_ST;         
       bit_align_dly_done       <= 1'b0;
       bit_align_start          <= 1'b0;
       bit_align_done           <= 1'b0;
       mv_dn_fg                 <= 1'b0;
       mv_up_fg                 <= 1'b0;
       //rx_trng_done_rst         <= 1'b0;
       sig_rx_BIT_ALGN_CLR_FLGS <= 1'b0;  
       rx_BIT_ALGN_MOVE         <= 1'b0;  
       rx_BIT_ALGN_LOAD         <= 1'b0;  
       rx_BIT_ALGN_DIR          <= 1'b1;  
       early_flags              <= 'h0;
       late_flags               <= 'h0;
       tap_cnt                  <= 'h0;
       tapcnt_final_upd         <= 'h0;
       rx_trng_done1            <= 1'b0;
       //OPTWIN_ST
       early_last_set 	        <= 1'b0;
       early_cur_set		<= 1'b0;
       late_cur_set		<= 1'b0;
       late_last_set 		<= 1'b0;   
       early_val 		<= 'h0;
       late_val  		<= 'h0;
       no_early_no_late_val_st1 <= 'h0;
       no_early_no_late_val_end1<= 'h0;
       no_early_no_late_val_st2 <= 'h0;
       no_early_no_late_val_end2<= 'h0;
       calc_done 		<= 1'b0;               
       tapcnt_final 		<= 'h0;                  
       emflag_cnt 		<= 'h0;
       rx_err 		        <= 1'b0;               
       rx_trng_done 	        <= 1'b0;               
       //if (rx_trng_done_rst) begin
        //timeout_cnt          <= timeout_cnt + 'd1;
       //end else begin
        timeout_cnt          <= 'd0;
       //end 
       //OPTWIN_END
       rx_BIT_ALGN_HOLD_flag <= 1'b0; 
       early_late_diff           <= 'd0;
       noearly_nolate_diff_start <= 'd0;   
       noearly_nolate_diff_nxt   <= 'd0;   
      end
      else if ((!rx_BIT_ALGN_HOLD_flag) && (rx_BIT_ALGN_HOLD == 1'b1) && (HOLD_TRNG == 1'b1)) begin
         bitalign_hold_state   <= bitalign_curr_state; 
         bitalign_curr_state   <= BITALIGN_HOLD_ST;
         rx_BIT_ALGN_HOLD_flag <= 1'b1; 
      end
      else if ((rx_BIT_ALGN_HOLD_flag) && (bitalign_curr_state == BITALIGN_HOLD_ST) && (rx_BIT_ALGN_HOLD == 1'b0)) begin
         bitalign_curr_state   <= bitalign_hold_state;
         rx_BIT_ALGN_HOLD_flag <= 1'b0; 
         bitalign_hold_state   <= BITALIGN_IDLE_ST;         
      end	      
      else begin
      case(bitalign_curr_state)
        BITALIGN_HOLD_ST: begin
              bitalign_curr_state <= BITALIGN_HOLD_ST;
        end

        BITALIGN_IDLE_ST: begin
           //rx_trng_done_rst <=1'b0;
           if(start_trng_fg && ((|rx_BIT_ALGN_EYE_IN) && (PLL_LOCK))) begin
              bitalign_curr_state <= BITALIGN_LOAD_ST;
              bit_align_dly_done       <= 1'b0;
       	      bit_align_start          <= 1'b1;
              bit_align_done           <= 1'b0;
              mv_dn_fg                 <= 1'b0;
              mv_up_fg                 <= 1'b0;
              //rx_trng_done_rst         <= 1'b0;
              sig_rx_BIT_ALGN_CLR_FLGS <= 1'b1;  
              rx_BIT_ALGN_MOVE         <= 1'b0;  
              rx_BIT_ALGN_LOAD         <= 1'b1;  
              rx_BIT_ALGN_DIR          <= 1'b1;  
              early_flags              <= 'h0;
              late_flags               <= 'h0;
              tap_cnt                  <= 'h0;
              tapcnt_final_upd         <= 'h0;
              rx_trng_done1            <= 1'b0;
       	      //OPTWIN_ST
              early_last_set 	        <= 1'b0;
              early_cur_set		<= 1'b0;
              late_cur_set		<= 1'b0;
              late_last_set 		<= 1'b0;   
              early_val 		<= 'h0;
              late_val  		<= 'h0;
              no_early_no_late_val_st1  <= 'h0;
              no_early_no_late_val_end1 <= 'h0;
              no_early_no_late_val_st2  <= 'h0;
              no_early_no_late_val_end2 <= 'h0;
             calc_done 		        <= 1'b0;               
             tapcnt_final 		<= 'h0;                  
             emflag_cnt 		<= 'h0;
             rx_err 		        <= 1'b0;               
             rx_trng_done 	        <= 1'b0;               
             //OPTWIN_END
             rx_BIT_ALGN_HOLD_flag      <= 1'b0; 
             early_late_diff            <= 'd0;
             noearly_nolate_diff_start  <= 'd0;   
             noearly_nolate_diff_nxt    <= 'd0;   
           end
           else if(retrain_reg[2] /*& (!rx_trng_done_rst)*/ & (!timeout_fg)) begin
             if(!mv_up_fg)begin  
               rx_BIT_ALGN_DIR     <= 1'b1;
       	       bit_align_start     <= 1'b1;
               bit_align_done      <= 1'b0;
               tapcnt_final_upd    <= (tap_cnt  + 'd4);
               tap_cnt             <= tapcnt_final[6:0];
               mv_up_fg            <= 1'b1;
             end else if(!mv_dn_fg)begin
               rx_BIT_ALGN_DIR     <= 1'b0;
       	       bit_align_start     <= 1'b1;
               bit_align_done      <= 1'b0;
               tapcnt_final_upd    <= (tap_cnt  - 'd8);
               tap_cnt             <= tapcnt_final[6:0];
               mv_dn_fg            <= 1'b1;
             end else begin
               rx_BIT_ALGN_DIR     <= 1'b1;
               tapcnt_final_upd    <= 'd0;
               mv_dn_fg            <= 1'b0;
               mv_up_fg            <= 1'b0;
               //rx_trng_done_rst    <= 1'b1;
              rx_trng_done1        <= 1'b0;
              timeout_cnt          <= timeout_cnt + 'd1;
             end
             if (retrain_adj_tap) begin
               bitalign_curr_state <=BITALIGN_TAPCMP_ST;
               sig_rx_BIT_ALGN_CLR_FLGS <= 1'b1;  
             end else begin 
               bitalign_curr_state <=BITALIGN_LP_WAIT_ST;    
             end
           end
        end

        BITALIGN_LP_WAIT_ST:begin
          //rx_trng_done_rst         <= 1'b0;
          if(timeout_fg)begin
            bitalign_curr_state <= BITALIGN_IDLE_ST;          
          end else if(&cnt & LP_start)begin
              bitalign_curr_state <= BITALIGN_LOAD_ST;
              bit_align_dly_done       <= 1'b0;
       	      bit_align_start          <= 1'b1;
              bit_align_done           <= 1'b0;
              mv_dn_fg                 <= 1'b0;
              mv_up_fg                 <= 1'b0;
              sig_rx_BIT_ALGN_CLR_FLGS <= 1'b1;  
              rx_BIT_ALGN_MOVE         <= 1'b0;  
              rx_BIT_ALGN_LOAD         <= 1'b1;  
              rx_BIT_ALGN_DIR          <= 1'b1;  
              early_flags              <= 'h0;
              late_flags               <= 'h0;
              tap_cnt                  <= 'h0;
              tapcnt_final_upd         <= 'h0;
              rx_trng_done1            <= 1'b0;
       	      //OPTWIN_ST
              early_last_set 	        <= 1'b0;
              early_cur_set		<= 1'b0;
              late_cur_set		<= 1'b0;
              late_last_set 		<= 1'b0;   
              early_val 		<= 'h0;
              late_val  		<= 'h0;
              no_early_no_late_val_st1  <= 'h0;
              no_early_no_late_val_end1 <= 'h0;
              no_early_no_late_val_st2  <= 'h0;
              no_early_no_late_val_end2 <= 'h0;
              calc_done 		<= 1'b0;               
              tapcnt_final 		<= 'h0;                  
              emflag_cnt 		<= 'h0;
              rx_err 		        <= 1'b0;               
              rx_trng_done 	        <= 1'b0;               
              //OPTWIN_END
              rx_BIT_ALGN_HOLD_flag      <= 1'b0; 
              early_late_diff            <= 'd0;
              noearly_nolate_diff_start  <= 'd0;   
              noearly_nolate_diff_nxt    <= 'd0;   
          end else
            bitalign_curr_state <= BITALIGN_LP_WAIT_ST;         
        end  

        // Load the initial values for the tap delays within the 
        // read delay line
        BITALIGN_LOAD_ST: begin
           if (&cnt) begin
            sig_rx_BIT_ALGN_CLR_FLGS <=1'b0;
            rx_BIT_ALGN_LOAD     <=1'b0;
            tap_cnt              <= 'h0;
            bitalign_curr_state  <=BITALIGN_EM_ST;
           end 
           else begin 
            bitalign_curr_state  <=BITALIGN_LOAD_ST;
           end
        end
        // Clear the IOD DEM flags after every increment 
        // of the tap read delay
        BITALIGN_CLRFLAGS_ST: begin
           if (&cnt) begin
            rx_BIT_ALGN_MOVE    <=1'b0;
            sig_rx_BIT_ALGN_CLR_FLGS<=1'b1;
            bitalign_curr_state <=BITALIGN_EM_ST;
           end else begin
            bitalign_curr_state <=BITALIGN_CLRFLAGS_ST;
           end
        end
        // Wait for delay count till the tap delay values 
        // take effect.
        BITALIGN_EM_ST: begin
           if (&cnt) begin
             sig_rx_BIT_ALGN_CLR_FLGS <=1'b0;
             rx_BIT_ALGN_LOAD     <=1'b0;
           end else begin
              bitalign_curr_state <=BITALIGN_EM_ST;
           end
	   if(wait_cnt == 'd0) begin
             if(IOD_OOR) begin
               bitalign_curr_state <=BITALIGN_TAPCALC_ST;
             end
             else begin
               bitalign_curr_state <=BITALIGN_TAPSTORE_ST;
             end   
           end
           else begin
              bitalign_curr_state <=BITALIGN_EM_ST;
           end
        end
        // Store the Early/Late flag values for
        // each value of the tap delay
        BITALIGN_TAPSTORE_ST: begin
           if(IOD_OOR) /*((&tap_cnt) == 1'b1)*/ begin
              bitalign_curr_state <=BITALIGN_TAPCALC_ST;
              sig_rx_BIT_ALGN_CLR_FLGS <=1'b1;
           end
           else begin
              early_flags[tap_cnt]<= IOD_EARLY;
              late_flags[tap_cnt] <= IOD_LATE;

              bitalign_curr_state <=BITALIGN_CLRFLAGS_ST;
              // To LC Read delay line
              rx_BIT_ALGN_MOVE         <=1'b1;
              rx_BIT_ALGN_DIR          <=1'b1;  
              //COV if (mv_dn_fg)
               //COV tap_cnt <= tap_cnt - 'd1;
              //COV else 
	       tap_cnt <= tap_cnt + 'd1;
           end
        end
        // Calculate the delay tap value after all the 
        // flags are stored
        BITALIGN_TAPCALC_ST: begin
           if (&cnt) begin
             sig_rx_BIT_ALGN_CLR_FLGS<=1'b0;
             tap_cnt                 <='h0;
             if(calc_done == 1'b1) begin
	        if (rx_err) begin
                  rx_BIT_ALGN_LOAD         <=1'b0;   
                  sig_rx_BIT_ALGN_CLR_FLGS <=1'b0;
                  //rx_trng_done_rst       <=1'b1;
                  timeout_cnt              <= timeout_cnt + 'd1;
                  calc_done 	           <=1'b0;
                  rx_err 	           <=1'b0;
                  bitalign_curr_state      <=BITALIGN_IDLE_ST;
	        end else begin
                  rx_BIT_ALGN_LOAD         <=1'b1;   
                  sig_rx_BIT_ALGN_CLR_FLGS <=1'b1;
                  tap_cnt                  <='h0;
                  bitalign_curr_state      <=BITALIGN_TAPCMP_ST;
                end		      
             end
	     else begin
               bitalign_curr_state <=BITALIGN_TAPCALC_STRT_ST;
             end  
           end else begin
            bitalign_curr_state <=BITALIGN_TAPCALC_ST;
           end
        end
        // Compare the calculated tap values with the
        BITALIGN_TAPCMP_ST: begin
           if (&cnt) begin
             sig_rx_BIT_ALGN_CLR_FLGS <=1'b0;
             rx_BIT_ALGN_LOAD     <=1'b0;
             rx_BIT_ALGN_MOVE     <=1'b0;
             //rx_trng_done_rst   <=1'b0;
             if (mv_dn_fg)  
              rx_BIT_ALGN_DIR     <=1'b0;  
             else
              rx_BIT_ALGN_DIR     <=1'b1;  
             if(sig_tapcnt_final_upd[6:0] == tap_cnt) begin
                bitalign_curr_state <=BITALIGN_VALID_TAP_WAIT_ST1;
                bit_align_dly_done  <=1'b1;
             end
             else begin
                bitalign_curr_state  <=BITALIGN_TAPCMP2_ST;
             end
           end else begin
              bitalign_curr_state <=BITALIGN_TAPCMP_ST;
           end
        end
        // Compare the calculated tap values with the
        BITALIGN_TAPCMP2_ST: begin
           rx_BIT_ALGN_MOVE    <= 1'b1;
           if (&cnt) begin
             rx_BIT_ALGN_MOVE        <=1'b0;
             sig_rx_BIT_ALGN_CLR_FLGS<=1'b1;
             bitalign_curr_state <=BITALIGN_TAPCMP_ST;
             if (mv_dn_fg)
              tap_cnt <= tap_cnt - 'd1;
             else 
	      tap_cnt <= tap_cnt + 'd1;
           end else begin
             bitalign_curr_state <=BITALIGN_TAPCMP2_ST;
           end 
        end
        // Calculation done
        BITALIGN_DONE_ST: begin
	   if (mv_up_fg || mv_dn_fg) begin 
              rx_trng_done1       <=1'b1;
           end
           else begin 
              rx_trng_done1       <=1'b0;
           end
	   if (rx_trng_done) begin 
              bit_align_dly_done  <=1'b0;
              bitalign_curr_state <=BITALIGN_IDLE_ST; 
            if (re_train) begin 
              bit_align_done  <=1'b0;
              bit_align_start <=1'b1;
            end   
	    else begin
              bit_align_done  <=1'b1;
              bit_align_start <=1'b0;
            end   
	   end   
	   //COV else begin  
           //COV   bitalign_curr_state <=BITALIGN_DONE_ST; 
           //COV end  
        end

        //OPTWIN_ST
        //case(bitalign_curr_state)
	BITALIGN_TAPCALC_STRT_ST : begin
	  calc_done 		<= 1'b0;               
          rx_err 		<= 1'b0;               
 	  if(!(&emflag_cnt)) begin//Sweep Early , Flags Done 
           emflag_cnt <= emflag_cnt + 'h1;
           if((early_flags[emflag_cnt] == 1'b0) && (late_flags[emflag_cnt] == 1'b0)) begin    //E-0,L-0
             bitalign_curr_state   <= BITALIGN_NOELY_NOLTE_ST;         
             no_early_no_late_val_st1 <= emflag_cnt;
	   end	 
           else if(early_flags[emflag_cnt] == 1'b1) begin				    //E-1,L-DontCare/0
             bitalign_curr_state  <= BITALIGN_ELY_ST;         
             early_cur_set  		<= 1'b1;
             early_val      		<= emflag_cnt;
	   end	 
           else if(late_flags[emflag_cnt] == 1'b1) begin				    //E-Dontcare/0,L-1
             bitalign_curr_state  <= BITALIGN_LTE_ST;         
             late_cur_set  		<= 1'b1;
	   end	 
	   //COV else 
             //COV bitalign_curr_state   <= BITALIGN_TAPCALC_STRT_ST;         
	  end
	  //Error Condition no TAP Delays Found
	  /* COV else if (&emflag_cnt) begin
             bitalign_curr_state <= BITALIGN_VALID_TAP_WAIT_ST1;         
             rx_trng_done              <= 1'b0;               
             early_cur_set	       <= 1'b0;
             early_last_set	       <= 1'b0;
	     late_cur_set	       <= 1'b0;
             late_last_set 	       <= 1'b0;   
	     early_val 		       <= 'h0;
	     late_val  		       <= 'h0;
             no_early_no_late_val_st1  <= 'h0;
             no_early_no_late_val_end1 <= 'h0;
             no_early_no_late_val_st2  <= 'h0;
             no_early_no_late_val_end2 <= 'h0;
             rx_err 		       <= 1'b1;               
             calc_done 	               <= 1'b1;
             tapcnt_final              <= 'h0;  
             emflag_cnt 	       <= 'h0;
             timeout_cnt               <= timeout_cnt + 'd1;
          end COV */
	  //COV else 
                //COV bitalign_curr_state <= BITALIGN_TAPCALC_STRT_ST;         
	end

	BITALIGN_NOELY_NOLTE_ST : begin
          if((early_flags[emflag_cnt] == 1'b0) && (late_flags[emflag_cnt] == 1'b0)) begin	//E-0,L-0
            no_early_no_late_val_end1 <= emflag_cnt;
            noearly_nolate_diff_start <= (emflag_cnt - no_early_no_late_val_st1);
            bitalign_curr_state   <= BITALIGN_NOELY_NOLTE_ST;         
          end  
	  else begin
            if(early_flags[emflag_cnt] == 1'b1) begin					//E-1,L-DontCare/0
              bitalign_curr_state  <= BITALIGN_ELY_ST;         
              early_cur_set 		 <= 1'b1;
              early_val      	 <= emflag_cnt;
	    end	 
            else if(late_flags[emflag_cnt] == 1'b1) begin				//E-Dontcare/0,L-1
              bitalign_curr_state    <= BITALIGN_LTE_ST;         
              late_cur_set  	    	   <= 1'b1;
	    end	 
	    //COV else 
              //COV bitalign_curr_state  <= BITALIGN_NOELY_NOLTE_ST;       
          end
          if(&emflag_cnt)//Sweep Early , Flags Done 
             bitalign_curr_state   <= BITALIGN_VALID_TAP_CHK_ST;       
	  else begin
             emflag_cnt <= emflag_cnt + 'h1;
	  end	 
	end

	BITALIGN_ELY_ST : begin
          if((early_flags[emflag_cnt] == 1'b1) && (early_cur_set)) begin			//E-1,L-DontCare/0
            bitalign_curr_state   <= BITALIGN_ELY_ST;         
            early_last_set 	  <= 1'b0;
            early_cur_set  	  <= 1'b1;
            early_val      	  <= emflag_cnt;
	  end
          else if((early_flags[emflag_cnt] == 1'b0) && (early_cur_set)) begin
            early_last_set 	  <= 1'b1;
	    early_cur_set  	  <= 1'b0;
            bitalign_curr_state   <= BITALIGN_LTE_ST;         
            no_early_no_late_val_st2 <= emflag_cnt;
	  end	 
	  //COV else 
            //COV bitalign_curr_state   <= BITALIGN_ELY_ST;       
          if(&emflag_cnt)//Sweep Early , Flags Done 
            bitalign_curr_state   <= BITALIGN_VALID_TAP_CHK_ST;       
	  else begin
            emflag_cnt <= emflag_cnt + 'h1;
	  end	 
        end

	BITALIGN_LTE_ST : begin
          if (early_last_set && (!late_last_set)) begin		    
           if(late_flags[emflag_cnt] == 1'b1) begin
             late_last_set		 <= 1'b1;
             late_val 		   <= emflag_cnt;
             early_late_diff       <= (emflag_cnt - early_val);
             bitalign_curr_state   <= BITALIGN_VALID_TAP_CHK_ST;       
           end
           else if((early_flags[emflag_cnt] == 1'b0) && (late_flags[emflag_cnt] == 1'b0)) begin	        //LAST EARLY FOUND After E-0 , L-0(No NOISE) 
            no_early_no_late_val_end2  <= emflag_cnt;
            noearly_nolate_diff_nxt    <= (emflag_cnt - no_early_no_late_val_st2); 
           end  
	   else 
             bitalign_curr_state   <= BITALIGN_LTE_ST;       
          end	     
	  else begin
           if((late_flags[emflag_cnt] == 1'b1) && (!early_cur_set) && (late_cur_set)) begin		//E-Dontcare/0,L-1
              bitalign_curr_state   <= BITALIGN_LTE_ST;         
	   end
           else if((early_flags[emflag_cnt] == 1'b1) && (!early_cur_set)) begin				//E-1,L-DontCare/0
              early_last_set 	  <= 1'b0;
	      early_cur_set  	  <= 1'b1;
	      late_cur_set  	  	  <= 1'b0;
              early_val     		  <= emflag_cnt;
              bitalign_curr_state   <= BITALIGN_ELY_ST;         
	   end	 
	   else 
              bitalign_curr_state   <= BITALIGN_LTE_ST;       
          end
          if(&emflag_cnt)//Sweep Early , Flags Done 
             bitalign_curr_state   <= BITALIGN_VALID_TAP_CHK_ST;       
	  else begin
             emflag_cnt <= emflag_cnt + 'h1;
	  end	 
        end

	BITALIGN_VALID_TAP_CHK_ST : begin
	  //COV calc_done 		    <= 1'b0;               
          //COV rx_trng_done  	            <= 1'b0;               
          //COV rx_err	  	            <= 1'b0;               
          //COV early_cur_set	            <= 1'b0;
          //COV early_last_set	            <= 1'b0;
	  //COV late_cur_set	            <= 1'b0;
          //COV late_last_set 	            <= 1'b0;   
	  //COV early_val 		    <= 'h0;
	  //COV late_val  	    	    <= 'h0;
          //COV no_early_no_late_val_st1    <= 'h0;
          //COV no_early_no_late_val_end1   <= 'h0;
          //COV no_early_no_late_val_st2    <= 'h0;
          //COV no_early_no_late_val_end2   <= 'h0;
	  //Best Optimum window and to reduce the TAPS if the Win width is same 
  	  if (((|early_flags) == 1'b0) && ((|late_flags) == 1'b0)) begin //Zero Noisy window Hence no TAP Delays required 
	     calc_done 		<= 1'b1;               
             tapcnt_final 		<= 'd0;
             bitalign_curr_state  <= BITALIGN_TAPCALC_ST;         
	    end	     
  	  else if ((noearly_nolate_diff_start >= noearly_nolate_diff_nxt) && (noearly_nolate_diff_nxt > 'h0) && (noearly_nolate_diff_start > 'h0))begin //Same Data Window- E-0,L-0 checks 
	     calc_done 		  <= 1'b1;               
             tapcnt_final 	  <= no_early_no_late_val_st1_end1; /*((no_early_no_late_val_st1 + no_early_no_late_val_end1) >> 1);*/
             bitalign_curr_state  <= BITALIGN_TAPCALC_ST;       
          end			   
	  //Check the best window before E-0,L-0 and after E-Last and L-Nxt
  	  else if ((noearly_nolate_diff_start > early_late_diff) && noearly_nolate_diff_start_valid) begin		  	          		                  //Less noisy Data Window- E-0,L-0 checks 
	     calc_done 		<= 1'b1;               
             tapcnt_final 		<= (noearly_nolate_diff_start > noearly_nolate_diff_nxt) ?  
	     	                   no_early_no_late_val_st1_end1 /*((no_early_no_late_val_st1 + no_early_no_late_val_end1) >> 1)*/ : 
	     			   no_early_no_late_val_st2_end2 /*((no_early_no_late_val_st2 + no_early_no_late_val_end2) >> 1)*/;        
             bitalign_curr_state <= BITALIGN_TAPCALC_ST;         
          end			   
  	  else if ((noearly_nolate_diff_nxt > early_late_diff) && noearly_nolate_diff_nxt_valid) begin		  	          		                  //Less noisy Data Window- E-0,L-0 checks 
	     calc_done 		<= 1'b1;               
             tapcnt_final 		<= (noearly_nolate_diff_nxt > noearly_nolate_diff_start) ?  
	     	                   no_early_no_late_val_st2_end2 /*((no_early_no_late_val_st2 + no_early_no_late_val_end2) >> 1)*/  : 
	     	                   no_early_no_late_val_st1_end1 /*((no_early_no_late_val_st1 + no_early_no_late_val_end1) >> 1)*/;        
             bitalign_curr_state <= BITALIGN_TAPCALC_ST;         
          end			   
	  else if ((early_last_set && late_last_set) && early_late_diff_valid) begin // Optimal Data Window condition check
             if(early_val < late_val) begin
               tapcnt_final <= early_late_val_st_end; /*((early_val + late_val) >> 1)*/;  
             end
             else begin
               tapcnt_final <= early_val;  
             end
             calc_done <= 1'b1;
            	bitalign_curr_state <= BITALIGN_TAPCALC_ST;         
  	  end
	  //Error Condition no TAP Delays Found 
	  else if (&emflag_cnt) begin
             bitalign_curr_state <= BITALIGN_TAPCALC_ST;         
             rx_err 		    <= 1'b1;               
             calc_done 	            <= 1'b1;
             tapcnt_final           <= 'h0;  
             emflag_cnt 	    <= 'h0;
             timeout_cnt            <= timeout_cnt + 'd1;
          end
	  else begin
             bitalign_curr_state <= BITALIGN_TAPCALC_STRT_ST;         
             rx_err 		      <= 1'b0;               
             calc_done 	      <= 1'b0;
             tapcnt_final           <= 'h0;  
           end		     
        end  

	//Added for MAIN FSM Delay on CALC_DONE
	BITALIGN_VALID_TAP_WAIT_ST1 : begin
          if(bit_align_dly_done) begin
            bitalign_curr_state <= BITALIGN_VALID_TAP_WAIT_ST2;         
            calc_done 	<= 1'b0;
            emflag_cnt 	<= 'h0;
          end		
	  else begin 		
            bitalign_curr_state <= BITALIGN_VALID_TAP_WAIT_ST1;         
          end		   
	end

	//Added for MAIN FSM Delay on CALC_DONE
	BITALIGN_VALID_TAP_WAIT_ST2 : begin
          if(wait_cnt == 'd0) begin
             bitalign_curr_state <= BITALIGN_DONE_ST;         
	     rx_trng_done 	    <= 1'b1;	
	     calc_done 		    <= 1'b0;               
             rx_err 		    <= 1'b0;               
          end		
	  else begin 		
             bitalign_curr_state <= BITALIGN_VALID_TAP_WAIT_ST2;         
	     rx_trng_done 	    <= 1'b0;	
          end		   
	end

        //default: begin
        //     bitalign_curr_state <= BITALIGN_TAPCALC_STRT_ST;         
        //end
        //endcase 		 

        default: begin
           bitalign_curr_state <=BITALIGN_IDLE_ST;
        end
      endcase // case (bitalign_curr_state)      
      end
   end // always @ (*)

   // Wait counter
   // Wait for delay count till the tap delay values 
   // take effect.
   always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0) begin
         wait_cnt <= 'h7;
      end
      else if (restart_trng_fg == 1'b1) begin
         wait_cnt <= 'h7;
      end
      else begin
         if((bitalign_curr_state == BITALIGN_VALID_TAP_WAIT_ST1) || (bitalign_curr_state == BITALIGN_CLRFLAGS_ST)) begin
            wait_cnt <= 'h7;
         end
         else if((bitalign_curr_state == BITALIGN_VALID_TAP_WAIT_ST2) || (bitalign_curr_state == BITALIGN_EM_ST)) begin
            wait_cnt <= wait_cnt - 'h1;
         end
      end
   end

   assign clr_lp_pulse              = |LP_Clear_pulse;
   //assign early_late_diff           = ((early_val < late_val) && (|early_val) && (|late_val))  ? (late_val - early_val)                                 : 'h0;
   //assign noearly_nolate_diff_start = (|no_early_no_late_val_end1)                             ? (no_early_no_late_val_end1 - no_early_no_late_val_st1) : 'h0;
   //assign noearly_nolate_diff_nxt   = (|no_early_no_late_val_end2)                             ? (no_early_no_late_val_end2 - no_early_no_late_val_st2) : 'h0; 
   
   //assign early_late_diff_valid           = ((late_val - early_val) > MIN_WINDOW_VALUE)                                  ? 1'b1 : 1'b0;
   //assign noearly_nolate_diff_start_valid = ((no_early_no_late_val_end1 - no_early_no_late_val_st1)  > MIN_WINDOW_VALUE) ? 1'h1 : 1'b0;
   //assign noearly_nolate_diff_nxt_valid   = ((no_early_no_late_val_end2 - no_early_no_late_val_st2)  > MIN_WINDOW_VALUE) ? 1'b1 : 1'b0; 

   assign early_late_diff_valid           = (early_late_diff > MIN_WINDOW_VALUE) ? 1'b1 : 1'b0;
   assign noearly_nolate_diff_start_valid = (noearly_nolate_diff_start > MIN_WINDOW_VALUE) ? 1'h1 : 1'b0;
   assign noearly_nolate_diff_nxt_valid   = (noearly_nolate_diff_nxt   > MIN_WINDOW_VALUE) ? 1'b1 : 1'b0; 

   assign early_late_val_st_end         = ((early_val + late_val) >> 1);
   assign no_early_no_late_val_st1_end1 = ((no_early_no_late_val_st1 + no_early_no_late_val_end1) >> 1);
   assign no_early_no_late_val_st2_end2 = ((no_early_no_late_val_st2 + no_early_no_late_val_end2) >> 1);

   assign rx_BIT_ALGN_CLR_FLGS  = (!rx_trng_done)? sig_rx_BIT_ALGN_CLR_FLGS: clr_lp_pulse;
   assign rx_BIT_ALGN_OOR   	= IOD_OOR;    
   assign rx_BIT_ALGN_EYE_OUT   = rx_BIT_ALGN_EYE_IN;           
   assign rx_BIT_ALGN_START     = (skip_trng_reg[2]) ? 1'b0 : (bit_align_start & (!timeout_fg));    
   assign rx_BIT_ALGN_DONE      = (skip_trng_reg[2]) ? 1'b1 : (bit_align_done | timeout_fg);    
   assign rx_BIT_ALGN_ERR       = timeout_fg;    
   assign retrain_adj_tap       = !(mv_up_fg & mv_dn_fg);
   assign sig_tapcnt_final_upd  = (mv_up_fg || mv_dn_fg) ? tapcnt_final_upd[6:0] : tapcnt_final; 
   
   //Added for continous Re-training window detection 
   assign timeout_fg 	  	= (&timeout_cnt);
   //positive Edge det on Restart training signal
   assign Restart_trng_edge_det = (!restart_reg[2] & restart_reg[1]);
   assign restart_trng_fg       = |restart_edge_reg; //Stretch the Restart pulse
  
   wire sig_re_train;
   assign sig_re_train 		    = ((rx_trng_done || rx_trng_done1) & (IOD_EARLY|IOD_LATE/*|rx_err*/) /*& (!LP_IN)*/ & (!timeout_fg)) ? 1'b1:1'b0;
   assign re_train 		    = MIPI_TRNG ? (sig_re_train & (!LP_IN)) : sig_re_train;
   assign start_trng_fg   	    = ((!rx_trng_done) & reset_dly_fg & LP_start & (!skip_trng_reg[2]) & (!timeout_fg));
   //Negative Edge det on LP signal
   assign LP_edge_det	            = (LP_IN_reg[3] & !LP_IN_reg[2]);
   assign LP_start 	  	    = MIPI_TRNG ? |LP_edge_reg : 1'b1; //Stretch the LP -ve edge pulse

   // SKIP_TRNG SYNCHRONIZER //
   always@(posedge SCLK or negedge RESETN) begin
      if(!RESETN) begin
        skip_trng_reg <= 0;
      end else if (SKIP_TRNG) begin
        skip_trng_reg <= {skip_trng_reg[1:0],rx_BIT_ALGN_SKIP};
      end     
   end

   //Reset Counter to add delay 
   always@(posedge SCLK or negedge RESETN) begin
      if(!RESETN)begin
        rst_cnt <= 0;
        reset_dly_fg <= 1'b0;
      end else begin
        if((!reset_dly_fg) & (&rst_cnt))
         reset_dly_fg <= 1'b1;
        rst_cnt <= rst_cnt + 1;
      end     
   end

   // LP Signal Negative edge detect Logic
   always@(posedge SCLK or negedge RESETN) begin
      if(!RESETN)begin
        LP_IN_reg <= 4'hF;
        LP_edge_reg <= 4'h0;
      end else begin
        if(reset_dly_fg & MIPI_TRNG)begin
         LP_IN_reg <= {LP_IN_reg[2:0],LP_IN};   
         LP_edge_reg <= {LP_edge_reg[2:0],LP_edge_det};
        end else begin
         LP_IN_reg <= 4'hF;
         LP_edge_reg <= 4'h0;
        end
      end
   end

   //Synchronise RESTART_TRNG Signal with SCLK
   always@(posedge SCLK or negedge RESETN) begin
      if(!RESETN)begin
        restart_reg <= 3'b000;
        restart_edge_reg <= 4'b0000;
      end else begin
        restart_reg <= {restart_reg[1:0],rx_BIT_ALGN_RSTRT};
        restart_edge_reg <= {restart_edge_reg[2:0],Restart_trng_edge_det};     
      end
   end

   //Synchronise Re_train bit with SCLK
   always@(posedge SCLK or negedge RESETN) begin
      if(!RESETN)begin
        retrain_reg <= 3'b000;
      end else begin
        retrain_reg <= {retrain_reg[1:0],re_train};
      end
   end

   // LP Signal Negative edge detect Logic
   always@(posedge SCLK or negedge RESETN) begin
      if(!RESETN)begin
        cnt <= 2'b00;
      end else begin
        cnt <= cnt + 2'b01;
      end
   end

   //stretch the LP_IN to clear the flags
   always@(posedge SCLK or negedge RESETN) begin
      if(!RESETN)begin
        LP_Clear_pulse <= 0;
      end else if (MIPI_TRNG) begin
        LP_Clear_pulse <= {LP_Clear_pulse[(LP_PULSE_WD - 2):0],LP_IN};
      end else begin
        LP_Clear_pulse <= 0;
      end
   end

endmodule // ACT_UNIQUE_CORERXIODBITALIGN_TRNG


