interface sram_if(input clk,rst);
logic [3:0] dout;
logic [3:0] addr;
logic [3:0] din;
logic wr;
modport dut(output dout,input din,addr,wr,clk,rst);
endinterface


