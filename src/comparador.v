/*
	Módulo de comparação.
	Ele recebe 4 bits de entrada (diff) e e 1 bot de sinal (sinal).
	Se a diferença (em base 10) for 0, igual é 1.
	Se a diferença (em base 10) for de -3 ate 3(b), ate3 é 1.
	Se for qualquer outra diferença, errada é 1.
*/

module comparador(diff, sinal, igual, ate3, errada);
	// Define as entradas
	input [3:0] diff;
	input sinal; // 1 == NEGATIVO
	
	// Define as saídas
	output igual, ate3, errada;

	// Define os fios
	wire SINAL_AND_DIFF3_AND_DIFF2_AND_DIFF1, SINAL_AND_DIFF3_AND_DIFF2_AND_DIFF0, NOT_SINAL_AND_NOT_DIFF3_AND_NOT_DIFF2_AND_DIFF1, NOT_SINAL_AND_NOT_DIFF3_AND_NOT_DIFF2_AND_DIFF0;
	wire SINAL_AND_NOT_DIFF2, NOT_SINAL_AND_DIFF3, NOT_DIFF3_AND_DIFF2, DIFF2_AND_NOT_DIFF1_AND_NOT_DIFF0;

	wire NOT_DIFF0, NOT_DIFF1, NOT_DIFF2, NOT_DIFF3, NOT_SINAL;

	not not0(NOT_DIFF0, diff[0]);
	not not1(NOT_DIFF1, diff[1]);
	not not2(NOT_DIFF2, diff[2]);
	not not3(NOT_DIFF3, diff[3]);
	not not4(NOT_SINAL, sinal);

	// igual
	and and0(igual, NOT_SINAL, NOT_DIFF3, NOT_DIFF2, NOT_DIFF1, NOT_DIFF0);

	// ate3
	and and1(SINAL_AND_DIFF3_AND_DIFF2_AND_DIFF1, sinal, diff[3], diff[2], diff[1]);
	and and2(SINAL_AND_DIFF3_AND_DIFF2_AND_DIFF0, sinal, diff[3], diff[2], diff[0]);
	and and3(NOT_SINAL_AND_NOT_DIFF3_AND_NOT_DIFF2_AND_DIFF1, NOT_SINAL, NOT_DIFF3, NOT_DIFF2, diff[1]);
	and and4(NOT_SINAL_AND_NOT_DIFF3_AND_NOT_DIFF2_AND_DIFF0, NOT_SINAL, NOT_DIFF3, NOT_DIFF2, diff[0]);
	or or0 (ate3, SINAL_AND_DIFF3_AND_DIFF2_AND_DIFF1, SINAL_AND_DIFF3_AND_DIFF2_AND_DIFF0, NOT_SINAL_AND_NOT_DIFF3_AND_NOT_DIFF2_AND_DIFF1, NOT_SINAL_AND_NOT_DIFF3_AND_NOT_DIFF2_AND_DIFF0);

	// errada
	and and5(SINAL_AND_NOT_DIFF2, sinal, NOT_DIFF2);
	and and6(NOT_SINAL_AND_DIFF3, NOT_SINAL, diff[3]);
	and and7(NOT_DIFF3_AND_DIFF2, NOT_DIFF3, diff[2]);
	and and8(DIFF2_AND_NOT_DIFF1_AND_NOT_DIFF0, diff[2], NOT_DIFF1, NOT_DIFF0);

	or or1(errada, SINAL_AND_NOT_DIFF2, NOT_SINAL_AND_DIFF3, NOT_DIFF3_AND_DIFF2, DIFF2_AND_NOT_DIFF1_AND_NOT_DIFF0);
	
endmodule 