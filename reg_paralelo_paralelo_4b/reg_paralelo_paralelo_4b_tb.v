`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module reg_paralelo_paralelo_4b_tb();

reg clk = 0;
always #0.5 clk = ~clk; //cada 0.5 unidades temporales se niega el clk

reg [3:0] test_D;
reg test_rst;
wire [3:0] test_Q;

reg_paralelo_paralelo_4b UUT (//-- Instantiate the unit to test
	.clk(clk),
	.D(test_D),
	.Q(test_Q),
	.rst(test_rst)
);


initial begin
	$dumpfile(`DUMPSTR(`VCD_OUTPUT));//-- File were to store the simulation results
	$dumpvars(0, reg_paralelo_paralelo_4b_tb);
	
	test_D = 4'b1011;
	test_rst = 1'b1;
	#1
	test_rst = 1'b0;

	#3
	test_D = 4'b0011;
	#3;
	#5
	$finish;
end

endmodule