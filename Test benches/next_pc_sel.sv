`timescale 1ns/1ns
module next_pc_select_tb;
		logic b_i;
		logic j_i;
		logic jr_i;
		logic [1:0] npc_o;
	
	next_pc_select dut(
		.b_i(b_i),
		.j_i(j_i),
		.jr_i(jr_i),
		.npc_o(npc_o)
	);

	initial begin
		#5;
		b_i <= 0;
		j_i <= 0;
		jr_i <= 1;
		
		#5;
		b_i <= 0;
		j_i <= 1;
		jr_i <= 0;
		
		#5;
		b_i <= 1;
		j_i <= 0;
		jr_i <= 0;
	end
endmodule
