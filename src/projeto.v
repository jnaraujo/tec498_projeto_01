module projeto(senha, tentativa, led0, led1, led2, diferenca);
	// led0: quando o cofre é aberto
	// led1: quando a senha é maior ou menor em ate 3 unidades
	// led2: se a senha estiver errada

	input [3:0] senha; // a senha do cofre
	input [3:0] tentativa; // a senha do usuário para tentar abrir o cofre
	
	output led0, led1, led2;
	output [3:0] diferenca;
	
	wire sinal;
	wire maior, menor, igual;
	wire not_igual;
	wire bit3, bit2;
	wire notBit3, notBit2;
	wire nb3_and_nb2;
	
	comparador comp0(senha, tentativa, maior, menor, igual); // verifica A em relação a B: se ele é maior, menor ou igual
	
	not not0(not_igual, igual);
	
	// sinal: 1 = negativo;
	diferenca diff0 (diferenca, sinal, senha, tentativa);
	
	and and0 (led0, igual, 1); // se a senha for correta
		
	// 0011 - 3 digitos
	and and1 (bit3, diferenca[3], 1); // verifica se o 3 bit é 1
	and and2 (bit2, diferenca[2], 1); // verifica se o 2 bit é 1
	
	// inverte o valor do bit3 e bit2
	not(notBit3, bit3);
	not(notBit2, bit2);
	
	and and3 (nb3_and_nb2, notBit3, notBit2); // se algum dos dois for positivo, a diferença entre as duas senhas excede 3 unidades
	and and4 (led1, nb3_and_nb2, not_igual); // se a senha estiver correta, led1 nao eh acionado
	or or0 (led2, bit3, bit2); // se a diferença for maior que 3 unidades, o cofre nao eh aberto
	
endmodule 