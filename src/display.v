/*
		 A
	 F		 B
		 G
	 E		 C
 DP	 D
*/
module display(diff, sinal, segD, A, B, C, D, E, F, G, DP);
	
	// digito 0 - 0 em tudo
	// digito 1 - 1 em B e C
	// digito 2 - 1 em A, B, G, E, D
	// digito 3 - 1 em A, B, G, C, D
	// digito -1 - 1 em DP, B e C
	// digito -2 - 1 em DP, A, B, G, E, D
	// digito -3 - 1 em DP, A, B, G, C, D
	
	input [3:0] diff;
	input sinal;
	output segD, A, B, C, D, E, F, G, DP;
	
	wire B0_AND_1, NOR_B3_NOR_B2_NOR_B1;
	wire NOR_B3_NOR_B2_NOR_B0, B1_AND_1;
	wire NOR_B2_NOR_B3, B0_AND_B1;
	wire SINAL_AND_B3_AND_B2_AND_B1, NOR_B0, SINAL_AND_B3_AND_B2_AND_B3, NOR_B1;
	wire NOT_SINAL;
	wire w0Dg1;
	wire wDg0, wDg1, wDg2, wDg3;
	wire wDgN1, wDgN2, wDgN3;
	
	not notNeg (NOT_SINAL, sinal);
	
	// # digito 0 - 0 0000 - 1 em tudo
	nor nor0Digito0 (wDg0, sinal, diff[3], diff[2], diff[1], diff[0]);
	
	// # digito 1 - 0 0001 - 1 em B e C
	and and0Digito1 (B0_AND_1, diff[0]); // o bit 0 é 1
	nor nor0Digito1 (NOR_B3_NOR_B2_NOR_B1, diff[3], diff[2], diff[1]); // o bit 3, 2 e 1 sao 0
	and and1Digito1 (wDg1, B0_AND_1, NOR_B3_NOR_B2_NOR_B1, NOT_SINAL); // os 2 anteriores sao 1
	
	// # digito 2 - 0 0010 - 1 em A, B, G, E, D
	nor nor0Digito2 (NOR_B3_NOR_B2_NOR_B0, diff[3], diff[2], diff[0]); // o bit 3, 2 e 0 sao 0
	and and0Digito2 (B1_AND_1, diff[1]); // o bit 1 é 1
	and and1Digito2 (wDg2, NOR_B3_NOR_B2_NOR_B0, B1_AND_1, NOT_SINAL); // os 2 anteriores sao 1
	
	// # digito 3 - 0 0011 - 1 em A, B, G, C, D
	nor nor0Digito3 (NOR_B2_NOR_B3, diff[3], diff[2]); // o bit 3, 2 sao 0
	and and0Digito3 (B0_AND_B1, diff[0], diff[1]); // o bit 1 e 0 é 1
	and and1Digito3 (wDg3, NOR_B2_NOR_B3, B0_AND_B1, NOT_SINAL); // os 2 anteriores sao 1
	
	// digito -1 - 1 1111 - 1 em DP, B e C
	and and0DigitoN1 (wDgN1, sinal, diff[3], diff[2], diff[1], diff[0]); // se todos forem 1, incluindo o sinal
	
	// digito -2 - 1 1110 - 1 em DP, A, B, G, E, D
	and and0DigitoN2 (SINAL_AND_B3_AND_B2_AND_B1, sinal, diff[3], diff[2], diff[1]); // se os bits 3, 2, 1 e o sinal forem 1
	nor nor0DigitoN2 (NOR_B0, diff[0]); // bit 0 é 0
	and and1DigitoN2 (wDgN2, SINAL_AND_B3_AND_B2_AND_B1, NOR_B0); // os 2 anteriores sao 1
	
	// digito -3 - 1 1101 - 1 em DP, A, B, G, C, D
	and and0DigitoN3 (SINAL_AND_B3_AND_B2_AND_B3, sinal, diff[3], diff[2], diff[0]); // os bits 3, 2 e 0 sao 1
	nor nor0DigitoN3 (NOR_B1, diff[1]); // o bit 1 é 0
	and and1DigitoN3 (wDgN3, SINAL_AND_B3_AND_B2_AND_B3, NOR_B1); // os 2 anteriores sao 1
	// liga os leds
	
	//              0		 1		 2		 3		 -1		-2    -3
	or or0_led (A, wDg0,  	   wDg2, wDg3,		    wDgN2, wDgN3);
	or or1_led (B, wDg0, wDg1, wDg2, wDg3, wDgN1, wDgN2, wDgN3);
	or or2_led (C, wDg0, wDg1		 , wDg3, wDgN1			, wDgN3);
	or or3_led (D, wDg0, 	   wDg2, wDg3,			 wDgN2, wDgN3);
	or or4_led (E, wDg0,       wDg2,					 wDgN2);
	or or5_led (F, wDg0);
	or or6_led (G,		  		   wDg2, wDg3,			 wDgN2, wDgN3);
	or or7_dp  (DP, 								wDgN1, wDgN2, wDgN3);
	
	and and_segD(segD, 1); // define como o digito 1

endmodule 