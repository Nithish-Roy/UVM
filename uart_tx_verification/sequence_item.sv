class sequence_item extends uvm_sequence_item;

    `uvm_object_utils(sequence_item)

    function new(string name = "sequence_item");

        super.new(name);

    endfunction

    rand bit    [7:0]   data    ;

    rand bit            rst   ;   
    
    rand bit            start   ;

  		bit				tx_out	;
  
  		bit				baud_wire	;
  
   endclass


