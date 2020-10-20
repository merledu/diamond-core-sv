`timescale 1ns/1ns
module ifu 
	(
	input logic clk,reset,
	input logic [6:0] opcode,
	output logic [31:0]  pc_o,
	input logic outbranch_i,
	itypeimm,
	sbtypeimm,
	utypeimm,
	ujtypeimm 
);
logic [31:0] pc;
initial begin 
	pc <=32'b0;
	end
assign reset = 1'b0;
logic rtype, itype,jal,jalr,lui,branch, load, store ; 
assign branch=7'b1100011;
assign jal=7'b1101111;
assign jalr=7'b1100111; 
always @ (posedge clk &&  reset) begin
if (opcode == branch && outbranch_i==1'b1) begin
pc = pc + sbtypeimm;
end
else if (opcode == jal) begin
pc = pc + ujtypeimm;
end
else if (opcode == jalr) begin
pc = pc + itypeimm;
end
else begin
pc = pc + 32'h4;
end
end

assign pc_o = pc;
endmodule
