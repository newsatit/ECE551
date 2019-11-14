onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /PID_cntrl_tb/rst_n
add wave -noupdate -format Analog-Step -height 74 -min -2048.0 -radix unsigned /PID_cntrl_tb/target_curr
add wave -noupdate -format Analog-Step -height 74 -max 1296.0 -radix unsigned /PID_cntrl_tb/avg_curr
add wave -noupdate -format Analog-Step -height 74 -max 2040.0000000000002 -min -2048.0 -radix unsigned /PID_cntrl_tb/drv_duty
add wave -noupdate -format Analog-Step -height 74 -max 8191.0 -radix unsigned /PID_cntrl_tb/iCNTRL/error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8265 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
configure wave -valuecolwidth 343
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
WaveRestoreZoom {0 ns} {53555 ns}
