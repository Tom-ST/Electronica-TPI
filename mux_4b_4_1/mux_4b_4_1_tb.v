`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module mux_4b_4_1_tb();

reg  [3:0] test_d3, test_d2, test_d1, test_d0;
reg [1:0] test_sel;
wire [3:0] test_f;

mux_4b_4_1 UUT (//-- Instantiate the unit to test
	.d3(test_d3),
	.d2(test_d2),
	.d1(test_d1),
	.d0(test_d0),
	.sel(test_sel),
	.f(test_f)
);

integer i, j;
reg[3:0] i_b;

initial begin
	$dumpfile(`DUMPSTR(`VCD_OUTPUT));//-- File were to store the simulation results
	$dumpvars(0, mux_4b_4_1_tb);
	
	test_d0 = 4'b0010;
	test_d1 = 4'b1001;
	test_d2 = 4'b0110;
	test_d3 = 4'b1011;
	
	test_sel = 00;
	#1
	test_sel = 01;
	#1
	test_sel = 10;
	#1
	test_sel = 11;
	#1

		
	#2
	$finish;
end

endmodule
