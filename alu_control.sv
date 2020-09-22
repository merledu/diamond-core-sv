`timescale 1ns/1ps
module aluc_ontrol(input logic [2:0] aluop_i,f3_i, input logic f7_i, output logic [4:0] out_o);
always_comb
begin
if (aluop_i == 101 || aluop_i==100 || aluop_i==110)  
	begin
		if(f3_i==3'b000 && f7_i== 0)
		out_o= 5'b00000;
		else
		out_o= 5'b00000;
	end
else if (aluop_i==011)  
	begin
		if(f3_i==3'b000 && f7_i== 0)
		out_o= 5'b11111;
		else
		out_o= 5'b11111;
	end
else if (aluop_i==000) 
	begin
		if(f3_i==3'b000 && f7_i== 0)   
		out_o= 5'b00000;
		else if(f3_i==3'b000 && f7_i== 1)   
		out_o= 5'b01000;
		else if(f3_i==3'b001 && f7_i== 0)   
		out_o= 5'b00001;
		else if(f3_i==3'b010 && f7_i== 0)   
		out_o= 5'b00010;
		else if(f3_i==3'b011 && f7_i== 0)  
		out_o = 5'b00011;
		else if(f3_i==3'b100 && f7_i== 0)  
		out_o = 5'b00100;
     		else if(f3_i==3'b101 && f7_i==0)   
		out_o = 5'b00101;
		else if(f3_i==3'b101 && f7_i==1)  
		out_o = 5'b01101;
		else if(f3_i==3'b110 && f7_i==0)  
		out_o = 5'b00110;
		else if(f3_i==3'b111 && f7_i==0)   
		out_o= 5'b00111;
		else
		out_o= 5'b1110;
	end
else if (aluop_i== 001)                
	begin
	if(f3_i==3'b000 )       
	out_o= 5'b00000;
	else if(f3_i==3'b001 )   
	out_o= 5'b00001;
	else if(f3_i==3'b010 )  
	out_o= 5'b00010;
	else if(f3_i==3'b011 )  
	out_o= 5'b00011;
	else if(f3_i==3'b100)  
	out_o = 5'b00100;
     	else if(f3_i==3'b101 )   
	out_o = 5'b00101;
	else if(f3_i==3'b101 )   
	out_o = 5'b01101;
	else if(f3_i==3'b110 )   
	out_o = 5'b00110;
	else if(f3_i==3'b111 )  
	out_o = 5'b00111;
	else
	out_o = 5'b11110;
	end
else if(aluop_i == 010)      
	begin
	if(f3_i == 000 )
	out_o= 5'b10000;
	else if(f3_i == 001 )
	out_o=5'b10001;
	else if(f3_i == 100 )
	out_o=5'b10100;
	else if(f3_i == 101)
	out_o=5'b10101;
	else if(f3_i == 110)
	out_o=5'b10110;
	else if(f3_i == 111 )
	out_o=5'b10111;
	else
	out_o=5'b11110;
	end
else 
	out_o=5'b11110;
end
endmodule
