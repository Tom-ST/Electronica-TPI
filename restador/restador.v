module restador(

	input  wire [3:0] A, B,
	output wire [3:0] S,
	output wire Cout
    );

	//////////////////////// B0
	wire S0;
	wire Cin0;
	wire Cout0;
	
	assign Cin0=0;
	
	assign S0= (~(A[0] ^ B[0]) & Cin0) | 
				((A[0]^B[0]) & ~Cin0); 
	
	assign Cout0= (~A[0] & B[0]) | 
					(~A[0] & Cin0) |
					(B[0] & Cin0); 
	
	//////////////////B1
	wire S1;
	wire Cin1;
	wire Cout1;
	
	assign Cin1 = Cout0;

	assign S1= (~(A[1] ^ B[1]) & Cin1) | 
				((A[1]^B[1]) & ~Cin1); 
	
	assign Cout1= (~A[1] & B[1]) | 
					(~A[1] & Cin1) |
					(B[1] & Cin1); 
	
	
	//////////////////B2
	wire S2;
	wire Cin2;
	wire Cout2;
	
	assign Cin2 = Cout1;
	
	assign S2= (~(A[2] ^ B[2]) & Cin2) | 
				((A[2]^B[2]) & ~Cin2); 
	
	assign Cout2= (~A[2] & B[2]) | 
					(~A[2] & Cin2) |
					(B[2] & Cin2); 
	
	//////////////////B3
	
	
	wire S3;
	wire Cin3;

	assign Cin3 = Cout2;

	assign S3= (~(A[3] ^ B[3]) & Cin3) | 
				((A[3] ^ B[3]) & ~Cin3); 
	
	
	
	
	assign S[0]=S0;
	assign S[1]=S1;
	assign S[2]=S2;
	assign S[3]=S3;
	
	assign Cout= (~A[3] & B[3]) | 
					(~A[3] & Cin3) |
					(B[3] & Cin3); 
	
		
endmodule