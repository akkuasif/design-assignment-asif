module d_ff_tb(

    );
    reg D,RST,CLK;
    wire Q,QBAR;
    d_ff dut(D,RST,CLK,Q,QBAR);
    initial begin
    {D,RST,CLK}=0;
    end
    always #5 CLK= ~ CLK;
    initial begin
    RST=1'b1;#10
    RST=1'b0;
    D=1'b0;
    #10 
    D=1'b1;
    #10;
    $finish;
    end
endmodule
