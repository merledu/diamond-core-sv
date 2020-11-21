module alu_control
(
    input logic [2:0] funct3_i,
    input logic funct7_i,
    input logic [2:0] aluop_i,
    output logic [4:0] alucontrol_o
);
 
always_comb 
begin   
     alucontrol_o = (aluop_i == 3'b011)? 5'b11111 :      //for JAL and JALR
                      
              (aluop_i == 3'b010)? {2'b10,funct3_i} : //for branches
               
              //for R Type
              ({aluop_i, funct7_i} == {3'b000, 1'b0})?{2'b00,funct3_i} : //if f7==0
              ({aluop_i, funct7_i} == {3'b000, 1'b1})? {2'b01,funct3_i} : //if f7==1
                                         
              //for I Type 
              ({aluop_i , funct3_i , funct7_i } == {3'b001, 3'b101, 1'b0})?{2'b00,funct3_i} : 
              ({aluop_i , funct3_i , funct7_i } == {3'b001, 3'b101, 1'b1})?{2'b01,funct3_i} : 
              ({aluop_i , funct3_i } == {3'b001, 3'b101})?{2'b00,funct3_i} : 
              (aluop_i == 3'b001)?{2'b00,funct3_i} : 

              // else 
              5'b00_000;     
 end
endmodule
