module contador_4b(
	input wire clk, up, down, enable,
	input rst,
	output reg [3:0] curr_numero
);

reg [3:0] next_numero;

reg enable_btn = 1;

localparam [3:0] 	b00 = 4'b0000,
					b01 = 4'b0001,
					b02 = 4'b0010,
					b03 = 4'b0011,
					b04 = 4'b0100,
					b05 = 4'b0101,
					b06 = 4'b0110,
					b07 = 4'b0111,
					b08 = 4'b1000,
					b09 = 4'b1001,
					b10 = 4'b1010,
					b11 = 4'b1011,
					b12 = 4'b1100,
					b13 = 4'b1101,
					b14 = 4'b1110,
					b15 = 4'b1111;

always @(posedge clk)
	begin
		if (rst) curr_numero <= b00;
		else
		if(up ^ down) begin
			if(enable_btn & enable)
				begin
					curr_numero <= next_numero;
					enable_btn <= 0;
				end
		end else
			enable_btn <=1;
	end

always @*
	case ({down,up,curr_numero})
	 //contando hacia arriba
		{1'b0,1'b1,b00} : next_numero = b01;
		{1'b0,1'b1,b01} : next_numero = b02;
		{1'b0,1'b1,b02} : next_numero = b03;
		{1'b0,1'b1,b03} : next_numero = b04;
		{1'b0,1'b1,b04} : next_numero = b05;
		{1'b0,1'b1,b05} : next_numero = b06;
		{1'b0,1'b1,b06} : next_numero = b07;
		{1'b0,1'b1,b07} : next_numero = b08;
		{1'b0,1'b1,b08} : next_numero = b09;
		{1'b0,1'b1,b09} : next_numero = b10;
		{1'b0,1'b1,b10} : next_numero = b11;
		{1'b0,1'b1,b11} : next_numero = b12;
		{1'b0,1'b1,b12} : next_numero = b13;
		{1'b0,1'b1,b13} : next_numero = b14;
		{1'b0,1'b1,b14} : next_numero = b15;
		{1'b0,1'b1,b15} : next_numero = b00;
	//contando hacia abajo
		{1'b1,1'b0,b00} : next_numero = b15;
		{1'b1,1'b0,b01} : next_numero = b00;
		{1'b1,1'b0,b02} : next_numero = b01;
		{1'b1,1'b0,b03} : next_numero = b02;
		{1'b1,1'b0,b04} : next_numero = b03;
		{1'b1,1'b0,b05} : next_numero = b04;
		{1'b1,1'b0,b06} : next_numero = b05;
		{1'b1,1'b0,b07} : next_numero = b06;
		{1'b1,1'b0,b08} : next_numero = b07;
		{1'b1,1'b0,b09} : next_numero = b08;
		{1'b1,1'b0,b10} : next_numero = b09;
		{1'b1,1'b0,b11} : next_numero = b10;
		{1'b1,1'b0,b12} : next_numero = b11;
		{1'b1,1'b0,b13} : next_numero = b12;
		{1'b1,1'b0,b14} : next_numero = b13;
		{1'b1,1'b0,b15} : next_numero = b14;
		default : next_numero = curr_numero;
	
	endcase



endmodule