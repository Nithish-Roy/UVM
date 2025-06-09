class sequence_item extends uvm_sequence_item;
  
    `uvm_object_utils(sequence_item)

    function new(string name = "sequence_item");

        super.new(name);

    endfunction
  
    rand	logic			reset			;
    rand	logic			send 			;
    rand	logic			p_sel 			;
    rand 	logic	[7:0]	d_in			;
  
  			bit 			tx				;
  			bit				rx				;
			bit		[7:0]	d_out			;
  			bit				p_error			;
  			bit				stop_error		;
  
endclass
  
  
  
   
   
   
   
   
