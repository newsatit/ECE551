module incline_sat(incline, incline_sat);
	input [12:0] incline;
	output [9:0] incline_sat;

	assign incline_sat = 
		(incline[12] && !(&incline[11:9])) ? // negative saturate
			{2'b10, 8'h00} :
		(!incline[12] && (|incline[11:9])) ? // positve saturate
			{2'b01, 8'hff} : 
		incline[9:0];		
endmodule
