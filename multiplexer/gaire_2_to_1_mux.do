onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_gaire_2_to_1_multiplexer/CLK
add wave -noupdate -divider {Top level signals}
add wave -noupdate /tb_gaire_2_to_1_multiplexer/a_0
add wave -noupdate /tb_gaire_2_to_1_multiplexer/a_1
add wave -noupdate /tb_gaire_2_to_1_multiplexer/sel
add wave -noupdate /tb_gaire_2_to_1_multiplexer/y
add wave -noupdate -divider {Comparision of output and expected output}
add wave -noupdate /tb_gaire_2_to_1_multiplexer/y
add wave -noupdate /tb_gaire_2_to_1_multiplexer/Exp_y
add wave -noupdate /tb_gaire_2_to_1_multiplexer/Test_y
add wave -noupdate -divider <NULL>
add wave -noupdate /tb_gaire_2_to_1_multiplexer/LineNumber
add wave -noupdate /tb_gaire_2_to_1_multiplexer/U0/CLK
add wave -noupdate /tb_gaire_2_to_1_multiplexer/Instgaire_2_to_1_multiplexer/a_0
add wave -noupdate /tb_gaire_2_to_1_multiplexer/Instgaire_2_to_1_multiplexer/a_1
add wave -noupdate /tb_gaire_2_to_1_multiplexer/Instgaire_2_to_1_multiplexer/y
add wave -noupdate /tb_gaire_2_to_1_multiplexer/Instgaire_2_to_1_multiplexer/sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 292
configure wave -valuecolwidth 283
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
WaveRestoreZoom {0 ns} {174 ns}
