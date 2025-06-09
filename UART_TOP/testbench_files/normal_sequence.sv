class normal_sequence extends uvm_sequence #(sequence_item);
  
  `uvm_object_utils(normal_sequence)
  
  function new(string name = "normal_sequence");
    
    super.new(name);
    
  endfunction 
  
  task body();
    
    sequence_item item = sequence_item::type_id::create("item");
    
    begin 
      
      start_item(item);
      
      item.randomize() with {reset == 1'b0; send == 1'b1;};
      
      finish_item(item);
      
    end
    
  endtask
  
endclass
