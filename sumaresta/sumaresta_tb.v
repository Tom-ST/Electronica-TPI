`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns 

//timescale <time_unit> / <time_precision>

module sumaresta_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk =0;
always #0.5 clk = ~clk;

reg [1:0] test_A_in;
reg [3:0] test_Q_in;
wire [3:0] test_D_out;


//-- Instantiate the unit to test
sumaresta UUT(
			.A(test_A_in),
			.Q(test_Q_in),
			.D(test_D_out)
			);

integer i;

initial begin

//-- File were to store the simulation result
$dumpfile(`DUMPSTR(`VCD_OUTPUT));
$dumpvars(0, sumaresta_tb);

		test_A_in = 2;

	for	(i=0; i<16; i=i+1)
	begin
		$display ("current loop # %0d", i);
		
		#2

		test_Q_in = i;
	end

	#(DURATION) $display("End of Simulation");
	$finish;
	
end

endmodule