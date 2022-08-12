

/// Header_Start --->>>



/// Header_End <<<---


/// I/O_Start --->>>

// - align dqsw and dqsw270
// - Align bclk to sclk
// - align refclk to cmd pad



// AS: update 1/18/16
// - Added output ports to control BCLK/BCLK90 phsinit (bclk_phsinit, bclk90_phsinit)
// - Added input ports

// AS: update 1/20/16
// - Added DQSW/DQSW270 alignment (before other training)
// - Added the following signals for dqsw/270 and refclk/cmd trn:
//   *
// AS: update 9/22/2016
// - doubled width of bclk training bits 
// AS: update 1/23/2017
// - update the eye monitor signals to use generated flags
// - instead of 'real' flags due to Silicon issue

module TRN_CLK( SCLK,
                reset_n,
                code_update,
                loadphs_b,
                vco_phsel_bclk_sel,
                vco_phsel_bclk90_sel,
                vco_phsel_refclk_sel,
                vco_phsel_rotate,
                dfi_init_complete,
                dfi_init_start,
                bclk_eye_monitor_clr_flags,
                bclk_eye_monitor_early,
                bclk_eye_monitor_late,
                clock_pause,
                refclk_eye_monitor_clr_flags,
                refclk_eye_monitor_early,
                refclk_eye_monitor_late,
                // AS: Added these signals for additional training steps
                // DQSW/DQSW270 training
                dqsw_eye_monitor_clr_flags,
                dqsw_eye_monitor_early,
                dqsw_eye_monitor_late,
                dqsw270_eye_monitor_clr_flags,
                dqsw270_eye_monitor_early,
                dqsw270_eye_monitor_late,
                vco_phsinit_refclk,
                vco_phsinit_bclk,
                vco_phsinit_bclk90,
                dqsw_delay_line_load,
                dqsw_delay_line_move,
                dqsw_delay_line_direction,
                dqsw270_delay_line_load,
                dqsw270_delay_line_move,
                dqsw270_delay_line_direction,
                wrdly_delay_line_load,
                wrdly_delay_line_move,
                wrdly_delay_line_direction,
                txdly_delay_line_load,
                txdly_delay_line_move,
                txdly_delay_line_direction,
                // REFCLK training
                refclk_delay_line_load,
                refclk_delay_line_move,
                refclk_delay_line_direction,
                cmd_eye_monitor_clr_flags,
                cmd_eye_monitor_early,
                cmd_eye_monitor_late,
                cmd_delay_line_load,
                cmd_delay_line_move,
                cmd_delay_line_direction,
                cmd_oe,
                pause,
                cmd_delay_line_move_trn,
                refclk_igear_rx8,
                dqsw270_igear_rx8,
                // AS: removed txdly* signals for internal mux'ing
                // AS: ADDED NEW PORTS FOR SAR http://bugzilla/show_bug.cgi?id=85957
                // IN ORDER TO OBVIATE THE USE OF EYE MONITOR FLAGS
                // EYE MONITOR FLAGS REMAIN FOR LEGACY PURPOSES / IN CASE
                // SILICON FIX COMES IN FOR REV D
                bclk_igear_rx,
                cmd_igear_rx8,
                dqsw270_igear_rx,
                dqsw_igear_rx,
                cmd_reset_lane,
                // AS: ADDED SKIP_* SIGNALS
                skip_dqsw_trn,
                skip_bclk_trn,
                skip_ca_trn,
                BCLK_VCOPHS_OFFSET,
                ADDR_VCOPHS_OFFSET,
                apb_addr,
                bclk_rddata,
                addcmd_rddata,
                ADDR_WAIT_COUNT
                

              );

//parameter IOG_DQS_LANES = `IOG_DQS_LANES_DEF;
//parameter NUM_BCLKS = `NUM_BCLKS_DEF; // 1 or 2
parameter IOG_DQS_LANES = 2;
parameter NUM_BCLKS = 1;

input          SCLK;
input          reset_n;

// Port: System

output         code_update;

output         vco_phsel_refclk_sel;
// AS: widened BCLK training signals to NUM_BCLKS wide
//output         loadphs_b;
//output         vco_phsel_bclk_sel;
//output         vco_phsel_bclk90_sel;
//output         vco_phsel_rotate;

output [NUM_BCLKS-1:0]        loadphs_b;
output [NUM_BCLKS-1:0]        vco_phsel_bclk_sel;
output [NUM_BCLKS-1:0]        vco_phsel_bclk90_sel;
output [NUM_BCLKS-1:0]        vco_phsel_rotate;

// Port: NWL

output         dfi_init_complete; // Initialization signal. Also used during frequency change requests.
reg            dfi_init_complete; // Initialization signal. Also used during frequency change requests.
input          dfi_init_start; // Initialization signal. Also used during frequency change requests.



// Port: PHY_port

// AS: made this NUM_BCLKS wide
//output         bclk_eye_monitor_clr_flags; 
//input          bclk_eye_monitor_early;
//input          bclk_eye_monitor_late;
output [NUM_BCLKS-1:0]        bclk_eye_monitor_clr_flags; 
input  [NUM_BCLKS-1:0]        bclk_eye_monitor_early;
input  [NUM_BCLKS-1:0]        bclk_eye_monitor_late;


output         clock_pause;
output         refclk_eye_monitor_clr_flags/* synthesis syn_noclockbuf = 1 */;
input          refclk_eye_monitor_early; 
input          refclk_eye_monitor_late;


// AS: Added for more IOG signals additional training steps
// AS: added 2 rank support
output [IOG_DQS_LANES-1:0]               dqsw_eye_monitor_clr_flags/* synthesis syn_noclockbuf = 1 */;
input  [IOG_DQS_LANES-1:0]               dqsw_eye_monitor_early;
input  [IOG_DQS_LANES-1:0]               dqsw_eye_monitor_late;
output [IOG_DQS_LANES-1:0]               dqsw270_eye_monitor_clr_flags/* synthesis syn_noclockbuf = 1 */;
input  [IOG_DQS_LANES-1:0]               dqsw270_eye_monitor_early;
input  [IOG_DQS_LANES-1:0]               dqsw270_eye_monitor_late;
output [2:0]                             vco_phsinit_refclk;
output [2:0]                             vco_phsinit_bclk;
output [2:0]                             vco_phsinit_bclk90;
output [IOG_DQS_LANES-1:0]               dqsw_delay_line_load;
output [IOG_DQS_LANES-1:0]               dqsw_delay_line_move;
output [IOG_DQS_LANES-1:0]               dqsw_delay_line_direction;
output [IOG_DQS_LANES-1:0]               dqsw270_delay_line_load;
output [IOG_DQS_LANES-1:0]               dqsw270_delay_line_move;
output [IOG_DQS_LANES-1:0]               dqsw270_delay_line_direction;

// REFCLK training
output                                   refclk_delay_line_load;
output                                   refclk_delay_line_move;
output                                   refclk_delay_line_direction;
input                                    cmd_eye_monitor_early;
input                                    cmd_eye_monitor_late;
output                                   cmd_eye_monitor_clr_flags/* synthesis syn_noclockbuf = 1 */;
output                                   cmd_delay_line_load;
output                                   cmd_delay_line_move;
output                                   cmd_delay_line_direction;
output                                   cmd_oe;

wire [IOG_DQS_LANES-1:0]               dqsw_eye_monitor_clr_flags;
wire [IOG_DQS_LANES-1:0]               dqsw270_eye_monitor_clr_flags;
wire [2:0]          vco_phsinit_refclk;
wire [2:0]          vco_phsinit_bclk;
wire [2:0]          vco_phsinit_bclk90;

// IOG input delay signals
wire [IOG_DQS_LANES-1:0]               dqsw_delay_line_load;
wire [IOG_DQS_LANES-1:0]               dqsw_delay_line_move;
wire [IOG_DQS_LANES-1:0]               dqsw_delay_line_direction;
wire [IOG_DQS_LANES-1:0]               dqsw270_delay_line_load;
wire [IOG_DQS_LANES-1:0]               dqsw270_delay_line_move;
wire [IOG_DQS_LANES-1:0]               dqsw270_delay_line_direction;

// discreet lane-level controls, to be muxed with write leveling signals
output [IOG_DQS_LANES-1:0]             wrdly_delay_line_load;
output [IOG_DQS_LANES-1:0]             wrdly_delay_line_move;
output [IOG_DQS_LANES-1:0]             wrdly_delay_line_direction;
output [IOG_DQS_LANES-1:0]             txdly_delay_line_load;
output [IOG_DQS_LANES-1:0]             txdly_delay_line_move;
output [IOG_DQS_LANES-1:0]             txdly_delay_line_direction;

wire [IOG_DQS_LANES-1:0]               wrdly_delay_line_load;
wire [IOG_DQS_LANES-1:0]               wrdly_delay_line_move;
wire [IOG_DQS_LANES-1:0]               wrdly_delay_line_direction;
wire [IOG_DQS_LANES-1:0]               txdly_delay_line_load;
wire [IOG_DQS_LANES-1:0]               txdly_delay_line_move;
wire [IOG_DQS_LANES-1:0]               txdly_delay_line_direction;

                // REFCLK training
wire                refclk_delay_line_load;
wire                refclk_delay_line_move;
wire                refclk_delay_line_direction;
wire                cmd_eye_monitor_clr_flags;
wire                cmd_delay_line_load;
wire                cmd_delay_line_move;
wire                cmd_delay_line_direction;
wire                cmd_oe;

output              pause;
wire                pause;

output              cmd_delay_line_move_trn;
wire                cmd_delay_line_move_trn;

input refclk_igear_rx8;
input [IOG_DQS_LANES-1:0] dqsw270_igear_rx8;

// AS: ADDED NEW PORTS FOR SAR http://bugzilla/show_bug.cgi?id=85957
// IN ORDER TO OBVIATE THE USE OF EYE MONITOR FLAGS
// EYE MONITOR FLAGS REMAIN FOR LEGACY PURPOSES / IN CASE
// SILICON FIX COMES IN FOR REV D
input [4*NUM_BCLKS-1:0]         bclk_igear_rx;
input                           cmd_igear_rx8;
input [IOG_DQS_LANES*2-1:0]     dqsw270_igear_rx;
input [IOG_DQS_LANES*2-1:0]     dqsw_igear_rx;
output                          cmd_reset_lane;

// AS: ADDED SKIP_* SIGNALS
input                           skip_dqsw_trn;
input                           skip_bclk_trn;
input                           skip_ca_trn;

// AS: added configuration ports
input [2:0]                     ADDR_VCOPHS_OFFSET;
input [2:0]                     BCLK_VCOPHS_OFFSET;

// AS: added APB signals
input [15:0]                    apb_addr;
output [7:0]                    bclk_rddata;
wire   [7:0]                    bclk_rddata;
wire   [15:0]                   bclk_rddata_internal;
output [7:0]                    addcmd_rddata;
wire   [7:0]                    addcmd_rddata;

input [9:0]                     ADDR_WAIT_COUNT;

/// I/O_End <<<---

/// Components_Start --->>>

wire refclk_pause;
wire [NUM_BCLKS-1:0] bclk_vcophsel_rotate;
wire refclk_vcophsel_rotate;
wire [NUM_BCLKS-1:0] bclk_loadphs_b;
wire refclk_loadphs_b;
wire [NUM_BCLKS-1:0] bclk_done;
wire refclk_done;
wire [IOG_DQS_LANES-1:0] dqsw_done, dqsw_loadphs_b, dqsw_pause, dqsw_vcophsel_rotate; // one for each lane
reg [IOG_DQS_LANES-1:0] dqsw_train;
reg bclk_train, refclk_train;

wire [NUM_BCLKS-1:0] cmd_reset_lane_i;

// AS: added a state machine here to cycle through lanes
parameter FSM_IDLE        = 0;
parameter FSM_DQSW        = 1;
parameter FSM_BCLK        = 2;
parameter FSM_CMND        = 3;
parameter FSM_DONE        = 4;

reg [3:0] current_state, next_state;
reg [3:0] current_lane;
reg incr_lane;

// output assignments
assign vco_phsel_refclk_sel = (refclk_train && !refclk_done);
assign vco_phsel_rotate[0] = bclk_vcophsel_rotate[0] || refclk_vcophsel_rotate || |dqsw_vcophsel_rotate;
assign loadphs_b[0] = bclk_loadphs_b & (&dqsw_loadphs_b) & refclk_loadphs_b;
assign cmd_reset_lane = |cmd_reset_lane_i[NUM_BCLKS-1:0];

generate
  if(NUM_BCLKS > 1)
  begin
    assign loadphs_b[1] = bclk_loadphs_b[1];
    assign vco_phsel_rotate[1] = bclk_vcophsel_rotate[1];
    assign vco_phsel_bclk90_sel[1] = vco_phsel_bclk_sel[1];
  end
endgenerate

// assign dfi_init_complete = |bclk_done[NUM_BCLKS-1:0] & refclk_done & (&dqsw_done);
assign clock_pause = ~(refclk_done);
assign pause = (|dqsw_pause) | refclk_pause;
assign vco_phsel_bclk90_sel[0] = ( !(&dqsw_done) | vco_phsel_bclk_sel[0] );

// AS: changed the phsinit assignment for multi-rank support
assign vco_phsinit_bclk    = 3'b000;

// AS: SAR 82438, no more vco_phsinit* signals used dynamically
//     because they are PC bits so... tying them off
assign vco_phsinit_bclk90  = 3'b000;

// temp
assign code_update = 1'b0;


// STATE MACHINE

always@(posedge SCLK or negedge reset_n)
begin : FSM_SEQ
  if (reset_n == 1'b0)
  begin
    current_state <= FSM_IDLE;
  end
  else
  begin
    current_state <= next_state;
  end
end

always@(*)
begin : FSM_COMB
  incr_lane <= 1'b0;
  dqsw_train <= {IOG_DQS_LANES{1'b0}};
  bclk_train <= 1'b0;
  refclk_train <= 1'b0;
  dfi_init_complete <= 1'b0;
  
  case (current_state)
    
    FSM_IDLE:
      if (dfi_init_start == 1'b1)
      begin
          next_state <= FSM_DQSW;
      end
      else
        next_state <= FSM_IDLE;
    
    FSM_DQSW:
    begin
      dqsw_train[current_lane] <= 1'b1;
      
      if (dqsw_done[current_lane])
      begin
        if (current_lane < IOG_DQS_LANES - 1)
        begin
          incr_lane <= 1'b1;
          next_state <= FSM_DQSW;
        end
        else
        begin
          if (skip_bclk_trn)
            if (skip_ca_trn)
              next_state <= FSM_DONE;
            else
              next_state <= FSM_CMND;
          else
            next_state <= FSM_BCLK;
        end
      end
      else
      begin
        next_state <= FSM_DQSW;
      end
    end
    
    FSM_BCLK:
    begin
      bclk_train <= 1'b1;
      if (&bclk_done)
        if (skip_ca_trn)
          next_state <= FSM_DONE;
        else
          next_state <= FSM_CMND;
      else
        next_state <= FSM_BCLK;
    end
    
    FSM_CMND:
    begin
      refclk_train <= 1'b1;
      if (refclk_done)
        next_state <= FSM_DONE;
      else
        next_state <= FSM_CMND;
    end
    
    FSM_DONE:
    begin
      dfi_init_complete <= 1'b1;
      next_state <= FSM_DONE;
    end
    
    default: 
      next_state <= FSM_IDLE;
  endcase
end

always@(posedge SCLK or negedge reset_n)
begin : MISC_SEQ
  if (reset_n == 1'b0)
  begin
    current_lane <= 4'h0;
  end
  else
  begin
    if (incr_lane)
      current_lane <= current_lane + 4'h1;
    else
      current_lane <= current_lane;
  end
end

// AS: added two instaces trn_dqsw, one per lane



// INSTANTIATIONS

// AS: ADDED NEW GENERATED FLAGS FOR SAR http://bugzilla/show_bug.cgi?id=85957
// IN ORDER TO OBVIATE THE USE OF EYE MONITOR FLAGS:
// EYE MONITOR FLAGS REMAIN FOR LEGACY PURPOSES / IN CASE
// SILICON FIX COMES IN FOR REV D
wire   [IOG_DQS_LANES-1:0]              dqsw_gen_flag;
wire   [IOG_DQS_LANES-1:0]              dqsw270_gen_flag;
wire                                    refclk_gen_flag; 
wire                                    cmd_gen_flag;

genvar i;
generate
  for (i=0; i < IOG_DQS_LANES; i = i + 1) begin

    // AS: replaced eye monitor connections with generated flags
  
    trn_dqsw dqsw_trainer (
      .reset_b(reset_n),
      .sclk(SCLK),
      .train(dqsw_train[i]),
      .done(dqsw_done[i]),
      .dqsw_eye_monitor_clr_flags(dqsw_eye_monitor_clr_flags[i]),
      //.dqsw_eye_monitor_early(dqsw_eye_monitor_early[i]),
      //.dqsw_eye_monitor_late(dqsw_eye_monitor_late[i]),
      .dqsw_eye_monitor_early(dqsw_gen_flag[i]),
      .dqsw_eye_monitor_late(dqsw_gen_flag[i]),
      .dqsw270_eye_monitor_clr_flags(dqsw270_eye_monitor_clr_flags[i]),
      //.dqsw270_eye_monitor_early(dqsw270_eye_monitor_early[i]),
      //.dqsw270_eye_monitor_late(dqsw270_eye_monitor_late[i]),
      .dqsw270_eye_monitor_early(dqsw270_gen_flag[i]),
      .dqsw270_eye_monitor_late(dqsw270_gen_flag[i]),
      .vco_phsinit_bclk(),
      .vco_phsinit_bclk90(),
      .dqsw_delay_line_load(dqsw_delay_line_load[i]),
      .dqsw_delay_line_move(dqsw_delay_line_move[i]),
      .dqsw_delay_line_direction(dqsw_delay_line_direction[i]),
      .dqsw270_delay_line_load(dqsw270_delay_line_load[i]),
      .dqsw270_delay_line_move(dqsw270_delay_line_move[i]),
      .dqsw270_delay_line_direction(dqsw270_delay_line_direction[i]),
      .dqsw_loadphs_b(dqsw_loadphs_b[i]),
      .wrdly_delay_line_load(wrdly_delay_line_load[i]),
      .wrdly_delay_line_move(wrdly_delay_line_move[i]),
      .wrdly_delay_line_direction(wrdly_delay_line_direction[i]),
      .txdly_delay_line_load(txdly_delay_line_load[i]),
      .txdly_delay_line_move(txdly_delay_line_move[i]),
      .txdly_delay_line_direction(txdly_delay_line_direction[i]),
      .pause(dqsw_pause[i]),
      .vcophsel_rotate(dqsw_vcophsel_rotate[i]),
      .dqsw270_igear_rx8(!dqsw270_igear_rx[2*i]),
      .skip(skip_dqsw_trn)
    );
    
    // AS: 1/23/17, ADDED FLAG GENERATOR FOR DQSW TRAINING
    // NOTE: 2 BITS OF DATA PER LANE
    flag_generator # (
      .data_width(1)
    ) u_dqsw_flags (
      .clock(SCLK),
      .data(dqsw_igear_rx[2*i]),
      .clear_flags(dqsw_eye_monitor_clr_flags[i]),
      .flag(dqsw_gen_flag[i])
    );
    
    flag_generator # (
      .data_width(1)
    ) u_dqsw270_flags (
      .clock(SCLK),
      .data(dqsw270_igear_rx[2*i]),
      .clear_flags(dqsw270_eye_monitor_clr_flags[i]),
      .flag(dqsw270_gen_flag[i])
    );
    
  end
endgenerate

// AS: added NUM_BCLKS number of BCLK trainers
//     added bclk_igear_rx input to preclude the use
//     of eye monitor signals
generate
  for (i= 0; i < NUM_BCLKS; i=i+1) begin
    trn_bclksclk bclk_trainer (
      .reset_b(reset_n),
      .sclk(SCLK),
      .train(bclk_train),
      .eye_monitor_early(bclk_eye_monitor_early[i]),
      .eye_monitor_late(bclk_eye_monitor_late[i]),
      .eye_monitor_clr_flags(bclk_eye_monitor_clr_flags[i]),
      .vcophsel_bclk_sel(vco_phsel_bclk_sel[i]),
      .vcophsel_rotate(bclk_vcophsel_rotate[i]),
      .loadphs_b(bclk_loadphs_b[i]),
      .done(bclk_done[i]),
      .bclk_igear_rx(bclk_igear_rx[i*4+3:i*4]),
      .cmd_reset_lane(cmd_reset_lane_i[i]),
      .VCOPHS_OFFSET(BCLK_VCOPHS_OFFSET),
      .apb_addr(apb_addr),
      .bclk_rddata(bclk_rddata_internal[i*8+7:i*8])
    );
  end
endgenerate

assign bclk_rddata[7:0] = (apb_addr[0] == 1'b0) ? bclk_rddata_internal[7:0] : bclk_rddata_internal[15:8];

generate
if (NUM_BCLKS == 1)
  assign bclk_rddata_internal[15:8] = 8'h00;
endgenerate

trn_cmd_addr cmd_addr_trainer (
  .sclk(SCLK),
  .reset_b(reset_n),
  .train(refclk_train),
  .done(refclk_done),
  .vcophsel_rotate(refclk_vcophsel_rotate),
  .loadphs_b(refclk_loadphs_b),
  .vco_phsinit(vco_phsinit_refclk),
  .refclk_eye_monitor_clr_flags(refclk_eye_monitor_clr_flags),
  //.refclk_eye_monitor_early(refclk_eye_monitor_early),
  //.refclk_eye_monitor_late(refclk_eye_monitor_late),
  .refclk_eye_monitor_early(refclk_gen_flag),
  .refclk_eye_monitor_late(refclk_gen_flag),
  .refclk_delay_line_load(refclk_delay_line_load),
  .refclk_delay_line_move(refclk_delay_line_move),
  .refclk_delay_line_direction(refclk_delay_line_direction),
  //.cmd_eye_monitor_early(cmd_eye_monitor_early),
  //.cmd_eye_monitor_late(cmd_eye_monitor_late),
  .cmd_eye_monitor_early(cmd_gen_flag),
  .cmd_eye_monitor_late(cmd_gen_flag),
  .cmd_eye_monitor_clr_flags(cmd_eye_monitor_clr_flags),
  .cmd_delay_line_load(cmd_delay_line_load),
  .cmd_delay_line_move(cmd_delay_line_move),
  .cmd_delay_line_direction(cmd_delay_line_direction),
  .cmd_oe(cmd_oe),
  .pause(refclk_pause),
  .cmd_delay_line_move_trn(cmd_delay_line_move_trn),
  .refclk_igear_rx8(~refclk_igear_rx8),
  .VCOPHS_OFFSET(ADDR_VCOPHS_OFFSET),
  .apb_addr(apb_addr),
  .addcmd_rddata(addcmd_rddata),
  .WAIT_COUNT(ADDR_WAIT_COUNT)
);

  // AS: 1/23/17, ADDED FLAG GENERATOR(S) FOR CMD/ADDR TRAINING
  // NOTE: 2 BITS OF DATA PER LANE
  flag_generator # (
      .data_width(1)
    ) u_refclk_flags (
      .clock(SCLK),
      .data(refclk_igear_rx8),
      .clear_flags(refclk_eye_monitor_clr_flags),
      .flag(refclk_gen_flag)
    );
    
  flag_generator # (
      .data_width(1)
    ) u_cmd_flags (
      .clock(SCLK),
      .data(cmd_igear_rx8),
      .clear_flags(cmd_eye_monitor_clr_flags),
      .flag(cmd_gen_flag)
    );  
    


 
 
 
 
 
 
 
 
 
 
 
 
 
 


/// Components_End <<<---


endmodule

