onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /SPI_mstr_tb/clk
add wave -noupdate /SPI_mstr_tb/rst_n
add wave -noupdate /SPI_mstr_tb/wrt
add wave -noupdate /SPI_mstr_tb/cmd
add wave -noupdate /SPI_mstr_tb/MISO
add wave -noupdate /SPI_mstr_tb/rd_data
add wave -noupdate /SPI_mstr_tb/SS_n
add wave -noupdate /SPI_mstr_tb/SCLK
add wave -noupdate /SPI_mstr_tb/done
add wave -noupdate /SPI_mstr_tb/MOSI
add wave -noupdate /SPI_mstr_tb/iDUTSPI_mstr/SCLK
add wave -noupdate /SPI_mstr_tb/iDUTSPI_mstr/state
add wave -noupdate /SPI_mstr_tb/iDUTSPI_mstr/nxt_state
add wave -noupdate /SPI_mstr_tb/iDUTSPI_mstr/neg
add wave -noupdate /SPI_mstr_tb/iDUTSPI_mstr/pos
add wave -noupdate -radix binary /SPI_mstr_tb/iDUTSPI_mstr/sclk_div
add wave -noupdate /SPI_mstr_tb/iDUTSPI_mstr/bit_cntr
add wave -noupdate /SPI_mstr_tb/iDUTSPI_mstr/done15
add wave -noupdate /SPI_mstr_tb/iDUTSPI_mstr/init
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10640 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 2
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
WaveRestoreZoom {41225 ns} {43047 ns}
