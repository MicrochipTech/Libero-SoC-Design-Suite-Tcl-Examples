`timescale 1ps / 1ps
module CoreTxIOD(
	          //Sys Clk , Async Rst
                  input SCLK,              
                  input RESETN,            
                  input PLL_LOCK,            

		  // BIT Align status IN and OUT signals 
		  output TX_IOD_DELAY_START,
		  output TX_IOD_DELAY_DONE,
		  input  TX_IOD_RSTRT,
		  input  TX_IOD_HOLD,

                  // IOD Controller OUT signals       
                  output TX_IOD_CLR_FLGS,
                  output TX_IOD_DELAY_LINE_LOAD,
                  output TX_IOD_DELAY_LINE_DIRECTION,
                  output TX_IOD_DELAY_LINE_MOVE,
                  input  [2:0] TX_IOD_EYE_IN
                  );

   // --------------------------------------------------------------------------
   // PARAMETER Declaration
   // --------------------------------------------------------------------------
   parameter SKIP_TRNG     = 0;     //0 - Perform training,  1 - No training is done
   parameter HOLD_TRNG 	   = 0;     //0 - Continue training, 1 - Hold training
   parameter TX_IOD_TAPS_DELAY = 0;

   localparam TXIOD_IDLE_ST        = 4'b0000;
   localparam TXIOD_LOAD_ST        = 4'b0001;
   localparam TXIOD_CLRFLAGS_ST    = 4'b0010;
   localparam TXIOD_EM_ST          = 4'b0011;
   localparam TXIOD_TAPSTORE_ST    = 4'b0100;
   localparam TXIOD_DONE_ST        = 4'b0101;
   localparam TXIOD_HOLD_ST        = 4'b0110;

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   reg          tap_move;      
   reg          tap_direction; 
   reg          tap_load; 
   reg          TX_IOD_clr_flags;       
   reg          TX_IOD_ld;       
   reg          TX_IOD_dir;        
   reg          TX_IOD_move;         
   reg          TX_IOD_start;
   reg          TX_IOD_done;
   reg          incr_tapcnt;
   reg          load_tapcnt;
   reg          tx_iod_start;
   reg          tx_iod_done;
   reg          tx_iod_clr_flags;       

   reg 		TX_IOD_HOLD_flag;
   reg [3:0]    wait_cnt;
   reg [7:0]    tap_cnt;
   reg [3:0]    tx_iod_next_state;
   reg [3:0]    tx_iod_curr_state;
   reg [3:0]    tx_iod_hold_state;

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
         tx_iod_curr_state   <= TXIOD_IDLE_ST;         
         tx_iod_hold_state   <= TXIOD_IDLE_ST;         
         TX_IOD_HOLD_flag    <= 1'b0; 
      end
      else if (TX_IOD_RSTRT == 1'b1) begin //High Priority for RESET Training
         tx_iod_curr_state   <= TXIOD_IDLE_ST;         
         tx_iod_hold_state   <= TXIOD_IDLE_ST;         
         TX_IOD_HOLD_flag    <= 1'b0; 
      end
      else if ((!TX_IOD_HOLD_flag) && (TX_IOD_HOLD == 1'b1) && (HOLD_TRNG == 1'b1)) begin
         tx_iod_hold_state   <= tx_iod_next_state; 
         tx_iod_curr_state   <= TXIOD_HOLD_ST;
         TX_IOD_HOLD_flag    <= 1'b1; 
      end
      else if ((TX_IOD_HOLD_flag) && (tx_iod_curr_state == TXIOD_HOLD_ST) && (TX_IOD_HOLD == 1'b0)) begin
         tx_iod_curr_state   <= tx_iod_hold_state;
         TX_IOD_HOLD_flag    <= 1'b0; 
         tx_iod_hold_state   <= TXIOD_IDLE_ST;         
      end	      
      else begin
         tx_iod_curr_state <= tx_iod_next_state;
      end
   end

   // Combinatorial logic
   // Next state decoder and output logic
   always @(*) begin
      tx_iod_next_state        = tx_iod_curr_state;
      tx_iod_start             = TX_IOD_start;
      tx_iod_done              = TX_IOD_done;
      tx_iod_clr_flags         = 1'b0;  
      tap_move                 = 1'b0;  
      tap_direction            = 1'b1;  
      tap_load                 = 1'b0;  
      incr_tapcnt              = 1'b0;
      load_tapcnt              = 1'b0;
      
      case(tx_iod_curr_state)
        TXIOD_HOLD_ST: begin
              tx_iod_next_state = TXIOD_HOLD_ST;
        end

        TXIOD_IDLE_ST: begin
           if((|TX_IOD_EYE_IN) && (PLL_LOCK)) begin
              tx_iod_next_state = TXIOD_LOAD_ST;
              tx_iod_done  = 1'b0;
              tx_iod_start = 1'b1;
           end
        end
        // Load the initial values for the tap delays within the 
        // read delay line
        TXIOD_LOAD_ST: begin
           tx_iod_next_state = TXIOD_EM_ST;
           tx_iod_clr_flags  = 1'b1;
           tap_load          = 1'b1;
        end
        // Clear the IOD DEM flags after every increment 
        // of the tap read delay
        TXIOD_CLRFLAGS_ST: begin
           tx_iod_next_state = TXIOD_EM_ST;
           tx_iod_clr_flags  = 1'b1;
        end
        // Wait for delay count till the tap delay values 
        // take effect.
        TXIOD_EM_ST: begin
           if(wait_cnt == 4'b0000) begin
              tx_iod_next_state = TXIOD_TAPSTORE_ST;
           end
           else begin
              tx_iod_next_state = TXIOD_EM_ST;
           end
        end
        // Store the Early/Late flag values for
        // each value of the tap delay
        TXIOD_TAPSTORE_ST: begin
           if(tap_cnt == TX_IOD_TAPS_DELAY) begin
              tx_iod_next_state = TXIOD_DONE_ST;
           end
           else begin
              tx_iod_next_state = TXIOD_CLRFLAGS_ST;
           end
           if(tap_cnt == TX_IOD_TAPS_DELAY) begin
              tx_iod_clr_flags           = 1'b1;
           end
           else begin
              // To LC Read delay line
              tap_move                 = 1'b1;
              tap_direction            = 1'b1; 
           end
        end

        // Calculation done
        TXIOD_DONE_ST: begin
	   
	   // Sticky Until Next Resetcondition 
           // tx_iod_next_state = TXIOD_IDLE_ST; 
	   
           // Output
           tx_iod_done  = 1'b1;
           tx_iod_start = 1'b0;
        end
        default: begin
           tx_iod_next_state = TXIOD_IDLE_ST;
        end
      endcase // case (tx_iod_curr_state)      
   end // always @ (*)
   
   // tap counter for training sequence 1
   always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0) begin
         tap_cnt <= 'h0;
      end
      else begin
         if(tap_load == 1'b1 || load_tapcnt == 1'b1) begin
            tap_cnt <= 'h0;
         end
         else if((tap_move == 1'b1 && (tap_cnt != TX_IOD_TAPS_DELAY)) || 
                 (incr_tapcnt == 1'b1)) begin
            tap_cnt <= tap_cnt + 'h1;
         end
      end
   end

   // Wait counter
   // Wait for delay count till the tap delay values 
   // take effect.
   always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0) begin
         wait_cnt <= 4'hF;
      end
      else begin
         if(tx_iod_curr_state == TXIOD_CLRFLAGS_ST) begin
            wait_cnt <= 'hF;
         end
         else if(tx_iod_curr_state == TXIOD_EM_ST) begin
            wait_cnt <= wait_cnt - 'h1;
         end
      end
   end

   //IN <-> OUT Bit Align Interface 
   always @(posedge SCLK or negedge RESETN) begin
      if(RESETN == 1'b0) begin
         TX_IOD_ld        <= 1'b0;         
         TX_IOD_dir       <= 1'b0;         
         TX_IOD_move      <= 1'b0;         
         TX_IOD_clr_flags <= 1'b0;      
         TX_IOD_start     <= 1'b0;	 
         TX_IOD_done      <= 1'b0;	 
      end
      else if (TX_IOD_RSTRT == 1'b1) begin
         TX_IOD_ld        <= 1'b0;         
         TX_IOD_dir       <= 1'b0;         
         TX_IOD_move      <= 1'b0;         
         TX_IOD_clr_flags <= 1'b0;      
         TX_IOD_start     <= 1'b0;	 
         TX_IOD_done      <= 1'b0;	 
      end
      else begin
         TX_IOD_ld        <= tap_load;         
         TX_IOD_dir       <= tap_direction;         
         TX_IOD_move      <= tap_move;
         TX_IOD_clr_flags <= tx_iod_clr_flags;         
         TX_IOD_start     <= tx_iod_start;	 
         TX_IOD_done      <= tx_iod_done;	 
      end
   end

   assign TX_IOD_CLR_FLGS    	      = TX_IOD_clr_flags;
   assign TX_IOD_DELAY_LINE_LOAD      = TX_IOD_ld;
   assign TX_IOD_DELAY_LINE_DIRECTION = TX_IOD_dir; 
   assign TX_IOD_DELAY_LINE_MOVE      = TX_IOD_move;                   
   assign TX_IOD_DELAY_START          = TX_IOD_start;    
   assign TX_IOD_DELAY_DONE           = TX_IOD_done;    
   
endmodule // CoreRxIODTXIOD


