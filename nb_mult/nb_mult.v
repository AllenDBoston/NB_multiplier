





module nb_mult (clk, en, A, B, Z);
    input  clk, en;
    input  [4:0] A, B;
    output [4:0] Z;

    reg [4:0] a, b, z;
    reg [2:0] state, next_state;

    assign Z = z;

    wire a0, a1, a4, b0, b1, b4, r0, r3, r4, R2, R3, R4;


    assign a0 = a[0];
    assign a1 = a[1];
    assign a4 = a[4];
    assign b0 = b[0];
    assign b1 = b[1];
    assign b4 = b[4];
    assign R2 = z[2];
    assign R3 = z[3];
    assign R4 = z[4];
    
    
    nb_comb nb
    (
    .a0(a0),
    .a1(a1),
    .a4(a4),
    .b0(b0),
    .b1(b1),
    .b4(b4),
    .R2(R2),
    .R3(R3),
    .R4(R4),
    .r0(r0),
    .r3(r3),
    .r4(r4)
    );


always @ (posedge clk)
begin 
    if(~en)
        state <= 0;
    else
        state <= next_state;
end

always @ (state)
begin 
    case(state)
        0: next_state = 1;
        1: next_state = 2;
        2: next_state = 3;
        3: next_state = 4;
        4: next_state = 5;
        5: next_state = 0;
    endcase
end

always @ (posedge clk)
begin 
    case(state)
        0: //read data
            begin 
                a <= A;
                b <= B;
            end
        1:
            begin 
                a <= {a[3:0], a[4]};
                b <= {b[3:0], b[4]};
            end
        2:
            begin 
                a <= {a[3:0], a[4]};
                b <= {b[3:0], b[4]};
            end
        3:
            begin 
                a <= {a[3:0], a[4]};
                b <= {b[3:0], b[4]};
            end
        4:
            begin 
                a <= {a[3:0], a[4]};
                b <= {b[3:0], b[4]};
            end
        5:
            begin 
                a <= {a[3:0], a[4]};
                b <= {b[3:0], b[4]};
            end
    endcase

end
   
always @ (negedge clk)
begin 
    case(state)
        0: z <= 0;
        1: z <= {r4, r3, z[1:0], r0};
        2: z <= {r4, r3, z[1:0], r0};
        3: z <= {r4, r3, z[1:0], r0};
        4: z <= {r4, r3, z[1:0], r0};
        5: z <= {r4, r3, z[1:0], r0};
    endcase
end


endmodule



module nb_comb (a0, a1, a4, b0, b1, b4, R2, R3, R4, r0, r3, r4);
    input  a0, a1, a4, b0, b1, b4, R2, R3, R4;
    output r0, r3, r4;

    wire c1, c2, c3, c4;
    wire d0, d1, d2;
    wire e0, e3, e4;
    
    assign c1 = a0 ^ a4;
    assign c2 = b0 ^ b4;
    assign c3 = a1 ^ a4;
    assign c4 = b1 ^ b4;

    assign d0 = a4 & b4;
    assign d1 = c1 & c2;
    assign d2 = c3 & c4;

    assign e0 = d0 ^ d1;
    assign e3 = d1 ^ d2;
    assign e4 = d2;

    assign r0 = e0 ^ R4;
    assign r3 = e3 ^ R2;
    assign r4 = e4 ^ R3;


    
endmodule
