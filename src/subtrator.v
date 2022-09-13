module subtrator (S, Bout, A, B);

	output [3:0] S;
	output Bout;
	
	input  [3:0]A;
	input  [3:0]B;
	
	wire w0, w1, w2;
	wire h0, h1, h2;
	
	wire [3:0]notB;
	
	full_subtrator f_sub0 (S[0], h0, A[0], B[0], 0);
	full_subtrator f_sub1 (S[1], h1, A[1], B[1], h0);
	full_subtrator f_sub2 (S[2], h2, A[2], B[2], h1);
	full_subtrator f_sub3 (S[3], Bout, A[3], B[3], h2);

	// negativo: -b + 1
	
endmodule 