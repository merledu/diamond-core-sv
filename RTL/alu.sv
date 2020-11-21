module alu (
	input logic[31:0] operandA_i,
	input logic[31:0] operandB_i,
	input logic[4:0] alucontrol_i,
	input logic [4:0] shamt_i,
	output logic[31:0] aluoutput_o, 
	output logic branch_o,
	input logic controlunitbranch_i,
	output logic branchjump_o     

);
logic [1:0] branch2_o;
assign shamt_i = operandB_i[4:0];
assign branch2_o = alucontrol_i [4:3];
always_comb begin 
	aluoutput_o=
		(alucontrol_i == 5'b00000) ? operandA_i + operandB_i : 		//ADD ADDI 
		(alucontrol_i == 5'b00001) ? operandA_i << shamt_i :  //SLLI 
		(alucontrol_i == 5'b00010) ? {31'b0,operandA_i < operandB_i} : // SLTI 
		(alucontrol_i == 5'b00011) ? {31'b0,operandA_i < operandB_i} : // SLTUI
		(alucontrol_i == 5'b10110) ? {31'b0,operandA_i < operandB_i} : // BLTU
		(alucontrol_i == 5'b00100) ? operandA_i ^ operandB_i : //XOR XORI
		(alucontrol_i == 5'b00101) ? operandA_i >> shamt_i : //SRLI 
		(alucontrol_i == 5'b01101) ? operandA_i >> shamt_i : //SRAI 
		(alucontrol_i == 5'b00110) ? operandA_i | operandB_i : //ORI
		(alucontrol_i == 5'b00111) ? operandA_i & operandB_i :  //AND
		(alucontrol_i == 5'b01000) ? operandA_i - operandB_i :	//SUB
		(alucontrol_i == 5'b10000) ? {31'b0,$signed(operandA_i) == $signed(operandB_i)} :  //BEQ
		(alucontrol_i == 5'b10001) ? {31'b0,$signed(operandA_i) !== $signed(operandB_i)} : //BNE 
		(alucontrol_i == 5'b10100) ? {31'b0,$signed(operandA_i) < $signed(operandB_i)} : //BLT 
		(alucontrol_i == 5'b10101) ? {31'b0,$signed(operandA_i) >= $signed(operandB_i)} :  // BGE 
		(alucontrol_i == 5'b10111) ? {31'b0,operandA_i >= operandB_i} : //BGE UNSIGNED 
		(alucontrol_i == 5'b10111) ? {31'b0,operandA_i < operandB_i} : // BLT UNSIGNED 
		(alucontrol_i == 5'b11111) ? operandA_i : 32'b0;   //OP A = PC+4 FOR JAL
		assign branch_o = ((branch2_o == 2'b10) && (aluoutput_o==1))? 1'b1: 1'b0; 
		begin 
		branchjump_o = branch_o & controlunitbranch_i;
		end
end
endmodule