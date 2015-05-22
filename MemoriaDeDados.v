module MemoriaDeDados(clk, Address, WriteData, ReadData, MemRead, MemWrite);
parameter SIZE=32;
input [SIZE-1:0] Address;
input [SIZE-1:0] WriteData;
input clk, MemRead, MemWrite;
output reg [SIZE-1:0] ReadData;
reg [7:0] mem [SIZE-1:0];
wire [4:0] add;

assign add[0] = Address[0];
assign add[1] = Address[1];
assign add[2] = Address[2];
assign add[3] = Address[3];
assign add[4] = Address[4];

integer i;
initial begin
	for(i = 0; i < SIZE; i=i+1) begin
		mem[i] = 8'd1;
	end
end
always@(posedge clk) begin
	if(MemRead)begin
		ReadData[7:0]   = mem[add];
		ReadData[15:8]  = mem[add + 5'd1];
		ReadData[23:16] = mem[add + 5'd2];
		ReadData[31:24] = mem[add + 5'd3];
	end
	if(MemWrite)begin
		mem[add]        = WriteData[7:0];
		mem[add + 5'd1] = WriteData[15:8];
		mem[add + 5'd2] = WriteData[23:16];
		mem[add + 5'd3] = WriteData[31:24];
	end
end
endmodule	
