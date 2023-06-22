`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns 

//timescale <time_unit> / <time_precision>

module divisor_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk =0;
always #0.5 clk = ~clk;

reg [3:0] test_num;
reg [3:0] test_den;
wire [3:0] test_result;
wire [3:0] test_resto;
reg test_rst;

//-- Instantiate the unit to test
divisor UUT(
			.clk(clk),
			.rst(test_rst),
			.num(test_num),
			.den(test_den),
			.result(test_result),
			.resto(test_resto)
			);

initial begin

//-- File were to store the simulation result
$dumpfile(`DUMPSTR(`VCD_OUTPUT));
$dumpvars(0, divisor_tb);
	
	
	test_num = 15;
	test_den = 3;
	
	test_rst=1'b1;
	#1
	test_rst=1'b0;
	#10
	test_num = 2;
	test_den = 3;
	
	test_rst=1'b1;
	#1
	test_rst=1'b0;
	#10
	test_num = 0;
	test_den = 5;
	
	test_rst=1'b1;
	#1
	test_rst=1'b0;
	#10
	

	
	$finish;
	
	#(DURATION) $display("End of Simulation");
	$finish;
	
end

endmodule