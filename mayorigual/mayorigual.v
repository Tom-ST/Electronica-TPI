module mayorigual(

	input wire [3:0] A,
	input wire [3:0] B,
	output wire D
	);
	
	assign D =(	~(A[0] ^ B[0]) 	& 
					~(A[1] ^ B[1])	&
					~(A[2] ^ B[2])	&
					~(A[3] ^ B[3])	) |
					
				(	(A[3] & ~B[3]) 	| 
					(~(A[3] ^ B[3]) & A[2] & ~B[2])	|
					(~(A[3] ^ B[3]) & ~(A[2] ^ B[2]) & A[1] & ~B[1])	|
					(~(A[3] ^ B[3]) & ~(A[2] ^ B[2]) & ~(A[1] ^ B[1])  & A[0] & ~B[0])	);
				
				
	endmodule