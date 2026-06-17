`class transaction;

rand bit rw;
rand bit [7:0] addr;
rand bit [31:0] data;

constraint c_addr
{
 addr inside {8'h00,8'h04,8'h08,8'h0C};
}

function void display(string tag);
 $display("[%s] rw=%0d addr=%h data=%h",
           tag,rw,addr,data);
endfunction

endclass
