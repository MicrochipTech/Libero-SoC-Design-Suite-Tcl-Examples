///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: MICROSEMI
//
// File: SB_PRBS_CHKR.v
//
//  Description  : This module implements the PRBS generator to be used in the Tx section and
//                 also the PRBS checker to be used in the Rx section.
//                 The input bit 'Mode' defines the generator/checker mode for the module.
//
//  COPYRIGHT 2013 BY MICROSEMI 
//  THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
//  FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
//  MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
//  NO BACK-UP OF THE FILE SHOULD BE MADE. 
//
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//--------------------------------------------------------------------
// Module Declaration
//--------------------------------------------------------------------
module SB_PRBS_CHKR(
       RX_READY,
       RX_VAL,
       RX_DATA,
       RX_DATA_EN,
       RX_CLK,
       SYS_RESET_N,
       PRBS_ERR_DET,
       PRBS_ERR_CNT,
       PRBS_CLR_ERR_CNT,
       PRBS_SEL,
	   RX_ALIGN
    );

//--------------------------------------------------------------------
// Parameter
//--------------------------------------------------------------------
parameter PRBS_INIT_VAL = 97;         // Any value except for zero
parameter DATA_WIDTH = 64;
parameter ERR_CNT_WIDTH = 32;
parameter PATTERN_PRBS7 = 1;
parameter PATTERN_PRBS9 = 1;
parameter PATTERN_PRBS23 = 1;
parameter PATTERN_PRBS31 = 1;
parameter ERR_CHK_DELAY = 16;
parameter ALIGN_DATA = 80'h1F0B92B4AE2E4AD2B87C;

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input                  RX_DATA_EN;
input                  RX_READY;
input                  RX_VAL;
input [DATA_WIDTH-1:0] RX_DATA;
input                  RX_CLK;
input                  SYS_RESET_N;
input                  PRBS_CLR_ERR_CNT;
input [1:0]            PRBS_SEL;           // 0=PRBS7, 1=PRBS23 & 2=PRBS31

//--------------------------------------------------------------------
// Output 
//----------------------------------------------------------------------
output                     PRBS_ERR_DET; 
output [ERR_CNT_WIDTH-1:0] PRBS_ERR_CNT; 
output RX_ALIGN;

//--------------------------------------------------------------------
// Reg & Wire 
//--------------------------------------------------------------------
reg [(DATA_WIDTH*2)-1:0] rx_data_buff;
reg RX_ALIGN;
reg [DATA_WIDTH-1:0] rx_data_align;
reg rx_align_st;
reg [6:0] rx_align_pos;

reg                      PRBS_ERR_DET;
reg [DATA_WIDTH-1:0]     err_bits;
reg [DATA_WIDTH-1:0]     rx_data_reg;
reg [ERR_CNT_WIDTH-1:0]  PRBS_ERR_CNT; 
reg [(DATA_WIDTH*2)-1:0] prbs7;
reg [(DATA_WIDTH*2)-1:0] prbs9;
reg [(DATA_WIDTH*2)-1:0] prbs23;
reg [(DATA_WIDTH*2)-1:0] prbs31;
reg [(DATA_WIDTH*2)-1:0] rx_d;
reg err_cnt_en;
reg [CLogB2(ERR_CHK_DELAY)-1:0] err_cnt_en_cnt;
reg err_cnt_en_st;
reg [1:0] prbs_sel_reg;
reg err_det_en;
//--------------------------------------------------------------------
// Logic
//--------------------------------------------------------------------
integer                 i;

always @ (posedge RX_CLK or negedge SYS_RESET_N)
  begin
    if ((!SYS_RESET_N)|| (!RX_READY) || (!RX_VAL) || (!RX_DATA_EN)) begin
         rx_data_reg  <= {DATA_WIDTH{1'b0}};
         err_bits <= 0;
         prbs7        <= PRBS_INIT_VAL;
         prbs9        <= PRBS_INIT_VAL;
         prbs23       <= PRBS_INIT_VAL;
         prbs31       <= PRBS_INIT_VAL;
         PRBS_ERR_DET <= 1'h0;
    end else begin
        rx_data_reg <= rx_data_align;
    
        if (PRBS_ERR_DET || !err_cnt_en) begin // Restart PRBS checker when error detected
            prbs7  <= {rx_data_reg, rx_data_align}; 
            prbs9  <= {rx_data_reg, rx_data_align}; 
            prbs23 <= {rx_data_reg, rx_data_align};
            prbs31 <= {rx_data_reg, rx_data_align};
        end else begin // Expected data generation
            rx_d = prbs7;
            repeat(DATA_WIDTH) rx_d = {rx_d, rx_d[6] ^ rx_d[5]};
            prbs7 <= rx_d;
            rx_d = prbs9;
            repeat(DATA_WIDTH) rx_d = {rx_d, rx_d[8] ^ rx_d[4]}; 
            prbs9 <= rx_d;
            rx_d = prbs23;
            repeat(DATA_WIDTH) rx_d = {rx_d, rx_d[22] ^ rx_d[17]};
            prbs23 <= rx_d;
            rx_d = prbs31;
            repeat(DATA_WIDTH) rx_d = {rx_d, rx_d[30] ^ rx_d[27]}; 
            prbs31 <= rx_d;
        end
        
        case (PRBS_SEL) //compares received with expected data
             2'd0: if(PATTERN_PRBS7) begin err_bits  <= prbs7  ^ rx_data_reg; end else begin err_bits  <= 0; end
             2'd1: if(PATTERN_PRBS9) begin err_bits  <= prbs9  ^ rx_data_reg; end else begin err_bits  <= 0; end 
             2'd2: if(PATTERN_PRBS23) begin err_bits <= prbs23 ^ rx_data_reg; end else begin err_bits  <= 0; end 
             2'd3: if(PATTERN_PRBS31) begin err_bits <= prbs31 ^ rx_data_reg;  end else begin err_bits  <= 0; end 
          default: err_bits <= {DATA_WIDTH{1'b1}}; 
        endcase 
    
        rx_d=0;
        for (i=0; i < DATA_WIDTH; i=i+1) // Counts number of error bits
          begin
                rx_d =  (rx_d + err_bits[i]);
          end
        
        if((PRBS_CLR_ERR_CNT) || (!err_cnt_en)) begin
            PRBS_ERR_DET <= 1'b0;
        end else if(rx_d > 3) begin // more than 3 bits causes error generation
            PRBS_ERR_DET <= 1'b1;
        end else begin
            PRBS_ERR_DET <= 1'b0;
        end
      end
  end 
  

always @ (posedge RX_CLK or negedge SYS_RESET_N)
  begin
    if ((!SYS_RESET_N)|| (!RX_READY) || (!RX_DATA_EN) || (!RX_VAL)) begin
        PRBS_ERR_CNT <= {ERR_CNT_WIDTH{1'b0}};
        err_det_en <= 1'b0;
    end else begin
        err_det_en <= PRBS_ERR_DET;
        if((PRBS_CLR_ERR_CNT) || (!err_cnt_en)) begin
            PRBS_ERR_CNT <= {ERR_CNT_WIDTH{1'b0}};
        end else if(err_det_en && PRBS_ERR_DET) begin // more than 3 bits causes error generation
            PRBS_ERR_CNT <= PRBS_ERR_CNT + 1'b1;
        end else begin
            PRBS_ERR_CNT <= PRBS_ERR_CNT;
        end
    end
  end
  
     

   
always @ (posedge RX_CLK or negedge SYS_RESET_N)
  begin
    if ((!SYS_RESET_N)|| (!RX_READY) || (!RX_DATA_EN) || (!RX_VAL)) begin
        RX_ALIGN <= 1'b0;
		rx_align_st <= 1'b0;
		rx_align_pos <= 7'b0;
    end else begin
	    case(rx_align_st)
		     1'b0: begin
	                 if((!RX_ALIGN) || (prbs_sel_reg != PRBS_SEL)) begin
                         RX_ALIGN <= 1'b0;
					     rx_align_st <= 1'b1;
                         rx_align_pos <= 7'b0;
		             end else begin
                         RX_ALIGN <= 1'b1;
                         rx_align_st <= 1'b0;                               
		             end            
		           end              
		     1'b1: begin            
		             if(rx_data_align[DATA_WIDTH-1:0] == ALIGN_DATA[DATA_WIDTH-1:0]) begin
                         RX_ALIGN <= 1'b1;
                         rx_align_st <= 1'b0;
						 if(rx_align_pos == 7'd0) begin
						     rx_align_pos <= 7'd79;
						 end else begin
						     rx_align_pos <= rx_align_pos - 1'b1;
						 end
					 end else begin
                         rx_align_st <= 1'b1;
                         rx_align_pos <= rx_align_pos + 1'b1;                              
					 end
		           end
		  default: begin
                     RX_ALIGN <= 1'b0;
		             rx_align_st <= 1'b0;
		             rx_align_pos <= 7'b0;
		           end
		endcase
      end
  end 
  
  
	


always @ (posedge RX_CLK or negedge SYS_RESET_N)
  begin
    if ((!SYS_RESET_N)|| (!RX_READY) || (!RX_DATA_EN) || (!RX_VAL)) begin
		rx_data_align <= {DATA_WIDTH{1'b0}};
        rx_data_buff <= {DATA_WIDTH*2{1'b0}};
    end else begin
       rx_data_buff <= {RX_DATA[DATA_WIDTH-1:0], rx_data_buff[(DATA_WIDTH*2)-1:DATA_WIDTH]};
	   if(DATA_WIDTH == 80) begin
	         case(rx_align_pos)
	              7'd0: rx_data_align <= rx_data_buff[79: 0];   
	              7'd1: rx_data_align <= rx_data_buff[80: 1];   
	              7'd2: rx_data_align <= rx_data_buff[81: 2];   
	              7'd3: rx_data_align <= rx_data_buff[82: 3];   
	              7'd4: rx_data_align <= rx_data_buff[83: 4];   
	              7'd5: rx_data_align <= rx_data_buff[84: 5];   
	              7'd6: rx_data_align <= rx_data_buff[85: 6];   
	              7'd7: rx_data_align <= rx_data_buff[86: 7];   
	              7'd8: rx_data_align <= rx_data_buff[87: 8];   
	              7'd9: rx_data_align <= rx_data_buff[88: 9];   
	             7'd10: rx_data_align <= rx_data_buff[89:10];   
	             7'd11: rx_data_align <= rx_data_buff[90:11];   
	             7'd12: rx_data_align <= rx_data_buff[91:12];   
	             7'd13: rx_data_align <= rx_data_buff[92:13];   
	             7'd14: rx_data_align <= rx_data_buff[93:14];   
	             7'd15: rx_data_align <= rx_data_buff[94:15];   
	             7'd16: rx_data_align <= rx_data_buff[95:16];   
	             7'd17: rx_data_align <= rx_data_buff[96:17];   
	             7'd18: rx_data_align <= rx_data_buff[97:18];   
	             7'd19: rx_data_align <= rx_data_buff[98:19];   
	             7'd20: rx_data_align <= rx_data_buff[99:20];   
	             7'd21: rx_data_align <= rx_data_buff[100:21];  
	             7'd22: rx_data_align <= rx_data_buff[101:22];  
	             7'd23: rx_data_align <= rx_data_buff[102:23];  
	             7'd24: rx_data_align <= rx_data_buff[103:24];  
	             7'd25: rx_data_align <= rx_data_buff[104:25];  
	             7'd26: rx_data_align <= rx_data_buff[105:26];  
	             7'd27: rx_data_align <= rx_data_buff[106:27];  
	             7'd28: rx_data_align <= rx_data_buff[107:28];  
	             7'd29: rx_data_align <= rx_data_buff[108:29];  
	             7'd30: rx_data_align <= rx_data_buff[109:30];  
	             7'd31: rx_data_align <= rx_data_buff[110:31];  
	             7'd32: rx_data_align <= rx_data_buff[111:32];  
	             7'd33: rx_data_align <= rx_data_buff[112:33];  
	             7'd34: rx_data_align <= rx_data_buff[113:34];  
	             7'd35: rx_data_align <= rx_data_buff[114:35];  
	             7'd36: rx_data_align <= rx_data_buff[115:36];  
	             7'd37: rx_data_align <= rx_data_buff[116:37];  
	             7'd38: rx_data_align <= rx_data_buff[117:38];  
	             7'd39: rx_data_align <= rx_data_buff[118:39];  
	             7'd40: rx_data_align <= rx_data_buff[119:40];  
	             7'd41: rx_data_align <= rx_data_buff[120:41];  
	             7'd42: rx_data_align <= rx_data_buff[121:42];  
	             7'd43: rx_data_align <= rx_data_buff[122:43];  
	             7'd44: rx_data_align <= rx_data_buff[123:44];  
	             7'd45: rx_data_align <= rx_data_buff[124:45];  
	             7'd46: rx_data_align <= rx_data_buff[125:46];  
	             7'd47: rx_data_align <= rx_data_buff[126:47];  
	             7'd48: rx_data_align <= rx_data_buff[127:48];  
	             7'd49: rx_data_align <= rx_data_buff[128:49];  
	             7'd50: rx_data_align <= rx_data_buff[129:50];  
	             7'd51: rx_data_align <= rx_data_buff[130:51];  
	             7'd52: rx_data_align <= rx_data_buff[131:52];  
	             7'd53: rx_data_align <= rx_data_buff[132:53];  
	             7'd54: rx_data_align <= rx_data_buff[133:54];  
	             7'd55: rx_data_align <= rx_data_buff[134:55];  
	             7'd56: rx_data_align <= rx_data_buff[135:56];  
	             7'd57: rx_data_align <= rx_data_buff[136:57];  
	             7'd58: rx_data_align <= rx_data_buff[137:58];  
	             7'd59: rx_data_align <= rx_data_buff[138:59];  
	             7'd60: rx_data_align <= rx_data_buff[139:60];  
	             7'd61: rx_data_align <= rx_data_buff[140:61];  
	             7'd62: rx_data_align <= rx_data_buff[141:62];  
	             7'd63: rx_data_align <= rx_data_buff[142:63];  
	             7'd64: rx_data_align <= rx_data_buff[143:64];  
	             7'd65: rx_data_align <= rx_data_buff[144:65];  
	             7'd66: rx_data_align <= rx_data_buff[145:66];  
	             7'd67: rx_data_align <= rx_data_buff[146:67];  
	             7'd68: rx_data_align <= rx_data_buff[147:68];  
	             7'd69: rx_data_align <= rx_data_buff[148:69];  
	             7'd70: rx_data_align <= rx_data_buff[149:70];  
	             7'd71: rx_data_align <= rx_data_buff[150:71];  
	             7'd72: rx_data_align <= rx_data_buff[151:72];  
	             7'd73: rx_data_align <= rx_data_buff[152:73];  
	             7'd74: rx_data_align <= rx_data_buff[153:74];  
	             7'd75: rx_data_align <= rx_data_buff[154:75];  
	             7'd76: rx_data_align <= rx_data_buff[155:76];  
	             7'd77: rx_data_align <= rx_data_buff[156:77];  
	             7'd78: rx_data_align <= rx_data_buff[157:78];  
	             7'd79: rx_data_align <= rx_data_buff[158:79];  
	  	     default: rx_data_align <= rx_data_buff[79:0];      
	       endcase                                   
	   end else begin //DATA_WIDTH == 10             
	       case(rx_align_pos)                        
	              7'd0: rx_data_align <= rx_data_buff[9:0];
	              7'd1: rx_data_align <= rx_data_buff[10:1];
	              7'd2: rx_data_align <= rx_data_buff[11:2];
	              7'd3: rx_data_align <= rx_data_buff[12:3];
	              7'd4: rx_data_align <= rx_data_buff[13:4];
	              7'd5: rx_data_align <= rx_data_buff[14:5];
	              7'd6: rx_data_align <= rx_data_buff[15:6];
	              7'd7: rx_data_align <= rx_data_buff[16:7];
	              7'd8: rx_data_align <= rx_data_buff[17:8];
	              7'd9: rx_data_align <= rx_data_buff[18:9];
	  	     default: rx_data_align <= rx_data_buff[9:0];
	       endcase          
	   end     
    end          
  end 
  
	
always @ (posedge RX_CLK or negedge SYS_RESET_N)
  begin
    if ((!SYS_RESET_N)|| (!RX_READY) || (!RX_VAL) || (!RX_DATA_EN)  ) begin
        err_cnt_en <= 1'b0;
        err_cnt_en_cnt <= {CLogB2(ERR_CHK_DELAY){1'b0}};
        err_cnt_en_st <= 1'b0;
        prbs_sel_reg <= 2'b0;
    end else begin
	    if(!RX_ALIGN)begin
		    prbs_sel_reg <= PRBS_SEL;
            err_cnt_en <= 1'b0;
            err_cnt_en_st <= 1'b0;
            err_cnt_en_cnt <= {CLogB2(ERR_CHK_DELAY){1'b0}};
		end else begin
            case(err_cnt_en_st)
                 1'b0: begin
                         prbs_sel_reg <= PRBS_SEL;
                         if(err_cnt_en_cnt == ERR_CHK_DELAY) begin
                             err_cnt_en_cnt <= {CLogB2(ERR_CHK_DELAY){1'b0}};
                             err_cnt_en_st <= 1'b1;
                             err_cnt_en <= 1'b1;
                         end else begin
                             err_cnt_en_cnt <= err_cnt_en_cnt + 1'b1;
                             err_cnt_en_st <= 1'b0;
                         end
                       end
                 1'b1: begin
                         if(prbs_sel_reg == PRBS_SEL) begin
                             err_cnt_en_st <= 1'b1;
                         end else begin
                             prbs_sel_reg <= PRBS_SEL;
                             err_cnt_en_st <= 1'b0;
                             err_cnt_en <= 1'b0;
                         end 
                       end
              default: begin
                         err_cnt_en <= 1'b0;
                         err_cnt_en_cnt <= {CLogB2(ERR_CHK_DELAY){1'b0}};
                         err_cnt_en_st <= 1'b0;
                         prbs_sel_reg <= 2'b0;
                       end
            endcase
		end
    end
  end

//Log of base 2     
function integer CLogB2;
 input [11:0] Depth;
 integer i;
 begin
   i = Depth;
   for(CLogB2 = 0; i > 0; CLogB2 = CLogB2 + 1)
     begin
       i = i >> 1;
     end
 end
endfunction 
  
endmodule
