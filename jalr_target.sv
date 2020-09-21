module jalr_target(input logic (31:0) A_i,B_i,output logic (31:0) jalrt_o);
always @(A_i,B_i)
begin 
jalt_o= ((A_i+B_i) & 32'hfffffffe);
end 
endmodule 