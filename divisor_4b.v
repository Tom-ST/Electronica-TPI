`include "mux_4b_4_1/mux_4b_4_1.v"
`include "contador_2b/contador_2b.v"
`include "demux_4b_1_4/demux_4b_1_4.v"
`include "contador_4b/contador_4b.v"

module divisor_4b(
	input wire up, down, ok, clk, rst,
	output wire [3:0] leds
	);


wire[3:0] num, den;
wire[3:0] result, rest;
wire [1:0] sel;
wire [3:0] numero_4b;

//para probar
assign result = 4'b0111;
assign rest = 4'b1000;
//fin para probar

wire rst_contador_4b = ok | rst;

contador_4b contador_4b_0(
	.clk(clk),
	.up(up),
	.down(down),
	.rst(rst_contador_4b),
	.curr_numero(numero_4b)
);

demux_4b_1_4 demux_4b_1_4_0(
	.sel(sel),
	.d(numero_4b),
	.y0(num),
	.y1(den)
);


contador_2b contador_2b_0(
	.clk(clk),
	.up(ok),
	.rst(rst),
	.curr_numero(sel)
);

mux_4b_4_1 mux_4b_4_1_a_leds(
	.d0(num),
	.d1(den),
	.d2(result),
	.d3(rest),
	.f(leds),
	.sel(sel)
);

endmodule