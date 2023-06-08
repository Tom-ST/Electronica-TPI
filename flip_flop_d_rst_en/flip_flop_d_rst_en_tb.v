`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module flip_flop_d_rst_en_tb();

parameter DURATION = 10;

reg clk = 0;
always #0.5 clk = ~clk; //cada 0.5 unidades temporales se niega el clk

reg test_D, test_rst, test_en;
wire test_Q;

flip_flop_d_rst_en UUT (//-- Instantiate the unit to test
	.clk(clk),
	.rst(test_rst),
	.D(test_D),
	.Q(test_Q),
	.en(test_en)
);


initial begin
	$dumpfile(`DUMPSTR(`VCD_OUTPUT));//-- File were to store the simulation results
	$dumpvars(0, flip_flop_d_rst_en_tb);
		
		test_en=0;
		test_rst = 0;
		#1
		test_D = 0;
		#5
		test_D = 1;
		#2
		test_rst = 1;
		#2
		test_rst = 0;
		#3
		test_en = 1;
		#7
		test_D = 0;
	
	#(DURATION);
	$finish;
end

endmodule
