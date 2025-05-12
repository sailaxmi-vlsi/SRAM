class sram_input_monitor extends uvm_monitor;
`uvm_component_utils(sram_input_monitor)

bit [3:0] mem [15:0];

sram_seq_item pkt;

virtual sram_if vif;

uvm_analysis_port#(sram_seq_item)mon12sb;

function new(string name="sram_input_monitor",uvm_component parent);
super.new(name,parent);
mon12sb=new("mon12sb",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
uvm_config_db#(virtual sram_if)::get(this,"","vif",vif);
endfunction

task run_phase(uvm_phase phase);
pkt=sram_seq_item::type_id::create("pkt");
forever
begin
@(posedge vif.clk) begin
pkt.din=vif.din;
pkt.addr=vif.addr;
pkt.wr=vif.wr;
end
begin
if(pkt.wr==1)
mem[pkt.addr]=pkt.din;
else 
pkt.dout=mem[pkt.addr];
end
mon12sb.write(pkt);
end
endtask
endclass
