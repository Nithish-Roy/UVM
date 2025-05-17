//sequence_item.sv
class sequence_item extends uvm_sequence_item;
  
    `uvm_object_utils	(sequence_item)

  
  rand bit [7:0] data_1 ;
    
  rand bit [7:0] data_2 ;
  
  rand bit		 rst	;
  
  bit      [8:0] out    ;  
  
  function new(string name = "sequence_item");
    
    super.new(name);
    
  endfunction 
  

    constraint for_input {data_1 < 20; data_2 < 30;}

endclass

