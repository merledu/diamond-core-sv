`timescale 1ns/1ns
module aluop(input logic rtype_i,itype_i,load_i,store_i,branch_i,
jalr_i,jal_i,lui_i,
output logic [2:0] aluop_o);
always_comb
begin
if(rtype_i == 1)
	aluop_o=000;
else if(load_i == 1)
	aluop_o=100;
else if(store_i == 1)
	aluop_o=101;
else if(branch_i == 1)
	aluop_o=010;
else if(itype_i == 1)
	aluop_o=001;
else if(jalr_i == 1) 
	aluop_o=011;
else if(jal_i==1)
	aluop_o=011;
else if(lui_i == 1)
	aluop_o=110;
else
	aluop_o=3'b111;
end
endmodule
