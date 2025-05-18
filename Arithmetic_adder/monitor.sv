//monitor.sv
class monitor extends uvm_monitor;

    `uvm_component_utils(monitor)

    sequence_item item ;

    virtual adder vif;

    uvm_analysis_port #(sequence_item) mon_port;

    function new(string name = "monitor", uvm_component parent);

    super.new(name, parent);

    endfunction

    function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    `uvm_info("alu_monitor", "in build phase", UVM_HIGH);

    mon_port = new("mon_port", this);

    if(!(uvm_config_db #(virtual adder)::get(this,"","vif",vif)))

        `uvm_error("MONITOR", "CANNOT GET THE VIF")

    endfunction 

    function void connect_phase(uvm_phase phase);

    super.connect_phase(phase);

    endfunction

    task run_phase(uvm_phase phase);

    super.run_phase(phase);

    item = sequence_item::type_id::create("item");
      
      forever begin 

// 	repeat(3) @(posedge vif.clk)
        
    mon();
        
      end

    endtask

    task mon;
      
      @(posedge vif.clk)
      
//       #1;
      
      item.rst = vif.rst	;
      
    item.data_1 = vif.data_1  ;
                
     item.data_2 = vif.data_2  ;
      
      #10ps;
          
      item.out = vif.out;

	    mon_port.write(item);
      
      `uvm_info("monitor_task",$sformatf("rst= %d data_1 = %d data_2 = %d out = %d",item.rst, item.data_1, item.data_2, item.out),UVM_LOW);

      #10ps;

    endtask

    endclass
