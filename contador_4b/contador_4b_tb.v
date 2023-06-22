`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module contador_4b_tb();

reg clk = 0;
always #0.5 clk = ~clk; //cada 0.5 unidades temporales se niega el clk

reg test_rst, test_down, test_up, test_enable;
wire test_numero;

contador_4b UUT (//-- Instantiate the unit to test
	.clk(clk),
	.rst(test_rst),
	.down(test_down),
	.up(test_up)
);


initial begin
	$dumpfile(`DUMPSTR(`VCD_OUTPUT));//-- File were to store the simulation results
	$dumpvars(0, contador_4b_tb);
	test_enable = 1'b1;
	test_up = 1'b0;
	test_down = 1'b0;
	test_rst=1'b1;
	#1
	test_rst=1'b0;
	#1
	test_up = 1'b1;
	test_down =1'b1;
	#2
	test_down = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#1
	test_up = 1'b1;
	#1
	test_up = 1'b0;
	#5
	test_rst=1'b1;
	#1
	test_rst=1'b0;
	#20
	test_up = 1'b0;
	#1
	test_down = 1'b1;
	#1
	test_down = 1'b0;
	#1
	test_down = 1'b1;
	#1
	test_down = 1'b0;
	#1
	test_down = 1'b1;
	#1
	test_down = 1'b0;
	#1
	test_down = 1'b1;
	#1
	test_down = 1'b0;
	#1
	test_down = 1'b1;
	#1
	test_down = 1'b0;
	#1
	test_down = 1'b1;
	#1
	test_down = 1'b0;
	#1
	test_down = 1'b1;
	#1
	test_down = 1'b0;
	#1
	test_down = 1'b1;
	#1
	test_down = 1'b0;
	#1
	test_down = 1'b1;
	#1
	test_down = 1'b0;
	#22
	test_rst=1'b1;
	#1
	test_rst=1'b0;
	#5
	test_up = 1'b0;
	test_down = 1'b0;
	#10
	test_up = 1'b0;
	test_down = 1'b1;
	#20
	
	$finish;
end

endmodule