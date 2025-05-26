class environment extends uvm_env;

    `uvm_component_utils(environment)

    scoreboard scr      ;
    agent      agnt     ;

    function new(string name = "environment", uvm_component parent);
        
        super.new(name, parent);

    endfunction

    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        `uvm_info("environment", "in the build_phase", UVM_LOW)

        scr = scoreboard::type_id::create("scr", this);

        agnt = agent::type_id::create("agnt", this);

    endfunction

    function void connect_phase(uvm_phase phase);

        super.connect_phase(phase);

        `uvm_info("environment", "in the connect_phase", UVM_LOW)

        agnt.mon.mon_port.connect(scr.scr_port);

    endfunction

endclass
