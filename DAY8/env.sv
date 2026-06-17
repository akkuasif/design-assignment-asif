class env;

agent agt;
scoreboard sb;

function new(agent agt,
             scoreboard sb);

 this.agt = agt;
 this.sb  = sb;

endfunction

task run();

 fork
  agt.run();
  sb.run();
 join_none

endtask

endclass
