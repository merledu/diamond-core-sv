`timescale 1ns/1ns
module ifu
import   typedecode ::*;  
	(
	input logic clk,reset,
	opcodes_i opcodes,
	logic [31:0] instruction_i ,
	output bit [31:0]  pc_o,
	stypeimm,	
	itypeimm,
	sbtypeimm,
	utypeimm,
	ujtypeimm 
);
immgen immgen_ifu(	
	.instruction(instruction_i),
	.itype_imm(itypeimm),
	.stype_imm(stypeimm),
	.sbtype_imm(sbtypeimm),	
	.utype_imm(utypeimm),
	.ujtype_imm(ujtypeimm)
);
always @ (posedge clk &&  reset) begin
case (opcodes)
branch : begin
pc_o = pc_o + sbtypeimm;
end
jal: begin
pc_o = pc_o + ujtypeimm;
end
jalr : begin
pc_o = pc_o + itypeimm;
end
default : begin
pc_o = pc_o + 32'h4;
end
endcase
end
endmodule
