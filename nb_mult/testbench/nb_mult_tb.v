



module nb_mult_tb;

    localparam period        = 10;
    localparam halfperiod    =  5;
    reg en  = 0;
    reg clk = 0;
    reg [4:0] data_a = 5'b00001; 
    reg [4:0] data_b = 5'b00001;

    wire [4:0] out;

    nb_mult uut
    (
    .clk(clk),
    .en(en),
    .A(data_a),
    .B(data_b),
    .Z(out)
    );

    initial begin 
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end
    
    initial begin
    #period;
    $display("================= Begin Test =========");
    #halfperiod;
    en = 1'b1;
    #period;
    #period;
    #period;
    #period;
    #period;
    $display("Performing A * B = Z in Normal Basis");
    $display("A = ", "%b", data_a);
    $display("B = ", "%b", data_b);
    $display("Z = ", "%b", out);
    #period;

    data_a = 5'b11001;
    data_b = 5'b10000;
    #period;
    #period;
    #period;
    #period;
    #period;
    $display("Performing A * B = Z in Normal Basis");
    $display("A = ", "%b", data_a);
    $display("B = ", "%b", data_b);
    $display("Z = ", "%b", out);
    #period;

    data_a = 5'b10111;
    data_b = 5'b00011;
    #period;
    #period;
    #period;
    #period;
    #period;
    $display("Performing A * B = Z in Normal Basis");
    $display("A = ", "%b", data_a);
    $display("B = ", "%b", data_b);
    $display("Z = ", "%b", out);
    #period;
     $display("================= ENDTest   =========");


    $stop;
    end
    

endmodule
