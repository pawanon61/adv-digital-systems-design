onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {top level signals}
add wave -noupdate /tb_gaire_alu/CLK
add wave -noupdate /tb_gaire_alu/OP_A
add wave -noupdate /tb_gaire_alu/OP_B
add wave -noupdate /tb_gaire_alu/sel
add wave -noupdate /tb_gaire_alu/OP_Q
add wave -noupdate -divider {comparing output with expected output}
add wave -noupdate /tb_gaire_alu/OP_Q
add wave -noupdate /tb_gaire_alu/Exp_OP_Q
add wave -noupdate /tb_gaire_alu/Test_OP_Q
add wave -noupdate /tb_gaire_alu/LineNumber
add wave -noupdate -divider {internal signals}
add wave -noupdate /tb_gaire_alu/U0/CLK
add wave -noupdate /tb_gaire_alu/Instgaire_ALU/OP_A
add wave -noupdate /tb_gaire_alu/Instgaire_ALU/OP_B
add wave -noupdate /tb_gaire_alu/Instgaire_ALU/sel
add wave -noupdate /tb_gaire_alu/Instgaire_ALU/OP_Q
add wave -noupdate /tb_gaire_alu/Instgaire_ALU/my_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 232
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {837 ns}
