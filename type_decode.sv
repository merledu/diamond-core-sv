`timescale 1ns/1ps
module type_decode (input logic [6:0] opcode_i, output logic r_type_o,i_type_o,
store_o,branch_o, load_o,jalr_o, jal_o, lui_o);
always_comb
begin
case(opcode_i)
7'b0110011 : r_type_o=1;
7'b0000011 : load_o=1;
7'b0100011 : store_o=1;
7'b1100011 : branch_o=1;
7'b0010011 : i_type_o=1;
7'b1100111 : jalr_o=1;
7'b1101111 : jal_o=1;
7'b0110111 : lui_o=1;
endcase
end
endmodule
