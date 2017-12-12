onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {top level signals}
add wave -noupdate /tb_gaire_tri_state_gate/CLK
add wave -noupdate /tb_gaire_tri_state_gate/EN
add wave -noupdate /tb_gaire_tri_state_gate/input
add wave -noupdate /tb_gaire_tri_state_gate/output
add wave -noupdate -divider {comparing output with expected output}
add wave -noupdate /tb_gaire_tri_state_gate/output
add wave -noupdate /tb_gaire_tri_state_gate/Exp_output
add wave -noupdate /tb_gaire_tri_state_gate/Test_output
add wave -noupdate /tb_gaire_tri_state_gate/LineNumber
add wave -noupdate -divider {internal signals}
add wave -noupdate /tb_gaire_tri_state_gate/U0/CLK
add wave -noupdate /tb_gaire_tri_state_gate/Instgaire_tri_state_gate/EN
add wave -noupdate /tb_gaire_tri_state_gate/Instgaire_tri_state_gate/input
add wave -noupdate /tb_gaire_tri_state_gate/Instgaire_tri_state_gate/output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 231
configure wave -valuecolwidth 58
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
WaveRestoreZoom {0 ns} {922 ns}
