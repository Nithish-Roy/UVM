class driver extends uvm_driver #(sequence_item);

    `uvm_component_utils(driver)

    virtual uart_tx vif;
  
  virtual baud_ticker vif_b;

	sequence_item item;
  
  event scrtodrv	;
  
    function new(string name = "driver", uvm_component parent);

        super.new(name, parent);

    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        if(!(uvm_config_db #(virtual uart_tx):: get(null, "","vif",vif)))
            `uvm_error("driver","cannot get the vif from the config tb")

          if(!(uvm_config_db #(virtual baud_ticker):: get(null, "","vif_b",vif_b)))
            `uvm_error("driver","cannot get the vif from the config tb")

    endfunction


    task run_phase(uvm_phase phase);

        super.run_phase(phase);

        forever begin 

            seq_item_port.get_next_item(item);

            drive(item);
          
          	drive_tick(item);

            seq_item_port.item_done();

        end

      endtask
      
      task drive(sequence_item item);
        
            @(posedge vif.clk)

            vif.rst <= item.rst   ;

            vif.start <= item.start ;
    
            vif.data  <= item.data  ;
        
                `uvm_info("drive_task",$sformatf("rst = %b start = %b data = %0d ", item.rst, item.start, item.data), UVM_LOW);

            endtask

      
      task drive_tick(sequence_item item);
        
             @(posedge vif_b.clk)
        
        	vif_b.rst <= item.rst	; 
      
      endtask
      
     endclass

