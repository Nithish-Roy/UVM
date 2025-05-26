//testbench.sv

//timescale definition
`timescale 1ns/1ps

//importing uvm files

`include "uvm_macros.svh"

import uvm_pkg::*;


//including files in order
`include    "interface.sv" 
`include    "interface_tick.sv"
`include    "sequence_item.sv" 
`include    "rst_sequence.sv" 
`include    "norm_sequence.sv" 
`include    "sequencer.sv" 
`include    "driver.sv" 
`include    "monitor.sv" 
`include    "scoreboard.sv" 
`include    "agent.sv" 
`include    "environment.sv"  
`include    "test.sv" 
 

 //setting the parameters

module test;
  
  bit clk;
	
//interface instance
uart_tx vif(.clk(clk));

baud_ticker vif_b(.clk(clk)); 
      
//clock generation
        always #1 clk = ~clk;

//module instantiation        
uart_tx_top dut (
  .clk     (clk	     	), // system clock
  .reset   (vif.rst   	), // active-low reset
  .start   (vif.start   	), // start transmission
  .data    (vif.data    	), // byte to send
  .tx_out  (vif.tx_out  	),  // serial TX line
  .baud_wire(vif.baud_wire	)
);
       
//interface registration
 initial begin
   uvm_config_db #(virtual uart_tx)::set(null,"","vif", vif);
   uvm_config_db #(virtual baud_ticker)::set(null,"","vif_b", vif_b);

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
           #10000000;
           $display("THE END");
           $finish;
       end

    endmodule
        
