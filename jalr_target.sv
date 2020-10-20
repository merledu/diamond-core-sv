`timescale 1ns/1ps
module jalr_target(input logic [31:0] A_i,
	input logic [31:0] imm_i,output logic [31:0] jalrt_o);
always @(A_i,imm_i)
begin 
jalrt_o= ((A_i+imm_i) & 32'hfffffffe);
end 
endmodule 