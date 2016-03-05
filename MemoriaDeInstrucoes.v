module MemoriaDeInstrucoes(clk, reset, Instruction, SaidaPC, EntradaPC);
parameter SIZE=32;
output[SIZE-1:0] Instruction;
input clk, reset;
output [4:0] SaidaPC;
input [4:0] EntradaPC; 
wire [4:0] pcin, pcout;

countPC oi(EntradaPC, reset, clk, pcout);
somador5bits p(pcout, 5'b00100, 1'b0, cout, SaidaPC);
instrucao memi(pcout, Instruction);

endmodule


module instrucao(ReadAddress, Instruction);
parameter SIZE=32;
input [4:0] ReadAddress;
output reg [SIZE-1:0] Instruction;
reg [7:0] mem [SIZE-1:0];
integer i;
initial
begin
	/*
	 beq 000100 01000 01001 0000000000000100	  beq $8, $9, 2
	   j 000010 00000000000000000000000100 	  j 1
	*/
	mem[0]  = 8'b00000010;
	mem[1]  = 8'b00000000;
	mem[2]  = 8'b00001001;
	mem[3]  = 8'b00010001;
	
	mem[4]  = 8'b00000010;
	mem[5]  = 8'b00000000;
	mem[6]  = 8'b00000000;
	mem[7]  = 8'b10000000;
	
	mem[8]  = 8'b00000001;
	mem[9]  = 8'b00000000;
	mem[10] = 8'b00000000;
	mem[11] = 8'b10000000;
	
	mem[12] = 8'b00000001;
	mem[13] = 8'b00000000;
	mem[14] = 8'b00000000;
	mem[15] = 8'b00001000;
	
	mem[16] = 8'b00000100;
	mem[17] = 8'b00000000;
	mem[18] = 8'b00000000;
	mem[19] = 8'b10000000;	
	
	mem[20] = 8'b00001000;
	mem[21] = 8'b00000000;
	mem[22] = 8'b00000000;
	mem[23] = 8'b10000000;
	
	mem[24] = 8'b00010000;
	mem[25] = 8'b00000000;
	mem[26] = 8'b00000000;
	mem[27] = 8'b10000000;
	
	mem[28] = 8'b00100000;
	mem[29] = 8'b00000000;
	mem[30] = 8'b00000000;
	mem[31] = 8'b10000000;
	
end
always@(ReadAddress) begin
	Instruction[7:0]   = mem[ReadAddress];
	Instruction[15:8]  = mem[ReadAddress + 5'd1];
	Instruction[23:16] = mem[ReadAddress + 5'd2];
	Instruction[31:24] = mem[ReadAddress + 5'd3];
end
endmodule


module countPC (pcin, reset, clk, pcout);
input [4:0] pcin;
input reset, clk;
output reg [4:0] pcout;
always@(posedge clk) begin
	pcout <= pcin;
	if(reset) begin 
		pcout <= 5'd0;
	end
end
endmodule

