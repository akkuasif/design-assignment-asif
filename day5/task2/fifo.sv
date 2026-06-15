`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 22:07:06
// Design Name: 
// Module Name: fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo#(parameter WIDTH = 8, DEPTH = 16) (
  input logic clk,
  input logic rst,
  input logic wr_en,
  input logic rd_en,
  input logic [WIDTH-1:0] data_in,
  output logic [WIDTH-1:0] data_out,
  output logic full,
  output logic empty
);
  logic [WIDTH-1:0] mem [DEPTH];
  logic [$clog2(DEPTH)-1:0] wr_ptr, rd_ptr;
  logic [$clog2(DEPTH):0] count;
  
  assign full = (count == DEPTH);
  assign empty = (count == 0);
  
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      wr_ptr <= 0;
      rd_ptr <= 0;
      count <= 0;
      for(int i=0;i<DEPTH;i++) mem[i]<=0;
    end else begin
      if (wr_en && !full) begin
        mem[wr_ptr] <= data_in;
        wr_ptr <= wr_ptr + 1;
        count <= count + 1;
      end
      if (rd_en && !empty) begin
        data_out <= mem[rd_ptr];
        rd_ptr <= rd_ptr + 1;
        count <= count - 1;
      end
    end
  end
endmodule
