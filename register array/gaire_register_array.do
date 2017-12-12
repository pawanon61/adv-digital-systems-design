onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {top level signals}
add wave -noupdate /tb_gaire_register_array/CLK
add wave -noupdate /tb_gaire_register_array/reset
add wave -noupdate /tb_gaire_register_array/LD_REG
add wave -noupdate /tb_gaire_register_array/DR
add wave -noupdate /tb_gaire_register_array/OP_A
add wave -noupdate /tb_gaire_register_array/SR1
add wave -noupdate /tb_gaire_register_array/SR2
add wave -noupdate /tb_gaire_register_array/OP_Q1
add wave -noupdate /tb_gaire_register_array/OP_Q2
add wave -noupdate -divider {compare output with expected output}
add wave -noupdate /tb_gaire_register_array/OP_Q1
add wave -noupdate /tb_gaire_register_array/Exp_OP_Q1
add wave -noupdate /tb_gaire_register_array/OP_Q2
add wave -noupdate /tb_gaire_register_array/Test_OP_Q1
add wave -noupdate /tb_gaire_register_array/Exp_OP_Q2
add wave -noupdate /tb_gaire_register_array/Test_OP_Q2
add wave -noupdate /tb_gaire_register_array/LineNumber
add wave -noupdate -divider {internal signals}
add wave -noupdate /tb_gaire_register_array/U0/CLK
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/CLK
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/reset
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/LD_REG
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/DR
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/OP_A
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/SR1
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/SR2
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/OP_Q1
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/OP_Q2
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/sEN
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/sFF
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(0)/regh0/clk
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(0)/regh0/reset
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(0)/regh0/EN
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(0)/regh0/OP_A
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(0)/regh0/OP_Q
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(0)/regh0/my_sig
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(1)/regh0/clk
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(1)/regh0/reset
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(1)/regh0/EN
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(1)/regh0/OP_A
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(1)/regh0/OP_Q
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(1)/regh0/my_sig
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(2)/regh0/clk
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(2)/regh0/reset
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(2)/regh0/EN
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(2)/regh0/OP_A
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(2)/regh0/OP_Q
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(2)/regh0/my_sig
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(3)/regh0/clk
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(3)/regh0/reset
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(3)/regh0/EN
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(3)/regh0/OP_A
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(3)/regh0/OP_Q
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(3)/regh0/my_sig
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(4)/regh0/clk
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(4)/regh0/reset
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(4)/regh0/EN
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(4)/regh0/OP_A
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(4)/regh0/OP_Q
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(4)/regh0/my_sig
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(5)/regh0/clk
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(5)/regh0/reset
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(5)/regh0/EN
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(5)/regh0/OP_A
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(5)/regh0/OP_Q
add wave -noupdate /tb_gaire_register_array/Instgaire_register_array/g0(5)/regh0/my_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 243
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
WaveRestoreZoom {0 ns} {815 ns}
