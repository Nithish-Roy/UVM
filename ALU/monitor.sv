class alu_monitor extends uvm_monitor;
  
  `uvm_component_utils(alu_monitor)
  
  alu_sequence_item item;
  
  virtual alu_interface vif;
  
  uvm_analysis_port #(alu_sequence_item) mon_port;
  
  //new constructor
  
  function new(string name = "alu_monitor" , uvm_component parent);
	
    super.new(name, parent);
    
    endfunction
  
  //build_phase
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    `uvm_info("alu_monitor", "BUILD PHASE OF ENV", UVM_HIGH)
    
    mon_port = new("mon_port", this);
    
    if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif)))
       
       `uvm_error("MONITOR", "UNABLE TO GET THE VIF")
    
    endfunction
  
  //connect phase 
  
    function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
    
      `uvm_info("alu_monitor", "CONNECT PHASE OF ENV", UVM_HIGH)
    
    endfunction
  
  task run_phase (uvm_phase phase);
    
    super.run_phase(phase);
    
    item = alu_sequence_item::type_id::create("item");
    
   	//mon_logic_task
    
    wait(!vif.reset);
    
    forever begin
    
    mon();
    end
    
      
  endtask
       
       task mon;
         
         @(posedge vif.clk)
         
         	item.a = vif.A;
         
         	item.b = vif.B;
         	
	        item.opcode = vif.select_line;

         	item.reset = vif.reset;
         
         @(posedge vif.clk)
         
         	item.out = vif.out;
         
         	item.carry = vif.carry;
       
         mon_port.write(item);
         
       endtask
         
         
endclass
