class driver extends uvm_driver#(sequence_item);
  
  `uvm_component_utils(driver)
  
  sequence_item item	;
  
   virtual top vif_t	;

  function new(string name = "driver", uvm_component parent);
    
    super.new(name, parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);

     super.build_phase(phase);

    if(!(uvm_config_db #(virtual top):: get(null, "","vif_t",vif_t)))
            `uvm_error("driver","cannot get the vif from the config tb")

  endfunction
  
  task run_phase(uvm_phase phase);
    
    super.run_phase(phase);
    
    forever begin 
      
      seq_item_port.get_next_item(item);
      
      drive(item);
      
      seq_item_port.item_done();
      
    end
    
  endtask
     
  task drive(sequence_item item);
    
    vif_t.reset <= item.reset		;
    
    vif_t.send 	<= item.send		;
    
    vif_t.d_in	<= item.d_in		;
    
    vif_t.p_sel <= item.p_sel		;
    
    `uvm_info("drive_task",$sformatf("rst = %b ", item.reset), UVM_LOW);

    
  endtask
  
endclass
    
