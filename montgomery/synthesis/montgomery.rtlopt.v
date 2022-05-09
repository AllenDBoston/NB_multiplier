/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : M-2016.12-SP3
// Date      : Sun May  8 17:05:26 2022
/////////////////////////////////////////////////////////////


module mult_5bit_mod2 ( A, B, Z );
  input [4:0] A;
  input [4:0] B;
  output [10:0] Z;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31;
  assign Z[9] = 1'b0;
  assign Z[10] = 1'b0;

  GTECH_AND2 C16 ( .A(A[4]), .B(B[4]), .Z(Z[8]) );
  GTECH_XOR2 C17 ( .A(N0), .B(N1), .Z(Z[7]) );
  GTECH_AND2 C18 ( .A(A[4]), .B(B[3]), .Z(N0) );
  GTECH_AND2 C19 ( .A(A[3]), .B(B[4]), .Z(N1) );
  GTECH_XOR2 C20 ( .A(N4), .B(N5), .Z(Z[6]) );
  GTECH_XOR2 C21 ( .A(N2), .B(N3), .Z(N4) );
  GTECH_AND2 C22 ( .A(A[4]), .B(B[2]), .Z(N2) );
  GTECH_AND2 C23 ( .A(A[3]), .B(B[3]), .Z(N3) );
  GTECH_AND2 C24 ( .A(A[2]), .B(B[4]), .Z(N5) );
  GTECH_XOR2 C25 ( .A(N10), .B(N11), .Z(Z[5]) );
  GTECH_XOR2 C26 ( .A(N8), .B(N9), .Z(N10) );
  GTECH_XOR2 C27 ( .A(N6), .B(N7), .Z(N8) );
  GTECH_AND2 C28 ( .A(A[4]), .B(B[1]), .Z(N6) );
  GTECH_AND2 C29 ( .A(A[3]), .B(B[2]), .Z(N7) );
  GTECH_AND2 C30 ( .A(A[2]), .B(B[3]), .Z(N9) );
  GTECH_AND2 C31 ( .A(A[1]), .B(B[4]), .Z(N11) );
  GTECH_XOR2 C32 ( .A(N18), .B(N19), .Z(Z[4]) );
  GTECH_XOR2 C33 ( .A(N16), .B(N17), .Z(N18) );
  GTECH_XOR2 C34 ( .A(N14), .B(N15), .Z(N16) );
  GTECH_XOR2 C35 ( .A(N12), .B(N13), .Z(N14) );
  GTECH_AND2 C36 ( .A(A[4]), .B(B[0]), .Z(N12) );
  GTECH_AND2 C37 ( .A(A[3]), .B(B[1]), .Z(N13) );
  GTECH_AND2 C38 ( .A(A[2]), .B(B[2]), .Z(N15) );
  GTECH_AND2 C39 ( .A(A[1]), .B(B[2]), .Z(N17) );
  GTECH_AND2 C40 ( .A(A[0]), .B(B[4]), .Z(N19) );
  GTECH_XOR2 C41 ( .A(N24), .B(N25), .Z(Z[3]) );
  GTECH_XOR2 C42 ( .A(N22), .B(N23), .Z(N24) );
  GTECH_XOR2 C43 ( .A(N20), .B(N21), .Z(N22) );
  GTECH_AND2 C44 ( .A(A[3]), .B(B[0]), .Z(N20) );
  GTECH_AND2 C45 ( .A(A[2]), .B(B[1]), .Z(N21) );
  GTECH_AND2 C46 ( .A(A[1]), .B(B[2]), .Z(N23) );
  GTECH_AND2 C47 ( .A(A[0]), .B(B[3]), .Z(N25) );
  GTECH_XOR2 C48 ( .A(N28), .B(N29), .Z(Z[2]) );
  GTECH_XOR2 C49 ( .A(N26), .B(N27), .Z(N28) );
  GTECH_AND2 C50 ( .A(A[2]), .B(B[0]), .Z(N26) );
  GTECH_AND2 C51 ( .A(A[1]), .B(B[1]), .Z(N27) );
  GTECH_AND2 C52 ( .A(A[0]), .B(B[2]), .Z(N29) );
  GTECH_XOR2 C53 ( .A(N30), .B(N31), .Z(Z[1]) );
  GTECH_AND2 C54 ( .A(A[1]), .B(B[0]), .Z(N30) );
  GTECH_AND2 C55 ( .A(A[0]), .B(B[1]), .Z(N31) );
  GTECH_AND2 C56 ( .A(A[0]), .B(B[0]), .Z(Z[0]) );
endmodule


module mult_6bit_mod2_q2 ( B, Z );
  input [5:0] B;
  output [5:0] Z;
  wire   N0;
  assign Z[5] = B[5];
  assign Z[4] = B[4];
  assign Z[3] = B[3];

  GTECH_XOR2 C9 ( .A(B[2]), .B(Z[5]), .Z(Z[2]) );
  GTECH_XOR2 C10 ( .A(B[1]), .B(Z[4]), .Z(Z[1]) );
  GTECH_XOR2 C11 ( .A(N0), .B(Z[5]), .Z(Z[0]) );
  GTECH_XOR2 C12 ( .A(B[0]), .B(Z[3]), .Z(N0) );
endmodule


module mult_6bit_mod2_g2 ( B, Z );
  input [5:0] B;
  output [4:0] Z;

  assign Z[1] = B[1];
  assign Z[0] = B[0];

  GTECH_XOR2 C9 ( .A(Z[0]), .B(B[2]), .Z(Z[2]) );
  GTECH_XOR2 C10 ( .A(Z[1]), .B(B[3]), .Z(Z[3]) );
  GTECH_XOR2 C11 ( .A(B[2]), .B(B[4]), .Z(Z[4]) );
endmodule


module montgomery ( A, B, Z );
  input [4:0] A;
  input [4:0] B;
  output [4:0] Z;

  wire   [5:0] q1;
  wire   [4:0] g1;
  wire   [4:0] g2;
  wire   [5:0] mult1_o;

  mult_5bit_mod2 mult0 ( .A(A), .B(B), .Z({q1, g1}) );
  mult_6bit_mod2_q2 mult1 ( .B(q1), .Z(mult1_o) );
  mult_6bit_mod2_g2 mult2 ( .B(mult1_o), .Z(g2) );
  GTECH_XOR2 C11 ( .A(g1[4]), .B(g2[4]), .Z(Z[4]) );
  GTECH_XOR2 C12 ( .A(g1[3]), .B(g2[3]), .Z(Z[3]) );
  GTECH_XOR2 C13 ( .A(g1[2]), .B(g2[2]), .Z(Z[2]) );
  GTECH_XOR2 C14 ( .A(g1[1]), .B(g2[1]), .Z(Z[1]) );
  GTECH_XOR2 C15 ( .A(g1[0]), .B(g2[0]), .Z(Z[0]) );
endmodule

