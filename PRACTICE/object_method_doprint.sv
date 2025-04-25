`include "uvm_macros.svh"

import uvm_pkg::*;

class datas extends uvm_object;

  int a[3];
  
  bit [7:0]byte_datas;

  `uvm_object_utils(datas)

  function new(string name="datas");
     
      super.new(name);
     
      this.a={1,2,3};
     
      this.byte_datas=8'h32;
     
   endfunction

  function void do_print(uvm_printer printer); //function is passed with the argument of class uvm printer
 
    super.do_print(printer);	//calling the do printer function by passing the handle name as argumernt

  foreach (a[i]) begin
    printer.print_field($sformatf("a[%0d]", i), a[i], 32, UVM_DEC); //using the print field method inside the uvm printer to display the output
  end

  printer.print_field("byte_datas", byte_datas, 8, UVM_HEX);

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

// -----------------------------------
// Name          Type      Size  Value
// -----------------------------------
// d             datas     -     @1837
//   a[0]        integral  32    'd1  
//   a[1]        integral  32    'd2  
//   a[2]        integral  32    'd3  
//   byte_datas  integral  8     'h32 
// -----------------------------------

