//testbench.sv

//timescale definition
`timescale 1ns/1ps

//importing uvm files

`include "uvm_macros.svh"

import uvm_pkg::*;


//including files in order
`include    "interface.sv" 
`include    "sequence_item.sv" 
`include    "sequence.sv" 
`include    "sequencer.sv" 
`include    "driver.sv" 
`include    "monitor.sv" 
`include    "scoreboard.sv" 
`include    "agent.sv" 
`include    "environment.sv"  
`include    "test.sv" 
 
 //setting the parameters
`define LENGTH 4

//module definition
    module testbench_top;

//signal declaration
        bit                 clk;
        bit [`LENGTH-1:0] PATTERN = 4'b1010; 
        
//interface instance
        seq_interface vif(.clk(clk));
      
//clock generation
        always #5 clk = ~clk;

//module instantiation        
        seq inst(
           .clk  (vif.clk       )       ,
           .rst  (vif.rst       )       ,
           .i_bit(vif.i_bit     )       ,
           .flag (vif.flag      )           );

//interface registration
 initial begin
		uvm_config_db #(virtual seq_interface)::set(null,"","vif", vif);
		uvm_config_db #(bit [`LENGTH-1:0] )::set(null,"","PATTERN", PATTERN);
 end
 
//test run      
      initial begin 
        run_test("test");
      end
        
      
//dumpfile and dumpvars
       initial begin 
           $dumpfile("dump.vcd");
           $dumpvars();
       end
       
//the end
       initial begin 
           #5000;
           $display("THE END");
           $finish;
       end

    endmodule
        
    
