module MIPS(clk, reset);
input clk, reset;
wire [31:0] Instruction, WriteData, Data1, Data2, ResultALU, ReadData;
wire [31:0] SaidaExtensor, mux3, SaidaShift, EnderecoJump;
wire [25:0] SaidaShiftJump;
wire [4:0] mux1;
wire [2:0] ALUOperation;
wire [1:0] ALUOp;
wire RegWrite,  ALUSrc, zero, MemRead, MemWrite, MemToReg, RegDst, Branch, PCSrc, Jump;
wire cout1;
wire [4:0] SaidaPC, EntradaPC, SaidaAdder, EntreMux;


MemoriaDeInstrucoes a(clk, reset, Instruction, SaidaPC, EntradaPC);

Control p(Instruction[31:26], RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, Jump);

and po(PCSrc, zero, Branch); 

ALUControl pi(ALUOp, Instruction[5:0], ALUOperation);

mux5bits b(Instruction[15:11], Instruction[20:16], RegDst, mux1);

BancodeRegistradores c(Instruction[25:21], Instruction[20:16], mux1, WriteData, RegWrite, Data1, Data2, clk);

extensor16para32 d(Instruction[15:0], SaidaExtensor);

assign SaidaShift = SaidaExtensor << 2;

assign SaidaShiftJump = Instruction[25:0] << 2; 

assign EnderecoJump = {SaidaPC, SaidaShiftJump};

somador5bits pe(SaidaShift[4:0], SaidaPC, 1'b0, cout1, SaidaAdder);

mux5bits pa(SaidaAdder, SaidaPC, PCSrc, EntreMux);

mux5bits asd(EnderecoJump[4:0], EntreMux, Jump, EntradaPC);

mux32bits e(SaidaExtensor, Data2, ALUSrc, mux3);

ALU f(Data1, mux3, ALUOperation, zero, ResultALU, clk);

MemoriaDeDados g(clk, ResultALU, Data2, ReadData, MemRead, MemWrite);

mux32bits h(ReadData, ResultALU, MemToReg, WriteData);

endmodule


//assign x = {31'b0, d[31]};