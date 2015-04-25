module MipsUm(clk, reset);
input clk, reset;
wire [31:0] Instruction, WriteData, Data1, Data2, ResultALU, ReadData;
wire [31:0] SaidaExtensor, mux3, mux4, SaidaShift, SaidaAdder;
wire [3:0] mux1, mux2;
wire [3:0] ALUOperation;
wire RegWrite,  ALUSrc, zero, MemRead, MemWrite, MemToReg;
wire seletorMux1, cout1;
wire [4:0] pcin, pcout, SaidaPC, EntradaPC;
MemoriaDeInstrucoes a(clk, reset, Instruction, SaidaPC, EntradaPC);
mux4bits b(Instruction[15:11], Instruction[20:16], seletorMux1, mux1);
BancodeRegistradores c(Instruction[25:21], Instruction[20:16], mux1, mux4, RegWrite, Data1, Data2, clk);
extensor16para32 d(Instruction[15:0], SaidaExtensor);
assign SaidaShift = SaidaExtensor << 2;
somador32bits(SaidaShift, SaidaPC, 1'b0, cout1, SaidaAdder);
mux32bits(SaidaAdder, SaidaPC, PCSrc, EntradaPC);
mux4bits e(Data2, SaidaExtensor, ALUSrc, mux3);
ALU f(Data1, mux3, ALUOperation, zero, ResultALU, clk);
MemoriaDeDados g(clk, ResultALU, Data2, ReadData, MemRead, MemWrite);
mux32bits h(ReadData, ResultALU, MemToReg, mux4);
endmodule



