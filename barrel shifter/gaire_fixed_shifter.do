onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Top level signals}
add wave -noupdate /tb_gaire_fixed_shifter/CLK
add wave -noupdate /tb_gaire_fixed_shifter/s_in
add wave -noupdate /tb_gaire_fixed_shifter/shft
add wave -noupdate /tb_gaire_fixed_shifter/s_out
add wave -noupdate -divider {Comparing output with expected output}
add wave -noupdate /tb_gaire_fixed_shifter/s_out
add wave -noupdate /tb_gaire_fixed_shifter/Exp_s_out
add wave -noupdate /tb_gaire_fixed_shifter/Test_s_out
add wave -noupdate /tb_gaire_fixed_shifter/LineNumber
add wave -noupdate -divider <NULL>
add wave -noupdate /tb_gaire_fixed_shifter/U0/CLK
add wave -noupdate /tb_gaire_fixed_shifter/Instgaire_fixed_shifter/s_in
add wave -noupdate /tb_gaire_fixed_shifter/Instgaire_fixed_shifter/shft
add wave -noupdate /tb_gaire_fixed_shifter/Instgaire_fixed_shifter/s_out
add wave -noupdate /tb_gaire_fixed_shifter/Instgaire_fixed_shifter/sh_tmp
add wave -noupdate /tb_gaire_fixed_shifter/Instgaire_fixed_shifter/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 235
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
WaveRestoreZoom {0 ns} {831 ns}
