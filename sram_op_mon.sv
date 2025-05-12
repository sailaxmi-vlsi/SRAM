class sram_output_monitor extends uvm_monitor;
`uvm_component_utils(sram_output_monitor)

sram_seq_item pkt2;
virtual sram_if vif;

uvm_analysis_port#(sram_seq_item)mon22sb;

function new(string name="sram_output_monitor",uvm_component parent);
super.new(name,parent);
mon22sb=new("mon22sb",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
uvm_config_db#(virtual sram_if)::get(this,"","vif",vif);
endfunction

task run_phase(uvm_phase phase);
pkt2=sram_seq_item::type_id::create("pkt2");
forever
begin
@(posedge vif.clk) begin
pkt2.dout=vif.dout;
mon22sb.write(pkt2);
end
//`uvm_info("output monitor",$sformatf("pkt2.dout=%d",pkt2.dout),UVM_NONE);
end

endtask
endclass
