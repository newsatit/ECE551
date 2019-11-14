module telemetry(batt_v, avg_curr, avg_torque, clk, rst_n, TX);

input [11:0] batt_v;
input [11:0] avg_curr;
input [11:0] avg_torque;
input clk, rst_n;
output wire TX;

// input for UART_tx
reg trmt;
wire [7:0] tx_data;
// output for UART_tx
wire tx_done;

UART_tx uart_tx(.clk(clk),.rst_n(rst_n),.TX(TX),.trmt(trmt),.tx_data(tx_data),.tx_done(tx_done));

logic [7:0] delim1 = 8'hAA;
logic [7:0] delim2 = 8'h55;
logic [7:0] payload1;
assign payload1 = {4'h0, batt_v[11:8]};
logic [7:0] payload2;
assign payload2 = batt_v[7:0];
logic [7:0] payload3;
assign payload3 = {4'h0, avg_curr[11:8]};
logic [7:0] payload4;
assign payload4 = avg_curr[7:0];
logic [7:0] payload5;
assign payload5 = {4'h0, avg_torque[11:8]};
logic [7:0] payload6;
assign payload6 = avg_torque[7:0];
logic [63:0] data;

// counter for 1/48th second
// (50*10^6)/47.68 = 2^20
// 20 bits counter is needed
reg [19:0] cnt;
always@(posedge clk, negedge rst_n) 
	if (!rst_n)
		cnt <= 20'h00000;
	else 
		cnt <= cnt + 1;
assign time_out = &cnt;

// counter for 8 bytes to send
// keep rotating the data until all 8 bytes are transmitted
reg [2:0] shft_cnt;
reg clr, shft;
assign shft_done = &shft_cnt;
assign tx_data = data[63:56];
always@(posedge clk, negedge rst_n) 
	if (!rst_n || clr) begin
		shft_cnt <= 3'h0;
		data <= {delim1, delim2, payload1, payload2, payload3, payload4, payload5, payload6};
	end
	else if (shft) begin
		shft_cnt <= shft_cnt + 1;
		data <= {data[55:00], data[63:56]}; // rotate left
	end

// State Machine
typedef enum reg [1:0] {START, WAIT, IDLE} state_t;
state_t state, nxt_state;
always@(posedge clk, negedge rst_n)
	if (!rst_n)
		state <= START;
	else	
		state <= nxt_state;
		
// next state logic
always_comb begin
	clr = 0;
	shft = 0;
	trmt = 0;
	case(state)
		START: begin
			nxt_state = WAIT;
			trmt = 1;
		end
		WAIT: begin 
			nxt_state = WAIT;
			if (tx_done)
				if (shft_done)
					nxt_state = IDLE;
				else begin
					nxt_state = START;
					shft = 1;
				end
		end
		IDLE: begin
			nxt_state = IDLE;
			if (time_out) begin
				clr = 1;
				nxt_state = START;
			end
		end
		default: nxt_state = START;	
	endcase
end
endmodule
