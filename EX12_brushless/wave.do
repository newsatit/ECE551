onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /brushless_mtr_drv_tb/i
add wave -noupdate /brushless_mtr_drv_tb/rst_n
add wave -noupdate /brushless_mtr_drv_tb/clk
add wave -noupdate /brushless_mtr_drv_tb/drv_mag
add wave -noupdate /brushless_mtr_drv_tb/brake_n
add wave -noupdate /brushless_mtr_drv_tb/hallGrn
add wave -noupdate /brushless_mtr_drv_tb/hallYlw
add wave -noupdate /brushless_mtr_drv_tb/hallBlu
add wave -noupdate /brushless_mtr_drv_tb/duty
add wave -noupdate /brushless_mtr_drv_tb/selGrn
add wave -noupdate /brushless_mtr_drv_tb/selYlw
add wave -noupdate /brushless_mtr_drv_tb/selBlu
add wave -noupdate /brushless_mtr_drv_tb/highGrn
add wave -noupdate /brushless_mtr_drv_tb/lowGrn
add wave -noupdate /brushless_mtr_drv_tb/highYlw
add wave -noupdate /brushless_mtr_drv_tb/lowYlw
add wave -noupdate /brushless_mtr_drv_tb/highBlu
add wave -noupdate /brushless_mtr_drv_tb/lowBlu
add wave -noupdate /brushless_mtr_drv_tb/mtr_drv_DUT/PWM_sig
add wave -noupdate /brushless_mtr_drv_tb/mtr_drv_DUT/highGrnIn
add wave -noupdate /brushless_mtr_drv_tb/mtr_drv_DUT/highYlwIn
add wave -noupdate /brushless_mtr_drv_tb/mtr_drv_DUT/highBluIn
add wave -noupdate /brushless_mtr_drv_tb/mtr_drv_DUT/lowGrnIn
add wave -noupdate /brushless_mtr_drv_tb/mtr_drv_DUT/lowYlwIn
add wave -noupdate /brushless_mtr_drv_tb/mtr_drv_DUT/lowBluIn
add wave -noupdate -expand -group {green nonoverlap} /brushless_mtr_drv_tb/mtr_drv_DUT/nonoverlap_grn/clk
add wave -noupdate -expand -group {green nonoverlap} /brushless_mtr_drv_tb/mtr_drv_DUT/nonoverlap_grn/rst_n
add wave -noupdate -expand -group {green nonoverlap} /brushless_mtr_drv_tb/mtr_drv_DUT/nonoverlap_grn/highIn
add wave -noupdate -expand -group {green nonoverlap} /brushless_mtr_drv_tb/mtr_drv_DUT/nonoverlap_grn/lowIn
add wave -noupdate -expand -group {green nonoverlap} /brushless_mtr_drv_tb/mtr_drv_DUT/nonoverlap_grn/highOut
add wave -noupdate -expand -group {green nonoverlap} /brushless_mtr_drv_tb/mtr_drv_DUT/nonoverlap_grn/lowOut
add wave -noupdate -expand -group {green nonoverlap} -radix unsigned /brushless_mtr_drv_tb/mtr_drv_DUT/nonoverlap_grn/cnt
add wave -noupdate -expand -group {green nonoverlap} /brushless_mtr_drv_tb/mtr_drv_DUT/nonoverlap_grn/highInPrev
add wave -noupdate -expand -group {green nonoverlap} /brushless_mtr_drv_tb/mtr_drv_DUT/nonoverlap_grn/lowInPrev
add wave -noupdate -expand -group {green nonoverlap} /brushless_mtr_drv_tb/mtr_drv_DUT/nonoverlap_grn/chngd
add wave -noupdate -expand -group {green nonoverlap} /brushless_mtr_drv_tb/mtr_drv_DUT/nonoverlap_grn/expired
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {335 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 401
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
WaveRestoreZoom {259 ns} {435 ns}
