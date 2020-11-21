module data_mem (
	input logic clk_i , reset_i , read_i, write_i ,
	input logic [31:0] aluoutput_i , opB_i , 
	input logic [9:0] addr_i ,
	output logic [31:0] writedata_o ,
	output logic [31:0] data_o 
	);
	logic [31:0] datamem [0:1023]; 
always_comb 
begin
if ( reset_i == 1'b0) 
	begin 
	if (read_i == 1'b1) 
	writedata_o = datamem[addr_i] ; 
	else
	writedata_o = aluoutput_i ;
	end
end
always@(posedge clk_i ) 
begin
if (write_i == 1'b1) 
datamem[addr_i] <= opB_i ;
end
always_comb
data_o = datamem[addr_i];
endmodule 
