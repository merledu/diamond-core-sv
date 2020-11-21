module ifu(
	input logic clk_i ,reset_i ,
	input [6:0] opcode_i ,
	output logic [31:0]  pc_o,
	input [31:0] itypeimm_i ,sbtypeimm_i ,ujtypeimm_i ,opA_i ,
	input logic branchjump_i
	);
logic [31:0] pc; 
integer i;
initial pc =0;
always@(posedge clk_i) 
begin
//BRANCH CONTROLLER
	if(branchjump_i == 1'b1 && opcode_i == 7'h63) 
	pc = sbtypeimm_i + pc;
//JAL
	else if (opcode_i == 7'h6f) 
	pc = pc + ujtypeimm_i;
//JALR
	else if (opcode_i == 7'h67) 
	pc = opA_i + itypeimm_i;
//pc
	else 
	pc <= pc+32'h4;
end
assign pc_o=pc;
endmodule
