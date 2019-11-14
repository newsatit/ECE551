module telemetry_tb();

reg [11:0] batt_v;
reg [11:0] avg_curr;
reg [11:0] avg_torque;
reg clk, rst_n;
wire TX;

wire [7:0] rx_data;
wire rx_rdy;
telemetry iDUT(.batt_v(batt_v), .avg_curr(avg_curr), .avg_torque(avg_torque), .clk(clk), .rst_n(rst_n), .TX(TX));
UART_rcv uart_rcv(.clk(clk),.rst_n(rst_n),.RX(TX),.rdy(rx_rdy),.rx_data(rx_data), .clr_rdy(rx_rdy));


logic [7:0] delim1 = 8'hAA;
logic [7:0] delim2 = 8'h55;
logic [7:0] payload1;
assign payload1 = {4'h0, batt_v[11:8]};
logic [7:0] payload2;
assign payload2 = batt_v[7:0];
logic [7:0] payload3;
assign payload3 = {4'h0, avg_curr[11:8]};
logic [7:0] payload4;
assign payload4 = avg_curr[7:0];
logic [7:0] payload5;
assign payload5 = {4'h0, avg_torque[11:8]};
logic [7:0] payload6;
assign payload6 = avg_torque[7:0];
logic [63:0] data;

initial begin
	clk = 0;
	rst_n = 0;
	batt_v = 12'hABC;
	avg_curr = 12'h123;
	avg_torque = 12'h567;
	
	@(posedge clk);
	repeat(2)@(negedge clk);
	rst_n = 1;
	
	
	/*Test for each byte 8 times*/	
	@(posedge rx_rdy);
	if (rx_data != delim1) begin
		$display("Test failed: delimt1 does not match");
		$stop();
	end
	$display("delim1 is received correctly");

	@(posedge rx_rdy);
	if (rx_data != delim2) begin
		$display("Test failed: delim2 does not match");
		$stop();
	end
	$display("delim2 is received correctly");

	@(posedge rx_rdy);
	if (rx_data != payload1) begin
		$display("Test failed: payload1 does not match");
		$stop();
	end
	$display("payload1 is received correctly");

	@(posedge rx_rdy);
	if (rx_data != payload2) begin
		$display("Test failed: payload2 does not match");
		$stop();
	end
	$display("payload2 is received correctly");

	@(posedge rx_rdy);
	if (rx_data != payload3) begin
		$display("Test failed: payload3 does not match");
		$stop();
	end
	$display("payload3 is received correctly");

	@(posedge rx_rdy);
	if (rx_data != payload4) begin
		$display("Test failed: payload4 does not match");
		$stop();
	end
	$display("payload4 is received correctly");

	@(posedge rx_rdy);
	if (rx_data != payload5) begin
		$display("Test failed: payload5 does not match");
	$display("payload5 is received correctly");
	end

	@(posedge rx_rdy);
	if (rx_data != payload6) begin
		$display("Test failed: payload6 does not match");
		$stop();
	end
	$display("payload6 is received correctly");

	/* Test delim1 for the second time of transmission*/
	@(posedge rx_rdy);
	if (rx_data != delim1) begin
		$display("Test failed: delimt1 does not match");
		$stop();
	end
	$display("delim1 is received correctly");
	$display("Tests passed!!!");
	$stop();
end

always 
	#5 clk = ~clk;

endmodule
