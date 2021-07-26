/*****************************************************************************************************************************
--
--    File Name    : pattern_gen.v 

--    Description  : This module implements color bar pattern generation.


-- Targeted device : Microsemi-SoC                     
-- Author          : India Solutions Team

-- SVN Revision Information:
-- SVN $Revision: TBD
-- SVN $Date: TBD
--
--
--
-- COPYRIGHT 2018 BY MICROSEMI 
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
-- FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
-- MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
-- NO BACK-UP OF THE FILE SHOULD BE MADE. 
-- 

--******************************************************************************************************************************/
module pattern_gen #(
    parameter h_active      = 'd1920     ,
    parameter h_total       = 'd2200     ,
    parameter v_active      = 'd1080     ,
    parameter v_total       = 'd1125     ,
    parameter H_FRONT_PORCH =   'd88     ,
    parameter H_SYNCH       =   'd44     ,
    parameter H_BACK_PORCH  =  'd148     ,
    parameter V_FRONT_PORCH =    'd4     ,
    parameter V_SYNCH       =    'd5     ,
    parameter mode          =     1             //0 = colorbar, 1 = walking 1's
)
( 
    input                     rstn       , 
    input                     clk        , 
    input                     data_matched       , 
    output         reg        fv         , 
    output         reg        lv         , 
    output  [7:0]            data       ,
    output         reg        vsync      ,
    output         reg        hsync      
); 
 
    reg [11:0] pixcnt; 
    reg [11:0] linecnt;
    reg [10:0] fv_cnt;
    reg [7:0] color_cntr;	
    reg        q_fv;
    reg [7:0]  rstn_cnt;
    
    always @(posedge clk or negedge rstn) 
       if (!rstn) 
             rstn_cnt <= 0;
       else
             rstn_cnt <= rstn_cnt[7] ? rstn_cnt : rstn_cnt+1;
             
    always @(posedge clk or negedge rstn_cnt[7]) begin 
       if (!rstn_cnt[7]) begin 
       	  fv_cnt    <= 0;  
       	  pixcnt    <= 12'd0; 
       	  
       	  linecnt   <= 12'd0;
       	  
       	  lv        <= 1'b0;  
       	  fv        <= 1'b0;  
       	  q_fv      <= 0;                                    
           
          hsync     <= 0;
          vsync     <= 0;         
       end                                   
       else begin 
          fv_cnt    <= (fv_cnt==11'h7FF)  ? 11'h7FF  : fv_cnt+ (~fv&q_fv);
          pixcnt    <= (pixcnt<h_total-1) ? pixcnt+1 : 0;  
                    
          linecnt   <= (linecnt==v_total-1 && pixcnt ==h_total-1)  ? 0         :  
                       (linecnt< v_total-1 && pixcnt ==h_total-1)  ? linecnt+1 : linecnt; 
       	            
       	  lv        <= (pixcnt>12'd0)   & (pixcnt<=h_active) & (linecnt> 0 & linecnt<=v_active); 
       	  fv        <= (linecnt>=12'd0) & (linecnt<=v_active+1);
       	  q_fv      <= fv; 
       	            
       	  hsync     <= (pixcnt>h_active+H_FRONT_PORCH)   & (pixcnt<=h_active+H_FRONT_PORCH+H_SYNCH); 
          vsync     <= (linecnt>=v_active+V_FRONT_PORCH) & (linecnt<v_active+V_FRONT_PORCH+V_SYNCH);       	   
       end 
    end   
    
    reg d_data_matched;
    wire color_cntr_rst;

    assign color_cntr_rst =  ((!d_data_matched) && (data_matched));

	always @(posedge clk or negedge rstn_cnt[7])
	    if(!rstn_cnt[7])
	     d_data_matched <= 1'b0;
            else     
	     d_data_matched <= data_matched;
	
	always @(posedge clk or negedge rstn_cnt[7])
	    if(!rstn_cnt[7])
	         color_cntr <= 8'b10_10_01_01;
	    else if (!data_matched)
	         //color_cntr <= lv ? 8'b00_01_10_11 : 0;
	         color_cntr <= lv ? 8'b10_10_01_01 : 0;
	    else
	         color_cntr <= lv ? (color_cntr_rst ? 0 : color_cntr+1) : 0;
	         
    generate
        if (mode==1)	                 	         
             assign data = color_cntr;
        else 
             assign data = color_cntr<160 ? {8'hFF, 8'h00, 8'h00} :
                  color_cntr<320 ? {8'h00, 8'hFF, 8'h00} : {8'h00, 8'h00, 8'hFF} ;	          
    endgenerate   	  
    
endmodule                  
