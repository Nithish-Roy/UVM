`include "uvm_macros.svh"

import uvm_pkg::*;

class object extends uvm_object;
  
  `uvm_object_utils(object)
  
  function new(string name = "o");
    
    super.new(name);
    
  endfunction
  
endclass

class test extends uvm_test;
  
  `uvm_component_utils(test)
  
    object o;
  
  function new(string name = "test",uvm_component parent = null);
    
    super.new(name, parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    if(o == null)
      
      `uvm_info( "nill" , "NO OBJECT PRESENT",UVM_NONE)
    
    else
      
      `uvm_info( "nill" , "OBJECT PRESENT",UVM_NONE)
    
    o = object::type_id::create("o");
    
    if(o == null)
      
      `uvm_info( "nill" , "NO OBJECT PRESENT",UVM_NONE)
    
    else
      
      `uvm_info( "nill" , "OBJECT PRESENT",UVM_NONE)

  endfunction
  
endclass

module top;
  
  initial begin 
    
    run_test("test");
    
  end
  
endmodule
    
    
// UVM_INFO @ 0: reporter [RNTST] Running test test...
    
// UVM_INFO testbench.sv(35) @ 0: uvm_test_top [nill] NO OBJECT PRESENT
    
// UVM_INFO testbench.sv(49) @ 0: uvm_test_top [nill] OBJECT PRESENT
    
// UVM_INFO /xcelium23.09/tools/methodology/UVM/CDNS-1.2/sv/src/base/uvm_report_server.svh(847) @ 0: reporter [UVM/REPORT/SERVER] 
    
