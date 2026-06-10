
`timescale 1ns / 1ps

module tb_sequence_detector;

    reg clk;
    reg reset;
    reg sequence_in;
    wire detector_out;

    sequence_detector_1110 uut (
        .clk(clk), 
        .reset(reset), 
        .sequence_in(sequence_in), 
        .detector_out(detector_out)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        sequence_in = 0;
        #40;
        reset = 0;
        
        
        @(negedge clk); sequence_in = 1; 
        @(negedge clk); sequence_in = 1; 
        @(negedge clk); sequence_in = 1; 
        @(negedge clk); sequence_in = 0; 
        
        @(negedge clk); sequence_in = 1; 
        @(negedge clk); sequence_in = 1; 
        @(negedge clk); sequence_in = 1; 
        @(negedge clk); sequence_in = 1; 
        @(negedge clk); sequence_in = 0; 

        #40;
        $finish;
    end
      
endmodule
