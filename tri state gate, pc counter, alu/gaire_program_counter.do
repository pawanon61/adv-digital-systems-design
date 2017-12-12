onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {top level signals}
add wave -noupdate /tb_gaire_program_counter/CLK
add wave -noupdate /tb_gaire_program_counter/reset
add wave -noupdate /tb_gaire_program_counter/EN
add wave -noupdate /tb_gaire_program_counter/OP_A
add wave -noupdate /tb_gaire_program_counter/OP_Q
add wave -noupdate /tb_gaire_program_counter/OP_Z
add wave -noupdate -divider {comparing output with expected output}
add wave -noupdate /tb_gaire_program_counter/OP_Q
add wave -noupdate /tb_gaire_program_counter/Exp_OP_Q
add wave -noupdate /tb_gaire_program_counter/Test_OP_Q
add wave -noupdate /tb_gaire_program_counter/OP_Z
add wave -noupdate /tb_gaire_program_counter/Exp_OP_Z
add wave -noupdate /tb_gaire_program_counter/Test_OP_Z
add wave -noupdate -divider {internal signals}
add wave -noupdate /tb_gaire_program_counter/LineNumber
add wave -noupdate /tb_gaire_program_counter/U0/CLK
add wave -noupdate /tb_gaire_program_counter/Instgaire_program_counter/clk
add wave -noupdate /tb_gaire_program_counter/Instgaire_program_counter/reset
add wave -noupdate /tb_gaire_program_counter/Instgaire_program_counter/EN
add wave -noupdate /tb_gaire_program_counter/Instgaire_program_counter/OP_A
add wave -noupdate /tb_gaire_program_counter/Instgaire_program_counter/OP_Q
add wave -noupdate /tb_gaire_program_counter/Instgaire_program_counter/OP_Z
add wave -noupdate /tb_gaire_program_counter/Instgaire_program_counter/your_sig
add wave -noupdate /tb_gaire_program_counter/Instgaire_program_counter/my_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 330
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
WaveRestoreZoom {0 ns} {641 ns}
