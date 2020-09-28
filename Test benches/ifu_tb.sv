`timescale 1ns/1ns
module ifu_tb;
import typedecode ::* ;
	logic clk,reset;
	logic [31:0] pc,
	itype_imm,
	stype_imm,
	sbtype_imm,
	utype_imm,
	ujtype_imm;
	opcodes_i opcodes;
	logic [31:0] instruction;
ifu dut(
	.clk(clk),
	.reset(reset),
	.instruction_i(instruction),
	.opcodes(opcodes),
	.pc_o(pc),
	.itypeimm(itype_imm),
	.stypeimm(stype_imm),
	.sbtypeimm(sbtype_imm),
	.utypeimm(utype_imm),
	.ujtypeimm(ujtype_imm));
initial begin
clk = 0;
repeat(10) #20 clk=~clk;
end
initial begin
reset = 0;
repeat (40) #5 reset = ~reset;
end
initial begin
opcodes = opcodes.first();
repeat(opcodes.num()) #20 opcodes=opcodes.next();
end
initial begin
instruction = 32'h00345678;
#20 instruction = 32'h00345478;
#20 instruction = 32'h00345679;
end
endmodule
