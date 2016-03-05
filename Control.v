module Control(Op, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, Jump);
	input [5:0]Op;
	output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump;
	output [1:0] ALUOp;
	wire a, b, c;

	/*nor(RegDst, Op[5], Op[4], Op[3], Op[2], Op[1], Op[0]);
	and(a, Op[5], ~Op[4], ~Op[3], ~Op[2], Op[1], Op[0]);
	and (b, Op[5], ~Op[4], Op[3], ~Op[2], Op[1], Op[0]);
	or(ALUSrc, a, b);
	nor(c, Op[5], Op[4], Op[3], Op[2], Op[1], Op[0]);
	or(RegWrite, a, c);
	and(MemtoReg, Op[5], ~Op[4], ~Op[3], ~Op[2], Op[1], Op[0]);
	and (MemWrite, Op[5], ~Op[4], Op[3], ~Op[2], Op[1], Op[0]);
	and(MemRead, Op[5], ~Op[4], ~Op[3], ~Op[2], Op[1], Op[0]);
	nor(ALUOp[1], Op[5], Op[4], Op[3], Op[2], Op[1], Op[0]);
	and(Branch, ~Op[5], ~Op[4], ~Op[3], Op[2], ~Op[1], ~Op[0]);
	and(ALUOp[0], ~Op[5], ~Op[4], ~Op[3], Op[2], ~Op[1], ~Op[0]);*/

	
	assign RegDst = (~Op[5] && ~Op[4] && ~Op[3] && ~Op[2] && ~Op[1] && ~Op[0]);
	assign ALUSrc = (~Op[5] && ~Op[4] && Op[3]  && ~Op[2] && ~Op[1] && ~Op[0]) || (Op[5] && ~Op[4] && ~Op[3]  && ~Op[2] && Op[1] && Op[0]) || (Op[5] && ~Op[4] && Op[3]  && ~Op[2] && Op[1] && Op[0]);
	assign MemtoReg = (Op[5] && ~Op[4] && ~Op[3]  && ~Op[2] && Op[1] && Op[0]);
	assign RegWrite = (~Op[5] && ~Op[4] && ~Op[3] && ~Op[2] && ~Op[1] && ~Op[0]) || (~Op[5] && ~Op[4] && Op[3]  && ~Op[2] && ~Op[1] && ~Op[0]) || (Op[5] && ~Op[4] && ~Op[3]  && ~Op[2] && Op[1] && Op[0]);
	assign MemRead = (Op[5] && ~Op[4] && ~Op[3]  && ~Op[2] && Op[1] && Op[0]);
	assign MemWrite = (Op[5] && ~Op[4] && Op[3]  && ~Op[2] && Op[1] && Op[0]);
	assign Branch =  (~Op[5] && ~Op[4] && ~Op[3] && Op[2] && ~Op[1] && ~Op[0]);
	assign Jump = (~Op[5] && ~Op[4] && ~Op[3] && ~Op[2] && Op[1] && ~Op[0]);
	assign ALUOp[1] = (~Op[5] && ~Op[4] && ~Op[3] && ~Op[2] && ~Op[1] && ~Op[0]);
	assign ALUOp[0] = (~Op[5] && ~Op[4] && ~Op[3] && Op[2] && ~Op[1] && ~Op[0]);
	
	
endmodule
