module decoder(
	input logic [31:0] instruction_i, pc_i , aluoutput_i,
	output logic [6:0] opcode_o,
	output logic [4:0] rd_o, 
	output logic [2:0] f3_o, 
	output logic [4:0] rs1_o,
	output logic [4:0] rs2_o,
	output logic f7_o,
	output logic [19:0] instrmemaddr_o,
	output logic [9:0] datamemaddr_o
	);
always_comb
begin
	opcode_o = instruction_i [6:0];
	rd_o = instruction_i[11:7];
	f3_o = instruction_i[14:12];
	rs1_o = instruction_i[19:15];
	rs2_o = instruction_i[24:20];
	f7_o = instruction_i [30];
	instrmemaddr_o = pc_i[21:2];
	datamemaddr_o = aluoutput_i[9:0];
end
endmodule : decoder