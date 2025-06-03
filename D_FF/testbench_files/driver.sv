class d_driver extends uvm_driver#(d_seq_item);
  
  `uvm_component_utils(d_driver)
  
  virtual d_int inst;
  d_seq_item tx;
  
  function new(string name="d_driver", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(virtual d_int)::get(this,"*","vif",inst))
      `uvm_fatal("No interface in the driver","virtual interface is failed in the config db")
     
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
    
    seq_item_port.get_next_item(tx);
    drive(tx);
    seq_item_port.item_done();
    
   end
  endtask
  
    task drive(d_seq_item tx);
      
      @(posedge inst.clk)
     
      inst.d = tx.d;
      inst.rst = tx.rst;
      
      `uvm_info("DRIVE TASK",$sformatf("TIME=%0t D=%b RST=%b",$time,inst.d,inst.rst),UVM_LOW)
      #1;
    endtask
    

  
endclass
  
