module TOP;
	logic [31:0] operandA;
	logic [31:0] operandB;
	logic [31:0] aluoutput;
	logic [4:0] shamt;
	logic [4:0] alucontrol;
	logic branch; 
	logic branchjump;
	logic controlunitbranch;
	logic [2:0] funct3;
    logic funct7;
    logic [2:0] aluop;
    logic memw;
	logic memrd;
	logic regwrite;
	logic memtoreg;
	logic opBsel;
	logic [1:0] opAsel;
	logic [1:0] extendsel;
	logic [1:0] nextPCsel;
	logic [6:0] opcodes;
	logic clk;
	logic reset;
	logic [31:0] opB ; 
	logic [31:0] opA ;
	logic [9:0] addr;
	logic [31:0] writedata;
	logic [31:0] data;
	logic [31:0] instruction;
	logic [31:0] pc;
	logic [4:0] rd; 
	logic [4:0] rs1;
	logic [4:0] rs2;
	logic [19:0] instrmemaddr;
    logic [31:0] itypeimm;
    logic [31:0] utypeimm;
    logic [31:0] stypeimm;
    logic [31:0] sbtypeimm;
    logic [31:0] ujtypeimm;




	alu alu_top(
		.operandA_i (operandA),
		.operandB_i (operandB),
		.alucontrol_i(alucontrol),
		.shamt_i (shamt),
		.aluoutput_o (aluoutput), 
		.branch_o (branch),
		.controlunitbranch_i (controlunitbranch),
		.branchjump_o (branchjump)   
		);

	alu_control alucontrol_top(
		.funct3_i (funct3),
    	.funct7_i (funct7),
    	.aluop_i (aluop),
    	.alucontrol_o (alucontrol)
		);

	control_unit controlunit(
		.memw_o (memw),
		.branch_o (controlunitbranch),
		.memrd_o (memrd),
		.regwrite_o (regwrite),
		.memtoreg_o (memtoreg),
		.opBsel_o (opBsel),
		.aluop_o (aluop), 
		.opAsel_o (opAsel),
		.extendsel_o (extendsel),
		.nextPCsel_o (nextPCsel),
		.opcodes_i (opcodes)
		);

	data_mem datamemory(
		.clk_i (clk), 
		.reset_i (reset), 
		.read_i (memrd), 
		.write_i (memw),
		.aluoutput_i (aluoutput), 
		.opB_i (opB), 
		.addr_i (addr),
		.writedata_o (writedata),
		.data_o (data)
		);

	decoder instrdecode(
		.instruction_i(instruction), 
		.pc_i (pc), 
		.aluoutput_i (aluoutput),
		.opcode_o (opcodes),
		.rd_o (rd), 
		.f3_o (funct3), 
		.rs1_o (rs1),
		.rs2_o (rs2),
		.f7_o (funct7),
		.instrmemaddr_o (instrmemaddr),
		.datamemaddr_o (addr)
		);

	immediate_gen immediate_generation(
		.instruction_i (instruction),
    	.itypeimm_o (itypeimm),
    	.utypeimm_o (utypeimm),
    	.stypeimm_o (stypeimm),
    	.sbtypeimm_o (sbtypeimm),
    	.ujtypeimm_o (ujtypeimm)
		);

	ifu instrfetch(
		.clk_i (clk),
		.reset_i (reset),
		.opcode_i (opcodes),
		.pc_o (pc),
		.itypeimm_i (itypeimm),
		.sbtypeimm_i (sbtypeimm),
		.ujtypeimm_i (ujtypeimm),
		.opA_i (opA),
		.branchjump_i (branchjump)
		);

	instr_mem instrmemory(
		.clk_i (clk), 
		.reset_i (reset),
		.addr_i (instrmemaddr),
 		.data_o (instruction)
		);

	register registerfile(
		.clk_i (clk), 
		.reset_i (reset), 
		.regwrite_i (regwrite),
		.rd_i (rd), 
		.rs1_i  (rs1), 
		.rs2_i (rs2), 
		.wd_i (writedata),
		.A_o (opA), 
		.B_o (opB)
		);

	operandsel operandselection(
		.operandAsel_i (opAsel),
		.extendsel_i (extendsel),
		.pc_i (pc),
		.operandBsel_i (opBsel),
		.A_i (opA),
		.B_i (opB),
		.stypeimm_i (stypeimm),
		.sbtypeimm_i (sbtypeimm), 
		.ujtypeimm_i (ujtypeimm), 
		.utypeimm_i (utypeimm),
		.itypeimm_i (itypeimm),
		.operandA_o (operandA),
		.operandB_o (operandB)
		);
	
	initial begin
	reset =0;
    clk <= 0;
    forever #10 clk <= ~clk;
    end
endmodule