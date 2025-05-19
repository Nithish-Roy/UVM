//testbench.sv

`timescale 1ns/1ps

`include "uvm_macros.svh"

import uvm_pkg::*;

	`include "interface.sv"
	`include "sequence_item.sv"
	`include "sequence.sv"
	`include "sequencer.sv"
	`include "driver.sv"
	`include "monitor.sv"
	`include "agent.sv"
	`include "scoreboard.sv"
	`include "environment.sv"
	`include "test.sv"

    module top;

        bit clk;

        adder inf(.clk(clk));

        adder_design inst1(
          .clk   (inf.clk        )  ,
          .rst   (inf.rst        )  ,
          .data_1(inf.data_1     )  ,
          .data_2(inf.data_2     )  ,
          .out   (inf.out        )  
        );

        always #5 clk  = ~clk   ;
      
      initial begin 
        
        $dumpfile("dump.vcd");
        
        $dumpvars;
        
      end
       
    initial begin 

      uvm_config_db #(virtual adder)::set(null,"env.agnt.drv","vif", inf);
      
      uvm_config_db #(virtual adder)::set(null,"*","vif", inf);


    end

    initial begin 

        run_test("test");

    end


    initial begin

       #5000;

        $display("clock ended");

        $finish;

    end

    endmodule
