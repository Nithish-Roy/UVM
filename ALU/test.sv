class alu_test extends uvm_test;
  
  `uvm_component_utils(alu_test)
  
  alu_env env;
  
  alu_sequence reset_seq;
  
  alu_n_sequence test_seq;
  
  //new constructor
  
  function new (string name = "alu_test", uvm_component parent);
    
    super.new(name, parent);
    
   endfunction
  
  //build_phase
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    `uvm_info("TEST", "IN BUILD OF TEST", UVM_HIGH)
    
    env = alu_env::type_id::create("env",this);
    
  endfunction
  
  //connect phase
  
  function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
    
    `uvm_info("TEST", "IN CONNECT OF TEST", UVM_HIGH)
    
  endfunction
  
  //task on run phase it can containg timing values 
  
  task run_phase(uvm_phase phase);
    
    super.run_phase(phase);
    
    `uvm_info("TEST","IN RUN PHASE OF TEST", UVM_HIGH)
    
    phase.raise_objection(this);
    
    reset_seq = alu_sequence::type_id::create("reset_seq");	
    
    reset_seq.start(env.agnt.seqr);
    
    #10;
    
    repeat(100) begin
      
      test_seq = alu_n_sequence::type_id::create("test_seq");
      
      test_seq.start(env.agnt.seqr);
      
      #10;
      
    end
    
    phase.drop_objection(this);	
    
  endtask
  
endclass
