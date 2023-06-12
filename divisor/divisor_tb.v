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

reg [3:0] test_A_in;
reg [3:0] test_B_in;
wire [3:0] test_S_out;
wire [3:0] test_R_out;
reg test_rst;

//-- Instantiate the unit to test
divisor UUT(
			.clk(clk),
			.reset(test_rst),
			.A(test_A_in),
			.B(test_B_in),
			.S(test_S_out),
			.R(test_R_out)
			);

initial begin

//-- File were to store the simulation result
$dumpfile(`DUMPSTR(`VCD_OUTPUT));
$dumpvars(0, divisor_tb);

		test_A_in = 15;
		test_B_in = 3;


	
	
	test_rst=1'b1;
	#5
	test_rst=1'b0;
	#5
	test_rst=1'b1;
	#5
	test_rst=1'b0;
	#5
	test_rst=1'b1;
	#5
	test_rst=1'b0;
	#5
	test_rst=1'b1;
	#5
	test_rst=1'b0;
	#5
		test_rst=1'b1;
	#5
	test_rst=1'b0;
	#5
	test_rst=1'b1;
	#5
	test_rst=1'b0;
	#5
	
	$finish;
	
	#(DURATION) $display("End of Simulation");
	$finish;
	
end

endmodule