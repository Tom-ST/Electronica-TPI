module mux_4b_4_1(
	input wire [1:0] sel,
	input wire [3:0] d3, d2, d1, d0,
	output reg [3:0] f
);

	always @(d3 or d2 or d1 or d0 or sel)
		case (sel)
			2'b00 : f = d0;
			2'b01 : f = d1;
			2'b10 : f = d2;
			2'b11 : f = d3;
		endcase
	
endmodule