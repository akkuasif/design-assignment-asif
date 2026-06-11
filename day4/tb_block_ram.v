module tb_block_ram;

    reg clk;
    reg arstn;
    reg wrenb;
    reg [7:0] wraddres;
    reg [7:0] rdaddres;
    reg [7:0] data_in;
    wire [7:0] data_out;

    block_ram uut (
        .clk(clk),
        .arstn(arstn),
        .wrenb(wrenb),
        .wraddres(wraddres),
        .rdaddres(rdaddres),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        arstn = 0;
        wrenb = 0;
        wraddres = 0;
        rdaddres = 0;
        data_in = 0;

        #10 arstn = 1;

        #10 wrenb = 1;      
        wraddres = 8'hA5; 
        data_in = 8'h3C;  
        #10;

        wraddres = 8'h5A; 
        data_in = 8'hFF;  
        #10;

        wrenb = 0;       
        rdaddres = 8'hA5; 
        #10;

        rdaddres = 8'h5A; 
        #20;

        $finish;
    end

endmodule
