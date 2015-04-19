 module ALU(a, b, operation, zero, result, clk);
input [31:0]a; 
input [31:0]b;
input [2:0]operation;
input clk;
output reg zero;
output reg [31:0] result; 
wire cin;
wire overflow;
wire cout = 1'b0;
wire [31:0]bout;
wire [31:0] and1, or1, add1, slt1;
wire [31:0] resultAux;

assign cin = operation[2];

mux3bits ck(~b, b, operation[2], bout);
genvar i;
generate
	for(i=0; i < 32; i= i + 1)
	begin:ande
		and(and1[i],a[i], b[i]);
	end
endgenerate
generate
	for(i=0; i < 32; i= i + 1)
	begin:ore
		or(or1[i],a[i], b[i]);
	end
endgenerate
somador32bits somaOuSub(a, bout, cin, cout, add1);
slt comparar(a, b, slt1);
d_overflow dt(a, b, add1, overflow);

mux3bits4entradas p(and1, or1, add1, slt1, operation, resultAux);
always@(posedge clk) begin
	result = resultAux;
	zero = ~result[0] & ~result[1] & ~result[2] & ~result[3] & ~result[4] & ~result[5] & ~result[6] & ~result[7] & ~result[8] & 
				  ~result[9] & ~result[10] & ~result[11] & ~result[12] & ~result[13] & ~result[14] & ~result[15] & ~result[16] & 
				  ~result[17] & ~result[18] & ~result[19] & ~result[20] & ~result[21] & ~result[22] & ~result[23] & ~result[24] & 
				  ~result[25] & ~result[26] & ~result[27] & ~result[28] & ~result[29] & ~result[30] & ~result[31];
end  

endmodule

module mux(a, b, s, x);
input a, b, s;
output x;

assign x = s&a || ~s&b;

endmodule

module mux3bits (a,b,s,x);
parameter SIZE=32;
input [31:0]a,b;
input s;
output [31:0]x;

genvar i;
generate
	for(i=0; i < SIZE; i= i + 1)
	begin:instanc
		mux m(a[i], b[i], s, x[i]);
	end
endgenerate

endmodule

module mux3bits4entradas(and1, or1, adder1, slt, operation, x);
input [31:0] and1, or1, adder1, slt; 
input [2:0]operation;
output [31:0]x;
wire [31:0] o,p;

mux3bits uv(or1, and1, operation[0], o);
mux3bits wx(slt, adder1, operation[0], p);
mux3bits a1(p, o, operation[1], x);

endmodule

module full_adder(a, b, cin, cout, s);
input a, b, cin;
output cout, s;

assign s = a ^ b ^cin;
assign cout = a&b || a&cin || b&cin;

endmodule

module somador32bits(a,b,cin,cout,s);
parameter SIZE=32;
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

module slt (a, b, x);
input [31:0]a,b;
output [31:0]x;
wire [31:0] c, d;
wire cout = 1'b0;
assign c = ~b;

somador32bits comparador(a, c, 1'b1, cout, d);

assign x = {31'b0, d[31]};

endmodule

module d_overflow (A,B,S,X);/*logica que detecta overflow*/
input A,B,S;
output X;
assign X = ((~A&~B&S) | (A&B&~S));

endmodule
