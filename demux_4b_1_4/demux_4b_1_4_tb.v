`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module demux_4b_1_4_tb();

reg clk = 0;
always #0.5 clk = ~clk; //cada 0.5 unidades temporales se niega el clk

reg [1:0] test_sel;
reg [3:0] test_d;
wire [3:0] test_y0, test_y1, test_y2, test_y3;

demux_4b_1_4 UUT (//-- Instantiate the unit to test
	.sel(test_sel),
	.d(test_d),
	.y0(test_y0),
	.y1(test_y1),
	.y2(test_y2),
	.y3(test_y3)
);


initial begin
	$dumpfile(`DUMPSTR(`VCD_OUTPUT));//-- File were to store the simulation results
	$dumpvars(0, demux_4b_1_4_tb);
	#1
	test_sel = 2'b00;
	test_d = 4'b0101;
	#1
	test_sel = 2'b01;
	#1
	test_sel = 2'b10;
	#1
	test_sel = 2'b11;
	#1
	test_sel = 2'b01;
	#2
	
	$finish;
end

endmodule