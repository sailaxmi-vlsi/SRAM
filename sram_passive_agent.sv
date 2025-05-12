class sram_passive_agent extends uvm_agent;
`uvm_component_utils(sram_passive_agent);

sram_output_monitor mon2;

function new(string name="sram_passive_agent",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
mon2=sram_output_monitor::type_id::create("mon2",this);
endfunction
endclass

