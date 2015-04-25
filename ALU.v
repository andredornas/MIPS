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
mux32bits ck(~b, b, operation[2], bout);
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
