module next_pc_select(input logic b_i,j_i,jr_i, output logic (1:0) npc_o);
always @(b_i,j_i,jr_i)
begin
if(b=0 && j=0 && jr=1) 		#JALR
	npc_o=11;
else if(b=0 && j=1 && jr=0)	#JAL
	npc_o=10;
else if(b=1 && j=0 && jr=0)	#BRANCH
	npc_o=01;
else
	npc_o=00;
end
endmodule