`timescale 1ps / 1ps
module ICB_BCLKSCLKALIGN(
	          //Sys Clk , Async Rst
                  SCLK,              
                  RESETN,            

		  // BIT Align status IN and OUT signals
		  RX_BCLKSCLKALIGN_TRAIN, 
		  RX_CLK_ALIGN_START,
		  RX_CLK_ALIGN_DONE,
    		  RX_BCLKPHS_OFFSET,
		  RX_CLK_ALIGN_RSTRT,
		  RX_CLK_ALIGN_HOLD,
		  RX_CLK_ALIGN_SKIP,
		  RX_CLK_ALIGN_ERR,

                  // IOD Controller IN signals       
                  IOD_EARLY,   
                  IOD_LATE,
		  IOD_OOR,

                  // IOD Controller OUT signals       
                  RX_RESET_LANE,
                  RX_CLK_ALIGN_TAPDLY,
                  RX_CLK_ALIGN_CLR_FLGS,
                  RX_CLK_ALIGN_LOAD,
                  RX_CLK_ALIGN_DIR,
                  RX_CLK_ALIGN_MOVE
                  );

   // --------------------------------------------------------------------------
   // PARAMETER Declaration
   // --------------------------------------------------------------------------
   parameter BCLKSCLK_TRN_MODE 	        = 1;     // 0- RX/TX PLL Based Training , 1 - ICB RX Training
   parameter ICB_CLK_ALGN_SKIP_TRNG     = 0;     // 0 - Perform training,  1 - No training is done
   parameter ICB_CLK_ALGN_HOLD_TRNG     = 0;     // 0 - Continue training, 1 - Hold training
   parameter BCLKSCLK_ICB_TAP_WAIT_CNT_WIDTH  = 3;     // 3 - Default 8 clocks  
   parameter BCLKSCLK_ICB_TAP_CNT       = 'd128;
   parameter BCLKSCLK_ICB_TAP_CNT_WIDTH = 'd7;
   //parameter WINDOW_SIZE              = 'd1;
   localparam RST_CNT_WIDTH             = 10;

   localparam CLKALIGN_HOLD_ST           	= 6'b000000; //0 
   localparam CLKALIGN_INIT_ST		 	= 6'b000001; //1
   localparam CLKALIGN_RESE_ST		 	= 6'b000010; //2
   localparam CLKALIGN_RESW_ST		 	= 6'b000011; //3
   localparam CLKALIGN_START_ST          	= 6'b000100; //4
   localparam CLKALIGN_LOAD_ST           	= 6'b000101; //5
   localparam CLKALIGN_CLRFLAGS_ST       	= 6'b000110; //6
   localparam CLKALIGN_EM_ST             	= 6'b000111; //7
   localparam CLKALIGN_TAPSTORE_ST       	= 6'b001000; //8
   localparam CLKALIGN_TAPCALC_ST        	= 6'b001001; //9
   localparam CLKALIGN_TAPCALC_STRT_DLY_ST      = 6'b001010; //10
   localparam CLKALIGN_TAPCALC_STRT_DLY1_ST     = 6'b001011; //11
   localparam CLKALIGN_TAPCALC_STRT_DLY2_ST     = 6'b001100; //12
   localparam CLKALIGN_TAPCALC_STRT_ST   	= 6'b001101; //13
   localparam CLKALIGN_INIT_ELY_LTE_DLY_ST      = 6'b001110; //14 
   localparam CLKALIGN_INIT_ELY_LTE_DLY1_ST     = 6'b001111; //15 
   localparam CLKALIGN_INIT_ELY_LTE_DLY2_ST     = 6'b010000; //16 
   localparam CLKALIGN_INIT_ELY_LTE_ST   	= 6'b010001; //17 
   localparam CLKALIGN_INIT_NO_ELY_LTE_DLY_ST   = 6'b010010; //18 
   localparam CLKALIGN_INIT_NO_ELY_LTE_DLY1_ST  = 6'b010011; //19 
   localparam CLKALIGN_INIT_NO_ELY_LTE_DLY2_ST  = 6'b010100; //20 
   localparam CLKALIGN_INIT_NO_ELY_LTE_ST	= 6'b010101; //21 
   localparam CLKALIGN_NXT_ELY_LTE_DLY_ST       = 6'b010110; //22
   localparam CLKALIGN_NXT_ELY_LTE_DLY1_ST      = 6'b010111; //23
   localparam CLKALIGN_NXT_ELY_LTE_DLY2_ST      = 6'b011000; //24
   localparam CLKALIGN_NXT_ELY_LTE_ST    	= 6'b011001; //25
   localparam CLKALIGN_VALID_TAP_CHK_DLY_ST	= 6'b011010; //26 
   localparam CLKALIGN_VALID_TAP_CHK_ST	 	= 6'b011011; //27 
   localparam CLKALIGN_TAPCMP_ST         	= 6'b011100; //28
   localparam CLKALIGN_TAPCMP2_ST        	= 6'b011101; //29
   localparam CLKALIGN_VALID_TAP_WAIT_ST1	= 6'b011110; //30
   localparam CLKALIGN_VALID_TAP_WAIT_ST2	= 6'b011111; //31
   localparam CLKALIGN_DONE_ST           	= 6'b100000; //32
   localparam CLKALIGN_TAPCMP_OFFSET_ST  	= 6'b100001; //33
   localparam CLKALIGN_TAPCMP2_OFFSET_ST 	= 6'b100010; //34
   localparam CLKALIGN_VALID_TAP_WAIT_OFFSET_ST1= 6'b100011; //35
   localparam CLKALIGN_VALID_TAP_WAIT_OFFSET_ST2= 6'b100100; //36
   localparam CLKALIGN_PAUSE_ST	 	 	= 6'b100101; //37 
   localparam CLKALIGN_RESE1_ST		 	= 6'b100110; //38 
   localparam CLKALIGN_DONE1_ST          	= 6'b100111; //39 

   //Sys Clk , Async Rst
   input SCLK;              
   input RESETN;            

   // BIT Align status IN and OUT signals
   input RX_BCLKSCLKALIGN_TRAIN; 
   output reg RX_CLK_ALIGN_START;
   output reg RX_CLK_ALIGN_DONE;
   input  [7:0] RX_BCLKPHS_OFFSET;
   input  RX_CLK_ALIGN_RSTRT;
   input  RX_CLK_ALIGN_HOLD;
   input  RX_CLK_ALIGN_SKIP;
   output reg RX_CLK_ALIGN_ERR;

   // IOD Controller IN signals       
   input IOD_EARLY;   
   input IOD_LATE;
   input IOD_OOR;

   // IOD Controller OUT signals       
   output reg RX_RESET_LANE;
   output reg [BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0] RX_CLK_ALIGN_TAPDLY;
   output reg RX_CLK_ALIGN_CLR_FLGS;
   output reg RX_CLK_ALIGN_LOAD;
   output wire RX_CLK_ALIGN_DIR;
   output reg RX_CLK_ALIGN_MOVE;

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   //OPT reg rx_CLK_ALGN_HOLD_flag;
   reg [2:0]    skip_trng_reg;
   reg [1:0]    cnt;
   reg          rx_err;
   reg          rx_trng_done;
   reg          calc_done;
   reg          early_late_init_set;
   reg          early_late_nxt_set;
   reg          early_late_start_set;
   reg          early_late_end_set;
   reg          clk_align_done;
   reg          clk_align_start;
      
   reg [(BCLKSCLK_ICB_TAP_CNT/2)-1:0]      early_flags_lsb;
   reg [(BCLKSCLK_ICB_TAP_CNT/2)-1:0]      early_flags_msb;
   reg [(BCLKSCLK_ICB_TAP_CNT/2)-1:0]      late_flags_lsb;
   reg [(BCLKSCLK_ICB_TAP_CNT/2)-1:0]      late_flags_msb;
   reg [BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0]    early_late_init_val;
   reg [BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0]    early_late_nxt_val;
   reg [BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0]    early_late_start_val;
   reg [BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0]    early_late_end_val;
   reg [BCLKSCLK_ICB_TAP_CNT_WIDTH:0]      tapcnt_final;
   reg [BCLKSCLK_ICB_TAP_CNT_WIDTH:0]      tapcnt_offset;
   reg [BCLKSCLK_ICB_TAP_WAIT_CNT_WIDTH-1:0]     wait_cnt;
   reg [BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0]    tap_cnt;
   reg [5:0]    clkalign_curr_state;
   reg [5:0]    clkalign_hold_state;
   reg [BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0]    emflag_cnt;

   reg 			  reset_dly_fg;
   reg [(RST_CNT_WIDTH-1):0] rst_cnt;
   reg [2:0] 		  restart_reg;
   reg [3:0]              restart_edge_reg;
   reg [7:0] 		  timeout_cnt;

   wire emflag_cnt_done;
   wire cnt_done;
   wire early_or_late_found; 
   wire no_early_and_late_found;
   wire restart_trng_fg;
   wire Restart_trng_edge_det;
   wire timeout_fg;
   reg start_trng_fg;

   //OPT-START
   reg [BCLKSCLK_ICB_TAP_CNT_WIDTH:0]   sig_tapcnt_final_1;
   reg [BCLKSCLK_ICB_TAP_CNT_WIDTH:0]   sig_tapcnt_final_2;
   wire [BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0] tapcnt_final_1;
   wire [BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0] tapcnt_final_2;
   reg early_found_lsb_d; 	      
   reg late_found_lsb_d; 	      
   reg early_not_found_lsb_d; 	      
   reg late_not_found_lsb_d; 	      
   reg early_found_msb_d; 	      
   reg late_found_msb_d; 	      
   reg early_not_found_msb_d; 	      
   reg late_not_found_msb_d; 	      
   reg emflag_cnt_done_d;
   reg early_or_late_found_lsb_d;
   reg no_early_and_late_found_lsb_d;       
   reg early_or_late_found_msb_d;
   reg no_early_and_late_found_msb_d;       
   reg early_late_start_and_end_set;
   reg early_late_init_and_nxt_set;
   reg early_late_start_end_val_status;
   reg early_late_init_nxt_val_status;
   wire [BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0]    emflag_cnt_dec;
   wire emflag_cnt_lsb;
   wire early_or_late_found_lsb; 
   wire no_early_and_late_found_lsb;
   wire early_or_late_found_msb; 
   wire no_early_and_late_found_msb;
   reg internal_rst_en;
   wire early_not_found_lsb;
   wire early_not_found_msb;
   wire late_not_found_lsb;
   wire late_not_found_msb;
   wire early_found_lsb;
   wire early_found_msb;
   wire late_found_lsb;
   wire late_found_msb;
   reg  internal_rst_en_1;
   reg  internal_rst_en_2;
   reg  tapcnt_final_1_status;
   reg  tapcnt_final_2_status;
   //OPT-END

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
       clkalign_curr_state   <= CLKALIGN_INIT_ST;
      end
      else if (internal_rst_en) begin //High Priority for RESET Training
       clkalign_curr_state   <= CLKALIGN_INIT_ST;
      end
      else if ((RX_CLK_ALIGN_HOLD == 1'b1) && (ICB_CLK_ALGN_HOLD_TRNG == 1'b1)) begin
         clkalign_curr_state   <= CLKALIGN_HOLD_ST;
      end
      else if ((clkalign_curr_state == CLKALIGN_HOLD_ST) && (RX_CLK_ALIGN_HOLD == 1'b0)) begin
         clkalign_curr_state   <= clkalign_hold_state;
      end	      
      else begin
      case(clkalign_curr_state)

        CLKALIGN_HOLD_ST: begin
              clkalign_curr_state <= CLKALIGN_HOLD_ST;
        end

        CLKALIGN_INIT_ST: begin
           if (start_trng_fg) begin
              clkalign_curr_state       <= CLKALIGN_RESE_ST;
	   end    
           else
              clkalign_curr_state <= CLKALIGN_INIT_ST;
        end

        CLKALIGN_RESE_ST: begin
           if (cnt_done) begin
              clkalign_curr_state <= CLKALIGN_RESW_ST;
           end   
	   else begin
              clkalign_curr_state <= CLKALIGN_RESE_ST;
           end 		   
        end	      
      
        CLKALIGN_RESW_ST: begin
           if (wait_cnt == 'd0)
              clkalign_curr_state <= CLKALIGN_START_ST;
           else
              clkalign_curr_state <= CLKALIGN_RESW_ST;
        end

        CLKALIGN_START_ST: begin
           if (cnt_done) begin
              clkalign_curr_state       <= CLKALIGN_LOAD_ST;
           end   
           else begin 
            clkalign_curr_state   	<= CLKALIGN_START_ST;
           end
        end

        // Load the initial values for the tap delays within the 
        // read delay line
        CLKALIGN_LOAD_ST: begin
           if (cnt_done) begin
            clkalign_curr_state   <=CLKALIGN_EM_ST;
           end 
           else begin 
            clkalign_curr_state   <=CLKALIGN_LOAD_ST;
           end
        end
        // Clear the IOD DEM flags after every increment 
        // of the tap read delay
        CLKALIGN_CLRFLAGS_ST: begin
           if (cnt_done) begin
            clkalign_curr_state <=CLKALIGN_EM_ST;
           end else begin
            clkalign_curr_state <=CLKALIGN_CLRFLAGS_ST;
           end
        end
        // Wait for delay count till the tap delay values 
        // take effect.
        CLKALIGN_EM_ST: begin
	   if(wait_cnt == 'd0) begin
             if(IOD_OOR) begin
               clkalign_curr_state <=CLKALIGN_TAPCALC_ST;
             end
             else begin
               clkalign_curr_state <=CLKALIGN_TAPSTORE_ST;
             end   
           end
           else begin
              clkalign_curr_state <=CLKALIGN_EM_ST;
           end
        end
        // Store the Early/Late flag values for
        // each value of the tap delay
        CLKALIGN_TAPSTORE_ST: begin
           if(IOD_OOR) /*((&tap_cnt) == 1'b1)*/ begin
              clkalign_curr_state <=CLKALIGN_TAPCALC_ST;
           end
           else begin
              clkalign_curr_state <=CLKALIGN_CLRFLAGS_ST;
           end
        end
        // Calculate the delay tap value after all the 
        // flags are stored
        CLKALIGN_TAPCALC_ST: begin
           if (cnt_done) begin
             if(calc_done == 1'b1) begin
	        if (rx_err) begin
                  clkalign_curr_state      <=CLKALIGN_INIT_ST;
	        end else begin
                  clkalign_curr_state      <=CLKALIGN_TAPCMP_ST;
                end		      
             end
	     else begin
               clkalign_curr_state <=CLKALIGN_TAPCALC_STRT_DLY_ST;
             end  
           end else begin
            clkalign_curr_state <=CLKALIGN_TAPCALC_ST;
           end
        end
        // Compare the calculated tap values with the
        CLKALIGN_TAPCMP_ST: begin
           if (cnt_done) begin
             if(tapcnt_final[BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0] == tap_cnt) begin
                clkalign_curr_state <=CLKALIGN_VALID_TAP_WAIT_ST1;
             end
             else begin
                clkalign_curr_state  <=CLKALIGN_TAPCMP2_ST;
             end
           end else begin
              clkalign_curr_state <=CLKALIGN_TAPCMP_ST;
           end
        end
        // Compare the calculated tap values with the
        CLKALIGN_TAPCMP2_ST: begin
           //OPT RX_CLK_ALIGN_MOVE    <= 1'b1;
           if (cnt_done) begin
             clkalign_curr_state <=CLKALIGN_TAPCMP_ST;
           end else begin
             clkalign_curr_state <=CLKALIGN_TAPCMP2_ST;
           end 
        end
        // Calculation done
        CLKALIGN_DONE_ST: begin
	   if (rx_trng_done) begin 
              clkalign_curr_state <=CLKALIGN_TAPCMP_OFFSET_ST;
           end else begin  
              clkalign_curr_state <=CLKALIGN_DONE_ST;
            /*if (re_train) begin 
              clk_align_done  <=1'b0;
              clk_align_start <=1'b1;
            end   
	    else begin
              clk_align_done  <=1'b1;
              clk_align_start <=1'b0;
            end*/   
	   end   
        end

        // Compare the calculated tap values with the
        CLKALIGN_TAPCMP_OFFSET_ST: begin
           if (cnt_done) begin
             if(tapcnt_offset[BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0] == RX_BCLKPHS_OFFSET[BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0]) begin
                clkalign_curr_state <=CLKALIGN_VALID_TAP_WAIT_OFFSET_ST1;
             end
             else begin
                clkalign_curr_state  <=CLKALIGN_TAPCMP2_OFFSET_ST;
             end
           end else begin
              clkalign_curr_state <=CLKALIGN_TAPCMP_OFFSET_ST;
           end
        end
        // Compare the calculated tap values with the
        CLKALIGN_TAPCMP2_OFFSET_ST: begin
           if (cnt_done) begin
             clkalign_curr_state <=CLKALIGN_TAPCMP_OFFSET_ST;
           end else begin
             clkalign_curr_state <=CLKALIGN_TAPCMP2_OFFSET_ST;
           end 
        end

	//Added for MAIN FSM Delay on CALC_DONE
	CLKALIGN_VALID_TAP_WAIT_OFFSET_ST1 : begin
            clkalign_curr_state <= CLKALIGN_VALID_TAP_WAIT_OFFSET_ST2;         
	end

	//Added for MAIN FSM Delay on CALC_DONE
	CLKALIGN_VALID_TAP_WAIT_OFFSET_ST2 : begin
          if(wait_cnt == 'd0) begin
            clkalign_curr_state <= CLKALIGN_PAUSE_ST;         
          end		
	  else begin 		
            clkalign_curr_state <= CLKALIGN_VALID_TAP_WAIT_OFFSET_ST2;         
          end		   
	end

        CLKALIGN_PAUSE_ST: begin
           clkalign_curr_state  <= CLKALIGN_RESE1_ST;
        end

        CLKALIGN_RESE1_ST: begin
           if (cnt_done) begin
              clkalign_curr_state <= CLKALIGN_DONE1_ST;
           end   
	   else begin
              clkalign_curr_state <= CLKALIGN_RESE1_ST;
           end 		   
        end	      

        // NON-sticky DONE 
	CLKALIGN_DONE1_ST: begin
           if (RX_BCLKSCLKALIGN_TRAIN == 1'b0)
              clkalign_curr_state <= CLKALIGN_INIT_ST;
           else begin
              clkalign_curr_state <= CLKALIGN_DONE1_ST;
           end   
        end

	CLKALIGN_TAPCALC_STRT_DLY_ST : begin
             clkalign_curr_state   <= CLKALIGN_TAPCALC_STRT_DLY1_ST;         
	end

	CLKALIGN_INIT_ELY_LTE_DLY_ST : begin
             clkalign_curr_state   <= CLKALIGN_INIT_ELY_LTE_DLY1_ST;         
	end

	CLKALIGN_INIT_NO_ELY_LTE_DLY_ST : begin
             clkalign_curr_state   <= CLKALIGN_INIT_NO_ELY_LTE_DLY1_ST;         
	end

	CLKALIGN_NXT_ELY_LTE_DLY_ST : begin
             clkalign_curr_state   <= CLKALIGN_NXT_ELY_LTE_DLY1_ST;         
	end

	CLKALIGN_TAPCALC_STRT_DLY1_ST : begin
             clkalign_curr_state   <= CLKALIGN_TAPCALC_STRT_DLY2_ST;         
	end

	CLKALIGN_INIT_ELY_LTE_DLY1_ST : begin
             clkalign_curr_state   <= CLKALIGN_INIT_ELY_LTE_DLY2_ST;         
	end

	CLKALIGN_INIT_NO_ELY_LTE_DLY1_ST : begin
             clkalign_curr_state   <= CLKALIGN_INIT_NO_ELY_LTE_DLY2_ST;         
	end

	CLKALIGN_NXT_ELY_LTE_DLY1_ST : begin
             clkalign_curr_state   <= CLKALIGN_NXT_ELY_LTE_DLY2_ST;         
	end

	CLKALIGN_TAPCALC_STRT_DLY2_ST : begin
             clkalign_curr_state   <= CLKALIGN_TAPCALC_STRT_ST;         
	end

	CLKALIGN_INIT_ELY_LTE_DLY2_ST : begin
             clkalign_curr_state   <= CLKALIGN_INIT_ELY_LTE_ST;         
	end

	CLKALIGN_INIT_NO_ELY_LTE_DLY2_ST : begin
             clkalign_curr_state   <= CLKALIGN_INIT_NO_ELY_LTE_ST;         
	end

	CLKALIGN_NXT_ELY_LTE_DLY2_ST : begin
             clkalign_curr_state   <= CLKALIGN_NXT_ELY_LTE_ST;         
	end

	//Follow from No Noisy to Noisy and then Quiet / No Noisy 
	CLKALIGN_TAPCALC_STRT_ST : begin
 	  if(!emflag_cnt_done_d) begin 
           if(early_or_late_found ) begin				    
             clkalign_curr_state   <= CLKALIGN_INIT_ELY_LTE_DLY_ST;         
           end  
           else if(no_early_and_late_found) begin				    
             clkalign_curr_state   <= CLKALIGN_INIT_NO_ELY_LTE_DLY_ST;         
	   end	 
	  end
	  //COV else begin
          //COV    clkalign_curr_state   <= CLKALIGN_VALID_TAP_CHK_DLY_ST;         
	  //COV end
	end

	//Follow from No Noisy to Noisy and then Quiet / No Noisy 
	CLKALIGN_INIT_ELY_LTE_ST : begin
 	  if(!emflag_cnt_done_d) begin
           if(early_or_late_found ) begin				    
             clkalign_curr_state  <= CLKALIGN_INIT_ELY_LTE_DLY_ST;         
           end  
           else if(no_early_and_late_found) begin				    
             clkalign_curr_state   <= CLKALIGN_INIT_NO_ELY_LTE_DLY_ST;         
	   end	 
	  end
	  else begin
             clkalign_curr_state   <= CLKALIGN_VALID_TAP_CHK_DLY_ST;         
	  end
	end

	CLKALIGN_INIT_NO_ELY_LTE_ST : begin
 	  if(!emflag_cnt_done_d) begin
           if(no_early_and_late_found) begin				    
             clkalign_curr_state   <= CLKALIGN_INIT_NO_ELY_LTE_DLY_ST;         
           end  
           else if(early_or_late_found ) begin				    
             clkalign_curr_state   <= CLKALIGN_NXT_ELY_LTE_DLY_ST;         
           end	     
	  end
	  else begin
             clkalign_curr_state   <= CLKALIGN_VALID_TAP_CHK_DLY_ST;         
	  end
	end

	CLKALIGN_NXT_ELY_LTE_ST : begin
 	  if(!emflag_cnt_done_d) begin 
           if(early_or_late_found ) begin				    
             clkalign_curr_state <= CLKALIGN_NXT_ELY_LTE_DLY_ST;  
           end	     
           else if(no_early_and_late_found) begin				    
             clkalign_curr_state   <= CLKALIGN_VALID_TAP_CHK_DLY_ST;         
	   end	 
	  end
	  else begin
             clkalign_curr_state   <= CLKALIGN_VALID_TAP_CHK_DLY_ST;         
	  end
	end

	CLKALIGN_VALID_TAP_CHK_DLY_ST : begin
             clkalign_curr_state  <= CLKALIGN_VALID_TAP_CHK_ST;         
        end  

	CLKALIGN_VALID_TAP_CHK_ST : begin
          if (early_late_start_and_end_set) /*(early_late_start_set && early_late_end_set)*/ begin   //Fine Clock Alignment Solution 
  	     if (tapcnt_final_1_status) begin		     
               clkalign_curr_state  <= CLKALIGN_TAPCALC_STRT_DLY_ST;         
             end else begin 
               clkalign_curr_state  <= CLKALIGN_TAPCALC_ST;         
             end
          end
          else if (early_late_init_and_nxt_set) /*(early_late_init_set && early_late_nxt_set)*/ begin  //Least Clock Alignment Solution 
  	     if (tapcnt_final_2_status) begin		     
               clkalign_curr_state  <= CLKALIGN_TAPCALC_STRT_DLY_ST;         
             end else begin 
               clkalign_curr_state  <= CLKALIGN_TAPCALC_ST;         
             end
          end
	  //Error Condition no TAP Delays Found 
	  else if (emflag_cnt_done_d) /*(&emflag_cnt)*/ begin
             clkalign_curr_state <= CLKALIGN_TAPCALC_ST;         
          end
	  else begin
             clkalign_curr_state    <= CLKALIGN_TAPCALC_STRT_DLY_ST;         
           end		     
        end  

	//Added for MAIN FSM Delay on CALC_DONE
	CLKALIGN_VALID_TAP_WAIT_ST1 : begin
            clkalign_curr_state <= CLKALIGN_VALID_TAP_WAIT_ST2;         
	end

	//Added for MAIN FSM Delay on CALC_DONE	
	CLKALIGN_VALID_TAP_WAIT_ST2 : begin
          if(wait_cnt == 'd0) begin
            clkalign_curr_state <= CLKALIGN_DONE_ST;         
          end		
	  else begin 		
            clkalign_curr_state <= CLKALIGN_VALID_TAP_WAIT_ST2;         
          end		   
	end

        default: begin
           clkalign_curr_state <=CLKALIGN_INIT_ST;
        end
	
      endcase // case (clkalign_curr_state)      
      end
   end // always @ (*)

   // Wait counter
   // Wait for delay count till the tap delay values 
   // take effect.
   always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0) begin
         wait_cnt <= {BCLKSCLK_ICB_TAP_WAIT_CNT_WIDTH{1'b1}};
      end
      /*else if (internal_rst_en) begin
         wait_cnt <= {BCLKSCLK_ICB_TAP_WAIT_CNT_WIDTH{1'b1}}; //'h7;
      end*/
      else begin
         if((clkalign_curr_state == CLKALIGN_VALID_TAP_WAIT_OFFSET_ST1) || (clkalign_curr_state == CLKALIGN_VALID_TAP_WAIT_ST1) || (clkalign_curr_state == CLKALIGN_CLRFLAGS_ST) || (clkalign_curr_state == CLKALIGN_RESE_ST )) begin
            wait_cnt <= {BCLKSCLK_ICB_TAP_WAIT_CNT_WIDTH{1'b1}}; //'h7;
         end
         else if((clkalign_curr_state == CLKALIGN_VALID_TAP_WAIT_OFFSET_ST2) || (clkalign_curr_state == CLKALIGN_VALID_TAP_WAIT_ST2) || (clkalign_curr_state == CLKALIGN_EM_ST) || (clkalign_curr_state == CLKALIGN_RESW_ST)) begin
            wait_cnt <= wait_cnt - 'h1;
         end
      end
   end

   assign RX_CLK_ALIGN_DIR       = 1'b1;
   
   //Added for continous Re-training window detection 
   assign timeout_fg 	  	= (&timeout_cnt);
   //positive Edge det on Restart training signal
   assign Restart_trng_edge_det = (!restart_reg[2] & restart_reg[1]);
   assign restart_trng_fg       = |restart_edge_reg; //Stretch the Restart pulse
  
   //OPT - START

   assign cnt_done                      = (cnt == 2'b11) ? 1'b1 : 1'b0; 
   assign emflag_cnt_done               = (emflag_cnt == (BCLKSCLK_ICB_TAP_CNT-1)); /*(!(&emflag_cnt)) ? 1'b1 : 1'b0;*/
   assign emflag_cnt_lsb                = (emflag_cnt <= ((BCLKSCLK_ICB_TAP_CNT/2)-1));
   //assign emflag_cnt_msb                = (emflag_cnt > ((BCLKSCLK_ICB_TAP_CNT/2)-1));

   assign emflag_cnt_dec                = emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0];

   assign early_found_lsb               = (early_flags_lsb[emflag_cnt_dec/*emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0]*/] == 1'b1); 
   assign late_found_lsb                = (late_flags_lsb[emflag_cnt_dec/*emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0]*/] == 1'b1);
   assign early_not_found_lsb           = !early_found_lsb;
   assign late_not_found_lsb            = !late_found_lsb;

   assign early_found_msb               = (early_flags_msb[emflag_cnt_dec/*emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0]*/] == 1'b1); 
   assign late_found_msb                = (late_flags_msb[emflag_cnt_dec/*emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0]*/] == 1'b1);
   assign early_not_found_msb           = !early_found_msb;
   assign late_not_found_msb            = !late_found_msb;

   /*((early_flags_lsb[emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0]] == 1'b1) || (late_flags_lsb[emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0]] == 1'b1)) ? 1'b1 : 1'b0;*/
   assign early_or_late_found_lsb       =  (early_found_lsb_d | late_found_lsb_d); 
   /*((early_flags_lsb[emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0]] == 1'b0) && (late_flags_lsb[emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0]] == 1'b0)) ? 1'b1 : 1'b0;*/
   assign no_early_and_late_found_lsb   =  (early_not_found_lsb_d & late_not_found_lsb_d); 

   /*((early_flags_msb[emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0]] == 1'b1) || (late_flags_msb[emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0]] == 1'b1)) ? 1'b1 : 1'b0;*/
   assign early_or_late_found_msb       = (early_found_msb_d | late_found_msb_d); 
   /*((early_flags_msb[emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0]] == 1'b0) && (late_flags_msb[emflag_cnt[BCLKSCLK_ICB_TAP_CNT_WIDTH-2:0]] == 1'b0)) ? 1'b1 : 1'b0;*/
   assign no_early_and_late_found_msb   = (early_not_found_msb_d & late_not_found_msb_d); 

   assign early_or_late_found           = emflag_cnt_lsb ?  early_or_late_found_lsb_d     : early_or_late_found_msb_d;
   assign no_early_and_late_found       = emflag_cnt_lsb ?  no_early_and_late_found_lsb_d : no_early_and_late_found_msb_d;

   always @(posedge SCLK or negedge RESETN) 
      if(RESETN == 1'b0)
	internal_rst_en <= 1'b0;
      else if  (internal_rst_en_1 | internal_rst_en_2)
	internal_rst_en <= 1'b1;
      else
	internal_rst_en <= 1'b0;

   always @(posedge SCLK or negedge RESETN) 
      if(RESETN == 1'b0)
	internal_rst_en_1 <= 1'b0;
      else if (restart_trng_fg)
	internal_rst_en_1 <= 1'b1;
      else
	internal_rst_en_1 <= 1'b0;

   always @(posedge SCLK or negedge RESETN) 
      if(RESETN == 1'b0)
	internal_rst_en_2 <= 1'b0;
      else if (skip_trng_reg[2])
	internal_rst_en_2 <= 1'b1;
      else
	internal_rst_en_2 <= 1'b0;

   always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0) begin
       early_found_lsb_d     <= 1'b0; 	      
       late_found_lsb_d      <= 1'b0; 	      
       early_not_found_lsb_d <= 1'b0; 	      
       late_not_found_lsb_d  <= 1'b0;
      end /*else if (internal_rst_en) begin
       early_found_lsb_d     <= 1'b0; 	      
       late_found_lsb_d      <= 1'b0; 	      
       early_not_found_lsb_d <= 1'b0; 	      
       late_not_found_lsb_d  <= 1'b0; 	      
      end*/ else begin
       early_found_lsb_d     <= early_found_lsb; 	      
       late_found_lsb_d      <= late_found_lsb; 	      
       early_not_found_lsb_d <= early_not_found_lsb; 	      
       late_not_found_lsb_d  <= late_not_found_lsb; 	      
      end
   end

   always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0) begin
       early_found_msb_d     <= 1'b0; 	      
       late_found_msb_d      <= 1'b0; 	      
       early_not_found_msb_d <= 1'b0; 	      
       late_not_found_msb_d  <= 1'b0; 	      
      end /*else if (internal_rst_en) begin
       early_found_msb_d     <= 1'b0; 	      
       late_found_msb_d      <= 1'b0; 	      
       early_not_found_msb_d <= 1'b0; 	      
       late_not_found_msb_d  <= 1'b0; 	      
      end*/ else begin
       early_found_msb_d     <= early_found_msb; 	      
       late_found_msb_d      <= late_found_msb; 	      
       early_not_found_msb_d <= early_not_found_msb; 	      
       late_not_found_msb_d  <= late_not_found_msb; 	      
      end
   end

  always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0) begin
       early_or_late_found_lsb_d     <= 1'b0;
       no_early_and_late_found_lsb_d <= 1'b0;       
       early_or_late_found_msb_d     <= 1'b0;
       no_early_and_late_found_msb_d <= 1'b0;       
      end /*else if (internal_rst_en) begin
       early_or_late_found_lsb_d     <= 1'b0;
       no_early_and_late_found_lsb_d <= 1'b0;       
       early_or_late_found_msb_d     <= 1'b0;
       no_early_and_late_found_msb_d <= 1'b0;       
      end*/ else begin
       early_or_late_found_lsb_d     <= early_or_late_found_lsb;
       no_early_and_late_found_lsb_d <= no_early_and_late_found_lsb;       
       early_or_late_found_msb_d     <= early_or_late_found_msb;
       no_early_and_late_found_msb_d <= no_early_and_late_found_msb;       
      end
   end

   always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0) begin
        emflag_cnt_done_d        <= 1'b0;	
      end /* else if (internal_rst_en) begin
       emflag_cnt_done_d         <= 1'b0;	
      end*/ else begin
        emflag_cnt_done_d        <= emflag_cnt_done;	
      end
   end

   assign tapcnt_final_1 = sig_tapcnt_final_1[BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0];

   always @(posedge SCLK or negedge RESETN) begin
     if(RESETN == 1'b0) begin
       sig_tapcnt_final_1 <= 'd0;  
       tapcnt_final_1_status <= 'd0;  
     end 
     /*else if (internal_rst_en) begin
       sig_tapcnt_final_1 <= 'd0;  
     end*/ 
     else if (early_late_end_val == 'd0) begin
       sig_tapcnt_final_1 <= 'd0;  
       tapcnt_final_1_status <= 'd1;  
     end
     /* WINDOW else if ((early_late_end_val - early_late_start_val) < WINDOW_SIZE) begin
       sig_tapcnt_final_1 <= 'd0;  
       tapcnt_final_1_status <= 'd1;  
     end */
     else begin
       sig_tapcnt_final_1 <= (early_late_start_val + early_late_end_val) >> 1;  
       tapcnt_final_1_status <= 'd0;  
    end
   end

   assign tapcnt_final_2 = sig_tapcnt_final_2[BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0];

   always @(posedge SCLK or negedge RESETN) begin
     if(RESETN == 1'b0) begin
       sig_tapcnt_final_2 <= 'd0;  
       tapcnt_final_2_status <= 'd0;  
     end 
     /*else if (internal_rst_en) begin
       sig_tapcnt_final_2 <= 'd0;  
     end*/ 
     else if (early_late_nxt_val == 'd0) begin
       sig_tapcnt_final_2 <= 'd0;  
       tapcnt_final_2_status <= 'd1;  
     end
     /* WINDOW else if ((early_late_nxt_val - early_late_init_val) < WINDOW_SIZE) begin
       sig_tapcnt_final_2 <= 'd0;  
       tapcnt_final_2_status <= 'd1;  
     end */
     else begin
       sig_tapcnt_final_2 <= (early_late_init_val  + early_late_nxt_val) >> 1;  
       tapcnt_final_2_status <= 'd0;  
    end
   end

   always@(posedge SCLK or negedge RESETN)
      if(!RESETN)
        early_late_start_and_end_set <= 1'b0;
      else if (early_late_start_set && early_late_end_set)
        early_late_start_and_end_set <= 1'b1;
      else 
        early_late_start_and_end_set <= 1'b0;

   always@(posedge SCLK or negedge RESETN)
      if(!RESETN)
        early_late_init_and_nxt_set <= 1'b0;
      else if (early_late_init_set && early_late_nxt_set)
        early_late_init_and_nxt_set <= 1'b1;
      else 
        early_late_init_and_nxt_set <= 1'b0;

   always@(posedge SCLK or negedge RESETN)
      if(!RESETN)
        early_late_start_end_val_status <= 1'b0;
      else if(early_late_start_val < early_late_end_val)
        early_late_start_end_val_status <= 1'b1;
      else 
        early_late_start_end_val_status <= 1'b0;

   always@(posedge SCLK or negedge RESETN)
      if(!RESETN)
        early_late_init_nxt_val_status <= 1'b0;
      else if(early_late_init_val < early_late_nxt_val)
        early_late_init_nxt_val_status <= 1'b1;
      else 
        early_late_init_nxt_val_status <= 1'b0;

   always@(posedge SCLK or negedge RESETN)
      if(!RESETN)
        RX_CLK_ALIGN_TAPDLY  <= 'h0;
      else 
        RX_CLK_ALIGN_TAPDLY  <= (tapcnt_final[BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0] + tapcnt_offset[BCLKSCLK_ICB_TAP_CNT_WIDTH-1:0]); 

  always@(posedge SCLK or negedge RESETN)
      if(!RESETN)
        RX_CLK_ALIGN_ERR  <= 'h0;
      else if (timeout_fg)
        RX_CLK_ALIGN_ERR  <= 1'b1; 
      else 
        RX_CLK_ALIGN_ERR  <= 1'b0; 

  always@(posedge SCLK or negedge RESETN)
      if(!RESETN)
        RX_CLK_ALIGN_START  <= 'h0;
      else if (timeout_fg)
        RX_CLK_ALIGN_START  <= 1'b0; 
      else if (clk_align_start)
        RX_CLK_ALIGN_START  <= 1'b1; 
      else
        RX_CLK_ALIGN_START  <= 1'b0; 

  always@(posedge SCLK or negedge RESETN)
      if(!RESETN)
        RX_CLK_ALIGN_DONE  <= 'h0;
      else if (clk_align_done | timeout_fg | skip_trng_reg[2])
        RX_CLK_ALIGN_DONE  <= 1'b1; 
      else
        RX_CLK_ALIGN_DONE  <= 1'b0; 

   wire start_trng_fg_valid;
   wire rx_rst;
   assign start_trng_fg_valid = ((clkalign_curr_state == CLKALIGN_INIT_ST) && start_trng_fg);
   assign rx_rst              = ((rx_err && (clkalign_curr_state == CLKALIGN_TAPCALC_ST) && cnt_done && calc_done) || (clkalign_curr_state == CLKALIGN_TAPCALC_STRT_ST));

   always @(posedge SCLK or negedge RESETN)
      if(RESETN == 1'b0)
       RX_RESET_LANE            <= 1'b0; 
      /* TIM else if (internal_rst_en)
       RX_RESET_LANE            <= 1'b0; */
      else if (start_trng_fg_valid || (clkalign_curr_state == CLKALIGN_PAUSE_ST))
       RX_RESET_LANE            <= 1'b1; 
      else if (cnt_done && ((clkalign_curr_state == CLKALIGN_RESE_ST) || (clkalign_curr_state == CLKALIGN_RESE1_ST)))
       RX_RESET_LANE            <= 1'b0; 

   always @(posedge SCLK or negedge RESETN)
      if(RESETN == 1'b0)
       RX_CLK_ALIGN_LOAD     <=1'b0;
      /* TIM else if (internal_rst_en)
       RX_CLK_ALIGN_LOAD     <=1'b0; */
      /* TIM else if (start_trng_fg_valid)
       RX_CLK_ALIGN_LOAD     <=1'b0; */
      else if (cnt_done && ((clkalign_curr_state == CLKALIGN_START_ST) || (calc_done && (!rx_err) && (clkalign_curr_state == CLKALIGN_TAPCALC_ST))))
       RX_CLK_ALIGN_LOAD     <=1'b1;
      else if (cnt_done && ((clkalign_curr_state == CLKALIGN_LOAD_ST) || (clkalign_curr_state == CLKALIGN_EM_ST) || (clkalign_curr_state == CLKALIGN_TAPCMP_ST) || (clkalign_curr_state == CLKALIGN_TAPCMP_OFFSET_ST) ))
       RX_CLK_ALIGN_LOAD     <=1'b0;

   always @(posedge SCLK or negedge RESETN)
      if(RESETN == 1'b0)
       RX_CLK_ALIGN_CLR_FLGS     <=1'b0;
      /* TIM else if (internal_rst_en)
       RX_CLK_ALIGN_CLR_FLGS     <=1'b0; */
      /* TIM else if (start_trng_fg_valid)
       RX_CLK_ALIGN_CLR_FLGS     <=1'b0; */
      else if ((IOD_OOR) && (clkalign_curr_state == CLKALIGN_TAPSTORE_ST))
       RX_CLK_ALIGN_CLR_FLGS     <=1'b1;
      else if (cnt_done && calc_done && (!rx_err) && (clkalign_curr_state == CLKALIGN_TAPCALC_ST)) 
       RX_CLK_ALIGN_CLR_FLGS     <=1'b1;
      else if (cnt_done && ((clkalign_curr_state == CLKALIGN_START_ST)   || (clkalign_curr_state == CLKALIGN_CLRFLAGS_ST)           || 
                            (clkalign_curr_state == CLKALIGN_TAPCMP2_ST) || (clkalign_curr_state == CLKALIGN_TAPCMP2_OFFSET_ST)  )) 
       RX_CLK_ALIGN_CLR_FLGS     <=1'b1;
      else if (cnt_done && ((clkalign_curr_state == CLKALIGN_LOAD_ST)   || (clkalign_curr_state == CLKALIGN_EM_ST) || (clkalign_curr_state == CLKALIGN_TAPCALC_ST) || 
	                    (clkalign_curr_state == CLKALIGN_TAPCMP_ST) || (clkalign_curr_state == CLKALIGN_TAPCMP_OFFSET_ST) ))
       RX_CLK_ALIGN_CLR_FLGS     <=1'b0;

   always @(posedge SCLK or negedge RESETN)
      if(RESETN == 1'b0)
       RX_CLK_ALIGN_MOVE     <=1'b0;
      /* TIM else if (internal_rst_en)
       RX_CLK_ALIGN_MOVE     <=1'b0; */
      /* TIM else if (start_trng_fg_valid)
       RX_CLK_ALIGN_MOVE     <=1'b0; */
      else if ((!IOD_OOR) && (clkalign_curr_state == CLKALIGN_TAPSTORE_ST))
       RX_CLK_ALIGN_MOVE     <=1'b1;
      else if (cnt_done && ((clkalign_curr_state == CLKALIGN_CLRFLAGS_ST)      || (clkalign_curr_state == CLKALIGN_TAPCMP_ST) || (clkalign_curr_state == CLKALIGN_TAPCMP2_ST) || 
	                    (clkalign_curr_state == CLKALIGN_TAPCMP_OFFSET_ST) || (clkalign_curr_state == CLKALIGN_TAPCMP2_OFFSET_ST) ))  
       RX_CLK_ALIGN_MOVE     <=1'b0;
      else if ((clkalign_curr_state == CLKALIGN_TAPCMP2_ST) || (clkalign_curr_state == CLKALIGN_TAPCMP2_OFFSET_ST))
       RX_CLK_ALIGN_MOVE     <=1'b1;

   always @(posedge SCLK or negedge RESETN)
      if(RESETN == 1'b0)
       timeout_cnt     <= 'h0;
      else if (internal_rst_en)
       timeout_cnt     <= 'h0;
      else if (emflag_cnt_done_d && (clkalign_curr_state == CLKALIGN_VALID_TAP_CHK_ST) && (!early_late_start_and_end_set) && (!early_late_init_and_nxt_set))
       timeout_cnt     <= timeout_cnt + 'd1;
	     
   always @(posedge SCLK or negedge RESETN)
      if(RESETN == 1'b0)
       rx_err     <=1'b0;
      else if (internal_rst_en)
       rx_err     <=1'b0;
      else if (start_trng_fg_valid)
       rx_err     <=1'b0;
      else if (rx_rst)
       rx_err     <=1'b0;
      else if (clkalign_curr_state == CLKALIGN_VALID_TAP_CHK_ST) begin
       if (emflag_cnt_done_d && (!early_late_start_and_end_set) && (!early_late_init_and_nxt_set))
        rx_err     <=1'b1;
       else 
        rx_err     <=1'b0;
      end	      

   always @(posedge SCLK or negedge RESETN)
      if(RESETN == 1'b0)
       calc_done     <=1'b0;
      else if (internal_rst_en)
       calc_done     <=1'b0; 
      else if (start_trng_fg_valid)
       calc_done     <=1'b0; 
      else if (rx_rst)
       calc_done     <=1'b0;
      else if (clkalign_curr_state == CLKALIGN_VALID_TAP_CHK_ST) begin
       if ((early_late_start_and_end_set && (!tapcnt_final_1_status)) || (early_late_init_and_nxt_set && (!tapcnt_final_2_status)) || (emflag_cnt_done_d)) 
        calc_done     <=1'b1;
       else
        calc_done     <=1'b0;
      end 

   always @(posedge SCLK or negedge RESETN)
      if(RESETN == 1'b0)
       tap_cnt     <= 'h0;
      /* TIM else if (internal_rst_en)
       tap_cnt     <= 'h0; */
      /* TIM else if (start_trng_fg_valid)
       tap_cnt     <= 'h0; */
      else if (cnt_done && ((clkalign_curr_state == CLKALIGN_LOAD_ST) || (clkalign_curr_state == CLKALIGN_TAPCALC_ST)) )
       tap_cnt     <= 'h0;
      else if (((clkalign_curr_state == CLKALIGN_TAPSTORE_ST) && (!IOD_OOR)) || (cnt_done && (clkalign_curr_state == CLKALIGN_TAPCMP2_ST)) )
       tap_cnt     <= tap_cnt + 'd1;

   always @(posedge SCLK or negedge RESETN)
      if(RESETN == 1'b0)
       tapcnt_final     <= 'h0;
      /* TIM else if (internal_rst_en)
       tapcnt_final     <= 'h0; */
      else if (start_trng_fg_valid)
       tapcnt_final     <= 'h0;
      else if (clkalign_curr_state == CLKALIGN_VALID_TAP_CHK_DLY_ST)
       tapcnt_final     <= 'h0;
      else if (clkalign_curr_state == CLKALIGN_VALID_TAP_CHK_ST) begin
       if (early_late_start_and_end_set && (!tapcnt_final_1_status))begin
         if (early_late_start_end_val_status) begin
            tapcnt_final <= tapcnt_final_1;
         end else begin
            tapcnt_final <= early_late_start_val;
         end 	 
       end
       else if (early_late_init_and_nxt_set && (!tapcnt_final_2_status)) begin
         if (early_late_init_nxt_val_status) begin
            tapcnt_final <= tapcnt_final_2;
         end else begin
            tapcnt_final <= early_late_init_val;
         end	
       end
       else if (emflag_cnt_done_d) begin
           tapcnt_final           <= 'h0;  
       end
       else begin
           tapcnt_final           <= 'h0;  
       end		     
      end  

   always @(posedge SCLK or negedge RESETN)
      if(RESETN == 1'b0)
       tapcnt_offset     <= 'h0;
      /* TIM else if (internal_rst_en)
       tapcnt_offset     <= 'h0; */
      else if (clkalign_curr_state == CLKALIGN_TAPCALC_ST) /* TIM (start_trng_fg_valid) */
       tapcnt_offset     <= 'h0;     
      else if (cnt_done && (clkalign_curr_state == CLKALIGN_TAPCMP2_OFFSET_ST))
       tapcnt_offset <= tapcnt_offset + 'd1;
      else if (clkalign_curr_state == CLKALIGN_VALID_TAP_CHK_ST) begin
       if (emflag_cnt_done_d && (!early_late_start_and_end_set) && (!early_late_init_and_nxt_set))
        tapcnt_offset     <= 'h0;     
       else 
        tapcnt_offset     <= 'h0;     
      end	      

   always @(posedge SCLK or negedge RESETN)
      if(RESETN == 1'b0)
       emflag_cnt     <= 'h0;
      /* TIM else if (internal_rst_en)
       emflag_cnt     <= 'h0; */
      //else if (start_trng_fg_valid)
      else if (clkalign_curr_state == CLKALIGN_TAPCALC_ST) /* TIM (start_trng_fg_valid) */
       emflag_cnt     <= 'h0;     
      else if ((!emflag_cnt_done_d) && ( (clkalign_curr_state == CLKALIGN_TAPCALC_STRT_ST)    || (clkalign_curr_state == CLKALIGN_INIT_ELY_LTE_ST) || 
	                                 (clkalign_curr_state == CLKALIGN_INIT_NO_ELY_LTE_ST) || (clkalign_curr_state == CLKALIGN_NXT_ELY_LTE_ST) ) )
       emflag_cnt     <= emflag_cnt + 'd1;
      else if ((clkalign_curr_state == CLKALIGN_VALID_TAP_CHK_ST) && (emflag_cnt_done_d && (!early_late_start_and_end_set) && (!early_late_init_and_nxt_set)))
       emflag_cnt     <= 'h0;

   always @(posedge SCLK or negedge RESETN)
      if(RESETN == 1'b0)
       rx_trng_done     <= 1'b0;
      /* TIM else if (internal_rst_en) 
       rx_trng_done     <= 1'b0; */
      else if (clkalign_curr_state == CLKALIGN_TAPCALC_ST) /* TIM (start_trng_fg_valid) */
       rx_trng_done     <= 1'b0;     
      else if (clkalign_curr_state == CLKALIGN_VALID_TAP_WAIT_ST2) begin
       if (wait_cnt == 'd0)	       
        rx_trng_done     <= 1'b1;     
       else
        rx_trng_done     <= 1'b0;     
      end	      

  always @(posedge SCLK or negedge RESETN)
     if(RESETN == 1'b0) begin
       early_late_init_set   <= 1'b0;
       early_late_init_val   <= 'h0;
     /* TIM end else if (internal_rst_en) begin
       early_late_init_set   <= 1'b0;
       early_late_init_val   <= 'h0; */
     end else if (clkalign_curr_state == CLKALIGN_TAPCALC_ST) begin /* TIM (start_trng_fg_valid) */
       early_late_init_set   <= 1'b0;
       early_late_init_val   <= 'h0;
     end else if ((!emflag_cnt_done_d) && (clkalign_curr_state == CLKALIGN_TAPCALC_STRT_ST) && early_or_late_found) begin
       early_late_init_set   <= 1'b1;
       early_late_init_val   <= emflag_cnt;
     end	  

  always @(posedge SCLK or negedge RESETN)
     if(RESETN == 1'b0) begin
       early_late_nxt_set   <= 1'b0;
       early_late_nxt_val   <= 'h0;
     /* TIM end else if (internal_rst_en) begin
       early_late_nxt_set   <= 1'b0;
       early_late_nxt_val   <= 'h0; */
     end else if (clkalign_curr_state == CLKALIGN_TAPCALC_ST) begin /* TIM (start_trng_fg_valid) */
       early_late_nxt_set   <= 1'b0;
       early_late_nxt_val   <= 'h0;
     end else if (clkalign_curr_state == CLKALIGN_INIT_ELY_LTE_ST) begin
       if (!emflag_cnt_done_d) begin
        if (early_or_late_found) begin
          early_late_nxt_set   <= 1'b1;
          early_late_nxt_val   <= emflag_cnt;
        end 
	else if (no_early_and_late_found) begin 
          early_late_nxt_set   <= 1'b1;
        end   	  
       end else begin
          early_late_nxt_set   <= 1'b1;
       end
     end

  always @(posedge SCLK or negedge RESETN)
     if(RESETN == 1'b0) begin
       early_late_start_set   <= 1'b0;
       early_late_start_val   <= 'h0;
     /* TIM end else if (internal_rst_en) begin
       early_late_start_set   <= 1'b0;
       early_late_start_val   <= 'h0; */
     end else if (clkalign_curr_state == CLKALIGN_TAPCALC_ST) begin /* TIM (start_trng_fg_valid) */
       early_late_start_set   <= 1'b0;
       early_late_start_val   <= 'h0;
     end else if ((clkalign_curr_state == CLKALIGN_INIT_NO_ELY_LTE_ST) && (!emflag_cnt_done_d) && (early_or_late_found)) begin
       early_late_start_set   <= 1'b1;
       early_late_start_val   <= emflag_cnt;
     end 

  always @(posedge SCLK or negedge RESETN)
     if(RESETN == 1'b0) begin
       early_late_end_set   <= 1'b0;
       early_late_end_val   <= 'h0;
     /* TIM end else if (internal_rst_en) begin
       early_late_end_set   <= 1'b0;
       early_late_end_val   <= 'h0; */
     end else if (clkalign_curr_state == CLKALIGN_TAPCALC_ST) begin /* TIM (start_trng_fg_valid) */
       early_late_end_set   <= 1'b0;
       early_late_end_val   <= 'h0;
     end else if (clkalign_curr_state == CLKALIGN_NXT_ELY_LTE_ST) begin
       if (!emflag_cnt_done_d) begin
        if (early_or_late_found) begin
          early_late_end_set   <= 1'b1;
          early_late_end_val   <= emflag_cnt;
        end 
        else if (no_early_and_late_found) 
          early_late_end_set   <= 1'b1;
       end else begin
          early_late_end_set   <= 1'b1;
       end
     end

   always@(posedge SCLK or negedge RESETN)
      if(!RESETN) begin
       clk_align_start          <= 1'b0;
       clk_align_done           <= 1'b0;
      end 
      else if (internal_rst_en) begin //High Priority for RESET Training
       clk_align_start          <= 1'b0;
       clk_align_done           <= 1'b0;
      end 
      else if ((RX_BCLKSCLKALIGN_TRAIN == 1'b1) && (clkalign_curr_state == CLKALIGN_DONE1_ST)) begin
       clk_align_start          <= 1'b0;
       clk_align_done           <= 1'b1;
      end 
      else if (start_trng_fg_valid) begin
       clk_align_start          <= 1'b1;
       clk_align_done           <= 1'b0;
      end 

   always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0) begin
       early_flags_lsb          <= 'h0;
       early_flags_msb          <= 'h0;
       late_flags_lsb           <= 'h0;
       late_flags_msb           <= 'h0;
      end
      /* TIM else if (internal_rst_en) begin //High Priority for RESET Training
       early_flags_lsb          <= 'h0;
       early_flags_msb          <= 'h0;
       late_flags_lsb           <= 'h0;
       late_flags_msb           <= 'h0;
      end */
      else if (cnt_done && (clkalign_curr_state == CLKALIGN_LOAD_ST) /* TIM start_trng_fg_valid */) begin
       early_flags_lsb          <= 'h0;
       early_flags_msb          <= 'h0;
       late_flags_lsb           <= 'h0;
       late_flags_msb           <= 'h0;
      end
      else if ((clkalign_curr_state == CLKALIGN_TAPSTORE_ST) && (!IOD_OOR)) begin
	if (tap_cnt <= ((BCLKSCLK_ICB_TAP_CNT/2)-1)) begin
	   early_flags_lsb <= {IOD_EARLY,early_flags_lsb[((BCLKSCLK_ICB_TAP_CNT/2)-1):1]};
           late_flags_lsb  <= {IOD_LATE ,late_flags_lsb [((BCLKSCLK_ICB_TAP_CNT/2)-1):1]};
        end else begin
  	   early_flags_msb <= {IOD_EARLY,early_flags_msb[((BCLKSCLK_ICB_TAP_CNT/2)-1):1]};
           late_flags_msb  <= {IOD_LATE ,late_flags_msb [((BCLKSCLK_ICB_TAP_CNT/2)-1):1]};
        end 
      end	      
   end      
	      
   always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0)
        start_trng_fg <= 1'b0;
      else if (/* TIM rx_trng_done |*/ timeout_fg)
        start_trng_fg <= 1'b0;
      else if (reset_dly_fg && RX_BCLKSCLKALIGN_TRAIN)
        start_trng_fg <= 1'b1;
      else 
        start_trng_fg <= 1'b0; /* TIM */
   end 

   always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0) begin
       clkalign_hold_state   <= CLKALIGN_INIT_ST;         
      end
      /* TIM else if (internal_rst_en) begin //High Priority for RESET Training
       clkalign_hold_state   <= CLKALIGN_INIT_ST;         
      end*/ 
      else if (/* OPT (!rx_CLK_ALGN_HOLD_flag) && */ (RX_CLK_ALIGN_HOLD == 1'b1) && (ICB_CLK_ALGN_HOLD_TRNG == 1'b1)) begin
         clkalign_hold_state   <= clkalign_curr_state; 
         // OPT rx_CLK_ALGN_HOLD_flag <= 1'b1; 
      end
      else if (/* OPT (rx_CLK_ALGN_HOLD_flag) && */ (clkalign_curr_state == CLKALIGN_HOLD_ST) && (RX_CLK_ALIGN_HOLD == 1'b0)) begin
         // OPT rx_CLK_ALGN_HOLD_flag <= 1'b0; 
         clkalign_hold_state   <= CLKALIGN_INIT_ST;         
      end	      
   end       

   //OPT - END
   
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

   //Synchronise RESTART_TRNG Signal with SCLK
   always@(posedge SCLK or negedge RESETN) begin
      if(!RESETN)begin
        restart_reg <= 3'b000;
        restart_edge_reg <= 4'b0000;
      end else begin
        restart_reg <= {restart_reg[1:0],RX_CLK_ALIGN_RSTRT};
        restart_edge_reg <= {restart_edge_reg[2:0],Restart_trng_edge_det};     
      end
   end

   // SKIP_TRNG SYNCHRONIZER //
   always@(posedge SCLK or negedge RESETN) begin
      if(!RESETN) begin
        skip_trng_reg <= 0;
      end else if (ICB_CLK_ALGN_SKIP_TRNG) begin
        skip_trng_reg <= {skip_trng_reg[1:0],RX_CLK_ALIGN_SKIP};
      end     
   end

   //Synchronise Re_train bit with SCLK
   /*always@(posedge SCLK or negedge RESETN) begin
      if(!RESETN)begin
        retrain_reg <= 3'b000;
      end else begin
        retrain_reg <= {retrain_reg[1:0],re_train};
      end
   end*/

   // Counter for IOD signal assertion 
   always@(posedge SCLK or negedge RESETN) begin
      if(!RESETN)begin
        cnt <= 2'b00;
      end else begin
        cnt <= cnt + 2'b01;
      end
   end

endmodule // ICB_BCLKSCLKALIGN
