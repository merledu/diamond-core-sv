`timescale 1ns/1ns
module imm_gen_tb;
	logic [31:0]instruction;
	logic [31:0]i_imm;
	logic [31:0]u_imm;
	logic [31:0]s_imm;
	logic [31:0]sb_imm;
	logic [31:0]uj_imm;

	imm_gen dut(
		.instruction(instruction),
		.i_imm(i_imm),
		.u_imm(u_imm),
		.s_imm(s_imm),
		.sb_imm(sb_imm),
		.uj_imm(uj_imm)
	);

	initial begin
		instruction <= 32'h3E7;
		
	end

endmodule