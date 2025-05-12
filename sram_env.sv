class sram_env extends uvm_env;
`uvm_component_utils(sram_env)

sram_active_agent ag1;
sram_passive_agent ag2;

sram_sb sb;

function new(string name="sram_sb",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
ag1=sram_active_agent::type_id::create("ag1",this);
ag2=sram_passive_agent::type_id::create("ag2",this);
sb=sram_sb::type_id::create("sb",this);
endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
ag1.mon.mon12sb.connect(sb.ip_fifo.analysis_export);
ag2.mon2.mon22sb.connect(sb.op_fifo.analysis_export);
endfunction

endclass
