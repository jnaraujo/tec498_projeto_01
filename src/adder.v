module adder(S, Cout, A, B, Cin);
	// Define a saída do circuito
	output [3:0] S;
	output Cout;
	
	// Define as entradas do circuito
	input  [3:0] A;
	input  [3:0] B;
	input  Cin;
	
	wire w1, w2, w3;
	
	adder_1bit adder0 (S[0], w1, A[0], B[0], Cin); // meio-somador para o bit 0
	
	adder_1bit adder1 (S[1], w2, A[1], B[1], w1); // meio-somador para o bit 1
    
	adder_1bit adder2 (S[2], w3, A[2], B[2], w2); // meio-somador para o bit 2
 
	adder_1bit adder3 (S[3], Cout, A[3], B[3], w3); // meio-somador para o bit 3
	
endmodule 