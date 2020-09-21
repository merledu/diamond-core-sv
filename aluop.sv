`timescale 1ns/1ns
module aluop(input logic RTYPE_i,ITYPE_i,LOAD_i,STORE_i,BRANCH_i,
JALR_i,JAL_i,LUI_i,
output logic [2:0] aluop_o);
always_comb
begin
case(aluop_o)
begin
if(RTYPE_i == 1)
	aluop_o=000;
elseif(LOAD_i == 1)
	aluop_o=100;
elseif(STORE_i == 1)
	aluop_o=101;
elseif(BRANCH_i == 1)
	aluop_o=010;
elseif(ITYPE_i == 1)
	aluop_o=001;
elseif(JALR_i == 1) 
	aluop_o=011;
elseif(JAL_i==1)
	aluop_o=011;
elseif(LUI_i == 1)
	aluop_o=110;
else
	aluop_o=3'bxxx;
end
endcase
end
endmodule;

