class alu_sequencer extends uvm_sequencer#(alu_sequence_item);
  
  `uvm_component_utils(alu_sequencer)
  
  
  //new constructor
  
  function new(string name = "alu_sequencer" , uvm_component parent);
	
    super.new(name, parent);
    
    endfunction
  
  //build_phase
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    `uvm_info("alu_sequencer", "BUILD PHASE OF ENV", UVM_HIGH)
    
    endfunction
  
  //connect phase 
  
    function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
    
      `uvm_info("alu_sequencer", "CONNECT PHASE OF ENV", UVM_HIGH)
    
    endfunction
  
endclass
