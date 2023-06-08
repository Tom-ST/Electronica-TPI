`include "mux_4b_4_1/mux_4b_4_1.v"
`include "contador_2b/contador_2b.v"


module divisor_4b(
	input wire up, down, ok, clk, rst,
	output wire [3:0] leds
	);

wire [3:0] num, den, result, rest;
wire [1:0] sel;

//para probar
assign num = 4'b0001;
assign den = 4'b0010;
assign result = 4'b0100;
assign rest = 4'b1000;
//fin para probar


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