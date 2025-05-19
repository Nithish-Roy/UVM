class alu_sequence_item extends uvm_sequence_item;
  
  `uvm_object_utils(alu_sequence_item)
  
  
  //new constructor
  
  function new(string name = "alu_sequence_item");
	
    super.new(name);
    
    endfunction
  
  //randomization signals declaration
  
  rand logic reset;
  
  rand logic [7:0] a;
  
  rand logic [7:0] b;
  
  rand logic [3:0] opcode;
  
  logic [7:0] out;
  
  logic carry;
  
	//constraints
  
  constraint for_a { a inside {[1:10]};}
  
  constraint for_b { b inside {[1:5]};}
  
  constraint for_ab { a > b ;}
  
  constraint for_opcode { opcode inside {[0:3]};}
  
  
  
endclass
