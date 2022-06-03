/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : M-2016.12-SP3
// Date      : Sun May  8 19:54:00 2022
/////////////////////////////////////////////////////////////


module nb_comb ( a0, a1, a4, b0, b1, b4, R2, R3, R4, r0, r3, r4 );
  input a0, a1, a4, b0, b1, b4, R2, R3, R4;
  output r0, r3, r4;
  wire   c1, c2, c3, c4, d0, d1, d2, e0, e3;

  GTECH_XOR2 C18 ( .A(a0), .B(a4), .Z(c1) );
  GTECH_XOR2 C19 ( .A(b0), .B(b4), .Z(c2) );
  GTECH_XOR2 C20 ( .A(a1), .B(a4), .Z(c3) );
  GTECH_XOR2 C21 ( .A(b1), .B(b4), .Z(c4) );
  GTECH_AND2 C22 ( .A(a4), .B(b4), .Z(d0) );
  GTECH_AND2 C23 ( .A(c1), .B(c2), .Z(d1) );
  GTECH_AND2 C24 ( .A(c3), .B(c4), .Z(d2) );
  GTECH_XOR2 C25 ( .A(d0), .B(d1), .Z(e0) );
  GTECH_XOR2 C26 ( .A(d1), .B(d2), .Z(e3) );
  GTECH_XOR2 C27 ( .A(e0), .B(R4), .Z(r0) );
  GTECH_XOR2 C28 ( .A(e3), .B(R2), .Z(r3) );
  GTECH_XOR2 C29 ( .A(d2), .B(R3), .Z(r4) );
endmodule


module nb_mult ( clk, en, A, B, Z );
  input [4:0] A;
  input [4:0] B;
  output [4:0] Z;
  input clk, en;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, r0, r3, r4, N20, N21, N22, N23, N24, N25, N26,
         N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40,
         N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54,
         N55, N56, N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68,
         N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82,
         N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96,
         N97, N98, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108,
         N109, N110, N111, N112, N113, N114, N115, N116, N117;
  wire   [4:0] a;
  wire   [4:0] b;
  wire   [2:0] state;
  wire   [2:0] next_state;

  nb_comb nb ( .a0(a[0]), .a1(a[1]), .a4(a[4]), .b0(b[0]), .b1(b[1]), .b4(b[4]), .R2(Z[2]), .R3(Z[3]), .R4(Z[4]), .r0(r0), .r3(r3), .r4(r4) );
  \**SEQGEN**  \state_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N23), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \state_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N22), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \state_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N21), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  GTECH_AND2 C15 ( .A(N24), .B(N25), .Z(N27) );
  GTECH_AND2 C16 ( .A(N27), .B(N26), .Z(N28) );
  GTECH_OR2 C18 ( .A(state[2]), .B(state[1]), .Z(N29) );
  GTECH_OR2 C19 ( .A(N29), .B(N26), .Z(N30) );
  GTECH_OR2 C22 ( .A(state[2]), .B(N25), .Z(N32) );
  GTECH_OR2 C23 ( .A(N32), .B(state[0]), .Z(N33) );
  GTECH_OR2 C27 ( .A(state[2]), .B(N25), .Z(N35) );
  GTECH_OR2 C28 ( .A(N35), .B(N26), .Z(N36) );
  GTECH_OR2 C31 ( .A(N24), .B(state[1]), .Z(N38) );
  GTECH_OR2 C32 ( .A(N38), .B(state[0]), .Z(N39) );
  GTECH_OR2 C36 ( .A(N24), .B(state[1]), .Z(N41) );
  GTECH_OR2 C37 ( .A(N41), .B(N26), .Z(N42) );
  \**SEQGEN**  \next_state_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        1'b0), .clocked_on(1'b0), .data_in(N53), .enable(N50), .Q(
        next_state[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b0) );
  \**SEQGEN**  \next_state_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        1'b0), .clocked_on(1'b0), .data_in(N52), .enable(N50), .Q(
        next_state[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b0) );
  \**SEQGEN**  \next_state_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        1'b0), .clocked_on(1'b0), .data_in(N51), .enable(N50), .Q(
        next_state[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b0) );
  GTECH_AND2 C66 ( .A(N24), .B(N25), .Z(N54) );
  GTECH_AND2 C67 ( .A(N54), .B(N26), .Z(N55) );
  GTECH_OR2 C69 ( .A(state[2]), .B(state[1]), .Z(N56) );
  GTECH_OR2 C70 ( .A(N56), .B(N26), .Z(N57) );
  GTECH_OR2 C73 ( .A(state[2]), .B(N25), .Z(N59) );
  GTECH_OR2 C74 ( .A(N59), .B(state[0]), .Z(N60) );
  GTECH_OR2 C78 ( .A(state[2]), .B(N25), .Z(N62) );
  GTECH_OR2 C79 ( .A(N62), .B(N26), .Z(N63) );
  GTECH_OR2 C82 ( .A(N24), .B(state[1]), .Z(N65) );
  GTECH_OR2 C83 ( .A(N65), .B(state[0]), .Z(N66) );
  GTECH_OR2 C87 ( .A(N24), .B(state[1]), .Z(N68) );
  GTECH_OR2 C88 ( .A(N68), .B(N26), .Z(N69) );
  \**SEQGEN**  \a_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(N82), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(a[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N77) );
  \**SEQGEN**  \a_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(N81), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(a[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N77) );
  \**SEQGEN**  \a_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N80), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(a[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N77) );
  \**SEQGEN**  \a_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N79), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(a[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N77) );
  \**SEQGEN**  \a_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N78), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(a[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N77) );
  \**SEQGEN**  \b_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(N87), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(b[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N77) );
  \**SEQGEN**  \b_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(N86), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(b[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N77) );
  \**SEQGEN**  \b_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N85), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(b[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N77) );
  \**SEQGEN**  \b_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N84), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(b[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N77) );
  \**SEQGEN**  \b_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N83), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(b[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N77) );
  GTECH_AND2 C132 ( .A(N24), .B(N25), .Z(N89) );
  GTECH_AND2 C133 ( .A(N89), .B(N26), .Z(N90) );
  GTECH_OR2 C135 ( .A(state[2]), .B(state[1]), .Z(N91) );
  GTECH_OR2 C136 ( .A(N91), .B(N26), .Z(N92) );
  GTECH_OR2 C139 ( .A(state[2]), .B(N25), .Z(N94) );
  GTECH_OR2 C140 ( .A(N94), .B(state[0]), .Z(N95) );
  GTECH_OR2 C144 ( .A(state[2]), .B(N25), .Z(N97) );
  GTECH_OR2 C145 ( .A(N97), .B(N26), .Z(N98) );
  GTECH_OR2 C148 ( .A(N24), .B(state[1]), .Z(N100) );
  GTECH_OR2 C149 ( .A(N100), .B(state[0]), .Z(N101) );
  GTECH_OR2 C153 ( .A(N24), .B(state[1]), .Z(N103) );
  GTECH_OR2 C154 ( .A(N103), .B(N26), .Z(N104) );
  \**SEQGEN**  \z_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(N117), 
        .clocked_on(N88), .data_in(1'b0), .enable(1'b0), .Q(Z[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N112) );
  \**SEQGEN**  \z_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(N116), 
        .clocked_on(N88), .data_in(1'b0), .enable(1'b0), .Q(Z[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N112) );
  \**SEQGEN**  \z_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N115), 
        .clocked_on(N88), .data_in(1'b0), .enable(1'b0), .Q(Z[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N112) );
  \**SEQGEN**  \z_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N114), 
        .clocked_on(N88), .data_in(1'b0), .enable(1'b0), .Q(Z[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N112) );
  \**SEQGEN**  \z_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N113), 
        .clocked_on(N88), .data_in(1'b0), .enable(1'b0), .Q(Z[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N112) );
  SELECT_OP C185 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2(next_state), .CONTROL1(
        N0), .CONTROL2(N1), .Z({N23, N22, N21}) );
  GTECH_BUF B_0 ( .A(N20), .Z(N0) );
  GTECH_BUF B_1 ( .A(en), .Z(N1) );
  SELECT_OP C186 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b1), 
        .DATA5(1'b1), .DATA6(1'b1), .DATA7(1'b0), .CONTROL1(N2), .CONTROL2(N3), 
        .CONTROL3(N4), .CONTROL4(N5), .CONTROL5(N6), .CONTROL6(N7), .CONTROL7(
        N49), .Z(N50) );
  GTECH_BUF B_2 ( .A(N28), .Z(N2) );
  GTECH_BUF B_3 ( .A(N31), .Z(N3) );
  GTECH_BUF B_4 ( .A(N34), .Z(N4) );
  GTECH_BUF B_5 ( .A(N37), .Z(N5) );
  GTECH_BUF B_6 ( .A(N40), .Z(N6) );
  GTECH_BUF B_7 ( .A(N43), .Z(N7) );
  SELECT_OP C187 ( .DATA1({1'b0, 1'b0, 1'b1}), .DATA2({1'b0, 1'b1, 1'b0}), 
        .DATA3({1'b0, 1'b1, 1'b1}), .DATA4({1'b1, 1'b0, 1'b0}), .DATA5({1'b1, 
        1'b0, 1'b1}), .DATA6({1'b0, 1'b0, 1'b0}), .CONTROL1(N2), .CONTROL2(N3), 
        .CONTROL3(N4), .CONTROL4(N5), .CONTROL5(N6), .CONTROL6(N7), .Z({N53, 
        N52, N51}) );
  SELECT_OP C188 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b1), 
        .DATA5(1'b1), .DATA6(1'b1), .DATA7(1'b0), .CONTROL1(N8), .CONTROL2(N9), 
        .CONTROL3(N10), .CONTROL4(N11), .CONTROL5(N12), .CONTROL6(N13), 
        .CONTROL7(N76), .Z(N77) );
  GTECH_BUF B_8 ( .A(N55), .Z(N8) );
  GTECH_BUF B_9 ( .A(N58), .Z(N9) );
  GTECH_BUF B_10 ( .A(N61), .Z(N10) );
  GTECH_BUF B_11 ( .A(N64), .Z(N11) );
  GTECH_BUF B_12 ( .A(N67), .Z(N12) );
  GTECH_BUF B_13 ( .A(N70), .Z(N13) );
  SELECT_OP C189 ( .DATA1(A), .DATA2({a[3:0], a[4]}), .DATA3({a[3:0], a[4]}), 
        .DATA4({a[3:0], a[4]}), .DATA5({a[3:0], a[4]}), .DATA6({a[3:0], a[4]}), 
        .CONTROL1(N8), .CONTROL2(N9), .CONTROL3(N10), .CONTROL4(N11), 
        .CONTROL5(N12), .CONTROL6(N13), .Z({N82, N81, N80, N79, N78}) );
  SELECT_OP C190 ( .DATA1(B), .DATA2({b[3:0], b[4]}), .DATA3({b[3:0], b[4]}), 
        .DATA4({b[3:0], b[4]}), .DATA5({b[3:0], b[4]}), .DATA6({b[3:0], b[4]}), 
        .CONTROL1(N8), .CONTROL2(N9), .CONTROL3(N10), .CONTROL4(N11), 
        .CONTROL5(N12), .CONTROL6(N13), .Z({N87, N86, N85, N84, N83}) );
  SELECT_OP C191 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b1), 
        .DATA5(1'b1), .DATA6(1'b1), .DATA7(1'b0), .CONTROL1(N14), .CONTROL2(
        N15), .CONTROL3(N16), .CONTROL4(N17), .CONTROL5(N18), .CONTROL6(N19), 
        .CONTROL7(N111), .Z(N112) );
  GTECH_BUF B_14 ( .A(N90), .Z(N14) );
  GTECH_BUF B_15 ( .A(N93), .Z(N15) );
  GTECH_BUF B_16 ( .A(N96), .Z(N16) );
  GTECH_BUF B_17 ( .A(N99), .Z(N17) );
  GTECH_BUF B_18 ( .A(N102), .Z(N18) );
  GTECH_BUF B_19 ( .A(N105), .Z(N19) );
  SELECT_OP C192 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({r4, r3, 
        Z[1:0], r0}), .DATA3({r4, r3, Z[1:0], r0}), .DATA4({r4, r3, Z[1:0], r0}), .DATA5({r4, r3, Z[1:0], r0}), .DATA6({r4, r3, Z[1:0], r0}), .CONTROL1(N14), 
        .CONTROL2(N15), .CONTROL3(N16), .CONTROL4(N17), .CONTROL5(N18), 
        .CONTROL6(N19), .Z({N117, N116, N115, N114, N113}) );
  GTECH_NOT I_0 ( .A(en), .Z(N20) );
  GTECH_NOT I_1 ( .A(state[2]), .Z(N24) );
  GTECH_NOT I_2 ( .A(state[1]), .Z(N25) );
  GTECH_NOT I_3 ( .A(state[0]), .Z(N26) );
  GTECH_NOT I_4 ( .A(N30), .Z(N31) );
  GTECH_NOT I_5 ( .A(N33), .Z(N34) );
  GTECH_NOT I_6 ( .A(N36), .Z(N37) );
  GTECH_NOT I_7 ( .A(N39), .Z(N40) );
  GTECH_NOT I_8 ( .A(N42), .Z(N43) );
  GTECH_OR2 C219 ( .A(N31), .B(N28), .Z(N44) );
  GTECH_OR2 C220 ( .A(N34), .B(N44), .Z(N45) );
  GTECH_OR2 C221 ( .A(N37), .B(N45), .Z(N46) );
  GTECH_OR2 C222 ( .A(N40), .B(N46), .Z(N47) );
  GTECH_OR2 C223 ( .A(N43), .B(N47), .Z(N48) );
  GTECH_NOT I_9 ( .A(N48), .Z(N49) );
  GTECH_NOT I_10 ( .A(N57), .Z(N58) );
  GTECH_NOT I_11 ( .A(N60), .Z(N61) );
  GTECH_NOT I_12 ( .A(N63), .Z(N64) );
  GTECH_NOT I_13 ( .A(N66), .Z(N67) );
  GTECH_NOT I_14 ( .A(N69), .Z(N70) );
  GTECH_OR2 C246 ( .A(N58), .B(N55), .Z(N71) );
  GTECH_OR2 C247 ( .A(N61), .B(N71), .Z(N72) );
  GTECH_OR2 C248 ( .A(N64), .B(N72), .Z(N73) );
  GTECH_OR2 C249 ( .A(N67), .B(N73), .Z(N74) );
  GTECH_OR2 C250 ( .A(N70), .B(N74), .Z(N75) );
  GTECH_NOT I_15 ( .A(N75), .Z(N76) );
  GTECH_NOT I_16 ( .A(clk), .Z(N88) );
  GTECH_NOT I_17 ( .A(N92), .Z(N93) );
  GTECH_NOT I_18 ( .A(N95), .Z(N96) );
  GTECH_NOT I_19 ( .A(N98), .Z(N99) );
  GTECH_NOT I_20 ( .A(N101), .Z(N102) );
  GTECH_NOT I_21 ( .A(N104), .Z(N105) );
  GTECH_OR2 C274 ( .A(N93), .B(N90), .Z(N106) );
  GTECH_OR2 C275 ( .A(N96), .B(N106), .Z(N107) );
  GTECH_OR2 C276 ( .A(N99), .B(N107), .Z(N108) );
  GTECH_OR2 C277 ( .A(N102), .B(N108), .Z(N109) );
  GTECH_OR2 C278 ( .A(N105), .B(N109), .Z(N110) );
  GTECH_NOT I_22 ( .A(N110), .Z(N111) );
endmodule

