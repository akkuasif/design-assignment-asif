
module bcd_adder(
    input [3:0] a, 
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
    );
    
    wire [3:0] sum1;        
    wire cout1;             
    wire correction_carry;  
    wire ignore_cout;
    
    rca_4bit rca1 (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum1),
        .cout(cout1)
    );
    
        assign correction_carry = cout1 | (sum1[3] & sum1[2]) | (sum1[3] & sum1[1]);
        wire [3:0] correction_word = {1'b0, correction_carry, correction_carry, 1'b0};
        
    rca_4bit rca2 (
        .a(sum1),
        .b(correction_word),
        .cin(1'b0),          
        .sum(sum),
        .cout(ignore_cout)  
    );
    
    assign cout = correction_carry;

endmodule
