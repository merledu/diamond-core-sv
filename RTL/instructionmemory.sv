module instr_mem(
	input logic clk_i , reset_i ,
	input logic [19:0] addr_i,
 	output logic [31:0] data_o 
 	);
 	logic [31:0] mem [0:1048576];
initial 
$readmemh("C:/Users/Wishah Naseer/Desktop/single cycle core/hex_file.mem",mem);
always_comb begin
if (reset_i == 1'b0)
data_o = mem[addr_i]; 
else 
data_o = 32'h0;
end
endmodule
