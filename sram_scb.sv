class sram_sb extends uvm_scoreboard;
`uvm_component_utils(sram_sb)

sram_seq_item pkt,pkt2;

uvm_tlm_analysis_fifo#(sram_seq_item)ip_fifo;
uvm_tlm_analysis_fifo#(sram_seq_item)op_fifo;

function new(string name="sram_sb",uvm_component parent);
super.new(name,parent);
ip_fifo=new("ip_fifo",this);
op_fifo=new("op_fifo",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
pkt=sram_seq_item::type_id::create("pkt");
pkt2=sram_seq_item::type_id::create("pkt2");
endfunction

task run_phase(uvm_phase phase);
forever
begin
fork
ip_fifo.get(pkt);
op_fifo.get(pkt2);
join
if(pkt.dout==pkt2.dout) 
begin
`uvm_info("sb matched",$sformatf("pkt.dout=%d,pkt2.dout=%d",pkt.din,pkt2.dout),UVM_NONE);
end
else
begin
`uvm_info("sb notmatched",$sformatf("pkt.dout=%d,pkt2.dout=%d",pkt.din,pkt2.dout),UVM_NONE); 
end
end
endtask
endclass

