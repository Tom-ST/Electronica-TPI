module reg_paralelo_paralelo_4b(
	input wire [3:0] D,
	output reg [3:0] Q,
	input wire clk, rst, en
);


always @(posedge clk)
    begin
            if(rst)
                    Q <= 4'b0000;
            else if (en)
                    Q <= D;
    end
    endmodule