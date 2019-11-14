onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /shifter_tb/rotate
add wave -noupdate -radix unsigned /shifter_tb/amt
add wave -noupdate -radix binary /shifter_tb/src
add wave -noupdate -radix binary /shifter_tb/res
add wave -noupdate -radix decimal /shifter_tb/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ns} {21 ns}
