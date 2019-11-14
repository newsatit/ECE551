module mystery_reset(clk, rst, d, q);

input clk, d, rst;
output wire q;

wire md, mq, sd;

notif1 triOne(md, d, ~clk);
notif1 triTwo(sd, mq, clk);

nor nor1(mq, rst, md), nor2(q, rst, sd);
not(weak0, weak1) weak_inv1(md, mq), weak_inv2(sd, q);

endmodule
