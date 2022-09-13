module projeto(senha, tentativa, ledG, ledR, diferenca);

	input [3:0]senha;
	input [3:0]tentativa;
	
	output ledG, ledR;
	output [3:0]diferenca; // 000 - 111
	
	wire sinal;
	
	// sinal: 1 = negativo;
	diferenca diff0 (diferenca, sinal, senha, tentativa);
	
endmodule 