module divisor (
  input wire clk,
  input wire reset,
  input wire [3:0] numerator,
  input wire [3:0] denominator,
  output reg [3:0] result, rest,
  output reg done
);

  // Define the states
  localparam [1:0] WAIT = 2'b00;
  localparam [1:0] ERROR = 2'b01;
  localparam [1:0] OPERATION = 2'b10;
  localparam [1:0] END = 2'b11;

  // Define the signals and registers
  reg [1:0] state;
  reg [3:0] count;
  reg [3:0] num_reg;


	
	always @(posedge clk)
	begin
		if(reset)
			begin
				state <= WAIT;
				result <= 4'b0;
				rest <= 4'b0;
				done <= 0;
				num_reg <= numerator;
			end
		else
			begin
				case (state)
					WAIT :
						begin
							if(numerator>=denominator && denominator != 4'b0000)
								begin
									state <= OPERATION;
								end
						end
					OPERATION:
						begin
							if(num_reg>=denominator)
								begin
									num_reg <= num_reg - denominator;
									result++;
									rest <= num_reg - denominator;
									done <=0;
								end
							else
								begin
									done <= 1;
								end
						end
				endcase
			end
	end
endmodule
