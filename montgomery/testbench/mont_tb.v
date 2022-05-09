module mont_tb;

    localparam period        = 10;
    localparam halfperiod    =  5;

    reg [4:0] data_a = 5'b00001; 
    reg [4:0] data_b = 5'b00001;

    
    wire [4:0] out;

    montgomery uut 
    (
    .A(data_a),
    .B(data_b),
    .Z(out)
    );

     initial begin 
    #period;
    $display("==============================================");
    $display(" Montgomery Multiplier with Barrett Reduction");
    $display("          Begin Part d");
    $display(" ");
    $display("Performing A * B = Z");
    $display("A = ", "%b", data_a);
    $display("B = ", "%b", data_b);
    $display("Z = ", "%b", out);
    $display(" ");

    data_a = 5'b11001;
    data_b = 5'b10000;
    #period;
    $display("Performing A * B = Z");
    $display("A = ", "%b", data_a);
    $display("B = ", "%b", data_b);
    $display("Z = ", "%b", out);
    $display(" ");

    data_a = 5'b10111;
    data_b = 5'b00011;
    #period;
    $display("Performing A * B = Z");
    $display("A = ", "%b", data_a);
    $display("B = ", "%b", data_b);
    $display("Z = ", "%b", out);
    $display(" ");
    #period;
    $display("==============================================");
    $stop;
    end

endmodule
