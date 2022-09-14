module full_subtrator(S, Bout, A, B, Bin);
	input A, B, Bin;
   output S, Bout;
	
   wire w0, w1, w2;
	
	meio_subtrator m_sub0(w0, w1, A, B);
	
	meio_subtrator m_sub1(S, w2, w0, Bin);
	
	or or0(Bout, w1, w2);
	
endmodule 