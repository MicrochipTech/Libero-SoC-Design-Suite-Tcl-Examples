///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: MICROSEMI
//
// IP Core: COREAXI4INTERCONNECT
//
//  Description  : The AMBA AXI4 Interconnect core connects one or more AXI memory-mapped master devices to one or
//                 more memory-mapped slave devices. The AMBA AXI protocol supports high-performance, high-frequency
//                 system designs.
//
//  COPYRIGHT 2017 BY MICROSEMI 
//  THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
//  FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
//  MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
//  NO BACK-UP OF THE FILE SHOULD BE MADE. 
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 
 
module caxi4interconnect_AHB_SM (sysReset,
               ACLK,
               int_masterAWID,
               int_masterAWADDR,
               int_masterAWLEN,
               int_masterAWSIZE,
               int_masterAWBURST,
               int_masterAWLOCK,
               int_masterAWCACHE,
               int_masterAWPROT,
               int_masterAWQOS,
               int_masterAWREGION,
               int_masterAWUSER,
               int_masterAWVALID,
               int_masterAWREADY,
               int_masterARID,
               int_masterARADDR,
               int_masterARLEN,
               int_masterARSIZE,
               int_masterARBURST,
               int_masterARLOCK,
               int_masterARCACHE,
               int_masterARPROT,
               int_masterARQOS,
               int_masterARREGION,
               int_masterARUSER,
               int_masterARVALID,
               int_masterARREADY,
               int_masterWDATA,
               int_masterWLAST,
               int_masterWSTRB,
               int_masterWUSER,
               int_masterWVALID,
               int_masterWREADY,
               int_masterRID,
               int_masterRDATA,
               int_masterRLAST,
               int_masterRRESP,
               int_masterRUSER,
               int_masterRVALID,
               int_masterRREADY,
               int_masterBID,
               int_masterBRESP,
               int_masterBUSER,
               int_masterBVALID,
               int_masterBREADY,
               MASTER_HADDR,
               MASTER_HSEL,
               MASTER_HBURST,
               MASTER_HMASTLOCK,
               MASTER_HPROT,
               MASTER_HSIZE,
               MASTER_HNONSEC,
               MASTER_HTRANS,
               MASTER_HWDATA,
               MASTER_HWRITE,
               MASTER_HRDATA,
               MASTER_HRESP,
               MASTER_HREADY
               );
 
   parameter        USER_WIDTH           = 1;
   parameter        DEF_BURST_LEN        = 0;
   parameter        ADDR_WIDTH           = 20;
   parameter        DATA_WIDTH           = 32;
   parameter        ID_WIDTH             = 1;
   parameter        BRESP_CHECK_MODE     = 2'b00;
   parameter        LOG_BYTE_WIDTH       = 2;
   parameter        BRESP_CNT_WIDTH      = 'h8;
   input            sysReset;
   wire             sysReset;
   input            ACLK;
   wire             ACLK;
   output    [ID_WIDTH - 1:0] int_masterAWID;
   wire      [ID_WIDTH - 1:0] int_masterAWID;
   output    [ADDR_WIDTH - 1:0] int_masterAWADDR;
   wire      [ADDR_WIDTH - 1:0] int_masterAWADDR;
   output    [7:0]  int_masterAWLEN;
   wire      [7:0]  int_masterAWLEN;
   output    [2:0]  int_masterAWSIZE;
   wire      [2:0]  int_masterAWSIZE;
   output    [1:0]  int_masterAWBURST;
   wire      [1:0]  int_masterAWBURST;
   output    [1:0]  int_masterAWLOCK;
   wire      [1:0]  int_masterAWLOCK;
   output    [3:0]  int_masterAWCACHE;
   wire      [3:0]  int_masterAWCACHE;
   output    [2:0]  int_masterAWPROT;
   wire      [2:0]  int_masterAWPROT;
   output    [3:0]  int_masterAWQOS;
   wire      [3:0]  int_masterAWQOS;
   output    [3:0]  int_masterAWREGION;
   wire      [3:0]  int_masterAWREGION;
   output    [USER_WIDTH - 1:0] int_masterAWUSER;
   wire      [USER_WIDTH - 1:0] int_masterAWUSER;
   output           int_masterAWVALID;
   reg              int_masterAWVALID;
   input            int_masterAWREADY;
   wire             int_masterAWREADY;
   output    [ID_WIDTH - 1:0] int_masterARID;
   wire      [ID_WIDTH - 1:0] int_masterARID;
   output    [ADDR_WIDTH - 1:0] int_masterARADDR;
   wire      [ADDR_WIDTH - 1:0] int_masterARADDR;
   output    [7:0]  int_masterARLEN;
   wire      [7:0]  int_masterARLEN;
   output    [2:0]  int_masterARSIZE;
   wire      [2:0]  int_masterARSIZE;
   output    [1:0]  int_masterARBURST;
   wire      [1:0]  int_masterARBURST;
   output    [1:0]  int_masterARLOCK;
   wire      [1:0]  int_masterARLOCK;
   output    [3:0]  int_masterARCACHE;
   wire      [3:0]  int_masterARCACHE;
   output    [2:0]  int_masterARPROT;
   wire      [2:0]  int_masterARPROT;
   output    [3:0]  int_masterARQOS;
   wire      [3:0]  int_masterARQOS;
   output    [3:0]  int_masterARREGION;
   wire      [3:0]  int_masterARREGION;
   output    [USER_WIDTH - 1:0] int_masterARUSER;
   wire      [USER_WIDTH - 1:0] int_masterARUSER;
   output           int_masterARVALID;
   reg              int_masterARVALID;
   input            int_masterARREADY;
   wire             int_masterARREADY;
   output    [DATA_WIDTH - 1:0] int_masterWDATA;
   wire      [DATA_WIDTH - 1:0] int_masterWDATA;
   output           int_masterWLAST;
   reg              int_masterWLAST;
   output    [(DATA_WIDTH / 8) - 1:0] int_masterWSTRB;
   reg       [(DATA_WIDTH / 8) - 1:0] int_masterWSTRB;
   output    [USER_WIDTH - 1:0] int_masterWUSER;
   wire      [USER_WIDTH - 1:0] int_masterWUSER;
   output           int_masterWVALID;
   reg              int_masterWVALID;
   input            int_masterWREADY;
   wire             int_masterWREADY;
   input     [ID_WIDTH - 1:0] int_masterRID;
   wire      [ID_WIDTH - 1:0] int_masterRID;
   input     [DATA_WIDTH - 1:0] int_masterRDATA;
   wire      [DATA_WIDTH - 1:0] int_masterRDATA;
   input            int_masterRLAST;
   wire             int_masterRLAST;
   input     [1:0]  int_masterRRESP;
   wire      [1:0]  int_masterRRESP;
   input     [USER_WIDTH - 1:0] int_masterRUSER;
   wire      [USER_WIDTH - 1:0] int_masterRUSER;
   input            int_masterRVALID;
   wire             int_masterRVALID;
   output           int_masterRREADY;
   reg              int_masterRREADY;
   input     [ID_WIDTH - 1:0] int_masterBID;
   wire      [ID_WIDTH - 1:0] int_masterBID;
   input     [1:0]  int_masterBRESP;
   wire      [1:0]  int_masterBRESP;
   input     [USER_WIDTH - 1:0] int_masterBUSER;
   wire      [USER_WIDTH - 1:0] int_masterBUSER;
   input            int_masterBVALID;
   wire             int_masterBVALID;
   output           int_masterBREADY;
   reg              int_masterBREADY;
   input     [31:0] MASTER_HADDR;
   wire      [31:0] MASTER_HADDR;
   input            MASTER_HSEL;
   wire             MASTER_HSEL;
   input     [2:0]  MASTER_HBURST;
   wire      [2:0]  MASTER_HBURST;
   input            MASTER_HMASTLOCK;
   wire             MASTER_HMASTLOCK;
   input     [6:0]  MASTER_HPROT;
   wire      [6:0]  MASTER_HPROT;
   input     [2:0]  MASTER_HSIZE;
   wire      [2:0]  MASTER_HSIZE;
   input            MASTER_HNONSEC;
   wire             MASTER_HNONSEC;
   input     [1:0]  MASTER_HTRANS;
   wire      [1:0]  MASTER_HTRANS;
   input     [DATA_WIDTH - 1:0] MASTER_HWDATA;
   wire      [DATA_WIDTH - 1:0] MASTER_HWDATA;
   input            MASTER_HWRITE;
   wire             MASTER_HWRITE;
   output    [DATA_WIDTH - 1:0] MASTER_HRDATA;
   reg       [DATA_WIDTH - 1:0] MASTER_HRDATA;
   output           MASTER_HRESP;
   reg              MASTER_HRESP;
   output           MASTER_HREADY;
   reg              MASTER_HREADY;
   reg       [8:0]  ph_cnt;                             //  current data phase
   reg              ahb_write_op;
   wire             NONSEQ;
   wire             BUSY;
   wire             IDLE;
   wire             SEQ;
   wire             count_match;
   reg       [7:0]  exp_burst_len;
   reg       [8:0]  latched_exp_burst_len;
   wire             new_cycle;
   wire             end_cycle;
   reg              cycle_in_progress;
   reg       [DATA_WIDTH - 1:0] int_masterRDATA_hold;
   reg       [LOG_BYTE_WIDTH - 1:0] haddr_latched;
   reg       [2:0]  hsize_latched;
   reg              valid_data_avail;
   reg              zero_strb;
   wire      [6:0]  size_bytes;
   wire      [(DATA_WIDTH / 8) - 1:0] pre_shifted_strobes;
   wire      [LOG_BYTE_WIDTH - 1:0] num_of_bytes_to_shift;
   wire      [(DATA_WIDTH / 8) - 1:0] masterSTRB;
   wire             check_end;
   wire             check_all;
   wire             checkendonly;
   reg              setwrcntto1;
   reg       [BRESP_CNT_WIDTH - 1:0] wrcnt;
   reg              wrerr;
   wire             wrcntmax;
   wire             decwrcnt;
   wire             incrwrcnt;
   reg       [9:0]  ph_cnt_plus_1;
 
   parameter AXI_EXTEND       = 3'b000,
             DATA_TRANSF      = 3'b001,
             ERROR            = 3'b010,
             WAIT_BVALID      = 3'b011,
             WAIT_LAST_BVALID = 3'b100;
 
 
   reg [2:0] visual_AHB_SM_current, visual_AHB_SM_next;
 
   reg       [8:0]  visual_ph_cnt_next;
   reg              visual_ahb_write_op_next;
   reg       [8:0]  visual_latched_exp_burst_len_next;
   reg              visual_cycle_in_progress_next;
   reg       [DATA_WIDTH - 1:0] visual_int_masterRDATA_hold_next;
   reg       [LOG_BYTE_WIDTH - 1:0] visual_haddr_latched_next;
   reg       [2:0]  visual_hsize_latched_next;
   reg              visual_valid_data_avail_next;
   reg              visual_zero_strb_next;
   reg       int_masterBREADY_reg;
   reg       [DATA_WIDTH - 1:0] MASTER_HRDATA_reg;
 
   always @( posedge ACLK or negedge sysReset )
     begin
        if (!sysReset) begin
           int_masterBREADY_reg <= 1'b0;
           MASTER_HRDATA_reg <= {DATA_WIDTH{1'b0}};
        end else begin
           int_masterBREADY_reg <= int_masterBREADY;
           MASTER_HRDATA_reg <= MASTER_HRDATA;
        end
     end
 
   // Combinational process
   always  @(ph_cnt or ahb_write_op or latched_exp_burst_len or cycle_in_progress or int_masterRDATA_hold or haddr_latched or hsize_latched or valid_data_avail or zero_strb or count_match or
             int_masterWREADY or check_end or wrcnt or wrerr or new_cycle or MASTER_HWRITE or int_masterAWREADY or exp_burst_len or MASTER_HADDR or MASTER_HSIZE or int_masterARREADY or
             int_masterRVALID or check_all or end_cycle or int_masterRDATA or int_masterRRESP or wrcntmax or BUSY or int_masterBVALID or int_masterBRESP or visual_AHB_SM_current or MASTER_HRDATA_reg or int_masterBREADY_reg)
   begin : AHB_SM_comb
      int_masterAWVALID <= 1'b0;
      int_masterARVALID <= 1'b0;
      int_masterWLAST <= 1'b0;
      int_masterWVALID <= 1'b0;
      int_masterRREADY <= 1'b0;
      MASTER_HRESP <= 1'b0;
      MASTER_HREADY <= 1'b0;
      setwrcntto1 <= 1'b0;
      visual_ph_cnt_next <= ph_cnt;
      visual_ahb_write_op_next <= ahb_write_op;
      visual_latched_exp_burst_len_next <= latched_exp_burst_len;
      visual_cycle_in_progress_next <= cycle_in_progress;
      visual_int_masterRDATA_hold_next <= int_masterRDATA_hold;
      visual_haddr_latched_next <= haddr_latched;
      visual_hsize_latched_next <= hsize_latched;
      visual_valid_data_avail_next <= valid_data_avail;
      visual_zero_strb_next <= zero_strb;
      int_masterBREADY <= int_masterBREADY_reg;
	  MASTER_HRDATA <= MASTER_HRDATA_reg;
 
      case (visual_AHB_SM_current)
         AXI_EXTEND:
            begin
               MASTER_HRDATA <= int_masterRDATA_hold;
               if (ahb_write_op)
               begin
                  int_masterWVALID <= 1;
                  int_masterWLAST <= count_match;
                  if (int_masterWREADY)
                  begin
                     visual_ph_cnt_next <= ph_cnt + 1;
                     if (count_match)
                     begin
                        if (check_end)
                        begin
                           if (ahb_write_op)
                           begin
                              int_masterBREADY <= 1'b1;
                              if (wrcnt == 0)
                              begin
                                 if (wrerr)
                                 begin
                                    //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                                    visual_cycle_in_progress_next <= 1'b0;
                                    MASTER_HRESP <= 1'b1;
                                    visual_AHB_SM_next <= ERROR;
                                 end
                                 else if (new_cycle)
                                 begin
                                    if (MASTER_HWRITE)
                                    begin
                                       int_masterAWVALID <= 1;
                                       if (int_masterAWREADY)
                                       begin
                                          visual_cycle_in_progress_next <= 1;
                                          MASTER_HREADY <= 1;
                                          visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                          visual_ahb_write_op_next <= MASTER_HWRITE;
                                          visual_ph_cnt_next <= 0;
                                          visual_valid_data_avail_next <= 1;
                                          visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                          visual_hsize_latched_next <= MASTER_HSIZE;
                                          visual_zero_strb_next <= 1'b0;
                                          setwrcntto1 <= MASTER_HWRITE;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                       else
                                       begin
                                          visual_cycle_in_progress_next <= 1'b0;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                    end
                                    else
                                    begin
                                       int_masterARVALID <= 1;
                                       if (int_masterARREADY)
                                       begin
                                          visual_cycle_in_progress_next <= 1;
                                          MASTER_HREADY <= 1;
                                          visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                          visual_ahb_write_op_next <= MASTER_HWRITE;
                                          visual_ph_cnt_next <= 0;
                                          visual_valid_data_avail_next <= 1;
                                          visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                          visual_hsize_latched_next <= MASTER_HSIZE;
                                          visual_zero_strb_next <= 1'b0;
                                          setwrcntto1 <= MASTER_HWRITE;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                       else
                                       begin
                                          visual_cycle_in_progress_next <= 1'b0;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                    end
                                 end
                                 else
                                 begin
                                    MASTER_HREADY <= 1;
                                    visual_cycle_in_progress_next <= 0;
                                    visual_valid_data_avail_next <= 0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                              else
                              begin
                                 visual_AHB_SM_next <= WAIT_LAST_BVALID;
                              end
                           end
                           else if (new_cycle)
                           begin
                              if (MASTER_HWRITE)
                              begin
                                 int_masterAWVALID <= 1;
                                 if (int_masterAWREADY)
                                 begin
                                    visual_cycle_in_progress_next <= 1;
                                    MASTER_HREADY <= 1;
                                    visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                    visual_ahb_write_op_next <= MASTER_HWRITE;
                                    visual_ph_cnt_next <= 0;
                                    visual_valid_data_avail_next <= 1;
                                    visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                    visual_hsize_latched_next <= MASTER_HSIZE;
                                    visual_zero_strb_next <= 1'b0;
                                    setwrcntto1 <= MASTER_HWRITE;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                                 else
                                 begin
                                    visual_cycle_in_progress_next <= 1'b0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                              else
                              begin
                                 int_masterARVALID <= 1;
                                 if (int_masterARREADY)
                                 begin
                                    visual_cycle_in_progress_next <= 1;
                                    MASTER_HREADY <= 1;
                                    visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                    visual_ahb_write_op_next <= MASTER_HWRITE;
                                    visual_ph_cnt_next <= 0;
                                    visual_valid_data_avail_next <= 1;
                                    visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                    visual_hsize_latched_next <= MASTER_HSIZE;
                                    visual_zero_strb_next <= 1'b0;
                                    setwrcntto1 <= MASTER_HWRITE;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                                 else
                                 begin
                                    visual_cycle_in_progress_next <= 1'b0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                           end
                           else
                           begin
                              MASTER_HREADY <= 1;
                              visual_cycle_in_progress_next <= 0;
                              visual_valid_data_avail_next <= 0;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                        end
                        else if (new_cycle)
                        begin
                           if (MASTER_HWRITE)
                           begin
                              int_masterAWVALID <= 1;
                              if (int_masterAWREADY)
                              begin
                                 visual_cycle_in_progress_next <= 1;
                                 MASTER_HREADY <= 1;
                                 visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                 visual_ahb_write_op_next <= MASTER_HWRITE;
                                 visual_ph_cnt_next <= 0;
                                 visual_valid_data_avail_next <= 1;
                                 visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                 visual_hsize_latched_next <= MASTER_HSIZE;
                                 visual_zero_strb_next <= 1'b0;
                                 setwrcntto1 <= MASTER_HWRITE;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                              else
                              begin
                                 visual_cycle_in_progress_next <= 1'b0;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                           end
                           else
                           begin
                              int_masterARVALID <= 1;
                              if (int_masterARREADY)
                              begin
                                 visual_cycle_in_progress_next <= 1;
                                 MASTER_HREADY <= 1;
                                 visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                 visual_ahb_write_op_next <= MASTER_HWRITE;
                                 visual_ph_cnt_next <= 0;
                                 visual_valid_data_avail_next <= 1;
                                 visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                 visual_hsize_latched_next <= MASTER_HSIZE;
                                 visual_zero_strb_next <= 1'b0;
                                 setwrcntto1 <= MASTER_HWRITE;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                              else
                              begin
                                 visual_cycle_in_progress_next <= 1'b0;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                           end
                        end
                        else
                        begin
                           MASTER_HREADY <= 1;
                           visual_cycle_in_progress_next <= 0;
                           visual_valid_data_avail_next <= 0;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                     else
                     begin
                        visual_AHB_SM_next <= AXI_EXTEND;
                     end
                  end
                  else
                  begin
                     visual_AHB_SM_next <= AXI_EXTEND;
                  end
               end
               else if (int_masterRVALID)
               begin
                  int_masterRREADY <= 1;
                  visual_ph_cnt_next <= ph_cnt + 1;
                  if (count_match)
                  begin
                     if (check_end)
                     begin
                        if (ahb_write_op)
                        begin
                           int_masterBREADY <= 1'b1;
                           if (wrcnt == 0)
                           begin
                              if (wrerr)
                              begin
                                 //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                                 visual_cycle_in_progress_next <= 1'b0;
                                 MASTER_HRESP <= 1'b1;
                                 visual_AHB_SM_next <= ERROR;
                              end
                              else if (new_cycle)
                              begin
                                 if (MASTER_HWRITE)
                                 begin
                                    int_masterAWVALID <= 1;
                                    if (int_masterAWREADY)
                                    begin
                                       visual_cycle_in_progress_next <= 1;
                                       MASTER_HREADY <= 1;
                                       visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                       visual_ahb_write_op_next <= MASTER_HWRITE;
                                       visual_ph_cnt_next <= 0;
                                       visual_valid_data_avail_next <= 1;
                                       visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                       visual_hsize_latched_next <= MASTER_HSIZE;
                                       visual_zero_strb_next <= 1'b0;
                                       setwrcntto1 <= MASTER_HWRITE;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                    else
                                    begin
                                       visual_cycle_in_progress_next <= 1'b0;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                 end
                                 else
                                 begin
                                    int_masterARVALID <= 1;
                                    if (int_masterARREADY)
                                    begin
                                       visual_cycle_in_progress_next <= 1;
                                       MASTER_HREADY <= 1;
                                       visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                       visual_ahb_write_op_next <= MASTER_HWRITE;
                                       visual_ph_cnt_next <= 0;
                                       visual_valid_data_avail_next <= 1;
                                       visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                       visual_hsize_latched_next <= MASTER_HSIZE;
                                       visual_zero_strb_next <= 1'b0;
                                       setwrcntto1 <= MASTER_HWRITE;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                    else
                                    begin
                                       visual_cycle_in_progress_next <= 1'b0;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                 end
                              end
                              else
                              begin
                                 MASTER_HREADY <= 1;
                                 visual_cycle_in_progress_next <= 0;
                                 visual_valid_data_avail_next <= 0;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                           end
                           else
                           begin
                              visual_AHB_SM_next <= WAIT_LAST_BVALID;
                           end
                        end
                        else if (new_cycle)
                        begin
                           if (MASTER_HWRITE)
                           begin
                              int_masterAWVALID <= 1;
                              if (int_masterAWREADY)
                              begin
                                 visual_cycle_in_progress_next <= 1;
                                 MASTER_HREADY <= 1;
                                 visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                 visual_ahb_write_op_next <= MASTER_HWRITE;
                                 visual_ph_cnt_next <= 0;
                                 visual_valid_data_avail_next <= 1;
                                 visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                 visual_hsize_latched_next <= MASTER_HSIZE;
                                 visual_zero_strb_next <= 1'b0;
                                 setwrcntto1 <= MASTER_HWRITE;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                              else
                              begin
                                 visual_cycle_in_progress_next <= 1'b0;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                           end
                           else
                           begin
                              int_masterARVALID <= 1;
                              if (int_masterARREADY)
                              begin
                                 visual_cycle_in_progress_next <= 1;
                                 MASTER_HREADY <= 1;
                                 visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                 visual_ahb_write_op_next <= MASTER_HWRITE;
                                 visual_ph_cnt_next <= 0;
                                 visual_valid_data_avail_next <= 1;
                                 visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                 visual_hsize_latched_next <= MASTER_HSIZE;
                                 visual_zero_strb_next <= 1'b0;
                                 setwrcntto1 <= MASTER_HWRITE;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                              else
                              begin
                                 visual_cycle_in_progress_next <= 1'b0;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                           end
                        end
                        else
                        begin
                           MASTER_HREADY <= 1;
                           visual_cycle_in_progress_next <= 0;
                           visual_valid_data_avail_next <= 0;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                     else if (new_cycle)
                     begin
                        if (MASTER_HWRITE)
                        begin
                           int_masterAWVALID <= 1;
                           if (int_masterAWREADY)
                           begin
                              visual_cycle_in_progress_next <= 1;
                              MASTER_HREADY <= 1;
                              visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                              visual_ahb_write_op_next <= MASTER_HWRITE;
                              visual_ph_cnt_next <= 0;
                              visual_valid_data_avail_next <= 1;
                              visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                              visual_hsize_latched_next <= MASTER_HSIZE;
                              visual_zero_strb_next <= 1'b0;
                              setwrcntto1 <= MASTER_HWRITE;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                           else
                           begin
                              visual_cycle_in_progress_next <= 1'b0;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                        end
                        else
                        begin
                           int_masterARVALID <= 1;
                           if (int_masterARREADY)
                           begin
                              visual_cycle_in_progress_next <= 1;
                              MASTER_HREADY <= 1;
                              visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                              visual_ahb_write_op_next <= MASTER_HWRITE;
                              visual_ph_cnt_next <= 0;
                              visual_valid_data_avail_next <= 1;
                              visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                              visual_hsize_latched_next <= MASTER_HSIZE;
                              visual_zero_strb_next <= 1'b0;
                              setwrcntto1 <= MASTER_HWRITE;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                           else
                           begin
                              visual_cycle_in_progress_next <= 1'b0;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                        end
                     end
                     else
                     begin
                        MASTER_HREADY <= 1;
                        visual_cycle_in_progress_next <= 0;
                        visual_valid_data_avail_next <= 0;
                        visual_AHB_SM_next <= DATA_TRANSF;
                     end
                  end
                  else
                  begin
                     visual_AHB_SM_next <= AXI_EXTEND;
                  end
               end
               else
               begin
                  visual_AHB_SM_next <= AXI_EXTEND;
               end
            end
 
         DATA_TRANSF:
            begin
               MASTER_HRDATA <= int_masterRDATA_hold;
               int_masterBREADY <= (check_all) ? 1'b0 : 1'b1;
               if (end_cycle)
               begin
                  if (cycle_in_progress)
                  begin
                     if (valid_data_avail)
                     begin
                        if (ahb_write_op)
                        begin
                           int_masterWVALID <= 1;
                           int_masterWLAST <= count_match;
                           if (int_masterWREADY)
                           begin
                              visual_ph_cnt_next <= ph_cnt + 1;
                              if (count_match)
                              begin
                                 if (check_end)
                                 begin
                                    if (ahb_write_op)
                                    begin
                                       int_masterBREADY <= 1'b1;
                                       if (wrcnt == 0)
                                       begin
                                          if (wrerr)
                                          begin
                                             //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                                             visual_cycle_in_progress_next <= 1'b0;
                                             MASTER_HRESP <= 1'b1;
                                             visual_AHB_SM_next <= ERROR;
                                          end
                                          else if (new_cycle)
                                          begin
                                             if (MASTER_HWRITE)
                                             begin
                                                int_masterAWVALID <= 1;
                                                if (int_masterAWREADY)
                                                begin
                                                  visual_cycle_in_progress_next <= 1;
                                                  MASTER_HREADY <= 1;
                                                  visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                                  visual_ahb_write_op_next <= MASTER_HWRITE;
                                                  visual_ph_cnt_next <= 0;
                                                  visual_valid_data_avail_next <= 1;
                                                  visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                                  visual_hsize_latched_next <= MASTER_HSIZE;
                                                  visual_zero_strb_next <= 1'b0;
                                                  setwrcntto1 <= MASTER_HWRITE;
                                                  visual_AHB_SM_next <= DATA_TRANSF;
                                                end
                                                else
                                                begin
                                                  visual_cycle_in_progress_next <= 1'b0;
                                                  visual_AHB_SM_next <= DATA_TRANSF;
                                                end
                                             end
                                             else
                                             begin
                                                int_masterARVALID <= 1;
                                                if (int_masterARREADY)
                                                begin
                                                  visual_cycle_in_progress_next <= 1;
                                                  MASTER_HREADY <= 1;
                                                  visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                                  visual_ahb_write_op_next <= MASTER_HWRITE;
                                                  visual_ph_cnt_next <= 0;
                                                  visual_valid_data_avail_next <= 1;
                                                  visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                                  visual_hsize_latched_next <= MASTER_HSIZE;
                                                  visual_zero_strb_next <= 1'b0;
                                                  setwrcntto1 <= MASTER_HWRITE;
                                                  visual_AHB_SM_next <= DATA_TRANSF;
                                                end
                                                else
                                                begin
                                                  visual_cycle_in_progress_next <= 1'b0;
                                                  visual_AHB_SM_next <= DATA_TRANSF;
                                                end
                                             end
                                          end
                                          else
                                          begin
                                             MASTER_HREADY <= 1;
                                             visual_cycle_in_progress_next <= 0;
                                             visual_valid_data_avail_next <= 0;
                                             visual_AHB_SM_next <= DATA_TRANSF;
                                          end
                                       end
                                       else
                                       begin
                                          visual_AHB_SM_next <= WAIT_LAST_BVALID;
                                       end
                                    end
                                    else if (new_cycle)
                                    begin
                                       if (MASTER_HWRITE)
                                       begin
                                          int_masterAWVALID <= 1;
                                          if (int_masterAWREADY)
                                          begin
                                             visual_cycle_in_progress_next <= 1;
                                             MASTER_HREADY <= 1;
                                             visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                             visual_ahb_write_op_next <= MASTER_HWRITE;
                                             visual_ph_cnt_next <= 0;
                                             visual_valid_data_avail_next <= 1;
                                             visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                             visual_hsize_latched_next <= MASTER_HSIZE;
                                             visual_zero_strb_next <= 1'b0;
                                             setwrcntto1 <= MASTER_HWRITE;
                                             visual_AHB_SM_next <= DATA_TRANSF;
                                          end
                                          else
                                          begin
                                             visual_cycle_in_progress_next <= 1'b0;
                                             visual_AHB_SM_next <= DATA_TRANSF;
                                          end
                                       end
                                       else
                                       begin
                                          int_masterARVALID <= 1;
                                          if (int_masterARREADY)
                                          begin
                                             visual_cycle_in_progress_next <= 1;
                                             MASTER_HREADY <= 1;
                                             visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                             visual_ahb_write_op_next <= MASTER_HWRITE;
                                             visual_ph_cnt_next <= 0;
                                             visual_valid_data_avail_next <= 1;
                                             visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                             visual_hsize_latched_next <= MASTER_HSIZE;
                                             visual_zero_strb_next <= 1'b0;
                                             setwrcntto1 <= MASTER_HWRITE;
                                             visual_AHB_SM_next <= DATA_TRANSF;
                                          end
                                          else
                                          begin
                                             visual_cycle_in_progress_next <= 1'b0;
                                             visual_AHB_SM_next <= DATA_TRANSF;
                                          end
                                       end
                                    end
                                    else
                                    begin
                                       MASTER_HREADY <= 1;
                                       visual_cycle_in_progress_next <= 0;
                                       visual_valid_data_avail_next <= 0;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                 end
                                 else if (new_cycle)
                                 begin
                                    if (MASTER_HWRITE)
                                    begin
                                       int_masterAWVALID <= 1;
                                       if (int_masterAWREADY)
                                       begin
                                          visual_cycle_in_progress_next <= 1;
                                          MASTER_HREADY <= 1;
                                          visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                          visual_ahb_write_op_next <= MASTER_HWRITE;
                                          visual_ph_cnt_next <= 0;
                                          visual_valid_data_avail_next <= 1;
                                          visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                          visual_hsize_latched_next <= MASTER_HSIZE;
                                          visual_zero_strb_next <= 1'b0;
                                          setwrcntto1 <= MASTER_HWRITE;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                       else
                                       begin
                                          visual_cycle_in_progress_next <= 1'b0;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                    end
                                    else
                                    begin
                                       int_masterARVALID <= 1;
                                       if (int_masterARREADY)
                                       begin
                                          visual_cycle_in_progress_next <= 1;
                                          MASTER_HREADY <= 1;
                                          visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                          visual_ahb_write_op_next <= MASTER_HWRITE;
                                          visual_ph_cnt_next <= 0;
                                          visual_valid_data_avail_next <= 1;
                                          visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                          visual_hsize_latched_next <= MASTER_HSIZE;
                                          visual_zero_strb_next <= 1'b0;
                                          setwrcntto1 <= MASTER_HWRITE;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                       else
                                       begin
                                          visual_cycle_in_progress_next <= 1'b0;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                    end
                                 end
                                 else
                                 begin
                                    MASTER_HREADY <= 1;
                                    visual_cycle_in_progress_next <= 0;
                                    visual_valid_data_avail_next <= 0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                              else
                              begin
                                 visual_zero_strb_next <= 1'b1;
                                 //  AXI data are always valid because we are extending the transaction.
                                 //  We don't rely anymore upon AHB control signals
                                 visual_valid_data_avail_next <= 1'b1;
                                 visual_AHB_SM_next <= AXI_EXTEND;
                              end
                           end
                           else
                           begin
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                        end
                        else if (int_masterRVALID)
                        begin
                           int_masterRREADY <= 1;
                           MASTER_HRDATA <= int_masterRDATA;
                           visual_int_masterRDATA_hold_next <= int_masterRDATA;
                           MASTER_HRESP <= int_masterRRESP[1];
                           visual_ph_cnt_next <= ph_cnt + 1;
                           if (int_masterRRESP[1])
                           begin
                              //  AHB transaction is aborted and AXI transaction end only if count_match is asserted.
                              //  If count_match is low, we have to wait all read data from the AXI side and finish up the transaction
                              visual_cycle_in_progress_next <= ~(count_match);
                              MASTER_HRESP <= 1'b1;
                              visual_AHB_SM_next <= ERROR;
                           end
                           else if (count_match)
                           begin
                              if (check_end)
                              begin
                                 if (ahb_write_op)
                                 begin
                                    int_masterBREADY <= 1'b1;
                                    if (wrcnt == 0)
                                    begin
                                       if (wrerr)
                                       begin
                                          //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                                          visual_cycle_in_progress_next <= 1'b0;
                                          MASTER_HRESP <= 1'b1;
                                          visual_AHB_SM_next <= ERROR;
                                       end
                                       else if (new_cycle)
                                       begin
                                          if (MASTER_HWRITE)
                                          begin
                                             int_masterAWVALID <= 1;
                                             if (int_masterAWREADY)
                                             begin
                                                visual_cycle_in_progress_next <= 1;
                                                MASTER_HREADY <= 1;
                                                visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                                visual_ahb_write_op_next <= MASTER_HWRITE;
                                                visual_ph_cnt_next <= 0;
                                                visual_valid_data_avail_next <= 1;
                                                visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                                visual_hsize_latched_next <= MASTER_HSIZE;
                                                visual_zero_strb_next <= 1'b0;
                                                setwrcntto1 <= MASTER_HWRITE;
                                                visual_AHB_SM_next <= DATA_TRANSF;
                                             end
                                             else
                                             begin
                                                visual_cycle_in_progress_next <= 1'b0;
                                                visual_AHB_SM_next <= DATA_TRANSF;
                                             end
                                          end
                                          else
                                          begin
                                             int_masterARVALID <= 1;
                                             if (int_masterARREADY)
                                             begin
                                                visual_cycle_in_progress_next <= 1;
                                                MASTER_HREADY <= 1;
                                                visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                                visual_ahb_write_op_next <= MASTER_HWRITE;
                                                visual_ph_cnt_next <= 0;
                                                visual_valid_data_avail_next <= 1;
                                                visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                                visual_hsize_latched_next <= MASTER_HSIZE;
                                                visual_zero_strb_next <= 1'b0;
                                                setwrcntto1 <= MASTER_HWRITE;
                                                visual_AHB_SM_next <= DATA_TRANSF;
                                             end
                                             else
                                             begin
                                                visual_cycle_in_progress_next <= 1'b0;
                                                visual_AHB_SM_next <= DATA_TRANSF;
                                             end
                                          end
                                       end
                                       else
                                       begin
                                          MASTER_HREADY <= 1;
                                          visual_cycle_in_progress_next <= 0;
                                          visual_valid_data_avail_next <= 0;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                    end
                                    else
                                    begin
                                       visual_AHB_SM_next <= WAIT_LAST_BVALID;
                                    end
                                 end
                                 else if (new_cycle)
                                 begin
                                    if (MASTER_HWRITE)
                                    begin
                                       int_masterAWVALID <= 1;
                                       if (int_masterAWREADY)
                                       begin
                                          visual_cycle_in_progress_next <= 1;
                                          MASTER_HREADY <= 1;
                                          visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                          visual_ahb_write_op_next <= MASTER_HWRITE;
                                          visual_ph_cnt_next <= 0;
                                          visual_valid_data_avail_next <= 1;
                                          visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                          visual_hsize_latched_next <= MASTER_HSIZE;
                                          visual_zero_strb_next <= 1'b0;
                                          setwrcntto1 <= MASTER_HWRITE;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                       else
                                       begin
                                          visual_cycle_in_progress_next <= 1'b0;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                    end
                                    else
                                    begin
                                       int_masterARVALID <= 1;
                                       if (int_masterARREADY)
                                       begin
                                          visual_cycle_in_progress_next <= 1;
                                          MASTER_HREADY <= 1;
                                          visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                          visual_ahb_write_op_next <= MASTER_HWRITE;
                                          visual_ph_cnt_next <= 0;
                                          visual_valid_data_avail_next <= 1;
                                          visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                          visual_hsize_latched_next <= MASTER_HSIZE;
                                          visual_zero_strb_next <= 1'b0;
                                          setwrcntto1 <= MASTER_HWRITE;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                       else
                                       begin
                                          visual_cycle_in_progress_next <= 1'b0;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                    end
                                 end
                                 else
                                 begin
                                    MASTER_HREADY <= 1;
                                    visual_cycle_in_progress_next <= 0;
                                    visual_valid_data_avail_next <= 0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                              else if (new_cycle)
                              begin
                                 if (MASTER_HWRITE)
                                 begin
                                    int_masterAWVALID <= 1;
                                    if (int_masterAWREADY)
                                    begin
                                       visual_cycle_in_progress_next <= 1;
                                       MASTER_HREADY <= 1;
                                       visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                       visual_ahb_write_op_next <= MASTER_HWRITE;
                                       visual_ph_cnt_next <= 0;
                                       visual_valid_data_avail_next <= 1;
                                       visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                       visual_hsize_latched_next <= MASTER_HSIZE;
                                       visual_zero_strb_next <= 1'b0;
                                       setwrcntto1 <= MASTER_HWRITE;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                    else
                                    begin
                                       visual_cycle_in_progress_next <= 1'b0;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                 end
                                 else
                                 begin
                                    int_masterARVALID <= 1;
                                    if (int_masterARREADY)
                                    begin
                                       visual_cycle_in_progress_next <= 1;
                                       MASTER_HREADY <= 1;
                                       visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                       visual_ahb_write_op_next <= MASTER_HWRITE;
                                       visual_ph_cnt_next <= 0;
                                       visual_valid_data_avail_next <= 1;
                                       visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                       visual_hsize_latched_next <= MASTER_HSIZE;
                                       visual_zero_strb_next <= 1'b0;
                                       setwrcntto1 <= MASTER_HWRITE;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                    else
                                    begin
                                       visual_cycle_in_progress_next <= 1'b0;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                 end
                              end
                              else
                              begin
                                 MASTER_HREADY <= 1;
                                 visual_cycle_in_progress_next <= 0;
                                 visual_valid_data_avail_next <= 0;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                           end
                           else
                           begin
                              visual_zero_strb_next <= 1'b1;
                              //  AXI data are always valid because we are extending the transaction.
                              //  We don't rely anymore upon AHB control signals
                              visual_valid_data_avail_next <= 1'b1;
                              visual_AHB_SM_next <= AXI_EXTEND;
                           end
                        end
                        else
                        begin
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                     else if (count_match)
                     begin
                        if (check_end)
                        begin
                           if (ahb_write_op)
                           begin
                              int_masterBREADY <= 1'b1;
                              if (wrcnt == 0)
                              begin
                                 if (wrerr)
                                 begin
                                    //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                                    visual_cycle_in_progress_next <= 1'b0;
                                    MASTER_HRESP <= 1'b1;
                                    visual_AHB_SM_next <= ERROR;
                                 end
                                 else if (new_cycle)
                                 begin
                                    if (MASTER_HWRITE)
                                    begin
                                       int_masterAWVALID <= 1;
                                       if (int_masterAWREADY)
                                       begin
                                          visual_cycle_in_progress_next <= 1;
                                          MASTER_HREADY <= 1;
                                          visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                          visual_ahb_write_op_next <= MASTER_HWRITE;
                                          visual_ph_cnt_next <= 0;
                                          visual_valid_data_avail_next <= 1;
                                          visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                          visual_hsize_latched_next <= MASTER_HSIZE;
                                          visual_zero_strb_next <= 1'b0;
                                          setwrcntto1 <= MASTER_HWRITE;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                       else
                                       begin
                                          visual_cycle_in_progress_next <= 1'b0;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                    end
                                    else
                                    begin
                                       int_masterARVALID <= 1;
                                       if (int_masterARREADY)
                                       begin
                                          visual_cycle_in_progress_next <= 1;
                                          MASTER_HREADY <= 1;
                                          visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                          visual_ahb_write_op_next <= MASTER_HWRITE;
                                          visual_ph_cnt_next <= 0;
                                          visual_valid_data_avail_next <= 1;
                                          visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                          visual_hsize_latched_next <= MASTER_HSIZE;
                                          visual_zero_strb_next <= 1'b0;
                                          setwrcntto1 <= MASTER_HWRITE;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                       else
                                       begin
                                          visual_cycle_in_progress_next <= 1'b0;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                    end
                                 end
                                 else
                                 begin
                                    MASTER_HREADY <= 1;
                                    visual_cycle_in_progress_next <= 0;
                                    visual_valid_data_avail_next <= 0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                              else
                              begin
                                 visual_AHB_SM_next <= WAIT_LAST_BVALID;
                              end
                           end
                           else if (new_cycle)
                           begin
                              if (MASTER_HWRITE)
                              begin
                                 int_masterAWVALID <= 1;
                                 if (int_masterAWREADY)
                                 begin
                                    visual_cycle_in_progress_next <= 1;
                                    MASTER_HREADY <= 1;
                                    visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                    visual_ahb_write_op_next <= MASTER_HWRITE;
                                    visual_ph_cnt_next <= 0;
                                    visual_valid_data_avail_next <= 1;
                                    visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                    visual_hsize_latched_next <= MASTER_HSIZE;
                                    visual_zero_strb_next <= 1'b0;
                                    setwrcntto1 <= MASTER_HWRITE;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                                 else
                                 begin
                                    visual_cycle_in_progress_next <= 1'b0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                              else
                              begin
                                 int_masterARVALID <= 1;
                                 if (int_masterARREADY)
                                 begin
                                    visual_cycle_in_progress_next <= 1;
                                    MASTER_HREADY <= 1;
                                    visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                    visual_ahb_write_op_next <= MASTER_HWRITE;
                                    visual_ph_cnt_next <= 0;
                                    visual_valid_data_avail_next <= 1;
                                    visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                    visual_hsize_latched_next <= MASTER_HSIZE;
                                    visual_zero_strb_next <= 1'b0;
                                    setwrcntto1 <= MASTER_HWRITE;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                                 else
                                 begin
                                    visual_cycle_in_progress_next <= 1'b0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                           end
                           else
                           begin
                              MASTER_HREADY <= 1;
                              visual_cycle_in_progress_next <= 0;
                              visual_valid_data_avail_next <= 0;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                        end
                        else if (new_cycle)
                        begin
                           if (MASTER_HWRITE)
                           begin
                              int_masterAWVALID <= 1;
                              if (int_masterAWREADY)
                              begin
                                 visual_cycle_in_progress_next <= 1;
                                 MASTER_HREADY <= 1;
                                 visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                 visual_ahb_write_op_next <= MASTER_HWRITE;
                                 visual_ph_cnt_next <= 0;
                                 visual_valid_data_avail_next <= 1;
                                 visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                 visual_hsize_latched_next <= MASTER_HSIZE;
                                 visual_zero_strb_next <= 1'b0;
                                 setwrcntto1 <= MASTER_HWRITE;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                              else
                              begin
                                 visual_cycle_in_progress_next <= 1'b0;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                           end
                           else
                           begin
                              int_masterARVALID <= 1;
                              if (int_masterARREADY)
                              begin
                                 visual_cycle_in_progress_next <= 1;
                                 MASTER_HREADY <= 1;
                                 visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                                 visual_ahb_write_op_next <= MASTER_HWRITE;
                                 visual_ph_cnt_next <= 0;
                                 visual_valid_data_avail_next <= 1;
                                 visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                 visual_hsize_latched_next <= MASTER_HSIZE;
                                 visual_zero_strb_next <= 1'b0;
                                 setwrcntto1 <= MASTER_HWRITE;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                              else
                              begin
                                 visual_cycle_in_progress_next <= 1'b0;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                           end
                        end
                        else
                        begin
                           MASTER_HREADY <= 1;
                           visual_cycle_in_progress_next <= 0;
                           visual_valid_data_avail_next <= 0;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                     else
                     begin
                        visual_zero_strb_next <= 1'b1;
                        //  AXI data are always valid because we are extending the transaction.
                        //  We don't rely anymore upon AHB control signals
                        visual_valid_data_avail_next <= 1'b1;
                        visual_AHB_SM_next <= AXI_EXTEND;
                     end
                  end
                  else if (new_cycle)
                  begin
                     if (MASTER_HWRITE)
                     begin
                        int_masterAWVALID <= 1;
                        if (int_masterAWREADY)
                        begin
                           visual_cycle_in_progress_next <= 1;
                           MASTER_HREADY <= 1;
                           visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                           visual_ahb_write_op_next <= MASTER_HWRITE;
                           visual_ph_cnt_next <= 0;
                           visual_valid_data_avail_next <= 1;
                           visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                           visual_hsize_latched_next <= MASTER_HSIZE;
                           visual_zero_strb_next <= 1'b0;
                           setwrcntto1 <= MASTER_HWRITE;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                        else
                        begin
                           visual_cycle_in_progress_next <= 1'b0;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                     else
                     begin
                        int_masterARVALID <= 1;
                        if (int_masterARREADY)
                        begin
                           visual_cycle_in_progress_next <= 1;
                           MASTER_HREADY <= 1;
                           visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                           visual_ahb_write_op_next <= MASTER_HWRITE;
                           visual_ph_cnt_next <= 0;
                           visual_valid_data_avail_next <= 1;
                           visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                           visual_hsize_latched_next <= MASTER_HSIZE;
                           visual_zero_strb_next <= 1'b0;
                           setwrcntto1 <= MASTER_HWRITE;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                        else
                        begin
                           visual_cycle_in_progress_next <= 1'b0;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                  end
                  else
                  begin
                     MASTER_HREADY <= 1'b1;
                     visual_AHB_SM_next <= DATA_TRANSF;
                  end
               end
               else if (check_end)
               begin
                  if (wrcntmax)
                  begin
                     visual_AHB_SM_next <= DATA_TRANSF;
                  end
                  else if (valid_data_avail)
                  begin
                     if (ahb_write_op)
                     begin
                        int_masterWVALID <= 1;
                        int_masterWLAST <= count_match;
                        if (int_masterWREADY)
                        begin
                           visual_ph_cnt_next <= ph_cnt + 1;
                           if (BUSY)
                           begin
                              visual_valid_data_avail_next <= 0;
                              MASTER_HREADY <= 1;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                           else if (count_match)
                           begin
                              if (MASTER_HWRITE)
                              begin
                                 if (check_all)
                                 begin
                                    if (wrcnt[0] == 0)
                                    begin
                                       int_masterAWVALID <= 1;
                                       if (int_masterAWREADY)
                                       begin
                                          visual_ph_cnt_next <= 0;
                                          MASTER_HREADY <= 1;
                                          visual_valid_data_avail_next <= 1;
                                          visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                          visual_hsize_latched_next <= MASTER_HSIZE;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                       else
                                       begin
                                          visual_valid_data_avail_next <= 1'b0;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                    end
                                    else
                                    begin
                                       int_masterBREADY <= 1'b1;
                                       if (int_masterBVALID)
                                       begin
                                          if (int_masterBRESP[1])
                                          begin
                                             //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                                             visual_cycle_in_progress_next <= 1'b0;
                                             MASTER_HRESP <= 1'b1;
                                             visual_AHB_SM_next <= ERROR;
                                          end
                                          else
                                          begin
                                             int_masterAWVALID <= 1;
                                             if (int_masterAWREADY)
                                             begin
                                                visual_ph_cnt_next <= 0;
                                                MASTER_HREADY <= 1;
                                                visual_valid_data_avail_next <= 1;
                                                visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                                visual_hsize_latched_next <= MASTER_HSIZE;
                                                visual_AHB_SM_next <= DATA_TRANSF;
                                             end
                                             else
                                             begin
                                                visual_valid_data_avail_next <= 1'b0;
                                                visual_AHB_SM_next <= DATA_TRANSF;
                                             end
                                          end
                                       end
                                       else
                                       begin
                                          visual_AHB_SM_next <= WAIT_BVALID;
                                       end
                                    end
                                 end
                                 else
                                 begin
                                    int_masterAWVALID <= 1;
                                    if (int_masterAWREADY)
                                    begin
                                       visual_ph_cnt_next <= 0;
                                       MASTER_HREADY <= 1;
                                       visual_valid_data_avail_next <= 1;
                                       visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                       visual_hsize_latched_next <= MASTER_HSIZE;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                    else
                                    begin
                                       visual_valid_data_avail_next <= 1'b0;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                 end
                              end
                              else
                              begin
                                 int_masterARVALID <= 1;
                                 if (int_masterARREADY)
                                 begin
                                    visual_ph_cnt_next <= 0;
                                    MASTER_HREADY <= 1;
                                    visual_valid_data_avail_next <= 1;
                                    visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                    visual_hsize_latched_next <= MASTER_HSIZE;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                                 else
                                 begin
                                    visual_valid_data_avail_next <= 1'b0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                           end
                           else
                           begin
                              MASTER_HREADY <= 1;
                              visual_valid_data_avail_next <= 1;
                              visual_haddr_latched_next <= MASTER_HADDR[5:0];
                              visual_hsize_latched_next <= MASTER_HSIZE;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                        end
                        else
                        begin
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                     else if (int_masterRVALID)
                     begin
                        int_masterRREADY <= 1;
                        MASTER_HRDATA <= int_masterRDATA;
                        visual_int_masterRDATA_hold_next <= int_masterRDATA;
                        visual_ph_cnt_next <= ph_cnt + 1;
                        if (int_masterRRESP[1])
                        begin
                           //  AHB transaction is aborted and AXI transaction end only if count_match is asserted.
                           //  If count_match is low, we have to wait all read data from the AXI side and finish up the transaction
                           visual_cycle_in_progress_next <= ~(count_match);
                           MASTER_HRESP <= 1'b1;
                           visual_AHB_SM_next <= ERROR;
                        end
                        else if (BUSY)
                        begin
                           visual_valid_data_avail_next <= 0;
                           MASTER_HREADY <= 1;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                        else if (count_match)
                        begin
                           if (MASTER_HWRITE)
                           begin
                              if (check_all)
                              begin
                                 if (wrcnt[0] == 0)
                                 begin
                                    int_masterAWVALID <= 1;
                                    if (int_masterAWREADY)
                                    begin
                                       visual_ph_cnt_next <= 0;
                                       MASTER_HREADY <= 1;
                                       visual_valid_data_avail_next <= 1;
                                       visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                       visual_hsize_latched_next <= MASTER_HSIZE;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                    else
                                    begin
                                       visual_valid_data_avail_next <= 1'b0;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                 end
                                 else
                                 begin
                                    int_masterBREADY <= 1'b1;
                                    if (int_masterBVALID)
                                    begin
                                       if (int_masterBRESP[1])
                                       begin
                                          //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                                          visual_cycle_in_progress_next <= 1'b0;
                                          MASTER_HRESP <= 1'b1;
                                          visual_AHB_SM_next <= ERROR;
                                       end
                                       else
                                       begin
                                          int_masterAWVALID <= 1;
                                          if (int_masterAWREADY)
                                          begin
                                             visual_ph_cnt_next <= 0;
                                             MASTER_HREADY <= 1;
                                             visual_valid_data_avail_next <= 1;
                                             visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                             visual_hsize_latched_next <= MASTER_HSIZE;
                                             visual_AHB_SM_next <= DATA_TRANSF;
                                          end
                                          else
                                          begin
                                             visual_valid_data_avail_next <= 1'b0;
                                             visual_AHB_SM_next <= DATA_TRANSF;
                                          end
                                       end
                                    end
                                    else
                                    begin
                                       visual_AHB_SM_next <= WAIT_BVALID;
                                    end
                                 end
                              end
                              else
                              begin
                                 int_masterAWVALID <= 1;
                                 if (int_masterAWREADY)
                                 begin
                                    visual_ph_cnt_next <= 0;
                                    MASTER_HREADY <= 1;
                                    visual_valid_data_avail_next <= 1;
                                    visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                    visual_hsize_latched_next <= MASTER_HSIZE;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                                 else
                                 begin
                                    visual_valid_data_avail_next <= 1'b0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                           end
                           else
                           begin
                              int_masterARVALID <= 1;
                              if (int_masterARREADY)
                              begin
                                 visual_ph_cnt_next <= 0;
                                 MASTER_HREADY <= 1;
                                 visual_valid_data_avail_next <= 1;
                                 visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                 visual_hsize_latched_next <= MASTER_HSIZE;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                              else
                              begin
                                 visual_valid_data_avail_next <= 1'b0;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                           end
                        end
                        else
                        begin
                           MASTER_HREADY <= 1;
                           visual_valid_data_avail_next <= 1;
                           visual_haddr_latched_next <= MASTER_HADDR[5:0];
                           visual_hsize_latched_next <= MASTER_HSIZE;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                     else
                     begin
                        visual_AHB_SM_next <= DATA_TRANSF;
                     end
                  end
                  else if (BUSY)
                  begin
                     visual_valid_data_avail_next <= 0;
                     MASTER_HREADY <= 1;
                     visual_AHB_SM_next <= DATA_TRANSF;
                  end
                  else if (count_match)
                  begin
                     if (MASTER_HWRITE)
                     begin
                        if (check_all)
                        begin
                           if (wrcnt[0] == 0)
                           begin
                              int_masterAWVALID <= 1;
                              if (int_masterAWREADY)
                              begin
                                 visual_ph_cnt_next <= 0;
                                 MASTER_HREADY <= 1;
                                 visual_valid_data_avail_next <= 1;
                                 visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                 visual_hsize_latched_next <= MASTER_HSIZE;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                              else
                              begin
                                 visual_valid_data_avail_next <= 1'b0;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                           end
                           else
                           begin
                              int_masterBREADY <= 1'b1;
                              if (int_masterBVALID)
                              begin
                                 if (int_masterBRESP[1])
                                 begin
                                    //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                                    visual_cycle_in_progress_next <= 1'b0;
                                    MASTER_HRESP <= 1'b1;
                                    visual_AHB_SM_next <= ERROR;
                                 end
                                 else
                                 begin
                                    int_masterAWVALID <= 1;
                                    if (int_masterAWREADY)
                                    begin
                                       visual_ph_cnt_next <= 0;
                                       MASTER_HREADY <= 1;
                                       visual_valid_data_avail_next <= 1;
                                       visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                       visual_hsize_latched_next <= MASTER_HSIZE;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                    else
                                    begin
                                       visual_valid_data_avail_next <= 1'b0;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                 end
                              end
                              else
                              begin
                                 visual_AHB_SM_next <= WAIT_BVALID;
                              end
                           end
                        end
                        else
                        begin
                           int_masterAWVALID <= 1;
                           if (int_masterAWREADY)
                           begin
                              visual_ph_cnt_next <= 0;
                              MASTER_HREADY <= 1;
                              visual_valid_data_avail_next <= 1;
                              visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                              visual_hsize_latched_next <= MASTER_HSIZE;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                           else
                           begin
                              visual_valid_data_avail_next <= 1'b0;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                        end
                     end
                     else
                     begin
                        int_masterARVALID <= 1;
                        if (int_masterARREADY)
                        begin
                           visual_ph_cnt_next <= 0;
                           MASTER_HREADY <= 1;
                           visual_valid_data_avail_next <= 1;
                           visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                           visual_hsize_latched_next <= MASTER_HSIZE;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                        else
                        begin
                           visual_valid_data_avail_next <= 1'b0;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                  end
                  else
                  begin
                     MASTER_HREADY <= 1;
                     visual_valid_data_avail_next <= 1;
                     visual_haddr_latched_next <= MASTER_HADDR[5:0];
                     visual_hsize_latched_next <= MASTER_HSIZE;
                     visual_AHB_SM_next <= DATA_TRANSF;
                  end
               end
               else if (valid_data_avail)
               begin
                  if (ahb_write_op)
                  begin
                     int_masterWVALID <= 1;
                     int_masterWLAST <= count_match;
                     if (int_masterWREADY)
                     begin
                        visual_ph_cnt_next <= ph_cnt + 1;
                        if (BUSY)
                        begin
                           visual_valid_data_avail_next <= 0;
                           MASTER_HREADY <= 1;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                        else if (count_match)
                        begin
                           if (MASTER_HWRITE)
                           begin
                              if (check_all)
                              begin
                                 if (wrcnt[0] == 0)
                                 begin
                                    int_masterAWVALID <= 1;
                                    if (int_masterAWREADY)
                                    begin
                                       visual_ph_cnt_next <= 0;
                                       MASTER_HREADY <= 1;
                                       visual_valid_data_avail_next <= 1;
                                       visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                       visual_hsize_latched_next <= MASTER_HSIZE;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                    else
                                    begin
                                       visual_valid_data_avail_next <= 1'b0;
                                       visual_AHB_SM_next <= DATA_TRANSF;
                                    end
                                 end
                                 else
                                 begin
                                    int_masterBREADY <= 1'b1;
                                    if (int_masterBVALID)
                                    begin
                                       if (int_masterBRESP[1])
                                       begin
                                          //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                                          visual_cycle_in_progress_next <= 1'b0;
                                          MASTER_HRESP <= 1'b1;
                                          visual_AHB_SM_next <= ERROR;
                                       end
                                       else
                                       begin
                                          int_masterAWVALID <= 1;
                                          if (int_masterAWREADY)
                                          begin
                                             visual_ph_cnt_next <= 0;
                                             MASTER_HREADY <= 1;
                                             visual_valid_data_avail_next <= 1;
                                             visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                             visual_hsize_latched_next <= MASTER_HSIZE;
                                             visual_AHB_SM_next <= DATA_TRANSF;
                                          end
                                          else
                                          begin
                                             visual_valid_data_avail_next <= 1'b0;
                                             visual_AHB_SM_next <= DATA_TRANSF;
                                          end
                                       end
                                    end
                                    else
                                    begin
                                       visual_AHB_SM_next <= WAIT_BVALID;
                                    end
                                 end
                              end
                              else
                              begin
                                 int_masterAWVALID <= 1;
                                 if (int_masterAWREADY)
                                 begin
                                    visual_ph_cnt_next <= 0;
                                    MASTER_HREADY <= 1;
                                    visual_valid_data_avail_next <= 1;
                                    visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                    visual_hsize_latched_next <= MASTER_HSIZE;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                                 else
                                 begin
                                    visual_valid_data_avail_next <= 1'b0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                           end
                           else
                           begin
                              int_masterARVALID <= 1;
                              if (int_masterARREADY)
                              begin
                                 visual_ph_cnt_next <= 0;
                                 MASTER_HREADY <= 1;
                                 visual_valid_data_avail_next <= 1;
                                 visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                 visual_hsize_latched_next <= MASTER_HSIZE;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                              else
                              begin
                                 visual_valid_data_avail_next <= 1'b0;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                           end
                        end
                        else
                        begin
                           MASTER_HREADY <= 1;
                           visual_valid_data_avail_next <= 1;
                           visual_haddr_latched_next <= MASTER_HADDR[5:0];
                           visual_hsize_latched_next <= MASTER_HSIZE;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                     else
                     begin
                        visual_AHB_SM_next <= DATA_TRANSF;
                     end
                  end
                  else if (int_masterRVALID)
                  begin
                     int_masterRREADY <= 1;
                     MASTER_HRDATA <= int_masterRDATA;
                     visual_int_masterRDATA_hold_next <= int_masterRDATA;
                     visual_ph_cnt_next <= ph_cnt + 1;
                     if (int_masterRRESP[1])
                     begin
                        //  AHB transaction is aborted and AXI transaction end only if count_match is asserted.
                        //  If count_match is low, we have to wait all read data from the AXI side and finish up the transaction
                        visual_cycle_in_progress_next <= ~(count_match);
                        MASTER_HRESP <= 1'b1;
                        visual_AHB_SM_next <= ERROR;
                     end
                     else if (BUSY)
                     begin
                        visual_valid_data_avail_next <= 0;
                        MASTER_HREADY <= 1;
                        visual_AHB_SM_next <= DATA_TRANSF;
                     end
                     else if (count_match)
                     begin
                        if (MASTER_HWRITE)
                        begin
                           if (check_all)
                           begin
                              if (wrcnt[0] == 0)
                              begin
                                 int_masterAWVALID <= 1;
                                 if (int_masterAWREADY)
                                 begin
                                    visual_ph_cnt_next <= 0;
                                    MASTER_HREADY <= 1;
                                    visual_valid_data_avail_next <= 1;
                                    visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                    visual_hsize_latched_next <= MASTER_HSIZE;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                                 else
                                 begin
                                    visual_valid_data_avail_next <= 1'b0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                              else
                              begin
                                 int_masterBREADY <= 1'b1;
                                 if (int_masterBVALID)
                                 begin
                                    if (int_masterBRESP[1])
                                    begin
                                       //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                                       visual_cycle_in_progress_next <= 1'b0;
                                       MASTER_HRESP <= 1'b1;
                                       visual_AHB_SM_next <= ERROR;
                                    end
                                    else
                                    begin
                                       int_masterAWVALID <= 1;
                                       if (int_masterAWREADY)
                                       begin
                                          visual_ph_cnt_next <= 0;
                                          MASTER_HREADY <= 1;
                                          visual_valid_data_avail_next <= 1;
                                          visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                          visual_hsize_latched_next <= MASTER_HSIZE;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                       else
                                       begin
                                          visual_valid_data_avail_next <= 1'b0;
                                          visual_AHB_SM_next <= DATA_TRANSF;
                                       end
                                    end
                                 end
                                 else
                                 begin
                                    visual_AHB_SM_next <= WAIT_BVALID;
                                 end
                              end
                           end
                           else
                           begin
                              int_masterAWVALID <= 1;
                              if (int_masterAWREADY)
                              begin
                                 visual_ph_cnt_next <= 0;
                                 MASTER_HREADY <= 1;
                                 visual_valid_data_avail_next <= 1;
                                 visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                 visual_hsize_latched_next <= MASTER_HSIZE;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                              else
                              begin
                                 visual_valid_data_avail_next <= 1'b0;
                                 visual_AHB_SM_next <= DATA_TRANSF;
                              end
                           end
                        end
                        else
                        begin
                           int_masterARVALID <= 1;
                           if (int_masterARREADY)
                           begin
                              visual_ph_cnt_next <= 0;
                              MASTER_HREADY <= 1;
                              visual_valid_data_avail_next <= 1;
                              visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                              visual_hsize_latched_next <= MASTER_HSIZE;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                           else
                           begin
                              visual_valid_data_avail_next <= 1'b0;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                        end
                     end
                     else
                     begin
                        MASTER_HREADY <= 1;
                        visual_valid_data_avail_next <= 1;
                        visual_haddr_latched_next <= MASTER_HADDR[5:0];
                        visual_hsize_latched_next <= MASTER_HSIZE;
                        visual_AHB_SM_next <= DATA_TRANSF;
                     end
                  end
                  else
                  begin
                     visual_AHB_SM_next <= DATA_TRANSF;
                  end
               end
               else if (BUSY)
               begin
                  visual_valid_data_avail_next <= 0;
                  MASTER_HREADY <= 1;
                  visual_AHB_SM_next <= DATA_TRANSF;
               end
               else if (count_match)
               begin
                  if (MASTER_HWRITE)
                  begin
                     if (check_all)
                     begin
                        if (wrcnt[0] == 0)
                        begin
                           int_masterAWVALID <= 1;
                           if (int_masterAWREADY)
                           begin
                              visual_ph_cnt_next <= 0;
                              MASTER_HREADY <= 1;
                              visual_valid_data_avail_next <= 1;
                              visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                              visual_hsize_latched_next <= MASTER_HSIZE;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                           else
                           begin
                              visual_valid_data_avail_next <= 1'b0;
                              visual_AHB_SM_next <= DATA_TRANSF;
                           end
                        end
                        else
                        begin
                           int_masterBREADY <= 1'b1;
                           if (int_masterBVALID)
                           begin
                              if (int_masterBRESP[1])
                              begin
                                 //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                                 visual_cycle_in_progress_next <= 1'b0;
                                 MASTER_HRESP <= 1'b1;
                                 visual_AHB_SM_next <= ERROR;
                              end
                              else
                              begin
                                 int_masterAWVALID <= 1;
                                 if (int_masterAWREADY)
                                 begin
                                    visual_ph_cnt_next <= 0;
                                    MASTER_HREADY <= 1;
                                    visual_valid_data_avail_next <= 1;
                                    visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                                    visual_hsize_latched_next <= MASTER_HSIZE;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                                 else
                                 begin
                                    visual_valid_data_avail_next <= 1'b0;
                                    visual_AHB_SM_next <= DATA_TRANSF;
                                 end
                              end
                           end
                           else
                           begin
                              visual_AHB_SM_next <= WAIT_BVALID;
                           end
                        end
                     end
                     else
                     begin
                        int_masterAWVALID <= 1;
                        if (int_masterAWREADY)
                        begin
                           visual_ph_cnt_next <= 0;
                           MASTER_HREADY <= 1;
                           visual_valid_data_avail_next <= 1;
                           visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                           visual_hsize_latched_next <= MASTER_HSIZE;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                        else
                        begin
                           visual_valid_data_avail_next <= 1'b0;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                  end
                  else
                  begin
                     int_masterARVALID <= 1;
                     if (int_masterARREADY)
                     begin
                        visual_ph_cnt_next <= 0;
                        MASTER_HREADY <= 1;
                        visual_valid_data_avail_next <= 1;
                        visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                        visual_hsize_latched_next <= MASTER_HSIZE;
                        visual_AHB_SM_next <= DATA_TRANSF;
                     end
                     else
                     begin
                        visual_valid_data_avail_next <= 1'b0;
                        visual_AHB_SM_next <= DATA_TRANSF;
                     end
                  end
               end
               else
               begin
                  MASTER_HREADY <= 1;
                  visual_valid_data_avail_next <= 1;
                  visual_haddr_latched_next <= MASTER_HADDR[5:0];
                  visual_hsize_latched_next <= MASTER_HSIZE;
                  visual_AHB_SM_next <= DATA_TRANSF;
               end
            end
 
         ERROR:
            begin
               visual_valid_data_avail_next <= 1'b0;
               MASTER_HRESP <= 1'b1;
               MASTER_HREADY <= 1'b1;
               visual_AHB_SM_next <= DATA_TRANSF;
            end
 
         WAIT_BVALID:
            begin
               int_masterBREADY <= 1'b1;
               if (int_masterBVALID)
               begin
                  if (int_masterBRESP[1])
                  begin
                     //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                     visual_cycle_in_progress_next <= 1'b0;
                     MASTER_HRESP <= 1'b1;
                     visual_AHB_SM_next <= ERROR;
                  end
                  else
                  begin
                     int_masterAWVALID <= 1;
                     if (int_masterAWREADY)
                     begin
                        visual_ph_cnt_next <= 0;
                        MASTER_HREADY <= 1;
                        visual_valid_data_avail_next <= 1;
                        visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                        visual_hsize_latched_next <= MASTER_HSIZE;
                        visual_AHB_SM_next <= DATA_TRANSF;
                     end
                     else
                     begin
                        visual_valid_data_avail_next <= 1'b0;
                        visual_AHB_SM_next <= DATA_TRANSF;
                     end
                  end
               end
               else
               begin
                  visual_AHB_SM_next <= WAIT_BVALID;
               end
            end
 
         WAIT_LAST_BVALID:
            begin
               int_masterBREADY <= 1'b1;
               if (wrcnt == 0)
               begin
                  if (wrerr)
                  begin
                     //  AXI is completed and AHB transaction aborted. Next time around no cyckle will be in progress
                     visual_cycle_in_progress_next <= 1'b0;
                     MASTER_HRESP <= 1'b1;
                     visual_AHB_SM_next <= ERROR;
                  end
                  else if (new_cycle)
                  begin
                     if (MASTER_HWRITE)
                     begin
                        int_masterAWVALID <= 1;
                        if (int_masterAWREADY)
                        begin
                           visual_cycle_in_progress_next <= 1;
                           MASTER_HREADY <= 1;
                           visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                           visual_ahb_write_op_next <= MASTER_HWRITE;
                           visual_ph_cnt_next <= 0;
                           visual_valid_data_avail_next <= 1;
                           visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                           visual_hsize_latched_next <= MASTER_HSIZE;
                           visual_zero_strb_next <= 1'b0;
                           setwrcntto1 <= MASTER_HWRITE;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                        else
                        begin
                           visual_cycle_in_progress_next <= 1'b0;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                     else
                     begin
                        int_masterARVALID <= 1;
                        if (int_masterARREADY)
                        begin
                           visual_cycle_in_progress_next <= 1;
                           MASTER_HREADY <= 1;
                           visual_latched_exp_burst_len_next <= exp_burst_len + 1;
                           visual_ahb_write_op_next <= MASTER_HWRITE;
                           visual_ph_cnt_next <= 0;
                           visual_valid_data_avail_next <= 1;
                           visual_haddr_latched_next <= MASTER_HADDR[LOG_BYTE_WIDTH - 1:0];
                           visual_hsize_latched_next <= MASTER_HSIZE;
                           visual_zero_strb_next <= 1'b0;
                           setwrcntto1 <= MASTER_HWRITE;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                        else
                        begin
                           visual_cycle_in_progress_next <= 1'b0;
                           visual_AHB_SM_next <= DATA_TRANSF;
                        end
                     end
                  end
                  else
                  begin
                     MASTER_HREADY <= 1;
                     visual_cycle_in_progress_next <= 0;
                     visual_valid_data_avail_next <= 0;
                     visual_AHB_SM_next <= DATA_TRANSF;
                  end
               end
               else
               begin
                  visual_AHB_SM_next <= WAIT_LAST_BVALID;
               end
            end
 
         default:
            begin
               visual_AHB_SM_next <= DATA_TRANSF;
            end
      endcase
   end
 
   always  @(posedge ACLK or negedge sysReset)
   begin : caxi4interconnect_AHB_SM
 
      if (!sysReset)
      begin
         cycle_in_progress <= 0;
         latched_exp_burst_len <= 0;
         ahb_write_op <= 0;
         ph_cnt <= 0;
         valid_data_avail <= 0;
         haddr_latched <= 0;
         hsize_latched <= 0;
         zero_strb <= 0;
         int_masterRDATA_hold <= 'h0;
         visual_AHB_SM_current <= DATA_TRANSF;
      end
      else
      begin
         ph_cnt <= visual_ph_cnt_next;
         ahb_write_op <= visual_ahb_write_op_next;
         latched_exp_burst_len <= visual_latched_exp_burst_len_next;
         cycle_in_progress <= visual_cycle_in_progress_next;
         int_masterRDATA_hold <= visual_int_masterRDATA_hold_next;
         haddr_latched <= visual_haddr_latched_next;
         hsize_latched <= visual_hsize_latched_next;
         valid_data_avail <= visual_valid_data_avail_next;
         zero_strb <= visual_zero_strb_next;
         visual_AHB_SM_current <= visual_AHB_SM_next;
      end
   end
 
 
 
   always  @(zero_strb or masterSTRB)
   begin   :strb_gen
 
      if (zero_strb)
      begin
         int_masterWSTRB <= 0;
      end
      else
      begin
         int_masterWSTRB <= masterSTRB;
      end
   end
 
 
 
   always
      @( posedge ACLK or negedge sysReset )
   begin   :bresp_cnt
 
      if (!sysReset)
      begin
         wrcnt <= 'h0;
         wrerr <= 1'b0;
      end
      else
      begin
         if (setwrcntto1)
         begin
            wrcnt <= 'h1;
            wrerr <= 1'b0;
         end
         else
         begin
            if (incrwrcnt)
            begin
               if (decwrcnt)
               begin
                  wrerr <= (wrerr & checkendonly) | int_masterBRESP[1];
               end
               else
               begin
                  wrcnt <= wrcnt + 1;
               end
            end
            else
            begin
               if (decwrcnt)
               begin
                  wrerr <= (wrerr & checkendonly) | int_masterBRESP[1];
                  wrcnt <= wrcnt - 1;
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge ACLK or negedge sysReset )
   begin   :ph_plus_1_gen
 
      if (!sysReset)
      begin
         ph_cnt_plus_1 <= 0;
      end
      else
      begin
         ph_cnt_plus_1 <= (visual_ph_cnt_next + 1'b1);
      end
   end
 
           // Write Data Channel
           assign int_masterWDATA = MASTER_HWDATA;
           assign int_masterWUSER = 'b0;
 
           // Write Address Channel
		   generate
		   if(ADDR_WIDTH > 'd32) begin
		       assign int_masterAWADDR = {{(ADDR_WIDTH-32){1'b0}}, MASTER_HADDR};
		   end else begin
		       assign int_masterAWADDR = MASTER_HADDR[ADDR_WIDTH-1:0];  
		   end
           endgenerate 
           assign int_masterAWSIZE = MASTER_HSIZE;
           assign int_masterAWID = 'b0;
           assign int_masterAWQOS = 'b0;
           assign int_masterAWREGION = 'b0;
           assign int_masterAWUSER = 'b0;
           assign int_masterAWCACHE = {MASTER_HPROT[5], MASTER_HPROT[5], MASTER_HPROT[3], MASTER_HPROT[2]};
           assign int_masterAWLOCK = { 1'b0, MASTER_HMASTLOCK};
           assign int_masterAWLEN = exp_burst_len;
           assign int_masterAWBURST = ((MASTER_HBURST[2:1] == 2'b00) || (MASTER_HBURST[0] == 1'b1)) ? 2'h1 : 2'h2;
           assign int_masterAWPROT = {~MASTER_HPROT[0], MASTER_HNONSEC, MASTER_HPROT[1]};
 
           // Read Address Channel
		   generate
		   if(ADDR_WIDTH > 'd32) begin
		       assign int_masterARADDR = {{(ADDR_WIDTH-32){1'b0}}, MASTER_HADDR};
		   end else begin
		       assign int_masterARADDR = MASTER_HADDR[ADDR_WIDTH-1:0];  
		   end
           endgenerate 
		   

           assign int_masterARSIZE = MASTER_HSIZE;
           assign int_masterARID = 'b0;
           assign int_masterARQOS = 'b0;
           assign int_masterARREGION = 'b0;
           assign int_masterARUSER = 'b0;
           assign int_masterARCACHE = {MASTER_HPROT[5], MASTER_HPROT[5], MASTER_HPROT[3], MASTER_HPROT[2]};
           assign int_masterARLOCK = { 1'b0, MASTER_HMASTLOCK};
           assign int_masterARLEN = exp_burst_len;
           assign int_masterARBURST = ((MASTER_HBURST[2:1] == 2'b00) || (MASTER_HBURST[0] == 1'b1)) ? 2'h1 : 2'h2;
           assign int_masterARPROT = {~MASTER_HPROT[0], MASTER_HNONSEC, MASTER_HPROT[1]};
 
           //assign count_match = ((ph_cnt + valid_data_avail) == latched_exp_burst_len);
           assign count_match = ((valid_data_avail ? ph_cnt_plus_1 : ph_cnt) == latched_exp_burst_len);
 
   assign SEQ = (MASTER_HTRANS == 2'b11);
           assign NONSEQ = (MASTER_HTRANS == 2'b10);
           assign BUSY = (MASTER_HTRANS == 2'b01);
        	assign IDLE = (MASTER_HTRANS == 2'b00);
 
 
           // compute burst length
           always @(*) begin
                   if (MASTER_HBURST[2:1] == 2'b01) begin
                           exp_burst_len <= 8'h3;   // INCR4 or WRAP4
                   end
                   else if (MASTER_HBURST[2:1] == 2'b10) begin
                           exp_burst_len <= 8'h7;   // INCR8 or WRAP8
                   end
                   else if (MASTER_HBURST[2:1] == 2'b11) begin
                           exp_burst_len <= 8'hf;   // INCR16 or WRAP16
                   end
                   else if (MASTER_HBURST == 3'b000) begin
                           exp_burst_len <= 8'h0;   // SINGLE
                   end
                   else if (MASTER_HBURST == 3'b001) begin
                           exp_burst_len <= DEF_BURST_LEN;  // INCR (undefined length)
                   end
                   else begin
                           exp_burst_len <= 8'hx;
                   end
           end
 
   	assign end_cycle = NONSEQ | IDLE ;
   	assign new_cycle = MASTER_HSEL & NONSEQ;
   	
   	assign size_bytes = 1 << hsize_latched; // 4 for a 32-bit transfer size
   	assign pre_shifted_strobes = (1 << size_bytes) - 1; // 0xF for a 32-bit transfer size
   	assign num_of_bytes_to_shift = haddr_latched; // haddr_latched[2:0] for a 64 bit bus
   	assign masterSTRB = pre_shifted_strobes << num_of_bytes_to_shift; // 0xF0 for 32-bit transfer size and haddr_latched equal to 0x4 on a 64-bit bus
   	
   	assign check_end = BRESP_CHECK_MODE[1];
   	assign check_all = (BRESP_CHECK_MODE == 2'b11);
   	assign checkendonly = (BRESP_CHECK_MODE == 2'b10);
   	
   	assign wrcntmax = (wrcnt == ((2**(BRESP_CNT_WIDTH)) - 1));
   	assign incrwrcnt = int_masterAWVALID && int_masterAWREADY;
   	assign decwrcnt = int_masterBREADY && int_masterBVALID;
 
 
endmodule

