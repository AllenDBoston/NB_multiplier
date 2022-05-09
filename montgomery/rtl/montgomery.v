


module montgomery (A, B, Z);
    input  [4:0] A, B;
    output [4:0] Z;

    wire [10:0] mult0_o;
    wire [5:0]  mult1_o;
    wire [5:0]  q1;
    wire [4:0]  g1, g2;

    
    assign q1 = mult0_o[10:5];
    assign g1 = mult0_o[4:0];
    assign Z  = g1 ^ g2;

    mult_5bit_mod2 mult0
    (
    .A(A),
    .B(B),
    .Z(mult0_o)
    );

    mult_6bit_mod2_q2 mult1
    (
    .B(q1),
    .Z(mult1_o)
    );

    
    mult_6bit_mod2_g2 mult2
    (
    .B(mult1_o),
    .Z(g2)
    );





endmodule

module mult_5bit_mod2(A, B, Z);
    input  [4:0] A, B;
    output [10:0] Z;

    assign Z[10] = 0;
    assign Z[9]  = 0;
    assign Z[8]  = (A[4] & B[4]);
    assign Z[7]  = (A[4] & B[3]) ^ (A[3] & B[4]);
    assign Z[6]  = (A[4] & B[2]) ^ (A[3] & B[3]) ^ (A[2] & B[4]);
    assign Z[5]  = (A[4] & B[1]) ^ (A[3] & B[2]) ^ (A[2] & B[3]) ^ (A[1] & B[4]);
    assign Z[4]  = (A[4] & B[0]) ^ (A[3] & B[1]) ^ (A[2] & B[2]) ^ (A[1] & B[2]) ^ (A[0] & B[4]);
    assign Z[3]  = (A[3] & B[0]) ^ (A[2] & B[1]) ^ (A[1] & B[2]) ^ (A[0] & B[3]);
    assign Z[2]  = (A[2] & B[0]) ^ (A[1] & B[1]) ^ (A[0] & B[2]);
    assign Z[1]  = (A[1] & B[0]) ^ (A[0] & B[1]);
    assign Z[0]  = (A[0] & B[0]);

endmodule

module mult_6bit_mod2_q2(B, Z);
    input  [5:0] B;
    output [5:0] Z;
    // A = P(x) - a^5 + x^2 + 1;

    assign Z[5] = (1 & B[5]);
    assign Z[4] = (1 & B[4]) ^ (0 & B[5]);
    assign Z[3] = (1 & B[3]) ^ (0 & B[4]) ^ (0 & B[5]);
    assign Z[2] = (1 & B[2]) ^ (0 & B[3]) ^ (0 & B[4]) ^ (1 & B[5]);
    assign Z[1] = (1 & B[1]) ^ (0 & B[2]) ^ (0 & B[3]) ^ (1 & B[4]) ^ (0 & B[5]);
    assign Z[0] = (1 & B[0]) ^ (0 & B[1]) ^ (0 & B[2]) ^ (1 & B[3]) ^ (0 & B[4]) ^ (1 & B[5]);

endmodule

module mult_6bit_mod2_g2(B, Z);
    input  [5:0] B;
    output [4:0] Z;
    // A = P(x) - a^5 + x^2 + 1;

    assign Z[0] = (1 & B[0]);
    assign Z[1] = (0 & B[0]) ^ (1 & B[1]);
    assign Z[2] = (1 & B[0]) ^ (0 & B[1]) ^ (1 & B[2]);
    assign Z[3] = (0 & B[0]) ^ (1 & B[1]) ^ (0 & B[2]) ^ (1 & B[3]);
    assign Z[4] = (0 & B[0]) ^ (0 & B[1]) ^ (1 & B[2]) ^ (0 & B[3]) ^ (1 & B[4]);
    

endmodule

