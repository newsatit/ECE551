module synch_detect(asynch_sig_in, clk, rise_edge);

	input asynch_sig_in, clk;
	output wire rise_edge;

	wire d0, d1, d2;

	dff ff0(asynch_sig_in, clk, d0);
	dff ff1(d0, clk, d1);
	dff ff2(d1, clk, d2);

	and and1(rise_edge, d1, ~d2);

	


endmodule
