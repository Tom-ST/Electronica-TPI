module flip_flop_d_rst_en(
	input wire D, rst, en,
	input wire clk,
	output reg Q
);

always @(posedge clk) begin
	if(rst) Q <= 1'b0;
	else if (en) Q <= D;
end

endmodule