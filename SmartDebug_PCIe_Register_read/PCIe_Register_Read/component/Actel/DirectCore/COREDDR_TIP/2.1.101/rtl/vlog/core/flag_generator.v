module noisy_data_detector(clock, data, clear_flags, noise_detect_flag);

parameter data_width=2;
input clock;
input [data_width-1:0] data;
input clear_flags;
output reg noise_detect_flag;

reg [data_width-1:0] data_0;
reg [data_width-1:0] data_1;

always @ (posedge clock or posedge clear_flags) begin
	if (clear_flags) noise_detect_flag<=0;
	else begin
		noise_detect_flag<=(data_0==data_1)?noise_detect_flag:1;
	end
end

always @ (posedge clock)
begin
	data_0<=data;
	data_1<=data_0;
end

endmodule



// AS: modified to make sampling circuit synchronous instead
//     of asynchronous (5/30)
module data_transition_detector(clock,data,sample,data_transition_flag);
parameter data_width=2;
input clock;
input [data_width-1:0] data;
input sample;
output  data_transition_flag;

reg [data_width-1:0] data_0;
reg [data_width-1:0] data_1;

reg                  sample_reg;

assign data_transition_flag=data_0!=data_1;
//always @ (negedge sample) begin
always @ (posedge clock) begin
  sample_reg <= sample;
  if (!sample_reg && sample)
  begin
    data_0<=data;
    data_1<=data_0;
  end
end

endmodule



module flag_generator (clock,data,clear_flags,flag);
parameter data_width=2;
input clock;
input [data_width-1:0] data;
input clear_flags;
output flag;


wire data_transition_flag;
wire noise_detect_flag;

defparam noise_detect.data_width=data_width;
defparam transition_detect.data_width=data_width;
noisy_data_detector noise_detect (.clock(clock),.data(data),.clear_flags(clear_flags),.noise_detect_flag(noise_detect_flag));
data_transition_detector transition_detect (.clock(clock), .data(data),.sample(clear_flags),.data_transition_flag(data_transition_flag));

assign flag=data_transition_flag|noise_detect_flag;

endmodule
