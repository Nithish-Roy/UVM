class test extends uvm_test;

    `uvm_component_utils(test)

    environment env;

    seq sequ   ;

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
        
        phase.raise_objection(this);

        sequ = seq::type_id::create("sequ");

      repeat(10) begin 

          sequ.start(env.agnt.seqr);

            #5;

        end

        phase.drop_objection(this);

endtask

endclass
