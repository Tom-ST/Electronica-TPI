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

reg [3:0] test_A;
reg [3:0] test_B;
wire [3:0] test_S;
wire [3:0] test_R;
reg test_rst;

//-- Instantiate the unit to test
divisor UUT(
			.clk(clk),
			.rst(test_rst),
			.A(test_A),
			.B(test_B),
			.S(test_S),
			.R(test_R)
			);

initial begin

//-- File were to store the simulation result
$dumpfile(`DUMPSTR(`VCD_OUTPUT));
$dumpvars(0, divisor_tb);
	test_A = 14;
	test_B = 3;
	#1
	test_rst = 1'b1;
	#1
	test_rst = 1'b0;
	#10
	
	$finish;
	
	#(DURATION) $display("End of Simulation");
	$finish;
	
end

endmodule