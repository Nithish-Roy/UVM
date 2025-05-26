class test extends uvm_test;

    `uvm_component_utils(test)
  
  	event my_event;

    environment env;

    rst_seq rst_sequ    ;
  
  	norm_seq norm_sequ	;
  
  function new(string name = "test", uvm_component parent);

      super.new(name, parent);

    endfunction 

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        `uvm_info("TEST","INSIDE BUILDPHASE OF TEST",UVM_LOW)

      	env = environment::type_id::create("env",this);

    endfunction
  
    function void connect_phase(uvm_phase phase);

       super.connect_phase(phase);
      
    endfunction

    task run_phase(uvm_phase phase);

      super.run_phase(phase);
      
      `uvm_info("TEST","INSIDE RUNPHASE OF TEST",UVM_LOW)
  
        phase.raise_objection(this);

        rst_sequ = rst_seq::type_id::create("rst_sequ");
      
     	 rst_sequ.start(env.agnt.seqr);
      
    #10;
      
      
      repeat(200) begin 

          norm_sequ = norm_seq::type_id::create("norm_sequ");
        
		  this.my_event = env.scr.my_event;
        
          norm_sequ.start(env.agnt.seqr);
        	
        @(my_event);
        	
        end
      
      
      #10000000;

        phase.drop_objection(this);

endtask

endclass
