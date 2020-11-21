module instr_mem(
	input logic clk,
	input logic ren,
	input logic wen,
	input logic [13:0] addr,
	input logic [31:0] data_i,
	output logic [31:0] data_o
);

localparam MEM_DEPTH = 2**14;

logic [31:0] mem[0:MEM_DEPTH-1];
initial begin
       $readmemh("C:/Users/ushna naseer/Desktop/hex_file.mem",mem);
       //mem[0] = 32'h01100F13;
     end    
always @(posedge clk) begin 
	if(wen) begin
		mem[addr] <= data_i;	
	end
end
always @(*) begin
		data_o = mem[addr];	
	end
endmodule
