`timescale 1ns/1ns
module control_unit_tb ;
import opcode ::*;
	logic memw_o;
	logic branch_o;
	logic memrd_o;
	logic regwrite_o;
	logic memtoreg_o;
	logic opBsel_o;
	logic [2:0] aluop_o;
	logic [1:0] opAsel_o;
	logic [1:0] extendsel_o;
	logic [1:0] nextPCsel_o;
	opcode opcodes ;

control_unit dut
(
	.regwrite_o(regwrite_o),
	.memrd_o(memrd_o),
	.memw_o(memw_o),
	.memtoreg_o(memtoreg_o),
	.opBsel_o(opBsel_o),
	.branch_o(branch_o),	
	.opAsel_o(opAsel_o),
	.nextPCsel_o(nextPCsel_o),
	.extendsel_o(extendsel_o),
	.aluop_o(aluop_o),
	.opcodes(opcodes)
);
initial 
begin
	opcodes = rtype;
	#5;
	opcodes = itype;
	#5;
	opcodes = load;
	#5;
	opcodes = store;
	#5;
	opcodes = branch;
	#5;
	opcodes = jalr;
	#5;
	opcodes = jal;
	#5;
	opcodes = lui;
end
endmodule
