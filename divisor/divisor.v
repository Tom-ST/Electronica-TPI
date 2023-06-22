module divisor (
  input wire clk,
  input wire rst,
  input wire [3:0] num,
  input wire [3:0] den,
  output reg [3:0] result, rest,
  output reg done
);

  // Defino los estados
  localparam [1:0] ESPERA = 2'b00;
  localparam [1:0] ERROR = 2'b01;
  localparam [1:0] RESTA = 2'b10;
  localparam [1:0] FIN = 2'b11;


  reg [1:0] state;
  reg [3:0] num_reg;

	
	always @(posedge clk)
	begin
		if(rst)
			begin
				state <= ESPERA;
				result <= 4'b0;
				rest <= 4'b0;
				done <= 0;
				num_reg <= num;
			end
		else
			begin
				case (state)
					ESPERA :
						begin
							if(num>=den && den != 4'b0000)
								begin
									state <= RESTA;
								end
						end
					RESTA:
						begin
							if(num_reg>=den)
								begin
									num_reg <= num_reg - den;
									result++;
									rest <= num_reg - den;
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
