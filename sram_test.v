class sram_test extends uvm_test;
`uvm_component_utils(sram_test)

sram_env env;
sram_sequence seq;

function new(string name="sram_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
env=sram_env::type_id::create("env",this);
seq=sram_sequence::type_id::create("seq",this);
endfunction

task run_phase(uvm_phase phase);
begin
phase.raise_objection(this);
seq.start(env.ag1.seqr);
phase.drop_objection(this); 
end
endtask

endclass
