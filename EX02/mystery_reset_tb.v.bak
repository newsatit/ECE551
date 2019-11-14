module mystery_reset_tb();

reg d_in;
reg clk;
reg rst;

wire d_out; // DUT will drive

//// Instantiate DUT ////
mystery_reset iDUT(.clk(clk), .d(d_in), .rst(rst), .q(d_out));

initial begin
	clk = 0;
	d_in  = 0;
	rst = 0;

	@(posedge clk);
	#1
	if (d_out !== 1'b0) begin
		$display("ERR: q_out should be 0");
		$stop;
	end
	
	d_in = 1;
	@(posedge clk);
	#1
	if (d_out !== 1'b1) begin
		$display("ERR: q_out should be 1");
		$stop;
	end
	
	@(negedge clk);
	rst = 1;
	@(posedge clk);
	#1
	rst = 0;
	if (d_out !== 1'b0) begin
		$display("ERR: qout should be 0 (reset)");
		$stop;
	end
	$display("Test passed!");
	$stop;
end

always
	#5 clk = ~clk;

endmodule