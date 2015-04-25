module ALUControl(ALUOp, funct, ALUOperation);
input [1:0]ALUOp;
input [5:0]funct;
output [2:0]ALUOperation;
wire a,b;

or (ALUOperation[2], b, ALUOp[0]);

nand (ALUOperation[1], funct[2], ALUOp[1]);
and (b, funct[1], ALUOp[1]);

or(a,funct[0],funct[3]);
and(ALUOperation[0], a, ALUOp[1]);

endmodule
