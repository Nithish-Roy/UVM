`include "uvm_macros.svh"

import uvm_pkg::*;

class datas extends uvm_sequence_item;

  	rand int a[3];
  
  	rand bit [7:0]b;

  	rand bit [3:0] c;
  
  `uvm_object_utils_begin(datas)
  
  `uvm_field_sarray_int(a, UVM_ALL_ON)
  
  `uvm_field_int(b, UVM_ALL_ON)

  `uvm_field_int(c, UVM_ALL_ON)

  `uvm_object_utils_end


  function new(string name="datas");
     
      super.new(name);
     
   endfunction

endclass

module testing;
  
  datas d1;

  datas d2;
  
   initial begin
            
     d1 = datas::type_id::create("d1");
     
     d2 = datas::type_id::create("d2");

     d1.randomize();
	
     d1.print();
     
     d2.copy(d1);
	
     d2.print();

   end
  
endmodule

// ---------------------------------------
// Name     Type          Size  Value     
// ---------------------------------------
// d1       datas         -     @1799     
//   a      sa(integral)  3     -         
//     [0]  integral      32    'hce4bd0f4
//     [1]  integral      32    'hd56cc107
//     [2]  integral      32    'h55e21cc9
//   b      integral      8     'h17      
//   c      integral      4     'hd       
// ---------------------------------------


// ---------------------------------------
// Name     Type          Size  Value     
// ---------------------------------------
// d2       datas         -     @1809     
//   a      sa(integral)  3     -         
//     [0]  integral      32    'hce4bd0f4
//     [1]  integral      32    'hd56cc107
//     [2]  integral      32    'h55e21cc9
//   b      integral      8     'h17      
//   c      integral      4     'hd       
// ---------------------------------------

