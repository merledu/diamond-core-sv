module operandsel (
	input logic [1:0] operandAsel_i ,extendsel_i ,
	input logic [31:0] pc_i ,
	input logic operandBsel_i ,
	input logic [31:0] A_i ,B_i,
	input logic [31:0] stypeimm_i ,sbtypeimm_i , ujtypeimm_i , utypeimm_i ,itypeimm_i ,
	output logic [31:0] operandA_o ,operandB_o 
	);

// FOR OPERAND_B SELECTION
always_comb begin 
	if (operandBsel_i == 1'b1) 
	begin
		if (extendsel_i == 2'b0 ) 
		operandB_o=itypeimm_i;
		else if (extendsel_i == 2'b01 )
		operandB_o=utypeimm_i;
		else if (extendsel_i == 2'b10 )
		operandB_o=stypeimm_i;
	end
	else
	operandB_o= B_i;
//FOR OPERAND_A SELECTION
	if(operandAsel_i == 2'b01)
	operandA_o=(pc_i+32'h4);
	else
	operandA_o= A_i;
end
endmodule 