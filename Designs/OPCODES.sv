package typedecode ;
typedef enum logic [6:0] {
rtype = 7'b0110011,
itype=7'b0010011,
branch=7'b1100011,
load=7'b0000011,
store=7'b0100011,
jal=7'b1101111,
jalr=7'b1100111,
lui=7'b0110111 } opcodes_i;
endpackage
