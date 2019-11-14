module SPI_mstr_tb();


// input of SPI_mstr
reg clk, rst_n, wrt;
reg [15:0] cmd;
wire MISO;

// output of SPI_mstr
wire [15:0] rd_data;
wire SS_n, SCLK, done, MOSI;

SPI_mstr iDUTSPI_mstr(.clk(clk), .rst_n(rst_n), .SS_n(SS_n), .SCLK(SCLK), .MOSI(MOSI), .MISO(MISO), .wrt(wrt), .cmd(cmd), .done(done), .rd_data(rd_data));
ADC128S adc(.clk(clk),.rst_n(rst_n),.SS_n(SS_n),.SCLK(SCLK),.MISO(MISO),.MOSI(MOSI));

logic [11:0] SPI_resp;
assign SPI_resp = rd_data[11:0];

initial begin
	clk = 0;
	rst_n = 0;
	wrt = 0;

	@(posedge clk);
	@(negedge clk);
	rst_n = 1;
	
	wrt = 1;
	cmd = {2'b00, 3'h1, 11'h00};
	@(negedge clk);
	wrt = 0;
	@(posedge done);
	// check case 1
	if (SPI_resp != 12'hC00) begin
		$display("Test 1 failed");
		$stop();
	end
	$display("Test 1 passed!");

	@(posedge clk);
	@(negedge clk);
	wrt = 1;
	cmd = {2'b00, 3'h1, 11'h00};
	@(negedge clk);
	wrt = 0;
	@(posedge done);
	// check case 2
	if (SPI_resp != 12'hC01) begin
		$display("Test 2 failed");
		$stop();
	end
	$display("Test 2 passed!");

	@(posedge clk);
	@(negedge clk);
	wrt = 1;
	cmd = {2'b00, 3'h4, 11'h00};
	@(negedge clk);
	wrt = 0;
	@(posedge done);
	// check case 3
	if (SPI_resp != 12'h0xBF1) begin
		$display("Test 3 failed");
		$stop();
	end
	$display("Test 3 passed!");

	@(posedge clk);
	@(negedge clk);
	wrt = 1;
	cmd = {2'b00, 3'h4, 11'h00};
	@(negedge clk);
	wrt = 0;
	@(posedge done);
	// check case 4
	if (SPI_resp != 12'h0xBF4) begin
		$display("Test 4 failed");
		$stop();
	end
	$display("Test 4 passed!");
	
	$display("Tests passed!");
	$stop();

end

always 
	#5 clk = ~clk;
endmodule
