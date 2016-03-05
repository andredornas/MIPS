onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS/clk
add wave -noupdate /MIPS/reset
add wave -noupdate /MIPS/Instruction
add wave -noupdate /MIPS/WriteData
add wave -noupdate /MIPS/Data1
add wave -noupdate /MIPS/Data2
add wave -noupdate /MIPS/ResultALU
add wave -noupdate /MIPS/SaidaExtensor
add wave -noupdate /MIPS/mux3
add wave -noupdate /MIPS/SaidaShift
add wave -noupdate /MIPS/EnderecoJump
add wave -noupdate /MIPS/SaidaShiftJump
add wave -noupdate /MIPS/mux1
add wave -noupdate /MIPS/ALUOperation
add wave -noupdate /MIPS/ALUOp
add wave -noupdate /MIPS/RegWrite
add wave -noupdate /MIPS/ALUSrc
add wave -noupdate /MIPS/zero
add wave -noupdate /MIPS/MemRead
add wave -noupdate /MIPS/MemWrite
add wave -noupdate /MIPS/MemToReg
add wave -noupdate /MIPS/RegDst
add wave -noupdate /MIPS/Branch
add wave -noupdate /MIPS/PCSrc
add wave -noupdate /MIPS/Jump
add wave -noupdate /MIPS/cout1
add wave -noupdate /MIPS/SaidaPC
add wave -noupdate /MIPS/EntradaPC
add wave -noupdate /MIPS/SaidaAdder
add wave -noupdate /MIPS/EntreMux
add wave -noupdate /MIPS/ReadData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {3229 ps} {4229 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 500ps -dutycycle 50 -starttime 0ps -endtime 5000ps sim:/MIPS/clk 
wave create -driver freeze -pattern clock -initialvalue 1 -period 4000ps -dutycycle 50 -starttime 0ps -endtime 5000ps sim:/MIPS/reset 
WaveCollapseAll -1
wave clipboard restore
