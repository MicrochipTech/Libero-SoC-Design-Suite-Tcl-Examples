`timescale 1ps / 1ps
module CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_CORERXIODBITALIGN (
                               // Clocks and clock control signals
                               input SCLK,
			       input RESETN,	
                               input PLL_LOCK,
                               input LP_IN,

                  	       // IOD Controller IN signals       
                  	       input IOD_EARLY,
			       input IOD_LATE,
		  	       input IOD_OOR,

		  	       // BIT Align status IN and OUT signals 
		  	       output BIT_ALGN_START,
		  	       output BIT_ALGN_DONE,
		  	       output BIT_ALGN_ERR,
		  	       output BIT_ALGN_OOR,
		  	       input  BIT_ALGN_RSTRT,
		  	       input  BIT_ALGN_HOLD,
		  	       input  BIT_ALGN_SKIP,
                  	       input  [2:0] BIT_ALGN_EYE_IN,

		               // IOD Controller OUT signals       
			       //output [2:0] BIT_ALGN_EYE_OUT,
			       output wire [7:0] RX_BIT_ALIGN_LEFT_WIN,
                               output wire [7:0] RX_BIT_ALIGN_RGHT_WIN,
   			       output wire [7:0] DEM_BIT_ALGN_TAPDLY,
                  	       output wire BIT_ALGN_CLR_FLGS,
                  	       output wire BIT_ALGN_LOAD,
                  	       output wire BIT_ALGN_DIR,
                  	       output wire BIT_ALGN_MOVE
                               );

   
   // --------------------------------------------------------------------------
   // PARAMETER Declaration
   // --------------------------------------------------------------------------
   parameter MIPI_TRNG     = 0;  //0 - Perform NO MIPI training,  1 - MIPI training is done
   parameter SKIP_TRNG 	   = 0;  //0 - Perform training, 1 - No training is done
   parameter HOLD_TRNG 	   = 0;  //0 - Continue training, 1 - Hold training
   parameter FAMILY        = 26; // PolarFire
   parameter DEM_TAP_WAIT_CNT_WIDTH  = 3;     // 3 - Default 8 clocks  
   localparam DEM_TRNG_MODE     = 1;     // 0 - 128 ICB Tap Delays , 1 - 256 ICB Tap Delays

   //localparam MIN_WINDOW_VALUE = 10;   // No of Tap Delays 
   localparam  MIN_WINDOW_VALUE = 10;     // No of Tap Delays 
   localparam  RST_CNT_WIDTH    = 10;
   localparam  DEM_TAP_CNT       = (DEM_TRNG_MODE == 'd1) ? 'd256 : 'd128;
   localparam  DEM_TAP_CNT_WIDTH = (DEM_TRNG_MODE == 'd1) ? 'd8   : 'd7;

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   // BIT Align status IN and OUT signal
   wire [DEM_TAP_CNT_WIDTH-1:0] RX_BIT_ALIGN_TAPDLY;
   wire rx_BIT_ALGN_START;
   wire rx_BIT_ALGN_DONE;
   wire rx_BIT_ALGN_ERR;
   wire rx_BIT_ALGN_OOR;

   // IOD Controller OUT signals       
   wire rx_BIT_ALGN_CLR_FLGS;
   wire rx_BIT_ALGN_LOAD;
   wire rx_BIT_ALGN_DIR;
   wire rx_BIT_ALGN_MOVE;
   wire [2:0] rx_BIT_ALGN_EYE_OUT;
   wire HS_RESETN;
   wire BIT_ALGN_PLL_LOCK;

   // --------------------------------------------------------------------------
   // Training IP Sequencing: Rx 
   // -------------------------------------------------------------------------- 
   CORERXIODBITALIGN_C0_CORERXIODBITALIGN_C0_0_CORERXIODBITALIGN_TRNG #(
                        .DEM_TAP_CNT_WIDTH (DEM_TAP_CNT_WIDTH),
                        .DEM_TAP_CNT (DEM_TAP_CNT),
                        .DEM_TAP_WAIT_CNT_WIDTH (DEM_TAP_WAIT_CNT_WIDTH),
                        .RST_CNT_WIDTH (RST_CNT_WIDTH),
                        .MIN_WINDOW_VALUE (MIN_WINDOW_VALUE),
                        .MIPI_TRNG (MIPI_TRNG),
                        .SKIP_TRNG (SKIP_TRNG),
                        .HOLD_TRNG (HOLD_TRNG)
	               )
   	               u_CoreRxIODBitAlign (
                                .SCLK                           (SCLK                         	), 
                                .RESETN                         (RESETN                       	), 
                                .PLL_LOCK                       (BIT_ALGN_PLL_LOCK              ), 
                                .LP_IN	                        (LP_IN		                ), 

				// BIT Align status IN and OUT signals 
				.rx_BIT_ALGN_START		(rx_BIT_ALGN_START	  	),
				.rx_BIT_ALGN_DONE		(rx_BIT_ALGN_DONE	  	),
				.rx_BIT_ALGN_ERR		(rx_BIT_ALGN_ERR	  	),
				.rx_BIT_ALGN_OOR		(rx_BIT_ALGN_OOR	  	),
				.rx_BIT_ALGN_RSTRT		(BIT_ALGN_RSTRT),
				.rx_BIT_ALGN_HOLD		(BIT_ALGN_HOLD		  	),
				.rx_BIT_ALGN_SKIP		(BIT_ALGN_SKIP		  	),
				.rx_BIT_ALGN_EYE_IN		(BIT_ALGN_EYE_IN	  	),

                  		// IOD Controller IN signals
                  		.IOD_EARLY			(IOD_EARLY		  	),   
                  		.IOD_LATE			(IOD_LATE		  	),	
		  		.IOD_OOR			(IOD_OOR			),

				// IOD Controller OUT signals
				.RX_BIT_ALIGN_LEFT_WIN		(RX_BIT_ALIGN_LEFT_WIN		),
                                .RX_BIT_ALIGN_RGHT_WIN		(RX_BIT_ALIGN_RGHT_WIN		),
                                .RX_BIT_ALIGN_TAPDLY            (RX_BIT_ALIGN_TAPDLY), 
				.rx_BIT_ALGN_CLR_FLGS		(rx_BIT_ALGN_CLR_FLGS	  	),
				.rx_BIT_ALGN_LOAD		(rx_BIT_ALGN_LOAD	  	),
				.rx_BIT_ALGN_DIR		(rx_BIT_ALGN_DIR	  	),
				.rx_BIT_ALGN_MOVE		(rx_BIT_ALGN_MOVE	  	),
				.rx_BIT_ALGN_EYE_OUT		(rx_BIT_ALGN_EYE_OUT	  	)
                                );
   /* synthesis translate_off*/
   generate 
   if (SKIP_TRNG == 1'b0) begin
   /* synthesis translate_on*/
   assign BIT_ALGN_CLR_FLGS  		= rx_BIT_ALGN_CLR_FLGS;
   assign BIT_ALGN_LOAD      		= rx_BIT_ALGN_LOAD;                
   assign BIT_ALGN_DIR       		= rx_BIT_ALGN_DIR;     
   assign BIT_ALGN_MOVE      		= rx_BIT_ALGN_MOVE;                  
   assign BIT_ALGN_START      		= rx_BIT_ALGN_START;     
   assign BIT_ALGN_DONE       		= rx_BIT_ALGN_DONE;     
   assign BIT_ALGN_ERR       		= rx_BIT_ALGN_ERR;     
   assign BIT_ALGN_PLL_LOCK    		= PLL_LOCK;      
   assign BIT_ALGN_OOR       		= rx_BIT_ALGN_OOR;    
   assign DEM_BIT_ALGN_TAPDLY           = (DEM_TRNG_MODE == 'd1) ? RX_BIT_ALIGN_TAPDLY : {1'b0,RX_BIT_ALIGN_TAPDLY[DEM_TAP_CNT_WIDTH-1:0]};
   //assign BIT_ALGN_EYE_OUT            = rx_BIT_ALGN_EYE_OUT; 
   /* synthesis translate_off*/
   end
   endgenerate
  
   generate 
   if (SKIP_TRNG == 1'b1) begin
   assign BIT_ALGN_CLR_FLGS    		= rx_BIT_ALGN_CLR_FLGS; 
   assign BIT_ALGN_LOAD        		= rx_BIT_ALGN_LOAD;      
   assign BIT_ALGN_DIR         		= 'h0; 
   assign BIT_ALGN_MOVE        		= 'h0;      
   assign BIT_ALGN_DONE         	= rx_BIT_ALGN_DONE;    
   assign BIT_ALGN_ERR       		= 'h0;     
   assign BIT_ALGN_START        	= rx_BIT_ALGN_START;    
   assign BIT_ALGN_PLL_LOCK		= PLL_LOCK;
   assign BIT_ALGN_OOR          	= IOD_OOR;    
   assign DEM_BIT_ALGN_TAPDLY           = 'd0;
   assign RX_BIT_ALIGN_LEFT_WIN         = 'd0; 
   assign RX_BIT_ALIGN_RGHT_WIN         = 'd0; 
   //assign BIT_ALGN_EYE_OUT              = rx_BIT_ALGN_EYE_OUT; 
   end
   endgenerate   
   /* synthesis translate_on*/

endmodule // CoreRxIODBitAlign_top
