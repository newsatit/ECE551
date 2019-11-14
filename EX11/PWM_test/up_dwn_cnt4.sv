module up_dwn_cnt4(en, up, clk, rst_n, cnt);

input en, up, clk, rst_n;
output logic [3:0] cnt;

always_ff@(posedge clk, negedge rst_n)
	if (!rst_n)
		cnt <= 4'h0;
	else if (en)
		if (up)
			cnt <= cnt + 1;
		else 
			cnt <= cnt - 1;

endmodule