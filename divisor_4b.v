`include "mux_4b_4_1/mux_4b_4_1.v"
`include "contador_2b/contador_2b.v"
`include "demux_4b_1_4/demux_4b_1_4.v"
`include "contador_4b/contador_4b.v"
`include "divisor/divisor.v"

module divisor_4b(
	input wire up, down, ok, clk, rst,
	output wire [3:0] leds
	);


wire[3:0] num, den;
wire[3:0] result, resto;
wire [1:0] sel;
wire [3:0] numero_4b;

wire up_inv, down_inv, ok_inv, rst_inv;

assign up_inv = ~up;
assign down_inv = ~down;
assign rst_inv = ~rst;
assign ok_inv = ~ok;

wire enable_cont_num = (sel == 2'b00);
wire enable_cont_den = (sel == 2'b01);

contador_4b contador_4b_num(
	.enable(enable_cont_num),
	.clk(clk),
	.up(up_inv),
	.down(down_inv),
	.rst(rst_inv),
	.curr_numero(num)
);
contador_4b contador_4b_den(
	.enable(enable_cont_den),
	.clk(clk),
	.up(up_inv),
	.down(down_inv),
	.rst(rst_inv),
	.curr_numero(den)
);

// demux_4b_1_4 demux_4b_1_4_0(
	// .sel(sel),
	// .d(numero_4b),
	// .y0(num),
	// .y1(den)
// );


contador_2b contador_2b_0(
	.clk(clk),
	.up(ok_inv),
	.rst(rst_inv),
	.curr_numero(sel)
);

mux_4b_4_1 mux_4b_4_1_a_leds(
	.d0(num),
	.d1(den),
	.d2(result),
	.d3(resto),
	.f(leds),
	.sel(sel)
);
wire rst_div = (sel[1] == 0);
divisor divisor0(
	.clk(clk),
	.rst(rst_div),
	.num(num),
	.den(den),
	.result(result),
	.resto(resto)
);

endmodule