module flip_flop_d_rst(
	input wire D, rst,
	input wire clk,
	output reg Q
);

always @(posedge clk or posedge rst) begin
	if(rst) Q <= 1'b0;
	else Q <= D;
end

endmodule