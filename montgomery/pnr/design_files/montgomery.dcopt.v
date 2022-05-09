/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : M-2016.12-SP3
// Date      : Sun May  8 17:05:32 2022
/////////////////////////////////////////////////////////////


module mult_5bit_mod2 ( A, B, Z );
  input [4:0] A;
  input [4:0] B;
  output [10:0] Z;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25;
  assign Z[9] = 1'b0;
  assign Z[10] = 1'b0;

  AND2X0P5A12TR U2 ( .A(A[4]), .B(B[4]), .Y(Z[8]) );
  XOR2X0P5A12TR U3 ( .A(n1), .B(n2), .Y(Z[7]) );
  NAND2X0P5A12TR U4 ( .A(A[3]), .B(B[4]), .Y(n2) );
  NAND2X0P5A12TR U5 ( .A(B[3]), .B(A[4]), .Y(n1) );
  XOR3X0P5A12TR U6 ( .A(n3), .B(n4), .C(n5), .Y(Z[6]) );
  NAND2X0P5A12TR U7 ( .A(A[2]), .B(B[4]), .Y(n5) );
  NAND2X0P5A12TR U8 ( .A(A[3]), .B(B[3]), .Y(n4) );
  AND2X0P5A12TR U9 ( .A(A[4]), .B(B[2]), .Y(n3) );
  XOR3X0P5A12TR U10 ( .A(n6), .B(n7), .C(n8), .Y(Z[5]) );
  NAND2X0P5A12TR U11 ( .A(A[1]), .B(B[4]), .Y(n8) );
  NAND2X0P5A12TR U12 ( .A(A[2]), .B(B[3]), .Y(n7) );
  XOR2X0P5A12TR U13 ( .A(n9), .B(n10), .Y(n6) );
  NAND2X0P5A12TR U14 ( .A(B[2]), .B(A[3]), .Y(n10) );
  NAND2X0P5A12TR U15 ( .A(B[1]), .B(A[4]), .Y(n9) );
  XOR3X0P5A12TR U16 ( .A(n11), .B(n12), .C(n13), .Y(Z[4]) );
  NAND2X0P5A12TR U17 ( .A(A[0]), .B(B[4]), .Y(n13) );
  NAND2X0P5A12TR U18 ( .A(B[2]), .B(A[2]), .Y(n12) );
  XOR3X0P5A12TR U19 ( .A(n14), .B(n15), .C(n16), .Y(n11) );
  NAND2X0P5A12TR U20 ( .A(B[1]), .B(A[3]), .Y(n16) );
  AND2X0P5A12TR U21 ( .A(A[4]), .B(B[0]), .Y(n14) );
  XOR3X0P5A12TR U22 ( .A(n17), .B(n18), .C(n19), .Y(Z[3]) );
  NAND2X0P5A12TR U23 ( .A(A[0]), .B(B[3]), .Y(n19) );
  NAND2X0P5A12TR U24 ( .A(B[1]), .B(A[2]), .Y(n18) );
  XOR2X0P5A12TR U25 ( .A(n15), .B(n20), .Y(n17) );
  NAND2X0P5A12TR U26 ( .A(B[0]), .B(A[3]), .Y(n20) );
  NAND2X0P5A12TR U27 ( .A(A[1]), .B(B[2]), .Y(n15) );
  XOR3X0P5A12TR U28 ( .A(n21), .B(n22), .C(n23), .Y(Z[2]) );
  NAND2X0P5A12TR U29 ( .A(A[0]), .B(B[2]), .Y(n23) );
  NAND2X0P5A12TR U30 ( .A(A[1]), .B(B[1]), .Y(n22) );
  AND2X0P5A12TR U31 ( .A(A[2]), .B(B[0]), .Y(n21) );
  XOR2X0P5A12TR U32 ( .A(n24), .B(n25), .Y(Z[1]) );
  NAND2X0P5A12TR U33 ( .A(A[0]), .B(B[1]), .Y(n25) );
  NAND2X0P5A12TR U34 ( .A(B[0]), .B(A[1]), .Y(n24) );
  AND2X0P5A12TR U35 ( .A(B[0]), .B(A[0]), .Y(Z[0]) );
endmodule


module mult_6bit_mod2_q2 ( B, Z );
  input [5:0] B;
  output [5:0] Z;
  wire   B_5_, B_4_, B_3_, Z_2_, Z_1_, Z_0_;
  assign Z[5] = B_5_;
  assign B_5_ = B[5];
  assign Z[4] = B_4_;
  assign B_4_ = B[4];
  assign Z[3] = B_3_;
  assign B_3_ = B[3];
  assign Z[2] = Z_2_;
  assign Z[1] = Z_1_;
  assign Z[0] = Z_0_;

  XOR2X0P5A12TR U1 ( .A(B_5_), .B(B[2]), .Y(Z_2_) );
  XOR2X0P5A12TR U2 ( .A(B_4_), .B(B[1]), .Y(Z_1_) );
  XOR3X0P5A12TR U3 ( .A(B_5_), .B(B_3_), .C(B[0]), .Y(Z_0_) );
endmodule


module mult_6bit_mod2_g2 ( B, Z );
  input [5:0] B;
  output [4:0] Z;
  wire   Z_4_, Z_3_, Z_2_, B_1_, B_0_;
  assign Z[4] = Z_4_;
  assign Z[3] = Z_3_;
  assign Z[2] = Z_2_;
  assign Z[1] = B_1_;
  assign B_1_ = B[1];
  assign Z[0] = B_0_;
  assign B_0_ = B[0];

  XOR2X0P5A12TR U1 ( .A(B[4]), .B(B[2]), .Y(Z_4_) );
  XOR2X0P5A12TR U2 ( .A(B_1_), .B(B[3]), .Y(Z_3_) );
  XOR2X0P5A12TR U3 ( .A(B_0_), .B(B[2]), .Y(Z_2_) );
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
  mult_6bit_mod2_q2 mult1 ( .B({1'b0, 1'b0, q1[3:0]}), .Z(mult1_o) );
  mult_6bit_mod2_g2 mult2 ( .B(mult1_o), .Z(g2) );
  XOR2X0P5A12TR U7 ( .A(g2[4]), .B(g1[4]), .Y(Z[4]) );
  XOR2X0P5A12TR U8 ( .A(g2[3]), .B(g1[3]), .Y(Z[3]) );
  XOR2X0P5A12TR U9 ( .A(g2[2]), .B(g1[2]), .Y(Z[2]) );
  XOR2X0P5A12TR U10 ( .A(g2[1]), .B(g1[1]), .Y(Z[1]) );
  XOR2X0P5A12TR U11 ( .A(g2[0]), .B(g1[0]), .Y(Z[0]) );
endmodule

