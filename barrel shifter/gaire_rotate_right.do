onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_gaire_rotate_right/CLK
add wave -noupdate -divider {Top level signals}
add wave -noupdate /tb_gaire_rotate_right/a
add wave -noupdate /tb_gaire_rotate_right/amt
add wave -noupdate /tb_gaire_rotate_right/y
add wave -noupdate -divider {Comparing output and expected output}
add wave -noupdate /tb_gaire_rotate_right/y
add wave -noupdate /tb_gaire_rotate_right/Exp_y
add wave -noupdate /tb_gaire_rotate_right/Test_y
add wave -noupdate -divider <NULL>
add wave -noupdate /tb_gaire_rotate_right/LineNumber
add wave -noupdate /tb_gaire_rotate_right/U0/CLK
add wave -noupdate /tb_gaire_rotate_right/Instgaire_rotate_right/a
add wave -noupdate /tb_gaire_rotate_right/Instgaire_rotate_right/amt
add wave -noupdate /tb_gaire_rotate_right/Instgaire_rotate_right/y
add wave -noupdate /tb_gaire_rotate_right/Instgaire_rotate_right/le0_out
add wave -noupdate /tb_gaire_rotate_right/Instgaire_rotate_right/le1_out
add wave -noupdate /tb_gaire_rotate_right/Instgaire_rotate_right/le2_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 223
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
WaveRestoreZoom {0 ns} {855 ns}
