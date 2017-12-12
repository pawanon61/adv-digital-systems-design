onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_gaire_shift3mode/CLK
add wave -noupdate -divider {Top level signals}
add wave -noupdate /tb_gaire_shift3mode/a
add wave -noupdate /tb_gaire_shift3mode/lar
add wave -noupdate /tb_gaire_shift3mode/amt
add wave -noupdate /tb_gaire_shift3mode/y
add wave -noupdate -divider {Comparing output and expected output}
add wave -noupdate /tb_gaire_shift3mode/y
add wave -noupdate /tb_gaire_shift3mode/Exp_y
add wave -noupdate /tb_gaire_shift3mode/Test_y
add wave -noupdate -divider <NULL>
add wave -noupdate /tb_gaire_shift3mode/LineNumber
add wave -noupdate /tb_gaire_shift3mode/U0/CLK
add wave -noupdate /tb_gaire_shift3mode/Instgaire_shift3mode/a
add wave -noupdate /tb_gaire_shift3mode/Instgaire_shift3mode/lar
add wave -noupdate /tb_gaire_shift3mode/Instgaire_shift3mode/amt
add wave -noupdate /tb_gaire_shift3mode/Instgaire_shift3mode/y
add wave -noupdate /tb_gaire_shift3mode/Instgaire_shift3mode/shift_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 216
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
WaveRestoreZoom {0 ns} {664 ns}
