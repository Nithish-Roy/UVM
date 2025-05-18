class scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(scoreboard)
  
    uvm_analysis_imp #(sequence_item, scoreboard) scr_port;
  
  	sequence_item transactions[$];
  
    function new(string name = "scoreboard" , uvm_component parent);
	
    super.new(name, parent);
    
    endfunction
  
    function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
      `uvm_info("scoreboard", "BUILD PHASE OF ENV", UVM_HIGH)
    
       scr_port = new("scr_port", this);
 
    endfunction
  
      function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
    
      `uvm_info("alu_scoreboard", "CONNECT PHASE OF ENV", UVM_HIGH)
    
    endfunction
  
    function void write(sequence_item item);
    
    transactions.push_back(item);
      
  	endfunction
  
  task run_phase (uvm_phase phase);
    
    super.run_phase(phase);
    
    forever begin 
      
      sequence_item temp;
           
      wait(transactions.size != 0)
      
      temp = transactions.pop_front();
      
      calculate(temp);
      
    end
    
  endtask
  
  task calculate(sequence_item item);
    
    if(item.rst == 1 && item.out == 0) 
      
      `uvm_info("scoreboard", "reset_pass", UVM_LOW)
    
    else if(item.rst == 0 && (item.data_1 + item.data_2  == item.out)) begin 
      
      `uvm_info("scoreboard","test_pass",UVM_LOW)
      
    end
    
      else 
        
        `uvm_info("scorebaord", "test_fail", UVM_LOW)
    
  endtask
  
    endclass
