module projeto(senha, tentativa, ledG, ledR, diferenca);

	input [3:0]senha;
	input [3:0]tentativa;
	
	output ledG, ledR;
	output [3:0]diferenca; // 000 - 111
	
	diferenca diff0 (diferenca, senha, tentativa);
	
endmodule 