module nonoverlap(clk, rst_n, highIn, lowIn, highOut, lowOut);

input clk, rst_n, highIn, lowIn;
output reg highOut, lowOut;

reg [4:0] cnt;
reg highInPrev, lowInPrev;

assign chngd = (highInPrev ^ highIn) | (lowInPrev ^ lowIn);
assign expired = &cnt;

// flop for detecting change
always_ff@(posedge clk) begin
	highInPrev <= highIn;
	lowInPrev <= lowIn;
end

// 5-bit counter
always_ff@(posedge clk)
	if (chngd)
		cnt <= 5'h0;
	else if(!expired)
		cnt <= cnt + 1;

// output flop
always_ff@(posedge clk, negedge rst_n)
	if(!rst_n) begin
		highOut <= 1'b0;
		lowOut <= 1'b0; 
	end
	else if (expired) begin
		highOut <= highIn;
		lowOut <= lowIn;
	end
	// force low
	else begin 
		highOut <= 1'b0;
		lowOut <= 1'b0;
	end
endmodule
