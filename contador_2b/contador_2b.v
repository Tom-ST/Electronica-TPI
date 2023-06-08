module contador_2b(
	input wire clk, up,
	input rst,
	output reg [1:0] curr_numero
);

reg [1:0] next_numero;
localparam [1:0] 	b0 = 4'b00,
					b1 = 4'b01,
					b2 = 4'b10,
					b3 = 4'b11;

reg enable_up = 1; // enable para cuando se suelta el boton 


always @(posedge clk) begin

	if (rst) curr_numero <= b0;

	if(up) begin
		if(enable_up)
			begin
				curr_numero <= next_numero;
				enable_up <= 0;
			end
	end else
		enable_up <= 1;
end

always @*
	case ({up,curr_numero})
	 //contando hacia arriba
		{1'b1,b0} : next_numero = b1;
		{1'b1,b1} : next_numero = b2;
		{1'b1,b2} : next_numero = b3;
		{1'b1,b3} : next_numero = b0;
		default : next_numero = curr_numero;
	
	endcase



endmodule