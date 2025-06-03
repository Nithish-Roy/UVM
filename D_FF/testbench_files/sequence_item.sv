class d_seq_item extends uvm_sequence_item;
  
  `uvm_object_utils(d_seq_item)
  
  rand bit d  ;
  rand bit rst;
  bit q  ;
  bit q_b;
  
  constraint rst_bit {rst dist {1:= 10, 0:= 90};}
  
  function new(string name="d_Seq_item");
    super.new(name);
  endfunction
  
endclass
