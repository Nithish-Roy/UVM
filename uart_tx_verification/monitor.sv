class monitor extends uvm_monitor;

    `uvm_component_utils(monitor)

    uvm_analysis_port #(sequence_item) mon_port;

    virtual uart_tx vif;
  
  	virtual baud_ticker vif_b;
  
    sequence_item item;

    function new (string name = "monitor", uvm_component parent);

        super.new(name , parent);

    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

    mon_port = new("mon_port", this);

        if(!(uvm_config_db #(virtual uart_tx):: get(null, "","vif",vif)))
            `uvm_error("monitor","cannot get the vif from the config tb")
          
		if(!(uvm_config_db #(virtual baud_ticker):: get(null, "","vif_b",vif_b)))
            `uvm_error("driver","cannot get the vif from the config tb")

    endfunction

    task run_phase(uvm_phase phase);
      
        super.run_phase(phase);

        item =  sequence_item::type_id::create("item");
      
      forever begin
        
        @(posedge vif_b.baud_ticks)

        mon(item);
        
        mon_port.write(item);
        
      end

    endtask


      task mon(sequence_item item);
        
       item.rst     =   vif.rst     ; 

       item.tx_out  =   vif.tx_out  ;

       item.data    =   vif.data    ;

       item.start   =   vif.start   ;
        
        `uvm_info("monitor_task",$sformatf("rst = %b start = %b data = %0d  tx_out= %b", item.rst, item.start, item.data, item.tx_out), UVM_LOW);
        
 
   endtask

   endclass
