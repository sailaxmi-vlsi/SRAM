class sram_seq_item extends uvm_sequence_item;
`uvm_object_utils(sram_seq_item)
rand bit [3:0] din;
rand bit [3:0] addr;
rand bit [3:0] dout;
bit wr;
function new(string name = "sram_seq_item");
super.new(name);
endfunction
  
endclass
