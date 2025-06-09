class reset_sequence extends uvm_sequence#(sequence_item);
  
  `uvm_object_utils(reset_sequence)
  
  function new(string name = "reset_sequence");
    
    super.new(name);
    
  endfunction 
  
  task body();
    
    sequence_item item = sequence_item::type_id::create("item");
    
    begin 
      
      start_item(item);
      
      item.randomize() with {reset == 1;	send == 1'b0;	p_sel == 1'b0;	d_in == 8'b0;};
      
      finish_item(item);
      
    end
    
  endtask

endclass
