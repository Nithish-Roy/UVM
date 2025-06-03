class d_sequence extends uvm_sequence;
  
  `uvm_object_utils(d_sequence)
  
  d_seq_item tx;
  
  function new(string name="d_sequence");
    super.new(name);
  endfunction
  
  task body();
    repeat(15)begin
      
      tx = d_seq_item :: type_id :: create("tx"); 
      `uvm_do(tx)
    end
    
  endtask
  
endclass
  
