class test extends uvm_test;

  `uvm_component_utils(test)

    environment env;
  
  	 sequence_reset rst_seq;
  
  	 sequence_normal normal_seq;

    function new(string name ="test", uvm_component parent);

    super.new(name, parent);

    endfunction

    function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    env = environment::type_id::create("env", this);

    endfunction

    function void connect_phase(uvm_phase phase);

    super.build_phase(phase);

    endfunction

    task run_phase(uvm_phase phase);

    super.run_phase(phase);

    phase.raise_objection(this);

    rst_seq = sequence_reset::type_id::create("rst_seq");
      
    rst_seq.start(env.agnt.seqr);

    repeat(10) begin 

        normal_seq = sequence_normal::type_id::create("normal_seq");

        normal_seq.start(env.agnt.seqr);
      
      #5;

    end

        phase.drop_objection(this);

    endtask
    
endclass
