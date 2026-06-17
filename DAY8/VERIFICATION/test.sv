class test;

env e;

function new(env e);
 this.e = e;
endfunction

task run();

 e.run();

 #1000;

endtask

endclass
