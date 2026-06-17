timescale 1ns / 1ps



module apb_master(
input logic PCLK,
input logic PRESETn,
input logic start,
input logic rw,
input logic [7:0] addr,
input logic [31:0] wdata,
input logic PREADY,
input logic [31:0] PRDATA,
output logic PSEL,
output logic PENABLE,
output logic PWRITE,
output logic [7:0] PADDR,
output logic [31:0] PWDATA,
output logic [31:0] rdata,
output logic done
);

typedef enum logic [1:0] {IDLE,SETUP,ACCESS} state_t;

state_t ps,ns;

always_ff @(posedge PCLK or negedge PRESETn)
begin
 if(!PRESETn)
  ps <= IDLE;
 else
  ps <= ns;
end

always_comb
begin
 ns = ps;

 case(ps)
  IDLE   : if(start) ns = SETUP;
  SETUP  : ns = ACCESS;
  ACCESS : if(PREADY) ns = IDLE;
  default: ns = IDLE;
 endcase
end

always_comb
begin
 PSEL    = 0;
 PENABLE = 0;
 PWRITE  = rw;
 PADDR   = addr;
 PWDATA  = wdata;
 done    = 0;
 rdata   = 0;

 case(ps)

  SETUP:
  begin
   PSEL = 1;
  end

  ACCESS:
  begin
   PSEL    = 1;
   PENABLE = 1;

   if(PREADY)
   begin
    done = 1;
    if(!rw)
     rdata = PRDATA;
   end
  end

 endcase
end
