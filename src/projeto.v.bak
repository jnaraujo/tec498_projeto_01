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
	
	not not0(not_igual, igual);
	
	// sinal: 1 = negativo;
	diferenca diff0 (diferenca, sinal, senha, tentativa);
	
	and and0 (led0, igual, 1); // se a senha for correta
	
endmodule 