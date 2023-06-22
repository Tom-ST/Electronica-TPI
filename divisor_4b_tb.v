`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module divisor_4b_tb();

reg clk = 0;
always #0.5 clk = ~clk; //cada 0.5 unidades temporales se niega el clk

reg test_rst, test_down, test_up, test_ok;
wire [3:0] test_leds;

divisor_4b UUT (//-- Instantiate the unit to test
	.clk(clk),
	.rst(test_rst),
	.down(test_down),
	.up(test_up),
	.ok(test_ok),
	.leds(test_leds)
);


initial begin
	$dumpfile(`DUMPSTR(`VCD_OUTPUT));//-- File were to store the simulation results
	$dumpvars(0, divisor_4b_tb);
	
	
	test_rst=1'b0;
	#1
	test_rst=1'b1;
	#1
	test_up = 0;
	test_down = 1;
	#1
	test_up = 1;
	#1
	test_up = 0;
	#1
	test_up = 1;
	#1
	test_up = 0;
	#1
	test_up = 1;
	#1
	test_up = 0;
	#1
	test_up = 1;
	#5
	test_ok = 1'b0;
	#1
	test_ok = 1'b1;
	#1
	//cargo denominador
	test_up = 0;
	#1
	test_up = 1;
	#1
	test_up = 0;
	#1
	test_up = 1;
	#1
	test_up = 0;
	#1
	test_up = 1;
	#1
	test_up = 0;
	#1
	test_up = 1;
	#1
	test_down = 0;
	#1
	test_down = 1;
	#1
	test_ok = 1'b0;
	#1
	test_ok = 1'b1;
	#5
	test_ok = 1'b0;
	#1
	test_ok = 1'b1;
	#1
	test_rst = 0;
	#1
	test_rst = 1;
	#1
	test_ok = 1'b0;
	#1
	test_ok = 1'b1;
	#3
	
	$finish;
end

endmodule