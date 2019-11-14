module mtr_drv(duty, selGrn, selYlw, selBlu, clk, rst_n, highGrn, lowGrn, highYlw, lowYlw, highBlu, lowBlu);

input clk, rst_n;
input [10:0] duty;
input [1:0] selGrn, selYlw, selBlu;

output wire highGrn, lowGrn, highYlw, lowYlw, highBlu, lowBlu;

wire PWM_sig;
PWM11 pwm(.clk(clk), .rst_n(rst_n), .duty(duty), .PWM_sig(PWM_sig));

// Input for Green Coil
assign highGrnIn = high_overlap(selGrn, PWM_sig);
assign lowGrnIn = low_overlap(selGrn, PWM_sig);
nonoverlap nonoverlap_grn(.clk(clk), .rst_n(rst_n), .highIn(highGrnIn), .lowIn(lowGrnIn), .highOut(highGrn), .lowOut(lowGrn));

// Input for Yellow Coil
assign highYlwIn = high_overlap(selYlw, PWM_sig);
assign lowYlwIn = low_overlap(selYlw, PWM_sig);
nonoverlap nonoverlap_ylw(.clk(clk), .rst_n(rst_n), .highIn(highYlwIn), .lowIn(lowYlwIn), .highOut(highYlw), .lowOut(lowYlw));

// Input for Blue Coil
assign highBluIn = high_overlap(selBlu, PWM_sig);
assign lowBluIn = low_overlap(selBlu, PWM_sig);
nonoverlap nonoverlap_blu(.clk(clk), .rst_n(rst_n), .highIn(highBluIn), .lowIn(lowBluIn), .highOut(highBlu), .lowOut(lowBlu));

/*
Mux for overlap high
00 0
01 ~pwm
10 pwm
11 0
*/
function high_overlap(input [1:0] sel, input PWM_sig);
	high_overlap = (sel[0] == sel[1]) ? 1'b0 : 
		(sel[1]) ? PWM_sig : 
		~PWM_sig;
endfunction

/*
Mux for overlap low
00 0
01 pwm
10 ~pwm
11 pwm
*/
function low_overlap(input [1:0] sel, input PWM_sig);
	low_overlap = (sel[0]) ? PWM_sig:
	 	(sel[1]) ? ~PWM_sig : 
		1'b0;
endfunction



endmodule

