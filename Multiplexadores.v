module mux4bits (a,b,s,x);
parameter SIZE=4;
input [SIZE-1:0]a,b;
input s;
output [SIZE-1:0]x;
genvar i;
generate
	for(i=0; i < SIZE; i= i + 1)
	begin:instanc
		mux m(a[i], b[i], s, x[i]);
	end
endgenerate
endmodule


module mux(a, b, s, x);
input a, b, s;
output x;
assign x = s&a || ~s&b;
endmodule


module mux32bits (a,b,s,x);
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
mux32bits uv(or1, and1, operation[0], o);
mux32bits wx(slt, adder1, operation[0], p);
mux32bits a1(p, o, operation[1], x);
endmodule

