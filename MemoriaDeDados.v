module MemoriaDeDados(clk, Address, WriteData, ReadData, MemRead, MemWrite);
parameter SIZE=32;
input [4:0] Address;
input [SIZE-1:0] WriteData;
input clk, MemRead, MemWrite;
output reg [SIZE-1:0] ReadData;
reg [7:0] mem [SIZE-1:0];

integer i;
initial begin
	for(i = 0; i < SIZE; i=i+1) begin
		mem[i] = 8'b11;
	end
end

always@(posedge clk) begin
	if(MemRead)begin
		ReadData[7:0]   = mem[Address];
		ReadData[15:8]  = mem[Address + 1'd1];
		ReadData[23:16] = mem[Address + 1'd2];
		ReadData[31:24] = mem[Address + 1'd3];
	end
	if(MemWrite)begin
		mem[Address]        = WriteData[7:0];
		mem[Address + 1'd1] = WriteData[15:8];
		mem[Address + 1'd2] = WriteData[23:16];
		mem[Address + 1'd3] = WriteData[31:24];
	end
end

endmodule	