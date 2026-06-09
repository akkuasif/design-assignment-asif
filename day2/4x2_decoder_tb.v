module encoder4by1_tb(

    );
    reg [3:0]D;
    wire [1:0]B;
    encoder4by2 dut(D,B);
    initial
    begin
    D=0;
    end
    initial
    begin
    #1
    D=4'b0001;
    #1
    D=4'b0010;
    #1
    D=4'b0100;
    #1
    D=4'b1000;
    #1;
    $finish;
    end
endmodule
