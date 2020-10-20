timeunit 1ns;
timeprecision 1ns;
module top(); 
	logic [6:0] opcode_tb;
	logic [31:0]instruction_tb;
	logic [4:0] rs1_tb;
	logic [4:0] rs2_tb;
	logic [4:0] rd_tb;
	logic rgw_tb;
	logic opbsel_tb;
	logic [31:0] opA_tb;
	logic [31:0] opB_tb;
	logic [2:0] func3i_tb;
	logic func7i_tb;
	logic clk_o;
	logic alubranch_tb;
	logic [2:0] aluopi_tb;
	logic memwo_tb;
	logic brancho_tb;
	logic memrdo_tb;
	logic memtorego_tb;
	logic [1:0] extendselo_tb;
	logic [1:0] nextPCselo_tb;
    logic [31:0]itypeimm_tb;
    logic [31:0]utypeimm_tb;
    logic [31:0]stypeimm_tb;
    logic [31:0]sbtypeimm_tb;
    logic [31:0]ujtypeimm_tb;
    logic [31:0] pc_tb;
    logic pcen_tb;
    logic clear_tb;
    logic [31:0] wdi_tb;
    logic [31:0] imm_tb;
    logic [1:0] opAsel_tb;
    logic [31:0] jalrtar_tb;
    logic branch_tb;
    logic [31:0] outputmux_tb;
    logic [19:0] addr_tb;
    logic readen_tb;
    logic writeen_tb;
    logic [31:0] aluout_tb;
    logic [7:0] dataaddr_tb;
    logic [31:0]datamemout_tb;
    logic [31:0] bi_tb;
    logic [4:0] aluco_tb;
    logic [13:0] ins_addr;
    logic outbranch_i;

    assign ins_addr=pc_tb>>2;
	ifu ifu_PC(
		.clk(clk_o),
		.reset(pcen_tb),
		.opcode(opcode_tb),
		.pc_o(pc_tb),
		.itypeimm(itypeimm_tb),
		.sbtypeimm(sbtypeimm_tb),
		.utypeimm(utypeimm_tb),
		.ujtypeimm(ujtypeimm_tb),
		.outbranch_i(branch_tb)
		);

	
	instr_mem instrmemory(
		.data_i(),
		.data_o(instruction_tb),
		.addr(ins_addr[13:0]),
		.clk(clk_o),
		.ren(readen_tb),
		.wen(writeen_tb)
		);

	decoder dec(
		.instruction(instruction_tb),
		.opcode(opcode_tb),
		.rs1(rs1_tb),
		.rs2(rs2_tb),
		.rd(rd_tb),
		.f3(func3i_tb),
		.f7(func7i_tb)
		);


	control_unit control(
		.opcodes(opcode_tb),
		.regwrite_o(rgw_tb),
		.opBsel_o(opbsel_tb),
		.opAsel_o(opAsel_tb),
		.memw_o(memwo_tb),
	    .branch_o(brancho_tb),
		.memrd_o(memrdo_tb),
		.memtoreg_o(memtorego_tb),
		.aluop_o(aluopi_tb), 
		.extendsel_o(extendselo_tb),
		.nextPCsel_o(nextPCselo_tb)
		);

	jalr_target jalrtarget(
		.A_i(opA_tb),
		.imm_i(pc_tb),
		.jalrt_o(jalrtar_tb)
		);


	mux21_branch mux_21_branch(
		.branch(branch_tb),
		.in1_i(pc_tb),
		.in2_i(sbtypeimm_tb),
		.out_o(outputmux_tb)
		);


	mux41_jalr mux_41_jalr(
		.i1(pc_tb),
		.i2(outputmux_tb),
		.i3(ujtypeimm_tb),
		.i4(jalrtar_tb),
		.nextpcsel(nextPCselo_tb),
		.out_o(pc_tb)
		);


	immgen immediate_gen(
		.instruction(instruction_tb),
		.itype_imm(itypeimm_tb),
		.utype_imm(utypeimm_tb),
		.stype_imm(stypeimm_tb),
		.sbtype_imm(sbtypeimm_tb),
		.ujtype_imm(ujtypeimm_tb)
		);

	
	RF regfile(
		.clk_i(clk_o),
		.rs1_i(rs1_tb),
		.rs2_i(rs2_tb),
		.rd_i(rd_tb),
		.regwrite_i(rgw_tb),
		.operandB_o(opB_tb),
		.operandA_o(opA_tb),
		.reset_i (clear_tb),
		.wd_i(wdi_tb)
		);


	mux21_opbsel mux_21_opbsel(
		.sel_i(opbsel_tb),
		.in1_i(opB_tb),
		.in2_i(pc_tb),
		.out_o(bi_tb)
		);


	ALU aluv(
		.A_i(opA_tb), 
		.B_i(bi_tb), 
		.C_i(aluco_tb), 
		.D_o(aluout_tb),
		.shamt_i(bi_tb), 
		.branch_o(alubranch_tb),
		.alubranch(alubranch_tb),
		.cubranch(brancho_tb),
		.outbranch(branch_tb)
		);


	alu_control aluc(
		.out_o(aluco_tb),
		.f3_i(func3i_tb),
		.f7_i(func7i_tb),
		.aluop_i(aluopi_tb)
		);


	data_mem datamemory (
		.clk(clk_o),
		.wen(memwo_tb),
		.ren(memrdo_tb),
		.alu(aluout_tb),
		.data_i(opB_tb),
		.data_o(datamemout_tb),
		.in1_i(aluout_tb),
		.in2_i(datamemout_tb),
		.memtoreg(memtorego_tb),
		.out_o(wdi_tb)
		);


	initial begin

     clk_o <= 0;
     forever #10 clk_o <= ~clk_o;

    end
endmodule