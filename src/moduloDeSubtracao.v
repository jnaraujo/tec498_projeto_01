/*
	Para realizar a subtração, este modulo soma A ao complemento de 2 em B.
	O complemento de 2 em B é obtido invertendo os bits e somando 1.

	A - B = A + (B' + 1)
*/

module moduloDeSubtracao(S, Bout, A, B);
	// Define as saídas do circuito
	output [3:0] S;
	output Bout;
	
	// Define as entradas do circuito
	input  [3:0]A;
	input  [3:0]B;
	
	// Define os fios
	wire w0, w1, w2;
	wire h0, h1, h2;
	wire [3:0] notB;
	wire wCout;
	
	// inverte os bits de B
	not not0 (notB[0], B[0]);
	not not1 (notB[1], B[1]);
	not not2 (notB[2], B[2]);
	not not3 (notB[3], B[3]);

	not not4(Bout, wCout); // inverte o cout
	
	adder adder0 (S, wCout, A, notB, 1);
endmodule 