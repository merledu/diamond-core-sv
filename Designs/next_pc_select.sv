`timescale 1ns/1ps
module next_pc_select(input logic b_i,j_i,jr_i, output logic [1:0] npc_o);
always @(*)
begin
if(b_i==0 && j_i==0 && jr_i==1) 		
	npc_o=11;
else if(b_i==0 && j_i==1 && jr_i==0)	
	npc_o=10;
else if(b_i==1 && j_i==0 && jr_i==0)	
	npc_o=01;
else
	npc_o=00;
end
endmodule
