
interface apb_if(input bit PCLK);

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

endinterface
