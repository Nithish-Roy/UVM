class alu_agent extends uvm_agent;
  
  `uvm_component_utils(alu_agent)
  
  alu_sequencer seqr;
  
  alu_driver 	drv;
  
  alu_monitor	mon;
  
  //new constructor
  
  function new(string name = "alu_agent" , uvm_component parent);
	
    super.new(name, parent);
    
    endfunction
  
  //build_phase
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    `uvm_info("ALU_AGENT", "BUILD PHASE OF ENV", UVM_HIGH)
    
    
    seqr = alu_sequencer::type_id::create("seqr",this);
    
    drv = alu_driver::type_id::create("drv",this);
    
    mon =  alu_monitor::type_id::create("mon",this);
    
    
    
    endfunction
  
  //connect phase 
  
    function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
    
      `uvm_info("ALU_AGENT", "CONNECT PHASE OF ENV", UVM_HIGH)
      
      drv.seq_item_port.connect(seqr.seq_item_export);
    
    endfunction
  
  task run_phase (uvm_phase phase);
    
    super.run_phase(phase);
    
  endtask
  
endclass
