class monitor extends uvm_monitor;
  
  `uvm_component_utils(monitor)
  
    uvm_analysis_port #(sequence_item) mon_port;
  
  	sequence_item item	;
  
  	virtual top vif_t	;
  
    function new(string name = "monitor", uvm_component parent);
    
    super.new(name, parent);
    
  	endfunction
  
  	function void build_phase(uvm_phase phase);

        super.build_phase(phase);
      
      	mon_port = new("mon_port", this);

      if(!(uvm_config_db #(virtual top):: get(null, "","vif_t",vif_t)))
            `uvm_error("driver","cannot get the vif from the config tb")

    endfunction
        
   task run_phase(uvm_phase phase);
      
        super.run_phase(phase);

        item =  sequence_item::type_id::create("item");
      
      forever begin

        mon(item);
        
        mon_port.write(item);
        
      end

    endtask

      task mon(sequence_item item);
        
       item.reset   =   vif_t.reset   ; 
        
       item.send  	=   vif_t.send  	;

       item.d_in    =   vif_t.d_in    ;

       item.p_sel   =   vif_t.p_sel   ; 

	   item.tx		=	vif_t.tx		; 

       item.rx		=	vif_t.rx		; 
        
       item.d_out	=	vif_t.d_out	;     

       item.p_error	=	vif_t.p_error	; 

       item.stop_error =vif_t.stop_error;

   endtask

   endclass
