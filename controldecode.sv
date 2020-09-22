`timescale 1ns/1ps
module control_decode(input logic r_type_i,load_i,store_i,branch_i,
i_type_i,jalr_i,jal_i,lui_i, 
output logic memw_o,branch_o,memrd_o,regwrite_o,memtoreg_o,opBsel_o,
output logic [2:0] aluop_o, output logic [1:0] opAsel_o,extendsel_o,
nextPCsel_o);
always_comb
begin
if(r_type_i !== 0)
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

else if(load_i !== 0)
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

else if(store_i !== 0)
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

else if(branch_i !== 0)
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

else if(i_type_i !== 0 )
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

else if(jalr_i !== 0)
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

else if(jal_i !==0)
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

else if(lui_i !== 0)
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
end
endmodule
