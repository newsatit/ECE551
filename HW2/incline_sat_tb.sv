module incline_sat_tb();

localparam [12:0] incline_stim [0:6] = {13'd400, -13'd4096, 13'd4095, -13'd512, -13'd513, 13'd511, 13'd512};
localparam [9:0] incline_sat_expected [0:6] = {10'd400, -10'd512, 10'd511, -10'd512, -10'd512, 10'd511, 10'd511};

reg [12:0] incline;
wire [9:0] incline_sat;
incline_sat iDUT(.incline(incline), .incline_sat(incline_sat));


reg[2:0] i;
initial begin
	for (i = 0; i < 7; i = i + 1) begin
		incline = incline_stim[i];
		#5;
		if (incline_sat != incline_sat_expected[i]) begin
			$display("Test %d failed input: %h, output: %h, expected: %h", i+1, incline, incline_sat, incline_sat_expected[i]);
			$stop();
		end
		$display("Test %d passed input: %h, output: %h, expected: %h", i+1, incline, incline_sat, incline_sat_expected[i]);
	end
	$display("Test Passed!!!");
end

endmodule
