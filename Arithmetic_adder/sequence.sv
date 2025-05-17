//sequence.sv

class sequence_reset extends uvm_sequence;

  `uvm_object_utils(sequence_reset)
  
  sequence_item rst_seq;

  function new(string name ="sequence_reset");

	super.new(name);

	endfunction

task body();

`uvm_info("sequence", "inside task", UVM_HIGH);

 rst_seq = sequence_item::type_id::create("rst_seq");

  start_item(rst_seq);
    
  rst_seq.randomize() with {rst == 1'b1;};

  finish_item(rst_seq);

endtask

endclass

class sequence_normal extends sequence_reset;
  
  `uvm_object_utils(sequence_normal)

    sequence_item normal_seq;

    function new(string name = "sequence normal");

    super.new(name);

    endfunction

    task body();

    normal_seq = sequence_item::type_id::create("normal_seq");

    start_item(normal_seq);

    normal_seq.randomize() with {rst == 1'b0;};

    finish_item(normal_seq);

    endtask

endclass
    
