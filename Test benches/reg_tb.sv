`timescale 1ns/1ns
module RF_tb;
	logic regwrite_i;
	logic clk_i;
	logic reset_i;
	logic [4:0] rs1_i;
	logic [4:0] rs2_i;
	logic [4:0] rd_i;
	logic [31:0] wd_i;
	logic [31:0] operandA_o;
	logic [31:0] operandB_o;
	
	RF dut(
		.regwrite_i(regwrite_i),
		.clk_i(clk_i),
		.reset_i(reset_i),
		.rs1_i(rs1_i),	
		.rs2_i(rs2_i),
		.rd_i(rd_i),
		.wd_i(wd_i),
		.operandA_o(operandA_o),
		.operandB_o(operandB_o)
	);
	
	initial begin 
		#5;
		reset_i <= 0;
		rd_i <= 5'b00001;
		rs1_i <= 5'b00001;
		rs2_i <= 0;
		regwrite_i <= 1;
		wd_i <= 32'b00001;

		#5;
		reset_i <= 0;
		rd_i <= 5'b00001;
		rs1_i <= 5'b00001;
		rs2_i <= 0;
		regwrite_i <= 0;
		wd_i <= 32'b00001;

		#5;
		reset_i <= 1;
		rd_i <= 5'b00001;
		rs1_i <= 5'b00001;
		rs2_i <= 0;
		regwrite_i <= 1;
		wd_i <= 32'b00001;

		 
		
	end
	
	always begin
		clk_i <= 0; #5;
		clk_i <= 1; #5;
	end 
	
endmodule 