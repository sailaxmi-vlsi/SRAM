// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "interface.sv"
`include "dut.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "input_monitor.sv"
`include "output_monitor.sv"
`include "agent1.sv"
`include "agent2.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"
module sram_top();
bit clk;
bit rst;
initial
begin
clk=1'b0;
forever #5 clk=~clk;
end
initial begin
rst = 0;
#10 rst =1'b1;
end
sram_if vif(clk,rst);
sram_dut V_code(vif);
initial
begin
uvm_config_db #(virtual sram_if)::set(uvm_root::get(),"*","vif",vif);
run_test("sram_test");
end
endmodule
