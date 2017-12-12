onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {top level signals}
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/CLK
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/reset
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/OP_A
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/OP_Q
add wave -noupdate -divider {comparing output with expected output}
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/OP_Q
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/Exp_OP_Q
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/Test_OP_Q
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/LineNumber
add wave -noupdate -divider {internal signals}
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/U0/CLK
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/Instgaire_9_to_16_bit_sign_extender/clk
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/Instgaire_9_to_16_bit_sign_extender/reset
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/Instgaire_9_to_16_bit_sign_extender/OP_A
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/Instgaire_9_to_16_bit_sign_extender/OP_Q
add wave -noupdate /tb_gaire_9_to_16_bit_sign_extender/Instgaire_9_to_16_bit_sign_extender/my_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 294
configure wave -valuecolwidth 56
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
WaveRestoreZoom {0 ns} {801 ns}
