/* b. The comments should answer the questions about the latch posed above.
Is this code correct?  
- No
If so why does it correctly infer and model a latch?  If not, what is wrong with it?  
- latch should not be synchronized by clk signal. The sensitivity list should include d instead.
*/

// c. D-FF with an active high synchronous setand an enable.
module DFF_c(d, set, en, clk, q);	
	input d, set, en, clk;
	output reg q;

	always@(posedge clk) begin
		if(set)
			q <= 1'b1;
		else if(en)
			q <= d;
	end
endmodule

// d. The file should contain the model of aD-FF with asynchronous active low reset and an active high enable.
module DFF_d(d, rst_n, en, clk, q);	
	input d, rst_n, en, clk;
	output reg q;

	always@(posedge clk, negedge rst_n) begin
		if(!rst_n)
			q <= 1'b0;
		else if(en)
			q <= d;
	end
endmodule
// e. The file should contain the model of aJ-K FF with active low synchronous reset.
module JKFF_e(j, k, rst_n, clk, q, qnot);	
	input j, k, rst_n, clk;
	output reg q;
	
	output wire qnot;
	assign qnot = ~q;
	always@(posedge clk) begin
		if(!rst_n) begin
			q <= 1'b0;
		end
		else begin
			case({j, k})
				2'b00:	begin q <= q; end
				2'b01:	begin q <= 1'b0; end
				2'b10:	begin q <= 1'b1; end
				2'b11:	begin q <= ~q; end
			endcase
		end
	end
endmodule