module immediate_gen
(
    input logic [31:0] instruction_i,
    output logic [31:0] itypeimm_o,
    output logic [31:0] utypeimm_o,
    output logic [31:0] stypeimm_o,
    output logic [31:0] sbtypeimm_o,
    output logic [31:0] ujtypeimm_o
);
always_comb
begin
	utypeimm_o = {instruction_i[31:12] ,12'b0 };
		begin
			if(instruction_i[31]==1)
				itypeimm_o = {20'hFFFFF, instruction_i[31:20]};
			else 
				itypeimm_o = {20'd0, instruction_i[31:20]};
		end
		begin
			if(instruction_i[31]==1)
				stypeimm_o = {20'hFFFFF,instruction_i[31:25],instruction_i[11:7]};
			else 
				stypeimm_o = {20'd0,instruction_i[31:25],instruction_i[11:7]};
		end
		begin
			if(instruction_i[31]==1)
				sbtypeimm_o = {19'h7FFFF,instruction_i[31],instruction_i[7],instruction_i[30:25],instruction_i[11:8],1'b0};
			else 
				sbtypeimm_o = {19'd0,instruction_i[31],instruction_i[7],instruction_i[30:25],instruction_i[11:8],1'b0};
		end
		begin
			if(instruction_i[31]==1)
				ujtypeimm_o = {11'h7FF ,instruction_i[31],instruction_i[19:12],instruction_i[20],instruction_i[30:21],1'b0};
			else 
				ujtypeimm_o = {11'd0,instruction_i[31],instruction_i[19:12],instruction_i[20],instruction_i[30:21],1'b0};
		end
end
endmodule
