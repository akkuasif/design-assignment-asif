module block_ram (
    input wire clk,
    input wire arstn,
    input wire wrenb,
    input wire [7:0] wraddres,
    input wire [7:0] rdaddres,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

    reg [7:0] mem [0:255];
    integer i;

    always @(posedge clk or negedge arstn) begin
        if (!arstn) begin
            data_out <= 8'b0;
            for (i = 0; i < 256; i = i + 1) begin
                mem[i] <= 8'b0;
            end
        end else begin
            if (wrenb == 1'b1) begin
                mem[wraddres] <= data_in;
            end else begin
                data_out <= mem[rdaddres];
            end
        end
    end

endmodule
