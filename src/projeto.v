module projeto(senha, tentativa, led0, led1, led2, diferenca);
	// led0: quando o cofre é aberto
	// led1: quando a senha é maior ou menor em ate 3 unidades
	// led2: se a senha estiver errada

	// Define as entradas do circuito
	input [3:0] senha; // a senha do cofre
	input [3:0] tentativa; // a senha do usuário para tentar abrir o cofre
	
	// Define as saídas do circuito
	output led0, led1, led2;
	output [3:0] diferenca;
	
	// Define os fios
	wire subBOut; // sinal da operação; 1 == negativo
	
	subtrator sub0 (
						.S(diferenca),
						.Bout(subBOut),
						.A(senha),
						.B(tentativa)
	);
	
	
	
endmodule 