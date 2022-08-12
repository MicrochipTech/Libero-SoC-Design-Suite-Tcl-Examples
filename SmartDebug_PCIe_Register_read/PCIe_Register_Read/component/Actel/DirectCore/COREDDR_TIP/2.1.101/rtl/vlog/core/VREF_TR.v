
/// Header_Start --->>>



/// Header_End <<<---


/// I/O_Start --->>>

// Perform Vref training

module VREF_TR( SCLK,
                reset_n,
                vref_done,
                vref_direction,
                vref_move,
                vref_out_of_range,
                vref_reload,
                apb_addr,
                apb_we,
                apb_wrdata,
                vref_rddata,
                dfi_rddata,
                dfi_rdlvl_cs_0_n,
                dfi_rdlvl_cs_1_n,
                do_train_vref );

parameter IOG_DQS_LANES = 9;

input          SCLK;
input          reset_n;

// Port: CONFIG

output         vref_done;

// Port: SYSTEM

output         vref_direction;
output         vref_move;
input          vref_out_of_range;
output         vref_reload;

// Port: APB

input [15:0]   apb_addr;       // Internal APB address
input          apb_we;
input [7:0]    apb_wrdata;
output [7:0]   vref_rddata;    // Vref read data from the read level block to the APB interface

// Port: NWL_IOG

input [(IOG_DQS_LANES*64)-1:0]  dfi_rddata;     // Read data bus. This bus transfers read data from the PHY to the
                               // MC.

// Port: Port_1

input          dfi_rdlvl_cs_0_n; // Read data data path chip select
input          dfi_rdlvl_cs_1_n; // Read data data path chip select
input         do_train_vref;


/// I/O_End <<<---


/// I/O_End <<<---

// Poll for do_train_vref - delay - spit out dfi_training_complete and vref_done

// Gian simple response and readdata
reg vref_done;
reg [3:0] count;

always @(posedge SCLK or negedge reset_n) begin
	if(reset_n == 0) begin
			count <= 0;
			vref_done <= 0;
	end else begin
		if(count == 10) begin
			vref_done <= 1'b1;
			count <= 0;
		end else begin
			vref_done <= 0;
			if(do_train_vref) begin
				count <= count + 1;
			end
		end
	end
end
	

assign vref_direction = 0;
assign vref_move = 0;
assign vref_reload = 0;
assign vref_rddata = 'hba;


/// Components_End <<<---


endmodule

