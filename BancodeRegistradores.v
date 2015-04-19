module BancodeRegistradores (Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock);

parameter SIZE=32;
input [4:0] Read1,Read2,WriteReg;
input [SIZE-1:0] WriteData;
input RegWrite, clock;
output reg[SIZE-1:0] Data1, Data2;

reg [SIZE-1:0] registradores [SIZE-1:0];
integer j;

initial begin
for (j=0; j<SIZE; j=j+1)
	registradores[j] = 32'b0;
end

//read
always@(Read1 or Read2)
begin
	Data1 <= registradores[Read1];
	Data2 <= registradores[Read2];
end


always@(posedge clock)
begin
	if(RegWrite)
		begin
			registradores[WriteReg] <= WriteData;
		end
end


endmodule
