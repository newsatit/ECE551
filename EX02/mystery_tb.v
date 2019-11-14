module mystery_tb();

reg d_in;
reg clk;

wire d_out; // DUT will drive

//// Instantiate DUT ////
mystery iDUT(.clk(clk), .d(d_in), .q(d_out));

initial begin
	clk = 0;
	d_in  = 0;

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
	$display("Test passed!");
	$stop;
end

always
	#5 clk = ~clk;

endmodule