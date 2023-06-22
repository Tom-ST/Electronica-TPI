module divisor (
	input wire clk,
	input wire rst,
	input wire [3:0] num,
	input wire [3:0] den,
	output reg [3:0] result, resto
);

	localparam [1:0] ESPERA = 2'b00;
	localparam [1:0] ERROR = 2'b01;
	localparam [1:0] RESTA = 2'b10;
	localparam [1:0] FIN = 2'b11;


	reg [1:0] state;

	
	always @(posedge clk)
	begin
		if(rst)
			begin
				state <= ESPERA;
				result <= 4'b0;
				resto <= num;
			end
		else
			begin
				case (state)
					ESPERA :
						begin
							if(num==4'b0000 && den != 4'b0000) // Caso especial para cuando el numerador es 0
								begin
									state <= FIN;
									result <= 4'b0000;
									resto <= 4'b0000;
								end
							else //Numerador no es 0
								begin
									if(num>=den && den != 4'b0000) //Si no hay error en los datos, paso a realizar la resta
										state <= RESTA;
									else
										state <= ERROR;
								end
						end
					RESTA:
						begin
							if(resto>=den) //Mientras el resto sea mayor o igual al denominador, puedo seguir restando
								begin
									resto <= resto - den;
									result++;
								end
							else //Cuando el resto es menor al denominador quiere decir que termine de hacer la division
								state <= FIN;
						end
					ERROR : //Cuando el estado es de error, se encienden todos los leds del resultado y del resto
						begin
							result <= 4'b1111;
							resto <= 4'b1111;
						end
				endcase
			end
	end
endmodule
