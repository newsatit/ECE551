module desiredDrive_tb();

localparam [11:0] stim_avg_torque [0:5] = {12'h800, 12'h800, 12'h360, 12'h800, 12'h7e0, 12'h7e0};
localparam [4:0] stim_cadence [0:5] = {5'h10, 5'h10, 5'h10, 5'h18, 5'h18, 5'h18};
localparam [12:0] stim_incline [0:5] = {13'h0150, 13'h1f22, 13'h0c0, 13'h1ef0, 13'h0000, 13'h0080};
localparam [1:0] stim_setting [0:5] = {2'b10, 2'b11, 2'b11, 2'b11, 2'b11, 2'b11};
localparam [11:0] expected_target_curr [0:5] = {12'hd79, 12'h158, 12'h0, 12'h0, 12'hb7c, 12'hfff};

reg [11:0] avg_torque;
reg [4:0] cadence_vec; 
reg [12:0] incline;
reg [1:0] setting;
wire [11:0] target_curr;

reg [2:0] i;

desiredDrive iDUT(.avg_torque(avg_torque), .cadence_vec(cadence_vec), .incline(incline), .setting(setting), .target_curr(target_curr));
initial begin
	for (i = 0; i < 6; i = i + 1) begin	
		avg_torque = stim_avg_torque[i];
		cadence_vec = stim_cadence[i];
		incline = stim_incline[i];
		setting = stim_setting[i];
		#5;
		if (target_curr != expected_target_curr[i]) begin
			$display("Test %d failed expected: %h, actual: %h", i+1, expected_target_curr[i], target_curr);
			$stop();
		end
		$display("Test %d passed expected: %h, actual: %h", i+1, expected_target_curr[i], target_curr);
		
	end
	$display("Tests Passed!!!");
end

endmodule
