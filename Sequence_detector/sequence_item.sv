class sequence_item extends uvm_sequence_item;

    `uvm_object_utils(sequence_item)

    function new(string name = "sequence_item");
        
    super.new(name);

    endfunction

    rand bit i_bit  ;

         bit flag   ;
  		
    rand bit rst	;

  constraint for_i_bit {i_bit dist {1:= 60, 0:= 40};}

endclass
