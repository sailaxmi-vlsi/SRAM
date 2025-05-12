class sram_sequence extends uvm_sequence#(sram_seq_item);
`uvm_object_utils(sram_sequence)
sram_seq_item pkt;

function new(string name="sram_sequence");
super.new(name);
endfunction

task body();
pkt=sram_seq_item::type_id::create("pkt");
repeat(10)
begin
start_item(pkt);
pkt.wr=1;
assert(pkt.randomize());
finish_item(pkt);
#30;
start_item(pkt);
pkt.wr=0;#15
finish_item(pkt);
end
endtask

endclass
/*class sram_sequence extends uvm_sequence #(sram_seq_item);
sram_seq_item pkt;
string str_cfg,data_cfg,addr_cfg;
`uvm_declare_p_sequencer(sequencer)
`uvm_object_utils_begin(sram_sequence)
`uvm_field_string(str_cfg, UVM_DEFAULT)
`uvm_field_string(data_cfg, UVM_DEFAULT)
`uvm_field_string(addr_cfg, UVM_DEFAULT)
`uvm_object_utils_end
function new(string name ="sram_sequence");
super.new(name);
endfunction
virtual task body();
pkt=sram_seq_item::type_id::create("pkt");
void'(p_sequencer.get_config_string("str_cfg",str_cfg));
void'(p_sequencer.get_config_string("data_cfg",data_cfg));
void'(p_sequencer.get_config_string("addr_cfg",addr_cfg));
$display(" string %s %s %s ",str_cfg,data_cfg,addr_cfg);
case(str_cfg)
"WR_RD":repeat(10)
begin
start_item(t);
pkt.din=calc_datain(s_data);
pkt.addr=calc_addr(s_addr);
pkt.wr=1;
pkt.rd=0;
finish_item(pkt);
start_item(pkt);
pkt.rd=1;pkt.wr=0;
finish_item(pkt);
$display("------------sequence generated-------------");
$display("wr=%d rd=%d din=%d addr=%d",pkt.wr,pkt.rd,t.dataIn,t.addr);
end
	"WR":repeat(10)
		begin
		start_item(t);
			t.dataIn=calc_datain(s_data);
			t.addr=calc_addr(s_addr);
			t.wr=1;t.rd=0;
		finish_item(t);
		
		$display("------------sequence generated-------------");

		$display("wr=%d rd=%d datain=%d addr=%d",t.wr,t.rd,t.dataIn,t.addr);
		end
	endcase
	endtask

	
	virtual function [7:0] calc_datain(string s_data);
	begin
 		case(s_data)
			"random":begin 
				datainout=$random; 
				return datainout;
			end    
			"increment":begin  
				return datainout++;
				end
		endcase
	end
	endfunction
  
	virtual function [3:0] calc_addr(string s_addr);
	begin
 		case(s_addr)
			"random":begin 
				addrinout=$random;
				return addrinout;
				end                                                                                                    
			"increment":begin 
				return addrinout++;
				end
		endcase
	end
	endfunction
	
	
endclass*/

