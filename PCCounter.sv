`timescale 1ns/1ps
module PCCounter(input clk_i,enable_i,output logic PC_o);
always@(posedge clk_i)
begin
if(enable_i == 0)
PC_o <= PC_o + 4;
else 
PC_o <= 0;
end
endmodule   