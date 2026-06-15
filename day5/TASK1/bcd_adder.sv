`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 17:56:09
// Design Name: 
// Module Name: bcd_adder
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


module bcd_adder(
input logic [3:0] a,
  input logic [3:0] b,
  input logic       cin,
  output logic [3:0] sum,
  output logic       cout
);
  logic [4:0] temp;
  assign temp = a + b + cin;
  
  always_comb begin
    if (temp > 9) begin
      sum = temp + 6;
      cout = 1;
    end else begin
      sum = temp;
      cout = 0;
    end
  end
endmodule
