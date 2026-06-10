
module sequence_detector_1110 (
    input clk,
    input reset,
    input sequence_in,
    output reg detector_out
);

    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    reg [1:0] current_state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always @(*) begin
        next_state = current_state;
        detector_out = 1'b0;

        case (current_state)
            S0: next_state = sequence_in ? S1 : S0;
            S1: next_state = sequence_in ? S2 : S0;
            S2: next_state = sequence_in ? S3 : S0;
            S3: begin
                if (sequence_in) begin
                    next_state = S3;
                    detector_out = 1'b0;
                end else begin
                    next_state = S0;
                    detector_out = 1'b1;
                end
            end
            default: next_state = S0;
        endcase
    end

endmodule
