onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Intermediate /desiredDrive_tb/iDUT/torque_pos
add wave -noupdate -expand -group Intermediate /desiredDrive_tb/iDUT/incline_lim
add wave -noupdate -expand -group Intermediate /desiredDrive_tb/iDUT/target_curr
add wave -noupdate -radix binary /desiredDrive_tb/iDUT/incline_sat
add wave -noupdate -radix binary /desiredDrive_tb/iDUT/incline_factor
add wave -noupdate /desiredDrive_tb/iDUT/incline_lim
add wave -noupdate -expand -group input /desiredDrive_tb/avg_torque
add wave -noupdate -expand -group input /desiredDrive_tb/cadence_vec
add wave -noupdate -expand -group input -radix decimal /desiredDrive_tb/incline
add wave -noupdate -expand -group input -radix binary /desiredDrive_tb/setting
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 277
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
WaveRestoreZoom {0 ns} {19 ns}
