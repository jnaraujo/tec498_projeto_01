module adder_1bit( S, Cout, A, B, Cin);
	// define as entradas
   input A, B, Cin;
	
	// define as saidas
   output S, Cout;
	
	// define os fios
   wire A_XOR_B, A_AND_B;
	wire w0;
 
   xor xor0 (A_XOR_B, A, B);
   and and0(A_AND_B, A, B);
   and and1(w0, A_XOR_B, Cin);
   or or0(Cout, A_AND_B, w0);
   xor xor1 (S, A_XOR_B, Cin);
endmodule 