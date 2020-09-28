`timescale 1ns/1ns
module control_unit 
import opcode ::*;
(output logic memw_o,branch_o,memrd_o,regwrite_o,memtoreg_o,opBsel_o,
output logic [2:0] aluop_o, output logic [1:0] opAsel_o,extendsel_o,
nextPCsel_o,input opcode opcodes );
always_comb 
begin 
case(opcodes) 
rtype:
begin
memw_o= 0;
branch_o= 0;
memrd_o= 0;
regwrite_o= 1;
memtoreg_o= 0;
opBsel_o= 0;
aluop_o= 3'b000;
opAsel_o= 2'b00;
extendsel_o= 2'b00;
nextPCsel_o= 2'b00;
end
itype:
begin
memw_o= 0;
branch_o= 0;
memrd_o= 0;
regwrite_o= 1;
memtoreg_o= 0;
opBsel_o= 1;
aluop_o= 3'b001;
opAsel_o= 2'b00;
extendsel_o= 2'b00;
nextPCsel_o= 2'b00;
end
load:
begin
memw_o= 0;
branch_o= 0;
memrd_o= 1;
regwrite_o= 1;
memtoreg_o= 1;
opBsel_o= 1;
aluop_o= 3'b100;
opAsel_o= 2'b00;
extendsel_o= 2'b00;
nextPCsel_o= 2'b00;
end
store:
begin
memw_o= 1;
branch_o= 0;
memrd_o= 0;
regwrite_o= 0;
memtoreg_o= 0;
opBsel_o= 1;
aluop_o= 3'b101;
opAsel_o= 2'b00;
extendsel_o= 2'b10;
nextPCsel_o= 2'b00;
end

branch:
begin
memw_o= 0;
branch_o= 1;
memrd_o= 0;
regwrite_o= 0;
memtoreg_o= 0;
opBsel_o= 0;
aluop_o= 3'b010;
opAsel_o= 2'b00;
extendsel_o= 2'b00;
nextPCsel_o= 2'b01;
end
jalr:
begin
memw_o= 0;
branch_o= 0;
memrd_o= 0;
regwrite_o= 1;
memtoreg_o= 0;
opBsel_o= 0;
aluop_o= 3'b011;
opAsel_o= 2'b10;
extendsel_o= 2'b00;
nextPCsel_o= 2'b11;
end 

jal:
begin
memw_o= 0;
branch_o= 0;
memrd_o= 0;
regwrite_o= 1;
memtoreg_o= 0;
opBsel_o= 0;
aluop_o= 3'b011;
opAsel_o= 2'b10;
extendsel_o= 2'b00;
nextPCsel_o= 2'b10;
end

lui:
begin
memw_o= 0;
branch_o= 0;
memrd_o= 0;
regwrite_o= 1;
memtoreg_o= 0;
opBsel_o= 1;
aluop_o= 3'b110;
opAsel_o= 2'b11;
extendsel_o= 2'b01;
nextPCsel_o= 2'b00;
end
endcase
end
endmodule
