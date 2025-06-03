class d_sequencer extends uvm_sequencer#(d_seq_item);
  
  `uvm_component_utils(d_sequencer)
  
  function new(string name="d_sequencer", uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass
  
