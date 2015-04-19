module MemoriaDeInstrucoes(clk, reset, Instruction);
parameter SIZE=32;
output[SIZE-1:0] Instruction;
input clk, reset;
wire [4:0] pcin, pcout;


countPC oi(pcin, reset, clk, pcout);
somador5bits p(pcout, 5'b00100, 1'b0, cout, pcin);
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
	for(i=0;i<SIZE;i=i+1) begin
		mem[i]=8'b0 + i;
	end
end

always@(ReadAddress) begin
	Instruction[7:0]   = mem[ReadAddress];
	Instruction[15:8]  = mem[ReadAddress + 1'd1];
	Instruction[23:16] = mem[ReadAddress + 1'd2];
	Instruction[31:24] = mem[ReadAddress + 1'd3];
end

endmodule


module countPC (pcin, reset, clk, pcout);
input [4:0] pcin;
input reset, clk;
output reg [4:0] pcout;

always@(posedge clk) begin
	pcout <= pcin;
	if(reset) begin
		pcout <= 5'b0;
	end
end

endmodule


module full_adder(a, b, cin, cout, s);
input a, b, cin;
output cout, s;

assign s = a ^ b ^cin;
assign cout = a&b || a&cin || b&cin;

endmodule

module somador5bits(a,b,cin,cout,s);
parameter SIZE=5;
input [SIZE-1:0] a, b;
input cin;
output [SIZE-1:0] s;
output cout;
wire [SIZE:0] c;

assign c[0] = cin;
assign cout = c[SIZE];
genvar i;

generate
	for(i=0; i < SIZE; i= i + 1)
	begin:add
		full_adder p(a[i], b[i], c[i], c[i+1], s[i]);
	end
endgenerate

endmodule
