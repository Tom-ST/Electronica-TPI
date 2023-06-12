module divisor(
	input wire clk,
	input wire reset,
	input wire [3:0] A,
	input wire [3:0] B,
	output wire [3:0] S,
	output wire [3:0] R
);

localparam [1:0] S0= 2'b00, S1= 2'b01;
	
reg [1:0] state, nextstate;

reg [3:0] resto;
reg [3:0] contador=0;
reg bandera=0;

always @(posedge clk, posedge reset)
	begin	
		if(reset)
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
			if (bandera==0)
				begin
					resto=A;
					bandera=1;
				end
					nextstate = state;
				case(state)
					S0: if(resto>B)
							nextstate=S0;
						else
							nextstate=S1;			
					default:
							nextstate=state;
				endcase
		end


always @*
		begin
			nextstate = state;
				
			case(state)
					S0: if(clk && resto>0)
							begin
								resto= resto - B;
								contador=contador+1;
							end
			endcase
		end

assign S=contador;	
assign R=resto;

endmodule	
	