class agent;

generator gen;
driver drv;
monitor mon;

function new(generator gen,
             driver drv,
             monitor mon);

 this.gen = gen;
 this.drv = drv;
 this.mon = mon;

endfunction

task run();

 fork
  gen.run();
  drv.run();
  mon.run();
 join_none

endtask

endclass
