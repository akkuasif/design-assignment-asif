class driver;

virtual apb_if vif;
mailbox gen2drv;

function new(mailbox gen2drv,
             virtual apb_if vif);

 this.gen2drv = gen2drv;
 this.vif     = vif;

endfunction

task run();

 transaction tr;

 forever
 begin

  gen2drv.get(tr);

  @(posedge vif.PCLK);

  vif.addr  <= tr.addr;
  vif.wdata <= tr.data;
  vif.rw    <= tr.rw;
  vif.start <= 1;

  @(posedge vif.PCLK);

  vif.start <= 0;

  wait(vif.done);

 end

endtask

endclass
