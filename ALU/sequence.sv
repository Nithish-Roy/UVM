class alu_sequence extends uvm_sequence;
  
  `uvm_object_utils(alu_sequence)
  
  alu_sequence_item reset_seq;
  
  
  //new constructor
  
  function new(string name = "alu_sequence");
	
    super.new(name);
    
    endfunction
  

  //task
  
  task body ();
    
    `uvm_info("alu_sequence" , " BODY TASK", UVM_HIGH);
    
    reset_seq = alu_sequence_item::type_id::create("reset_seq");
    
    start_item(reset_seq);
    
    reset_seq.randomize() with {reset == 1;};
    
    finish_item(reset_seq);
    
  endtask
  
endclass

class alu_n_sequence extends alu_sequence;
  
  `uvm_object_utils(alu_n_sequence)
  
  alu_sequence_item n_seq;
  
  
  //new constructor
  
  function new(string name = "alu_n_sequence");
	
    super.new(name);
    
    endfunction
  

  //task
  
  task body ();
    
    `uvm_info("alu_n_sequence" , " BODY TASK", UVM_HIGH);
    
    n_seq = alu_sequence_item::type_id::create("n_seq");
    
    start_item(n_seq);
    
    n_seq.randomize() with {reset == 0;};
    
    finish_item(n_seq);
    
  endtask
  
endclass
