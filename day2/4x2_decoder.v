module encoder4by2(input[3:0]d,output reg [1:0]b);
always @(*)
begin
if (d==4'b0001)
b=2'b00;
else if(d==4'b0010)
b=2'b01;
else if(d==4'b0100)
b=2'b10;
else if(d==4'b1000)
b=2'b11;
else
b=2'bXX;
end
endmodule
