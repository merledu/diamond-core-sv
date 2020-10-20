module mux41_jalr(
	input logic [31:0] i1,i2,i3,i4,
	input logic [1:0] nextpcsel,
	output logic [31:0] out_o
);
always_comb
	begin
		if(nextpcsel == 2'b00) begin
			out_o = i1;
		end
		else if(nextpcsel == 2'b01) begin
			out_o = i2;		
		end
		else if(nextpcsel == 2'b10) begin
			out_o = i3;
		end
		else if(nextpcsel == 2'b11) begin
			out_o = i4;
		end		
		else begin
			out_o <= 32'b0;
		end
	end
endmodule 