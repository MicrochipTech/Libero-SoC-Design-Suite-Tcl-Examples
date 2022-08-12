//OE STAYS HIGH FOR 1 EXTRA PHASE
module DQ_DQS_OE_GLUE_LOGIC (
    input  sclk,
    input  srst_n,
    input  dfi_wrdata_en_p0,
    input  dfi_wrdata_en_p1,
    input  dfi_wrdata_en_p2,
    input  dfi_wrdata_en_p3,
    output dq_oe_p0,
    output dq_oe_p1,
    output dq_oe_p2,
    output dq_oe_p3,
    output dqs_oe_p0,
    output dqs_oe_p1,
    output dqs_oe_p2,
    output dqs_oe_p3 ) ;

    parameter IOG_DQS_LANES = 9; // Number of Lanes

    reg dfi_wrdata_en_p3_reg;

    always @( posedge sclk or negedge srst_n )
    begin : wdata_en_registering
      if (!(srst_n))
      begin
        dfi_wrdata_en_p3_reg <= 0;
      end
      else
      begin
        dfi_wrdata_en_p3_reg <= dfi_wrdata_en_p3;
      end
    end

    assign dq_oe_p0  = (dfi_wrdata_en_p3_reg) ? (2**IOG_DQS_LANES)-1:'h0;
    assign dq_oe_p1  = (dfi_wrdata_en_p0)     ? (2**IOG_DQS_LANES)-1:'h0;
    assign dq_oe_p2  = (dfi_wrdata_en_p1)     ? (2**IOG_DQS_LANES)-1:'h0;
    assign dq_oe_p3  = (dfi_wrdata_en_p2)     ? (2**IOG_DQS_LANES)-1:'h0;

    assign dqs_oe_p0 = (dfi_wrdata_en_p0|dfi_wrdata_en_p3_reg) ? (2**IOG_DQS_LANES)-1:'h0;
    assign dqs_oe_p1 = (dfi_wrdata_en_p1|dfi_wrdata_en_p0)     ? (2**IOG_DQS_LANES)-1:'h0;
    assign dqs_oe_p2 = (dfi_wrdata_en_p2|dfi_wrdata_en_p1)     ? (2**IOG_DQS_LANES)-1:'h0;
    assign dqs_oe_p3 = (dfi_wrdata_en_p3|dfi_wrdata_en_p2)     ? (2**IOG_DQS_LANES)-1:'h0;

endmodule
