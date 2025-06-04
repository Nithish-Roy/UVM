class d_env extends uvm_env;
  
  `uvm_component_utils(d_env)
  
  d_agent      agt;
  d_scoreboard scr;
  
  function new(string name="d_env", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    agt = d_agent      :: type_id :: create("agt",this);
    scr = d_scoreboard :: type_id :: create("scr",this);
    
  endfunction
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    agt.mon.item_collected_port.connect(scr.item_collected_export);
    
  endfunction
  
endclass
  
