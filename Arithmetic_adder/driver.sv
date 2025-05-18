class driver extends uvm_driver #(sequence_item);

    `uvm_component_utils(driver)

      virtual adder vif   ;
  
    sequence_item item;


  function new (string name = "driver", uvm_component parent);

        super.new(name, parent);

    endfunction 

    function void build_phase (uvm_phase phase);

    super.build_phase(phase);

    `uvm_info("driver", " inside build_phase" , UVM_HIGH);

      if(!(uvm_config_db #(virtual adder)::get(this,"","vif",vif)))

        `uvm_error("driver", "CANNOT GET THE VIF")

    endfunction 


     function void connect_phase (uvm_phase phase);

     super.connect_phase(phase);

    `uvm_info("driver", " inside build_phase" , UVM_HIGH);

     endfunction 

     task run_phase(uvm_phase phase);

     item = sequence_item::type_id::create("item");
     
     super.run_phase(phase);

     forever begin

     seq_item_port.get_next_item(item);

     drive(item);

     seq_item_port.item_done();

     end

     endtask

     task drive(sequence_item item);

     @(posedge vif.clk)

     vif.rst <= item.rst;
     
     vif.data_1 <= item.data_1;
    
     vif.data_2 <= item.data_2;
       
//        @(posedge vif.clk)

//      item.out <= vif.out;
       
       `uvm_info("driver_task",$sformatf("rst= %d data_1 = %d data_2 = %d out = %d",item.rst, item.data_1, item.data_2, item.out),UVM_LOW);

     endtask

endclass
