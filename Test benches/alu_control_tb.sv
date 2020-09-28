`timescale 1ns/1ns
module alu_control_tb;
	logic [2:0] aluop_i;
	logic [2:0] f3_i;
	logic f7_i;
	logic [4:0] out_o;

	alu_control dut(
		.aluop_i(aluop_i),
		.f3_i(f3_i),
		.f7_i(f7_i),
		.out_o(out_o)
	);

	initial begin
		aluop_i = 3'b101;
		f3_i = 3'b010;
		f7_i = 1;
		#5;
		aluop_i = 3'b100;
		f3_i = 3'b001;
		f7_i = 0;
		#5;
		aluop_i = 3'b110;
		f3_i = 3'b010;
		f7_i = 1;
		#5;
		aluop_i = 3'b011;
		f3_i = 3'b010;
		f7_i = 0;
		#5;
		aluop_i = 3'b000;
		f3_i = 3'b101;
		f7_i = 1;
		#5;
		aluop_i = 3'b001;
		f3_i = 3'b010;
		f7_i = 1;	
		#5;
		aluop_i = 3'b010;
		f3_i = 3'b111;
		f7_i =1;
		#5;
		aluop_i = 3'b010;
		f3_i = 3'b110;
		f7_i =1;
		#5;
		aluop_i = 3'b010;
		f3_i = 3'b001;
		f7_i =1;
	end
endmodule	
