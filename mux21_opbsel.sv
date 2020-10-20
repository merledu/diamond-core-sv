module mux21_opbsel(
	input logic [31:0] in1_i,in2_i,
	input logic sel_i,
	output logic [31:0] out_o	
);
always_comb begin
	if(sel_i == 0) begin
		out_o = in1_i;
	end
	else begin
		out_o = in2_i;
	end
end
endmodule 