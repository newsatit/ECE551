module nonoverlap_tb();

reg clk, rst_n;
reg signal;
wire highIn, lowIn;
wire highOut, lowOut;

nonoverlap iDUT(.clk(clk), .rst_n(rst_n), .highIn(highIn), .lowIn(lowIn), .highOut(highOut), .lowOut(lowOut));

assign highIn = signal;
assign lowIn = ~signal;

reg [5:0] i;

initial begin
	clk = 0;
	rst_n = 0;
	signal = 0;
	
	@(posedge clk);
	@(negedge clk);
	rst_n = 1;
	signal = 1;

	// should stay low for 32 clocks
	for (i = 0; i < 32; i=i+1) begin
		@(posedge clk);
		if (highOut != 1'b0 || lowOut != 1'b0) begin
			$display("Test failed: outputs should stay low for 32 clocks");
			$stop();
		end
	end
	
	// finish forcing low
	@(posedge clk);
	#1;
	if (highOut != signal || lowOut != ~signal) begin
		$display("Test failed: highOut should equals signal and highIn should equals ~signal");
		$stop();
	end
	@(posedge clk);
	if (highOut != signal || lowOut != ~signal) begin
		$display("Test failed: highOut and lowOut should stay the same as highIn and lowIn");
		$stop();
	end
	@(posedge clk);
	$display("Test passed!");
	$stop();
end

always
	#10 clk = ~clk;


endmodule
