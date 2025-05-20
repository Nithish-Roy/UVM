class alu_env extends uvm_env;
  
  `uvm_component_utils(alu_env)
  
  alu_agent agnt;
  
  alu_scoreboard scr;
  
  //new constructor
  
  function new(string name = "alu_env" , uvm_component parent);
	
    super.new(name, parent);
    
    endfunction
  
  //build_phase
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    `uvm_info("ALU_ENV", "BUILD PHASE OF ENV", UVM_HIGH)
    
    agnt = alu_agent::type_id::create("agnt",this);
    
    scr = alu_scoreboard::type_id::create("scr",this);

    
    endfunction
  function void end_of_elaboration_phase(uvm_phase phase);
    
    super.end_of_elaboration_phase(phase);
    
    `uvm_info("TB", "Printing UVM Hierarchical Topology", UVM_MEDIUM)
    
    uvm_top.print_topology();
    
endfunction

  
  
  
  //connect phase 
  
    function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
    
      `uvm_info("ALU_ENV", "CONNECT PHASE OF ENV", UVM_HIGH)
      
      agnt.mon.mon_port.connect(scr.scr_port);
    
    endfunction
  
  task run_phase (uvm_phase phase);
    
    super.run_phase(phase);
    
  endtask
  
endclass
