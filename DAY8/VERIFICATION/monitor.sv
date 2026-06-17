class monitor;

virtual apb_if vif;
mailbox mon2sb;

function new(mailbox mon2sb,
             virtual apb_if vif);

 this.mon2sb = mon2sb;
 this.vif    = vif;

endfunction

task run();

 transaction tr;

 forever
 begin

  @(posedge vif.done);

  tr = new();

  tr.addr = vif.PADDR;
  tr.rw   = vif.PWRITE;

  if(vif.PWRITE)
   tr.data = vif.PWDATA;
  else
   tr.data = vif.PRDATA;

  mon2sb.put(tr);

 end

endtask

endclass
