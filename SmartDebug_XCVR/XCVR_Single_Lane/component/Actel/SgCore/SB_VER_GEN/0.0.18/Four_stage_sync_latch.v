
/**********************************************************************************************

//  File Name    : probeWrite.v 
//
//  Description  : This module implements the Active Probe Write Latch 

//  Targeted device : Family           Die          Package
//                  SmartFusion2      	Any      		Any
//  Author          :  Pankaj Shanker
//

   COPYRIGHT 2013 BY MICROSEMI 
   THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
   FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
   MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
   NO BACK-UP OF THE FILE SHOULD BE MADE. 

 
************************************************************************************************/

//******************************************************************************
//**************************** Module Declaration ******************************
//******************************************************************************
module probeWrite (
  RESET_N_IN                                            ,
  CLK_IN                                                ,
  PRBWR_IN												,
  GLX_EB                                                ,
  Q_OUT													                                              
  )                    /* synthesis syn_hier = "hard" */;

  input RESET_N_IN                                      ;
  input CLK_IN                                          ;
  input PRBWR_IN										;
  input GLX_EB                                          ;
  output Q_OUT                               		;

//******************************************************************************
//*************************** Parameter Declaration ****************************
//******************************************************************************
`define C_HI  1
`define C_LO  0
parameter C_RETIMES = 4; // min 2 allowed !!

//******************************************************************************
//*************************** Reg Declaration       ****************************
//******************************************************************************
(* syn_preserve=1 *)reg [C_RETIMES-1:0] q;
(* syn_preserve=1 *)reg Q_OUT/*synthesis syn_preserve = 1*/;
(* syn_preserve=1 *)reg lp_feedback_latch/*synthesis syn_preserve = 1*/;
(* syn_preserve=1 *)reg active_probe_latch/*synthesis syn_preserve = 1*/;

//******************************************************************************
//*************************** Wire Declaration      ****************************
//******************************************************************************
(* syn_keep=1 *)wire dummyClk /*synthesis syn_keep=1*/;

(* syn_preserve=1 *)wire lp_feedback_rstn/*synthesis syn_preserve = 1*/;
(* syn_preserve=1 *)wire latch /*synthesis syn_preserve = 1*/;
   
//******************************************************************************
//*************************** Async Assignments     ****************************
//******************************************************************************
     
//******************************************************************************
//*************************** Module Instantiation       ***********************
//******************************************************************************


//******************************************************************************
//*************************** Sync Assignments           ***********************
//******************************************************************************

// This latch is meant to be asynchronously driven by Active Probe Write to 1 or 0
always @(posedge dummyClk or negedge RESET_N_IN)
begin
	if (!RESET_N_IN)
//		latch 	<= `C_LO;
		active_probe_latch 	<= 1'b0;
	else 
		active_probe_latch 	<= PRBWR_IN;	
end

// This latch is meant to be asynchronously driven by liveprobe feedback (DUT Trigger)
// The latch asserts when posedge of Liveprobe feedback signal is detected
// The latch deasserts when the posedge detector (Q_OUT) pulse asserts
assign lp_feedback_rstn = !Q_OUT & RESET_N_IN;
always @(posedge PRBWR_IN or negedge lp_feedback_rstn)
begin
	if (!lp_feedback_rstn)
		lp_feedback_latch 	<= 1'b0;
	else 
		lp_feedback_latch 	<= !Q_OUT;	
end

assign latch = active_probe_latch | lp_feedback_latch;

// synchronize the latch output in CLK_IN clock domain
always @(posedge CLK_IN or negedge RESET_N_IN)
begin
	if (!RESET_N_IN)
	begin
		q [C_RETIMES-1:0]	<= `C_LO;
		Q_OUT				<= `C_LO;
	end else 
	begin
		q[C_RETIMES-1:0]	<= {q[C_RETIMES-2:0], latch};
		// detect rising edge and generate a HI pulse for 1 clk cycle

		Q_OUT				<= !q[C_RETIMES-1] & q[C_RETIMES-2] & GLX_EB;

                           
	end // if (!RESET_N_IN)
end

//******************************************************************************
//******************************* End of Module ********************************
//******************************************************************************
endmodule

