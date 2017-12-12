onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Top level signals}
add wave -noupdate /tb_gaire_1_bit_register/CLK
add wave -noupdate /tb_gaire_1_bit_register/reset
add wave -noupdate /tb_gaire_1_bit_register/EN
add wave -noupdate /tb_gaire_1_bit_register/OP_A
add wave -noupdate /tb_gaire_1_bit_register/OP_Q
add wave -noupdate -divider {comparing output with expected output}
add wave -noupdate /tb_gaire_1_bit_register/OP_Q
add wave -noupdate /tb_gaire_1_bit_register/Exp_OP_Q
add wave -noupdate /tb_gaire_1_bit_register/Test_OP_Q
add wave -noupdate /tb_gaire_1_bit_register/LineNumber
add wave -noupdate -divider {internal signals}
add wave -noupdate /tb_gaire_1_bit_register/U0/CLK
add wave -noupdate /tb_gaire_1_bit_register/Instgaire_1_bit_register/clk
add wave -noupdate /tb_gaire_1_bit_register/Instgaire_1_bit_register/reset
add wave -noupdate /tb_gaire_1_bit_register/Instgaire_1_bit_register/EN
add wave -noupdate /tb_gaire_1_bit_register/Instgaire_1_bit_register/OP_A
add wave -noupdate /tb_gaire_1_bit_register/Instgaire_1_bit_register/OP_Q
add wave -noupdate /tb_gaire_1_bit_register/Instgaire_1_bit_register/my_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 249
configure wave -valuecolwidth 52
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
WaveRestoreZoom {0 ns} {226 ns}
