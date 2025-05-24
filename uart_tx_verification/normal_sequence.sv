class norm_seq extends uvm_sequence #(sequence_item);

    `uvm_object_utils(norm_seq)
  
    function new(string name = "norm_seq"); 

        super.new(name);
      
    endfunction

    task body();
        
        sequence_item item = sequence_item::type_id::create("item");

		 begin 

            start_item(item);

          	item.randomize() with {rst == 1'b1; start == 1'b1;};

            finish_item(item);
        
        end


      
    endtask

endclass
