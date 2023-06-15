module inversor(
	input wire inv_in,
	output wire inv_out
);

assign inv_out = ~inv_in;

endmodule