module comparador1bit(A, B, opt, maior, menor, igual);
	input A, B, opt;
	output maior, menor, igual;
	
	wire w1, w2, w3;
	wire notB, notA;
	
	xnor(w1, A, B);
	and(igual, opt, w1);
	
	not(notB, B);
	and(w2, A, notB);
	and(maior, opt, w2);
	
	not(notA, A);
	and(w3, notA, B);
	and(menor, opt, w3);
endmodule 