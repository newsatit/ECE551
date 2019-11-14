module brushless_mtr_drv_tb();

/*
	highGrn,highYlw, lowYlw are z high-z;
*/
integer i;
localparam reg [2:0] rotation_state[0:7] = {3'b101, 3'b100, 3'b110, 3'b010, 3'b011, 3'b001, 3'b000, 3'b111};

reg rst_n, clk;
reg [11:0] drv_mag;
reg brake_n, hallGrn, hallYlw, hallBlu;


wire [10:0] duty;
wire [1:0] selGrn, selYlw, selBlu;

wire highGrn, lowGrn, highYlw, lowYlw, highBlu, lowBlu;

brushless brushless_DUT(clk, drv_mag, hallGrn, hallYlw, hallBlu, brake_n, duty, 
selGrn, selYlw, selBlu);
mtr_drv mtr_drv_DUT(duty, selGrn, selYlw, selBlu, clk, rst_n, highGrn, lowGrn, highYlw, lowYlw, highBlu, lowBlu);


initial begin
	clk = 0;
	rst_n = 0;
	brake_n = 0;
	drv_mag = 12'h005;

	@(posedge clk);
	@(negedge clk);
	rst_n = 1;
	brake_n = 1;

	// test different rotation states
	for (i=0; i<8; i+=1) begin
		{hallGrn, hallYlw, hallBlu} = rotation_state[i];
		repeat(2)@(posedge clk);
		repeat(32)@(posedge clk);
		#1;
	end

	// test brake
	brake_n = 0;
	repeat(2)@(posedge clk);
	repeat(32)@(posedge clk);
	#1;
	$stop();

end

always
	#5 clk = ~clk;


endmodule

