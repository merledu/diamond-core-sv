module controlunit(
input logic [6:0] opcode_i,
output logic memw_o,branch_o,memrd_o,regwrite_o,memtoreg_o,opBsel_o,
output logic [2:0] aluop_o, output logic [1:0] opAsel_o,extendsel_o,
nextPCsel_o,
output logic [14:0] output_o);

assign {memw_o,branch_o,memrd_o,regwrite_o,memtoreg_o,
opBsel_o,aluop_o,opAsel_o,extendsel_o,nextPCsel_o} = output_o;
always_comb
begin
case(opcode_i)
7'b0110011 : output_o <= 15'b000100000000000; // R-type
7'b0000011 : output_o <= 15'b001111100000000; // load
7'b0100011 : output_o <= 15'b100001101001000; // store
7'b1100011 : output_o <= 15'b010000010000001; // branch
7'b0010011 : output_o <= 15'b000101001000000; // I-type
7'b1100111 : output_o <= 15'b000100011100011; // jalr
7'b1101111 : output_o <= 15'b000100011100010; // jal
7'b0110111 : output_o <= 15'b000101110110100; // lui
default : output_o    <= 15'bxxxxxxxxx;
endcase
end
endmodule