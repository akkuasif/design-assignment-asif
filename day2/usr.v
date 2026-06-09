module usr(input clk,rst,sin,input [3:0]pin,input shift,load,input [1:0]mod,output reg sout,output reg [3:0]pout);
reg [3:0]temp;
always @(posedge clk)
begin
if (rst)
temp<=4'b0000;
else if (mod==2'b00)
begin
if(shift)
begin
temp<={sin,temp[3:1]};
end
else if(load)
begin
sout<=temp[0];
temp<=temp>>1'b1;
end
end
else if(mod==2'b01)
begin
if(shift)
begin
temp<={sin,temp[3:1]};
end
else if (load)
begin
pout<=temp;
end
end
else if(mod==2'b10)
begin
if (load) 
temp<=pin;
else if(shift)
begin
sout<=temp[0];
temp<=temp>>1'b1;
end
end
else if(mod==2'b11)
begin
if (load)
begin
temp<=pin;
pout<=pin;
end
end
end


endmodule
