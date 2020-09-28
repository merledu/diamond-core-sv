`timescale 1ns/1ns
module ALUop_tb;
	logic r_type_i;
	logic i_type_i;
	logic store_i;
	logic load_i;
	logic branch_i;
	logic jal_i;
	logic jalr_i;
	logic lui_i;
	logic [2:0] out;

	aluop dut(
		.rtype_i(r_type_i),
		.itype_i(i_type_i),
		.store_i(store_i),
		.load_i(load_i),
		.branch_i(branch_i),
		.jal_i(jal_i),
		.jalr_i(jalr_i),
		.lui_i(lui_i),
		.aluop_o(out)
	);

	initial begin
	#5;
	r_type_i <= 1; 
	i_type_i <= 0; 	
	store_i	<= 0; 	
	load_i <= 0; 
	branch_i <= 0; 	
	jal_i <= 0; 	
	jalr_i <= 0; 	
	lui_i <= 0; 

	#5;
	r_type_i <= 0; 
	i_type_i <= 1; 	
	store_i	<= 0; 	
	load_i <= 0; 
	branch_i <= 0; 	
	jal_i <= 0; 	
	jalr_i <= 0; 	
	lui_i <= 0; 
	
	#5;
	r_type_i <= 0; 
	i_type_i <= 0; 	
	store_i	<= 1; 	
	load_i <= 0; 
	branch_i <= 0; 	
	jal_i <= 0; 	
	jalr_i <= 0; 	
	lui_i <= 0; 
	
	#5;
	r_type_i <= 0; 
	i_type_i <= 0; 	
	store_i	<= 0; 	
	load_i <= 1; 
	branch_i <= 0; 	
	jal_i <= 0; 	
	jalr_i <= 0; 	
	lui_i <= 0; 
	
	#5;
	r_type_i <= 0; 
	i_type_i <= 0; 	
	store_i	<= 0; 	
	load_i <= 0; 
	branch_i <= 1; 	
	jal_i <= 0; 	
	jalr_i <= 0; 	
	lui_i <= 0; 

	#5;
	r_type_i <= 0; 
	i_type_i <= 0; 	
	store_i	<= 0; 	
	load_i <= 0; 
	branch_i <= 0; 	
	jal_i <= 1; 	
	jalr_i <= 0; 	
	lui_i <= 0; 

	#5;
	r_type_i <= 0; 
	i_type_i <= 0; 	
	store_i	<= 0; 	
	load_i <= 0; 
	branch_i <= 0; 	
	jal_i <= 0; 	
	jalr_i <= 1; 	
	lui_i <= 0; 

	#5;
	r_type_i <= 0; 
	i_type_i <= 0; 	
	store_i	<= 0; 	
	load_i <= 0; 
	branch_i <= 0; 	
	jal_i <= 0; 	
	jalr_i <= 0; 	
	lui_i <= 1; 

	#5;
	r_type_i <= 1; 
	i_type_i <= 0; 	
	store_i	<= 0; 	
	load_i <= 0; 
	branch_i <= 0; 	
	jal_i <= 0; 	
	jalr_i <= 0; 	
	lui_i <= 0; 	
	
	end


endmodule 