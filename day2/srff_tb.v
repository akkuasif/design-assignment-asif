module sr_ff_tb(

    );
    reg S,R,RST,CLK;
    wire Q,QBAR;
    sr_ff dut(S,R,RST,CLK,Q,QBAR);
    initial begin
    {S,R,RST,CLK}=0;
    end
    always #5 CLK= ~ CLK;
    initial begin
    RST=1'b1;#10
    RST=1'b0;
    S=1'b0;
    R=1'b0;
    #10
    S=1'b0;
    R=1'b1;
    #10
    S=1'b1;
    R=1'b0;
    #10
    S=1'b1;
    R=1'b1;
    #10;
    
    $finish;
    end
endmodule
