/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : M-2016.12-SP3
// Date      : Sun May  8 19:54:07 2022
/////////////////////////////////////////////////////////////


module nb_comb ( a0, a1, a4, b0, b1, b4, R2, R3, R4, r0, r30, r40 );
  input a0, a1, a4, b0, b1, b4, R2, R3, R4;
  output r0, r30, r40;
  wire   n1, n2, n3, n4, n5, n6, n7;

  XOR3X1P4A12TR U1 ( .A(R2), .B(n2), .C(n1), .Y(r30) );
  XOR3X1P4A12TR U2 ( .A(R4), .B(n2), .C(n5), .Y(r0) );
  NAND2X1A12TR U3 ( .A(n6), .B(n7), .Y(n2) );
  NAND2X1A12TR U4 ( .A(n3), .B(n4), .Y(n1) );
  XOR2X0P5A12TR U5 ( .A(b4), .B(b0), .Y(n6) );
  XOR2X0P5A12TR U6 ( .A(a4), .B(a0), .Y(n7) );
  NAND2X0P5MA12TR U7 ( .A(b4), .B(a4), .Y(n5) );
  XNOR2X0P7A12TR U8 ( .A(R3), .B(n1), .Y(r40) );
  XOR2X0P7A12TR U9 ( .A(b4), .B(b1), .Y(n3) );
  XOR2X0P7A12TR U10 ( .A(a4), .B(a1), .Y(n4) );
endmodule


module SNPS_CLOCK_GATE_HIGH_nb_mult ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  PREICGX0P5BA12TR latch ( .CK(CLK), .E(EN), .SE(TE), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_LOW_nb_mult ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;
  wire   net19, net21, net23, net24, net30, n1;
  assign net19 = EN;
  assign net21 = CLK;
  assign ENCLK = net23;
  assign net30 = TE;

  LATQNX1A12TR latch ( .G(net21), .D(net24), .QN(n1) );
  OR2X1A12TR main_gate ( .A(n1), .B(net21), .Y(net23) );
  OR2X1A12TR test_or ( .A(net19), .B(net30), .Y(net24) );
endmodule


module nb_mult ( clk, en, A, B, Z );
  input [4:0] A;
  input [4:0] B;
  output [4:0] Z;
  input clk, en;
  wire   r0, r3, r4, N51, N52, N53, N77, N113, N114, N115, N116, N117, net17,
         net34, n8, n9, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n1130, n1140, n1150, n1160;
  wire   [4:0] a0;
  wire   [4:0] b0;
  wire   [2:0] state;
  wire   [2:0] next_state;

  nb_comb nb ( .a0(n105), .a1(n106), .a4(n109), .b0(n100), .b1(n101), .b4(n104), .R2(Z[2]), .R3(Z[3]), .R4(Z[4]), .r0(r0), .r30(r3), .r40(r4) );
  SNPS_CLOCK_GATE_HIGH_nb_mult clk_gate_a_reg ( .CLK(clk), .EN(n110), .ENCLK(
        net17), .TE(1'b0) );
  SNPS_CLOCK_GATE_LOW_nb_mult clk_gate_z_reg ( .CLK(clk), .EN(n110), .ENCLK(
        net34), .TE(1'b0) );
  AND2X3A12TR U9 ( .A(next_state[2]), .B(en), .Y(state[2]) );
  AND2X3A12TR U10 ( .A(next_state[1]), .B(en), .Y(state[1]) );
  DFFNQX1A12TR z_reg_4_0 ( .D(N117), .CKN(net34), .Q(Z[4]) );
  DFFNQX1A12TR z_reg_3_0 ( .D(N116), .CKN(net34), .Q(Z[3]) );
  DFFNQX1A12TR z_reg_2_0 ( .D(N115), .CKN(net34), .Q(Z[2]) );
  DFFNQX1A12TR z_reg_1_0 ( .D(N114), .CKN(net34), .Q(Z[1]) );
  DFFNQX1A12TR z_reg_0_0 ( .D(N113), .CKN(net34), .Q(Z[0]) );
  LATQX1A12TR next_state_reg_0_0 ( .G(N77), .D(N51), .Q(next_state[0]) );
  DFFQX0P5A12TR clock_r_REG12_S2 ( .D(a0[3]), .CK(net17), .Q(n108) );
  DFFQX0P5A12TR clock_r_REG11_S2 ( .D(a0[2]), .CK(net17), .Q(n107) );
  DFFQX0P5A12TR clock_r_REG7_S2 ( .D(b0[3]), .CK(net17), .Q(n103) );
  DFFQX0P5A12TR clock_r_REG6_S2 ( .D(b0[2]), .CK(net17), .Q(n102) );
  DFFQX0P5A12TR clock_r_REG1_S1 ( .D(N77), .CK(clk), .Q(n110) );
  LATQX1A12TR next_state_reg_2_0 ( .G(N77), .D(N53), .Q(next_state[2]) );
  LATQX1A12TR next_state_reg_1_0 ( .G(N77), .D(N52), .Q(next_state[1]) );
  DFFQX0P5A12TR clock_r_REG9_S2 ( .D(a0[0]), .CK(net17), .Q(n105) );
  DFFQX0P5A12TR clock_r_REG4_S2 ( .D(b0[0]), .CK(net17), .Q(n100) );
  DFFQX0P5A12TR clock_r_REG5_S2 ( .D(b0[1]), .CK(net17), .Q(n101) );
  DFFQX0P5A12TR clock_r_REG10_S2 ( .D(a0[1]), .CK(net17), .Q(n106) );
  DFFQX1A12TR clock_r_REG2_S1 ( .D(state[0]), .CK(clk), .Q(n111) );
  DFFQX1A12TR clock_r_REG0_S1 ( .D(state[2]), .CK(clk), .Q(n1130) );
  DFFQX1A12TR clock_r_REG13_S2 ( .D(a0[4]), .CK(net17), .Q(n109) );
  DFFQX0P5A12TR clock_r_REG3_S1 ( .D(state[1]), .CK(clk), .Q(n112) );
  DFFQX1A12TR clock_r_REG8_S2 ( .D(b0[4]), .CK(net17), .Q(n104) );
  NOR3X1A12TR U104 ( .A(n1130), .B(n111), .C(n112), .Y(n1150) );
  AND2X1A12TR U105 ( .A(r4), .B(n1160), .Y(N117) );
  AND2X1A12TR U106 ( .A(r3), .B(n1160), .Y(N116) );
  AND2X1P4A12TR U107 ( .A(r0), .B(n1160), .Y(N113) );
  XOR2X0P5A12TR U108 ( .A(n111), .B(n112), .Y(n9) );
  NOR2BX0P5A12TR U109 ( .AN(n110), .B(n111), .Y(N51) );
  XNOR2X0P5A12TR U110 ( .A(n111), .B(n1130), .Y(n8) );
  NOR2BX0P5A12TR U111 ( .AN(n9), .B(n1130), .Y(N52) );
  AND2X0P7A12TR U112 ( .A(Z[1]), .B(n1160), .Y(N115) );
  AND2X0P7A12TR U113 ( .A(Z[0]), .B(n1160), .Y(N114) );
  INVX2A12TR U114 ( .A(n1140), .Y(n1160) );
  NAND2X1A12TR U115 ( .A(state[2]), .B(state[1]), .Y(N77) );
  BUFX2BA12TR U116 ( .A(n1150), .Y(n1140) );
  AND2X1A12TR U117 ( .A(next_state[0]), .B(en), .Y(state[0]) );
  NOR2X1A12TR U118 ( .A(n8), .B(n9), .Y(N53) );
  AO22X0P5A12TR U119 ( .A0(n104), .A1(n1160), .B0(B[0]), .B1(n1140), .Y(b0[0])
         );
  AO22X0P5A12TR U120 ( .A0(n100), .A1(n1160), .B0(B[1]), .B1(n1140), .Y(b0[1])
         );
  AO22X0P5A12TR U121 ( .A0(n101), .A1(n1160), .B0(B[2]), .B1(n1140), .Y(b0[2])
         );
  AO22X0P5A12TR U122 ( .A0(n102), .A1(n1160), .B0(B[3]), .B1(n1140), .Y(b0[3])
         );
  AO22X0P5A12TR U123 ( .A0(n103), .A1(n1160), .B0(B[4]), .B1(n1140), .Y(b0[4])
         );
  AO22X0P5A12TR U124 ( .A0(n109), .A1(n1160), .B0(A[0]), .B1(n1140), .Y(a0[0])
         );
  AO22X0P5A12TR U125 ( .A0(n105), .A1(n1160), .B0(A[1]), .B1(n1140), .Y(a0[1])
         );
  AO22X0P5A12TR U126 ( .A0(n106), .A1(n1160), .B0(A[2]), .B1(n1140), .Y(a0[2])
         );
  AO22X0P5A12TR U127 ( .A0(n107), .A1(n1160), .B0(A[3]), .B1(n1140), .Y(a0[3])
         );
  AO22X0P5A12TR U128 ( .A0(n108), .A1(n1160), .B0(A[4]), .B1(n1140), .Y(a0[4])
         );
endmodule

