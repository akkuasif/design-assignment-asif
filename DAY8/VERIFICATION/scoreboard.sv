class scoreboard;

mailbox mon2sb;

bit [31:0] mem[4];

function new(mailbox mon2sb);

 this.mon2sb = mon2sb;

endfunction

task run();

 transaction tr;

 forever
 begin

  mon2sb.get(tr);

  if(tr.rw)
  begin

   case(tr.addr)

    8'h00: mem[0]=tr.data;
    8'h04: mem[1]=tr.data;
    8'h08: mem[2]=tr.data;
    8'h0C: mem[3]=tr.data;

   endcase

  end

  else
  begin

   case(tr.addr)

    8'h00:
      if(mem[0]==tr.data)
       $display("PASS");

    8'h04:
      if(mem[1]==tr.data)
       $display("PASS");

    8'h08:
      if(mem[2]==tr.data)
       $display("PASS");

    8'h0C:
      if(mem[3]==tr.data)
       $display("PASS");

   endcase

  end

 end

endtask

endclass
