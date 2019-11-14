module mystery(clk, d, q);

input clk, d;
output wire q;

wire md, mq, sd;

notif1 #1 triOne(md, d, ~clk);
notif1 #1 triTwo(sd, mq, clk);

not inv1(mq, md), inv2(q, sd);
not(weak0, weak1) weak_inv1(md, mq), weak_inv2(sd, q);

endmodule
