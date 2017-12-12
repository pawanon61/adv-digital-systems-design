onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Top level signals}
add wave -noupdate /tb_gaire_barrel_shifter/CLK
add wave -noupdate /tb_gaire_barrel_shifter/a
add wave -noupdate /tb_gaire_barrel_shifter/amt
add wave -noupdate /tb_gaire_barrel_shifter/y
add wave -noupdate -divider {Compare output with expected output}
add wave -noupdate /tb_gaire_barrel_shifter/y
add wave -noupdate /tb_gaire_barrel_shifter/Exp_y
add wave -noupdate /tb_gaire_barrel_shifter/Test_y
add wave -noupdate -divider <NULL>
add wave -noupdate /tb_gaire_barrel_shifter/LineNumber
add wave -noupdate /tb_gaire_barrel_shifter/U0/CLK
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/a
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/amt
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/y
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/p
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(0)/shift_slice/s_in
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(0)/shift_slice/shft
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(0)/shift_slice/s_out
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(0)/shift_slice/sh_tmp
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(0)/shift_slice/zero
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(1)/shift_slice/s_in
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(1)/shift_slice/shft
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(1)/shift_slice/s_out
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(1)/shift_slice/sh_tmp
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(1)/shift_slice/zero
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(2)/shift_slice/s_in
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(2)/shift_slice/shft
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(2)/shift_slice/s_out
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(2)/shift_slice/sh_tmp
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(2)/shift_slice/zero
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(3)/shift_slice/s_in
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(3)/shift_slice/shft
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(3)/shift_slice/s_out
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(3)/shift_slice/sh_tmp
add wave -noupdate /tb_gaire_barrel_shifter/Instgaire_barrel_shifter/stage_gen(3)/shift_slice/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 239
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
WaveRestoreZoom {0 ns} {823 ns}
