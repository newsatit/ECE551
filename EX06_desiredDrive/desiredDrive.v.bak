module desiredDrive(avg_torque, cadence_vec, incline, setting, target_curr);

input [11:0] avg_torque;
input [4:0] cadence_vec;
input [12:0] incline;
input [1:0] setting;
output [11:0] target_curr;

wire [9:0] incline_sat = 
		(incline[12] && !(&incline[11:9])) ? // negative saturate
			{2'b10, 8'h00} :
		(!incline[12] && (|incline[11:9])) ? // positve saturate
			{2'b01, 8'hff} : 
		incline[9:0];	

wire [10:0] incline_factor = {incline_sat[9], incline_sat} + 11'd256;

wire [8:0] incline_lim = (incline_factor[10]) ? // is negative
				9'b0 : 
			(incline_factor[9]) ? // is > 511
				9'd511 : incline_factor[8:0];

wire [5:0] cadence_factor = (|cadence_vec[4:1]) ? // cadence_vec > 1
				cadence_vec + 6'd32 : 5'b0; 

localparam [11:0] TORQUE_MIN = 12'h380;
wire [12:0] torque_off = avg_torque - TORQUE_MIN; // ?????

wire [11:0] torque_pos = (torque_off[12]) ? 11'h0 : torque_off[11:0];

wire [28:0] assist_prod = torque_pos*incline_lim*cadence_factor*setting;

assign target_curr = (|assist_prod[28:26]) ? // any of assist_prod[28:26] are set
			12'hFFF : assist_prod[25:14];

endmodule
