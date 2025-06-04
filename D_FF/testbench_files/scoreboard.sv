class d_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(d_scoreboard)
  
  uvm_analysis_imp#(d_seq_item,d_scoreboard)item_collected_export;
  d_seq_item tx_q[$];
  
  function new(string name="d_scoreboard", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export",this);
  endfunction
  
  function void write(d_seq_item tx);
    
    $display("------------------------------------------------------------------------------");
    
    if( ( (tx.d == tx.q) && (tx.q_b == ~tx.q) ) ||( (!tx.rst) && (tx.q==0) && (tx.q_b==1) ) )
      `uvm_info("SCOREBOARD = [PASSED]",$sformatf("TIME=%0t D=%b RST=%b Q=%b Q_B=%b",$time,tx.d,tx.rst,tx.q,tx.q_b),UVM_LOW)
    else
      `uvm_error("SCOREBOARD = [FAILED]",$sformatf("TIME=%0t D=%b RST=%b Q=%b Q_B=%b",$time,tx.d,tx.rst,tx.q,tx.q_b))
	    $display("------------------------------------------------------------------------------");

      
      
  endfunction
  
  
endclass
  
