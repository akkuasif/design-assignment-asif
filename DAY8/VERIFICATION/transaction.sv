`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "env.sv"
`include "test.sv"

module top;

bit PCLK;

always #5 PCLK = ~PCLK;

apb_if vif(PCLK);

apb_master master(
 .PCLK(PCLK),
 .PRESETn(vif.PRESETn),
 .start(vif.start),
 .rw(vif.rw),
 .addr(vif.addr),
 .wdata(vif.wdata),
 .PREADY(vif.PREADY),
 .PRDATA(vif.PRDATA),
 .PSEL(vif.PSEL),
 .PENABLE(vif.PENABLE),
 .PWRITE(vif.PWRITE),
 .PADDR(vif.PADDR),
 .PWDATA(vif.PWDATA),
 .rdata(vif.rdata),
 .done(vif.done)
);

apb_slave slave(
 .PCLK(PCLK),
 .PRESETn(vif.PRESETn),
 .PSEL(vif.PSEL),
 .PENABLE(vif.PENABLE),
 .PWRITE(vif.PWRITE),
 .PADDR(vif.PADDR),
 .PWDATA(vif.PWDATA),
 .PRDATA(vif.PRDATA),
 .PREADY(vif.PREADY)
);

mailbox gen2drv = new();
mailbox mon2sb  = new();

generator  gen;
driver     drv;
monitor    mon;
scoreboard sb;
agent      agt;
env        e;
test       t;

initial
begin

 PCLK = 0;
 vif.PRESETn = 0;

 #20;
 vif.PRESETn = 1;

 gen = new(gen2drv);
 drv = new(gen2drv,vif);
 mon = new(mon2sb,vif);
 sb  = new(mon2sb);

 agt = new(gen,drv,mon);
 e   = new(agt,sb);
 t   = new(e);

 t.run();

 #1000;
 $finish;

end

endmodule
