//monitor.sv
class monitor extends uvm_monitor;

    `uvm_component_utils(monitor)

    virtual seq_interface vif;

    uvm_analysis_port #(sequence_item) mon_port;

    function new(string name = "monitor", uvm_component parent);

        super.new(name,parent);

    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        mon_port = new("mon_port",this);

      if(!(uvm_config_db #(virtual seq_interface)::get(this, "", "vif", vif))) begin 

            `uvm_error("DRIVER", "cannot get the interface from config_db");

        end

        endfunction

task run_phase(uvm_phase phase);

    super.build_phase(phase);

    forever begin

        sequence_item item;
        
        item = sequence_item::type_id::create("item");
      
        mon(item);

        
end

endtask

task mon(sequence_item item);

  @(negedge vif.clk) 

            item.rst = vif.rst;

            item.i_bit = vif.i_bit;
 
//   #10;

            item.flag <= vif.flag;
  
  #1;
  
  `uvm_info("MONITOR", $sformatf(" received data rst = %0b in=%0b flag = %0b",item.rst, item.i_bit, item.flag), UVM_LOW);
  
 			 mon_port.write(item);


endtask

endclass




