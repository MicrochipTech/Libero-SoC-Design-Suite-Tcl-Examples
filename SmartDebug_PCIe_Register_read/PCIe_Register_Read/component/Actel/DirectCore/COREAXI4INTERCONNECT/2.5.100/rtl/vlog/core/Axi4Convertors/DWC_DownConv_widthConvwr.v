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
 
 
module caxi4interconnect_DWC_DownConv_widthConvwr (
                                 //  input ports
                                 ACLK,
                                 sysReset,
                                 MASTER_WSTRB,
                                 MASTER_WUSER,
                                 MASTER_WDATA,
                                 MASTER_WVALID,
                                 wrCmdFifoEmpty,
                                 wrCmdFifoRdData,
                                 SLAVE_WREADY,
                                 slaveLEN_M1,
                                 master_ADDR_masked,
                                 second_Beat_Addr,
                                 sizeCnt_comb_EQ_SizeMax,
                                 sizeCnt_comb_P1,
 
                                 //  output ports
                                 MASTER_WREADY,
                                 wrCmdFifore,
                                 SLAVE_WVALID,
                                 SLAVE_WLAST,
                                 SLAVE_WUSER,
                                 SLAVE_WDATA,
                                 SLAVE_WSTRB
                                 );
 
   parameter        DATA_WIDTH_IN             = 64;
   parameter        DATA_WIDTH_OUT            = 32;
   parameter        USER_WIDTH                = 1;
   parameter        CMD_FIFO_DATA_WIDTH       = 30;
   parameter        STRB_WIDTH_IN             = 8;
   parameter        STRB_WIDTH_OUT            = 4;
   parameter        ID_WIDTH                  = 0;
//  input ports
   input            ACLK;
   wire             ACLK;
   input            sysReset;
   wire             sysReset;
   input     [STRB_WIDTH_IN - 1:0] MASTER_WSTRB;
   wire      [STRB_WIDTH_IN - 1:0] MASTER_WSTRB;
   input     [USER_WIDTH - 1:0] MASTER_WUSER;
   wire      [USER_WIDTH - 1:0] MASTER_WUSER;
   input     [DATA_WIDTH_IN - 1:0] MASTER_WDATA;
   wire      [DATA_WIDTH_IN - 1:0] MASTER_WDATA;
   input            MASTER_WVALID;
   wire             MASTER_WVALID;
   input            wrCmdFifoEmpty;
   wire             wrCmdFifoEmpty;
   input     [CMD_FIFO_DATA_WIDTH - 1:0] wrCmdFifoRdData;
   wire      [CMD_FIFO_DATA_WIDTH - 1:0] wrCmdFifoRdData;
   input            SLAVE_WREADY;
   wire             SLAVE_WREADY;
   input     [7:0]  slaveLEN_M1;
   wire      [7:0]  slaveLEN_M1;
   input     [5:0]  master_ADDR_masked;
   wire      [5:0]  master_ADDR_masked;
   input     [5:0]  second_Beat_Addr;
   wire      [5:0]  second_Beat_Addr;
   input            sizeCnt_comb_EQ_SizeMax;
   wire             sizeCnt_comb_EQ_SizeMax;
   input     [5:0]  sizeCnt_comb_P1;
   wire      [5:0]  sizeCnt_comb_P1;
//  output ports
   output           MASTER_WREADY;
   wire             MASTER_WREADY;
   output           wrCmdFifore;
   wire             wrCmdFifore;
   output           SLAVE_WVALID;
   reg              SLAVE_WVALID;
   output           SLAVE_WLAST;
   reg              SLAVE_WLAST;
   output    [USER_WIDTH - 1:0] SLAVE_WUSER;
   reg       [USER_WIDTH - 1:0] SLAVE_WUSER;
   output    [DATA_WIDTH_OUT - 1:0] SLAVE_WDATA;
   reg       [DATA_WIDTH_OUT - 1:0] SLAVE_WDATA;
   output    [STRB_WIDTH_OUT - 1:0] SLAVE_WSTRB;
   reg       [STRB_WIDTH_OUT - 1:0] SLAVE_WSTRB;
//  local signals
   reg       [8:0]  cnt;
   wire             cnt_match;
   reg       [5:0]  current_addr;
   wire      [5:0]  int_masterADDR;
   wire      [2:0]  int_slaveSIZE;
   wire      [8:0]  int_slaveLEN;
   wire             SameMstSlvSize;
   wire      [5:0]  SizeMax;
   wire      [DATA_WIDTH_OUT - 1:0] int_slaveWDATA;
   wire      [STRB_WIDTH_OUT - 1:0] int_slaveWSTRB;
   wire      [USER_WIDTH - 1:0] int_slaveWUSER;
   reg       [5:0]  sizeCnt;
   reg              valid_data;
   reg              valid_data_reg;
   wire             master_valid_data;
   wire             slave_accept;
   reg       [DATA_WIDTH_IN - 1:0] MASTER_WDATA_reg;
   reg       [STRB_WIDTH_IN - 1:0] MASTER_WSTRB_reg;
   reg       [USER_WIDTH - 1:0] MASTER_WUSER_reg;
   wire             cnt_match_next;
   wire      [5:0]  maskAddr;
   wire      [3:0]  dataLoc;
   reg       [5:0]  current_addr_reg;
   reg       [5:0]  sizeCnt_reg;
   reg              hold_data;
   reg              hold_data_next;
   reg       [8:0]  cnt_next;
   reg              SLAVE_WVALID_next;
   reg              SLAVE_WLAST_next;
   wire             fixed_flag;
   reg              master_valid_data_reg;
   wire             lastTx;
   reg              lastTx_reg;
   reg       [8:0]  cnt_plus_1;
   reg              cnt_plus_1_eq_0;
   reg              cnt_eq_0;
 
 
   always  @(wrCmdFifoEmpty or cnt or hold_data or SLAVE_WREADY or wrCmdFifore or slave_accept or SLAVE_WLAST or valid_data or cnt_match_next or cnt_match or MASTER_WVALID or SLAVE_WVALID)
   begin   :widthConvWrite_comb
 
      if (wrCmdFifoEmpty)
      begin
         SLAVE_WVALID_next <= 1'b0;
         SLAVE_WLAST_next <= 1'b0;
         hold_data_next <= 1'b0;
         cnt_next <= cnt;
      end
      else
      begin
         if (hold_data)
         begin
            if (SLAVE_WREADY)
            begin
               if (wrCmdFifore)
               begin
                  SLAVE_WVALID_next <= 1'b0;
                  SLAVE_WLAST_next <= 1'b0;
                  hold_data_next <= 1'b0;
                  if (slave_accept)
                  begin
                     if (slave_accept & SLAVE_WLAST)
                     begin
                        cnt_next <= 0;
                     end
                     else
                     begin
                        cnt_next <= cnt + slave_accept;
                     end
                  end
                  else
                  begin
                     cnt_next <= cnt;
                  end
               end
               else
               begin
                  if (valid_data)
                  begin
                     hold_data_next <= ~SLAVE_WREADY;
                     SLAVE_WVALID_next <= 1'b1;
                     SLAVE_WLAST_next <=
                     cnt_match_next | (cnt_match & ~slave_accept);
                     if (SLAVE_WREADY)
                     begin
                        if (slave_accept & SLAVE_WLAST)
                        begin
                           cnt_next <= 0;
                        end
                        else
                        begin
                           cnt_next <= cnt + slave_accept;
                        end
                     end
                     else
                     begin
                        cnt_next <= cnt;
                     end
                  end
                  else
                  begin
                     if (MASTER_WVALID)
                     begin
                        hold_data_next <= ~SLAVE_WREADY;
                        SLAVE_WVALID_next <= 1'b1;
                        SLAVE_WLAST_next <=
                        cnt_match_next | (cnt_match & ~slave_accept);
                        if (SLAVE_WREADY)
                        begin
                           if (slave_accept & SLAVE_WLAST)
                           begin
                              cnt_next <= 0;
                           end
                           else
                           begin
                              cnt_next <= cnt + slave_accept;
                           end
                        end
                        else
                        begin
                           cnt_next <= cnt;
                        end
                     end
                     else
                     begin
                        SLAVE_WVALID_next <= 1'b0;
                        SLAVE_WLAST_next <= 1'b0;
                        hold_data_next <= 1'b0;
                        if (slave_accept)
                        begin
                           if (slave_accept & SLAVE_WLAST)
                           begin
                              cnt_next <= 0;
                           end
                           else
                           begin
                              cnt_next <= cnt + slave_accept;
                           end
                        end
                        else
                        begin
                           cnt_next <= cnt;
                        end
                     end
                  end
               end
            end
            else
            begin
               SLAVE_WVALID_next <= SLAVE_WVALID;
               SLAVE_WLAST_next <= SLAVE_WLAST;
               hold_data_next <= hold_data;
               cnt_next <= cnt;
            end
         end
         else
         begin
            if (wrCmdFifore)
            begin
               SLAVE_WVALID_next <= 1'b0;
               SLAVE_WLAST_next <= 1'b0;
               hold_data_next <= 1'b0;
               if (slave_accept)
               begin
                  if (slave_accept & SLAVE_WLAST)
                  begin
                     cnt_next <= 0;
                  end
                  else
                  begin
                     cnt_next <= cnt + slave_accept;
                  end
               end
               else
               begin
                  cnt_next <= cnt;
               end
            end
            else
            begin
               if (valid_data)
               begin
                  hold_data_next <= ~SLAVE_WREADY;
                  SLAVE_WVALID_next <= 1'b1;
                  SLAVE_WLAST_next <=
                  cnt_match_next | (cnt_match & ~slave_accept);
                  if (SLAVE_WREADY)
                  begin
                     if (slave_accept & SLAVE_WLAST)
                     begin
                        cnt_next <= 0;
                     end
                     else
                     begin
                        cnt_next <= cnt + slave_accept;
                     end
                  end
                  else
                  begin
                     cnt_next <= cnt;
                  end
               end
               else
               begin
                  if (MASTER_WVALID)
                  begin
                     hold_data_next <= ~SLAVE_WREADY;
                     SLAVE_WVALID_next <= 1'b1;
                     SLAVE_WLAST_next <=
                     cnt_match_next | (cnt_match & ~slave_accept);
                     if (SLAVE_WREADY)
                     begin
                        if (slave_accept & SLAVE_WLAST)
                        begin
                           cnt_next <= 0;
                        end
                        else
                        begin
                           cnt_next <= cnt + slave_accept;
                        end
                     end
                     else
                     begin
                        cnt_next <= cnt;
                     end
                  end
                  else
                  begin
                     SLAVE_WVALID_next <= 1'b0;
                     SLAVE_WLAST_next <= 1'b0;
                     hold_data_next <= 1'b0;
                     if (slave_accept)
                     begin
                        if (slave_accept & SLAVE_WLAST)
                        begin
                           cnt_next <= 0;
                        end
                        else
                        begin
                           cnt_next <= cnt + slave_accept;
                        end
                     end
                     else
                     begin
                        cnt_next <= cnt;
                     end
                  end
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge ACLK or negedge sysReset )
   begin   :Start9
 
      if (!sysReset)
      begin
         SLAVE_WDATA <= 0;
         SLAVE_WSTRB <= 0;
         SLAVE_WUSER <= 0;
      end
      else
      begin
         SLAVE_WDATA <= int_slaveWDATA;
         SLAVE_WSTRB <= int_slaveWSTRB;
         SLAVE_WUSER <= int_slaveWUSER;
      end
   end
 
 
 
   always
      @( posedge ACLK or negedge sysReset )
   begin   :widthConvWrite_reg
 
      if (!sysReset)
      begin
         cnt <= 0;
         cnt_plus_1 <= 1;
         cnt_eq_0 <= 1;
         cnt_plus_1_eq_0 <= 0;
         SLAVE_WVALID <= 1'b0;
         SLAVE_WLAST <= 1'b0;
         hold_data <= 1'b0;
      end
      else
      begin
         cnt <= cnt_next;
         cnt_plus_1 <= cnt_next + 1;
         cnt_eq_0 <= (cnt_next == 0);
         cnt_plus_1_eq_0 <= ((cnt_next + 1) == 0);
         SLAVE_WLAST <= SLAVE_WLAST_next;
         SLAVE_WVALID <= SLAVE_WVALID_next;
         hold_data <= hold_data_next;
      end
   end
 
 
 
   always
      @( posedge ACLK or negedge sysReset )
   begin   :addrCtrl_reg
 
      if (!sysReset)
      begin
         current_addr_reg <= 0;
         sizeCnt_reg <= 0;
      end
      else
      begin
         current_addr_reg <= current_addr;
         sizeCnt_reg <= sizeCnt;
      end
   end
 
 
 
   always  @(slave_accept or fixed_flag or SameMstSlvSize or cnt_eq_0 or sizeCnt_comb_EQ_SizeMax or sizeCnt_comb_P1 or SizeMax or sizeCnt_reg)
   begin   :sieCntCtrl
 
      if (slave_accept)
      begin
         if (fixed_flag)
         begin
            if (SameMstSlvSize)
            begin
               sizeCnt <= 'b0;
            end
            else
            begin
               if (cnt_eq_0)
               begin
                  if (SameMstSlvSize)
                  begin
                     sizeCnt <= 'b0;
                  end
                  else
                  begin
                     if (sizeCnt_comb_EQ_SizeMax)
                     begin
                        sizeCnt <= 'b0;
                     end
                     else
                     begin
                        sizeCnt <= sizeCnt_comb_P1;
                     end
                  end
               end
               else
               begin
                  if (SameMstSlvSize)
                  begin
                     sizeCnt <= 'b0;
                  end
                  else
                  begin
                     if (SizeMax == sizeCnt_reg)
                     begin
                        sizeCnt <= 'b0;
                     end
                     else
                     begin
                        sizeCnt <= sizeCnt_reg + 1;
                     end
                  end
               end
            end
         end
         else
         begin
            if (cnt_eq_0)
            begin
               if (SameMstSlvSize)
               begin
                  sizeCnt <= 'b0;
               end
               else
               begin
                  if (sizeCnt_comb_EQ_SizeMax)
                  begin
                     sizeCnt <= 'b0;
                  end
                  else
                  begin
                     sizeCnt <= sizeCnt_comb_P1;
                  end
               end
            end
            else
            begin
               if (SameMstSlvSize)
               begin
                  sizeCnt <= 'b0;
               end
               else
               begin
                  if (SizeMax == sizeCnt_reg)
                  begin
                     sizeCnt <= 'b0;
                  end
                  else
                  begin
                     sizeCnt <= sizeCnt_reg + 1;
                  end
               end
            end
         end
      end
      else
      begin
         sizeCnt <= sizeCnt_reg;
      end
   end
 
 
 
   always  @(slave_accept or cnt_eq_0 or fixed_flag or SameMstSlvSize or int_masterADDR or sizeCnt_comb_EQ_SizeMax or master_ADDR_masked or second_Beat_Addr or sizeCnt_reg or SizeMax or
             current_addr_reg or int_slaveSIZE)
   begin   :addr_ctrl
 
      if (slave_accept)
      begin
         if (cnt_eq_0)
         begin
            if (fixed_flag)
            begin
               if (SameMstSlvSize)
               begin
                  current_addr <= int_masterADDR;
               end
               else
               begin
                  if (sizeCnt_comb_EQ_SizeMax)
                  begin
                     current_addr <= master_ADDR_masked;
                  end
                  else
                  begin
                     current_addr <= second_Beat_Addr;
                  end
               end
            end
            else
            begin
               current_addr <= second_Beat_Addr;
            end
         end
         else
         begin
            if (fixed_flag)
            begin
               if (SameMstSlvSize)
               begin
                  current_addr <= int_masterADDR;
               end
               else
               begin
                  if (sizeCnt_reg == SizeMax)
                  begin
                     current_addr <= master_ADDR_masked;
                  end
                  else
                  begin
                     current_addr <= current_addr_reg + (1<<int_slaveSIZE);
                  end
               end
            end
            else
            begin
               current_addr <= current_addr_reg + (1<<int_slaveSIZE);
            end
         end
      end
      else
      begin
         current_addr <= current_addr_reg;
      end
   end
 
 
 
   always  @(wrCmdFifoEmpty or lastTx_reg or SameMstSlvSize or slave_accept or master_valid_data_reg or valid_data_reg or sizeCnt_reg or SizeMax or sizeCnt_comb_EQ_SizeMax or cnt_eq_0)
   begin   :valid_data_comb
 
      if (wrCmdFifoEmpty)
      begin
         if (lastTx_reg)
         begin
            valid_data <= 0;
         end
         else
         begin
            if (SameMstSlvSize)
            begin
               if (slave_accept)
               begin
                  valid_data <= 1'b0;
               end
               else
               begin
                  if (master_valid_data_reg)
                  begin
                     valid_data <=  1'b1;
                  end
                  else
                  begin
                     valid_data <= valid_data_reg;
                  end
               end
            end
            else
            begin
               if (sizeCnt_reg == SizeMax)
               begin
                  if (slave_accept)
                  begin
                     valid_data <= 1'b0;
                  end
                  else
                  begin
                     if (master_valid_data_reg)
                     begin
                        valid_data <=  1'b1;
                     end
                     else
                     begin
                        valid_data <= valid_data_reg;
                     end
                  end
               end
               else
               begin
                  if (sizeCnt_comb_EQ_SizeMax)
                  begin
                     if (cnt_eq_0)
                     begin
                        if (slave_accept)
                        begin
                           valid_data <= 1'b0;
                        end
                        else
                        begin
                           if (master_valid_data_reg)
                           begin
                              valid_data <=  1'b1;
                           end
                           else
                           begin
                              valid_data <= valid_data_reg;
                           end
                        end
                     end
                     else
                     begin
                        if (master_valid_data_reg)
                        begin
                           valid_data <=  1'b1;
                        end
                        else
                        begin
                           valid_data <= valid_data_reg;
                        end
                     end
                  end
                  else
                  begin
                     if (master_valid_data_reg)
                     begin
                        valid_data <=  1'b1;
                     end
                     else
                     begin
                        valid_data <= valid_data_reg;
                     end
                  end
               end
            end
         end
      end
      else
      begin
         if (SameMstSlvSize)
         begin
            if (slave_accept)
            begin
               valid_data <= 1'b0;
            end
            else
            begin
               if (master_valid_data_reg)
               begin
                  valid_data <=  1'b1;
               end
               else
               begin
                  valid_data <= valid_data_reg;
               end
            end
         end
         else
         begin
            if (sizeCnt_reg == SizeMax)
            begin
               if (slave_accept)
               begin
                  valid_data <= 1'b0;
               end
               else
               begin
                  if (master_valid_data_reg)
                  begin
                     valid_data <=  1'b1;
                  end
                  else
                  begin
                     valid_data <= valid_data_reg;
                  end
               end
            end
            else
            begin
               if (sizeCnt_comb_EQ_SizeMax)
               begin
                  if (cnt_eq_0)
                  begin
                     if (slave_accept)
                     begin
                        valid_data <= 1'b0;
                     end
                     else
                     begin
                        if (master_valid_data_reg)
                        begin
                           valid_data <=  1'b1;
                        end
                        else
                        begin
                           valid_data <= valid_data_reg;
                        end
                     end
                  end
                  else
                  begin
                     if (master_valid_data_reg)
                     begin
                        valid_data <=  1'b1;
                     end
                     else
                     begin
                        valid_data <= valid_data_reg;
                     end
                  end
               end
               else
               begin
                  if (master_valid_data_reg)
                  begin
                     valid_data <=  1'b1;
                  end
                  else
                  begin
                     valid_data <= valid_data_reg;
                  end
               end
            end
         end
      end
   end
 
 
 
   always
      @( posedge ACLK or negedge sysReset )
   begin   :valid_data_register
 
      if (!sysReset)
      begin
         valid_data_reg <= 1'b0;
         master_valid_data_reg <= 1'b0;
      end
      else
      begin
         valid_data_reg <= valid_data;
         master_valid_data_reg <= master_valid_data;
      end
   end
 
 
 
   always
      @( posedge ACLK or negedge sysReset )
   begin   :wchan_reg
 
      if (!sysReset)
      begin
 
         MASTER_WDATA_reg <= 0;
         MASTER_WSTRB_reg <= 0;
         MASTER_WUSER_reg <= 0;
      end
      else
      begin
         if (master_valid_data)
         begin
 
            MASTER_WDATA_reg <= MASTER_WDATA;
            MASTER_WSTRB_reg <= MASTER_WSTRB;
            MASTER_WUSER_reg <= MASTER_WUSER;
         end
      end
   end
 
 
 
   always
      @( posedge ACLK or negedge sysReset )
   begin   :lastTx_flowchart
 
      if (!sysReset)
      begin
         lastTx_reg <= 1'b1;
      end
      else
      begin
         if (wrCmdFifoEmpty)
         begin
         end
         else
         begin
            lastTx_reg <= lastTx;
         end
      end
   end
 
   // Split up wrCmdFifoRdData
   assign fixed_flag = wrCmdFifoRdData[29];
   assign int_masterADDR = wrCmdFifoRdData[28:23];
   assign int_slaveLEN = wrCmdFifoRdData[22:14];
   assign int_slaveSIZE = wrCmdFifoRdData[13:11];
   assign SameMstSlvSize = wrCmdFifoRdData[7];
   assign SizeMax = wrCmdFifoRdData[6:1];
   assign lastTx = wrCmdFifoRdData[0];
 
   assign cnt_match = ((cnt_plus_1) == int_slaveLEN);
   assign cnt_match_next = (slave_accept & ((cnt_plus_1) == (slaveLEN_M1))) | (int_slaveLEN == 1);
 
   assign maskAddr = ( (DATA_WIDTH_IN/8) - 1) & ((slave_accept ? cnt_plus_1_eq_0 : cnt_eq_0) ? int_masterADDR : current_addr);
   //assign maskAddr = ( (DATA_WIDTH_IN/8) - 1) & (((cnt + slave_accept) == 0) ? int_masterADDR : current_addr);
 
   // Location of data on Master bus
   assign dataLoc = ( maskAddr >> ($clog2(DATA_WIDTH_OUT/8)));
 
   assign int_slaveWDATA = (valid_data)  ? MASTER_WDATA_reg[ (dataLoc*DATA_WIDTH_OUT) +: DATA_WIDTH_OUT ] : MASTER_WDATA[ (dataLoc*DATA_WIDTH_OUT) +: DATA_WIDTH_OUT ];
   assign int_slaveWSTRB = (valid_data)  ? MASTER_WSTRB_reg[ (dataLoc*(DATA_WIDTH_OUT/8)) +: (DATA_WIDTH_OUT/8) ] : MASTER_WSTRB[ (dataLoc*(DATA_WIDTH_OUT/8)) +: (DATA_WIDTH_OUT/8) ];
 
   assign int_slaveWUSER = (valid_data) ? MASTER_WUSER_reg : MASTER_WUSER;
 
   assign wrCmdFifore = SLAVE_WVALID & SLAVE_WREADY & SLAVE_WLAST;
   assign MASTER_WREADY = MASTER_WVALID & (~wrCmdFifore) & (~valid_data) & (~wrCmdFifoEmpty);
 
   assign master_valid_data = MASTER_WVALID & MASTER_WREADY;
   assign slave_accept = SLAVE_WVALID & SLAVE_WREADY;
 
 
endmodule

