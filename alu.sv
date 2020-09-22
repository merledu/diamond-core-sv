`timescale 1ns/1ns
module ALU( input logic[31:0] A_i,B_i,input logic[4:0] C_i,
output logic[31:0] D_o, output logic branch_o);
logic [4:0]shamt_i;
assign shamt_i = B_i[4:0];
always_comb
begin
case(C_i) 
begin
if (C_i == 5'b00000)                        //ADD ADDI
 D_0 = A_i + B_i;
 branch_o=0;
else if (C_i == 5'b00001)                  //SLL SLLI
 D_o = A_i << shamt_i;
 branch_o=0;
else if(C_i == 5'b00010)       //signed    //SLT SLTI
begin
	if ({31'b0,A_i < B_i})
	D_o=1;
	else 
	D_o=0;
end	 
else if(C_i == 5'b00011 )       //unsigned  //SLTU SLTUI
begin
	if ({31'b0,A_i < B_i})
	D_o=1;
	else 
	D_o=0;
end	 
else if(C_i == 5'b10110)       //unsigned  //BLTU
begin
	if ({31'b0,A_i < B_i})
	D_o=1;
	branch_o=1;	
	else 
	D_o=0;
	branch_o=0;
end	 
else if(C_i == 5'b00100)                   //XOR XORI
 D_0 = A_i ^ B_i;
 branch_o=0;
else if(C_i == 5'b00101)                  //SRL SRLI
 D_o = A_i >> shamt_i;
 branch_o=0;
else if(C_i == 5'b00110)                 //OR ORI
 D_o = A_i | B_i;
 branch_o=0;
else if(C_i == 5'b00111)                 //AND ANDI 
 D_o = A_i & B_i;
 branch_o=0;
else if(C_i == 5'b01000)                 //SUB
 D_o = A_i - B_i;
 branch=0;
else if(C == 5'b01101)                 //SRA SRAI 
 D = A_i >> shamt_i;
 branch_o=0;
else if({31'b0,C_i == 5'b10000})                 //BEQ
	if (A_i == B_i)begin
	D_o=1;
	branch_o=1;
	end	
	else begin
	D_o=0;
	branch_o=0;
	end
else if(C_i == 5'b10001)                //BNE
begin
	if ({31'b0,A_i =! B_i})
	D_o=1;
	branch_o=1;	
	else 
	D_o=0;
	branch_o=0;
end
else if(C_i == 5'b10100)      //2's compliment   //BLT
begin
	if ({31'b0,A_i < B_i})
	D_o=1;
	branch_o=1;	
	else 
	D_o=0;
	branch_o=0;
end	 
else if(C_i == 5'b10101)      //signed          //BGE
begin
	if ({31'b0,A_i >= B_i})
	D_o=1;
	branch_o=1;
	else 
	D_o=0;
	branch_o=0;
end	
else if(C_i == 5'b10111)     //unsigned	     //BGEU
begin
	if ({31'b0,A_i >= B_i})
	D_o=1;
	branch_o=1;
	else 
	D_o=0;
	branch_o=0;
end	
else if(C_i == 5'b11111)              //JAL JALR
 D_o = A_i;
 branch_o=0;
else
 D_o= {Width{32'bxxxxx}};
end
endcase
end
endmodule