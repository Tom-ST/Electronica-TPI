`include "../flip_flop_d_rst/flip_flop_d_rst.v"

module reg_paralelo_paralelo_4b(
	input wire [3:0] D,
	output wire [3:0] Q,
	input wire clk, rst
);

flip_flop_d_rst flip_flop_d_rst_3(
	.D(D[3]),
	.Q(Q[3]),
	.clk(clk),
	.rst(rst)
);

flip_flop_d_rst flip_flop_d_rst_2(
	.D(D[2]),
	.Q(Q[2]),
	.clk(clk),
	.rst(rst)
);

flip_flop_d_rst flip_flop_d_rst_1(
	.D(D[1]),
	.Q(Q[1]),
	.clk(clk),
	.rst(rst)
);

flip_flop_d_rst flip_flop_d_rst_0(
	.D(D[0]),
	.Q(Q[0]),
	.clk(clk),
	.rst(rst)
);


endmodule