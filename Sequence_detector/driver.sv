class driver extends uvm_driver #(sequence_item);

    `uvm_component_utils(driver)

    virtual seq_interface vif;

    function new(string name = "driver", uvm_component parent);

        super.new(name,parent);

    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

      if(!(uvm_config_db #(virtual seq_interface)::get(this, "", "vif", vif))) begin 

            `uvm_error("DRIVER", "cannot get the interface from config_db");

        end

    endfunction

task run_phase(uvm_phase phase);

    super.build_phase(phase);

    forever begin

        sequence_item item;

        seq_item_port.get_next_item(item);

        drive(item);

        seq_item_port.item_done;

    end

endtask

task drive(sequence_item item);

    @(posedge vif.clk)

    vif.i_bit <= item.i_bit;

    vif.rst <= item.rst;
  
    `uvm_info("DRIVE", $sformatf("in=%0b", item.i_bit), UVM_LOW);

endtask

endclass

