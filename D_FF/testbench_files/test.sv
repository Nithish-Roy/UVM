class d_test extends uvm_test;
  
  `uvm_component_utils(d_test)
  
  d_env      env;
  d_sequence seq;
  
  
  function new(string name="d_test", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    env = d_env      :: type_id :: create("env",this);
    seq = d_sequence :: type_id :: create("seq",this);
    
  endfunction
  
  //no connect phase
  //elaboration
  function void end_of_elaboration();
    print();
  endfunction
  
  task run_phase(uvm_phase phase);
    
    
    phase.raise_objection(this);
    
    
    seq.start(env.agt.seqr);
        
    
    phase.drop_objection(this);
    
  endtask
  
  
endclass
  
