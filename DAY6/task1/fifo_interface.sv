`timescale 1ns / 1ps

module fifo #(parameter DEPTH=8, DATA_WIDTH=8) (
    input logic clk,
    input logic rst_n,
    input logic wr_en,
    input logic rd_en,
    input logic [DATA_WIDTH-1:0] data_in,
    output logic [DATA_WIDTH-1:0] data_out,
    output logic full,
    output logic empty
);
    
    logic [DATA_WIDTH-1:0] mem [0:DEPTH-1];
    logic [3:0] w_ptr, r_ptr; 

    assign full = {~w_ptr[3], w_ptr[2:0]} == r_ptr;
    assign empty = w_ptr == r_ptr;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            w_ptr <= 0;
            r_ptr <= 0;
            data_out <= 0;
        end else begin
            
            if (wr_en && !full) begin
                mem[w_ptr[2:0]] <= data_in;
                w_ptr <= w_ptr + 1;
            end
            
            if (rd_en && !empty) begin
                data_out <= mem[r_ptr[2:0]];
                r_ptr <= r_ptr + 1;
            end
        end
    end
endmodule
