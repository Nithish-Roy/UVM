class alu_driver extends uvm_driver#(alu_sequence_item);
  
  `uvm_component_utils(alu_driver)
  
  virtual alu_interface vif;
  
  alu_sequence_item item;	
  
  //new constructor
  
  function new(string name = "alu_driver" , uvm_component parent);
	
    super.new(name, parent);
    
    endfunction
  
  //build_phase
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    `uvm_info("alu_driver", "BUILD PHASE OF ENV", UVM_HIGH)
    
    if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif))) 
    
       `uvm_error("DRIVER CLASS", "FAILED TO GET VIRTUAL INTERFACE FROM CONFIG DB")
       
    endfunction
  
  //connect phase 
  
    function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
    
      `uvm_info("alu_driver", "CONNECT PHASE OF ENV", UVM_HIGH)
    
    endfunction
       
  //run phase 
  
  task run_phase (uvm_phase phase);
    
    super.run_phase(phase);
    
    forever begin
          
	item = alu_sequence_item::type_id::create("item");
    
    seq_item_port.get_next_item(item);
    
    drive(item);
    
    seq_item_port.item_done();
    
    end
      
    
  endtask
       
	//driving logic
       
task drive(alu_sequence_item item);
         
         @(posedge vif.clk)
         
         vif.reset <= item.reset;
         
         vif.A <= item.a;
         
         vif.B <= item.b;
         
         vif.select_line <= item.opcode;
         
endtask
  
endclass
