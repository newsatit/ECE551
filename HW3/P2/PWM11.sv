module PWM11(clk, rst_n, duty, PWM_sig);

input clk, rst_n;
input [10:0] duty;
output logic PWM_sig;

logic [10:0] cnt;

// counter
always_ff@(posedge clk, negedge rst_n) 
	if (!rst_n)
		cnt <= 11'b0;
	else  
		cnt <= cnt + 11'b1;


//output logic
always_ff@(posedge clk, negedge rst_n) 
	if (!rst_n) 
		PWM_sig <= 1'b0;
	else if (cnt < duty)
		PWM_sig <= 1'b1;
	else 
		PWM_sig <= 1'b0;


endmodule
