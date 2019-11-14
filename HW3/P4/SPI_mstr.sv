// TODO: rd_data, 50 MHz
module SPI_mstr(clk, rst_n, SS_n, SCLK, MOSI, MISO, wrt, cmd, done, rd_data);

input clk, rst_n;
output logic SS_n, SCLK, MOSI;
input MISO;
input wrt;
input [15:0] cmd;
output logic done;
output [15:0] rd_data;

// input signal for State Machine
logic neg, pos, done15;

// output signal for State Machine
logic smpl, init, shft, ld_sclk, set_done;


// SCLK logic
logic [5:0] sclk_div;
always_ff@(posedge clk)
	if (ld_sclk)
		sclk_div <= 6'b110000;
	else
		sclk_div <= sclk_div + 1;
assign SCLK = sclk_div[5];
assign pos = sclk_div == 6'b011111;
assign neg = sclk_div == 6'b111111;


// MISO sampling data path
logic MISO_smpl;
always_ff@(posedge clk)
	if (smpl)
		MISO_smpl <= MISO;

// Shift register data path
logic [15:0] shift_reg;
always_ff@(posedge clk)
	if (init)
		shift_reg <= cmd;
	else if(shft)
		shift_reg <= {shift_reg[14:0], MISO_smpl};
assign MOSI = shift_reg[15];
assign rd_data = shift_reg;


// counter
logic [3:0] bit_cntr;
always_ff@(posedge clk)
	if (init)
		bit_cntr <= 4'b0000;
	else if(shft)
		bit_cntr <= bit_cntr + 1;
assign done15 = &bit_cntr;




// State Machine
typedef enum reg[1:0]{IDLE, FRONT, SHIFT, BACK} state_t;
state_t state, nxt_state;
always_ff@(posedge clk, negedge rst_n)
	if (!rst_n)
		state <= IDLE;
	else 
		state <= nxt_state;

always_comb begin
	smpl = 0;
	shft = 0;
	ld_sclk = 0;
	init = 0;
	set_done = 0;
	nxt_state = state;
	case (state)
		IDLE: if (wrt) begin 
			ld_sclk = 1;
			nxt_state = FRONT;
		end
		FRONT: if (neg) begin
			init = 1;
			nxt_state = SHIFT;
		end
		SHIFT: if (done15) begin
			nxt_state = BACK;
		end else if (neg) begin
			shft = 1;
			nxt_state = SHIFT;
		end else if (pos) begin
			smpl = 1;
			nxt_state = SHIFT;
		end
		BACK: if (pos) begin
			smpl = 1;
			nxt_state = BACK;
		end else if (neg) begin
			nxt_state = IDLE;
			ld_sclk = 1; // to make to sclk high after done
			set_done = 1;
			shft = 1;
		end
		default: nxt_state = IDLE;
	endcase	
end

// done signal
always_ff@(posedge clk, rst_n)
	if (!rst_n)
		done <= 1'b0;
	else if (init)
		done <= 1'b0;
	else if (set_done)
		done <= 1'b1;	


// SS_n signal
logic pst_n = rst_n;
always_ff@(posedge clk, pst_n)
	if (!pst_n)
		SS_n <= 1'b1;
	else if (init)
		SS_n <= 1'b0;
	else if (set_done)
		SS_n <= 1'b1;

endmodule
