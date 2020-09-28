`timescale 1ns/1ps
module ALU( input logic[31:0] A_i,B_i,input logic[4:0] C_i,input logic [4:0]shamt_i,
output logic[31:0] D_o, output logic branch_o, output logic [1:0] branch2_o);
assign shamt_i = B_i[4:0];
assign branch2_o = C_i [4:3];
always_comb
begin
case(C_i)
5'b00000 : D_o=A_i + B_i;
5'b00001 : D_o=A_i << shamt_i;
5'b00010 : D_o={31'b0,A_i < B_i} ;
5'b00011 : D_o={31'b0,A_i < B_i} ;
5'b10110 : D_o={31'b0,A_i < B_i};
5'b00100 :  D_o=A_i ^ B_i;
5'b00101 : D_o=A_i >> shamt_i;
5'b00110 : D_o=A_i | B_i;
5'b00111 : D_o=A_i & B_i;
5'b01000 : D_o=A_i - B_i;
5'b01101 : D_o=A_i >> shamt_i;
5'b10000 : D_o=A_i == B_i;
5'b10001 : D_o={31'b0,A_i !== B_i};
5'b10100 : D_o={31'b0,A_i < B_i} ;
5'b10101 : D_o={31'b0,A_i >= B_i};
5'b10111  : D_o={31'b0,A_i >= B_i};
5'b11111 :  D_o=+A_i;
endcase
assign branch_o = ((branch2_o == 2'b10) && (D_o==1))? 1'b1: 1'b0; 
end
endmodule 