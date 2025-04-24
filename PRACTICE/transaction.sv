`include "uvm_macros.svh"

import uvm_pkg::*;

class my_trans extends uvm_transaction;
  
  rand bit [7:0] array [10];
  
  constraint for_array{foreach(array[i]) 
    					
    array[i] < 10;}
  
  function new(string name = "my_trans");
    
    super.new(name);
  
    `uvm_info("HELLO", "iam nithish", UVM_LOW)	
    
  endfunction
  
  function void display();
    
    `uvm_info("Randomize", $sformatf("[%0t]a = %p",$time , array) ,UVM_LOW)
  
  endfunction
    
    
endclass


module tb;
  
    my_trans m;


  initial begin
    
    m = new();
    
    repeat(3)begin
      
      m.randomize();
    
    m.display();
    
    end
    
  end
  
endmodule

// UVM_INFO testbench.sv(17) @ 0: reporter [HELLO] iam nithish
// UVM_INFO testbench.sv(23) @ 0: reporter [Randomize] [0]a = '{'h0, 'h8, 'h9, 'h3, 'h7, 'h6, 'h4, 'h8, 'h3, 'h7}
// UVM_INFO testbench.sv(23) @ 0: reporter [Randomize] [0]a = '{'h8, 'h3, 'h0, 'h9, 'h3, 'h0, 'h2, 'h2, 'h7, 'h2}
// UVM_INFO testbench.sv(23) @ 0: reporter [Randomize] [0]a = '{'h5, 'h5, 'h7, 'h7, 'h1, 'h6, 'h4, 'h3, 'h2, 'h0}

  
  
