class sram_active_agent extends uvm_agent;
`uvm_component_utils(sram_active_agent)

sram_sequencer seqr;
sram_driver drv;
sram_input_monitor mon;

function new(string name="sram_active_agent",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
seqr=sram_sequencer::type_id::create("seqr",this);
drv=sram_driver::type_id::create("drv",this);
mon=sram_input_monitor::type_id::create("mon",this);
endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
drv.seq_item_port.connect(seqr.seq_item_export);
endfunction

endclass

