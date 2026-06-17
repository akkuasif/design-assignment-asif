
timescale 1ns / 1ps



module tb;

logic PCLK;
logic PRESETn;

logic start;
logic rw;
logic [7:0] addr;
logic [31:0] wdata;

logic PSEL;
logic PENABLE;
logic PWRITE;
logic [7:0] PADDR;
logic [31:0] PWDATA;

logic [31:0] PRDATA;
logic [31:0] rdata;

logic PREADY;
logic done;

apb_master master(
.PCLK(PCLK),
.PRESETn(PRESETn),
.start(start),
.rw(rw),
.addr(addr),
.wdata(wdata),
.PREADY(PREADY),
.PRDATA(PRDATA),
.PSEL(PSEL),
.PENABLE(PENABLE),
.PWRITE(PWRITE),
.PADDR(PADDR),
.PWDATA(PWDATA),
.rdata(rdata),
.done(done)
);

apb_slave slave(
.PCLK(PCLK),
.PRESETn(PRESETn),
.PSEL(PSEL),
.PENABLE(PENABLE),
.PWRITE(PWRITE),
.PADDR(PADDR),
.PWDATA(PWDATA),
.PRDATA(PRDATA),
.PREADY(PREADY)
);

always #5 PCLK = ~PCLK;

task write_apb(input [7:0] a,input [31:0] d);
begin
 @(posedge PCLK);
 addr  = a;
 wdata = d;
 rw    = 1;
 start = 1;

 @(posedge PCLK);
 start = 0;

 wait(done);
end
endtask

task read_apb(input [7:0] a);
begin
 @(posedge PCLK);
 addr  = a;
 rw    = 0;
 start = 1;

 @(posedge PCLK);
 start = 0;

 wait(done);

 $display("ADDR=%h DATA=%h",a,rdata);
end
endtask

initial
begin

 PCLK = 0;
 PRESETn = 0;
 start = 0;
 rw = 0;
 addr = 0;
 wdata = 0;

 #20;
 PRESETn = 1;

 write_apb(8'h00,32'h12345678);
 write_apb(8'h04,32'hABCDEF12);

 read_apb(8'h00);
 read_apb(8'h04);

 #50;
 $finish;

end

endmodule
