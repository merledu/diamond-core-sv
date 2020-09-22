`timescale 1ns/1ns
module aluop(input logic RTYPE_i,ITYPE_i,LOAD_i,STORE_i,BRANCH_i,
JALR_i,JAL_i,LUI_i,
output logic [2:0] aluop_o);
always_comb
begin
if(RTYPE_i == 1)
	aluop_o=000;
else if(LOAD_i == 1)
	aluop_o=100;
else if(STORE_i == 1)
	aluop_o=101;
else if(BRANCH_i == 1)
	aluop_o=010;
else if(ITYPE_i == 1)
	aluop_o=001;
else if(JALR_i == 1) 
	aluop_o=011;
else if(JAL_i==1)
	aluop_o=011;
else if(LUI_i == 1)
	aluop_o=110;
else
	aluop_o=3'b0;
end
endmodule

