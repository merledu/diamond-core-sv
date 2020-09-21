`timescale 1ns/1ns
module alucontrol(input logic [2:0] aluop_i,f3_i, input logic f7_i, output logic [4:0] out_o);
always_comb
begin
case(aluop_i,f3_i,f7_i)
begin
if (aluop_i == 101 || aluop_i==100 || aluop_i==110)  //load store lui
	begin
		if(f3==3'bxxx && f7= x)
		out_o= 5'b00000;
		else
		out_o= 5'b00000;
	end
elseif (aluop_i==011)  //jal jalr
	begin
		if(f3==3'bxxx && f7= x)
		out_o= 5'b11111;
		else
		out_o= 5'b11111;
	end
elseif (aluop_i==000 || aluop_i== 001) //r-type i-type
	begin
		if(f3==3'b000 && f7= 0)   //add addi
		out_o= 5'b00000;
		elseif(f3==3'b000 && f7= 1)   //sub
		out_o= 5'b01000;
		elseif(f3==3'b001 && f7= x)   //sll slli
		out_o= 5'b00001;
		elseif(f3==3'b010 && f7= x)   //slt slti
		out_o= 5'b00010;
		elseif(f3==3'b011 && f7= x)  //sltu sltiu
		out_O= 5'b00011;
		elseif(f3==3'b100 && f7= x)  //xor xori
		out_O= 5'b00100;
     		elseif(f3==3'b101 && f7= 0)   //srl srli
		out_O= 5'b00101;
		elseif(f3==3'b101 && f7= 1)   //sra srai
		out_O= 5'b01101;
		elseif(f3==3'b110 && f7= x)   //or ori
		out_O= 5'b00110;
		elseif(f3==3'b111 && f7= x)   //and andi
		out_O= 5'b00111;
		else
		out_o= 5'bxxxxx;
	end