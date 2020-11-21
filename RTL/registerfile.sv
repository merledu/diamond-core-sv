module register( 
	input logic  clk_i , reset_i , regwrite_i ,
	input logic [4:0] rd_i , rs1_i  , rs2_i , 
	input logic [31:0] wd_i,
	output logic [31:0] A_o , B_o
	);
	logic [31:0] registers [0:31] ; 
integer i;
initial begin 
for(i=0;i<32;i=i+1)
registers[i]=32'h0;
end
always @ (posedge clk_i ) begin
if (reset_i==1'b1) begin
for ( i=0 ; i<32 ; i=i+1)
registers[i] <= 32'b0; 
end
else begin
if(regwrite_i ==1'b1) begin
if(rd_i==5'b0)
registers[rd_i] <= 32'b0;
else
registers[rd_i] <= wd_i ; 
end
end
end
assign A_o = registers[rs1_i];
assign B_o= registers[rs2_i];
endmodule