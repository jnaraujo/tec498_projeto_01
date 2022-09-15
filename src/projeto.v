module projeto(senha, tentativa, led0, led1, led2, segD, A, B, D, E, F, G, DP);
	// led0: quando o cofre é aberto
	// led1: quando a senha é maior ou menor em ate 3 unidades
	// led2: se a senha estiver errada

	// Define as entradas do circuito
	input [3:0] senha; // a senha do cofre
	input [3:0] tentativa; // a senha do usuário para tentar abrir o cofre
	
	// Define as saídas do circuito
	output led0, led1, led2;
	output segD, A, B, D, E, F, G, DP;
	
	// Define os fios
	wire subBOut; // sinal da operação; 1 == negativo
	wire [3:0] diferenca;
	
	subtrator sub0 (
						.S(diferenca),
						.Bout(subBOut),
						.A(senha),
						.B(tentativa)
	);
	
	comparador comp0 (
		.diff(diferenca),
		.sinal(subBOut),
		.igual(led0),
		.ate3(led1),
		.errada(led2)
	);
	
	display display0 (.diff(diferenca),
							.sinal(subBOut),
							.segD(segD),
							.A(A),
							.B(B),
							.C(C),
							.D(D),
							.E(E),
							.F(F),
							.G(G),
							.DP(DP)
	);
endmodule 