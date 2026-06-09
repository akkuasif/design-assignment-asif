module usr_tb();

reg clk_tb, rst_tb, sin_tb,shift_tb,load_tb;
reg [1:0] mod_tb;
reg [3:0] pin_tb;
wire sout_tb;
wire [3:0] pout_tb;

usr dut(clk_tb,rst_tb,sin_tb,pin_tb,shift_tb,load_tb,mod_tb,sout_tb,pout_tb
);
initial begin
{clk_tb,rst_tb,sin_tb,pin_tb,shift_tb,load_tb,mod_tb}=0;
end
always #5 clk_tb = ~clk_tb;
initial begin
mod_tb = 2'b00;
shift_tb = 1;
sin_tb = 1; #10;
sin_tb = 0; #10;
sin_tb = 1; #10;
sin_tb = 1; #10;
shift_tb = 0;
load_tb = 1;
 #10;
 #10;
 #10;
 #10;
 load_tb = 0;
 mod_tb = 2'b01;
shift_tb = 1;
 sin_tb = 1; #10;
 sin_tb = 1; #10;
 sin_tb = 0; #10;
 sin_tb = 1; #10;
shift_tb = 0;
load_tb = 1; #10;
load_tb = 0;
mod_tb = 2'b10;
pin_tb = 4'b1010;
load_tb = 1; #10;
load_tb = 0;
shift_tb = 1;
 #10;
 #10;
 #10;
 #10;
 shift_tb = 0;
 mod_tb = 2'b11;
  pin_tb = 4'b1100;
load_tb = 1; #10;
load_tb = 0;
#20;
$finish;
end
endmodule
