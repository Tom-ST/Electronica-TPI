module divisor(
	input wire clk,
	input wire reset,
	input wire [3:0] A,
	input wire [3:0] B,
	input wire [1:0]Enable,
	output reg [3:0] S,
	output reg [3:0] R
);

localparam [1:0] S0= 2'b00, S1= 2'b01;
	
reg [1:0] state, nextstate;

reg [3:0] resto;
reg [3:0] contador=0;
reg bandera = 0;

always @(posedge clk, posedge reset)
	begin	
		if(reset || Enable== 2'b10)
			begin 
				state <=S0;

			end
		else	
			begin 
				state <= nextstate; 
			end
	end

always @*
		begin
			if (Enable== 2'b10 && bandera==0)
				begin
					resto=A;
					bandera=1;
				end
					nextstate = state;
				case(state)
					S0: if(clk && resto>=B)
							begin
							resto= resto - B;
							contador=contador+1;
							nextstate=S0;
							end
						else if (clk && resto<B)
							begin
							 S=contador;	
							 R=resto;
							 nextstate=S1;
							end
					default:
							nextstate=state;
				endcase
		end


endmodule	
	
