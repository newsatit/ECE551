module cadence_filt(clk, rst_n, cadence, cadence_filt);
	input clk, rst_n, cadence;
	output reg cadence_filt;

	reg c1, c2, c3, chngd_n, stable;
	reg [15:0] stbl_cnt;
	always_ff@(posedge clk, negedge rst_n) begin
		c1 <= cadence;
		c2 <= c1;
		c3 <= c2;
		chngd_n <= c2^~c3;
		stable <= &stbl_cnt;
		if (!rst_n) 
			stbl_cnt <= 29'b0;
		else
			stbl_cnt <= (stbl_cnt+1)&(chngd_n);
		cadence_filt <= stable ? c3 : cadence_filt;
	end
endmodule
