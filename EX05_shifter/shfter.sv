module shfter(src, rotate, amt, res);

input [15:0] src;
input rotate;
input [3:0] amt;
output wire [15:0] res;

wire [15:0] shift1 = amt[0] ? {src[14:0], rotate ? src[15] : 1'b0} : src;
wire [15:0] shift2 = amt[1] ? {shift1[13:0], rotate ? shift1[15:14] : 2'b0} : shift1;
wire [15:0] shift4 = amt[2] ? {shift2[11:0], rotate ? shift2[15:12] : 4'b0} : shift2;
assign res = amt[3] ? {shift4[7:0], rotate ? shift4[15:8] : 8'b0} : shift4;

endmodule