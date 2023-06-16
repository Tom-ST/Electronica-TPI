module divisor(
	input wire clk, rst,
	input wire [3:0] A,
	input wire [3:0] B,
	output reg [3:0] S,
	output reg [3:0] R
);
	
	
localparam [1:0] 
	espera = 2'b00,
	error = 2'b01,
	resta = 2'b10,
	fin = 2'b11;
	
reg [1:0] state, next_state;
reg [3:0] A_reg, next_A, iteracion;


always @(posedge clk)
	begin	
		if(rst)
			begin 
				state <= espera;
			end
		else
			begin
				A_reg <= next_A;
				state <= next_state;
			end
	end


always @*
	case(state)
		espera :
			begin
				if(A < B | B == 0) 
					next_state <= error;
				else 
					next_state <= resta;
					next_A <= A;
					iteracion <= 0;
			end
		 resta :		
			if(A_reg < B)
				next_state <= fin;
			else
				begin
					next_state <= resta;
					next_A <= A_reg-B;
					iteracion++;
				end
		fin :
			begin
				next_state <= fin;
				next_A <= R;
				S <= iteracion;
				R <= A_reg;
			end
	endcase
endmodule