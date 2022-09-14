module adder(S, A, B, Cin);
	output [4:0] S;
	
	input  [3:0]A;
	input  [3:0]B;
	input  Cin;
	
	wire w1, w2, w3;
	
	halfAdder C1 (S[0], w1, A[0], B[0], Cin);
	
	halfAdder C2 (S[1], w2, A[1], B[1], w1);
    
	halfAdder C3 (S[2], w3, A[2], B[2], w2);
 
	halfAdder C4 (S[3], S[4], A[3], B[3], w3);	
	 
endmodule 