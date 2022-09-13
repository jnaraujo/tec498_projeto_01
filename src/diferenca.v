module diferenca(S, A, B);
	input [3:0] A;
	input [3:0] B;
	
	output [3:0] S;
	output sinal;
	
	wire maior, menor, igual;
	wire [3:0] resSub;
	wire [3:0] resXor;
	wire sub_bout;
	
	comparador comp0(A, B, maior, menor, igual); // verifica A em relação a B: se ele é maior, menor ou igual
	
	subtrator sub0(resSub, sub_bout, A, B); // subtrai B de A
	
	xor xor0(resXor[0], resSub[0], menor);
	xor xor1(resXor[1], resSub[1], menor);
	xor xor2(resXor[2], resSub[2], menor);
	xor xor3(resXor[3], resSub[3], menor);
	
	adder(S, resXor, menor, 0);
endmodule 