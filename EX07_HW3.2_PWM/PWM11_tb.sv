module PWM11_tb();

logic clk, rst_n;
logic [10:0] duty;
logic PWM_sig;

PWM11 iDUT(.clk(clk), .rst_n(rst_n), .duty(duty), .PWM_sig(PWM_sig));

localparam integer PERIOD = 2048;

initial begin
	clk = 0;
	rst_n = 0;
	@(posedge clk);
	@(negedge clk);
	rst_n = 1;

	// high for 512 clocks
	duty = 11'd512;
	repeat(PERIOD)@(posedge clk);
	repeat(PERIOD)@(posedge clk);

	// high for 1024 clocks
	duty = 11'd1024;
	repeat(PERIOD)@(posedge clk);
	repeat(PERIOD/4)@(posedge clk);
	//reset
	rst_n = 0;
	repeat(PERIOD)@(posedge clk);
	@(negedge clk) rst_n = 1;
	// high for 1536 clocks
	duty = 11'd1536;
	repeat(PERIOD)@(posedge clk);

	// high for 1 clocks
	duty = 11'd1;
	repeat(PERIOD)@(posedge clk);
	repeat(PERIOD)@(posedge clk);

	// high for 2047 clocks
	duty = 11'd2047;
	repeat(PERIOD)@(posedge clk);
	repeat(PERIOD)@(posedge clk);
	$stop();
end


always 
	#1 clk = ~clk;



endmodule

