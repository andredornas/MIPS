 module MIPS(clk, reset);
input clk, reset;
wire [31:0] Instruction, WriteData, Data1, Data2, ResultALU, ReadData;
wire [31:0] SaidaExtensor, mux3, SaidaShift;
wire [4:0] mux1;
wire [2:0] ALUOperation;
wire [1:0] ALUOp;
wire RegWrite,  ALUSrc, zero, MemRead, MemWrite, MemToReg, RegDst, Branch, PCSrc;
wire cout1;
wire [4:0] SaidaPC, EntradaPC, SaidaAdder;


MemoriaDeInstrucoes a(clk, reset, Instruction, SaidaPC, EntradaPC);

Control p(Instruction[31:26], RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);

and po(PCSrc, zero, Branch); 

ALUControl pi(ALUOp, Instruction[5:0], ALUOperation);

mux5bits b(Instruction[15:11], Instruction[20:16], RegDst, mux1);

BancodeRegistradores c(Instruction[25:21], Instruction[20:16], mux1, WriteData, RegWrite, Data1, Data2, clk);

extensor16para32 d(Instruction[15:0], SaidaExtensor);

assign SaidaShift = SaidaExtensor << 2;

somador5bits pe(SaidaShift[31:27], SaidaPC, 1'b0, cout1, SaidaAdder);

mux5bits pa(SaidaAdder, SaidaPC, PCSrc, EntradaPC);

mux32bits e(SaidaExtensor, Data2, ALUSrc, mux3);

ALU f(Data1, mux3, ALUOperation, zero, ResultALU, clk);

MemoriaDeDados g(clk, ResultALU, Data2, ReadData, MemRead, MemWrite);

mux32bits h(ReadData, ResultALU, MemToReg, WriteData);

endmodule
