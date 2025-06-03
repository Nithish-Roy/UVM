class d_monitor extends uvm_monitor;
  
  `uvm_component_utils(d_monitor)
  
  virtual d_int inst;
  d_seq_item tx;
  uvm_analysis_port#(d_seq_item)item_collected_port;
  
  function new(string name="d_monitor", uvm_component parent);
    super.new(name,parent);
    item_collected_port = new("item_collected_port",this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(virtual d_int)::get(this,"*","vif",inst))
            `uvm_fatal("No interface in the driver","virtual interface get failed in the config db")
  endfunction
  
  
  task run_phase(uvm_phase phase);
    tx = d_seq_item :: type_id :: create("tx");

    repeat(10)begin
      
//       wait(!inst.rst);
      
      @(negedge inst.clk)
//       #1;
      
      tx.d   = inst.d;
      tx.rst = inst.rst;
      tx.q   = inst.q;
      tx.q_b = inst.q_b;
      
      
      `uvm_info("MONITOR TASK",$sformatf("TIME=%0t D=%b RST=%b Q=%b Q_B=%b",$time,tx.d,tx.rst,tx.q,tx.q_b),UVM_LOW)
      item_collected_port.write(tx);
      
    end
    
  endtask
  
  
  
endclass
  
