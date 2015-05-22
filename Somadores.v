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
