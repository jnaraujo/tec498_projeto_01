module meio_subtrator(S, Bout, A, B);
	input A, B;
   output S, Bout;
	
   wire NOT_A;
	
	not not0(NOT_A, A);
	and and0(Bout, NOT_A, B);
	xor xor0(S, A, B);
	
endmodule 