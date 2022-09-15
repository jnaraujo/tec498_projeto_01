module comparador(diff, sinal, igual, ate3, errada);

	/*
		decimal	binario (sinal + 4 bits)
		0			0 0000
		1			0 0001
		2			0 0010
		3			0 0011
		
		-1			1 1111
		-2			1 1110
		-3			1 1101
	*/
	
	input [3:0] diff;
	input sinal; // 1 == NEGATIVO
	
	output igual, ate3, errada;
	
	wire notSinal;
	wire notIgual;
	wire p1;
	wire n1, n2, n3;
	wire z0;
	wire w0, w1, w3, w4;
	
	not not0(notSinal, sinal);
	
	nor nor0(z0, diff[0], diff[1], diff[2], diff[3]); // se todos forem 0, entao a tentativa é igual a senha
	and and0(igual, z0, 1); // se for igual, define a saida igual como 1;
	
	// o numero é positivo e a diferença eh de ate 3 unidades
	nor nor1(w0, diff[2], diff[3]); // se nem o bit 2 ou 3 forem 1
	and and1(p1, nor1, notSinal); // bit 3 e 2 são 0 & o sinal é positivo
	
	// o numero é negativo e a diferença eh de ate 3 unidades
	
	not not1(w1, diff[0]);
	not not2(w2, diff[1]);
	not not3(notIgual, igual);
	
	and and2(n1, sinal, diff[3], diff[2], diff[1],  diff[0]); // verifica se o numero eh 11111
	and and3(n2, sinal, diff[3], diff[2], diff[1], w1); // verifica se o numero eh 11110
	and and4(n3, sinal, diff[3], diff[2], diff[1], w2); // verifica se o numero eh 11110
	or or0(w4, p1, n1, n2, n3); // se for ate 3 un
	
	and and5(ate3, w4, notIgual); // ate 3 un & nao for igual
	
endmodule 