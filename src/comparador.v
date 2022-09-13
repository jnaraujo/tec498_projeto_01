module comparador(A, B, maior, menor, igual);
	input [3:0] A;
	input [3:0] B;
	
	output igual, maior, menor;
	
	wire [3:0] aux_igual, aux_menor, aux_maior;
	
	comparador1bit bit3 (A[3], B[3], 1,            aux_maior[3], aux_menor[3], aux_igual[3]); // compara o bit 3 do A com o do B
	
	comparador1bit bit2 (A[2], B[2], aux_igual[3], aux_maior[2], aux_menor[2], aux_igual[2]); // compara o bit 2 do A com o do B
	
	comparador1bit bit1 (A[1], B[1], aux_igual[2], aux_maior[1], aux_menor[1], aux_igual[1]); // compara o bit 1 do A com o do B
	
	comparador1bit bit0 (A[0], B[0], aux_igual[1], aux_maior[0], aux_menor[0], aux_igual[0]); // compara o bit 0 do A com o do B
	
	assign maior = | aux_maior; // OR em todos os bits do aux_maior
	assign menor = | aux_menor; // OR em todos os bits do aux_menor
	assign igual = aux_igual[0]; // define igual
	
endmodule 