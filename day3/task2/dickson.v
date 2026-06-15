module face_mod(input clk,
    input [7:0] S_in,
    output reg [7:0] S_out,
    output reg wr_en
);
    always @(posedge clk) begin
        S_out <= S_in;
        wr_en <= 1'b1;
    end
endmodule
