module demux_4b_1_4(
	input wire [1:0] sel,
	input wire [3:0] d,
	output reg [3:0] y0, y1, y2, y3
);
always @(sel or d)
	case (sel)
		2'b00 : y0 = d;
		2'b01 : y1 = d;
		2'b10 : y2 = d;
		2'b11 : y3 = d;
	endcase
endmodule