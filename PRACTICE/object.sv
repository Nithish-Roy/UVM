`include "uvm_macros.svh"

import uvm_pkg::*;

class my_object extends uvm_object;
  
  int arr [10];
  
  function new(string name = "my_object" );
    
    super.new(name);
  
    `uvm_info("HELLO", "iam nithish", UVM_LOW)
    
    endfunction
  
  function void gen();
    
    for(int i = 0; i < 10; i++) begin
      
      arr[i] = i * 2;
      
    end
    
  endfunction
  
  function void display();
    
    for(int i = 0; i < 10; i++) begin
      
      `uvm_info("array elements", $sformatf("array[%0d] = %0d", i, arr[i]), UVM_LOW)
      
    end
    
  endfunction
  
endclass

module tb;

  my_object m;
  
  initial begin
    
    m = new();
    
    m.gen();
    
    m.display();
    
  end
  
endmodule

// UVM_INFO testbench.sv(31) @ 0: reporter [array elements] array[0] = 0

// UVM_INFO testbench.sv(31) @ 0: reporter [array elements] array[1] = 2

// UVM_INFO testbench.sv(31) @ 0: reporter [array elements] array[2] = 4

// UVM_INFO testbench.sv(31) @ 0: reporter [array elements] array[3] = 6

// UVM_INFO testbench.sv(31) @ 0: reporter [array elements] array[4] = 8

// UVM_INFO testbench.sv(31) @ 0: reporter [array elements] array[5] = 10

// UVM_INFO testbench.sv(31) @ 0: reporter [array elements] array[6] = 12

// UVM_INFO testbench.sv(31) @ 0: reporter [array elements] array[7] = 14

// UVM_INFO testbench.sv(31) @ 0: reporter [array elements] array[8] = 16

// UVM_INFO testbench.sv(31) @ 0: reporter [array elements] array[9] = 18

  
  
