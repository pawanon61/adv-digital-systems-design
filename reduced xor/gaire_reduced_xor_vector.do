onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {TOP LEVEL SIGNALS}
add wave -noupdate /tb_gaire_reduced_xor_vector/CLK
add wave -noupdate /tb_gaire_reduced_xor_vector/a
add wave -noupdate /tb_gaire_reduced_xor_vector/y
add wave -noupdate -divider {Compare output and expected output}
add wave -noupdate /tb_gaire_reduced_xor_vector/y(7)
add wave -noupdate /tb_gaire_reduced_xor_vector/Exp_y
add wave -noupdate /tb_gaire_reduced_xor_vector/Test_y
add wave -noupdate -divider <NULL>
add wave -noupdate /tb_gaire_reduced_xor_vector/LineNumber
add wave -noupdate /tb_gaire_reduced_xor_vector/U0/CLK
add wave -noupdate /tb_gaire_reduced_xor_vector/Instgaire_reduced_xor_vector/a
add wave -noupdate /tb_gaire_reduced_xor_vector/Instgaire_reduced_xor_vector/y
add wave -noupdate /tb_gaire_reduced_xor_vector/Instgaire_reduced_xor_vector/p01
add wave -noupdate /tb_gaire_reduced_xor_vector/Instgaire_reduced_xor_vector/p23
add wave -noupdate /tb_gaire_reduced_xor_vector/Instgaire_reduced_xor_vector/p45
add wave -noupdate /tb_gaire_reduced_xor_vector/Instgaire_reduced_xor_vector/p67
add wave -noupdate /tb_gaire_reduced_xor_vector/Instgaire_reduced_xor_vector/p012
add wave -noupdate /tb_gaire_reduced_xor_vector/Instgaire_reduced_xor_vector/p0123
add wave -noupdate /tb_gaire_reduced_xor_vector/Instgaire_reduced_xor_vector/p456
add wave -noupdate /tb_gaire_reduced_xor_vector/Instgaire_reduced_xor_vector/p4567
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 378
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
WaveRestoreZoom {0 ns} {738 ns}
