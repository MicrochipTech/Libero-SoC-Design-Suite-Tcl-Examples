module ACT_UNIQUE_reset_delay
(
input RX_CLK_G_0,
input ARST_N,
output reset_done
);

//--------------------------------------------------------------------
// Added MIPI Glue Logic - Revisit
//--------------------------------------------------------------------
parameter rst_cnt_width = 10;
reg [(rst_cnt_width-1):0] rst_cnt;
reg reset_dly_fg;


 //Reset Counter to add delay 
always@(posedge RX_CLK_G_0 or negedge ARST_N)
begin
  if(!ARST_N)begin
    rst_cnt <= 0;
    reset_dly_fg <= 1'b0;
  end else begin
    if((!reset_dly_fg) & (&rst_cnt))
      reset_dly_fg <= 1'b1;
    rst_cnt <= rst_cnt + 1;
  end     
end

assign reset_done = reset_dly_fg;
endmodule 
