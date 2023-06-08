`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns 

//timescale <time_unit> / <time_precision>

module mayorigual_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk =0;
always #0.5 clk = ~clk;

reg [3:0] test_A_in;
reg [3:0] test_B_in;
wire test_D_out;


//-- Instantiate the unit to test
mayorigual UUT(
			.A(test_A_in),
			.B(test_B_in),
			.D(test_D_out)
			);


initial begin

//-- File were to store the simulation result
$dumpfile(`DUMPSTR(`VCD_OUTPUT));
$dumpvars(0, mayorigual_tb);

		test_A_in = 12;
		test_B_in = 4;
	
	#(DURATION) $display("End of Simulation");
	$finish;
	
end

endmodule