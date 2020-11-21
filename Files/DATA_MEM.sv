module data_mem(
	input logic clk,
	input logic ren,
	input logic wen	,
	input logic [31:0] alu,
	input logic [31:0] data_i,
	output logic [31:0] data_o,
	input logic [31:0] in1_i,in2_i,
	input logic memtoreg,
	output logic [31:0] out_o
);

logic [7:0] addr;
logic [31:0] mem[0:255];
assign addr = alu [9:2];
always @(posedge clk) begin 
	if(wen) begin
		mem[addr] <= data_i;	
	end
end
always @(posedge clk) begin
	if(ren) begin
		data_o = mem[addr];	
	end
end
always_comb begin
	if(memtoreg == 0) begin
		out_o = in1_i;
	end
	else begin
		out_o = in2_i;
	end
end
endmodule
