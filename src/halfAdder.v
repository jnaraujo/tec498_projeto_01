module halfAdder( S, Cout, A, B, Cin);
   input A, B, Cin;
   output S, Cout;
   wire T1, T2, T3;
 
   xor Xor0(T1, A, B);
   and And0(T2, A, B);
   and And1(T3, T1, Cin);
   or Or0(Cout, T2, T3);
   xor Xor1 (S, T1, Cin);
endmodule
