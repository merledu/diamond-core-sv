`timescale 1ns/1ns
module alu_tb;
	logic[31:0] A_i;
	logic[31:0] B_i;
	logic [4:0] C_i; 
	logic[31:0] D_o; 
	logic branch_o;
	logic [1:0] branch2_o;
	logic [4:0] shamt_i;
	

	ALU dut(
		.A_i(A_i),
		.B_i(B_i),
		.C_i(C_i),
		.D_o(D_o),
		.branch_o(branch_o),
		.branch2_o(branch2_o)
	);
	
	initial begin 
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b00000;
	
		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b00010;
		
		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b00010;

		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b10110;

		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b00100;

		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b00101;

		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b00110;

		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b00111;
	
		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b01000;

		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b1101;

		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b01110;

		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b01111;

		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b10100;

		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b10001;

		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b10011;

		#5;
		A_i <= 32'b0001;
		B_i <= 32'b0011;
		C_i <= 5'b11111;

		
	end
endmodule
