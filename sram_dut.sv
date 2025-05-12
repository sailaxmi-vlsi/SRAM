module sram_dut(sram_if.dut vif);
sram code(.clk(vif.clk),.rst(vif.rst),.wr(vif.wr),.din(vif.din),.addr(vif.addr),.dout(vif.dout));
endmodule

