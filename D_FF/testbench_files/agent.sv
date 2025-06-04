class d_agent extends uvm_agent;
  
  `uvm_component_utils(d_agent)
  
  d_monitor    mon;
  d_sequencer seqr;
  d_driver     drv;
  
  function new(string name="d_agent", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    mon  = d_monitor  :: type_id :: create("mon",this );
    seqr = d_sequencer:: type_id :: create("seqr",this);
    drv  = d_driver   :: type_id :: create("drv",this );
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
  
  
endclass
  
