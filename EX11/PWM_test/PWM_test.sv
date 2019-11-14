module PWM_test(clk,RST_n,PB,DIP,LED);

	input clk;		// our 50MHz clock from DE0-Nano
	input RST_n;	// from push button, goes to our rst_synch block
	input PB;		// from push button, goes to our PB_release detector
	input DIP;		// from DIP switch block, forms up to our up/down counter
	

	output [7:0] LED;		// LED[0] intensity controlled by PDM
							// LED[7:4] provide observability of our 4-bit counter

	////////////////////////////////////////
	// Declare any internal signals here //
	//////////////////////////////////////
	wire rst_n;			// global reset to all other blocks, produced by rst_synch
	wire btn_release;	// from PB_release unit, goes high 1 clock with button release
	wire [3:0] cnt;		// used to hook to output of up/dwn counter
	wire [10:0] duty;	// upper 4-bit from your counter, lower 7-bits all zero
	wire nxt_dwn;		// output of combinational logic that determines up vs dwn
	wire PWM;
	
	/////////////////////////////////////
	// Instantiate reset synchronizer //
	///////////////////////////////////
	rst_synch iRST(.RST_n(RST_n), .clk(clk), .rst_n(rst_n));

	///////////////////////////////////////////////
	// Instantiate push button release detector //
	/////////////////////////////////////////////
	PB_rise iPB(.clk(clk), .rst_n(rst_n), .PB(PB), .rise(btn_release));
	

	///////////////////////////////////////////////
	// Instantiate of your 4-bit up/dwn counter //
    /////////////////////////////////////////////
	up_dwn_cnt4 iCNT(.clk(clk), .rst_n(rst_n), .en(btn_release), .up(DIP), .cnt(cnt));
	
    ///////////////////////////////////////////////////////////
	// assign duty to {cnt,zeros}...forms duty input to PDM //
	/////////////////////////////////////////////////////////
	assign duty = {cnt, 7'h0};
	
	/////////////////////////////////////////
	// Instantiate PDM (which is the DUT) //
	///////////////////////////////////////
	PWM11 iDUT(.clk(clk), .rst_n(rst_n), .duty(duty), .PWM_sig(PWM));
	
	/////////////////////////////////////////////////
	// MS 4-bits is cnt for observability, lowest //
	// LED varies in intensity with duty cycle   //
	//////////////////////////////////////////////
	assign LED = {cnt,3'b000,PWM};
	
endmodule

