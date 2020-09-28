module operand_A_select(input logic lui_i,jalr_i,jal_i,output logic [1:0] opasel_o);
always_comb
begin
if(lui_i == 1 && jalr_i == 0 && jal_i == 0) 		//LUI
	opasel_o = 2'b11;
else if(lui_i == 0 && jalr_i == 0 && jal_i == 1)	//JAL
	opasel_o = 2'b10;
else if(lui_i == 0 && jalr_i == 1 && jal_i == 0)	//JALR
	opasel_o = 2'b10;
else
	opasel_o = 2'b00;
end 
endmodule