`include "uvm_macros.svh"

import uvm_pkg::*;

class datas extends uvm_object;

  int a[3];
  
  bit [7:0]byte_datas;

  `uvm_object_utils_begin(datas)
  
   `uvm_field_sarray_int(a, UVM_DEFAULT)
  
  `uvm_field_int(byte_datas, UVM_DEFAULT)
  
   `uvm_object_utils_end
  

  function new(string name="datas");
     
      super.new(name);
     
      this.a={1,2,3};
     
      this.byte_datas=8'h32;
     
   endfunction

endclass

class test extends uvm_test;
   
   `uvm_component_utils(test)

   function new(string name="test", uvm_component parent=null);
     
      super.new(name,parent);
     
   endfunction

   function void creater;
     
     datas d = datas::type_id::create("d");
     
      d.print();
     
   endfunction

endclass

module uvm_object_print_tb;
  
   test t;
  
   initial begin
     
     t=new();
     
     t.creater();
     
   end
  
endmodule

// ---------------------------------------
// Name          Type          Size  Value
// ---------------------------------------
// d             datas         -     @1837
//   a           sa(integral)  3     -    
//     [0]       integral      32    'h1  
//     [1]       integral      32    'h2  
//     [2]       integral      32    'h3  
//   byte_datas  integral      8     'h32 
// ---------------------------------------
