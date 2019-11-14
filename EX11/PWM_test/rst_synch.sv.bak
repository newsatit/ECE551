module rst_synch(RST_n, clk, rst_n);

input RST_n, clk;
output reg rst_n;

// output from first FF
reg ff0;

always_ff@(posedge clk, negedge rst_n)
	if (!RST_n) begin
		ff0 <= 1'b0;
		rst_n <= 1'b0;
	end else begin
		ff0 <= 1'b1;
		rst_n <= ff0;
	end

endmodule
